Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id EC57DABA016
	for <lists+samba-technical@lfdr.de>; Fri, 16 May 2025 17:40:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=uOXM4wYepKWr6GAzN+NcWyHrI8bcHR4h9mv3PnT9ByU=; b=YaN2lFY8moa4bJ+kL6QRBSTx03
	4UywBUQ2xvkYuaDRYoFIHtKjaUYEAWRGphMI+H7gFYnGYFZMamg4EZyGRKUofQ/QK9UB5mi4djtPy
	kOUzRCEu79yLDl4bKCL2Aaz8rsezlCmVoWZ3KFNSlFJGYDpNkTmhR+dOKpxp0QbMVRC6o3FX2fZMC
	94o12DexxBgkWtzuIMJycVluQVFohqT0ysdMe13hi+NzxbG4Fi2X7fuSZwuIUyI8txRrz74yJcxzI
	LwU3ZMz7O84HRSWYiYRU0v7/rc20xCes4CAqsjfyWFBP9Lg/o39nEOrYKHCz7c4LuHHkvh30JjyQi
	/PMR85Mw==;
Received: from ip6-localhost ([::1]:64994 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uFxAT-003gaQ-AS; Fri, 16 May 2025 15:40:13 +0000
Received: from air.basealt.ru ([193.43.8.18]:59302) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uFxAL-003gaH-G6
 for samba-technical@lists.samba.org; Fri, 16 May 2025 15:40:07 +0000
Received: from lenovo-93812.smb.basealt.ru (unknown [193.43.9.250])
 (Authenticated sender: alekseevamo)
 by air.basealt.ru (Postfix) with ESMTPSA id 3CDF22337B;
 Fri, 16 May 2025 18:22:32 +0300 (MSK)
To: linux-cifs@vger.kernel.org, samba-technical@lists.samba.org,
 sfrench@samba.org, pc@manguebit.com
Subject: [PATCH] fs/smb/client/fs_context: Add hostname option for CIFS module
 to work with domain-based dfs resources with Kerberos authentication
Date: Fri, 16 May 2025 19:22:01 +0400
Message-ID: <20250516152201.201385-1-alxvmr@altlinux.org>
X-Mailer: git-send-email 2.42.2
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
Cc: Ivan Volchenko <ivolchenko86@gmail.com>,
 Maria Alexeeva <alxvmr@altlinux.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Paths to domain-based dfs resources are defined using the domain name
of the server in the format:
\\DOMAIN.NAME>\<dfsroot>\<path>

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
index a634a34d4086..74de0a9de664 100644
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
@@ -825,16 +826,23 @@ static int smb3_fs_context_validate(struct fs_context *fc)
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
@@ -1518,6 +1526,21 @@ static int smb3_fs_context_parse_param(struct fs_context *fc,
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
index 9e83302ce4b8..cf0478b1eff9 100644
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

base-commit: bec6f00f120ea68ba584def5b7416287e7dd29a7
-- 
2.42.2


