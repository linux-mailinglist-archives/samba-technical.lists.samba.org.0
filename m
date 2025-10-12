Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EE20BD0AC3
	for <lists+samba-technical@lfdr.de>; Sun, 12 Oct 2025 21:12:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=oFz5rVaNpm4DcEGKDv7UcJ3oBDSSjzJ0I7IiLqz6Axk=; b=3EF8+y0cz+iCQtPtso5mKm3MBE
	YeOYw1DqwRsYOq9ioexP85xv1fd/Wm+KKM8/BTyGqv4zhhmTQlwU9+iHzeIfCqrpQmBaFGt5WPOeI
	JtstHNHppW4kxK5dTJq0oNVqXYUjnKQ+45Z9/RBbMJs7r/qGxoAaBDvuKakJl/iyXEk0RcY3tzydv
	DRK3ZbZr+3ajbu4MBFjG8QB7vZ6lOzS6BE8HR6bLxeQYYGFO325z5TEV5kX8/5lQXT8ZJzcvTM1sn
	dzie91/1yAQMT4FZFKapUi9hZ9IdxCytZu4Xuv+WeoyGYh4zBiJKJf7V1Fqs/dm2cz3dYiGuqi9Ol
	i62S7xcw==;
Received: from ip6-localhost ([::1]:52592 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1v81Us-007d0b-3O; Sun, 12 Oct 2025 19:12:46 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:56708) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1v81UR-007crN-DN
 for samba-technical@lists.samba.org; Sun, 12 Oct 2025 19:12:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=oFz5rVaNpm4DcEGKDv7UcJ3oBDSSjzJ0I7IiLqz6Axk=; b=XK9OxcD6cfzYK1ZWCGjSZ1iugT
 0n37UoFQ+it/jnk2ve9M3acVO1m1GdAKCegTMp+xH4ms6psK22MB6N9Y8vl4m4hp1kpiQvraKBZZf
 dhiLpXIQO5h0mLz4PkKbkh9T4bg+eVQ9xunPket9JFap2VJvowSzaeHg9hL4eEgKFBR4EoX9KQOcr
 OSlTP/a0bOpiNrJwjtAe8fIaXfatRnlxkAq17R4P1SkPjqjRKpm7pprYDlQSAMYdBBtWPCXIwmJ9U
 nx1gWLWbsVJ5CnIsy3uZVfkonJYQ0nCEjdSyfnwMERaVjni5QgEsPjHvHrAUcyHQjTJS47kEZXhK3
 L3I4CvronxZpi3qhuiIBwvA6asDHyzYfCg4u2xRMl1OWIWzTNs0F+ZaULbRHaU5lrC54sTEqfkrV9
 gc+Uri9pZ2CNtm7QC7znaOS7+J0fh4ahlvOJW7rYmiB5lPt1aGGNB9fMI4RWYkFChJ9TB9WWXnGmG
 pYTJB7dGVo7CtLcixGzZaSCj;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1v81UP-008oGt-0d; Sun, 12 Oct 2025 19:12:17 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH 10/10] smb: client: let destroy_mr_list() keep smbdirect_mr_io
 memory if registered
Date: Sun, 12 Oct 2025 21:10:30 +0200
Message-ID: <6d275bab3ee66cf653c9e1e242a0a87efa352063.1760295528.git.metze@samba.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1760295528.git.metze@samba.org>
References: <cover.1760295528.git.metze@samba.org>
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
 Tom Talpey <tom@talpey.com>, Namjae Jeon <linkinjeon@kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

If a smbdirect_mr_io structure if still visible to callers of
smbd_register_mr() we can't free the related memory when the
connection is disconnected! Otherwise smbd_deregister_mr()
will crash.

Now we use a mutex and refcounting in order to keep the
memory around if the connection is disconnected.

It means smbd_deregister_mr() can be called at any later time to free
the memory, which is no longer referenced by nor referencing the
connection.

It also means smbd_destroy() no longer needs to wait for
mr_io.used.count to become 0.

Fixes: 050b8c374019 ("smbd: Make upper layer decide when to destroy the transport")
Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: Long Li <longli@microsoft.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
---
 fs/smb/client/smbdirect.c | 145 +++++++++++++++++++++++++++++++++-----
 1 file changed, 126 insertions(+), 19 deletions(-)

diff --git a/fs/smb/client/smbdirect.c b/fs/smb/client/smbdirect.c
index c3330e43488f..e78b4ceb6d32 100644
--- a/fs/smb/client/smbdirect.c
+++ b/fs/smb/client/smbdirect.c
@@ -1624,19 +1624,7 @@ void smbd_destroy(struct TCP_Server_Info *server)
 	log_rdma_event(INFO, "free receive buffers\n");
 	destroy_receive_buffers(sc);
 
-	/*
-	 * For performance reasons, memory registration and deregistration
-	 * are not locked by srv_mutex. It is possible some processes are
-	 * blocked on transport srv_mutex while holding memory registration.
-	 * Release the transport srv_mutex to allow them to hit the failure
-	 * path when sending data, and then release memory registrations.
-	 */
 	log_rdma_event(INFO, "freeing mr list\n");
-	while (atomic_read(&sc->mr_io.used.count)) {
-		cifs_server_unlock(server);
-		msleep(1000);
-		cifs_server_lock(server);
-	}
 	destroy_mr_list(sc);
 
 	ib_free_cq(sc->ib.send_cq);
@@ -2352,6 +2340,46 @@ static void smbd_mr_recovery_work(struct work_struct *work)
 	}
 }
 
+static void smbd_mr_disable_locked(struct smbdirect_mr_io *mr)
+{
+	struct smbdirect_socket *sc = mr->socket;
+
+	lockdep_assert_held(&mr->mutex);
+
+	if (mr->state == SMBDIRECT_MR_DISABLED)
+		return;
+
+	if (mr->mr)
+		ib_dereg_mr(mr->mr);
+	if (mr->sgt.nents)
+		ib_dma_unmap_sg(sc->ib.dev, mr->sgt.sgl, mr->sgt.nents, mr->dir);
+	kfree(mr->sgt.sgl);
+
+	mr->mr = NULL;
+	mr->sgt.sgl = NULL;
+	mr->sgt.nents = 0;
+
+	mr->state = SMBDIRECT_MR_DISABLED;
+}
+
+static void smbd_mr_free_locked(struct kref *kref)
+{
+	struct smbdirect_mr_io *mr =
+		container_of(kref, struct smbdirect_mr_io, kref);
+
+	lockdep_assert_held(&mr->mutex);
+
+	/*
+	 * smbd_mr_disable_locked() should already be called!
+	 */
+	if (WARN_ON_ONCE(mr->state != SMBDIRECT_MR_DISABLED))
+		smbd_mr_disable_locked(mr);
+
+	mutex_unlock(&mr->mutex);
+	mutex_destroy(&mr->mutex);
+	kfree(mr);
+}
+
 static void destroy_mr_list(struct smbdirect_socket *sc)
 {
 	struct smbdirect_mr_io *mr, *tmp;
@@ -2365,13 +2393,31 @@ static void destroy_mr_list(struct smbdirect_socket *sc)
 	spin_unlock_irqrestore(&sc->mr_io.all.lock, flags);
 
 	list_for_each_entry_safe(mr, tmp, &all_list, list) {
-		if (mr->mr)
-			ib_dereg_mr(mr->mr);
-		if (mr->sgt.nents)
-			ib_dma_unmap_sg(sc->ib.dev, mr->sgt.sgl, mr->sgt.nents, mr->dir);
-		kfree(mr->sgt.sgl);
+		mutex_lock(&mr->mutex);
+
+		smbd_mr_disable_locked(mr);
 		list_del(&mr->list);
-		kfree(mr);
+		mr->socket = NULL;
+
+		/*
+		 * No kref_put_mutex() as it's already locked.
+		 *
+		 * If smbd_mr_free_locked() is called
+		 * and the mutex is unlocked and mr is gone,
+		 * in that case kref_put() returned 1.
+		 *
+		 * If kref_put() returned 0 we know that
+		 * smbd_mr_free_locked() didn't
+		 * run. Not by us nor by anyone else, as we
+		 * still hold the mutex, so we need to unlock.
+		 *
+		 * If the mr is still registered it will
+		 * be dangling (detached from the connection
+		 * waiting for smbd_deregister_mr() to be
+		 * called in order to free the memory.
+		 */
+		if (!kref_put(&mr->kref, smbd_mr_free_locked))
+			mutex_unlock(&mr->mutex);
 	}
 }
 
@@ -2402,6 +2448,9 @@ static int allocate_mr_list(struct smbdirect_socket *sc)
 			goto kzalloc_mr_failed;
 		}
 
+		kref_init(&mr->kref);
+		mutex_init(&mr->mutex);
+
 		mr->mr = ib_alloc_mr(sc->ib.pd,
 				     sc->mr_io.type,
 				     sp->max_frmr_depth);
@@ -2471,6 +2520,7 @@ static struct smbdirect_mr_io *get_mr(struct smbdirect_socket *sc)
 	list_for_each_entry(ret, &sc->mr_io.all.list, list) {
 		if (ret->state == SMBDIRECT_MR_READY) {
 			ret->state = SMBDIRECT_MR_REGISTERED;
+			kref_get(&ret->kref);
 			spin_unlock_irqrestore(&sc->mr_io.all.lock, flags);
 			atomic_dec(&sc->mr_io.ready.count);
 			atomic_inc(&sc->mr_io.used.count);
@@ -2535,6 +2585,8 @@ struct smbdirect_mr_io *smbd_register_mr(struct smbd_connection *info,
 		return NULL;
 	}
 
+	mutex_lock(&mr->mutex);
+
 	mr->dir = writing ? DMA_FROM_DEVICE : DMA_TO_DEVICE;
 	mr->need_invalidate = need_invalidate;
 	mr->sgt.nents = 0;
@@ -2578,8 +2630,16 @@ struct smbdirect_mr_io *smbd_register_mr(struct smbd_connection *info,
 	 * on the next ib_post_send when we actually send I/O to remote peer
 	 */
 	rc = ib_post_send(sc->ib.qp, &reg_wr->wr, NULL);
-	if (!rc)
+	if (!rc) {
+		/*
+		 * get_mr() gave us a reference
+		 * via kref_get(&mr->kref), we keep that and let
+		 * the caller use smbd_deregister_mr()
+		 * to remove it again.
+		 */
+		mutex_unlock(&mr->mutex);
 		return mr;
+	}
 
 	log_rdma_mr(ERR, "ib_post_send failed rc=%x reg_wr->key=%x\n",
 		rc, reg_wr->key);
@@ -2596,6 +2656,25 @@ struct smbdirect_mr_io *smbd_register_mr(struct smbd_connection *info,
 
 	smbd_disconnect_rdma_connection(sc);
 
+	/*
+	 * get_mr() gave us a reference
+	 * via kref_get(&mr->kref), we need to remove it again
+	 * on error.
+	 *
+	 * No kref_put_mutex() as it's already locked.
+	 *
+	 * If smbd_mr_free_locked() is called
+	 * and the mutex is unlocked and mr is gone,
+	 * in that case kref_put() returned 1.
+	 *
+	 * If kref_put() returned 0 we know that
+	 * smbd_mr_free_locked() didn't
+	 * run. Not by us nor by anyone else, as we
+	 * still hold the mutex, so we need to unlock.
+	 */
+	if (!kref_put(&mr->kref, smbd_mr_free_locked))
+		mutex_unlock(&mr->mutex);
+
 	return NULL;
 }
 
@@ -2624,6 +2703,15 @@ void smbd_deregister_mr(struct smbdirect_mr_io *mr)
 {
 	struct smbdirect_socket *sc = mr->socket;
 
+	mutex_lock(&mr->mutex);
+	if (mr->state == SMBDIRECT_MR_DISABLED)
+		goto put_kref;
+
+	if (sc->status != SMBDIRECT_SOCKET_CONNECTED) {
+		smbd_mr_disable_locked(mr);
+		goto put_kref;
+	}
+
 	if (mr->need_invalidate) {
 		struct ib_send_wr *wr = &mr->inv_wr;
 		int rc;
@@ -2640,6 +2728,7 @@ void smbd_deregister_mr(struct smbdirect_mr_io *mr)
 		rc = ib_post_send(sc->ib.qp, wr, NULL);
 		if (rc) {
 			log_rdma_mr(ERR, "ib_post_send failed rc=%x\n", rc);
+			smbd_mr_disable_locked(mr);
 			smbd_disconnect_rdma_connection(sc);
 			goto done;
 		}
@@ -2671,6 +2760,24 @@ void smbd_deregister_mr(struct smbdirect_mr_io *mr)
 done:
 	if (atomic_dec_and_test(&sc->mr_io.used.count))
 		wake_up(&sc->mr_io.cleanup.wait_queue);
+
+put_kref:
+	/*
+	 * No kref_put_mutex() as it's already locked.
+	 *
+	 * If smbd_mr_free_locked() is called
+	 * and the mutex is unlocked and mr is gone,
+	 * in that case kref_put() returned 1.
+	 *
+	 * If kref_put() returned 0 we know that
+	 * smbd_mr_free_locked() didn't
+	 * run. Not by us nor by anyone else, as we
+	 * still hold the mutex, so we need to unlock
+	 * and keep the mr in SMBDIRECT_MR_READY or
+	 * SMBDIRECT_MR_ERROR state.
+	 */
+	if (!kref_put(&mr->kref, smbd_mr_free_locked))
+		mutex_unlock(&mr->mutex);
 }
 
 static bool smb_set_sge(struct smb_extract_to_rdma *rdma,
-- 
2.43.0


