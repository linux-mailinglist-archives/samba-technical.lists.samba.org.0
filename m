Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A2FB8B16526
	for <lists+samba-technical@lfdr.de>; Wed, 30 Jul 2025 19:05:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=q+rhlNBbb6+TZrfF7rqAYkf5i2qjCjlDHKxMlfXPuLM=; b=sL1hQ8BKcgUHsT1sIcdJxn6jOc
	/iJTWa7rBKmOQlsQrvcgjWYIXzbyR5b6BFaNSqAwo+Iw2dClvjSgAHzq/gCDh4fNb+SxngMcDNmv4
	2n4Db6eVnR4XAOIBMxNxNt1E7+b6oOhTkwhsWkP8MNJlYqnU3PfhTmR2zj6P8CD+Y6t0SQ74bM+9A
	GqGsE9PwPRShHDjJFDuP7HTNyVKzFcA0WI26JO60tps5GD92EKBf+mRtRwovo5pyr1kuoGWNi65iD
	OfLQnZVEl91LtklPXFHZiH8A1f/9S0deNvTvbv7KI3fPZJiTADDySjmAxB4md4iY7BK0enC7xOWx1
	NV+m06Zw==;
Received: from ip6-localhost ([::1]:50114 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uhAF8-00C2Xn-6U; Wed, 30 Jul 2025 17:05:30 +0000
Received: from air.basealt.ru ([193.43.8.18]:42736) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uhAF4-00C2Xg-2Y
 for samba-technical@lists.samba.org; Wed, 30 Jul 2025 17:05:28 +0000
Received: from lenovo-93812.smb.basealt.ru (unknown [193.43.9.250])
 (Authenticated sender: alekseevamo)
 by air.basealt.ru (Postfix) with ESMTPSA id 9CF2523372;
 Wed, 30 Jul 2025 20:05:18 +0300 (MSK)
To: smfrench@gmail.com
Subject: [PATCH v2] fs/smb/client/fs_context: Add dfs_domain_hostname option
 for CIFS module to work with domain-based dfs resources with Kerberos
 authentication
Date: Wed, 30 Jul 2025 21:03:48 +0400
Message-ID: <20250730170348.155781-1-alxvmr@altlinux.org>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <8f2ad82d-0dd4-4195-b414-59f25f859a9e@altlinux.org>
References: <8f2ad82d-0dd4-4195-b414-59f25f859a9e@altlinux.org>
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
 Maria Alexeeva <alxvmr@altlinux.org>, ivolchenko86@gmail.com,
 samba-technical@lists.samba.org, tom@talpey.com, vt@altlinux.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Paths to domain-based dfs resources are defined using the domain name
of the server in the format:
\DOMAIN.NAME>\<dfsroot>\<path>

The CIFS module, when requesting a TGS, uses the server name
(<DOMAIN.NAME>) it obtained from the UNC for the initial connection.
It then composes an SPN that does not match any entities
in the domain because it is the domain name itself.

To eliminate this behavior, a dfs_domain_hostname option is added, which is
the name of the server to connect to and is used in composing the SPN.
In the future this option will be used in the cifs-utils development.

Suggested-by: Ivan Volchenko <ivolchenko86@gmail.com>
Signed-off-by: Maria Alexeeva <alxvmr@altlinux.org>
---
 fs/smb/client/fs_context.c | 35 +++++++++++++++++++++++++++++------
 fs/smb/client/fs_context.h |  3 +++
 2 files changed, 32 insertions(+), 6 deletions(-)

diff --git a/fs/smb/client/fs_context.c b/fs/smb/client/fs_context.c
index 59ccc2229ab3..27df14ea2ced 100644
--- a/fs/smb/client/fs_context.c
+++ b/fs/smb/client/fs_context.c
@@ -177,6 +177,7 @@ const struct fs_parameter_spec smb3_fs_parameters[] = {
 	fsparam_string("password2", Opt_pass2),
 	fsparam_string("ip", Opt_ip),
 	fsparam_string("addr", Opt_ip),
+	fsparam_string("dfs_domain_hostname", Opt_dfs_domain_hostname),
 	fsparam_string("domain", Opt_domain),
 	fsparam_string("dom", Opt_domain),
 	fsparam_string("srcaddr", Opt_srcaddr),
@@ -825,16 +826,23 @@ static int smb3_fs_context_validate(struct fs_context *fc)
 		return -ENOENT;
 	}
 
+	if (ctx->got_dfs_domain_hostname) {
+		kfree(ctx->server_hostname);
+		ctx->server_hostname = ctx->dfs_domain_hostname;
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
+	case Opt_dfs_domain_hostname:
+		if (strnlen(param->string, CIFS_NI_MAXHOST) == CIFS_NI_MAXHOST) {
+			pr_warn("host name too long\n");
+			goto cifs_parse_mount_err;
+		}
+
+		kfree(ctx->dfs_domain_hostname);
+		ctx->dfs_domain_hostname = kstrdup(param->string, GFP_KERNEL);
+		if (ctx->dfs_domain_hostname == NULL) {
+			cifs_errorf(fc, "OOM when copying hostname string\n");
+			goto cifs_parse_mount_err;
+		}
+		cifs_dbg(FYI, "Host name set\n");
+		ctx->got_dfs_domain_hostname = true;
+		break;
 	case Opt_domain:
 		if (strnlen(param->string, CIFS_MAX_DOMAINNAME_LEN)
 				== CIFS_MAX_DOMAINNAME_LEN) {
diff --git a/fs/smb/client/fs_context.h b/fs/smb/client/fs_context.h
index 9e83302ce4b8..da6193cffd09 100644
--- a/fs/smb/client/fs_context.h
+++ b/fs/smb/client/fs_context.h
@@ -184,6 +184,7 @@ enum cifs_param {
 	Opt_pass,
 	Opt_pass2,
 	Opt_ip,
+	Opt_dfs_domain_hostname,
 	Opt_domain,
 	Opt_srcaddr,
 	Opt_iocharset,
@@ -214,6 +215,7 @@ struct smb3_fs_context {
 	bool gid_specified;
 	bool sloppy;
 	bool got_ip;
+	bool got_dfs_domain_hostname;
 	bool got_version;
 	bool got_rsize;
 	bool got_wsize;
@@ -226,6 +228,7 @@ struct smb3_fs_context {
 	char *domainname;
 	char *source;
 	char *server_hostname;
+	char *dfs_domain_hostname;
 	char *UNC;
 	char *nodename;
 	char workstation_name[CIFS_MAX_WORKSTATION_LEN];

base-commit: 038d61fd642278bab63ee8ef722c50d10ab01e8f
-- 
2.50.1


