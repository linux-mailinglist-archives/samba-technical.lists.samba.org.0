Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 22DEAB34D59
	for <lists+samba-technical@lfdr.de>; Mon, 25 Aug 2025 23:02:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=npZ7k2MO6CPbmHylc1eLNv+ws+xfZTRY6vmvyvF/acg=; b=nvMwVUXHulV2uVcDA6TtZsKVXw
	RV8+YxdXoy/hX4xMJ8kWlaUBQABvOnOklV/YDqzu6fNLbV/UCR5+fiEecZuH7RAAP0yVGiQcZ17e1
	fEgl15FTQA8zmIFOzeikLgZZAqol11rY1z/PjdNdiB2XW7M3lUhlwNAQXfg8bvRSFyr/hLGCTDcFS
	H4vxiig6LG+ywfBHH838BPHVLTdIJ+7B7/WtuzhsjMNuTJxOydQzyo4kWCcrgfwM+863oDthFQXi8
	qn86Zbke2y7Uv7ajBhg2YzC07f90483So7nWYqQlmnhKf04vAbpbN96HudYIL3P84H/AH8Nqk5FNV
	QehM5TMQ==;
Received: from ip6-localhost ([::1]:23566 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uqeKV-000T71-Pt; Mon, 25 Aug 2025 21:02:16 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:56966) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uqeGV-000RTu-1u
 for samba-technical@lists.samba.org; Mon, 25 Aug 2025 20:58:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=npZ7k2MO6CPbmHylc1eLNv+ws+xfZTRY6vmvyvF/acg=; b=RMgFnhuIOEjNzIK9oFsqf2kP8j
 3hBhipo3ziPZI0FmcH4oFHKh50bW4c/JYPasXIC8m1HlJDZRpVZKKM+Hq5KQaYSD+CEgYjOoQm/p+
 kfN9lCNHdgxRtIoPigc6DWZQ07yfu8suO8kennzOPVJf2fRut37dCmfpfwCJp/IpgPaX0Uv2iZ+O6
 YjPs4FP2Dc0JXXr5NB10dVjlXbYD82XnguFVvMJfSdnuJaE3TJxAk82FFjRczKYJALfaEfjirNMwf
 h1zzSV7oRwx6uNXm2Em2TfXiIOu3ZP9OU53DNIN6tqZXtu3M/220WMZvR3DORPB40PVVM4egMJh52
 Pa4Q3g+OdGDLrX2RO/au+xDcus3C55sQt6XlhnnOHSdu+5cDh0/ySzTjvjWQHc0z79qOTbqTskEiP
 IGzXS5cEz8EnU5I0XIO/4Cmq8t40OiUCRkjqaRj5iIiwdVCI6Dcdo791O4xuO8NpNWRVE1VHxfNnx
 HhTGYw2YfEfyPQ+Lww2/Woq4;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uqeGT-000mTq-0F; Mon, 25 Aug 2025 20:58:05 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v4 098/142] smb: server: make use of
 smbdirect_socket.send_io.pending.{count, wait_queue}
Date: Mon, 25 Aug 2025 22:40:59 +0200
Message-ID: <15e99e9490c6562e81d0f525526a91ee05f822a1.1756139607.git.metze@samba.org>
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
 Tom Talpey <tom@talpey.com>, Namjae Jeon <linkinjeon@kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This will is used by the client already and will allow to create
common helper functions.

Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
---
 fs/smb/server/transport_rdma.c | 26 ++++++++++----------------
 1 file changed, 10 insertions(+), 16 deletions(-)

diff --git a/fs/smb/server/transport_rdma.c b/fs/smb/server/transport_rdma.c
index 62e13112a2b6..fd8d3fbdfa6c 100644
--- a/fs/smb/server/transport_rdma.c
+++ b/fs/smb/server/transport_rdma.c
@@ -106,9 +106,6 @@ struct smb_direct_transport {
 	wait_queue_head_t	wait_send_credits;
 	wait_queue_head_t	wait_rw_credits;
 
-	wait_queue_head_t	wait_send_pending;
-	atomic_t		send_pending;
-
 	struct work_struct	post_recv_credits_work;
 	struct work_struct	send_immediate_work;
 
@@ -341,9 +338,6 @@ static struct smb_direct_transport *alloc_transport(struct rdma_cm_id *cm_id)
 
 	spin_lock_init(&t->receive_credit_lock);
 
-	init_waitqueue_head(&t->wait_send_pending);
-	atomic_set(&t->send_pending, 0);
-
 	spin_lock_init(&t->lock_new_recv_credits);
 
 	INIT_WORK(&t->post_recv_credits_work,
@@ -380,7 +374,7 @@ static void free_transport(struct smb_direct_transport *t)
 	}
 
 	wake_up_all(&t->wait_send_credits);
-	wake_up_all(&t->wait_send_pending);
+	wake_up_all(&sc->send_io.pending.wait_queue);
 
 	disable_work_sync(&t->post_recv_credits_work);
 	disable_work_sync(&t->send_immediate_work);
@@ -834,8 +828,8 @@ static void send_done(struct ib_cq *cq, struct ib_wc *wc)
 		smb_direct_disconnect_rdma_connection(t);
 	}
 
-	if (atomic_dec_and_test(&t->send_pending))
-		wake_up(&t->wait_send_pending);
+	if (atomic_dec_and_test(&sc->send_io.pending.count))
+		wake_up(&sc->send_io.pending.wait_queue);
 
 	/* iterate and free the list of messages in reverse. the list's head
 	 * is invalid.
@@ -868,12 +862,12 @@ static int smb_direct_post_send(struct smb_direct_transport *t,
 	struct smbdirect_socket *sc = &t->socket;
 	int ret;
 
-	atomic_inc(&t->send_pending);
+	atomic_inc(&sc->send_io.pending.count);
 	ret = ib_post_send(sc->ib.qp, wr, NULL);
 	if (ret) {
 		pr_err("failed to post send: %d\n", ret);
-		if (atomic_dec_and_test(&t->send_pending))
-			wake_up(&t->wait_send_pending);
+		if (atomic_dec_and_test(&sc->send_io.pending.count))
+			wake_up(&sc->send_io.pending.wait_queue);
 		smb_direct_disconnect_rdma_connection(t);
 	}
 	return ret;
@@ -1279,8 +1273,8 @@ static int smb_direct_writev(struct ksmbd_transport *t,
 	 * that means all the I/Os have been out and we are good to return
 	 */
 
-	wait_event(st->wait_send_pending,
-		   atomic_read(&st->send_pending) == 0 ||
+	wait_event(sc->send_io.pending.wait_queue,
+		   atomic_read(&sc->send_io.pending.count) == 0 ||
 		   sc->status != SMBDIRECT_SOCKET_CONNECTED);
 	if (sc->status != SMBDIRECT_SOCKET_CONNECTED && ret == 0)
 		ret = -ENOTCONN;
@@ -1616,8 +1610,8 @@ static int smb_direct_send_negotiate_response(struct smb_direct_transport *t,
 		return ret;
 	}
 
-	wait_event(t->wait_send_pending,
-		   atomic_read(&t->send_pending) == 0 ||
+	wait_event(sc->send_io.pending.wait_queue,
+		   atomic_read(&sc->send_io.pending.count) == 0 ||
 		   sc->status != SMBDIRECT_SOCKET_CONNECTED);
 	if (sc->status != SMBDIRECT_SOCKET_CONNECTED)
 		return -ENOTCONN;
-- 
2.43.0


