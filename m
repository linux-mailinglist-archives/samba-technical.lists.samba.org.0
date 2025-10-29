Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 268FBC1AB96
	for <lists+samba-technical@lfdr.de>; Wed, 29 Oct 2025 14:33:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=V6WW9+8oFW2mMprJbZddgqMFsI8UKSNSzqDGgOC3xLs=; b=ulOLsZ5/e+oOS7FxHa7zdJp+R9
	xm9qyTmuNgxNLHTSbrWV7VcGwvhXdKJ7vKC6ytxw+NiHD2H2K8/0AIH+gHawjRGo/zj1Pa1CjJMgD
	csK762J0PsbSGZLUk3pGKg7ugS4EEpqXSDHVmGUycl/iEqoFtOdtf4pj8iPzw1RFvu5OV3g0E9+2D
	CLrYbeEE2IVyWIfeds0Gk8LiKv5z/DYD3IPjpeyg25othssQ1WpnUbNYKgjUmdGH+ZFa2wMpzQpHc
	vmPd4PrCkkge1ZV5tc930d7CQdBOzOGhb5elNCvD6lvMpaFAR921gfwvD3c+C0/wszpnbqteZZE1y
	MPXZvKag==;
Received: from ip6-localhost ([::1]:58666 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vE6J2-0098ZS-0K; Wed, 29 Oct 2025 13:33:40 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:59426) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vE6CP-0096SK-AC
 for samba-technical@lists.samba.org; Wed, 29 Oct 2025 13:26:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=V6WW9+8oFW2mMprJbZddgqMFsI8UKSNSzqDGgOC3xLs=; b=nT6YL1+5zFkT8jJHv5gYS7/0+C
 pZtBaI2sGJD8QR8UTIuECzYMxqpgWvnCkxsm8jMRewhRQ7hNXmfeFNI166EMe9ObjkNrgU6QIyAgP
 iOO5LxHTkmiToyqb+PBIBo4gd98qpEvon1bqyG1JqvM2VUMc+JtkdPVKoEQVVMbdiijWkZGnC6ct3
 dYSPZ6aHkeUHGjvOrbYLTiytI6ePsf82D3OBj+7KegGo+lJz7AuPqhNKuQOxT8kAHPH9XftHMog5b
 3IuuMoCETj0gRwBAe43vqOZu3Q2MT53MW8d8zPivDNMVWmc3FmaBPPMMG35PFal8lqcUUoFfwZINE
 7+A8+9Gh4QsChptsCrmOfThNXkbxkcSlaWrQ/I3XizQQASlea5hjx1hbxr7RZ61XBulCOlFb890ot
 Y8r0qZvIOA+ow4ORGSkR60qxaoF5aZJKv/49XbM+CYoVlO51G8TRJxkHh6btzCbgmRGMIdahEfOFC
 xW4+O6s0ggctkS1gqdrQWIEn;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vE6CM-00Bbpq-0K; Wed, 29 Oct 2025 13:26:46 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v2 043/127] smb: smbdirect: introduce
 smbdirect_connection_negotiation_done()
Date: Wed, 29 Oct 2025 14:20:21 +0100
Message-ID: <9c0a6bdaa10d2701484b061f25a37b07e43b9083.1761742839.git.metze@samba.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1761742839.git.metze@samba.org>
References: <cover.1761742839.git.metze@samba.org>
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

This will be used by client and server in order to turn the
connection into a usable state.

Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: Long Li <longli@microsoft.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
---
 .../common/smbdirect/smbdirect_connection.c   | 47 ++++++++++++++++++-
 1 file changed, 45 insertions(+), 2 deletions(-)

diff --git a/fs/smb/common/smbdirect/smbdirect_connection.c b/fs/smb/common/smbdirect/smbdirect_connection.c
index cb977f014c3a..daab8b5eba49 100644
--- a/fs/smb/common/smbdirect/smbdirect_connection.c
+++ b/fs/smb/common/smbdirect/smbdirect_connection.c
@@ -23,6 +23,8 @@ static void smbdirect_connection_schedule_disconnect(struct smbdirect_socket *sc
 						     int error);
 static void smbdirect_connection_disconnect_work(struct work_struct *work);
 static void smbdirect_connection_idle_timer_work(struct work_struct *work);
+static void smbdirect_connection_recv_io_refill_work(struct work_struct *work);
+static void smbdirect_connection_send_immediate_work(struct work_struct *work);
 
 static void smbdirect_connection_destroy_mr_list(struct smbdirect_socket *sc);
 
@@ -216,6 +218,49 @@ static void smbdirect_connection_rdma_established(struct smbdirect_socket *sc)
 	sc->rdma.expected_event = RDMA_CM_EVENT_DISCONNECTED;
 }
 
+__maybe_unused /* this is temporary while this file is included in orders */
+static void smbdirect_connection_negotiation_done(struct smbdirect_socket *sc)
+{
+	if (unlikely(sc->first_error))
+		return;
+
+	if (sc->status != SMBDIRECT_SOCKET_NEGOTIATE_RUNNING) {
+		/*
+		 * Something went wrong...
+		 */
+		smbdirect_log_rdma_event(sc, SMBDIRECT_LOG_ERR,
+			"status=%s first_error=%1pe local: %pISpsfc remote: %pISpsfc\n",
+			smbdirect_socket_status_string(sc->status),
+			SMBDIRECT_DEBUG_ERR_PTR(sc->first_error),
+			&sc->rdma.cm_id->route.addr.src_addr,
+			&sc->rdma.cm_id->route.addr.dst_addr);
+		return;
+	}
+
+	/*
+	 * We are done, so we can wake up the waiter.
+	 */
+	WARN_ONCE(sc->status == SMBDIRECT_SOCKET_CONNECTED,
+		  "status=%s first_error=%1pe",
+		  smbdirect_socket_status_string(sc->status),
+		  SMBDIRECT_DEBUG_ERR_PTR(sc->first_error));
+	sc->status = SMBDIRECT_SOCKET_CONNECTED;
+
+	/*
+	 * We need to setup the refill and send immediate work
+	 * in order to get a working connection.
+	 */
+	INIT_WORK(&sc->recv_io.posted.refill_work, smbdirect_connection_recv_io_refill_work);
+	INIT_WORK(&sc->idle.immediate_work, smbdirect_connection_send_immediate_work);
+
+	smbdirect_log_rdma_event(sc, SMBDIRECT_LOG_INFO,
+		"negotiated: local: %pISpsfc remote: %pISpsfc\n",
+		&sc->rdma.cm_id->route.addr.src_addr,
+		&sc->rdma.cm_id->route.addr.dst_addr);
+
+	wake_up(&sc->status_wait);
+}
+
 static u32 smbdirect_rdma_rw_send_wrs(struct ib_device *dev,
 				      const struct ib_qp_init_attr *attr)
 {
@@ -1522,7 +1567,6 @@ static void smbdirect_connection_send_io_done(struct ib_cq *cq, struct ib_wc *wc
 	wake_up(&sc->send_io.pending.dec_wait_queue);
 }
 
-__maybe_unused /* this is temporary while this file is included in orders */
 static void smbdirect_connection_send_immediate_work(struct work_struct *work)
 {
 	struct smbdirect_socket *sc =
@@ -1840,7 +1884,6 @@ static int smbdirect_connection_recv_io_refill(struct smbdirect_socket *sc)
 	return posted;
 }
 
-__maybe_unused /* this is temporary while this file is included in orders */
 static void smbdirect_connection_recv_io_refill_work(struct work_struct *work)
 {
 	struct smbdirect_socket *sc =
-- 
2.43.0


