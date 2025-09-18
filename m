Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 51F73B85921
	for <lists+samba-technical@lfdr.de>; Thu, 18 Sep 2025 17:26:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=ROEeV6/bs53twvM5/USaWrqxnj7hhOA4GFldd0FLYdE=; b=UsJe5JEym+SeD7J0/E8gsLGGNN
	zvvFTgKJj2jRfHUMZo3l7G0Z5S5TFPobOjWODwoXeBxfV4FlcaK4TUFypKHK/JtgkM5dE1B0MgN7M
	8Oo2PrHybOKf1oS36K+52q5MMHiSCbZa4elbWdVOdDLP8ts1mwRkSogWzaeyfBJBk3H6iqL+2xkJL
	OvoLjyGFLjELzxxqfMAMCb1cxJrPuaupVpkfkvCmRB1P7RIPdU9jujWKCbxl9uNwXg4kfvVhvuysk
	ddlrNJzEk0U+tdDChjrW6AiGauC+XrHxZBX8MQZpTqteZz7SVmtRzi5GBVgbMTMuo3a9AYFNG1/sj
	eMmIxUMw==;
Received: from ip6-localhost ([::1]:39340 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uzGWQ-004DBj-KV; Thu, 18 Sep 2025 15:26:10 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:24160) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uzGWI-004DBb-RQ
 for samba-technical@lists.samba.org; Thu, 18 Sep 2025 15:26:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=ROEeV6/bs53twvM5/USaWrqxnj7hhOA4GFldd0FLYdE=; b=3bXl+Z+FLnQL7aD7MzEwCYa0es
 r9ShVTHl0CXLnxfolFUduZB+NeZ8AshpVJ6wo6jk8EuaWBVSnruciq9Hc9aaQi+6Fint6EkNVmLrG
 wbMmjR1XiZ07iWJoXiMwdgUFq54ZX7dihaKjVfzXCihl8px22drVb2Rx7tO3VVLmx6gTdD2t9SCRp
 R9VG+R/8erbriKfu0d34ov17tgvGLrbCag1Cuqaz+zA+bCbYAVLPjEg30i9IWdC/hYDoyL4dYh1gg
 pX129PIEJtJANBIq7qrqEr+BNWzt18WPD1f0fC6EkRbFKvu3PNCQgte496KDTcmhGHS4SRifysiz3
 zUrICPMrFCOhkog/P25VwhEax8ENLTqicDq1YBbzBVhxrPamnAC8AuOGO7Nt0aiVjqOMIR/+iq82A
 8o3v/mgWMoWMwnHyyX+MIj4pJ3OjuBwaNyLDMlPy4prZsiP0H1Ki7buYSXr3iQwRKl8yDr5022GKp
 gQ0FGkPO3dClgn5Ta8R4T+ER;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uzGWH-004mWv-0a; Thu, 18 Sep 2025 15:26:01 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v2] smb: client: fix sending the iwrap custom IRD/ORD
 negotiation messages
Date: Thu, 18 Sep 2025 17:25:00 +0200
Message-ID: <20250918152459.1244824-2-metze@samba.org>
X-Mailer: git-send-email 2.43.0
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
Cc: Tom Talpey <tom@talpey.com>, linux-rdma@vger.kernel.org, metze@samba.org,
 Steve French <smfrench@gmail.com>, Namjae Jeon <linkinjeon@kernel.org>,
 Steve French <stfrench@microsoft.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Do a real negotiation and check the servers initiator_depth and responder_resources.

This should use big endian in order to be useful.
I have captures of windows clients showing this.

The fact that we used little endian up to now
means that we sent very large numbers and the
negotiation with the server truncated them to the
server limits.

Note the reason why this uses u8 for
initiator_depth and responder_resources is
that the rdma layer also uses it.

The inconsitency regarding the initiator_depth
and responder_resources values being reversed
for iwarp devices in RDMA_CM_EVENT_ESTABLISHED
should also be fixed later, but for now we should
fix it.

Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: Long Li <longli@microsoft.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Cc: linux-rdma@vger.kernel.org
Fixes: c7398583340a ("CIFS: SMBD: Implement RDMA memory registration")
Signed-off-by: Stefan Metzmacher <metze@samba.org>
Signed-off-by: Steve French <stfrench@microsoft.com>
---
 fs/smb/client/smbdirect.c | 110 ++++++++++++++++++++++++++++++++++----
 fs/smb/client/smbdirect.h |   4 +-
 2 files changed, 103 insertions(+), 11 deletions(-)

diff --git a/fs/smb/client/smbdirect.c b/fs/smb/client/smbdirect.c
index a26f677e7adb..30c3ff034816 100644
--- a/fs/smb/client/smbdirect.c
+++ b/fs/smb/client/smbdirect.c
@@ -179,6 +179,8 @@ static int smbd_conn_upcall(
 	struct smbd_connection *info = id->context;
 	struct smbdirect_socket *sc = &info->socket;
 	const char *event_name = rdma_event_msg(event->event);
+	u8 peer_initiator_depth;
+	u8 peer_responder_resources;
 
 	log_rdma_event(INFO, "event=%s status=%d\n",
 		event_name, event->status);
@@ -204,6 +206,85 @@ static int smbd_conn_upcall(
 
 	case RDMA_CM_EVENT_ESTABLISHED:
 		log_rdma_event(INFO, "connected event=%s\n", event_name);
+
+		/*
+		 * Here we work around an inconsistency between
+		 * iWarp and other devices (at least rxe and irdma using RoCEv2)
+		 */
+		if (rdma_protocol_iwarp(id->device, id->port_num)) {
+			/*
+			 * iWarp devices report the peer's values
+			 * with the perspective of the peer here.
+			 * Tested with siw and irdma (in iwarp mode)
+			 * We need to change to our perspective here,
+			 * so we need to switch the values.
+			 */
+			peer_initiator_depth = event->param.conn.responder_resources;
+			peer_responder_resources = event->param.conn.initiator_depth;
+		} else {
+			/*
+			 * Non iWarp devices report the peer's values
+			 * already changed to our perspective here.
+			 * Tested with rxe and irdma (in roce mode).
+			 */
+			peer_initiator_depth = event->param.conn.initiator_depth;
+			peer_responder_resources = event->param.conn.responder_resources;
+		}
+		if (rdma_protocol_iwarp(id->device, id->port_num) &&
+		    event->param.conn.private_data_len == 8) {
+			/*
+			 * Legacy clients with only iWarp MPA v1 support
+			 * need a private blob in order to negotiate
+			 * the IRD/ORD values.
+			 */
+			const __be32 *ird_ord_hdr = event->param.conn.private_data;
+			u32 ird32 = be32_to_cpu(ird_ord_hdr[0]);
+			u32 ord32 = be32_to_cpu(ird_ord_hdr[1]);
+
+			/*
+			 * cifs.ko sends the legacy IRD/ORD negotiation
+			 * event if iWarp MPA v2 was used.
+			 *
+			 * Here we check that the values match and only
+			 * mark the client as legacy if they don't match.
+			 */
+			if ((u32)event->param.conn.initiator_depth != ird32 ||
+			    (u32)event->param.conn.responder_resources != ord32) {
+				/*
+				 * There are broken clients (old cifs.ko)
+				 * using little endian and also
+				 * struct rdma_conn_param only uses u8
+				 * for initiator_depth and responder_resources,
+				 * so we truncate the value to U8_MAX.
+				 *
+				 * smb_direct_accept_client() will then
+				 * do the real negotiation in order to
+				 * select the minimum between client and
+				 * server.
+				 */
+				ird32 = min_t(u32, ird32, U8_MAX);
+				ord32 = min_t(u32, ord32, U8_MAX);
+
+				info->legacy_iwarp = true;
+				peer_initiator_depth = (u8)ird32;
+				peer_responder_resources = (u8)ord32;
+			}
+		}
+
+		/*
+		 * negotiate the value by using the minimum
+		 * between client and server if the client provided
+		 * non 0 values.
+		 */
+		if (peer_initiator_depth != 0)
+			info->initiator_depth =
+					min_t(u8, info->initiator_depth,
+					      peer_initiator_depth);
+		if (peer_responder_resources != 0)
+			info->responder_resources =
+					min_t(u8, info->responder_resources,
+					      peer_responder_resources);
+
 		sc->status = SMBDIRECT_SOCKET_CONNECTED;
 		wake_up_interruptible(&info->status_wait);
 		break;
@@ -1549,7 +1630,7 @@ static struct smbd_connection *_smbd_get_connection(
 	struct ib_qp_init_attr qp_attr;
 	struct sockaddr_in *addr_in = (struct sockaddr_in *) dstaddr;
 	struct ib_port_immutable port_immutable;
-	u32 ird_ord_hdr[2];
+	__be32 ird_ord_hdr[2];
 
 	info = kzalloc(sizeof(struct smbd_connection), GFP_KERNEL);
 	if (!info)
@@ -1557,6 +1638,9 @@ static struct smbd_connection *_smbd_get_connection(
 	sc = &info->socket;
 	sp = &sc->parameters;
 
+	info->initiator_depth = 1;
+	info->responder_resources = SMBD_CM_RESPONDER_RESOURCES;
+
 	sc->status = SMBDIRECT_SOCKET_CONNECTING;
 	rc = smbd_ia_open(info, dstaddr, port);
 	if (rc) {
@@ -1637,22 +1721,22 @@ static struct smbd_connection *_smbd_get_connection(
 	}
 	sc->ib.qp = sc->rdma.cm_id->qp;
 
-	memset(&conn_param, 0, sizeof(conn_param));
-	conn_param.initiator_depth = 0;
-
-	conn_param.responder_resources =
-		min(sc->ib.dev->attrs.max_qp_rd_atom,
-		    SMBD_CM_RESPONDER_RESOURCES);
-	info->responder_resources = conn_param.responder_resources;
+	info->responder_resources =
+		min_t(u8, info->responder_resources,
+		      sc->ib.dev->attrs.max_qp_rd_atom);
 	log_rdma_mr(INFO, "responder_resources=%d\n",
 		info->responder_resources);
 
+	memset(&conn_param, 0, sizeof(conn_param));
+	conn_param.initiator_depth = info->initiator_depth;
+	conn_param.responder_resources = info->responder_resources;
+
 	/* Need to send IRD/ORD in private data for iWARP */
 	sc->ib.dev->ops.get_port_immutable(
 		sc->ib.dev, sc->rdma.cm_id->port_num, &port_immutable);
 	if (port_immutable.core_cap_flags & RDMA_CORE_PORT_IWARP) {
-		ird_ord_hdr[0] = info->responder_resources;
-		ird_ord_hdr[1] = 1;
+		ird_ord_hdr[0] = cpu_to_be32(conn_param.responder_resources);
+		ird_ord_hdr[1] = cpu_to_be32(conn_param.initiator_depth);
 		conn_param.private_data = ird_ord_hdr;
 		conn_param.private_data_len = sizeof(ird_ord_hdr);
 	} else {
@@ -2119,6 +2203,12 @@ static int allocate_mr_list(struct smbd_connection *info)
 	atomic_set(&info->mr_used_count, 0);
 	init_waitqueue_head(&info->wait_for_mr_cleanup);
 	INIT_WORK(&info->mr_recovery_work, smbd_mr_recovery_work);
+
+	if (info->responder_resources == 0) {
+		log_rdma_mr(ERR, "responder_resources negotiated as 0\n");
+		return -EINVAL;
+	}
+
 	/* Allocate more MRs (2x) than hardware responder_resources */
 	for (i = 0; i < info->responder_resources * 2; i++) {
 		smbdirect_mr = kzalloc(sizeof(*smbdirect_mr), GFP_KERNEL);
diff --git a/fs/smb/client/smbdirect.h b/fs/smb/client/smbdirect.h
index e45aa9ddd71d..4ca9b2b2c57f 100644
--- a/fs/smb/client/smbdirect.h
+++ b/fs/smb/client/smbdirect.h
@@ -67,7 +67,9 @@ struct smbd_connection {
 
 	/* Memory registrations */
 	/* Maximum number of RDMA read/write outstanding on this connection */
-	int responder_resources;
+	bool legacy_iwarp;
+	u8 initiator_depth;
+	u8 responder_resources;
 	/* Maximum number of pages in a single RDMA write/read on this connection */
 	int max_frmr_depth;
 	/*
-- 
2.43.0


