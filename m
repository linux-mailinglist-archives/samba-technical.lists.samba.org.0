Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id DB469C9D08B
	for <lists+samba-technical@lfdr.de>; Tue, 02 Dec 2025 22:16:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=Ya0Qj70+kvGu9NFjwl313DaX8lRQWJMlE6wmsjNfTxM=; b=k/zh2rgD8vuFsjxigfmBZGd64e
	VRqEhodtYcankEWLeG2ouox6Amxc70Y4Dh296T/SfnGQx2Jj6xYYHlJ0TvZzkx6SWiuUpPAdRjiEa
	bg8qiHs8imNZmOfJ21NswEwPewqzmGTCEFxgyUB/xF1rd1hTcEP6FUZ3AJYxo3LxWiqZthUNQEOWj
	xdNCHFtEpPhOjAHqYvMyboq/IDsiuvZ5wiV+AfXngttNVGWSUv/6OVxcxgR14OEh1V9emIKIxO0ow
	sWcZ3pMdR0fQSPXRI+MZ3t1+wZa4LE/WrWSD8PmBcadT1UQWXMcl/apQep14uqZpNcAfUbM5ZxgoX
	aeA8eR6Q==;
Received: from ip6-localhost ([::1]:62592 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vQXjU-00FbOC-S1; Tue, 02 Dec 2025 21:16:29 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:40342) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vQXjF-00FbLF-CX
 for samba-technical@lists.samba.org; Tue, 02 Dec 2025 21:16:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=Ya0Qj70+kvGu9NFjwl313DaX8lRQWJMlE6wmsjNfTxM=; b=HoWFv4xuGPaLhpFlgq8r/ZBcdC
 8HDqb9aGvfmLOM3qdxmqp3NA0af5DAPPf4xUrRVBmldOeqkXwFksIihKNtLW57GFuDBrg6/SESJXF
 nMdBTdBmVTyh3VdhMJyycEUtRDmUAKWPRF2Ecwfusk6/TQtpxiBn0TdSvZlHaSj10DPnLBB9MGKv5
 Kk2+7ifX+ElrzW5v3vZ7senpA3s/jhlZqPHPWqRmB3xgfB72xfQvfR/z/GTHB1tDfx1cC7ChmTPVd
 BfjmBVAeatFACJt3mVQ25X8VtpRHTmu/cqogOHhsJvYHcb9GndANY7PAesdEOlaoLM/dZM6EBYm6Z
 I9PBafH9S4qy34B1ipM0JEM7sSCSi+bZ8w2UY1i60RDz8+jLhsCnWWqJapoRqmqdxCuTi+vhi4Dtz
 j4Pc3jV7A294UN5e6D/Mc47lC+9sDzdF2HoqCHOxw0+Fs+pmhupXszM8jaFNxqgU5J656qb1a7bUo
 FCN67HAP8oxVd9wF7yCYdlip;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vQXjE-00GhtZ-0g; Tue, 02 Dec 2025 21:16:08 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [RFC PATCH 4/4] fs/smb/server/transport_rdma.c TMP DEBUG connect work
Date: Tue,  2 Dec 2025 22:15:27 +0100
Message-ID: <53e2be7feb1149b88f2dcb6fdc5a0098cfd96067.1764709225.git.metze@samba.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1764709225.git.metze@samba.org>
References: <cover.1764709225.git.metze@samba.org>
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
Cc: metze@samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

irdma in roce mode with Windows 2025 as client:

root@rdmatest04l0:~# dmesg -e| grep 0000000010731e17
[  +0.002358] [   T6642] ksmbd: smb_direct: smb_direct_prepare_negotiation:2121: 0000000010731e17 0 0 7 RDMA_CONNECT_NEEDED
[  +0.002087] [   T6642] ksmbd: smb_direct: smb_direct_prepare_negotiation:2134: 0000000010731e17 0 0 8 RDMA_CONNECT_RUNNING
[  +0.000112] [   T8824] ksmbd: smb_direct: smb_direct_prepare:2479: 0000000010731e17 0 0 8 RDMA_CONNECT_RUNNING
[  +0.000019] [    T330] ksmbd: smb_direct: smb_direct_negotiate_recv_done: 0000000010731e17 RDMA_CONNECT_RUNNING
[  +0.000018] [   T6642] ksmbd: smb_direct: smb_direct_cm_handler: 0000000010731e17 RDMA_CONNECT_RUNNING
[  +0.000004] [   T6642] ksmbd: smb_direct: smb_direct_cm_handler: 0000000010731e17 NEGOTIATE_NEEDED queue_work(smb_direct_negotiate_recv_work)
[  +0.000010] [    T561] ksmbd: smb_direct: smb_direct_negotiate_recv_work:842: 0000000010731e17 0 0 10 NEGOTIATE_NEEDED
[  +0.000002] [    T561] ksmbd: smb_direct: smb_direct_negotiate_recv_work:854: 0000000010731e17 0 0 10 NEGOTIATE_NEEDED
[  +0.000001] [    T561] ksmbd: smb_direct: smb_direct_negotiate_recv_work:880: 0000000010731e17 0 0 10 NEGOTIATE_NEEDED
[  +0.000003] [    T561] ksmbd: smb_direct: smb_direct_negotiate_recv_work:892: 0000000010731e17 0 0 11 NEGOTIATE_RUNNING
[  +0.000002] [   T8824] ksmbd: smb_direct: smb_direct_prepare:2491: 0000000010731e17 0 0 11 NEGOTIATE_RUNNING
[  +0.000012] [   T8824] ksmbd: smb_direct: smb_direct_prepare:2505: 0000000010731e17 0 0 11 NEGOTIATE_RUNNING
[  +0.000006] [   T8824] ksmbd: smb_direct: smb_direct_prepare:2516: 0000000010731e17 0 0 11 NEGOTIATE_RUNNING
[  +0.000003] [   T8824] ksmbd: smb_direct: smb_direct_prepare:2536: 0000000010731e17 0 0 11 NEGOTIATE_RUNNING
[  +0.000008] [   T8824] ksmbd: smb_direct: smb_direct_prepare:2556: 0000000010731e17 0 0 11 NEGOTIATE_RUNNING
[  +0.000036] [   T8824] ksmbd: smb_direct: smb_direct_prepare:2579: 0000000010731e17 0 0 11 NEGOTIATE_RUNNING
[  +0.000106] [   T8824] ksmbd: smb_direct: smb_direct_prepare:2589: 0000000010731e17 0 0 13 CONNECTED

root@rdmatest04l0:~# dmesg -e| grep 00000000d50d5bf5
[  +0.002987] [   T4211] ksmbd: smb_direct: smb_direct_prepare_negotiation:2120: 00000000d50d5bf5 0 0 7 RDMA_CONNECT_NEEDED
[  +0.002146] [   T4211] ksmbd: smb_direct: smb_direct_prepare_negotiation:2133: 00000000d50d5bf5 0 0 8 RDMA_CONNECT_RUNNING
[  +0.000101] [   T6659] ksmbd: smb_direct: smb_direct_prepare:2478: 00000000d50d5bf5 0 0 8 RDMA_CONNECT_RUNNING
[  +0.000012] [   T4339] ksmbd: smb_direct: smb_direct_cm_handler: 00000000d50d5bf5 RDMA_CONNECT_RUNNING
[  +0.000011] [   T4339] ksmbd: smb_direct: smb_direct_cm_handler: 00000000d50d5bf5 NEGOTIATE_NEEDED queue_work(no-op)
[  +0.000073] [    T239] ksmbd: smb_direct: smb_direct_negotiate_recv_done: 00000000d50d5bf5 NEGOTIATE_NEEDED
[  +0.000023] [    T239] ksmbd: smb_direct: smb_direct_negotiate_recv_work:841: 00000000d50d5bf5 0 0 10 NEGOTIATE_NEEDED
[  +0.000009] [    T239] ksmbd: smb_direct: smb_direct_negotiate_recv_work:853: 00000000d50d5bf5 0 0 10 NEGOTIATE_NEEDED
[  +0.000009] [    T239] ksmbd: smb_direct: smb_direct_negotiate_recv_work:879: 00000000d50d5bf5 0 0 10 NEGOTIATE_NEEDED
[  +0.000004] [    T239] ksmbd: smb_direct: smb_direct_negotiate_recv_work:891: 00000000d50d5bf5 0 0 11 NEGOTIATE_RUNNING
[  +0.001212] [   T6659] ksmbd: smb_direct: smb_direct_prepare:2490: 00000000d50d5bf5 0 0 11 NEGOTIATE_RUNNING
[  +0.000004] [   T6659] ksmbd: smb_direct: smb_direct_prepare:2504: 00000000d50d5bf5 0 0 11 NEGOTIATE_RUNNING
[  +0.000002] [   T6659] ksmbd: smb_direct: smb_direct_prepare:2515: 00000000d50d5bf5 0 0 11 NEGOTIATE_RUNNING
[  +0.000003] [   T6659] ksmbd: smb_direct: smb_direct_prepare:2535: 00000000d50d5bf5 0 0 11 NEGOTIATE_RUNNING
[  +0.000005] [   T6659] ksmbd: smb_direct: smb_direct_prepare:2555: 00000000d50d5bf5 0 0 11 NEGOTIATE_RUNNING
[  +0.000210] [   T6659] ksmbd: smb_direct: smb_direct_prepare:2578: 00000000d50d5bf5 0 0 11 NEGOTIATE_RUNNING
[  +0.000080] [   T6659] ksmbd: smb_direct: smb_direct_prepare:2588: 00000000d50d5bf5 0 0 13 CONNECTED
---
 fs/smb/server/transport_rdma.c | 146 +++++++++++++++++++++++++++++++++
 1 file changed, 146 insertions(+)

diff --git a/fs/smb/server/transport_rdma.c b/fs/smb/server/transport_rdma.c
index f585359684d4..36be95ebcfcc 100644
--- a/fs/smb/server/transport_rdma.c
+++ b/fs/smb/server/transport_rdma.c
@@ -454,12 +454,28 @@ static void free_transport(struct smb_direct_transport *t)
 	struct smbdirect_socket *sc = &t->socket;
 	struct smbdirect_recv_io *recvmsg;
 
+	pr_notice("%s:%u: %p %d %1pe %d %s\n",
+		  __func__, __LINE__,
+		  sc,
+		  sc->first_error,
+		  SMBDIRECT_DEBUG_ERR_PTR(sc->first_error),
+		  sc->status,
+		  smbdirect_socket_status_string(sc->status));
+
 	disable_work_sync(&sc->disconnect_work);
 	if (sc->status < SMBDIRECT_SOCKET_DISCONNECTING)
 		smb_direct_disconnect_rdma_work(&sc->disconnect_work);
 	if (sc->status < SMBDIRECT_SOCKET_DISCONNECTED)
 		wait_event(sc->status_wait, sc->status == SMBDIRECT_SOCKET_DISCONNECTED);
 
+	pr_notice("%s:%u: %p %d %1pe %d %s\n",
+		  __func__, __LINE__,
+		  sc,
+		  sc->first_error,
+		  SMBDIRECT_DEBUG_ERR_PTR(sc->first_error),
+		  sc->status,
+		  smbdirect_socket_status_string(sc->status));
+
 	/*
 	 * Wake up all waiters in all wait queues
 	 * in order to notice the broken connection.
@@ -474,6 +490,14 @@ static void free_transport(struct smb_direct_transport *t)
 	disable_delayed_work_sync(&sc->idle.timer_work);
 	disable_work_sync(&sc->idle.immediate_work);
 
+	pr_notice("%s:%u: %p %d %1pe %d %s\n",
+		  __func__, __LINE__,
+		  sc,
+		  sc->first_error,
+		  SMBDIRECT_DEBUG_ERR_PTR(sc->first_error),
+		  sc->status,
+		  smbdirect_socket_status_string(sc->status));
+
 	if (sc->rdma.cm_id)
 		rdma_lock_handler(sc->rdma.cm_id);
 
@@ -801,6 +825,7 @@ static void smb_direct_negotiate_recv_done(struct ib_cq *cq, struct ib_wc *wc)
 	spin_lock_irqsave(&sc->connect.lock, flags);
 	if (!sc->first_error) {
 		INIT_WORK(&sc->connect.work, smb_direct_negotiate_recv_work);
+		pr_notice("%s: %p %s\n", __func__, sc, smbdirect_socket_status_string(sc->status));
 		if (sc->status == SMBDIRECT_SOCKET_NEGOTIATE_NEEDED)
 			queue_work(sc->workqueue, &sc->connect.work);
 	}
@@ -814,10 +839,25 @@ static void smb_direct_negotiate_recv_work(struct work_struct *work)
 	const struct smbdirect_socket_parameters *sp = &sc->parameters;
 	struct smbdirect_recv_io *recv_io;
 
+	pr_notice("%s:%u: %p %d %1pe %d %s\n",
+		  __func__, __LINE__,
+		  sc,
+		  sc->first_error,
+		  SMBDIRECT_DEBUG_ERR_PTR(sc->first_error),
+		  sc->status,
+		  smbdirect_socket_status_string(sc->status));
+
 	if (sc->first_error)
 		return;
 
 	ksmbd_debug(RDMA, "Negotiate Recv Work running\n");
+	pr_notice("%s:%u: %p %d %1pe %d %s\n",
+		  __func__, __LINE__,
+		  sc,
+		  sc->first_error,
+		  SMBDIRECT_DEBUG_ERR_PTR(sc->first_error),
+		  sc->status,
+		  smbdirect_socket_status_string(sc->status));
 
 	/*
 	 * Reset timer to the keepalive interval in
@@ -837,11 +877,25 @@ static void smb_direct_negotiate_recv_work(struct work_struct *work)
 		return;
 	}
 
+	pr_notice("%s:%u: %p %d %1pe %d %s\n",
+		  __func__, __LINE__,
+		  sc,
+		  sc->first_error,
+		  SMBDIRECT_DEBUG_ERR_PTR(sc->first_error),
+		  sc->status,
+		  smbdirect_socket_status_string(sc->status));
 	if (SMBDIRECT_CHECK_STATUS_WARN(sc, SMBDIRECT_SOCKET_NEGOTIATE_NEEDED)) {
 		smb_direct_disconnect_rdma_connection(sc);
 		return;
 	}
 	sc->status = SMBDIRECT_SOCKET_NEGOTIATE_RUNNING;
+	pr_notice("%s:%u: %p %d %1pe %d %s\n",
+		  __func__, __LINE__,
+		  sc,
+		  sc->first_error,
+		  SMBDIRECT_DEBUG_ERR_PTR(sc->first_error),
+		  sc->status,
+		  smbdirect_socket_status_string(sc->status));
 	wake_up(&sc->status_wait);
 }
 
@@ -1816,6 +1870,14 @@ static void smb_direct_disconnect(struct ksmbd_transport *t)
 	struct smbdirect_socket *sc = &st->socket;
 
 	ksmbd_debug(RDMA, "Disconnecting cm_id=%p\n", sc->rdma.cm_id);
+	pr_notice("%s:%u: %p %d %1pe %d %s\n",
+		  __func__, __LINE__,
+		  sc,
+		  sc->first_error,
+		  SMBDIRECT_DEBUG_ERR_PTR(sc->first_error),
+		  sc->status,
+		  smbdirect_socket_status_string(sc->status));
+
 
 	free_transport(st);
 }
@@ -1826,6 +1888,13 @@ static void smb_direct_shutdown(struct ksmbd_transport *t)
 	struct smbdirect_socket *sc = &st->socket;
 
 	ksmbd_debug(RDMA, "smb-direct shutdown cm_id=%p\n", sc->rdma.cm_id);
+	pr_notice("%s:%u: %p %d %1pe %d %s\n",
+		  __func__, __LINE__,
+		  sc,
+		  sc->first_error,
+		  SMBDIRECT_DEBUG_ERR_PTR(sc->first_error),
+		  sc->status,
+		  smbdirect_socket_status_string(sc->status));
 
 	smb_direct_disconnect_rdma_work(&sc->disconnect_work);
 }
@@ -1856,10 +1925,15 @@ static int smb_direct_cm_handler(struct rdma_cm_id *cm_id,
 		 * yet. sc->connect.work is still be disabled and
 		 * queue_work() is a no-op.
 		 */
+		pr_notice("%s: %p %s\n", __func__, sc, smbdirect_socket_status_string(sc->status));
 		if (SMBDIRECT_CHECK_STATUS_DISCONNECT(sc, SMBDIRECT_SOCKET_RDMA_CONNECT_RUNNING))
 			break;
 		sc->status = SMBDIRECT_SOCKET_NEGOTIATE_NEEDED;
 		spin_lock_irqsave(&sc->connect.lock, flags);
+		pr_notice("%s: %p %s %s\n", __func__, sc, smbdirect_socket_status_string(sc->status),
+			  sc->connect.work.func == smb_direct_negotiate_recv_work ?
+			  "queue_work(smb_direct_negotiate_recv_work)":
+			  "queue_work(no-op)");
 		if (!sc->first_error)
 			queue_work(sc->workqueue, &sc->connect.work);
 		spin_unlock_irqrestore(&sc->connect.lock, flags);
@@ -1869,7 +1943,9 @@ static int smb_direct_cm_handler(struct rdma_cm_id *cm_id,
 	case RDMA_CM_EVENT_DEVICE_REMOVAL:
 	case RDMA_CM_EVENT_DISCONNECTED: {
 		sc->status = SMBDIRECT_SOCKET_DISCONNECTED;
+		pr_notice("%s: %p %s\n", __func__, sc, smbdirect_socket_status_string(sc->status));
 		smb_direct_disconnect_rdma_work(&sc->disconnect_work);
+		pr_notice("%s: %p %s\n", __func__, sc, smbdirect_socket_status_string(sc->status));
 		if (sc->ib.qp)
 			ib_drain_qp(sc->ib.qp);
 		break;
@@ -2042,12 +2118,26 @@ static int smb_direct_prepare_negotiation(struct smbdirect_socket *sc)
 	}
 	recv_posted = true;
 
+	pr_notice("%s:%u: %p %d %1pe %d %s\n",
+		  __func__, __LINE__,
+		  sc,
+		  sc->first_error,
+		  SMBDIRECT_DEBUG_ERR_PTR(sc->first_error),
+		  sc->status,
+		  smbdirect_socket_status_string(sc->status));
 	ret = smb_direct_accept_client(sc);
 	if (ret) {
 		pr_err("Can't accept client\n");
 		goto out_err;
 	}
 
+	pr_notice("%s:%u: %p %d %1pe %d %s\n",
+		  __func__, __LINE__,
+		  sc,
+		  sc->first_error,
+		  SMBDIRECT_DEBUG_ERR_PTR(sc->first_error),
+		  sc->status,
+		  smbdirect_socket_status_string(sc->status));
 	return 0;
 out_err:
 	/*
@@ -2386,11 +2476,25 @@ static int smb_direct_prepare(struct ksmbd_transport *t)
 	 * Everything else is unexpected and an error.
 	 */
 	ksmbd_debug(RDMA, "Waiting for SMB_DIRECT negotiate request\n");
+	pr_notice("%s:%u: %p %d %1pe %d %s\n",
+		  __func__, __LINE__,
+		  sc,
+		  sc->first_error,
+		  SMBDIRECT_DEBUG_ERR_PTR(sc->first_error),
+		  sc->status,
+		  smbdirect_socket_status_string(sc->status));
 	ret = wait_event_interruptible_timeout(sc->status_wait,
 					sc->status != SMBDIRECT_SOCKET_RDMA_CONNECT_NEEDED &&
 					sc->status != SMBDIRECT_SOCKET_RDMA_CONNECT_RUNNING &&
 					sc->status != SMBDIRECT_SOCKET_NEGOTIATE_NEEDED,
 					msecs_to_jiffies(sp->negotiate_timeout_msec));
+	pr_notice("%s:%u: %p %d %1pe %d %s\n",
+		  __func__, __LINE__,
+		  sc,
+		  sc->first_error,
+		  SMBDIRECT_DEBUG_ERR_PTR(sc->first_error),
+		  sc->status,
+		  smbdirect_socket_status_string(sc->status));
 	if (ret <= 0 || sc->status != SMBDIRECT_SOCKET_NEGOTIATE_RUNNING)
 		return ret < 0 ? ret : -ETIMEDOUT;
 
@@ -2398,10 +2502,24 @@ static int smb_direct_prepare(struct ksmbd_transport *t)
 	if (!recvmsg)
 		return -ECONNABORTED;
 
+	pr_notice("%s:%u: %p %d %1pe %d %s\n",
+		  __func__, __LINE__,
+		  sc,
+		  sc->first_error,
+		  SMBDIRECT_DEBUG_ERR_PTR(sc->first_error),
+		  sc->status,
+		  smbdirect_socket_status_string(sc->status));
 	ret = smb_direct_check_recvmsg(recvmsg);
 	if (ret)
 		goto put;
 
+	pr_notice("%s:%u: %p %d %1pe %d %s\n",
+		  __func__, __LINE__,
+		  sc,
+		  sc->first_error,
+		  SMBDIRECT_DEBUG_ERR_PTR(sc->first_error),
+		  sc->status,
+		  smbdirect_socket_status_string(sc->status));
 	req = (struct smbdirect_negotiate_req *)recvmsg->packet;
 	sp->max_recv_size = min_t(int, sp->max_recv_size,
 				  le32_to_cpu(req->preferred_send_size));
@@ -2415,6 +2533,13 @@ static int smb_direct_prepare(struct ksmbd_transport *t)
 	sc->recv_io.credits.target = min_t(u16, sc->recv_io.credits.target, sp->recv_credit_max);
 	sc->recv_io.credits.target = max_t(u16, sc->recv_io.credits.target, 1);
 
+	pr_notice("%s:%u: %p %d %1pe %d %s\n",
+		  __func__, __LINE__,
+		  sc,
+		  sc->first_error,
+		  SMBDIRECT_DEBUG_ERR_PTR(sc->first_error),
+		  sc->status,
+		  smbdirect_socket_status_string(sc->status));
 put:
 	spin_lock_irqsave(&sc->recv_io.reassembly.lock, flags);
 	sc->recv_io.reassembly.queue_length--;
@@ -2428,6 +2553,13 @@ static int smb_direct_prepare(struct ksmbd_transport *t)
 	if (ret)
 		goto respond;
 
+	pr_notice("%s:%u: %p %d %1pe %d %s\n",
+		  __func__, __LINE__,
+		  sc,
+		  sc->first_error,
+		  SMBDIRECT_DEBUG_ERR_PTR(sc->first_error),
+		  sc->status,
+		  smbdirect_socket_status_string(sc->status));
 	/*
 	 * We negotiated with success, so we need to refill the recv queue.
 	 * We do that with sc->idle.immediate_work still being disabled
@@ -2444,9 +2576,23 @@ static int smb_direct_prepare(struct ksmbd_transport *t)
 		return sc->first_error;
 	INIT_WORK(&sc->idle.immediate_work, smb_direct_send_immediate_work);
 
+	pr_notice("%s:%u: %p %d %1pe %d %s\n",
+		  __func__, __LINE__,
+		  sc,
+		  sc->first_error,
+		  SMBDIRECT_DEBUG_ERR_PTR(sc->first_error),
+		  sc->status,
+		  smbdirect_socket_status_string(sc->status));
 respond:
 	ret = smb_direct_send_negotiate_response(sc, ret);
 
+	pr_notice("%s:%u: %p %d %1pe %d %s\n",
+		  __func__, __LINE__,
+		  sc,
+		  sc->first_error,
+		  SMBDIRECT_DEBUG_ERR_PTR(sc->first_error),
+		  sc->status,
+		  smbdirect_socket_status_string(sc->status));
 	return ret;
 }
 
-- 
2.43.0


