Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 35C1FB34CAA
	for <lists+samba-technical@lfdr.de>; Mon, 25 Aug 2025 22:50:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=09wM0PmS9Q/VdUoCdwB2nyKIoScB0rJewFJUnU5oQTo=; b=AXCmv+uig1KS7IUKRWvf2b0EsB
	WAPJKbdIHklpBZihylvezuudbGTDRjXYunqoCGAZpb9XZrqKXv2x+LepWSKMEuaQMZZVwpdgGHhRu
	0Vx1oKzwU1jkELCtP/yYJO62e/TPijObcEr+9e7GM52Xq17jThURRvfMLe/4OUVCvUKClc95X4c6s
	NsCSWdm9gzbcl0Uum/GKKnwgbR03aynZS/K22ifvMvNn5+WtoA+JcPtRNgagAzierNDs6WR25NpEC
	znY52Szi7dgxfizbUAUDWwKOALuMB6dBDXwlL9jNGkuWq588C+mYitqr1qHIkfgf61YpxN7pQrjeG
	tN+pCVeA==;
Received: from ip6-localhost ([::1]:30744 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uqe91-000ON8-AW; Mon, 25 Aug 2025 20:50:24 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:47762) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uqe7B-000Nhj-OK
 for samba-technical@lists.samba.org; Mon, 25 Aug 2025 20:48:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=09wM0PmS9Q/VdUoCdwB2nyKIoScB0rJewFJUnU5oQTo=; b=c3N0woOyKdd7fIyf/xi6UAM4Lu
 SrsMC2BGffiyBPUI/s2tS3bfxcH5x2sPGuDGSBoxU4CtFyCiOgT+gt1lTsHswqVA183T9qGI9pPNg
 PC38EWt1t0TXKf7x4/4q5Cg01RKldAvwWs7uyHftrmjfqdbHVOI/Kj6GyM/BFw8o8wsVVlkez4xsR
 eifaePl0ABfHxcajCk6fFj0GRmVylup2aug54Wor/lJalDYb0uPayLiDo5iITPET2vNj7PRHlU8H3
 hR/v3sw7NcP5wd62p8wKJyPeJDkJ1RyySH/lFHUk1JQ9G0EoHkJOBmguM+1UpRO5qrrhuXrj48+iI
 3AmX4ndBk2YyvUdUfaV2qyVZt/jtyVsazOGKxOiGg90wef+6Bd9yCiNpD4P6RT+WjhehFQvxB1m2+
 mwLyMUOqiOyeSocr4k09cb6AkLrqgvZSsBv9ZEGY4HtXH9QFLtW9HVXdOfynBVKM+LooUVNXGqQHU
 MQoRqYkWAkapOgtXJ+rJtN2b;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uqe78-000kYL-2r; Mon, 25 Aug 2025 20:48:26 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v4 040/142] smb: client: make use of
 smbdirect_socket_parameters.{initiator_depth, responder_resources}
Date: Mon, 25 Aug 2025 22:40:01 +0200
Message-ID: <4d0d0ea44f4723bfb5256b6b55be42efd9593ff9.1756139607.git.metze@samba.org>
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

Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: Long Li <longli@microsoft.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
---
 fs/smb/client/cifs_debug.c |  2 +-
 fs/smb/client/smbdirect.c  | 29 +++++++++++++++--------------
 fs/smb/client/smbdirect.h  |  2 --
 3 files changed, 16 insertions(+), 17 deletions(-)

diff --git a/fs/smb/client/cifs_debug.c b/fs/smb/client/cifs_debug.c
index e8faa5726b1c..9dadf04508ac 100644
--- a/fs/smb/client/cifs_debug.c
+++ b/fs/smb/client/cifs_debug.c
@@ -483,7 +483,7 @@ static int cifs_debug_data_proc_show(struct seq_file *m, void *v)
 			atomic_read(&sc->send_io.pending.count));
 		seq_printf(m, "\nMR responder_resources: %x "
 			"max_frmr_depth: %x mr_type: %x",
-			server->smbd_conn->responder_resources,
+			sp->responder_resources,
 			server->smbd_conn->max_frmr_depth,
 			server->smbd_conn->mr_type);
 		seq_printf(m, "\nMR mr_ready_count: %x mr_used_count: %x",
diff --git a/fs/smb/client/smbdirect.c b/fs/smb/client/smbdirect.c
index 80d5ca0f10c2..e6c54255192f 100644
--- a/fs/smb/client/smbdirect.c
+++ b/fs/smb/client/smbdirect.c
@@ -221,6 +221,7 @@ static int smbd_conn_upcall(
 {
 	struct smbd_connection *info = id->context;
 	struct smbdirect_socket *sc = &info->socket;
+	struct smbdirect_socket_parameters *sp = &sc->parameters;
 	const char *event_name = rdma_event_msg(event->event);
 	u8 peer_initiator_depth;
 	u8 peer_responder_resources;
@@ -303,11 +304,11 @@ static int smbd_conn_upcall(
 			}
 		}
 
-		info->initiator_depth =
-				min_t(u8, info->initiator_depth,
+		sp->initiator_depth =
+				min_t(u8, sp->initiator_depth,
 				      peer_initiator_depth);
-		info->responder_resources =
-				min_t(u8, info->responder_resources,
+		sp->responder_resources =
+				min_t(u8, sp->responder_resources,
 				      peer_responder_resources);
 
 		WARN_ON_ONCE(sc->status != SMBDIRECT_SOCKET_RDMA_CONNECT_RUNNING);
@@ -1672,15 +1673,14 @@ static struct smbd_connection *_smbd_get_connection(
 	smbdirect_socket_init(sc);
 	sp = &sc->parameters;
 
-	info->initiator_depth = 1;
-	info->responder_resources = SMBD_CM_RESPONDER_RESOURCES;
-
 	INIT_WORK(&sc->disconnect_work, smbd_disconnect_rdma_work);
 
 	sp->resolve_addr_timeout_msec = RDMA_RESOLVE_TIMEOUT;
 	sp->resolve_route_timeout_msec = RDMA_RESOLVE_TIMEOUT;
 	sp->rdma_connect_timeout_msec = RDMA_RESOLVE_TIMEOUT;
 	sp->negotiate_timeout_msec = SMBD_NEGOTIATE_TIMEOUT * 1000;
+	sp->initiator_depth = 1;
+	sp->responder_resources = SMBD_CM_RESPONDER_RESOURCES;
 	sp->recv_credit_max = smbd_receive_credit_max;
 	sp->send_credit_target = smbd_send_credit_target;
 	sp->max_send_size = smbd_max_send_size;
@@ -1761,15 +1761,15 @@ static struct smbd_connection *_smbd_get_connection(
 	}
 	sc->ib.qp = sc->rdma.cm_id->qp;
 
-	info->responder_resources =
-		min_t(u8, info->responder_resources,
+	sp->responder_resources =
+		min_t(u8, sp->responder_resources,
 		      sc->ib.dev->attrs.max_qp_rd_atom);
 	log_rdma_mr(INFO, "responder_resources=%d\n",
-		info->responder_resources);
+		sp->responder_resources);
 
 	memset(&conn_param, 0, sizeof(conn_param));
-	conn_param.initiator_depth = info->initiator_depth;
-	conn_param.responder_resources = info->responder_resources;
+	conn_param.initiator_depth = sp->initiator_depth;
+	conn_param.responder_resources = sp->responder_resources;
 
 	/* Need to send IRD/ORD in private data for iWARP */
 	sc->ib.dev->ops.get_port_immutable(
@@ -2226,6 +2226,7 @@ static void destroy_mr_list(struct smbd_connection *info)
 static int allocate_mr_list(struct smbd_connection *info)
 {
 	struct smbdirect_socket *sc = &info->socket;
+	struct smbdirect_socket_parameters *sp = &sc->parameters;
 	int i;
 	struct smbd_mr *smbdirect_mr, *tmp;
 
@@ -2237,13 +2238,13 @@ static int allocate_mr_list(struct smbd_connection *info)
 	init_waitqueue_head(&info->wait_for_mr_cleanup);
 	INIT_WORK(&info->mr_recovery_work, smbd_mr_recovery_work);
 
-	if (info->responder_resources == 0) {
+	if (sp->responder_resources == 0) {
 		log_rdma_mr(ERR, "responder_resources negotiated as 0\n");
 		return -EINVAL;
 	}
 
 	/* Allocate more MRs (2x) than hardware responder_resources */
-	for (i = 0; i < info->responder_resources * 2; i++) {
+	for (i = 0; i < sp->responder_resources * 2; i++) {
 		smbdirect_mr = kzalloc(sizeof(*smbdirect_mr), GFP_KERNEL);
 		if (!smbdirect_mr)
 			goto cleanup_entries;
diff --git a/fs/smb/client/smbdirect.h b/fs/smb/client/smbdirect.h
index 3dd7408329f5..b973943acea3 100644
--- a/fs/smb/client/smbdirect.h
+++ b/fs/smb/client/smbdirect.h
@@ -52,8 +52,6 @@ struct smbd_connection {
 	/* Memory registrations */
 	/* Maximum number of RDMA read/write outstanding on this connection */
 	bool legacy_iwarp;
-	u8 initiator_depth;
-	u8 responder_resources;
 	/* Maximum number of pages in a single RDMA write/read on this connection */
 	int max_frmr_depth;
 	/*
-- 
2.43.0


