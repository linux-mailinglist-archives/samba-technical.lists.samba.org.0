Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E200FB34C79
	for <lists+samba-technical@lfdr.de>; Mon, 25 Aug 2025 22:47:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=ZIhQaRxMkYVMsl0ihg/Dg9eZwEjdCuYf2mHcUi5L4lw=; b=CMXgDEY7i3V88rSoY6GRmdqkeM
	VHBX2bJmgMVFF2+bA5fgav/FHCODv/niVRWpy5X8qUEx42de8q07jhFCHNZmdTdAD1PhsyfJ+Dk7p
	+fuGnSSF83Y73QeENStgAovJXETEGtQ3q66TEbIBrkXisl6iM+hNUxSGvVHclL8YHQYi8l5xBJalo
	udb49D/Y0HmBUGBuNbxyG13Hpr+LwvWXSiTCfSbXgHx2xxTwzG1mXk1vC9DABj2IcmYSPTr7uKP1r
	/KpF36TEl9kLl2dmTIlbLpzYHjn/zN1ffFlzHC85yf45u4TJCJ9bhBGX96c/aU+XVTUxmRDVBnSU7
	1dcnOCGA==;
Received: from ip6-localhost ([::1]:58918 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uqe5j-000N1k-80; Mon, 25 Aug 2025 20:46:59 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:34360) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uqe4Z-000Mbr-G1
 for samba-technical@lists.samba.org; Mon, 25 Aug 2025 20:45:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=ZIhQaRxMkYVMsl0ihg/Dg9eZwEjdCuYf2mHcUi5L4lw=; b=xqZsH3wQheQy4qb+f4UuyvPeB5
 9TU5SPeSM26ZzVTyJbfWhIqz16bKHO2JiW1EAZlGLz39aomPNzDJX4mN9mcDwp8oPQQ7YSizZ75H3
 aiZhnHolHVseFooJxies7neDKJRzEPqInwG6mJ0Wp1wGwFF/D2ynRBn19CUbNMLRp9Cz7L20MZ99d
 JBwfl1mu8XZmFwG0SOHLsv9YBCox4aDghyxOKpOjDNbt4q9fDiQn11b0w6cvbXhC8CRf+D2jbkhRH
 t66zMKU8uKu7Pv3pulF9vpQ+QI49/TTEH2cDdyB0BBkg0m7NK7Upn/K1gAahOOWbCCPsPLrJsesJc
 hYg6fefy6St/v05SifhSvmudtxKNgigOanH1lwhQQ8p08A095Ce7bmVwPdb0TBfB4go9MIdue85f5
 PDFArvxia5mCVQ0j0E0/Uh9UXwDfnfQUh5RXaS5JZyfdlooGOBtbYTUqY6OhSkUWZgaT9N6ph/0g4
 nKDmwQSn4nIq6d+d7vSlphll;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uqe4U-000jvD-2E; Mon, 25 Aug 2025 20:45:44 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v4 023/142] smb: client: make only use of wake_up[_all]() in
 smbdirect.c
Date: Mon, 25 Aug 2025 22:39:44 +0200
Message-ID: <14f5f90e1b6ffdb3a44ee5bb114805a525af40cc.1756139607.git.metze@samba.org>
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

wake_up_interruptible[_all]() doesn't wake up tasks waiting
with wait_event().

So we better wake_up[_all]() in order to wake up all tasks in order
to simplify the logic.

As we currently don't use any wait_event_*_exclusive() it
doesn't really matter if we use wake_up() or wake_up_all().
But in this patch I try to use wake_up() for expected situations
and wake_up_all() for situations of a broken connection.
So don't need to adjust things in future when we
may use wait_event_*_exclusive() in order to wake up
only one process that should make progress.

Changing the wait_event_*() code in order to keep
wait_event(), wait_event_interruptible() and
wait_event_interruptible_timeout() or
changing them to wait_event_killable(),
wait_event_killable_timeout(),
wait_event_killable_exclusive()
is something to think about in a future patch.

The goal here is to avoid that some tasks are not
woken and freeze forever.

Also note that this patch only changes the existing
wake_up*() calls. Adding more wake_up*() calls for
other wait queues is also deferred to a future patch.

Link: https://lore.kernel.org/linux-cifs/13851363-0dc9-465c-9ced-3ede4904eef0@samba.org/T/#t
Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: Long Li <longli@microsoft.com>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
---
 fs/smb/client/smbdirect.c | 40 ++++++++++++++++++++-------------------
 1 file changed, 21 insertions(+), 19 deletions(-)

diff --git a/fs/smb/client/smbdirect.c b/fs/smb/client/smbdirect.c
index f28110c7a30f..b67a264a6030 100644
--- a/fs/smb/client/smbdirect.c
+++ b/fs/smb/client/smbdirect.c
@@ -216,27 +216,27 @@ static int smbd_conn_upcall(
 	case RDMA_CM_EVENT_ADDR_RESOLVED:
 		WARN_ON_ONCE(sc->status != SMBDIRECT_SOCKET_RESOLVE_ADDR_RUNNING);
 		sc->status = SMBDIRECT_SOCKET_RESOLVE_ROUTE_NEEDED;
-		wake_up_interruptible(&sc->status_wait);
+		wake_up(&sc->status_wait);
 		break;
 
 	case RDMA_CM_EVENT_ROUTE_RESOLVED:
 		WARN_ON_ONCE(sc->status != SMBDIRECT_SOCKET_RESOLVE_ROUTE_RUNNING);
 		sc->status = SMBDIRECT_SOCKET_RDMA_CONNECT_NEEDED;
-		wake_up_interruptible(&sc->status_wait);
+		wake_up(&sc->status_wait);
 		break;
 
 	case RDMA_CM_EVENT_ADDR_ERROR:
 		log_rdma_event(ERR, "connecting failed event=%s\n", event_name);
 		WARN_ON_ONCE(sc->status != SMBDIRECT_SOCKET_RESOLVE_ADDR_RUNNING);
 		sc->status = SMBDIRECT_SOCKET_RESOLVE_ADDR_FAILED;
-		wake_up_interruptible(&sc->status_wait);
+		wake_up_all(&sc->status_wait);
 		break;
 
 	case RDMA_CM_EVENT_ROUTE_ERROR:
 		log_rdma_event(ERR, "connecting failed event=%s\n", event_name);
 		WARN_ON_ONCE(sc->status != SMBDIRECT_SOCKET_RESOLVE_ROUTE_RUNNING);
 		sc->status = SMBDIRECT_SOCKET_RESOLVE_ROUTE_FAILED;
-		wake_up_interruptible(&sc->status_wait);
+		wake_up_all(&sc->status_wait);
 		break;
 
 	case RDMA_CM_EVENT_ESTABLISHED:
@@ -296,7 +296,7 @@ static int smbd_conn_upcall(
 
 		WARN_ON_ONCE(sc->status != SMBDIRECT_SOCKET_RDMA_CONNECT_RUNNING);
 		sc->status = SMBDIRECT_SOCKET_NEGOTIATE_NEEDED;
-		wake_up_interruptible(&sc->status_wait);
+		wake_up(&sc->status_wait);
 		break;
 
 	case RDMA_CM_EVENT_CONNECT_ERROR:
@@ -305,7 +305,7 @@ static int smbd_conn_upcall(
 		log_rdma_event(ERR, "connecting failed event=%s\n", event_name);
 		WARN_ON_ONCE(sc->status != SMBDIRECT_SOCKET_RDMA_CONNECT_RUNNING);
 		sc->status = SMBDIRECT_SOCKET_RDMA_CONNECT_FAILED;
-		wake_up_interruptible(&sc->status_wait);
+		wake_up_all(&sc->status_wait);
 		break;
 
 	case RDMA_CM_EVENT_DEVICE_REMOVAL:
@@ -314,14 +314,14 @@ static int smbd_conn_upcall(
 		if (sc->status == SMBDIRECT_SOCKET_NEGOTIATE_FAILED) {
 			log_rdma_event(ERR, "event=%s during negotiation\n", event_name);
 			sc->status = SMBDIRECT_SOCKET_DISCONNECTED;
-			wake_up(&sc->status_wait);
+			wake_up_all(&sc->status_wait);
 			break;
 		}
 
 		sc->status = SMBDIRECT_SOCKET_DISCONNECTED;
-		wake_up_interruptible(&sc->status_wait);
-		wake_up_interruptible(&sc->recv_io.reassembly.wait_queue);
-		wake_up_interruptible_all(&info->wait_send_queue);
+		wake_up_all(&sc->status_wait);
+		wake_up_all(&sc->recv_io.reassembly.wait_queue);
+		wake_up_all(&info->wait_send_queue);
 		break;
 
 	default:
@@ -498,7 +498,7 @@ static void smbd_post_send_credits(struct work_struct *work)
 	struct smbdirect_socket *sc = &info->socket;
 
 	if (sc->status != SMBDIRECT_SOCKET_CONNECTED) {
-		wake_up(&info->wait_receive_queues);
+		wake_up_all(&info->wait_receive_queues);
 		return;
 	}
 
@@ -575,12 +575,14 @@ static void recv_done(struct ib_cq *cq, struct ib_wc *wc)
 			process_negotiation_response(response, wc->byte_len);
 		put_receive_buffer(info, response);
 		WARN_ON_ONCE(sc->status != SMBDIRECT_SOCKET_NEGOTIATE_RUNNING);
-		if (!negotiate_done)
+		if (!negotiate_done) {
 			sc->status = SMBDIRECT_SOCKET_NEGOTIATE_FAILED;
-		else
+			wake_up_all(&sc->status_wait);
+		} else {
 			sc->status = SMBDIRECT_SOCKET_CONNECTED;
+			wake_up(&sc->status_wait);
+		}
 
-		wake_up_interruptible(&sc->status_wait);
 		return;
 
 	/* SMBD data transfer packet */
@@ -608,7 +610,7 @@ static void recv_done(struct ib_cq *cq, struct ib_wc *wc)
 			 * We have new send credits granted from remote peer
 			 * If any sender is waiting for credits, unblock it
 			 */
-			wake_up_interruptible(&info->wait_send_queue);
+			wake_up(&info->wait_send_queue);
 		}
 
 		log_incoming(INFO, "data flags %d data_offset %d data_length %d remaining_data_length %d\n",
@@ -630,7 +632,7 @@ static void recv_done(struct ib_cq *cq, struct ib_wc *wc)
 		 */
 		if (data_length) {
 			enqueue_reassembly(info, response, data_length);
-			wake_up_interruptible(&sc->recv_io.reassembly.wait_queue);
+			wake_up(&sc->recv_io.reassembly.wait_queue);
 		} else
 			put_receive_buffer(info, response);
 
@@ -1486,7 +1488,7 @@ void smbd_destroy(struct TCP_Server_Info *server)
 	 * path when sending data, and then release memory registrations.
 	 */
 	log_rdma_event(INFO, "freeing mr list\n");
-	wake_up_interruptible_all(&info->wait_mr);
+	wake_up_all(&info->wait_mr);
 	while (atomic_read(&info->mr_used_count)) {
 		cifs_server_unlock(server);
 		msleep(1000);
@@ -2185,7 +2187,7 @@ static void smbd_mr_recovery_work(struct work_struct *work)
 		 * get_mr() from the I/O issuing CPUs
 		 */
 		if (atomic_inc_return(&info->mr_ready_count) == 1)
-			wake_up_interruptible(&info->wait_mr);
+			wake_up(&info->wait_mr);
 	}
 }
 
@@ -2496,7 +2498,7 @@ int smbd_deregister_mr(struct smbd_mr *smbdirect_mr)
 			smbdirect_mr->dir);
 		smbdirect_mr->state = MR_READY;
 		if (atomic_inc_return(&info->mr_ready_count) == 1)
-			wake_up_interruptible(&info->wait_mr);
+			wake_up(&info->wait_mr);
 	} else
 		/*
 		 * Schedule the work to do MR recovery for future I/Os MR
-- 
2.43.0


