Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B1326B8E77B
	for <lists+samba-technical@lfdr.de>; Sun, 21 Sep 2025 23:49:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=9fPlSZjTSeA7ZT+d75K99j3yp/kAs4TCfVlGx13PX8o=; b=dqaP/VIZItin7uf1ycEhRD8xqZ
	MQ+kZTD3oVgu/TqBaLkd+Lbz/N+YMa+8RWmceV4E3SEhcCNojEWEdUp0nEbXWXjZ/Y8cd4tZBs7Lx
	oSzjlBXew/gx2T0AUxxizyWba5sNY8qBj2fCNYcXiLdl2kyw2O+P/hR9qCaCTlB1QKd7lVhPVtPoL
	1kHtIv2ipmzrqvPrAk6i8EcC674ZbZTV+2zGzEjkep37VAealQgo2SGPaQh3JZHHlKPeNmLg2KPQ1
	NJ/8Bm0b1scL11nbiJEWH/zqQPabGrY05mXhUOHvPaOJfNT7HI3HMPOpx/UFxq1fdgIUiyB3VA1Na
	vJ07GUpA==;
Received: from ip6-localhost ([::1]:31746 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1v0Rvj-004UCA-Mt; Sun, 21 Sep 2025 21:49:12 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:27214) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1v0RuH-004Tf7-Jg
 for samba-technical@lists.samba.org; Sun, 21 Sep 2025 21:47:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=9fPlSZjTSeA7ZT+d75K99j3yp/kAs4TCfVlGx13PX8o=; b=jyQP7GuqMEbx4w5BwTCnNui58y
 0d/ZidjyY6iCrJgwh27qdbuLPtq+WsYvc56+c7OJaduHV7yWVSthMGe669eR0meoD6P2fr4Ofcjjd
 Vx6C6m05WLHidOV+kq6tu8ATU5Ey9UKo3vS53wODGmxWjLo3iCo6niJyFzciPTXt8lg/0vUs+dFeO
 3AHrQZfeeZF3Pz24Wk4u/NuWePoU/5apfacAqShxlZGmXiCQ9izggUiJq+kjOt0TDAUEUPX9pmFal
 WDEPrr4LTto0rfhJ0IEqv4mEPI1/D9HBFYy0Ys6L2Pbqbz7HYZYFbBtzXgNQmZCxh+Ju8UUtpTjnV
 LYJqcyUz2l33eStEPwpqXKrarU/o53lTowP6L+UJSYI6745yv+erPB6nAC2ecISgRgSnq0QmYdTdY
 tZ9ORkLLqxZUWz0k/vVLVJ8FisGM/4x1gfFvpR5fpWac0hbAdg07V9JURDKHzdNJAYCITL6ZQ7V++
 eVuGl9xfRhQua2jrLx80EVfW;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1v0RuF-005GjT-01; Sun, 21 Sep 2025 21:47:39 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH 17/18] smb: server: make use of ib_alloc_cq_any() instead of
 ib_alloc_cq()
Date: Sun, 21 Sep 2025 23:45:04 +0200
Message-ID: <dea11c65e08de35b013a6d25a0104a8e2203c5d6.1758489989.git.metze@samba.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1758489988.git.metze@samba.org>
References: <cover.1758489988.git.metze@samba.org>
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

commit 20cf4e026730 ("rdma: Enable ib_alloc_cq to spread work over a
device's comp_vectors") happened before ksmbd was upstreamed,
but after the out of tree ksmbd (a.k.a. cifsd) was developed.
So we still used ib_alloc_cq().

Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
Signed-off-by: Steve French <stfrench@microsoft.com>
---
 fs/smb/server/transport_rdma.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/fs/smb/server/transport_rdma.c b/fs/smb/server/transport_rdma.c
index f9734d7025b4..e78347831d2f 100644
--- a/fs/smb/server/transport_rdma.c
+++ b/fs/smb/server/transport_rdma.c
@@ -2037,9 +2037,10 @@ static int smb_direct_create_qpair(struct smbdirect_socket *sc,
 		return ret;
 	}
 
-	sc->ib.send_cq = ib_alloc_cq(sc->ib.dev, sc,
-				 sp->send_credit_target + cap->max_rdma_ctxs,
-				 0, IB_POLL_WORKQUEUE);
+	sc->ib.send_cq = ib_alloc_cq_any(sc->ib.dev, sc,
+					 sp->send_credit_target +
+					 cap->max_rdma_ctxs,
+					 IB_POLL_WORKQUEUE);
 	if (IS_ERR(sc->ib.send_cq)) {
 		pr_err("Can't create RDMA send CQ\n");
 		ret = PTR_ERR(sc->ib.send_cq);
@@ -2047,8 +2048,9 @@ static int smb_direct_create_qpair(struct smbdirect_socket *sc,
 		goto err;
 	}
 
-	sc->ib.recv_cq = ib_alloc_cq(sc->ib.dev, sc,
-				     sp->recv_credit_max, 0, IB_POLL_WORKQUEUE);
+	sc->ib.recv_cq = ib_alloc_cq_any(sc->ib.dev, sc,
+					 sp->recv_credit_max,
+					 IB_POLL_WORKQUEUE);
 	if (IS_ERR(sc->ib.recv_cq)) {
 		pr_err("Can't create RDMA recv CQ\n");
 		ret = PTR_ERR(sc->ib.recv_cq);
-- 
2.43.0


