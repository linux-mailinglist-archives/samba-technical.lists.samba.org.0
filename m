Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C045B34D41
	for <lists+samba-technical@lfdr.de>; Mon, 25 Aug 2025 23:01:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=esOBMe2OD1Uapcu8r0Pu3uLsSoI+JwT/ADRwNrVUblY=; b=K725fxrSC2/8VtM4ts0SK8SGcY
	uGsV9hs+lYF0T366j/r4IDzxbWw22Q/z3OA1cx/s9nvfA3kTy3exQbBh3WjkqVCsQ65629Jj/ScBj
	XTYP+FH7YWQRUzE171H9rYW7yvPQUDAWMY4vxT/3L+gzcTWkOFGE9mEmZWxmoEZn0+KTRIs/YZuMc
	N8Q1nzvlDMVKrGPrWP906nk7C2B90VJARLwoPj3Can3SdYIIoyAKRSLHYBdLSzFEaH1IkRJDEYv/J
	3fB4ZnblfacPPkX6KE88soJVlEWUD/Y89CGbMjWNYii+1aWJK++FlB305N6AkdW1elRAdEE/oOKcQ
	l7qOyrow==;
Received: from ip6-localhost ([::1]:58934 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uqeJP-000Sbu-OL; Mon, 25 Aug 2025 21:01:08 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:39554) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uqeFc-000R7s-23
 for samba-technical@lists.samba.org; Mon, 25 Aug 2025 20:57:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=esOBMe2OD1Uapcu8r0Pu3uLsSoI+JwT/ADRwNrVUblY=; b=Ip+rjI50ArV6qNz63OUiWZ7p0Z
 PFffB/XcOUo6v/gl341TLVsIX8KDR2JUmVX91z2aB7/wyKWlH3J4jlXo5aeqvq2/p3ynir05qpHCv
 aO/6Ta13KOIEKHVBUTHyt4TLQgxsiFelcdAxHbrTV1Bx5baKZEU79p2eRIP6IYiTez7Xs9wXRH42y
 3IMC/uuHTcPSxZnMt8swyzv/USvFmKJ2HNfNy56gZwHRX2AuU5YhAlspzUQkgWj/XDsI9yLahzggD
 soBMi62BlkHAEUIRkT+a5AlDLPt47KwsuK8/nq454YCuQq0roxVx77bXUFJUbE7NkaSqPyKDPKjr0
 Km2vA5t2qnwqKa+90OhStLn/L3IIFx1Stu6gY2BbusIz6hEbNXMU6nQ1sZ305+doUo6jYPzTPNS35
 2IxCp3lg4I13jNn3WtsyA1GyUsDfGYCyYio/PYE1P6hX9XgjMW/B38oB6hsdylWXHDlNcYIajZ/D4
 a0bNimNl/ueEyK3zy531GXNh;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uqeFZ-000mHi-0f; Mon, 25 Aug 2025 20:57:09 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v4 092/142] smb: server: only turn into
 SMBDIRECT_SOCKET_CONNECTED when negotiation is done
Date: Mon, 25 Aug 2025 22:40:53 +0200
Message-ID: <1ecccf94ce53a7626385ce403e079ec3e31789fb.1756139607.git.metze@samba.org>
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

From SMBDIRECT_SOCKET_CREATED we now go via the following
stages:

1. SMBDIRECT_SOCKET_RDMA_CONNECT_NEEDED
   This indicated rdma_accept needs to be called

2. SMBDIRECT_SOCKET_RDMA_CONNECT_RUNNING
   This waits for RDMA_CM_EVENT_ESTABLISHED to
   arrive

3. SMBDIRECT_SOCKET_NEGOTIATE_NEEDED
   This waits for the negotiate request to
   arrive

4. SMBDIRECT_SOCKET_NEGOTIATE_RUNNING
   This indicates the negotiate request
   arrived and needs to be processed

5. SMBDIRECT_SOCKET_CONNECTED
   The connection is ready to use

This avoids the extra 'bool negotiation_requested'
and makes the steps more clear.

In future we may want to add trace points when
changing the states, which would be useful for
debugging.

Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
---
 fs/smb/server/transport_rdma.c | 83 ++++++++++++++++++++++++++++------
 1 file changed, 68 insertions(+), 15 deletions(-)

diff --git a/fs/smb/server/transport_rdma.c b/fs/smb/server/transport_rdma.c
index adab3f0e19e5..5a64139c1961 100644
--- a/fs/smb/server/transport_rdma.c
+++ b/fs/smb/server/transport_rdma.c
@@ -113,8 +113,6 @@ struct smb_direct_transport {
 	struct work_struct	send_immediate_work;
 	struct work_struct	disconnect_work;
 
-	bool			negotiation_requested;
-
 	bool			legacy_iwarp;
 	u8			initiator_depth;
 	u8			responder_resources;
@@ -255,19 +253,52 @@ static void smb_direct_disconnect_rdma_work(struct work_struct *work)
 			     disconnect_work);
 	struct smbdirect_socket *sc = &t->socket;
 
-	if (sc->status == SMBDIRECT_SOCKET_CONNECTED) {
+	/*
+	 * make sure this and other work is not queued again
+	 * but here we don't block and avoid
+	 * disable[_delayed]_work_sync()
+	 */
+	disable_work(&t->disconnect_work);
+	disable_work(&t->post_recv_credits_work);
+	disable_work(&t->send_immediate_work);
+
+	switch (sc->status) {
+	case SMBDIRECT_SOCKET_NEGOTIATE_NEEDED:
+	case SMBDIRECT_SOCKET_NEGOTIATE_RUNNING:
+	case SMBDIRECT_SOCKET_NEGOTIATE_FAILED:
+	case SMBDIRECT_SOCKET_CONNECTED:
 		sc->status = SMBDIRECT_SOCKET_DISCONNECTING;
 		rdma_disconnect(sc->rdma.cm_id);
+		break;
+
+	case SMBDIRECT_SOCKET_CREATED:
+	case SMBDIRECT_SOCKET_RESOLVE_ADDR_NEEDED:
+	case SMBDIRECT_SOCKET_RESOLVE_ADDR_RUNNING:
+	case SMBDIRECT_SOCKET_RESOLVE_ADDR_FAILED:
+	case SMBDIRECT_SOCKET_RESOLVE_ROUTE_NEEDED:
+	case SMBDIRECT_SOCKET_RESOLVE_ROUTE_RUNNING:
+	case SMBDIRECT_SOCKET_RESOLVE_ROUTE_FAILED:
+	case SMBDIRECT_SOCKET_RDMA_CONNECT_NEEDED:
+	case SMBDIRECT_SOCKET_RDMA_CONNECT_RUNNING:
+	case SMBDIRECT_SOCKET_RDMA_CONNECT_FAILED:
+		/*
+		 * rdma_accept() never reached
+		 * RDMA_CM_EVENT_ESTABLISHED
+		 */
+		sc->status = SMBDIRECT_SOCKET_DISCONNECTED;
+		break;
+
+	case SMBDIRECT_SOCKET_DISCONNECTING:
+	case SMBDIRECT_SOCKET_DISCONNECTED:
+	case SMBDIRECT_SOCKET_DESTROYED:
+		break;
 	}
 }
 
 static void
 smb_direct_disconnect_rdma_connection(struct smb_direct_transport *t)
 {
-	struct smbdirect_socket *sc = &t->socket;
-
-	if (sc->status == SMBDIRECT_SOCKET_CONNECTED)
-		queue_work(smb_direct_wq, &t->disconnect_work);
+	queue_work(smb_direct_wq, &t->disconnect_work);
 }
 
 static void smb_direct_send_immediate_work(struct work_struct *work)
@@ -510,9 +541,9 @@ static void recv_done(struct ib_cq *cq, struct ib_wc *wc)
 			smb_direct_disconnect_rdma_connection(t);
 			return;
 		}
-		t->negotiation_requested = true;
 		sc->recv_io.reassembly.full_packet_received = true;
-		sc->status = SMBDIRECT_SOCKET_CONNECTED;
+		WARN_ON_ONCE(sc->status != SMBDIRECT_SOCKET_NEGOTIATE_NEEDED);
+		sc->status = SMBDIRECT_SOCKET_NEGOTIATE_RUNNING;
 		enqueue_reassembly(t, recvmsg, 0);
 		wake_up(&sc->status_wait);
 		return;
@@ -1482,7 +1513,8 @@ static int smb_direct_cm_handler(struct rdma_cm_id *cm_id,
 
 	switch (event->event) {
 	case RDMA_CM_EVENT_ESTABLISHED: {
-		sc->status = SMBDIRECT_SOCKET_CONNECTED;
+		WARN_ON_ONCE(sc->status != SMBDIRECT_SOCKET_RDMA_CONNECT_RUNNING);
+		sc->status = SMBDIRECT_SOCKET_NEGOTIATE_NEEDED;
 		wake_up(&sc->status_wait);
 		break;
 	}
@@ -1491,6 +1523,7 @@ static int smb_direct_cm_handler(struct rdma_cm_id *cm_id,
 		ib_drain_qp(sc->ib.qp);
 
 		sc->status = SMBDIRECT_SOCKET_DISCONNECTED;
+		smb_direct_disconnect_rdma_work(&sc->disconnect_work);
 		wake_up_all(&sc->status_wait);
 		wake_up_all(&sc->recv_io.reassembly.wait_queue);
 		wake_up_all(&t->wait_send_credits);
@@ -1547,6 +1580,8 @@ static int smb_direct_send_negotiate_response(struct smb_direct_transport *t,
 		resp->min_version = SMB_DIRECT_VERSION_LE;
 		resp->max_version = SMB_DIRECT_VERSION_LE;
 		resp->status = STATUS_NOT_SUPPORTED;
+
+		sc->status = SMBDIRECT_SOCKET_NEGOTIATE_FAILED;
 	} else {
 		resp->status = STATUS_SUCCESS;
 		resp->min_version = SMB_DIRECT_VERSION_LE;
@@ -1563,6 +1598,7 @@ static int smb_direct_send_negotiate_response(struct smb_direct_transport *t,
 				cpu_to_le32(sp->max_fragmented_recv_size);
 
 		sc->recv_io.expected = SMBDIRECT_EXPECT_DATA_TRANSFER;
+		sc->status = SMBDIRECT_SOCKET_CONNECTED;
 	}
 
 	sendmsg->sge[0].addr = ib_dma_map_single(sc->ib.dev,
@@ -1618,6 +1654,8 @@ static int smb_direct_accept_client(struct smb_direct_transport *t)
 	conn_param.rnr_retry_count = SMB_DIRECT_CM_RNR_RETRY;
 	conn_param.flow_control = 0;
 
+	WARN_ON_ONCE(sc->status != SMBDIRECT_SOCKET_RDMA_CONNECT_NEEDED);
+	sc->status = SMBDIRECT_SOCKET_RDMA_CONNECT_RUNNING;
 	ret = rdma_accept(sc->rdma.cm_id, &conn_param);
 	if (ret) {
 		pr_err("error at rdma_accept: %d\n", ret);
@@ -1632,6 +1670,9 @@ static int smb_direct_prepare_negotiation(struct smb_direct_transport *t)
 	int ret;
 	struct smbdirect_recv_io *recvmsg;
 
+	WARN_ON_ONCE(sc->status != SMBDIRECT_SOCKET_CREATED);
+	sc->status = SMBDIRECT_SOCKET_RDMA_CONNECT_NEEDED;
+
 	sc->recv_io.expected = SMBDIRECT_EXPECT_NEGOTIATE_REQ;
 
 	recvmsg = get_free_recvmsg(t);
@@ -1644,7 +1685,6 @@ static int smb_direct_prepare_negotiation(struct smb_direct_transport *t)
 		goto out_err;
 	}
 
-	t->negotiation_requested = false;
 	ret = smb_direct_accept_client(t);
 	if (ret) {
 		pr_err("Can't accept client\n");
@@ -1925,12 +1965,25 @@ static int smb_direct_prepare(struct ksmbd_transport *t)
 	struct smbdirect_negotiate_req *req;
 	int ret;
 
+	/*
+	 * We are waiting to pass the following states:
+	 *
+	 * SMBDIRECT_SOCKET_RDMA_CONNECT_NEEDED
+	 * SMBDIRECT_SOCKET_RDMA_CONNECT_RUNNING
+	 * SMBDIRECT_SOCKET_NEGOTIATE_NEEDED
+	 *
+	 * To finally get to SMBDIRECT_SOCKET_NEGOTIATE_RUNNING
+	 * in order to continue below.
+	 *
+	 * Everything else is unexpected and an error.
+	 */
 	ksmbd_debug(RDMA, "Waiting for SMB_DIRECT negotiate request\n");
 	ret = wait_event_interruptible_timeout(sc->status_wait,
-					       st->negotiation_requested ||
-					       sc->status == SMBDIRECT_SOCKET_DISCONNECTED,
-					       SMB_DIRECT_NEGOTIATE_TIMEOUT * HZ);
-	if (ret <= 0 || sc->status == SMBDIRECT_SOCKET_DISCONNECTED)
+					sc->status != SMBDIRECT_SOCKET_RDMA_CONNECT_NEEDED &&
+					sc->status != SMBDIRECT_SOCKET_RDMA_CONNECT_RUNNING &&
+					sc->status != SMBDIRECT_SOCKET_NEGOTIATE_NEEDED,
+					SMB_DIRECT_NEGOTIATE_TIMEOUT * HZ);
+	if (ret <= 0 || sc->status != SMBDIRECT_SOCKET_NEGOTIATE_RUNNING)
 		return ret < 0 ? ret : -ETIMEDOUT;
 
 	recvmsg = get_first_reassembly(st);
-- 
2.43.0


