Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B968829CAD8
	for <lists+samba-technical@lfdr.de>; Tue, 27 Oct 2020 22:00:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=VyeIaSuRb/7QSl3tWl/TQF0zRDE9jnn8MboPAgePdxU=; b=YCnBZDZQpGg9eJUMsR404iB12t
	ymedeqpfnMZD31HGz/5xeUslfBSVlxxTFELyo2LL/0tmWI5wDPz5Z2GDEC/Fx+FVmfAtxkBA0C7U1
	ITNgqxlWC6wsxEE7e8kK8OS3zerUYvrJqgTcvCbTm3+hVtH5/K008xKdNPzmL+OrMtjL+I+qzbzY1
	RQ8KAbWkLlrRGEn6l7maoJcZeZC9g4oAR+EvthbwCz9ppeNzBnn1wLva4+V/uiuOjdoI9S95Fz+Kc
	xkmdXxYDioAOezu+iFZzNKlpcyON3IORhrX98FshhmBdUy1DWdLT4i5VzDp8mtl+eQIoLG077V61m
	1/zN5lhQ==;
Received: from ip6-localhost ([::1]:31338 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kXW4N-00Dxmp-8Z; Tue, 27 Oct 2020 20:59:51 +0000
Received: from smtp-fw-6002.amazon.com ([52.95.49.90]:32222) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1kXW4G-00Dxmi-PC
 for samba-technical@lists.samba.org; Tue, 27 Oct 2020 20:59:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1603832386; x=1635368386;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=VyeIaSuRb/7QSl3tWl/TQF0zRDE9jnn8MboPAgePdxU=;
 b=ehEGTiRkl/kHCeaL/+WQk0agoAnFIgL+9mrzPkoLN1tg9F16HYHMiH2u
 CH6IY/kvEORndqOT8RrGAoxdMFNlVqRhp46rXSKb1ProQ9AuA2s/B4cHX
 p3hIGrNQEdKvt7MmXR0tAczUSd0ALinyVId/GWk/UeWZXnrGdTYA3inZj 0=;
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-2a-6e2fc477.us-west-2.amazon.com) ([10.43.8.6])
 by smtp-border-fw-out-6002.iad6.amazon.com with ESMTP;
 27 Oct 2020 20:43:45 +0000
Received: from EX13MTAUEE002.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2a-6e2fc477.us-west-2.amazon.com (Postfix) with ESMTPS
 id 216EBA2291; Tue, 27 Oct 2020 20:43:44 +0000 (UTC)
Received: from EX13D11UEE003.ant.amazon.com (10.43.62.248) by
 EX13MTAUEE002.ant.amazon.com (10.43.62.24) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Tue, 27 Oct 2020 20:43:42 +0000
Received: from EX13MTAUEA002.ant.amazon.com (10.43.61.77) by
 EX13D11UEE003.ant.amazon.com (10.43.62.248) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Tue, 27 Oct 2020 20:43:42 +0000
Received: from dev-dsk-pboris-1f-f9682a47.us-east-1.amazon.com (10.1.57.236)
 by mail-relay.amazon.com (10.43.61.169) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Tue, 27 Oct 2020 20:43:42 +0000
Received: by dev-dsk-pboris-1f-f9682a47.us-east-1.amazon.com (Postfix,
 from userid 5360108)
 id 21385A4821; Tue, 27 Oct 2020 20:43:42 +0000 (UTC)
To: <pboris@amazon.com>
Subject: [PATCH] Add support for getting and setting SACLs
Date: Tue, 27 Oct 2020 20:42:26 +0000
Message-ID: <20201027204226.26906-1-pboris@amazon.com>
X-Mailer: git-send-email 2.15.3.AMZN
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
Cc: sfrench@samba.org, linux-cifs@vger.kernel.org,
 samba-technical@lists.samba.org, linux-kernel@vger.kernel.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Add SYSTEM_SECURITY access flag and use with smb2 when opening
files for getting/setting SACLs. Add "system.cifs_ntsd_full"
extended attribute to allow user-space access to the functionality.
Avoid multiple server calls when setting owner, DACL, and SACL.

Signed-off-by: Boris Protopopov <pboris@amazon.com>
---
 fs/cifs/cifsacl.c   | 15 ++++----
 fs/cifs/cifsglob.h  |  4 +--
 fs/cifs/cifspdu.h   |  2 ++
 fs/cifs/cifsproto.h |  4 +--
 fs/cifs/smb2ops.c   | 31 ++++++++++-------
 fs/cifs/smb2pdu.c   |  5 ++-
 fs/cifs/smb2proto.h |  4 +--
 fs/cifs/xattr.c     | 83 +++++++++++++++++++++++++++++++++------------
 8 files changed, 100 insertions(+), 48 deletions(-)

diff --git a/fs/cifs/cifsacl.c b/fs/cifs/cifsacl.c
index 23b21e943652..353394d9ada8 100644
--- a/fs/cifs/cifsacl.c
+++ b/fs/cifs/cifsacl.c
@@ -1101,7 +1101,8 @@ static int build_sec_desc(struct cifs_ntsd *pntsd, struct cifs_ntsd *pnntsd,
 }
 
 struct cifs_ntsd *get_cifs_acl_by_fid(struct cifs_sb_info *cifs_sb,
-		const struct cifs_fid *cifsfid, u32 *pacllen)
+				      const struct cifs_fid *cifsfid, u32 *pacllen,
+				      u32 unused __attribute__((unused)))
 {
 	struct cifs_ntsd *pntsd = NULL;
 	unsigned int xid;
@@ -1169,7 +1170,7 @@ static struct cifs_ntsd *get_cifs_acl_by_path(struct cifs_sb_info *cifs_sb,
 /* Retrieve an ACL from the server */
 struct cifs_ntsd *get_cifs_acl(struct cifs_sb_info *cifs_sb,
 				      struct inode *inode, const char *path,
-				      u32 *pacllen)
+			       u32 *pacllen, u32 unused)
 {
 	struct cifs_ntsd *pntsd = NULL;
 	struct cifsFileInfo *open_file = NULL;
@@ -1179,7 +1180,7 @@ struct cifs_ntsd *get_cifs_acl(struct cifs_sb_info *cifs_sb,
 	if (!open_file)
 		return get_cifs_acl_by_path(cifs_sb, path, pacllen);
 
-	pntsd = get_cifs_acl_by_fid(cifs_sb, &open_file->fid, pacllen);
+	pntsd = get_cifs_acl_by_fid(cifs_sb, &open_file->fid, pacllen, unused);
 	cifsFileInfo_put(open_file);
 	return pntsd;
 }
@@ -1244,6 +1245,7 @@ cifs_acl_to_fattr(struct cifs_sb_info *cifs_sb, struct cifs_fattr *fattr,
 	int rc = 0;
 	struct tcon_link *tlink = cifs_sb_tlink(cifs_sb);
 	struct smb_version_operations *ops;
+	const u32 unused = 0;
 
 	cifs_dbg(NOISY, "converting ACL to mode for %s\n", path);
 
@@ -1253,9 +1255,9 @@ cifs_acl_to_fattr(struct cifs_sb_info *cifs_sb, struct cifs_fattr *fattr,
 	ops = tlink_tcon(tlink)->ses->server->ops;
 
 	if (pfid && (ops->get_acl_by_fid))
-		pntsd = ops->get_acl_by_fid(cifs_sb, pfid, &acllen);
+		pntsd = ops->get_acl_by_fid(cifs_sb, pfid, &acllen, unused);
 	else if (ops->get_acl)
-		pntsd = ops->get_acl(cifs_sb, inode, path, &acllen);
+		pntsd = ops->get_acl(cifs_sb, inode, path, &acllen, unused);
 	else {
 		cifs_put_tlink(tlink);
 		return -EOPNOTSUPP;
@@ -1293,6 +1295,7 @@ id_mode_to_cifs_acl(struct inode *inode, const char *path, __u64 nmode,
 	struct tcon_link *tlink = cifs_sb_tlink(cifs_sb);
 	struct smb_version_operations *ops;
 	bool mode_from_sid, id_from_sid;
+	const u32 unused = 0;
 
 	if (IS_ERR(tlink))
 		return PTR_ERR(tlink);
@@ -1308,7 +1311,7 @@ id_mode_to_cifs_acl(struct inode *inode, const char *path, __u64 nmode,
 		return -EOPNOTSUPP;
 	}
 
-	pntsd = ops->get_acl(cifs_sb, inode, path, &secdesclen);
+	pntsd = ops->get_acl(cifs_sb, inode, path, &secdesclen, unused);
 	if (IS_ERR(pntsd)) {
 		rc = PTR_ERR(pntsd);
 		cifs_dbg(VFS, "%s: error %d getting sec desc\n", __func__, rc);
diff --git a/fs/cifs/cifsglob.h b/fs/cifs/cifsglob.h
index 484ec2d8c5c9..203623b023b4 100644
--- a/fs/cifs/cifsglob.h
+++ b/fs/cifs/cifsglob.h
@@ -456,9 +456,9 @@ struct smb_version_operations {
 			const char *, const void *, const __u16,
 			const struct nls_table *, struct cifs_sb_info *);
 	struct cifs_ntsd * (*get_acl)(struct cifs_sb_info *, struct inode *,
-			const char *, u32 *);
+			const char *, u32 *, u32);
 	struct cifs_ntsd * (*get_acl_by_fid)(struct cifs_sb_info *,
-			const struct cifs_fid *, u32 *);
+			const struct cifs_fid *, u32 *, u32);
 	int (*set_acl)(struct cifs_ntsd *, __u32, struct inode *, const char *,
 			int);
 	/* writepages retry size */
diff --git a/fs/cifs/cifspdu.h b/fs/cifs/cifspdu.h
index 593d826820c3..7d5502ed2220 100644
--- a/fs/cifs/cifspdu.h
+++ b/fs/cifs/cifspdu.h
@@ -240,6 +240,8 @@
 #define SYNCHRONIZE           0x00100000  /* The file handle can waited on to */
 					  /* synchronize with the completion  */
 					  /* of an input/output request       */
+#define SYSTEM_SECURITY       0x01000000  /* The system access control list   */
+					  /* can be read and changed          */
 #define GENERIC_ALL           0x10000000
 #define GENERIC_EXECUTE       0x20000000
 #define GENERIC_WRITE         0x40000000
diff --git a/fs/cifs/cifsproto.h b/fs/cifs/cifsproto.h
index 24c6f36177ba..8e43628b4dd7 100644
--- a/fs/cifs/cifsproto.h
+++ b/fs/cifs/cifsproto.h
@@ -218,9 +218,9 @@ extern int cifs_acl_to_fattr(struct cifs_sb_info *cifs_sb,
 extern int id_mode_to_cifs_acl(struct inode *inode, const char *path, __u64,
 					kuid_t, kgid_t);
 extern struct cifs_ntsd *get_cifs_acl(struct cifs_sb_info *, struct inode *,
-					const char *, u32 *);
+				      const char *, u32 *, u32);
 extern struct cifs_ntsd *get_cifs_acl_by_fid(struct cifs_sb_info *,
-						const struct cifs_fid *, u32 *);
+				const struct cifs_fid *, u32 *, u32);
 extern int set_cifs_acl(struct cifs_ntsd *, __u32, struct inode *,
 				const char *, int);
 extern unsigned int setup_authusers_ACE(struct cifs_ace *pace);
diff --git a/fs/cifs/smb2ops.c b/fs/cifs/smb2ops.c
index 504766cb6c19..96965c97e141 100644
--- a/fs/cifs/smb2ops.c
+++ b/fs/cifs/smb2ops.c
@@ -3163,7 +3163,7 @@ smb2_query_reparse_tag(const unsigned int xid, struct cifs_tcon *tcon,
 
 static struct cifs_ntsd *
 get_smb2_acl_by_fid(struct cifs_sb_info *cifs_sb,
-		const struct cifs_fid *cifsfid, u32 *pacllen)
+		    const struct cifs_fid *cifsfid, u32 *pacllen, u32 info)
 {
 	struct cifs_ntsd *pntsd = NULL;
 	unsigned int xid;
@@ -3177,7 +3177,8 @@ get_smb2_acl_by_fid(struct cifs_sb_info *cifs_sb,
 	cifs_dbg(FYI, "trying to get acl\n");
 
 	rc = SMB2_query_acl(xid, tlink_tcon(tlink), cifsfid->persistent_fid,
-			    cifsfid->volatile_fid, (void **)&pntsd, pacllen);
+			    cifsfid->volatile_fid, (void **)&pntsd, pacllen,
+			    info);
 	free_xid(xid);
 
 	cifs_put_tlink(tlink);
@@ -3191,7 +3192,7 @@ get_smb2_acl_by_fid(struct cifs_sb_info *cifs_sb,
 
 static struct cifs_ntsd *
 get_smb2_acl_by_path(struct cifs_sb_info *cifs_sb,
-		const char *path, u32 *pacllen)
+		     const char *path, u32 *pacllen, u32 info)
 {
 	struct cifs_ntsd *pntsd = NULL;
 	u8 oplock = SMB2_OPLOCK_LEVEL_NONE;
@@ -3229,12 +3230,16 @@ get_smb2_acl_by_path(struct cifs_sb_info *cifs_sb,
 	oparms.fid = &fid;
 	oparms.reconnect = false;
 
+	if (info & SACL_SECINFO)
+		oparms.desired_access |= SYSTEM_SECURITY;
+
 	rc = SMB2_open(xid, &oparms, utf16_path, &oplock, NULL, NULL, NULL,
 		       NULL);
 	kfree(utf16_path);
 	if (!rc) {
 		rc = SMB2_query_acl(xid, tlink_tcon(tlink), fid.persistent_fid,
-			    fid.volatile_fid, (void **)&pntsd, pacllen);
+				    fid.volatile_fid, (void **)&pntsd, pacllen,
+				    info);
 		SMB2_close(xid, tcon, fid.persistent_fid, fid.volatile_fid);
 	}
 
@@ -3268,10 +3273,12 @@ set_smb2_acl(struct cifs_ntsd *pnntsd, __u32 acllen,
 	tcon = tlink_tcon(tlink);
 	xid = get_xid();
 
-	if (aclflag == CIFS_ACL_OWNER || aclflag == CIFS_ACL_GROUP)
-		access_flags = WRITE_OWNER;
-	else
-		access_flags = WRITE_DAC;
+	if (aclflag & CIFS_ACL_OWNER || aclflag & CIFS_ACL_GROUP)
+		access_flags |= WRITE_OWNER;
+	if (aclflag & CIFS_ACL_SACL)
+		access_flags |= SYSTEM_SECURITY;
+	if (aclflag & CIFS_ACL_DACL)
+		access_flags |= WRITE_DAC;
 
 	utf16_path = cifs_convert_path_to_utf16(path, cifs_sb);
 	if (!utf16_path) {
@@ -3305,8 +3312,8 @@ set_smb2_acl(struct cifs_ntsd *pnntsd, __u32 acllen,
 /* Retrieve an ACL from the server */
 static struct cifs_ntsd *
 get_smb2_acl(struct cifs_sb_info *cifs_sb,
-				      struct inode *inode, const char *path,
-				      u32 *pacllen)
+	     struct inode *inode, const char *path,
+	     u32 *pacllen, u32 info)
 {
 	struct cifs_ntsd *pntsd = NULL;
 	struct cifsFileInfo *open_file = NULL;
@@ -3314,9 +3321,9 @@ get_smb2_acl(struct cifs_sb_info *cifs_sb,
 	if (inode)
 		open_file = find_readable_file(CIFS_I(inode), true);
 	if (!open_file)
-		return get_smb2_acl_by_path(cifs_sb, path, pacllen);
+		return get_smb2_acl_by_path(cifs_sb, path, pacllen, info);
 
-	pntsd = get_smb2_acl_by_fid(cifs_sb, &open_file->fid, pacllen);
+	pntsd = get_smb2_acl_by_fid(cifs_sb, &open_file->fid, pacllen, info);
 	cifsFileInfo_put(open_file);
 	return pntsd;
 }
diff --git a/fs/cifs/smb2pdu.c b/fs/cifs/smb2pdu.c
index 445e80862865..0aeb63694306 100644
--- a/fs/cifs/smb2pdu.c
+++ b/fs/cifs/smb2pdu.c
@@ -3471,10 +3471,9 @@ SMB311_posix_query_info(const unsigned int xid, struct cifs_tcon *tcon,
 
 int
 SMB2_query_acl(const unsigned int xid, struct cifs_tcon *tcon,
-		u64 persistent_fid, u64 volatile_fid,
-		void **data, u32 *plen)
+	       u64 persistent_fid, u64 volatile_fid,
+	       void **data, u32 *plen, u32 additional_info)
 {
-	__u32 additional_info = OWNER_SECINFO | GROUP_SECINFO | DACL_SECINFO;
 	*plen = 0;
 
 	return query_info(xid, tcon, persistent_fid, volatile_fid,
diff --git a/fs/cifs/smb2proto.h b/fs/cifs/smb2proto.h
index d4110447ee3a..9565e27681a5 100644
--- a/fs/cifs/smb2proto.h
+++ b/fs/cifs/smb2proto.h
@@ -200,8 +200,8 @@ extern int SMB2_query_info_init(struct cifs_tcon *tcon,
 				size_t input_len, void *input);
 extern void SMB2_query_info_free(struct smb_rqst *rqst);
 extern int SMB2_query_acl(const unsigned int xid, struct cifs_tcon *tcon,
-			   u64 persistent_file_id, u64 volatile_file_id,
-			   void **data, unsigned int *plen);
+			  u64 persistent_file_id, u64 volatile_file_id,
+			  void **data, unsigned int *plen, u32 info);
 extern int SMB2_get_srv_num(const unsigned int xid, struct cifs_tcon *tcon,
 			    u64 persistent_fid, u64 volatile_fid,
 			    __le64 *uniqueid);
diff --git a/fs/cifs/xattr.c b/fs/cifs/xattr.c
index b8299173ea7e..9318a2acf4ee 100644
--- a/fs/cifs/xattr.c
+++ b/fs/cifs/xattr.c
@@ -34,6 +34,7 @@
 #define MAX_EA_VALUE_SIZE CIFSMaxBufSize
 #define CIFS_XATTR_CIFS_ACL "system.cifs_acl" /* DACL only */
 #define CIFS_XATTR_CIFS_NTSD "system.cifs_ntsd" /* owner plus DACL */
+#define CIFS_XATTR_CIFS_NTSD_FULL "system.cifs_ntsd_full" /* owner/DACL/SACL */
 #define CIFS_XATTR_ATTRIB "cifs.dosattrib"  /* full name: user.cifs.dosattrib */
 #define CIFS_XATTR_CREATETIME "cifs.creationtime"  /* user.cifs.creationtime */
 /*
@@ -43,12 +44,13 @@
  */
 #define SMB3_XATTR_CIFS_ACL "system.smb3_acl" /* DACL only */
 #define SMB3_XATTR_CIFS_NTSD "system.smb3_ntsd" /* owner plus DACL */
+#define SMB3_XATTR_CIFS_NTSD_FULL "system.smb3_ntsd_full" /* owner/DACL/SACL */
 #define SMB3_XATTR_ATTRIB "smb3.dosattrib"  /* full name: user.smb3.dosattrib */
 #define SMB3_XATTR_CREATETIME "smb3.creationtime"  /* user.smb3.creationtime */
 /* BB need to add server (Samba e.g) support for security and trusted prefix */
 
 enum { XATTR_USER, XATTR_CIFS_ACL, XATTR_ACL_ACCESS, XATTR_ACL_DEFAULT,
-	XATTR_CIFS_NTSD };
+	XATTR_CIFS_NTSD, XATTR_CIFS_NTSD_FULL };
 
 static int cifs_attrib_set(unsigned int xid, struct cifs_tcon *pTcon,
 			   struct inode *inode, char *full_path,
@@ -164,7 +166,8 @@ static int cifs_xattr_set(const struct xattr_handler *handler,
 		break;
 
 	case XATTR_CIFS_ACL:
-	case XATTR_CIFS_NTSD: {
+	case XATTR_CIFS_NTSD:
+	case XATTR_CIFS_NTSD_FULL: {
 		struct cifs_ntsd *pacl;
 
 		if (!value)
@@ -174,23 +177,27 @@ static int cifs_xattr_set(const struct xattr_handler *handler,
 			rc = -ENOMEM;
 		} else {
 			memcpy(pacl, value, size);
-			if (value &&
-			    pTcon->ses->server->ops->set_acl) {
+			if (pTcon->ses->server->ops->set_acl) {
+				int aclflags = 0;
 				rc = 0;
-				if (handler->flags == XATTR_CIFS_NTSD) {
-					/* set owner and DACL */
-					rc = pTcon->ses->server->ops->set_acl(
-							pacl, size, inode,
-							full_path,
-							CIFS_ACL_OWNER);
-				}
-				if (rc == 0) {
-					/* set DACL */
-					rc = pTcon->ses->server->ops->set_acl(
-							pacl, size, inode,
-							full_path,
-							CIFS_ACL_DACL);
+
+				switch (handler->flags) {
+				case XATTR_CIFS_NTSD_FULL:
+					aclflags = (CIFS_ACL_OWNER |
+						    CIFS_ACL_DACL |
+						    CIFS_ACL_SACL);
+					break;
+				case XATTR_CIFS_NTSD:
+					aclflags = (CIFS_ACL_OWNER |
+						    CIFS_ACL_DACL);
+					break;
+				case XATTR_CIFS_ACL:
+				default:
+					aclflags = CIFS_ACL_DACL;
 				}
+
+				rc = pTcon->ses->server->ops->set_acl(pacl,
+					size, inode, full_path, aclflags);
 			} else {
 				rc = -EOPNOTSUPP;
 			}
@@ -327,16 +334,27 @@ static int cifs_xattr_get(const struct xattr_handler *handler,
 		break;
 
 	case XATTR_CIFS_ACL:
-	case XATTR_CIFS_NTSD: {
-		/* the whole ntsd is fetched regardless */
-		u32 acllen;
+	case XATTR_CIFS_NTSD:
+	case XATTR_CIFS_NTSD_FULL: {
+		/*
+		 * fetch owner, DACL, and SACL if asked for full descriptor,
+		 * fetch owner and DACL otherwise
+		 */
+		u32 acllen, additional_info = 0;
 		struct cifs_ntsd *pacl;
 
 		if (pTcon->ses->server->ops->get_acl == NULL)
 			goto out; /* rc already EOPNOTSUPP */
 
+		if (handler->flags == XATTR_CIFS_NTSD_FULL) {
+			additional_info = OWNER_SECINFO | GROUP_SECINFO |
+				DACL_SECINFO | SACL_SECINFO;
+		} else {
+			additional_info = OWNER_SECINFO | GROUP_SECINFO |
+				DACL_SECINFO;
+		}
 		pacl = pTcon->ses->server->ops->get_acl(cifs_sb,
-				inode, full_path, &acllen);
+				inode, full_path, &acllen, additional_info);
 		if (IS_ERR(pacl)) {
 			rc = PTR_ERR(pacl);
 			cifs_dbg(VFS, "%s: error %zd getting sec desc\n",
@@ -486,6 +504,27 @@ static const struct xattr_handler smb3_ntsd_xattr_handler = {
 	.set = cifs_xattr_set,
 };
 
+static const struct xattr_handler cifs_cifs_ntsd_full_xattr_handler = {
+	.name = CIFS_XATTR_CIFS_NTSD_FULL,
+	.flags = XATTR_CIFS_NTSD_FULL,
+	.get = cifs_xattr_get,
+	.set = cifs_xattr_set,
+};
+
+/*
+ * Although this is just an alias for the above, need to move away from
+ * confusing users and using the 20 year old term 'cifs' when it is no
+ * longer secure and was replaced by SMB2/SMB3 a long time ago, and
+ * SMB3 and later are highly secure.
+ */
+static const struct xattr_handler smb3_ntsd_full_xattr_handler = {
+	.name = SMB3_XATTR_CIFS_NTSD_FULL,
+	.flags = XATTR_CIFS_NTSD_FULL,
+	.get = cifs_xattr_get,
+	.set = cifs_xattr_set,
+};
+
+
 static const struct xattr_handler cifs_posix_acl_access_xattr_handler = {
 	.name = XATTR_NAME_POSIX_ACL_ACCESS,
 	.flags = XATTR_ACL_ACCESS,
@@ -507,6 +546,8 @@ const struct xattr_handler *cifs_xattr_handlers[] = {
 	&smb3_acl_xattr_handler, /* alias for above since avoiding "cifs" */
 	&cifs_cifs_ntsd_xattr_handler,
 	&smb3_ntsd_xattr_handler, /* alias for above since avoiding "cifs" */
+	&cifs_cifs_ntsd_full_xattr_handler,
+	&smb3_ntsd_full_xattr_handler, /* alias for above since avoiding "cifs" */
 	&cifs_posix_acl_access_xattr_handler,
 	&cifs_posix_acl_default_xattr_handler,
 	NULL
-- 
2.23.3


