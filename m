Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B0A9AC1AE96
	for <lists+samba-technical@lfdr.de>; Wed, 29 Oct 2025 14:48:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=OhJTZ9oRk9jzh5nqVby15Dd+Lx5iRXXhH38/lbzJaT4=; b=KTCuL7vGffs2F1aFbFW290sSJO
	MRxgYBMqENTwTW/a7U5k9vGLRPHRRPV/OU/mHxN/GiHCwzCrdWxOElj2KaN84z2P68Gg6f6BWpubt
	0u6tiHitVxb1I8oF3DYHbzy/zCfBv3BIDDWWeuplIqEPWjhI1GUEi4bN65O4fLv3bpLUUykmcXZoY
	t4/dPMLEh110HkNlSDX2gwm0IJk+o59F/Vi0spEyyyvrGIpY1eeqrQtMYuFk4wQmwgJO0OzrYniRg
	Axbt95EUWv7pkjqC/2eUgXj7XJzv1ahYnGvqdvuEYeAkw6sV/vVKAXZ1HGdRwQxhn/dw927bNtr5B
	glB0Ecdg==;
Received: from ip6-localhost ([::1]:21056 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vE6Xd-009Duu-Ij; Wed, 29 Oct 2025 13:48:46 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:61678) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vE6Iv-0098au-NX
 for samba-technical@lists.samba.org; Wed, 29 Oct 2025 13:33:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=OhJTZ9oRk9jzh5nqVby15Dd+Lx5iRXXhH38/lbzJaT4=; b=i9UiArdruFRwl6L3xbQEwaiYge
 PGAzMErL145Zv6XjH/5Vbibrk/0Qru2u3vsH5EhwgDV0x3bJW5qG0Fv/p+qQnU9vxdxArSdpIvQYV
 aWdFRRrBdIgwa9Kr4jY7aHUwBH+ePDwRWaWNEgTaFmnrOQgAOzUqMxutB+JvDsUQXXhAc1jKnXOER
 4HToCQwDZVT/FpC9uss7WJ4+tw856eKBoYmnpzZizr9a7IY8Ogmhv/o+dvvY53VY7TM4q76gPMq96
 oNQwmjqjPebKp7k9m4PEbK0sGIj2Wv4X5D290yOgCXkvKtJnj3c0QzPyODExkriNZHwk2G5uRyI57
 LroNPYsF9W/krar6rMPrAL5C3V44NoKVh5j7TWPOjEGcazfC0H7snxFyt2oyq0fbrGjs8Xt7L9hRM
 KJopERLM5XyLXFT7d5ihLsogITuJAzZ2f4ilZgALc5/zomPjzmzx74GjDTbMSUUX6gj5+YNxfA1XI
 m74PyPO2IM1R8I+AMtkOEv9E;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vE6Ip-00Bcvd-2W; Wed, 29 Oct 2025 13:33:27 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v2 109/127] smb: server: make use of
 smbdirect_connection_post_recv_io()
Date: Wed, 29 Oct 2025 14:21:27 +0100
Message-ID: <c204e5ed451d250b373759562b46df7b71e3cd2e.1761742839.git.metze@samba.org>
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
index 0919ef007602..4acae8e43b76 100644
--- a/fs/smb/server/transport_rdma.c
+++ b/fs/smb/server/transport_rdma.c
@@ -531,41 +531,6 @@ static void recv_done(struct ib_cq *cq, struct ib_wc *wc)
 	smbdirect_connection_schedule_disconnect(sc, -ECONNABORTED);
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
-		smbdirect_connection_schedule_disconnect(sc, ret);
-		return ret;
-	}
-	return ret;
-}
-
 static int smb_direct_read(struct ksmbd_transport *t, char *buf,
 			   unsigned int size, int unused)
 {
@@ -702,7 +667,7 @@ static void smb_direct_post_recv_credits(struct work_struct *work)
 
 			recvmsg->first_segment = false;
 
-			ret = smb_direct_post_recv(sc, recvmsg);
+			ret = smbdirect_connection_post_recv_io(recvmsg);
 			if (ret) {
 				pr_err("Can't post recv: %d\n", ret);
 				smbdirect_connection_put_recv_io(recvmsg);
@@ -1621,7 +1586,7 @@ static int smb_direct_prepare_negotiation(struct smbdirect_socket *sc)
 	if (!recvmsg)
 		return -ENOMEM;
 
-	ret = smb_direct_post_recv(sc, recvmsg);
+	ret = smbdirect_connection_post_recv_io(recvmsg);
 	if (ret) {
 		pr_err("Can't post recv: %d\n", ret);
 		goto out_err;
-- 
2.43.0


