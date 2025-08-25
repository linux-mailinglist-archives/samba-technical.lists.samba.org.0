Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id AB337B34D92
	for <lists+samba-technical@lfdr.de>; Mon, 25 Aug 2025 23:07:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=4ZPldy4JhW8kGLWLdcF1X01I/GP4jfXl9/QzWYPt/sc=; b=Jihl9mfgK6qZBg2VS6fj2v8Y8l
	DDKbDwQ2BePYgSwjNo+07iDNeaB+5yKR1bn8fls6tza5mKjWklOHtEn8bOSbYAMYny9iJhIAVjrNB
	efAvzQnOjr0eDU1x+u5qkV21ihxQlF8p8cXtfPELjcSHL5xeUYCczZIZByfnVNoWMhR6pBdUy3jlB
	dozxawBzIPIgD0SaZagi6k/sE4nsuj8Gs4LBDrfORPAd5hL3B67AL3szelU5QAPAoiVchU2KG1Mn6
	12OcupQ+okfwN12yKGh8vRiQ/ceiZWCwfPMl3v6I5Q2lR6w3vsgcZqP8P6XL3d9jw0AxRjd31pj+J
	2PcwuvTQ==;
Received: from ip6-localhost ([::1]:33950 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uqeOz-000V4b-9S; Mon, 25 Aug 2025 21:06:53 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:26948) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uqeKQ-000T8W-3O
 for samba-technical@lists.samba.org; Mon, 25 Aug 2025 21:02:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=4ZPldy4JhW8kGLWLdcF1X01I/GP4jfXl9/QzWYPt/sc=; b=M2uwVx40Rjn2Eo6/odouapGDrp
 KD3qRkBChJ8ABptTrAknbOSn5lWt6hs+FQu66lNKXFcplmjShuaMj/8oyC+9vUCyo+yFuhQ1taUyw
 wH9MQVZhWEIiG68b3tC3flmrepkt0e3eHNpH834byqlFg5MxQppDCm7E+lvlNXODNWRyJ8Qor364q
 xsfOcUX47mT8m1aHAG6AJMw7TNI5vFUNGb8Zn5Ktx3re1kLN4Gs7D3qDn/3tA/qqodBzaurp+wYXe
 orRiElPQh9ejAJZewLch3syfFWDUS52BNwq9+vmp9eZ3166mmwxeFZVHNP/wpzZ4/lUg8zWIlo2+7
 N+spa8zZZUGPN8MyHRKf1hu/AVBf4q8kg20l9uw0zAQ2LBZ8HLKELDKXAR69FjjeSpGQpt3zxHDm+
 Yf5+1miWEcjkyyf7gOugXfcPGhVR+MXwKFgiTE9XK7mFh5BgR4Pm9lUsmWD9KSmigKhRv2lRQELof
 XLYgRipfn5g/n0zlKXBOeags;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uqeKM-000nHl-2I; Mon, 25 Aug 2025 21:02:06 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v4 122/142] smb: server: pass struct smbdirect_socket to
 smb_direct_qpair_handler()
Date: Mon, 25 Aug 2025 22:41:23 +0200
Message-ID: <6eaca00bcff9dde8c04344f6046d2bbe2ce47882.1756139607.git.metze@samba.org>
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

This will make it easier to move function to the common code
in future.

Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
---
 fs/smb/server/transport_rdma.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/fs/smb/server/transport_rdma.c b/fs/smb/server/transport_rdma.c
index bcfe0e62714c..c3be52f251c4 100644
--- a/fs/smb/server/transport_rdma.c
+++ b/fs/smb/server/transport_rdma.c
@@ -1576,8 +1576,7 @@ static int smb_direct_cm_handler(struct rdma_cm_id *cm_id,
 
 static void smb_direct_qpair_handler(struct ib_event *event, void *context)
 {
-	struct smb_direct_transport *t = context;
-	struct smbdirect_socket *sc = &t->socket;
+	struct smbdirect_socket *sc = context;
 
 	ksmbd_debug(RDMA, "Received QP event. cm_id=%p, event=%s (%d)\n",
 		    sc->rdma.cm_id, ib_event_msg(event->event), event->event);
@@ -1912,7 +1911,7 @@ static int smb_direct_create_qpair(struct smb_direct_transport *t,
 		return ret;
 	}
 
-	sc->ib.send_cq = ib_alloc_cq(sc->ib.dev, t,
+	sc->ib.send_cq = ib_alloc_cq(sc->ib.dev, sc,
 				 sp->send_credit_target + cap->max_rdma_ctxs,
 				 0, IB_POLL_WORKQUEUE);
 	if (IS_ERR(sc->ib.send_cq)) {
@@ -1922,7 +1921,7 @@ static int smb_direct_create_qpair(struct smb_direct_transport *t,
 		goto err;
 	}
 
-	sc->ib.recv_cq = ib_alloc_cq(sc->ib.dev, t,
+	sc->ib.recv_cq = ib_alloc_cq(sc->ib.dev, sc,
 				     sp->recv_credit_max, 0, IB_POLL_WORKQUEUE);
 	if (IS_ERR(sc->ib.recv_cq)) {
 		pr_err("Can't create RDMA recv CQ\n");
@@ -1933,7 +1932,7 @@ static int smb_direct_create_qpair(struct smb_direct_transport *t,
 
 	memset(&qp_attr, 0, sizeof(qp_attr));
 	qp_attr.event_handler = smb_direct_qpair_handler;
-	qp_attr.qp_context = t;
+	qp_attr.qp_context = sc;
 	qp_attr.cap = *cap;
 	qp_attr.sq_sig_type = IB_SIGNAL_REQ_WR;
 	qp_attr.qp_type = IB_QPT_RC;
-- 
2.43.0


