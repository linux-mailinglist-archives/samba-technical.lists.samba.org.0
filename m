Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 33DE82DDAA8
	for <lists+samba-technical@lfdr.de>; Thu, 17 Dec 2020 22:15:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=YmPKlh6Z7zQjy5YM3miO0QALbeMXWiJWpI/BK+viLiI=; b=I5K6/wRiE/7DrLVBmLIy4ttWai
	BBkX27yKN4xFC1BcmAJ7xeLBW5NJK2Ffkupql4zFW3az11PVoD6yF7BH/rBUol+Tzaupr5DIlusev
	s4e0hTaAYWYeZouNvcUtyobG4YqXx+9jX2EOCFE9qvsb62g3wGQD+4jCQ2wSR2P9QiuG+FgxzGMp+
	6JU4oj7F0RecC0axmiU/akXrzEqMvc8Yjjynj6z0zHFjSl5a0w3SsW5Wdo0yt4fbMxhbf74u9bzO7
	/lGM4rjkKCz5dEWgJQimzc49v7eIXMaQvawKey/++s7OJAujJqOqD2umlWXhdiMs24O6Zh6VfVQQ3
	I3B0lEqA==;
Received: from ip6-localhost ([::1]:58042 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kq0bN-001tvP-Ej; Thu, 17 Dec 2020 21:14:21 +0000
Received: from smtp-fw-33001.amazon.com ([207.171.190.10]:13220) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1kq0bG-001tvH-PE
 for samba-technical@lists.samba.org; Thu, 17 Dec 2020 21:14:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1608239656; x=1639775656;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=YmPKlh6Z7zQjy5YM3miO0QALbeMXWiJWpI/BK+viLiI=;
 b=D7VQpFvVdQWrCxwfpaUi6YcrasQ6gSG21qxpoPJj5KPSL/SemX8fmB2t
 TDmMis2lEoEDs8RK1PNwPIexhugrpNQy3yM5NHu8RbwVwmpT/9csUUEoz
 YUW1fje0UA/GepE9OmGefCXCcVshzKzZUqiAKbfcImlzi4Op8U7oSZ4gc c=;
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-1a-e34f1ddc.us-east-1.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-33001.sea14.amazon.com with ESMTP;
 17 Dec 2020 20:58:16 +0000
Received: from EX13MTAUWB001.ant.amazon.com
 (iad12-ws-svc-p26-lb9-vlan2.iad.amazon.com [10.40.163.34])
 by email-inbound-relay-1a-e34f1ddc.us-east-1.amazon.com (Postfix) with ESMTPS
 id 89702A1DA7; Thu, 17 Dec 2020 20:58:14 +0000 (UTC)
Received: from EX13D01UWB004.ant.amazon.com (10.43.161.157) by
 EX13MTAUWB001.ant.amazon.com (10.43.161.207) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Thu, 17 Dec 2020 20:58:13 +0000
Received: from EX13MTAUWB001.ant.amazon.com (10.43.161.207) by
 EX13d01UWB004.ant.amazon.com (10.43.161.157) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Thu, 17 Dec 2020 20:58:13 +0000
Received: from dev-dsk-pboris-1f-f9682a47.us-east-1.amazon.com (10.1.57.236)
 by mail-relay.amazon.com (10.43.161.249) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Thu, 17 Dec 2020 20:58:13 +0000
Received: by dev-dsk-pboris-1f-f9682a47.us-east-1.amazon.com (Postfix,
 from userid 5360108)
 id 4C8C3A8C36; Thu, 17 Dec 2020 20:58:12 +0000 (UTC)
To: <pboris@amazon.com>
Subject: [PATCH 2/2] Add SMB 2 support for getting and setting SACLs
Date: Thu, 17 Dec 2020 20:58:08 +0000
Message-ID: <20201217205808.14756-1-pboris@amazon.com>
X-Mailer: git-send-email 2.15.3.AMZN
In-Reply-To: <20201027204226.26906-1-pboris@amazon.com>
References: <20201027204226.26906-1-pboris@amazon.com>
MIME-Version: 1.0
Content-Type: text/plain
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
From: Boris Protopopov via samba-technical <samba-technical@lists.samba.org>
Reply-To: Boris Protopopov <pboris@amazon.com>
Cc: sfrench@samba.org, linux-cifs@vger.kernel.org, samjonas@amazon.com,
 samba-technical@lists.samba.org, linux-kernel@vger.kernel.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Fix passing of the additional security info via version
operations. Force new open when getting SACL and avoid
reuse of files that were previously open without
sufficient privileges to access SACLs.

Signed-off-by: Boris Protopopov <pboris@amazon.com>
---

After further testing, I found that the security info was not being
passed correctly to opts->get_acl and opts->get_acl_by_fid(). Also,
it turned out that files open for read were being used to fetch
SACL without proper privileges. This patch fixes these issues, and
is meant to be squashed (comments dropped) with the earlier patch.

fs/cifs/cifsacl.c | 10 +++++-----
 fs/cifs/smb2ops.c |  4 ++--
 fs/cifs/smb2pdu.c |  4 +++-
 fs/cifs/xattr.c   | 10 ++++------
 4 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/fs/cifs/cifsacl.c b/fs/cifs/cifsacl.c
index 353394d9ada8..6baa121952ce 100644
--- a/fs/cifs/cifsacl.c
+++ b/fs/cifs/cifsacl.c
@@ -1245,7 +1245,7 @@ cifs_acl_to_fattr(struct cifs_sb_info *cifs_sb, struct cifs_fattr *fattr,
 	int rc = 0;
 	struct tcon_link *tlink = cifs_sb_tlink(cifs_sb);
 	struct smb_version_operations *ops;
-	const u32 unused = 0;
+	const u32 info = 0;
 
 	cifs_dbg(NOISY, "converting ACL to mode for %s\n", path);
 
@@ -1255,9 +1255,9 @@ cifs_acl_to_fattr(struct cifs_sb_info *cifs_sb, struct cifs_fattr *fattr,
 	ops = tlink_tcon(tlink)->ses->server->ops;
 
 	if (pfid && (ops->get_acl_by_fid))
-		pntsd = ops->get_acl_by_fid(cifs_sb, pfid, &acllen, unused);
+		pntsd = ops->get_acl_by_fid(cifs_sb, pfid, &acllen, info);
 	else if (ops->get_acl)
-		pntsd = ops->get_acl(cifs_sb, inode, path, &acllen, unused);
+		pntsd = ops->get_acl(cifs_sb, inode, path, &acllen, info);
 	else {
 		cifs_put_tlink(tlink);
 		return -EOPNOTSUPP;
@@ -1295,7 +1295,7 @@ id_mode_to_cifs_acl(struct inode *inode, const char *path, __u64 nmode,
 	struct tcon_link *tlink = cifs_sb_tlink(cifs_sb);
 	struct smb_version_operations *ops;
 	bool mode_from_sid, id_from_sid;
-	const u32 unused = 0;
+	const u32 info = 0;
 
 	if (IS_ERR(tlink))
 		return PTR_ERR(tlink);
@@ -1311,7 +1311,7 @@ id_mode_to_cifs_acl(struct inode *inode, const char *path, __u64 nmode,
 		return -EOPNOTSUPP;
 	}
 
-	pntsd = ops->get_acl(cifs_sb, inode, path, &secdesclen, unused);
+	pntsd = ops->get_acl(cifs_sb, inode, path, &secdesclen, info);
 	if (IS_ERR(pntsd)) {
 		rc = PTR_ERR(pntsd);
 		cifs_dbg(VFS, "%s: error %d getting sec desc\n", __func__, rc);
diff --git a/fs/cifs/smb2ops.c b/fs/cifs/smb2ops.c
index d28a29728fb1..f5e198860c16 100644
--- a/fs/cifs/smb2ops.c
+++ b/fs/cifs/smb2ops.c
@@ -3315,9 +3315,9 @@ get_smb2_acl(struct cifs_sb_info *cifs_sb,
 	struct cifs_ntsd *pntsd = NULL;
 	struct cifsFileInfo *open_file = NULL;
 
-	if (inode)
+	if (inode && !(info & SACL_SECINFO))
 		open_file = find_readable_file(CIFS_I(inode), true);
-	if (!open_file)
+	if (!open_file || (info & SACL_SECINFO))
 		return get_smb2_acl_by_path(cifs_sb, path, pacllen, info);
 
 	pntsd = get_smb2_acl_by_fid(cifs_sb, &open_file->fid, pacllen, info);
diff --git a/fs/cifs/smb2pdu.c b/fs/cifs/smb2pdu.c
index 0aeb63694306..b207e1eb6803 100644
--- a/fs/cifs/smb2pdu.c
+++ b/fs/cifs/smb2pdu.c
@@ -3472,8 +3472,10 @@ SMB311_posix_query_info(const unsigned int xid, struct cifs_tcon *tcon,
 int
 SMB2_query_acl(const unsigned int xid, struct cifs_tcon *tcon,
 	       u64 persistent_fid, u64 volatile_fid,
-	       void **data, u32 *plen, u32 additional_info)
+	       void **data, u32 *plen, u32 extra_info)
 {
+	__u32 additional_info = OWNER_SECINFO | GROUP_SECINFO | DACL_SECINFO |
+				extra_info;
 	*plen = 0;
 
 	return query_info(xid, tcon, persistent_fid, volatile_fid,
diff --git a/fs/cifs/xattr.c b/fs/cifs/xattr.c
index 9318a2acf4ee..6b658a1172ef 100644
--- a/fs/cifs/xattr.c
+++ b/fs/cifs/xattr.c
@@ -340,21 +340,19 @@ static int cifs_xattr_get(const struct xattr_handler *handler,
 		 * fetch owner, DACL, and SACL if asked for full descriptor,
 		 * fetch owner and DACL otherwise
 		 */
-		u32 acllen, additional_info = 0;
+		u32 acllen, extra_info;
 		struct cifs_ntsd *pacl;
 
 		if (pTcon->ses->server->ops->get_acl == NULL)
 			goto out; /* rc already EOPNOTSUPP */
 
 		if (handler->flags == XATTR_CIFS_NTSD_FULL) {
-			additional_info = OWNER_SECINFO | GROUP_SECINFO |
-				DACL_SECINFO | SACL_SECINFO;
+			extra_info = SACL_SECINFO;
 		} else {
-			additional_info = OWNER_SECINFO | GROUP_SECINFO |
-				DACL_SECINFO;
+			extra_info = 0;
 		}
 		pacl = pTcon->ses->server->ops->get_acl(cifs_sb,
-				inode, full_path, &acllen, additional_info);
+				inode, full_path, &acllen, extra_info);
 		if (IS_ERR(pacl)) {
 			rc = PTR_ERR(pacl);
 			cifs_dbg(VFS, "%s: error %zd getting sec desc\n",
-- 
2.18.4


