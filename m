Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CFAECEA427
	for <lists+samba-technical@lfdr.de>; Tue, 30 Dec 2025 18:05:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=DVTiGhs0f7Uqez7J15i5TfLZtWOJ66UsbKd91fnybcY=; b=bWtdAPDCJVcfEmvDGTXrSZVaNB
	kvzx1VRxjjbQa9mHJJx29Q8I9zwWz66oN22TtOPZSLPFhzyMcy4DMJ/3rrNzMBJH7obHBhPWezzVk
	+JXQD0YL9Q2hMqhcjPsv5Gj/Jg3UnYt4Yc5DCyYiGKzAf5jd2jaiPfGqgDvfIImGmNYmf+h4ilQ3w
	YQOztJbPkXEqhwTdGPS5/dfwxuCGQPBgJXA5MUOCZA2jsZYqo4S8dSUXb2fNPyV29s0nDTsBDlOWK
	2di/k0UlEqG9kxAUuZqprG+D679fuqpeuQyxCW8iJbudXKV3gM9j53/OiClaAxSESiK7QRmgj7KKa
	xBg7nY0w==;
Received: from ip6-localhost ([::1]:48796 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vad9n-00H0SP-80; Tue, 30 Dec 2025 17:05:15 +0000
Received: from air.basealt.ru ([193.43.8.18]:58588) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vad9d-00H0Ri-Ed
 for samba-technical@lists.samba.org; Tue, 30 Dec 2025 17:05:07 +0000
Received: from lenovo-93812.smb.basealt.ru (unknown [193.43.11.202])
 (Authenticated sender: alekseevamo)
 by air.basealt.ru (Postfix) with ESMTPSA id A77B323377;
 Tue, 30 Dec 2025 19:48:49 +0300 (MSK)
To: smfrench@gmail.com
Subject: [PATCH v3 1/1] fs/smb/client/fs_context: Add hostname option for CIFS
 module to work with domain-based dfs resources with Kerberos authentication
Date: Tue, 30 Dec 2025 20:47:59 +0400
Message-ID: <20251230164759.259346-2-alxvmr@altlinux.org>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251230164759.259346-1-alxvmr@altlinux.org>
References: <CAH2r5mvDa8E8NKNHevoWYARY_52DJ+WQX3oetYw-pwysMyAKYQ@mail.gmail.com>
 <20251230164759.259346-1-alxvmr@altlinux.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: samba-technical@lists.samba.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "Discussions on Samba internals. For general questions please
 subscribe to the list samba@lists.samba.org"
 <samba-technical.lists.samba.org>
List-Unsubscribe: <https://lists.samba.org/mailman/options/samba-technical>,
 <mailto:samba-technical-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/samba-technical/>
List-Post: <mailto:samba-technical@lists.samba.org>
List-Help: <mailto:samba-technical-request@lists.samba.org?subject=help>
List-Subscribe: <https://lists.samba.org/mailman/listinfo/samba-technical>,
 <mailto:samba-technical-request@lists.samba.org?subject=subscribe>
From: Maria Alexeeva via samba-technical <samba-technical@lists.samba.org>
Reply-To: Maria Alexeeva <alxvmr@altlinux.org>
Cc: pc@manguebit.com, linux-cifs@vger.kernel.org,
 Maria Alexeeva <alxvmr@altlinux.org>, Ivan Volchenko <ivolchenko86@gmail.com>,
 samba-technical@lists.samba.org, tom@talpey.com, vt@altlinux.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Paths to domain-based dfs resources are defined using the domain name
of the server in the format:
\\<DOMAIN.NAME>\<dfsroot>\<path>

The CIFS module, when requesting a TGS, uses the server name
(<DOMAIN.NAME>) it obtained from the UNC for the initial connection.
It then composes an SPN that does not match any entities
in the domain because it is the domain name itself.

To eliminate this behavior, a hostname option is added, which is
the name of the server to connect to and is used in composing the SPN.
In the future this option will be used in the cifs-utils development.

Suggested-by: Ivan Volchenko <ivolchenko86@gmail.com>
Signed-off-by: Maria Alexeeva <alxvmr@altlinux.org>
---
 fs/smb/client/fs_context.c | 35 +++++++++++++++++++++++++++++------
 fs/smb/client/fs_context.h |  3 +++
 2 files changed, 32 insertions(+), 6 deletions(-)

diff --git a/fs/smb/client/fs_context.c b/fs/smb/client/fs_context.c
index d4291d3a9a48..f0d1895fe4bb 100644
--- a/fs/smb/client/fs_context.c
+++ b/fs/smb/client/fs_context.c
@@ -177,6 +177,7 @@ const struct fs_parameter_spec smb3_fs_parameters[] = {
 	fsparam_string("password2", Opt_pass2),
 	fsparam_string("ip", Opt_ip),
 	fsparam_string("addr", Opt_ip),
+	fsparam_string("hostname", Opt_hostname),
 	fsparam_string("domain", Opt_domain),
 	fsparam_string("dom", Opt_domain),
 	fsparam_string("srcaddr", Opt_srcaddr),
@@ -866,16 +867,23 @@ static int smb3_fs_context_validate(struct fs_context *fc)
 		return -ENOENT;
 	}
 
+	if (ctx->got_opt_hostname) {
+		kfree(ctx->server_hostname);
+		ctx->server_hostname = ctx->opt_hostname;
+		pr_notice("changing server hostname to name provided in hostname= option\n");
+	}
+
 	if (!ctx->got_ip) {
 		int len;
-		const char *slash;
 
-		/* No ip= option specified? Try to get it from UNC */
-		/* Use the address part of the UNC. */
-		slash = strchr(&ctx->UNC[2], '\\');
-		len = slash - &ctx->UNC[2];
+		/*
+		 * No ip= option specified? Try to get it from server_hostname
+		 * Use the address part of the UNC parsed into server_hostname
+		 * or hostname= option if specified.
+		 */
+		len = strlen(ctx->server_hostname);
 		if (!cifs_convert_address((struct sockaddr *)&ctx->dstaddr,
-					  &ctx->UNC[2], len)) {
+					  ctx->server_hostname, len)) {
 			pr_err("Unable to determine destination address\n");
 			return -EHOSTUNREACH;
 		}
@@ -1591,6 +1599,21 @@ static int smb3_fs_context_parse_param(struct fs_context *fc,
 		}
 		ctx->got_ip = true;
 		break;
+	case Opt_hostname:
+		if (strnlen(param->string, CIFS_NI_MAXHOST) == CIFS_NI_MAXHOST) {
+			pr_warn("host name too long\n");
+			goto cifs_parse_mount_err;
+		}
+
+		kfree(ctx->opt_hostname);
+		ctx->opt_hostname = kstrdup(param->string, GFP_KERNEL);
+		if (ctx->opt_hostname == NULL) {
+			cifs_errorf(fc, "OOM when copying hostname string\n");
+			goto cifs_parse_mount_err;
+		}
+		cifs_dbg(FYI, "Host name set\n");
+		ctx->got_opt_hostname = true;
+		break;
 	case Opt_domain:
 		if (strnlen(param->string, CIFS_MAX_DOMAINNAME_LEN)
 				== CIFS_MAX_DOMAINNAME_LEN) {
diff --git a/fs/smb/client/fs_context.h b/fs/smb/client/fs_context.h
index 7af7cbbe4208..ff1a04661ef5 100644
--- a/fs/smb/client/fs_context.h
+++ b/fs/smb/client/fs_context.h
@@ -184,6 +184,7 @@ enum cifs_param {
 	Opt_pass,
 	Opt_pass2,
 	Opt_ip,
+	Opt_hostname,
 	Opt_domain,
 	Opt_srcaddr,
 	Opt_iocharset,
@@ -214,6 +215,7 @@ struct smb3_fs_context {
 	bool gid_specified;
 	bool sloppy;
 	bool got_ip;
+	bool got_opt_hostname;
 	bool got_version;
 	bool got_rsize;
 	bool got_wsize;
@@ -226,6 +228,7 @@ struct smb3_fs_context {
 	char *domainname;
 	char *source;
 	char *server_hostname;
+	char *opt_hostname;
 	char *UNC;
 	char *nodename;
 	char workstation_name[CIFS_MAX_WORKSTATION_LEN];
-- 
2.50.1


