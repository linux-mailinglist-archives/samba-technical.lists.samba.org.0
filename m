Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BE0BC8697C
	for <lists+samba-technical@lfdr.de>; Tue, 25 Nov 2025 19:24:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=OTU36QBOrI0tsSyTNbhNVAgOQn7cp+DMAM1EIQ5t/Aw=; b=D0Pkbhj3dnZyLTo+Hty31OaJyU
	FyQ8X0wf5bL1Xq9hLUeHBMIsm+WAgRLhqRaJqkcmrnWHdkV1j78xTvz12xKmisKvEdEJpg164ests
	LdPkPKI5nK1GQP1Rb6cVG6kUwhYHJfD+UWBGqCvcm9DUWNwsVKLNYjaWOcbuiIZm9HG60L3MHdL76
	HbbWo1a9V0ff6KhJ87k9HeMjXfEVdfprejuNIrUNv/oLm31oT4yd0MY+07Vr4LSQkrGiBrHfeN+LV
	muoVbhnL99oJ6jj0SqYtizMmpk7kQxHupDnxhKHvVVkGn6CVMUhzuW0rDsvElumDwlfCrruW8jQ8K
	JNSnO9Ig==;
Received: from ip6-localhost ([::1]:18474 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vNxiT-00DFCR-FI; Tue, 25 Nov 2025 18:24:43 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:27916) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vNxgH-00DEdm-R7
 for samba-technical@lists.samba.org; Tue, 25 Nov 2025 18:22:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=OTU36QBOrI0tsSyTNbhNVAgOQn7cp+DMAM1EIQ5t/Aw=; b=oxNJQL/MvBWsed2yrYwEqLnRR5
 xy/gYp4HaW1z+ilYJGBm8FvJMmYIMLA6FjTCGgMXosbICbGzS+cg8WxJQ14WyLnn3KgJVXBkUVVMH
 FNkMWBLyOMwNIvSYMnkMvBvQjvY2eKp0kGejGndOxOti+JTfpmaPvyEkxcpGCUbDZ3oK/PraQ0vZw
 o1Z7m11du+5w5rDXcxnSSEAhwNzTJLqqkvywFyLGYSMJacc+xd8mU1NGG7t/RH8qKx9gaA4RGKWMN
 EUva8MO6lo6s2v/8vnZOChCWdpk12m0VeuTllhxEkms/BpMnvO1kmsnaxNDTyphqIwpf02qRXj+vw
 e6x/VC3dJUOyyrCc+UdSZh3u6X/l2cfipPrLuujZOo3kqqAhFRpLCBZNVHwNGmIw1Gb9ZtQuZ93P0
 +PN1TjHAKPOv2AOKjoPy9Cje2VdQfMYzqOFovElQXEGpvyB79qSV/vl37Cb69JE13hbA023CQqgIq
 5+KAz3xeMuHfuT7UU3PjhU6N;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vNxdI-00Fevo-0U; Tue, 25 Nov 2025 18:19:20 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v4 115/145] smb: server: make use of
 smbdirect_connection_post_recv_io()
Date: Tue, 25 Nov 2025 18:56:01 +0100
Message-ID: <25c1f3279eca2b86a3b5404df72702676decdb45.1764091285.git.metze@samba.org>
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

The only difference is that smbdirect_connection_post_recv_io()
returns early if the connection is already broken.

Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
Signed-off-by: Steve French <stfrench@microsoft.com>
---
 fs/smb/server/transport_rdma.c | 39 ++--------------------------------
 1 file changed, 2 insertions(+), 37 deletions(-)

diff --git a/fs/smb/server/transport_rdma.c b/fs/smb/server/transport_rdma.c
index e0a39558ebff..70a819fb1187 100644
--- a/fs/smb/server/transport_rdma.c
+++ b/fs/smb/server/transport_rdma.c
@@ -542,41 +542,6 @@ static void recv_done(struct ib_cq *cq, struct ib_wc *wc)
 	smbdirect_socket_schedule_cleanup(sc, -ECONNABORTED);
 }
 
-static int smb_direct_post_recv(struct smbdirect_socket *sc,
-				struct smbdirect_recv_io *recvmsg)
-{
-	struct smbdirect_socket_parameters *sp = &sc->parameters;
-	struct ib_recv_wr wr;
-	int ret;
-
-	recvmsg->sge.addr = ib_dma_map_single(sc->ib.dev,
-					      recvmsg->packet,
-					      sp->max_recv_size,
-					      DMA_FROM_DEVICE);
-	ret = ib_dma_mapping_error(sc->ib.dev, recvmsg->sge.addr);
-	if (ret)
-		return ret;
-	recvmsg->sge.length = sp->max_recv_size;
-	recvmsg->sge.lkey = sc->ib.pd->local_dma_lkey;
-
-	wr.wr_cqe = &recvmsg->cqe;
-	wr.next = NULL;
-	wr.sg_list = &recvmsg->sge;
-	wr.num_sge = 1;
-
-	ret = ib_post_recv(sc->ib.qp, &wr, NULL);
-	if (ret) {
-		pr_err("Can't post recv: %d\n", ret);
-		ib_dma_unmap_single(sc->ib.dev,
-				    recvmsg->sge.addr, recvmsg->sge.length,
-				    DMA_FROM_DEVICE);
-		recvmsg->sge.length = 0;
-		smbdirect_socket_schedule_cleanup(sc, ret);
-		return ret;
-	}
-	return ret;
-}
-
 static int smb_direct_read(struct ksmbd_transport *t, char *buf,
 			   unsigned int size, int unused)
 {
@@ -713,7 +678,7 @@ static void smb_direct_post_recv_credits(struct work_struct *work)
 
 			recvmsg->first_segment = false;
 
-			ret = smb_direct_post_recv(sc, recvmsg);
+			ret = smbdirect_connection_post_recv_io(recvmsg);
 			if (ret) {
 				pr_err("Can't post recv: %d\n", ret);
 				smbdirect_connection_put_recv_io(recvmsg);
@@ -1644,7 +1609,7 @@ static int smb_direct_prepare_negotiation(struct smbdirect_socket *sc)
 	if (!recvmsg)
 		return -ENOMEM;
 
-	ret = smb_direct_post_recv(sc, recvmsg);
+	ret = smbdirect_connection_post_recv_io(recvmsg);
 	if (ret) {
 		pr_err("Can't post recv: %d\n", ret);
 		goto out_err;
-- 
2.43.0


