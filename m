Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 51083B34D78
	for <lists+samba-technical@lfdr.de>; Mon, 25 Aug 2025 23:05:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=coJjRgSblF+dfkXKMXLxqlaVihhTEjQ1mmXj1twOixs=; b=39hj6a38u3jY5ClEz+We0LoItA
	BRITf276jDdtVgn2Cuw+/DtcfwHjRZSqlGORXwMoUdOxb9BV0toTTNkd+iVa1TFWlaFdINUVmCz2s
	HQTdxrDwMl82h9GvapjDAYktzMOVkaqm2GtwMT5c68Ti3yWye+Dg3XCgP5FY0H3c0iELwQacbxl0t
	ABTVgKAvrBsP6E/GGk64RkP9tHphfdp4PjDsAaZbgRY099b/nm9/HQzXfeWZzUJ7/cJcXnOsLkDK/
	ZEa5Q9Wwt9peqFj/pZ7uogOwOCoq2l1vXazYDVo7crUZaGWJGGUuZAwAbHwND83SYRHEMlKJKXLBS
	YHQFoDJg==;
Received: from ip6-localhost ([::1]:40746 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uqeN1-000UAi-7P; Mon, 25 Aug 2025 21:04:51 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:60468) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uqeIb-000SNU-Hf
 for samba-technical@lists.samba.org; Mon, 25 Aug 2025 21:00:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=coJjRgSblF+dfkXKMXLxqlaVihhTEjQ1mmXj1twOixs=; b=laMUru+ttWqHinlosdIJ0dMxdd
 qU4NwGp1FI9nT6qZbUKtQfUy4yRhGfzButo7n2XOcjCrX/07tsz8ensIHhZix7WOgSL2kzcet8sDe
 gdaOb/NvcxWIM6ZmOCZJV9eGw9xCxeLCd86ni3B5jvMgYS8XPIaXYz/aZ6bwZg2o6U2FHTUScKy15
 NWgOobb/VUIhXZ+ibkRFNvK2fomG77RlbJAi//fmmI8lNkl3Nlb1OuzcPF71TG3d52t2Ukiu2mG0X
 bdG0FLfdieBI99yRzKutD+1FyYm6kP6BWxwCB1bk9MlOX1ciC0gCdZkyKu5wfkvDEW+TnegtiswHB
 nxmXeo4pZdlkKMhACNCvklYsk/Oe1WQ7P6lj5x8Ytz4pbTmTxO+BTuhQCEEh/cM1ZkSdFWb2uP1Pz
 1XqUQnrVAVmYmgU2j23hHkeVcLs/Bd2MskjrJsu2odIQbzogjD/ieUpKdADtHntMf8ccbjaxyB6Zl
 K4HDzs4/XjdY7NBSZZzJOO53;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uqeIY-000muG-0N; Mon, 25 Aug 2025 21:00:14 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v4 111/142] smb: server: make use of
 smbdirect_socket_parameters.{initiator_depth, responder_resources}
Date: Mon, 25 Aug 2025 22:41:12 +0200
Message-ID: <355622c0bf2e8ec7a8e01ccd5d1a9e41f337a021.1756139607.git.metze@samba.org>
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

This will make it easier to specify these from the outside of the core
code first and then negotiate the value with the peer.

Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
---
 fs/smb/server/transport_rdma.c | 26 ++++++++++++++------------
 1 file changed, 14 insertions(+), 12 deletions(-)

diff --git a/fs/smb/server/transport_rdma.c b/fs/smb/server/transport_rdma.c
index 9bc8431821b6..100ac189b47e 100644
--- a/fs/smb/server/transport_rdma.c
+++ b/fs/smb/server/transport_rdma.c
@@ -95,8 +95,6 @@ struct smb_direct_transport {
 	struct work_struct	send_immediate_work;
 
 	bool			legacy_iwarp;
-	u8			initiator_depth;
-	u8			responder_resources;
 };
 
 #define KSMBD_TRANS(t) (&(t)->transport)
@@ -300,6 +298,8 @@ static struct smb_direct_transport *alloc_transport(struct rdma_cm_id *cm_id)
 	INIT_WORK(&sc->disconnect_work, smb_direct_disconnect_rdma_work);
 
 	sp->negotiate_timeout_msec = SMB_DIRECT_NEGOTIATE_TIMEOUT * 1000;
+	sp->initiator_depth = SMB_DIRECT_CM_INITIATOR_DEPTH;
+	sp->responder_resources = 1;
 	sp->recv_credit_max = smb_direct_receive_credit_max;
 	sp->send_credit_target = smb_direct_send_credit_target;
 	sp->max_send_size = smb_direct_max_send_size;
@@ -310,9 +310,6 @@ static struct smb_direct_transport *alloc_transport(struct rdma_cm_id *cm_id)
 	sc->rdma.cm_id = cm_id;
 	cm_id->context = t;
 
-	t->initiator_depth = SMB_DIRECT_CM_INITIATOR_DEPTH;
-	t->responder_resources = 1;
-
 	sc->ib.dev = sc->rdma.cm_id->device;
 
 	INIT_WORK(&sc->recv_io.posted.refill_work,
@@ -1613,18 +1610,19 @@ static int smb_direct_send_negotiate_response(struct smb_direct_transport *t,
 static int smb_direct_accept_client(struct smb_direct_transport *t)
 {
 	struct smbdirect_socket *sc = &t->socket;
+	struct smbdirect_socket_parameters *sp = &sc->parameters;
 	struct rdma_conn_param conn_param;
 	__be32 ird_ord_hdr[2];
 	int ret;
 
 	/*
 	 * smb_direct_handle_connect_request()
-	 * already negotiated t->initiator_depth
-	 * and t->responder_resources
+	 * already negotiated sp->initiator_depth
+	 * and sp->responder_resources
 	 */
 	memset(&conn_param, 0, sizeof(conn_param));
-	conn_param.initiator_depth = t->initiator_depth;
-	conn_param.responder_resources = t->responder_resources;
+	conn_param.initiator_depth = sp->initiator_depth;
+	conn_param.responder_resources = sp->responder_resources;
 
 	if (t->legacy_iwarp) {
 		ird_ord_hdr[0] = cpu_to_be32(conn_param.responder_resources);
@@ -2035,6 +2033,8 @@ static int smb_direct_handle_connect_request(struct rdma_cm_id *new_cm_id,
 					     struct rdma_cm_event *event)
 {
 	struct smb_direct_transport *t;
+	struct smbdirect_socket *sc;
+	struct smbdirect_socket_parameters *sp;
 	struct task_struct *handler;
 	u8 peer_initiator_depth;
 	u8 peer_responder_resources;
@@ -2050,6 +2050,8 @@ static int smb_direct_handle_connect_request(struct rdma_cm_id *new_cm_id,
 	t = alloc_transport(new_cm_id);
 	if (!t)
 		return -ENOMEM;
+	sc = &t->socket;
+	sp = &sc->parameters;
 
 	peer_initiator_depth = event->param.conn.initiator_depth;
 	peer_responder_resources = event->param.conn.responder_resources;
@@ -2099,7 +2101,7 @@ static int smb_direct_handle_connect_request(struct rdma_cm_id *new_cm_id,
 	/*
 	 * First set what the we as server are able to support
 	 */
-	t->initiator_depth = min_t(u8, t->initiator_depth,
+	sp->initiator_depth = min_t(u8, sp->initiator_depth,
 				   new_cm_id->device->attrs.max_qp_rd_atom);
 
 	/*
@@ -2108,10 +2110,10 @@ static int smb_direct_handle_connect_request(struct rdma_cm_id *new_cm_id,
 	 * non 0 values.
 	 */
 	if (peer_initiator_depth != 0)
-		t->initiator_depth = min_t(u8, t->initiator_depth,
+		sp->initiator_depth = min_t(u8, sp->initiator_depth,
 					   peer_initiator_depth);
 	if (peer_responder_resources != 0)
-		t->responder_resources = min_t(u8, t->responder_resources,
+		sp->responder_resources = min_t(u8, sp->responder_resources,
 					       peer_responder_resources);
 
 	ret = smb_direct_connect(t);
-- 
2.43.0


