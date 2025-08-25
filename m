Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 6975CB34CBE
	for <lists+samba-technical@lfdr.de>; Mon, 25 Aug 2025 22:51:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=FoNiM0rxOF5YGmfhs6wA66VCSk6fFiU7RgSOCDKFbSA=; b=lIL7N1/qCgRXxUX9TSrf3zsM7z
	mmKyjs0kfsiOhZxyt2fIHoQ7kPLd/FK34EBxCJ3B10MS2VS2x0uodvI43Pvnxqq/y51zvCqTq9mdk
	c2Bpu62hpNVOS8uwKdVvsH99oARwZRK0hfD8YyaEizzv4f4M9w1r0uEJJCJ44re7QdJuOJoj5cZse
	27srdp/9bzCw8OOBgSnCqeQBZS3OXxw1qMEfVlFwEjE2lfNeW386UBHfhU9tPOlaIhinFK8CYs+7N
	/xYB3xjbG/6u2n2jUw8T/w6KxI20FH1w8cns+MawDF0hvV0gm+Mg8TClZk6MUFeoWttPTzJtKFjTu
	iexWiuEw==;
Received: from ip6-localhost ([::1]:32434 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uqeAJ-000OsV-Qj; Mon, 25 Aug 2025 20:51:44 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:32080) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uqe8O-000OCK-DK
 for samba-technical@lists.samba.org; Mon, 25 Aug 2025 20:50:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=FoNiM0rxOF5YGmfhs6wA66VCSk6fFiU7RgSOCDKFbSA=; b=pQbjYdwwDC7dlDrrm4oB9GVmrW
 iHa4TbcDEFV3PesQ4esUUntknfGa6o0WIJVQN1+l4Z1Pjs5+QrLFr7PdmSWkejwBVRKlg1/+SQbqH
 WvzIKU+yT+mjSmVuYhi350QYcqw/oEMvdfW3j21oIBoOXBgT8Ht3lyJkCGyksJu/8WCN1UBgY3ChX
 xvXq24OT6mXXaUNnyGQZhbZCNp1RZ2Cj6Y0FEufTK7CekAmYQpMar8rA7HBGACRmXqv5PA9qG6AKy
 wVhuweIWpyIYcDa9SHUjz3ORIWjoIcUSX31JLqzPPfQapee/Po/9z9s0DNOIyMdMn5Et/955sE1rL
 AHf+G9VkwV14zQvpmmLsMExLtyhYNg1brLfVtNdwliuPN84r7w9zNQ+RKsfIUHQn2lRyVigC59YeH
 MJ05E1wEZbQTI6m0e0BQE2QR7zU9lsA43875bQRp6eirwE8mj+zAahfkyHe9zcQMYwcEZQFAoHyRv
 5khdgkGbQSrYt7cZeuhFx/sX;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uqe8M-000knd-2Y; Mon, 25 Aug 2025 20:49:42 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v4 048/142] smb: client: don't check sc->send_io.pending.count
 is below sp->send_credit_target
Date: Mon, 25 Aug 2025 22:40:09 +0200
Message-ID: <02ad437bfe57819274af80b0cd3cd4dff96fbbba.1756139607.git.metze@samba.org>
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

If we were able to get a credit we don't need to prove and wait
that sc->send_io.pending.count is below sp->send_credit_target.

This just adds useless complixity. The same code on the server
also doesn't do this, so we should remove it from the client.

This will make it easier to momve to common code later.

Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: Long Li <longli@microsoft.com>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
---
 fs/smb/client/smbdirect.c | 28 ++++------------------------
 fs/smb/client/smbdirect.h |  3 ---
 2 files changed, 4 insertions(+), 27 deletions(-)

diff --git a/fs/smb/client/smbdirect.c b/fs/smb/client/smbdirect.c
index 2eaddf190354..220ebd00a9d7 100644
--- a/fs/smb/client/smbdirect.c
+++ b/fs/smb/client/smbdirect.c
@@ -414,8 +414,6 @@ static void send_done(struct ib_cq *cq, struct ib_wc *wc)
 	if (atomic_dec_and_test(&sc->send_io.pending.count))
 		wake_up(&sc->send_io.pending.wait_queue);
 
-	wake_up(&info->wait_post_send);
-
 	mempool_free(request, sc->send_io.mem.pool);
 }
 
@@ -1035,23 +1033,6 @@ static int smbd_post_send_iter(struct smbd_connection *info,
 		goto wait_credit;
 	}
 
-wait_send_queue:
-	wait_event(info->wait_post_send,
-		atomic_read(&sc->send_io.pending.count) < sp->send_credit_target ||
-		sc->status != SMBDIRECT_SOCKET_CONNECTED);
-
-	if (sc->status != SMBDIRECT_SOCKET_CONNECTED) {
-		log_outgoing(ERR, "disconnected not sending on wait_send_queue\n");
-		rc = -EAGAIN;
-		goto err_wait_send_queue;
-	}
-
-	if (unlikely(atomic_inc_return(&sc->send_io.pending.count) >
-				sp->send_credit_target)) {
-		atomic_dec(&sc->send_io.pending.count);
-		goto wait_send_queue;
-	}
-
 	request = mempool_alloc(sc->send_io.mem.pool, GFP_KERNEL);
 	if (!request) {
 		rc = -ENOMEM;
@@ -1133,10 +1114,14 @@ static int smbd_post_send_iter(struct smbd_connection *info,
 	request->sge[0].length = header_length;
 	request->sge[0].lkey = sc->ib.pd->local_dma_lkey;
 
+	atomic_inc(&sc->send_io.pending.count);
 	rc = smbd_post_send(info, request);
 	if (!rc)
 		return 0;
 
+	if (atomic_dec_and_test(&sc->send_io.pending.count))
+		wake_up(&sc->send_io.pending.wait_queue);
+
 err_dma:
 	for (i = 0; i < request->num_sge; i++)
 		if (request->sge[i].addr)
@@ -1150,10 +1135,7 @@ static int smbd_post_send_iter(struct smbd_connection *info,
 	atomic_sub(new_credits, &sc->recv_io.credits.count);
 
 err_alloc:
-	if (atomic_dec_and_test(&sc->send_io.pending.count))
-		wake_up(&sc->send_io.pending.wait_queue);
 
-err_wait_send_queue:
 	/* roll back send credits and pending */
 	atomic_inc(&sc->send_io.credits.count);
 
@@ -1862,8 +1844,6 @@ static struct smbd_connection *_smbd_get_connection(
 	mod_delayed_work(info->workqueue, &sc->idle.timer_work,
 			 msecs_to_jiffies(sp->negotiate_timeout_msec));
 
-	init_waitqueue_head(&info->wait_post_send);
-
 	INIT_WORK(&sc->recv_io.posted.refill_work, smbd_post_send_credits);
 
 	rc = smbd_negotiate(info);
diff --git a/fs/smb/client/smbdirect.h b/fs/smb/client/smbdirect.h
index 39a56a54f8b6..8ebbbc0b0499 100644
--- a/fs/smb/client/smbdirect.h
+++ b/fs/smb/client/smbdirect.h
@@ -61,9 +61,6 @@ struct smbd_connection {
 	/* Used by transport to wait until all MRs are returned */
 	wait_queue_head_t wait_for_mr_cleanup;
 
-	/* Activity accounting */
-	wait_queue_head_t wait_post_send;
-
 	struct workqueue_struct *workqueue;
 };
 
-- 
2.43.0


