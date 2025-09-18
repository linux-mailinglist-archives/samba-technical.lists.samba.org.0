Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E954B8592A
	for <lists+samba-technical@lfdr.de>; Thu, 18 Sep 2025 17:27:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=fIHaTXuQ6ex+XU7opMOaP0o4J0tZUt/DTnjrKna1zK8=; b=gO0xpZQ3/tXL6rF4LYZamLEEXw
	bE+TniBTTJ67UBEoVuCogU5VcGzC+FmN/lyxO64WwC3ZyL5Nq1qE/zmOta220NYY8KSEZRxnEMNBO
	7ba+cu9t/hKnRwQo3dPkt9vgcbvdRLw2jEq+uNDrmd3oupzA2tVvZlgkXWvxo7+bwPfmdwuazhfYK
	tgWYJUS/UUWbCFhL5+Uh0dzb0PMKTna/8z0H+b0Q0AU7MWD47IJwJLU7JTX9fh4VRL5VaSoSQkfGT
	VXBfiC0wAXdD92mm3iEyd8duyHtJHrIgACPLNXmjzx5ozDqECB9IONR9URIjSj8lrVAJBpxX/TGm6
	piStOAGg==;
Received: from ip6-localhost ([::1]:51038 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uzGXH-004DGn-Ux; Thu, 18 Sep 2025 15:27:04 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:54418) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uzGXA-004DG7-TN
 for samba-technical@lists.samba.org; Thu, 18 Sep 2025 15:26:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=fIHaTXuQ6ex+XU7opMOaP0o4J0tZUt/DTnjrKna1zK8=; b=HqvfU+a9QcBcQy7IArawJZPOdj
 sHQ8qbboLcpjhD2c06xLtVNbiuDnQ1dT+z3/qiBp4Qqgf9ZTA/6cA5HvQ9rH5VJqJRptEgyeriasc
 Iv2qWbM41A94DLCmXfxvAlLWtMFKg1mxqZDOErRCHoPS79T4wqO5XLHmyBfVuL9gQvZGXQd4rYgV/
 S3spA1tRyNWt8FZpMIXAD2AQbsrApuJ/vE2TpOZE5Vj4d5GD596ugXhLQClN0MzMbuA28qfP9saC0
 W0qv3XtklE3R5aZFVtrYWZw2ZhnfC0oCWcXgnbm0T5dy1T+oNrXDIg2weccZnOrb7OP1V0sP20ST2
 66EVufjRTLcC6GBsayj+rjoJL0qw0J2yobTExtcHLwSxCJZf59fKF+JAAri4Vkl0zLjcQvnnu92gk
 qn7WNswacvNxyzZgUeAeOTFK18hkIq98pezL4k4JIHZTJG2Z1fmwEspV7yaWQpLBP0cmYn4NqJ2Er
 KUw3VLcMpYRrgusvFnDFhBkr;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uzGX9-004mXM-1W; Thu, 18 Sep 2025 15:26:55 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v3] smb: server: fix IRD/ORD negotiation with the client
Date: Thu, 18 Sep 2025 17:26:44 +0200
Message-ID: <20250918152644.1245030-1-metze@samba.org>
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

Already do real negotiation in smb_direct_handle_connect_request()
where we see the requested initiator_depth and responder_resources
from the client.

We should should detect legacy iwarp clients using MPA v1
with the custom IRD/ORD negotiation.

We need to send the custom IRD/ORD in big endian,
but we need to try to let clients with broken requests
using little endian (older cifs.ko) to work.

Note the reason why this uses u8 for
initiator_depth and responder_resources is
that the rdma layer also uses it.

Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Cc: linux-rdma@vger.kernel.org
Fixes: 0626e6641f6b ("cifsd: add server handler for central processing and tranport layers")
Signed-off-by: Stefan Metzmacher <metze@samba.org>
Signed-off-by: Steve French <stfrench@microsoft.com>
---
 fs/smb/server/transport_rdma.c | 99 +++++++++++++++++++++++++++++-----
 1 file changed, 85 insertions(+), 14 deletions(-)

diff --git a/fs/smb/server/transport_rdma.c b/fs/smb/server/transport_rdma.c
index 74dfb6496095..e1f659d3b4cf 100644
--- a/fs/smb/server/transport_rdma.c
+++ b/fs/smb/server/transport_rdma.c
@@ -153,6 +153,10 @@ struct smb_direct_transport {
 	struct work_struct	disconnect_work;
 
 	bool			negotiation_requested;
+
+	bool			legacy_iwarp;
+	u8			initiator_depth;
+	u8			responder_resources;
 };
 
 #define KSMBD_TRANS(t) ((struct ksmbd_transport *)&((t)->transport))
@@ -347,6 +351,9 @@ static struct smb_direct_transport *alloc_transport(struct rdma_cm_id *cm_id)
 	t->cm_id = cm_id;
 	cm_id->context = t;
 
+	t->initiator_depth = SMB_DIRECT_CM_INITIATOR_DEPTH;
+	t->responder_resources = 1;
+
 	t->status = SMB_DIRECT_CS_NEW;
 	init_waitqueue_head(&t->wait_status);
 
@@ -1676,21 +1683,21 @@ static int smb_direct_send_negotiate_response(struct smb_direct_transport *t,
 static int smb_direct_accept_client(struct smb_direct_transport *t)
 {
 	struct rdma_conn_param conn_param;
-	struct ib_port_immutable port_immutable;
-	u32 ird_ord_hdr[2];
+	__be32 ird_ord_hdr[2];
 	int ret;
 
+	/*
+	 * smb_direct_handle_connect_request()
+	 * already negotiated t->initiator_depth
+	 * and t->responder_resources
+	 */
 	memset(&conn_param, 0, sizeof(conn_param));
-	conn_param.initiator_depth = min_t(u8, t->cm_id->device->attrs.max_qp_rd_atom,
-					   SMB_DIRECT_CM_INITIATOR_DEPTH);
-	conn_param.responder_resources = 0;
-
-	t->cm_id->device->ops.get_port_immutable(t->cm_id->device,
-						 t->cm_id->port_num,
-						 &port_immutable);
-	if (port_immutable.core_cap_flags & RDMA_CORE_PORT_IWARP) {
-		ird_ord_hdr[0] = conn_param.responder_resources;
-		ird_ord_hdr[1] = 1;
+	conn_param.initiator_depth = t->initiator_depth;
+	conn_param.responder_resources = t->responder_resources;
+
+	if (t->legacy_iwarp) {
+		ird_ord_hdr[0] = cpu_to_be32(conn_param.responder_resources);
+		ird_ord_hdr[1] = cpu_to_be32(conn_param.initiator_depth);
 		conn_param.private_data = ird_ord_hdr;
 		conn_param.private_data_len = sizeof(ird_ord_hdr);
 	} else {
@@ -2081,10 +2088,13 @@ static bool rdma_frwr_is_supported(struct ib_device_attr *attrs)
 	return true;
 }
 
-static int smb_direct_handle_connect_request(struct rdma_cm_id *new_cm_id)
+static int smb_direct_handle_connect_request(struct rdma_cm_id *new_cm_id,
+					     struct rdma_cm_event *event)
 {
 	struct smb_direct_transport *t;
 	struct task_struct *handler;
+	u8 peer_initiator_depth;
+	u8 peer_responder_resources;
 	int ret;
 
 	if (!rdma_frwr_is_supported(&new_cm_id->device->attrs)) {
@@ -2098,6 +2108,67 @@ static int smb_direct_handle_connect_request(struct rdma_cm_id *new_cm_id)
 	if (!t)
 		return -ENOMEM;
 
+	peer_initiator_depth = event->param.conn.initiator_depth;
+	peer_responder_resources = event->param.conn.responder_resources;
+	if (rdma_protocol_iwarp(new_cm_id->device, new_cm_id->port_num) &&
+	    event->param.conn.private_data_len == 8) {
+		/*
+		 * Legacy clients with only iWarp MPA v1 support
+		 * need a private blob in order to negotiate
+		 * the IRD/ORD values.
+		 */
+		const __be32 *ird_ord_hdr = event->param.conn.private_data;
+		u32 ird32 = be32_to_cpu(ird_ord_hdr[0]);
+		u32 ord32 = be32_to_cpu(ird_ord_hdr[1]);
+
+		/*
+		 * cifs.ko sends the legacy IRD/ORD negotiation
+		 * event if iWarp MPA v2 was used.
+		 *
+		 * Here we check that the values match and only
+		 * mark the client as legacy if they don't match.
+		 */
+		if ((u32)event->param.conn.initiator_depth != ird32 ||
+		    (u32)event->param.conn.responder_resources != ord32) {
+			/*
+			 * There are broken clients (old cifs.ko)
+			 * using little endian and also
+			 * struct rdma_conn_param only uses u8
+			 * for initiator_depth and responder_resources,
+			 * so we truncate the value to U8_MAX.
+			 *
+			 * smb_direct_accept_client() will then
+			 * do the real negotiation in order to
+			 * select the minimum between client and
+			 * server.
+			 */
+			ird32 = min_t(u32, ird32, U8_MAX);
+			ord32 = min_t(u32, ord32, U8_MAX);
+
+			t->legacy_iwarp = true;
+			peer_initiator_depth = (u8)ird32;
+			peer_responder_resources = (u8)ord32;
+		}
+	}
+
+	/*
+	 * First set what the we as server are able to support
+	 */
+	t->initiator_depth = min_t(u8, t->initiator_depth,
+				   new_cm_id->device->attrs.max_qp_rd_atom);
+
+	/*
+	 * negotiate the value by using the minimum
+	 * between client and server if the client provided
+	 * non 0 values.
+	 */
+	if (peer_initiator_depth != 0)
+		t->initiator_depth = min_t(u8, t->initiator_depth,
+					   peer_initiator_depth);
+	if (peer_responder_resources != 0)
+		t->responder_resources = min_t(u8, t->responder_resources,
+					       peer_responder_resources);
+
 	ret = smb_direct_connect(t);
 	if (ret)
 		goto out_err;
@@ -2122,7 +2193,7 @@ static int smb_direct_listen_handler(struct rdma_cm_id *cm_id,
 {
 	switch (event->event) {
 	case RDMA_CM_EVENT_CONNECT_REQUEST: {
-		int ret = smb_direct_handle_connect_request(cm_id);
+		int ret = smb_direct_handle_connect_request(cm_id, event);
 
 		if (ret) {
 			pr_err("Can't create transport: %d\n", ret);
-- 
2.43.0


