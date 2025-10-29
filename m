Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 5099EC1ACE3
	for <lists+samba-technical@lfdr.de>; Wed, 29 Oct 2025 14:40:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=NJ06ra/WawGPIRUSlyan2b+h0PFY6cChInSBp9RTEYg=; b=dynnl2yjWIqp6NQjwkfMSr2/xh
	WtGOrPz+0EVTHQWBG1anOGJlRaTn1aUsaohlcN4mrUe83Ri3PYiefTQTDzEcfS2C5XDnipql/RBF5
	iuHye13pLFH8by5QiyOeQmLmedscckXueRVVk5HgK/Xb9+PtBXmo+0kfr01/lFXh2JZrxd6m9p5EG
	vraxEL1n2PVvbuF9MQfaMMlDFfrlPA8FVGMKc/9phMfombVoljiOTK2rtnzUc9pZTs9D+YEo0Me3P
	LiOpZFidROKSrSlVpFejj2iyoXzuFJ5F0IV3Uwbiuq6PCH9i+F0Teui0+HNMrK5hNH35AmvzHvmCP
	QoCtfKxQ==;
Received: from ip6-localhost ([::1]:52584 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vE6P6-009Anh-DU; Wed, 29 Oct 2025 13:39:57 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:46294) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vE6F0-0097Jl-12
 for samba-technical@lists.samba.org; Wed, 29 Oct 2025 13:29:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=NJ06ra/WawGPIRUSlyan2b+h0PFY6cChInSBp9RTEYg=; b=A7kjqkI75zqp3OQszAfV0KKgSc
 ujrryxnZ7fox5vAH1Yqcr1Sm/x0Bk2A4ygsjH8QMVm+Url826XcTjfAAHQINMu2hpZKWIIVpGIzqA
 ulh30UkLfTZJOVHyFKHjDHQwFijafAWCZrzsPK4gPeQNEs2LCGbsoDN556akvNUCoC5Dj7eoXdRLW
 ToVt3QCwwfYYB5e9tb5EZ+wh5nL18UhxrX4qDjZnzwKFWatF/eSiaoLhYSvgi8y2hfQ0pyLhgoxAY
 EFqZ41GgGFPDZHsFmtOpoQeuBQcCcig7PBSR7uvhU7RaPkeX1S1q1oZekIpsz34Tx4PTOfJe+zdts
 mCg/n+F256Zv9MbNk8EMs+twb+G64CYyDqsJtHFLoen7lbJfLjdTqqwBYYE2Y4wCzMXyxDi3wLAaF
 XflQYhSNyeqkJEtIoSWzo6nCS8q6scq4b8YakUYjhnWwcbYorRYC/sh26Xvs72d59IDH1Klh8Qa/0
 WuL2rQPs5YDc/DTVeiJ/W9PI;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vE6Ex-00BcFj-2r; Wed, 29 Oct 2025 13:29:27 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v2 071/127] smb: client: make use of
 smbdirect_connection_negotiate_rdma_resources()
Date: Wed, 29 Oct 2025 14:20:49 +0100
Message-ID: <389ee307957adac2cd937dfe5737020a387db377.1761742839.git.metze@samba.org>
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
Cc: Tom Talpey <tom@talpey.com>, metze@samba.org,
 Steve French <smfrench@gmail.com>, Namjae Jeon <linkinjeon@kernel.org>,
 Steve French <stfrench@microsoft.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

It's good to have this logic in a central place, it will allow us
share more code soon.

Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: Long Li <longli@microsoft.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
Signed-off-by: Steve French <stfrench@microsoft.com>
---
 fs/smb/client/smbdirect.c | 59 +++------------------------------------
 1 file changed, 4 insertions(+), 55 deletions(-)

diff --git a/fs/smb/client/smbdirect.c b/fs/smb/client/smbdirect.c
index 9326023c4afc..b2d94411ecc2 100644
--- a/fs/smb/client/smbdirect.c
+++ b/fs/smb/client/smbdirect.c
@@ -193,7 +193,6 @@ static int smbd_conn_upcall(
 		struct rdma_cm_id *id, struct rdma_cm_event *event)
 {
 	struct smbdirect_socket *sc = id->context;
-	struct smbdirect_socket_parameters *sp = &sc->parameters;
 	const char *event_name = rdma_event_msg(event->event);
 	u8 peer_initiator_depth;
 	u8 peer_responder_resources;
@@ -254,60 +253,10 @@ static int smbd_conn_upcall(
 			peer_initiator_depth = event->param.conn.initiator_depth;
 			peer_responder_resources = event->param.conn.responder_resources;
 		}
-		if (rdma_protocol_iwarp(id->device, id->port_num) &&
-		    event->param.conn.private_data_len == 8) {
-			/*
-			 * Legacy clients with only iWarp MPA v1 support
-			 * need a private blob in order to negotiate
-			 * the IRD/ORD values.
-			 */
-			const __be32 *ird_ord_hdr = event->param.conn.private_data;
-			u32 ird32 = be32_to_cpu(ird_ord_hdr[0]);
-			u32 ord32 = be32_to_cpu(ird_ord_hdr[1]);
-
-			/*
-			 * cifs.ko sends the legacy IRD/ORD negotiation
-			 * event if iWarp MPA v2 was used.
-			 *
-			 * Here we check that the values match and only
-			 * mark the client as legacy if they don't match.
-			 */
-			if ((u32)event->param.conn.initiator_depth != ird32 ||
-			    (u32)event->param.conn.responder_resources != ord32) {
-				/*
-				 * There are broken clients (old cifs.ko)
-				 * using little endian and also
-				 * struct rdma_conn_param only uses u8
-				 * for initiator_depth and responder_resources,
-				 * so we truncate the value to U8_MAX.
-				 *
-				 * smb_direct_accept_client() will then
-				 * do the real negotiation in order to
-				 * select the minimum between client and
-				 * server.
-				 */
-				ird32 = min_t(u32, ird32, U8_MAX);
-				ord32 = min_t(u32, ord32, U8_MAX);
-
-				sc->rdma.legacy_iwarp = true;
-				peer_initiator_depth = (u8)ird32;
-				peer_responder_resources = (u8)ord32;
-			}
-		}
-
-		/*
-		 * negotiate the value by using the minimum
-		 * between client and server if the client provided
-		 * non 0 values.
-		 */
-		if (peer_initiator_depth != 0)
-			sp->initiator_depth =
-					min_t(u8, sp->initiator_depth,
-					      peer_initiator_depth);
-		if (peer_responder_resources != 0)
-			sp->responder_resources =
-					min_t(u8, sp->responder_resources,
-					      peer_responder_resources);
+		smbdirect_connection_negotiate_rdma_resources(sc,
+							      peer_initiator_depth,
+							      peer_responder_resources,
+							      &event->param.conn);
 
 		WARN_ON_ONCE(sc->status != SMBDIRECT_SOCKET_RDMA_CONNECT_RUNNING);
 		sc->status = SMBDIRECT_SOCKET_NEGOTIATE_NEEDED;
-- 
2.43.0


