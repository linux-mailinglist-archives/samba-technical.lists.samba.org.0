Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 92ABEB34D84
	for <lists+samba-technical@lfdr.de>; Mon, 25 Aug 2025 23:05:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=1LfGV8QwOkPBL/0Sw7z+g85leojC0X/rZoq3/gFpAZU=; b=Y1Yj3VHXDRm+JHvXBD7dwiFrKa
	Vd0Jlpcd+98ovg/vUf0OQEswveaZwBn9vXFiyPHLZQ6U9CAZMTjTqd0+dJQzqB2Hf+j3HN8L1SDrV
	vADvSStrzafaxrPqdGIU2Qw3J4hU0MWtj0JH49kbd4eqgM8sEDMpJfNsABwCLKukXMkvzY6IPWY7Y
	W+cdYIoLUolgj4hjOQE4qaJ9gdVyc0VmbnookmVacvy1HlK68JHKQoSnxg1mJiRCUx++bf92qNA10
	oApeMGXzlfnab83N8UHvXEx/4LENO2Rg4s4C+cMHRxQQA9SbABgLsELiY4VSKD0e3ECpsBPMez8jC
	jV+tnBeA==;
Received: from ip6-localhost ([::1]:61790 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uqeNm-000UUI-7Y; Mon, 25 Aug 2025 21:05:38 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:16386) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uqeJI-000SfX-Q5
 for samba-technical@lists.samba.org; Mon, 25 Aug 2025 21:01:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=1LfGV8QwOkPBL/0Sw7z+g85leojC0X/rZoq3/gFpAZU=; b=D2VxBKbjJ+Kt7D8Z1y6v90Vx24
 ZazSlzxZM+w0oVpxXiLGCjvd99jnl++9jkOhfBCBDtP3G1VpjgkAceuVgUREcP8BH5XvOS7uBYvSv
 vE/hv/irc8YEd5pjD5lK95WlnaoIF6ZMDLv6s+hl7JG0nfRXIg3I49LbgbBr1HZ4C5xl52D3prwDj
 MJBNOmgUch8iJvIgBrlin4JSCLqsJeve6gi2l9NLrZpr5Hhty9dzNNLIvpaMSzBuIwt7JxnWm5HRW
 29XOxycpAyI6gvafLQl2Canx6EQYs4WmNHtnv65PdOS1gAgsdl5802Hu7ZJQbyUvnau1nhLrs1Fa8
 dgSWJ7a15pTLAr8dsrSzaSfEbMMHGuz625oh/CK5jKCDhlUZuSX3f7k7norxcPd+ti/MdiZNqr4hf
 QuY1Oz1T+4Gbd951rqUrz/hdfKsEhzq0UB8KVjuipHgfY3VnFYJZ2RHFTBZ1HZ7cEvZ8IdvOa3/FI
 aAtws5x+TpR02zM9cYtXMSUZ;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uqeJF-000n1L-1v; Mon, 25 Aug 2025 21:00:57 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v4 115/142] smb: server: make use of smbdirect_socket.workqueue
Date: Mon, 25 Aug 2025 22:41:16 +0200
Message-ID: <465f0666cf9c5053546eabd38947d0c261fcacd2.1756139607.git.metze@samba.org>
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

We still use the single global workqueue, but this
will allow us to share common code soon.

Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
---
 fs/smb/server/transport_rdma.c | 22 ++++++++++++----------
 1 file changed, 12 insertions(+), 10 deletions(-)

diff --git a/fs/smb/server/transport_rdma.c b/fs/smb/server/transport_rdma.c
index fb007963e281..9c2f0edab604 100644
--- a/fs/smb/server/transport_rdma.c
+++ b/fs/smb/server/transport_rdma.c
@@ -180,7 +180,7 @@ static void put_recvmsg(struct smb_direct_transport *t,
 	list_add(&recvmsg->list, &sc->recv_io.free.list);
 	spin_unlock(&sc->recv_io.free.lock);
 
-	queue_work(smb_direct_wq, &sc->recv_io.posted.refill_work);
+	queue_work(sc->workqueue, &sc->recv_io.posted.refill_work);
 }
 
 static void enqueue_reassembly(struct smb_direct_transport *t,
@@ -267,7 +267,7 @@ smb_direct_disconnect_rdma_connection(struct smb_direct_transport *t)
 {
 	struct smbdirect_socket *sc = &t->socket;
 
-	queue_work(smb_direct_wq, &sc->disconnect_work);
+	queue_work(sc->workqueue, &sc->disconnect_work);
 }
 
 static void smb_direct_send_immediate_work(struct work_struct *work)
@@ -304,9 +304,9 @@ static void smb_direct_idle_connection_timer(struct work_struct *work)
 	 * in order to wait for a response
 	 */
 	sc->idle.keepalive = SMBDIRECT_KEEPALIVE_PENDING;
-	mod_delayed_work(smb_direct_wq, &sc->idle.timer_work,
+	mod_delayed_work(sc->workqueue, &sc->idle.timer_work,
 			 msecs_to_jiffies(sp->keepalive_timeout_msec));
-	queue_work(smb_direct_wq, &sc->idle.immediate_work);
+	queue_work(sc->workqueue, &sc->idle.immediate_work);
 }
 
 static struct smb_direct_transport *alloc_transport(struct rdma_cm_id *cm_id)
@@ -323,6 +323,8 @@ static struct smb_direct_transport *alloc_transport(struct rdma_cm_id *cm_id)
 	smbdirect_socket_init(sc);
 	sp = &sc->parameters;
 
+	sc->workqueue = smb_direct_wq;
+
 	INIT_WORK(&sc->disconnect_work, smb_direct_disconnect_rdma_work);
 
 	sp->negotiate_timeout_msec = SMB_DIRECT_NEGOTIATE_TIMEOUT * 1000;
@@ -534,7 +536,7 @@ static void recv_done(struct ib_cq *cq, struct ib_wc *wc)
 	 * order to trigger our next keepalive message.
 	 */
 	sc->idle.keepalive = SMBDIRECT_KEEPALIVE_NONE;
-	mod_delayed_work(smb_direct_wq, &sc->idle.timer_work,
+	mod_delayed_work(sc->workqueue, &sc->idle.timer_work,
 			 msecs_to_jiffies(sp->keepalive_interval_msec));
 
 	switch (sc->recv_io.expected) {
@@ -596,14 +598,14 @@ static void recv_done(struct ib_cq *cq, struct ib_wc *wc)
 
 		if (le16_to_cpu(data_transfer->flags) &
 		    SMBDIRECT_FLAG_RESPONSE_REQUESTED)
-			queue_work(smb_direct_wq, &sc->idle.immediate_work);
+			queue_work(sc->workqueue, &sc->idle.immediate_work);
 
 		if (atomic_read(&sc->send_io.credits.count) > 0)
 			wake_up(&sc->send_io.credits.wait_queue);
 
 		if (data_length) {
 			if (sc->recv_io.credits.target > old_recv_credit_target)
-				queue_work(smb_direct_wq, &sc->recv_io.posted.refill_work);
+				queue_work(sc->workqueue, &sc->recv_io.posted.refill_work);
 
 			enqueue_reassembly(t, recvmsg, (int)data_length);
 			wake_up(&sc->recv_io.reassembly.wait_queue);
@@ -812,7 +814,7 @@ static void smb_direct_post_recv_credits(struct work_struct *work)
 	}
 
 	if (credits)
-		queue_work(smb_direct_wq, &sc->idle.immediate_work);
+		queue_work(sc->workqueue, &sc->idle.immediate_work);
 }
 
 static void send_done(struct ib_cq *cq, struct ib_wc *wc)
@@ -884,7 +886,7 @@ static int manage_keep_alive_before_sending(struct smb_direct_transport *t)
 		 * Now use the keepalive timeout (instead of keepalive interval)
 		 * in order to wait for a response
 		 */
-		mod_delayed_work(smb_direct_wq, &sc->idle.timer_work,
+		mod_delayed_work(sc->workqueue, &sc->idle.timer_work,
 				 msecs_to_jiffies(sp->keepalive_timeout_msec));
 		return 1;
 	}
@@ -1703,7 +1705,7 @@ static int smb_direct_accept_client(struct smb_direct_transport *t)
 	 * so that the timer will cause a disconnect.
 	 */
 	sc->idle.keepalive = SMBDIRECT_KEEPALIVE_PENDING;
-	mod_delayed_work(smb_direct_wq, &sc->idle.timer_work,
+	mod_delayed_work(sc->workqueue, &sc->idle.timer_work,
 			 msecs_to_jiffies(sp->negotiate_timeout_msec));
 
 	WARN_ON_ONCE(sc->status != SMBDIRECT_SOCKET_RDMA_CONNECT_NEEDED);
-- 
2.43.0


