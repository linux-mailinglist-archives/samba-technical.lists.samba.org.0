Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 50328B1B842
	for <lists+samba-technical@lfdr.de>; Tue,  5 Aug 2025 18:16:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=dTOMMUIW2KY5BfMsYCpzjFkojakrZ59i4jXt37SMiWQ=; b=3Y/XAvmPVnt0R7oWKSQI6GiMHQ
	9mWAe/jiR2ebZEoNmz0o6lreALRny7KrWiAIWMhD3KYxFW5fbOk7RPwjBh90LESs20WSuyRFDS//n
	C1m8gCnh14TtdUfN785I8wfht1oO5hz2WFKhCGGOcC6VVwRtQMozLknJTWCEtv9q9eD358Z3thEHL
	dB73+2Cx38Pb9+95t7hikWvbrdwqSPRllSMAsKcDGMPd9Qda4aYL++5fztWeM/q22ePT7lyD4J5Nx
	k1viVSXRL0I4yYhUlPaKNdCufVwN9klZ008mlGI4MiDjDnyZxaYm+GxIx+wpkgblqPOh8JnAHeppd
	2Ed83yRQ==;
Received: from ip6-localhost ([::1]:22568 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ujKKx-00EO20-37; Tue, 05 Aug 2025 16:16:27 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:63508) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1ujKKg-00ENyP-0y
 for samba-technical@lists.samba.org; Tue, 05 Aug 2025 16:16:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=dTOMMUIW2KY5BfMsYCpzjFkojakrZ59i4jXt37SMiWQ=; b=maBdnwhpwUnXkf06OMIyFyrM2P
 UCKS5u3mDSHoXBI2ZpPZXIFm2HIxIhAkwKhKJ0p8RFQvyEGPN6+EZHtxJf6/h52cO2RJ0iKq+QcIp
 X9mYjQtrIzfw9YclWTLHen3X8JSPQUvUBbIjVWBTIhCbkDcigjNylxgKWnSOFnGyTy8rWD48AqHk5
 5BUGQ7devxyoq99RTQfT6++ukUeiTnF7GmJZY530xPFh2kpBn+imGFDiIghSWOi9RijZYf228mfqm
 0v7Oscr0t758RMeK5sDRr/bVC0s1VcGjEFoG+SScBa75reAsu1iKRd3+Fetg9n2rvwpgKbZHPUlEd
 5dbMbrfFNTPD+u4ET03Vwh4l38AlDR5Vg1q64UCui3K1NZNCiX6DyP1okvOKcifMNVh3PRc9HldjM
 M0JofQDVM4wJmjbiIAJlbS8X9hJys9Mzo/aDz4VrXfLTmOTlAvhuL8ka+KL60kJjGT2A7K5PatlqF
 TgfYVWALAF0C9VDbrx/JRDQM;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1ujKKc-001A3h-0q; Tue, 05 Aug 2025 16:16:07 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH 16/17] smb: server: make use of
 smbdirect_socket.recv_io.free.{list, lock}
Date: Tue,  5 Aug 2025 18:13:36 +0200
Message-ID: <3a561e7581f7e5902f2b63b25e238a3252a62ea6.1754409478.git.metze@samba.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1754409478.git.metze@samba.org>
References: <cover.1754409478.git.metze@samba.org>
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


