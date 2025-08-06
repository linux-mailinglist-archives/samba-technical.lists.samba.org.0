Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id BDDD6B1CB27
	for <lists+samba-technical@lfdr.de>; Wed,  6 Aug 2025 19:39:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=dTOMMUIW2KY5BfMsYCpzjFkojakrZ59i4jXt37SMiWQ=; b=aKuEYgrBTtGWE1AGoYXwV+DJg/
	QaKbeyiIpZ2lcIsxp8PBvjBIxwTyvx61Pbausn31cB2cqSHNGIpbDlEEl2vhIyOESACVmeKKybnnp
	d/BhcO5xZgWkNI1TivXvrHvvg8cYjTPBDwSDJWAOwbNZ8VhMYb37jzcyQ+Vdssydzpfiwf3xAxDoN
	bPYqCgY5ttU9nIKGJRluVetEGqIhsf1mPWCoUWcV6FrSHNBWqbicg45fXgD2dAiLVYKJY3shhavVe
	0eDNZJBw3VqLQ5vE1my56LJzyGjGPuCVysnGXToyJDNCON0n31e/neQ48yIPqMfAkzDKItu5O2fbI
	oV9fV9IQ==;
Received: from ip6-localhost ([::1]:48396 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uji6o-00ESR4-0x; Wed, 06 Aug 2025 17:39:26 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:58338) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uji5T-00ERzD-Pb
 for samba-technical@lists.samba.org; Wed, 06 Aug 2025 17:38:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=dTOMMUIW2KY5BfMsYCpzjFkojakrZ59i4jXt37SMiWQ=; b=npqxkO8/1nwxJhQ7ArF1ZHB0OV
 i3QAKcUWw8gJj4knNjl8S1F2EdEsIQeYuLjXTRuAc+SkgMTf+P6lz8Q7ZAiMhcx8NxQlxFjd08eyb
 Wp5aG7gnkMcW0fa8y718cljCOJeDcy/1CC/KQa72PJ5FwGYEeVkcxElKedUDLIdfYjXYTOtS1FLAV
 6RKrI1UnWtKl6TcpS6tMMiOQHlwERtjM/31XiDVEy/f30unoGs/pGhFTrABrNQeKaBbOe/ayVMPl/
 rCz6mChX9kOFFtFZ7VK/pDPHqpBCtuNvWMNJYt77F0u5QJvfJnvTnQ508KUMulsIQgchGVxmsKw/T
 a40/6Ycv6EseMTSnOkM+jsZ4p/eJtMGtKJTnR5TK3jO3kyJ39CmdhOPIn60vt76FqZGnwo5WUlr8S
 iRnqY0BHAJUWtn/Yt6ucsvf21QKEGnCPuvAQqY+x3Ws+esmEvDlyJTB12XInkVG8Qwi1AKYfGeRj9
 Fu3TsBtFvwsrJ+VbnrxEUOES;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uji5M-001OoR-0h; Wed, 06 Aug 2025 17:37:56 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH 14/18] smb: server: make use of
 smbdirect_socket.recv_io.free.{list, lock}
Date: Wed,  6 Aug 2025 19:36:00 +0200
Message-ID: <9aa189b1dd0b2d6730c456f7cb8361a8dfd07230.1754501401.git.metze@samba.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1754501401.git.metze@samba.org>
References: <cover.1754501401.git.metze@samba.org>
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

This is already used by the client and will allow us to
add common helper functions soon.

Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
---
 fs/smb/server/transport_rdma.c | 27 ++++++++++++---------------
 1 file changed, 12 insertions(+), 15 deletions(-)

diff --git a/fs/smb/server/transport_rdma.c b/fs/smb/server/transport_rdma.c
index 26d70396b0c1..aebd29242a2b 100644
--- a/fs/smb/server/transport_rdma.c
+++ b/fs/smb/server/transport_rdma.c
@@ -110,9 +110,6 @@ struct smb_direct_transport {
 	int			count_avail_recvmsg;
 	int			recv_credit_target;
 
-	spinlock_t		recvmsg_queue_lock;
-	struct list_head	recvmsg_queue;
-
 	atomic_t		send_credits;
 	spinlock_t		lock_new_recv_credits;
 	int			new_recv_credits;
@@ -218,16 +215,17 @@ static inline bool is_receive_credit_post_required(int receive_credits,
 static struct
 smbdirect_recv_io *get_free_recvmsg(struct smb_direct_transport *t)
 {
+	struct smbdirect_socket *sc = &t->socket;
 	struct smbdirect_recv_io *recvmsg = NULL;
 
-	spin_lock(&t->recvmsg_queue_lock);
-	if (!list_empty(&t->recvmsg_queue)) {
-		recvmsg = list_first_entry(&t->recvmsg_queue,
+	spin_lock(&sc->recv_io.free.lock);
+	if (!list_empty(&sc->recv_io.free.list)) {
+		recvmsg = list_first_entry(&sc->recv_io.free.list,
 					   struct smbdirect_recv_io,
 					   list);
 		list_del(&recvmsg->list);
 	}
-	spin_unlock(&t->recvmsg_queue_lock);
+	spin_unlock(&sc->recv_io.free.lock);
 	return recvmsg;
 }
 
@@ -244,9 +242,9 @@ static void put_recvmsg(struct smb_direct_transport *t,
 		recvmsg->sge.length = 0;
 	}
 
-	spin_lock(&t->recvmsg_queue_lock);
-	list_add(&recvmsg->list, &t->recvmsg_queue);
-	spin_unlock(&t->recvmsg_queue_lock);
+	spin_lock(&sc->recv_io.free.lock);
+	list_add(&recvmsg->list, &sc->recv_io.free.list);
+	spin_unlock(&sc->recv_io.free.lock);
 }
 
 static void enqueue_reassembly(struct smb_direct_transport *t,
@@ -326,6 +324,9 @@ static struct smb_direct_transport *alloc_transport(struct rdma_cm_id *cm_id)
 
 	sc->ib.dev = sc->rdma.cm_id->device;
 
+	INIT_LIST_HEAD(&sc->recv_io.free.list);
+	spin_lock_init(&sc->recv_io.free.lock);
+
 	sc->status = SMBDIRECT_SOCKET_CREATED;
 	init_waitqueue_head(&t->wait_status);
 
@@ -338,8 +339,6 @@ static struct smb_direct_transport *alloc_transport(struct rdma_cm_id *cm_id)
 	init_waitqueue_head(&t->wait_rw_credits);
 
 	spin_lock_init(&t->receive_credit_lock);
-	spin_lock_init(&t->recvmsg_queue_lock);
-	INIT_LIST_HEAD(&t->recvmsg_queue);
 
 	init_waitqueue_head(&t->wait_send_pending);
 	atomic_set(&t->send_pending, 0);
@@ -1851,15 +1850,13 @@ static int smb_direct_create_pools(struct smb_direct_transport *t)
 	if (!t->recvmsg_mempool)
 		goto err;
 
-	INIT_LIST_HEAD(&t->recvmsg_queue);
-
 	for (i = 0; i < sp->recv_credit_max; i++) {
 		recvmsg = mempool_alloc(t->recvmsg_mempool, KSMBD_DEFAULT_GFP);
 		if (!recvmsg)
 			goto err;
 		recvmsg->socket = sc;
 		recvmsg->sge.length = 0;
-		list_add(&recvmsg->list, &t->recvmsg_queue);
+		list_add(&recvmsg->list, &sc->recv_io.free.list);
 	}
 	t->count_avail_recvmsg = sp->recv_credit_max;
 
-- 
2.43.0


