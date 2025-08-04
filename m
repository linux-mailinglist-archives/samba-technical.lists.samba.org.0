Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B17FB1A10E
	for <lists+samba-technical@lfdr.de>; Mon,  4 Aug 2025 14:16:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=pQpTV+DYgQ7E7wDXixzm7t+Czo/aPc6CDk/yw94DBE4=; b=21qKJ7bKjytvKlfVzyPeYEJjnv
	6D15Lga1I0fighJbSqzJ2g9NzKfXzoWRwUVaWWfj5sJlwESUu5INWjfA2BtTX+9/ewJIBpW3Aj0hW
	Va5/t3dYD3cNlEzl38aM7nnkgUedNbSvfsZxp3TNBwmC2Y2MNYoS2NTVT6otSKSBE0mw+jV38fQSq
	pgerYU7bx4qD3oI2xOZOKIvmNnoyUISQqmYvNV5Znjf47Dj9jdFHdX/Qk/Ijw5SN2fSjQwFDWn5Wf
	Ho43EjN4OchGad1bqz76BHO+73Sc4Neo1mrTiYS55tsIFa68H6ik3H/sJZ8a3aJ/jv6lqcnF4M5F9
	llyiqrXg==;
Received: from ip6-localhost ([::1]:25652 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uiu7L-00EIBi-VP; Mon, 04 Aug 2025 12:16:40 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:15876) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uiu7E-00EI9m-7M
 for samba-technical@lists.samba.org; Mon, 04 Aug 2025 12:16:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=pQpTV+DYgQ7E7wDXixzm7t+Czo/aPc6CDk/yw94DBE4=; b=RnqPU51PHySIyTUF/cSbYEIBOa
 Y4o/y+sUTUcMGxHL9hKJp0smdoWEhL/k3tNRdnQt0/JF5wNTJUcJadTQ1cW0BTmuljH8Zba5hQA8I
 D9nnAogSyGjW7ljyMgW44brjnzD8D8WV5LDvI5ccTb3tvcda2L3YyQXz4Bb06KsklMYjLDwAIixme
 M4SudGLccHnKXTSnYJkKuvLQdkpkQ2pGK0xDwLSJA3TRySX584uZwaLXTbTlqk64D3eYECModquxD
 yWwMuoVambsKurdfD/vgzkheFyohhHOpEaQubdlynqeyzWoEgKXsCr6+M67D3x0iDU3LOUjMnKcFZ
 C0TYxHWyPP6/NFYbYJQ/A/i5IR/sMijOuUAChVeXy6z3Lz7PfPMaozvh3lZHZrk1XfPh/AOkMxwUA
 BeMg4c29SZBEfSlVcmMoqmZrJ6baTqglJLfyD5eE14ne8VCHZJwUZ/Yy3T7MuZbz7wia1P8EAmEyf
 4ZrWrY8ywJicwjQS88kuideG;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uiu7D-000wEQ-0D; Mon, 04 Aug 2025 12:16:31 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH 2/4] smb: server: make sure we call ib_dma_unmap_single() only
 if we called ib_dma_map_single already
Date: Mon,  4 Aug 2025 14:15:51 +0200
Message-ID: <887cc1b3931b16c2c11062fecb51e9899498fa15.1754309565.git.metze@samba.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1754309565.git.metze@samba.org>
References: <cover.1754309565.git.metze@samba.org>
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

In case of failures either ib_dma_map_single() might not be called yet
or ib_dma_unmap_single() was already called.

We should make sure put_recvmsg() only calls ib_dma_unmap_single() if needed.

Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Fixes: 0626e6641f6b ("cifsd: add server handler for central processing and tranport layers")
Signed-off-by: Stefan Metzmacher <metze@samba.org>
---
 fs/smb/server/transport_rdma.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/fs/smb/server/transport_rdma.c b/fs/smb/server/transport_rdma.c
index 393254109fc4..fac82e60ff80 100644
--- a/fs/smb/server/transport_rdma.c
+++ b/fs/smb/server/transport_rdma.c
@@ -265,8 +265,13 @@ smb_direct_recvmsg *get_free_recvmsg(struct smb_direct_transport *t)
 static void put_recvmsg(struct smb_direct_transport *t,
 			struct smb_direct_recvmsg *recvmsg)
 {
-	ib_dma_unmap_single(t->cm_id->device, recvmsg->sge.addr,
-			    recvmsg->sge.length, DMA_FROM_DEVICE);
+	if (likely(recvmsg->sge.length != 0)) {
+		ib_dma_unmap_single(t->cm_id->device,
+				    recvmsg->sge.addr,
+				    recvmsg->sge.length,
+				    DMA_FROM_DEVICE);
+		recvmsg->sge.length = 0;
+	}
 
 	spin_lock(&t->recvmsg_queue_lock);
 	list_add(&recvmsg->list, &t->recvmsg_queue);
@@ -638,6 +643,7 @@ static int smb_direct_post_recv(struct smb_direct_transport *t,
 		ib_dma_unmap_single(t->cm_id->device,
 				    recvmsg->sge.addr, recvmsg->sge.length,
 				    DMA_FROM_DEVICE);
+		recvmsg->sge.length = 0;
 		smb_direct_disconnect_rdma_connection(t);
 		return ret;
 	}
@@ -1819,6 +1825,7 @@ static int smb_direct_create_pools(struct smb_direct_transport *t)
 		if (!recvmsg)
 			goto err;
 		recvmsg->transport = t;
+		recvmsg->sge.length = 0;
 		list_add(&recvmsg->list, &t->recvmsg_queue);
 	}
 	t->count_avail_recvmsg = t->recv_credit_max;
-- 
2.43.0


