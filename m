Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 48206C1AE63
	for <lists+samba-technical@lfdr.de>; Wed, 29 Oct 2025 14:48:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=9SZeRZuBMhokmfuG2hpfqaanzSPgbJAXddn7qMR27ek=; b=Y/UvM7QWFUjsjgg2ak8SiJOXpJ
	pliUt5gYNmtYIuaWPA0gnVMrRz062qlc+arsjGLYw1C9iX7YU0X0joJ3u0ugedAKHra4/q3gJfMDV
	Uqisi0qdsQtwLCLeF17lrdcsigvg1e/XcfibcqJabrUDTVEAfe834kPFlE98U2+JuIaZ9kgRn1Moi
	FNp+9v5TBWUgqI1l7MEeN6svV/GfUwdRVuPpq8LbG+JCY/nb9l7P70vKxI6sP0HbIaIEwRXsqMjsk
	FEFtWooWDEKri2NBfCD2gPXvr4fh929sUGnwNdsTA4mOYlw889g81LJ/YJhbAiieAs2AKb0tGabnz
	q9m7XoCA==;
Received: from ip6-localhost ([::1]:28086 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vE6Wo-009DbP-0H; Wed, 29 Oct 2025 13:47:54 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:26178) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vE6IV-0098TJ-Ny
 for samba-technical@lists.samba.org; Wed, 29 Oct 2025 13:33:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=9SZeRZuBMhokmfuG2hpfqaanzSPgbJAXddn7qMR27ek=; b=2R4gz3d/3Hgxy49liGe/LFvuv4
 jWg6Rt1ZVFIPQl6ZH5g8aD1A2C9hpeB4Pi7hCbK1BKqoWfAEpI2ix06eavcyvQvXyme4M1X0itgY5
 frBF4OVe6wUxOxxxyHK9zpVsBcffMkzCggPTn72URmzPP9HBLvgvtQpQR29Ix/2/fphmdXb1BhOo/
 822FtD3p4wzZSqCtRbeAawXRBEKRT34dKDVVNHUz0XDmjUUq3BV+1p3d2sWVaJ1yCj9fi35ptP8lt
 1NisXep+cD38coMrc6RWHwHzOmQ7OUA2Sla9Qluhvbb8IzIbgZ2s/kYE1K7MQ6Bptg1jtJNYrO7w+
 9lAMD5k5TWDdi3y2DnQ6EsVPJCrH01qeMFo3i8zUSZpb4txCCVcbJCcIQA/Q78Hn0JtrpDwswp51Y
 4XoyjntYkXt3P+9kZXzZRe1s17e3JuHAsd9tKrAo/L+EccohpbCyEWWfwmJAMujFCAMqcyQZj233T
 v/ZK6wHnNm3M4o6CXUVojDwg;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vE6IS-00BcrI-36; Wed, 29 Oct 2025 13:33:05 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v2 105/127] smb: server: make use of
 smbdirect_connection_qp_event_handler()
Date: Wed, 29 Oct 2025 14:21:23 +0100
Message-ID: <060d46c9679fe9a675d24eb28a9b414c48e59c9f.1761742839.git.metze@samba.org>
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

This is a copy of smb_direct_qpair_handler()...

It will allow more code to be moved to common functions
soon.

Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
Signed-off-by: Steve French <stfrench@microsoft.com>
---
 fs/smb/server/transport_rdma.c | 19 +------------------
 1 file changed, 1 insertion(+), 18 deletions(-)

diff --git a/fs/smb/server/transport_rdma.c b/fs/smb/server/transport_rdma.c
index 4e2de2664e31..ef2de6302768 100644
--- a/fs/smb/server/transport_rdma.c
+++ b/fs/smb/server/transport_rdma.c
@@ -1501,23 +1501,6 @@ static int smb_direct_cm_handler(struct rdma_cm_id *cm_id,
 	return 0;
 }
 
-static void smb_direct_qpair_handler(struct ib_event *event, void *context)
-{
-	struct smbdirect_socket *sc = context;
-
-	ksmbd_debug(RDMA, "Received QP event. cm_id=%p, event=%s (%d)\n",
-		    sc->rdma.cm_id, ib_event_msg(event->event), event->event);
-
-	switch (event->event) {
-	case IB_EVENT_CQ_ERR:
-	case IB_EVENT_QP_FATAL:
-		smbdirect_connection_schedule_disconnect(sc, -ECONNABORTED);
-		break;
-	default:
-		break;
-	}
-}
-
 static int smb_direct_send_negotiate_response(struct smbdirect_socket *sc,
 					      int failed)
 {
@@ -1857,7 +1840,7 @@ static int smb_direct_create_qpair(struct smbdirect_socket *sc)
 	 * again if max_rdma_ctxs is not 0.
 	 */
 	memset(&qp_attr, 0, sizeof(qp_attr));
-	qp_attr.event_handler = smb_direct_qpair_handler;
+	qp_attr.event_handler = smbdirect_connection_qp_event_handler;
 	qp_attr.qp_context = sc;
 	qp_attr.cap = qp_cap;
 	qp_attr.sq_sig_type = IB_SIGNAL_REQ_WR;
-- 
2.43.0


