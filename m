Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 20B81B34D3D
	for <lists+samba-technical@lfdr.de>; Mon, 25 Aug 2025 23:01:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=YT629rrj6zYtwgxCKfuuU3IQs13JsbJ61roDIgiUG0M=; b=QqRm9BiqIpREumEGmPd+byY4Xn
	INKylR/qLlFwFXhly5y9OnD9ZLR0oBCS328y8f4/TH3LMBA+JWpDy8ZA1S+VLP/gosVVCym+jWkV4
	b/md6kYhumqJHZjFLsWMtreu6SENFEkBrYR0oF8KJCktobz8fBHEoBh9rZsuQLFi2imFIK407Ihl8
	tbnm0w48boYT1LKB8hohKS6d87+HdntJD8u/xRlfo+G+RRJhxWye3XcMv0GfwUKSv8yd+VT+US5Uu
	waOohzzVdF0VYyVCJ3Nn2mdtWJV7HBP/kV1P1H11D26nr0UtZ2LbVRYmgMVp4TaYKSKVe/k8ezLbw
	52G3+jqw==;
Received: from ip6-localhost ([::1]:49596 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uqeJ8-000SXe-I2; Mon, 25 Aug 2025 21:00:51 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:48946) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uqeFS-000R3S-34
 for samba-technical@lists.samba.org; Mon, 25 Aug 2025 20:57:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=YT629rrj6zYtwgxCKfuuU3IQs13JsbJ61roDIgiUG0M=; b=ag1KxWQf3VHpF96FlmxEKMFSr4
 3DlQQbiEbHANRCrPKuvsrJ6qmqpYretfK+qRTXvOVQFBscxn4mstQ4nhGIZIrYsR3o4pyVYFyS59l
 SShzVsfgdcLQEtcnKOG975GiRWR8j6EePQV8q9HcdhpDxHvINkjpPM+SkrfMg7YCMcxtbU/CwNyI+
 zKN6+1TBmrKYudoaKzPSs7b2GyRs+WaRr7/1xy2ZWl2OYHgEuIVP0YSUcYSvsNxjnS/u4lzoozu16
 YLIo42yyYXaq/z9jySLGZnnFocQ4levHWXGBIadGob4Sph8THYCDPxL6qMfI5y+yBtu3kvk2E02WW
 qQ8FSlQ4cu+sNzMBSLJq+8IlVoSSQlJN3RfnpYWC7KeeORfjonQgmMahrUC1kVDE0GfZC+aNSEDWf
 oCZLUY98RkdJSL4fGwA5QxIAiEeEPqBYHtKa5Nq3DBAahO6vFtLCuyJEBldL+65xcF0pHniUj75j0
 7Yv6N3yJyNJlqWrBHYxLjleh;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uqeFO-000mFw-0g; Mon, 25 Aug 2025 20:56:58 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v4 091/142] smb: server: make use of
 smbdirect_socket.status_wait
Date: Mon, 25 Aug 2025 22:40:52 +0200
Message-ID: <cddac861eccf6d4589062470788abb1e45170b43.1756139607.git.metze@samba.org>
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

This will allow us to have common helper functions soon.

Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
---
 fs/smb/server/transport_rdma.c | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/fs/smb/server/transport_rdma.c b/fs/smb/server/transport_rdma.c
index 4f0c7c8cb041..adab3f0e19e5 100644
--- a/fs/smb/server/transport_rdma.c
+++ b/fs/smb/server/transport_rdma.c
@@ -92,8 +92,6 @@ struct smb_direct_transport {
 
 	struct smbdirect_socket socket;
 
-	wait_queue_head_t	wait_status;
-
 	spinlock_t		receive_credit_lock;
 	int			recv_credits;
 	int			recv_credit_target;
@@ -307,7 +305,7 @@ static struct smb_direct_transport *alloc_transport(struct rdma_cm_id *cm_id)
 	spin_lock_init(&sc->recv_io.free.lock);
 
 	sc->status = SMBDIRECT_SOCKET_CREATED;
-	init_waitqueue_head(&t->wait_status);
+	init_waitqueue_head(&sc->status_wait);
 
 	spin_lock_init(&sc->recv_io.reassembly.lock);
 	INIT_LIST_HEAD(&sc->recv_io.reassembly.list);
@@ -516,7 +514,7 @@ static void recv_done(struct ib_cq *cq, struct ib_wc *wc)
 		sc->recv_io.reassembly.full_packet_received = true;
 		sc->status = SMBDIRECT_SOCKET_CONNECTED;
 		enqueue_reassembly(t, recvmsg, 0);
-		wake_up(&t->wait_status);
+		wake_up(&sc->status_wait);
 		return;
 	case SMBDIRECT_EXPECT_DATA_TRANSFER: {
 		struct smbdirect_data_transfer *data_transfer =
@@ -1458,7 +1456,7 @@ static void smb_direct_disconnect(struct ksmbd_transport *t)
 	ksmbd_debug(RDMA, "Disconnecting cm_id=%p\n", sc->rdma.cm_id);
 
 	smb_direct_disconnect_rdma_work(&st->disconnect_work);
-	wait_event_interruptible(st->wait_status,
+	wait_event_interruptible(sc->status_wait,
 				 sc->status == SMBDIRECT_SOCKET_DISCONNECTED);
 	free_transport(st);
 }
@@ -1485,7 +1483,7 @@ static int smb_direct_cm_handler(struct rdma_cm_id *cm_id,
 	switch (event->event) {
 	case RDMA_CM_EVENT_ESTABLISHED: {
 		sc->status = SMBDIRECT_SOCKET_CONNECTED;
-		wake_up(&t->wait_status);
+		wake_up(&sc->status_wait);
 		break;
 	}
 	case RDMA_CM_EVENT_DEVICE_REMOVAL:
@@ -1493,14 +1491,14 @@ static int smb_direct_cm_handler(struct rdma_cm_id *cm_id,
 		ib_drain_qp(sc->ib.qp);
 
 		sc->status = SMBDIRECT_SOCKET_DISCONNECTED;
-		wake_up_all(&t->wait_status);
+		wake_up_all(&sc->status_wait);
 		wake_up_all(&sc->recv_io.reassembly.wait_queue);
 		wake_up_all(&t->wait_send_credits);
 		break;
 	}
 	case RDMA_CM_EVENT_CONNECT_ERROR: {
 		sc->status = SMBDIRECT_SOCKET_DISCONNECTED;
-		wake_up_all(&t->wait_status);
+		wake_up_all(&sc->status_wait);
 		break;
 	}
 	default:
@@ -1928,7 +1926,7 @@ static int smb_direct_prepare(struct ksmbd_transport *t)
 	int ret;
 
 	ksmbd_debug(RDMA, "Waiting for SMB_DIRECT negotiate request\n");
-	ret = wait_event_interruptible_timeout(st->wait_status,
+	ret = wait_event_interruptible_timeout(sc->status_wait,
 					       st->negotiation_requested ||
 					       sc->status == SMBDIRECT_SOCKET_DISCONNECTED,
 					       SMB_DIRECT_NEGOTIATE_TIMEOUT * HZ);
-- 
2.43.0


