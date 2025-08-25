Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B6AFB34CCE
	for <lists+samba-technical@lfdr.de>; Mon, 25 Aug 2025 22:53:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=MkoDjXgNFM9VM3gN36kttJ6mKFg8K492Lc5CfNbEUIc=; b=qsoUssWUQOiCpR2wtH1APz4tvX
	Q5wGd9drBv1pUBFhaOpyteciudYE5DfT+CYh6SVZQHpp7L4iYp1Grh31PELmpmFAVJ5ItuUH2egpC
	bVhqGLU37Gt10PQyarRLnqg9pE9O3b4krQuKmW3y/bi7xWBzL+d3MAJZUFuQj5D+8IDMnNfsCaNKj
	XLqtinIZu9S2+vc1ZehuL1vJ7k8uelWH646nLWenIUpFXNzDM0KOsAMM4yOEwUuCiTk9m3NuqMmvg
	sRtMvCHFayYHrdmRj5WTh55izSI4IrTToOvoosdpFdWAQZvDWnlEihXQAEgpp34pqVU0h5gWj6DR3
	lY96X3vg==;
Received: from ip6-localhost ([::1]:47642 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uqeBS-000PLE-Vu; Mon, 25 Aug 2025 20:52:55 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:51062) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uqe96-000ORr-7y
 for samba-technical@lists.samba.org; Mon, 25 Aug 2025 20:50:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=MkoDjXgNFM9VM3gN36kttJ6mKFg8K492Lc5CfNbEUIc=; b=JL4parIbhULjuDp18pH85Jl4pV
 TTEUXw/5hDtQnexpfukOHHqhI1cpg1jmfoEfrwdfHYlFz4R2aoiHxBnQc89M+I5gQtlAVs4RKqb7b
 +GoEHeMg85+RgvP9cIVR9q/fe33NkCl5GzRsxQObCogDfM2zQK4++NZOm8lpn5ZXIvVD5E1ZQsge9
 tktD8Qqad/u5w/ABLpurKcV1TvEbJzRTWSwBBJcB5hr4b30VQ2+xZeaH+LX14/XZ1buC/Hs7BduUg
 UYEujJf4phwaV/RgXU+ffarl1vLmjxyF6C6XLDmuZEq6aU2yQxDSVV5R+L1WXenWP2YDO2ENEUNV8
 y8m/HqNrRu33+mIk2e9EoxP2zrmDwjJGauZTLHo0jonjc18O1B9pfui9mKMTlTNfv6GmTUhSn+uD8
 G93pByKu8hK+9/hO8NikMENsxxu5WoP2XKbx9BOzLX5B+RE6kWezzdkleSGGr07uKRIKhWpG5D/xH
 SEaktAHOmeU515pAnlis8pXQ;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uqe92-000kwe-0g; Mon, 25 Aug 2025 20:50:25 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v4 052/142] smb: client: make use of struct smbdirect_mr_io
Date: Mon, 25 Aug 2025 22:40:13 +0200
Message-ID: <da240bf5eca5a42f0d7e08e81c7bcafa977de38e.1756139607.git.metze@samba.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1756139607.git.metze@samba.org>
References: <cover.1756139607.git.metze@samba.org>
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
From: Stefan Metzmacher via samba-technical <samba-technical@lists.samba.org>
Reply-To: Stefan Metzmacher <metze@samba.org>
Cc: metze@samba.org, Steve French <smfrench@gmail.com>,
 Tom Talpey <tom@talpey.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This will allow us to move to common functions in future too.

Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: Long Li <longli@microsoft.com>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
---
 fs/smb/client/cifsglob.h  |  2 +-
 fs/smb/client/smbdirect.c | 66 ++++++++++++++++++++-------------------
 fs/smb/client/smbdirect.h | 27 ++--------------
 3 files changed, 37 insertions(+), 58 deletions(-)

diff --git a/fs/smb/client/cifsglob.h b/fs/smb/client/cifsglob.h
index f87a1ca33592..6df6acb7617f 100644
--- a/fs/smb/client/cifsglob.h
+++ b/fs/smb/client/cifsglob.h
@@ -1547,7 +1547,7 @@ struct cifs_io_subrequest {
 	struct kvec			iov[2];
 	struct TCP_Server_Info		*server;
 #ifdef CONFIG_CIFS_SMB_DIRECT
-	struct smbd_mr			*mr;
+	struct smbdirect_mr_io		*mr;
 #endif
 	struct cifs_credits		credits;
 };
diff --git a/fs/smb/client/smbdirect.c b/fs/smb/client/smbdirect.c
index be4e90755a6c..1a1acc0ee4b0 100644
--- a/fs/smb/client/smbdirect.c
+++ b/fs/smb/client/smbdirect.c
@@ -2165,14 +2165,15 @@ int smbd_send(struct TCP_Server_Info *server,
 
 static void register_mr_done(struct ib_cq *cq, struct ib_wc *wc)
 {
-	struct smbd_mr *mr;
-	struct ib_cqe *cqe;
+	struct smbdirect_mr_io *mr =
+		container_of(wc->wr_cqe, struct smbdirect_mr_io, cqe);
+	struct smbdirect_socket *sc = mr->socket;
+	struct smbd_connection *info =
+		container_of(sc, struct smbd_connection, socket);
 
 	if (wc->status) {
 		log_rdma_mr(ERR, "status=%d\n", wc->status);
-		cqe = wc->wr_cqe;
-		mr = container_of(cqe, struct smbd_mr, cqe);
-		smbd_disconnect_rdma_connection(mr->conn);
+		smbd_disconnect_rdma_connection(info);
 	}
 }
 
@@ -2190,11 +2191,11 @@ static void smbd_mr_recovery_work(struct work_struct *work)
 	struct smbd_connection *info =
 		container_of(work, struct smbd_connection, mr_recovery_work);
 	struct smbdirect_socket *sc = &info->socket;
-	struct smbd_mr *smbdirect_mr;
+	struct smbdirect_mr_io *smbdirect_mr;
 	int rc;
 
 	list_for_each_entry(smbdirect_mr, &info->mr_list, list) {
-		if (smbdirect_mr->state == MR_ERROR) {
+		if (smbdirect_mr->state == SMBDIRECT_MR_ERROR) {
 
 			/* recover this MR entry */
 			rc = ib_dereg_mr(smbdirect_mr->mr);
@@ -2220,7 +2221,7 @@ static void smbd_mr_recovery_work(struct work_struct *work)
 			/* This MR is being used, don't recover it */
 			continue;
 
-		smbdirect_mr->state = MR_READY;
+		smbdirect_mr->state = SMBDIRECT_MR_READY;
 
 		/* smbdirect_mr->state is updated by this function
 		 * and is read and updated by I/O issuing CPUs trying
@@ -2237,11 +2238,11 @@ static void smbd_mr_recovery_work(struct work_struct *work)
 static void destroy_mr_list(struct smbd_connection *info)
 {
 	struct smbdirect_socket *sc = &info->socket;
-	struct smbd_mr *mr, *tmp;
+	struct smbdirect_mr_io *mr, *tmp;
 
 	disable_work_sync(&info->mr_recovery_work);
 	list_for_each_entry_safe(mr, tmp, &info->mr_list, list) {
-		if (mr->state == MR_INVALIDATED)
+		if (mr->state == SMBDIRECT_MR_INVALIDATED)
 			ib_dma_unmap_sg(sc->ib.dev, mr->sgt.sgl,
 				mr->sgt.nents, mr->dir);
 		ib_dereg_mr(mr->mr);
@@ -2262,7 +2263,7 @@ static int allocate_mr_list(struct smbd_connection *info)
 	struct smbdirect_socket *sc = &info->socket;
 	struct smbdirect_socket_parameters *sp = &sc->parameters;
 	int i;
-	struct smbd_mr *smbdirect_mr, *tmp;
+	struct smbdirect_mr_io *smbdirect_mr, *tmp;
 
 	INIT_LIST_HEAD(&info->mr_list);
 	init_waitqueue_head(&info->wait_mr);
@@ -2297,8 +2298,8 @@ static int allocate_mr_list(struct smbd_connection *info)
 			ib_dereg_mr(smbdirect_mr->mr);
 			goto out;
 		}
-		smbdirect_mr->state = MR_READY;
-		smbdirect_mr->conn = info;
+		smbdirect_mr->state = SMBDIRECT_MR_READY;
+		smbdirect_mr->socket = sc;
 
 		list_add_tail(&smbdirect_mr->list, &info->mr_list);
 		atomic_inc(&info->mr_ready_count);
@@ -2325,10 +2326,10 @@ static int allocate_mr_list(struct smbd_connection *info)
  * issuing I/O trying to get MR at the same time, mr_list_lock is used to
  * protect this situation.
  */
-static struct smbd_mr *get_mr(struct smbd_connection *info)
+static struct smbdirect_mr_io *get_mr(struct smbd_connection *info)
 {
 	struct smbdirect_socket *sc = &info->socket;
-	struct smbd_mr *ret;
+	struct smbdirect_mr_io *ret;
 	int rc;
 again:
 	rc = wait_event_interruptible(info->wait_mr,
@@ -2346,8 +2347,8 @@ static struct smbd_mr *get_mr(struct smbd_connection *info)
 
 	spin_lock(&info->mr_list_lock);
 	list_for_each_entry(ret, &info->mr_list, list) {
-		if (ret->state == MR_READY) {
-			ret->state = MR_REGISTERED;
+		if (ret->state == SMBDIRECT_MR_READY) {
+			ret->state = SMBDIRECT_MR_REGISTERED;
 			spin_unlock(&info->mr_list_lock);
 			atomic_dec(&info->mr_ready_count);
 			atomic_inc(&info->mr_used_count);
@@ -2389,12 +2390,12 @@ static int smbd_iter_to_mr(struct smbd_connection *info,
  * need_invalidate: true if this MR needs to be locally invalidated after I/O
  * return value: the MR registered, NULL if failed.
  */
-struct smbd_mr *smbd_register_mr(struct smbd_connection *info,
+struct smbdirect_mr_io *smbd_register_mr(struct smbd_connection *info,
 				 struct iov_iter *iter,
 				 bool writing, bool need_invalidate)
 {
 	struct smbdirect_socket *sc = &info->socket;
-	struct smbd_mr *smbdirect_mr;
+	struct smbdirect_mr_io *smbdirect_mr;
 	int rc, num_pages;
 	enum dma_data_direction dir;
 	struct ib_reg_wr *reg_wr;
@@ -2466,13 +2467,13 @@ struct smbd_mr *smbd_register_mr(struct smbd_connection *info,
 	log_rdma_mr(ERR, "ib_post_send failed rc=%x reg_wr->key=%x\n",
 		rc, reg_wr->key);
 
-	/* If all failed, attempt to recover this MR by setting it MR_ERROR*/
+	/* If all failed, attempt to recover this MR by setting it SMBDIRECT_MR_ERROR*/
 map_mr_error:
 	ib_dma_unmap_sg(sc->ib.dev, smbdirect_mr->sgt.sgl,
 			smbdirect_mr->sgt.nents, smbdirect_mr->dir);
 
 dma_map_error:
-	smbdirect_mr->state = MR_ERROR;
+	smbdirect_mr->state = SMBDIRECT_MR_ERROR;
 	if (atomic_dec_and_test(&info->mr_used_count))
 		wake_up(&info->wait_for_mr_cleanup);
 
@@ -2483,15 +2484,15 @@ struct smbd_mr *smbd_register_mr(struct smbd_connection *info,
 
 static void local_inv_done(struct ib_cq *cq, struct ib_wc *wc)
 {
-	struct smbd_mr *smbdirect_mr;
+	struct smbdirect_mr_io *smbdirect_mr;
 	struct ib_cqe *cqe;
 
 	cqe = wc->wr_cqe;
-	smbdirect_mr = container_of(cqe, struct smbd_mr, cqe);
-	smbdirect_mr->state = MR_INVALIDATED;
+	smbdirect_mr = container_of(cqe, struct smbdirect_mr_io, cqe);
+	smbdirect_mr->state = SMBDIRECT_MR_INVALIDATED;
 	if (wc->status != IB_WC_SUCCESS) {
 		log_rdma_mr(ERR, "invalidate failed status=%x\n", wc->status);
-		smbdirect_mr->state = MR_ERROR;
+		smbdirect_mr->state = SMBDIRECT_MR_ERROR;
 	}
 	complete(&smbdirect_mr->invalidate_done);
 }
@@ -2502,11 +2503,12 @@ static void local_inv_done(struct ib_cq *cq, struct ib_wc *wc)
  * and we have to locally invalidate the buffer to prevent data is being
  * modified by remote peer after upper layer consumes it
  */
-int smbd_deregister_mr(struct smbd_mr *smbdirect_mr)
+int smbd_deregister_mr(struct smbdirect_mr_io *smbdirect_mr)
 {
 	struct ib_send_wr *wr;
-	struct smbd_connection *info = smbdirect_mr->conn;
-	struct smbdirect_socket *sc = &info->socket;
+	struct smbdirect_socket *sc = smbdirect_mr->socket;
+	struct smbd_connection *info =
+		container_of(sc, struct smbd_connection, socket);
 	int rc = 0;
 
 	if (smbdirect_mr->need_invalidate) {
@@ -2530,17 +2532,17 @@ int smbd_deregister_mr(struct smbd_mr *smbdirect_mr)
 		smbdirect_mr->need_invalidate = false;
 	} else
 		/*
-		 * For remote invalidation, just set it to MR_INVALIDATED
+		 * For remote invalidation, just set it to SMBDIRECT_MR_INVALIDATED
 		 * and defer to mr_recovery_work to recover the MR for next use
 		 */
-		smbdirect_mr->state = MR_INVALIDATED;
+		smbdirect_mr->state = SMBDIRECT_MR_INVALIDATED;
 
-	if (smbdirect_mr->state == MR_INVALIDATED) {
+	if (smbdirect_mr->state == SMBDIRECT_MR_INVALIDATED) {
 		ib_dma_unmap_sg(
 			sc->ib.dev, smbdirect_mr->sgt.sgl,
 			smbdirect_mr->sgt.nents,
 			smbdirect_mr->dir);
-		smbdirect_mr->state = MR_READY;
+		smbdirect_mr->state = SMBDIRECT_MR_READY;
 		if (atomic_inc_return(&info->mr_ready_count) == 1)
 			wake_up(&info->wait_mr);
 	} else
diff --git a/fs/smb/client/smbdirect.h b/fs/smb/client/smbdirect.h
index 7773939db5f2..83e726967b2f 100644
--- a/fs/smb/client/smbdirect.h
+++ b/fs/smb/client/smbdirect.h
@@ -71,34 +71,11 @@ int smbd_recv(struct smbd_connection *info, struct msghdr *msg);
 int smbd_send(struct TCP_Server_Info *server,
 	int num_rqst, struct smb_rqst *rqst);
 
-enum mr_state {
-	MR_READY,
-	MR_REGISTERED,
-	MR_INVALIDATED,
-	MR_ERROR
-};
-
-struct smbd_mr {
-	struct smbd_connection	*conn;
-	struct list_head	list;
-	enum mr_state		state;
-	struct ib_mr		*mr;
-	struct sg_table		sgt;
-	enum dma_data_direction	dir;
-	union {
-		struct ib_reg_wr	wr;
-		struct ib_send_wr	inv_wr;
-	};
-	struct ib_cqe		cqe;
-	bool			need_invalidate;
-	struct completion	invalidate_done;
-};
-
 /* Interfaces to register and deregister MR for RDMA read/write */
-struct smbd_mr *smbd_register_mr(
+struct smbdirect_mr_io *smbd_register_mr(
 	struct smbd_connection *info, struct iov_iter *iter,
 	bool writing, bool need_invalidate);
-int smbd_deregister_mr(struct smbd_mr *mr);
+int smbd_deregister_mr(struct smbdirect_mr_io *mr);
 
 #else
 #define cifs_rdma_enabled(server)	0
-- 
2.43.0


