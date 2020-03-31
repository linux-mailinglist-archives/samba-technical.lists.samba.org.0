Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 8790F19A26C
	for <lists+samba-technical@lfdr.de>; Wed,  1 Apr 2020 01:23:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=AO/NDpc+lmxoXek5yANOBWWf1Bj2IIgGW3DKXj/+vng=; b=YLJWgblmFQmSZAuXUytJ9LaABx
	SULsp7xtWQv4Ccw2HZGPKRC73YNMW2t2AJXNMY0yL6QuCLacUSVYktRrO3Bxx0hunzpFAWp8WR3MS
	pnT90tIKDmxHjDwUiJm4+7SXNjszi11IjqLE7sGww0XNGXLs5tFCanaMhFPaS4dcaTDp6NHn/ogNm
	U2kI+MKJcjOY0HRZQ2fdWXjzJqosp6TeF5RAvkotcJXBuGvjp5rHbtV9zO0WF0XH3ZFuwvRvY1Djp
	ePMMFaqU/SQqa6bBK6ndd0Ys61SdhGiAlqvSt9pLFRmWuyO7I9oS6AYR+Z0fD0ZfGHHpynTJ5hA34
	DnFKpHHQ==;
Received: from localhost ([::1]:59068 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jJQCj-001DeS-Cd; Tue, 31 Mar 2020 23:21:57 +0000
Received: from [13.77.154.182] (port=37164 helo=linux.microsoft.com) 
 by hr1.samba.org with esmtp (Exim) id 1jJQCc-001DeL-P2
 for samba-technical@lists.samba.org; Tue, 31 Mar 2020 23:21:54 +0000
Received: by linux.microsoft.com (Postfix, from userid 1004)
 id 8774420B4749; Tue, 31 Mar 2020 16:21:44 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 8774420B4749
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxonhyperv.com;
 s=default; t=1585696904;
 bh=AO/NDpc+lmxoXek5yANOBWWf1Bj2IIgGW3DKXj/+vng=;
 h=From:To:Cc:Subject:Date:Reply-To:From;
 b=sTOkV6ZPHKPnusNmH731ZEly08Lb260LuGQeA/JNIGjGxjwdBbf661r84mOf9x0Qs
 s7pxcyGc9C4mBkT4kYG7O4Hw36tB6EUA4nUZXyI1KoSfgaa1GUhhvLiwAlJIgG/F6O
 tWaBALkSAWuQQKmpTncUQq3oDjkjdIcrZjLXliFc=
To: Steve French <sfrench@samba.org>, linux-cifs@vger.kernel.org,
 samba-technical@lists.samba.org, linux-kernel@vger.kernel.org
Subject: [PATCH] cifs: Allocate crypto structures on the fly for calculating
 signatures of incoming packets
Date: Tue, 31 Mar 2020 16:21:43 -0700
Message-Id: <1585696903-96794-1-git-send-email-longli@linuxonhyperv.com>
X-Mailer: git-send-email 1.8.3.1
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
From: longli--- via samba-technical <samba-technical@lists.samba.org>
Reply-To: longli@microsoft.com
Cc: longli@linuxonhyperv.com
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

From: Long Li <longli@microsoft.com>

CIFS uses pre-allocated crypto structures to calculate signatures for both
incoming and outgoing packets. In this way it doesn't need to allocate crypto
structures for every packet, but it requires a lock to prevent concurrent
access to crypto structures.

Remove the lock by allocating crypto structures on the fly for
incoming packets. At the same time, we can still use pre-allocated crypto
structures for outgoing packets, as they are already protected by transport
lock srv_mutex.

Signed-off-by: Long Li <longli@microsoft.com>
---
 fs/cifs/cifsglob.h      |  3 +-
 fs/cifs/smb2proto.h     |  6 ++-
 fs/cifs/smb2transport.c | 87 +++++++++++++++++++++++++----------------
 3 files changed, 60 insertions(+), 36 deletions(-)

diff --git a/fs/cifs/cifsglob.h b/fs/cifs/cifsglob.h
index 0d956360e984..7448e7202e7a 100644
--- a/fs/cifs/cifsglob.h
+++ b/fs/cifs/cifsglob.h
@@ -426,7 +426,8 @@ struct smb_version_operations {
 	/* generate new lease key */
 	void (*new_lease_key)(struct cifs_fid *);
 	int (*generate_signingkey)(struct cifs_ses *);
-	int (*calc_signature)(struct smb_rqst *, struct TCP_Server_Info *);
+	int (*calc_signature)(struct smb_rqst *, struct TCP_Server_Info *,
+				bool allocate_crypto);
 	int (*set_integrity)(const unsigned int, struct cifs_tcon *tcon,
 			     struct cifsFileInfo *src_file);
 	int (*enum_snapshots)(const unsigned int xid, struct cifs_tcon *tcon,
diff --git a/fs/cifs/smb2proto.h b/fs/cifs/smb2proto.h
index 4d1ff7b66fdc..087d5f14320b 100644
--- a/fs/cifs/smb2proto.h
+++ b/fs/cifs/smb2proto.h
@@ -55,9 +55,11 @@ extern struct cifs_ses *smb2_find_smb_ses(struct TCP_Server_Info *server,
 extern struct cifs_tcon *smb2_find_smb_tcon(struct TCP_Server_Info *server,
 						__u64 ses_id, __u32  tid);
 extern int smb2_calc_signature(struct smb_rqst *rqst,
-				struct TCP_Server_Info *server);
+				struct TCP_Server_Info *server,
+				bool allocate_crypto);
 extern int smb3_calc_signature(struct smb_rqst *rqst,
-				struct TCP_Server_Info *server);
+				struct TCP_Server_Info *server,
+				bool allocate_crypto);
 extern void smb2_echo_request(struct work_struct *work);
 extern __le32 smb2_get_lease_state(struct cifsInodeInfo *cinode);
 extern bool smb2_is_valid_oplock_break(char *buffer,
diff --git a/fs/cifs/smb2transport.c b/fs/cifs/smb2transport.c
index 08b703b7a15e..c01e19a3b112 100644
--- a/fs/cifs/smb2transport.c
+++ b/fs/cifs/smb2transport.c
@@ -40,14 +40,6 @@
 #include "smb2status.h"
 #include "smb2glob.h"
 
-static int
-smb2_crypto_shash_allocate(struct TCP_Server_Info *server)
-{
-	return cifs_alloc_hash("hmac(sha256)",
-			       &server->secmech.hmacsha256,
-			       &server->secmech.sdeschmacsha256);
-}
-
 static int
 smb3_crypto_shash_allocate(struct TCP_Server_Info *server)
 {
@@ -219,7 +211,8 @@ smb2_find_smb_tcon(struct TCP_Server_Info *server, __u64 ses_id, __u32  tid)
 }
 
 int
-smb2_calc_signature(struct smb_rqst *rqst, struct TCP_Server_Info *server)
+smb2_calc_signature(struct smb_rqst *rqst, struct TCP_Server_Info *server,
+			bool allocate_crypto)
 {
 	int rc;
 	unsigned char smb2_signature[SMB2_HMACSHA256_SIZE];
@@ -228,6 +221,8 @@ smb2_calc_signature(struct smb_rqst *rqst, struct TCP_Server_Info *server)
 	struct smb2_sync_hdr *shdr = (struct smb2_sync_hdr *)iov[0].iov_base;
 	struct cifs_ses *ses;
 	struct shash_desc *shash;
+	struct crypto_shash *hash;
+	struct sdesc *sdesc = NULL;
 	struct smb_rqst drqst;
 
 	ses = smb2_find_smb_ses(server, shdr->SessionId);
@@ -239,24 +234,32 @@ smb2_calc_signature(struct smb_rqst *rqst, struct TCP_Server_Info *server)
 	memset(smb2_signature, 0x0, SMB2_HMACSHA256_SIZE);
 	memset(shdr->Signature, 0x0, SMB2_SIGNATURE_SIZE);
 
-	rc = smb2_crypto_shash_allocate(server);
-	if (rc) {
-		cifs_server_dbg(VFS, "%s: sha256 alloc failed\n", __func__);
-		return rc;
+	if (allocate_crypto) {
+		rc = cifs_alloc_hash("hmac(sha256)", &hash, &sdesc);
+		if (rc) {
+			cifs_server_dbg(VFS,
+					"%s: sha256 alloc failed\n", __func__);
+			return rc;
+		}
+		shash = &sdesc->shash;
+	} else {
+		hash = server->secmech.hmacsha256;
+		shash = &server->secmech.sdeschmacsha256->shash;
 	}
 
-	rc = crypto_shash_setkey(server->secmech.hmacsha256,
-				 ses->auth_key.response, SMB2_NTLMV2_SESSKEY_SIZE);
+	rc = crypto_shash_setkey(hash, ses->auth_key.response,
+			SMB2_NTLMV2_SESSKEY_SIZE);
 	if (rc) {
-		cifs_server_dbg(VFS, "%s: Could not update with response\n", __func__);
-		return rc;
+		cifs_server_dbg(VFS,
+				"%s: Could not update with response\n",
+				__func__);
+		goto out;
 	}
 
-	shash = &server->secmech.sdeschmacsha256->shash;
 	rc = crypto_shash_init(shash);
 	if (rc) {
 		cifs_server_dbg(VFS, "%s: Could not init sha256", __func__);
-		return rc;
+		goto out;
 	}
 
 	/*
@@ -271,9 +274,10 @@ smb2_calc_signature(struct smb_rqst *rqst, struct TCP_Server_Info *server)
 		rc = crypto_shash_update(shash, iov[0].iov_base,
 					 iov[0].iov_len);
 		if (rc) {
-			cifs_server_dbg(VFS, "%s: Could not update with payload\n",
-				 __func__);
-			return rc;
+			cifs_server_dbg(VFS,
+					"%s: Could not update with payload\n",
+					__func__);
+			goto out;
 		}
 		drqst.rq_iov++;
 		drqst.rq_nvec--;
@@ -283,6 +287,9 @@ smb2_calc_signature(struct smb_rqst *rqst, struct TCP_Server_Info *server)
 	if (!rc)
 		memcpy(shdr->Signature, sigptr, SMB2_SIGNATURE_SIZE);
 
+out:
+	if (allocate_crypto)
+		cifs_free_hash(&hash, &sdesc);
 	return rc;
 }
 
@@ -504,14 +511,17 @@ generate_smb311signingkey(struct cifs_ses *ses)
 }
 
 int
-smb3_calc_signature(struct smb_rqst *rqst, struct TCP_Server_Info *server)
+smb3_calc_signature(struct smb_rqst *rqst, struct TCP_Server_Info *server,
+			bool allocate_crypto)
 {
 	int rc;
 	unsigned char smb3_signature[SMB2_CMACAES_SIZE];
 	unsigned char *sigptr = smb3_signature;
 	struct kvec *iov = rqst->rq_iov;
 	struct smb2_sync_hdr *shdr = (struct smb2_sync_hdr *)iov[0].iov_base;
-	struct shash_desc *shash = &server->secmech.sdesccmacaes->shash;
+	struct shash_desc *shash;
+	struct crypto_shash *hash;
+	struct sdesc *sdesc = NULL;
 	struct smb_rqst drqst;
 	u8 key[SMB3_SIGN_KEY_SIZE];
 
@@ -519,14 +529,24 @@ smb3_calc_signature(struct smb_rqst *rqst, struct TCP_Server_Info *server)
 	if (rc)
 		return 0;
 
+	if (allocate_crypto) {
+		rc = cifs_alloc_hash("cmac(aes)", &hash, &sdesc);
+		if (rc)
+			return rc;
+
+		shash = &sdesc->shash;
+	} else {
+		hash = server->secmech.cmacaes;
+		shash = &server->secmech.sdesccmacaes->shash;
+	}
+
 	memset(smb3_signature, 0x0, SMB2_CMACAES_SIZE);
 	memset(shdr->Signature, 0x0, SMB2_SIGNATURE_SIZE);
 
-	rc = crypto_shash_setkey(server->secmech.cmacaes,
-				 key, SMB2_CMACAES_SIZE);
+	rc = crypto_shash_setkey(hash, key, SMB2_CMACAES_SIZE);
 	if (rc) {
 		cifs_server_dbg(VFS, "%s: Could not set key for cmac aes\n", __func__);
-		return rc;
+		goto out;
 	}
 
 	/*
@@ -537,7 +557,7 @@ smb3_calc_signature(struct smb_rqst *rqst, struct TCP_Server_Info *server)
 	rc = crypto_shash_init(shash);
 	if (rc) {
 		cifs_server_dbg(VFS, "%s: Could not init cmac aes\n", __func__);
-		return rc;
+		goto out;
 	}
 
 	/*
@@ -554,7 +574,7 @@ smb3_calc_signature(struct smb_rqst *rqst, struct TCP_Server_Info *server)
 		if (rc) {
 			cifs_server_dbg(VFS, "%s: Could not update with payload\n",
 				 __func__);
-			return rc;
+			goto out;
 		}
 		drqst.rq_iov++;
 		drqst.rq_nvec--;
@@ -564,6 +584,9 @@ smb3_calc_signature(struct smb_rqst *rqst, struct TCP_Server_Info *server)
 	if (!rc)
 		memcpy(shdr->Signature, sigptr, SMB2_SIGNATURE_SIZE);
 
+out:
+	if (allocate_crypto)
+		cifs_free_hash(&hash, &sdesc);
 	return rc;
 }
 
@@ -593,7 +616,7 @@ smb2_sign_rqst(struct smb_rqst *rqst, struct TCP_Server_Info *server)
 		return 0;
 	}
 
-	rc = server->ops->calc_signature(rqst, server);
+	rc = server->ops->calc_signature(rqst, server, false);
 
 	return rc;
 }
@@ -631,9 +654,7 @@ smb2_verify_signature(struct smb_rqst *rqst, struct TCP_Server_Info *server)
 
 	memset(shdr->Signature, 0, SMB2_SIGNATURE_SIZE);
 
-	mutex_lock(&server->srv_mutex);
-	rc = server->ops->calc_signature(rqst, server);
-	mutex_unlock(&server->srv_mutex);
+	rc = server->ops->calc_signature(rqst, server, true);
 
 	if (rc)
 		return rc;
-- 
2.17.1


