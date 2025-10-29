Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 955CDC1AE72
	for <lists+samba-technical@lfdr.de>; Wed, 29 Oct 2025 14:48:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=h9gxcdIvSzu5DCqCcW15pG61ix/tQUkfDKhyOTVhOxE=; b=v4/dxoPthVib8EilswPGJNMm0v
	s5umwS7edmgC4s8ok7RS5f9qXpxEfEy37Axjai/qsqklo5FrUocmTU9pag9gLk1WvX6/9MtTI78u8
	24y2XZU5yVGj5ZFtkbzDRmMhud9TO9T8Pw4qQZ3gI83VSGO4QVNLIB5hppjDN95rgunerkay4rGOf
	HQac+JYP1HNeoB42rpNPHhargzf2GLBkh1zkyXrQ5RW4B3pxcvSGvUIYoVvDJyHbmQekLrD/uUltU
	EB/YVr9JjFpMBzHQFWYkTneCDVpDL1HAUmOB/dxk196pBW1YbWRBadeuDo46YE5bYfTILTV+CFzHk
	05xDbZyw==;
Received: from ip6-localhost ([::1]:34244 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vE6Wz-009Dfw-BG; Wed, 29 Oct 2025 13:48:06 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:26188) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vE6Ib-0098VU-54
 for samba-technical@lists.samba.org; Wed, 29 Oct 2025 13:33:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=h9gxcdIvSzu5DCqCcW15pG61ix/tQUkfDKhyOTVhOxE=; b=bA0vpy7cfdc7EIhsO911L3HcDu
 hZ5Q/jm3kmASyCWAyUvhagKaBIrj8ipQh+DVTplOjHmgvn50xmaaRDCx3flk9snk9wIYOrDNXjpQ4
 qYHNtplIbfZSBTlaozZekDJ0ceGQ/Zrjbegk9RY1VPfSlVIYP0Vspw//rRt2K4ip1wmDBQZ2FuYow
 pmFPVIiOrphb3RywfgMXN1ZVlVgGQ6YSYrsCovRLIuixTLL2OqHFT8AR2bySV+IdtpVV54zEzPx8s
 vKhH3wLVMoCzSgH5GuGO+KkL4ZwrUinUdQk+3nEyKFxTuNz9s8q4YPnudfXteZAfUAjWToGd6cEjo
 LX2sKVVwmgyNNqwumAzb4eCQcNd9mEiL+floQLntStimOr9FCQlqLPOVSqNa1Y4sCHeKo70Lx2Iit
 eYhFxxhhQJ7jejYkfUn1S6Jq4CkzsRGO2Wa16zPCm4A+v8ByrAVd7zo/J7TrgOH+C87c0pwPKIt8H
 OwNPl6HG5/naGD1iapfE8Lm+;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vE6IY-00Bcs0-1n; Wed, 29 Oct 2025 13:33:10 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v2 106/127] smb: server: make use of
 smbdirect_connection_negotiate_rdma_resources()
Date: Wed, 29 Oct 2025 14:21:24 +0100
Message-ID: <6df890318c4170ef92b6a49348ea4cb992a3fd51.1761742839.git.metze@samba.org>
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
 Tom Talpey <tom@talpey.com>, Namjae Jeon <linkinjeon@kernel.org>,
 Steve French <stfrench@microsoft.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

It's good to have this logic in a central place, it will allow us
share more code soon.

Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
Signed-off-by: Steve French <stfrench@microsoft.com>
---
 fs/smb/server/transport_rdma.c | 62 ++++------------------------------
 1 file changed, 7 insertions(+), 55 deletions(-)

diff --git a/fs/smb/server/transport_rdma.c b/fs/smb/server/transport_rdma.c
index ef2de6302768..526ad5c19b6e 100644
--- a/fs/smb/server/transport_rdma.c
+++ b/fs/smb/server/transport_rdma.c
@@ -2020,66 +2020,18 @@ static int smb_direct_handle_connect_request(struct rdma_cm_id *new_cm_id,
 	sc = &t->socket;
 	sp = &sc->parameters;
 
-	peer_initiator_depth = event->param.conn.initiator_depth;
-	peer_responder_resources = event->param.conn.responder_resources;
-	if (rdma_protocol_iwarp(new_cm_id->device, new_cm_id->port_num) &&
-	    event->param.conn.private_data_len == 8) {
-		/*
-		 * Legacy clients with only iWarp MPA v1 support
-		 * need a private blob in order to negotiate
-		 * the IRD/ORD values.
-		 */
-		const __be32 *ird_ord_hdr = event->param.conn.private_data;
-		u32 ird32 = be32_to_cpu(ird_ord_hdr[0]);
-		u32 ord32 = be32_to_cpu(ird_ord_hdr[1]);
-
-		/*
-		 * cifs.ko sends the legacy IRD/ORD negotiation
-		 * event if iWarp MPA v2 was used.
-		 *
-		 * Here we check that the values match and only
-		 * mark the client as legacy if they don't match.
-		 */
-		if ((u32)event->param.conn.initiator_depth != ird32 ||
-		    (u32)event->param.conn.responder_resources != ord32) {
-			/*
-			 * There are broken clients (old cifs.ko)
-			 * using little endian and also
-			 * struct rdma_conn_param only uses u8
-			 * for initiator_depth and responder_resources,
-			 * so we truncate the value to U8_MAX.
-			 *
-			 * smb_direct_accept_client() will then
-			 * do the real negotiation in order to
-			 * select the minimum between client and
-			 * server.
-			 */
-			ird32 = min_t(u32, ird32, U8_MAX);
-			ord32 = min_t(u32, ord32, U8_MAX);
-
-			sc->rdma.legacy_iwarp = true;
-			peer_initiator_depth = (u8)ird32;
-			peer_responder_resources = (u8)ord32;
-		}
-	}
-
 	/*
 	 * First set what the we as server are able to support
 	 */
 	sp->initiator_depth = min_t(u8, sp->initiator_depth,
-				   new_cm_id->device->attrs.max_qp_rd_atom);
+				    sc->ib.dev->attrs.max_qp_rd_atom);
 
-	/*
-	 * negotiate the value by using the minimum
-	 * between client and server if the client provided
-	 * non 0 values.
-	 */
-	if (peer_initiator_depth != 0)
-		sp->initiator_depth = min_t(u8, sp->initiator_depth,
-					   peer_initiator_depth);
-	if (peer_responder_resources != 0)
-		sp->responder_resources = min_t(u8, sp->responder_resources,
-					       peer_responder_resources);
+	peer_initiator_depth = event->param.conn.initiator_depth;
+	peer_responder_resources = event->param.conn.responder_resources;
+	smbdirect_connection_negotiate_rdma_resources(sc,
+						      peer_initiator_depth,
+						      peer_responder_resources,
+						      &event->param.conn);
 
 	ret = smb_direct_connect(sc);
 	if (ret)
-- 
2.43.0


