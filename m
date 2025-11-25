Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id DD2F0C86964
	for <lists+samba-technical@lfdr.de>; Tue, 25 Nov 2025 19:24:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=hmRwZUoQ/EaIceqRQmxEW7bZGegj6eJg/5jjhUI7fF8=; b=swRNgciJa2xJvDSIjWspL/Odc5
	l+33YUFyUExx5IF+nxGZlKPMRO0+bLWU5t0UA1qb6ochKjw3UybCteO1T+llZ81yKHftHW8Ztxpm+
	2y3gHI9NgvNeud5wRyEcAT+Vzm67tor0SxA5XJsqwKBgnRk4ISAQv4qhEXil7qVU8+7h5ZJsrIe7j
	C/wlgF5gunjM56DHz5rNrwm9UoMffSXrFvj0tYCNALhvog4nfi3jebef81VdSL+DvTuM5Pa85XlHW
	z7vPQzsIjJdZ5Gqa/KR9qz4YXElL2kJ0dUKDbmTwYu9+mBQed6sgtmm2bkMIFjBaJeQBljolJ0yg0
	0nj1Z9kw==;
Received: from ip6-localhost ([::1]:18924 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vNxhy-00DF1w-NG; Tue, 25 Nov 2025 18:24:11 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:32564) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vNxfq-00DEXP-OG
 for samba-technical@lists.samba.org; Tue, 25 Nov 2025 18:22:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=hmRwZUoQ/EaIceqRQmxEW7bZGegj6eJg/5jjhUI7fF8=; b=pBJvHpyUrL7cGep0s1mDRMz02X
 BFf5wuCn27JgUmnHZ4gN/pLpwhXPf9T1NtReNeGvI1TSFBAu1kZU1cLG7ZfrfmZmOgE0JWGofdneo
 6Yo8uC0P7xJqLaKRFD0EbJm1zhDCNVE1MYzNdXdv/qifS0oNVnf2eHm7F2hoGPkj58U8FBQRPgiv7
 giWMnV3qnuZkZIfaGwfUwk61h5fivfVTwD07APEtqywkUNJS1Ye5Qk1cFfMflAlMTs4rX/rBBv1Fz
 X2i/78iK1njEo4DYSbAwjjFMUnepzjhECvqisu/NYhI9yyIK/lv3tMogbO2EiDXadD1LKtiqBtiD/
 qTokn/AuTj+hgovxGoKIrRN8/jKksgRitfuTR7d68ZYMvoQcm2SZm/iwkszlf39pb9q1sFVJ+kI9d
 0UNQyGFgN9IQJw/lkJr0oAOjaDrly0rypcRQyFJREp1wrXW5gnXNCwMD/EE1jERPYbSnFVTSQ2GH9
 CnZGGtWmKGDfSha87bNXwMtB;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vNxWv-00FeUq-0a; Tue, 25 Nov 2025 18:12:45 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v4 111/145] smb: server: make use of
 smbdirect_connection_qp_event_handler()
Date: Tue, 25 Nov 2025 18:55:57 +0100
Message-ID: <39f6ebba097d99b06ff068ec361e0887d92a9a2a.1764091285.git.metze@samba.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1764091285.git.metze@samba.org>
References: <cover.1764091285.git.metze@samba.org>
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
index c8839d73a7a1..4da8247337a8 100644
--- a/fs/smb/server/transport_rdma.c
+++ b/fs/smb/server/transport_rdma.c
@@ -1523,23 +1523,6 @@ static int smb_direct_cm_handler(struct rdma_cm_id *cm_id,
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
-		smbdirect_socket_schedule_cleanup(sc, -ECONNABORTED);
-		break;
-	default:
-		break;
-	}
-}
-
 static int smb_direct_send_negotiate_response(struct smbdirect_socket *sc,
 					      int failed)
 {
@@ -1888,7 +1871,7 @@ static int smb_direct_create_qpair(struct smbdirect_socket *sc)
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


