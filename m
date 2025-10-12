Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E3A4ABD0AB7
	for <lists+samba-technical@lfdr.de>; Sun, 12 Oct 2025 21:12:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=TTG87p9EX6OEbiHnb0VOAY5QcJqelTnSevzVHSKWU8s=; b=l84BXqAv594zydDW8Ga5VSbwjy
	MMaN9YbK4z8k2fCIvZ1xDBjiPo/Tt8LJXMaj+AJ7xvo+dMqMzulsVn95Ra2/tPLxw8paJzp6FZNzc
	WseJTCmlFY/P+OpO6NqqiXMN5U7ku5K/px2gpY8jTze61bZbZBJR8rFOaHkOiYXe4lXJg7ixXVwX/
	rx1Ip9vH9XPN6tSGpyALgjpxa99auEVkJ0XlBjijTkpjFMKdWqLPlHqo+DobHLu84D+A4OhnJQUA5
	9gXHdLFyBgglZH746gVE7J9HdiOJ+AvgM8+B03agM3BWRGlwGLEFGPfEdC85+kMRL+6tA8jR6vEz8
	/OeCglNQ==;
Received: from ip6-localhost ([::1]:50000 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1v81UW-007cpX-Kf; Sun, 12 Oct 2025 19:12:25 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:26758) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1v81Tt-007ccr-9T
 for samba-technical@lists.samba.org; Sun, 12 Oct 2025 19:11:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=TTG87p9EX6OEbiHnb0VOAY5QcJqelTnSevzVHSKWU8s=; b=VZc/gnZq4vj6ongz0B8eq+SAJF
 WFqmi83p6cqmw5NObUt5uSS+jhY6CnvCCAJkdYJIA7uLEV9gq0zwXd1pac4pA2krW5pwOyTLiH6xR
 saiYp+lznsxknUp8H+OUnxT/+VRbEfravZhu6h/M35WnuzeBucaId+o2Y7FgNakMnsU6zv5zNKYmr
 waHNA/l7xZyZ8v/2b/OO/cbGEeWwQMqfxHKTyvjb8OAD0JhROUH429LaCh8Cpy4mDHB3AhWNkgVIp
 OX0KEZRXVKynGV0UNynI0+H1J/veZAJ2JbIMApfuRsBZaSjopPzRhSR8EW37iIL9+GaPG6tP7hUdu
 CEyPus/caHxRvpDcj5mqD8PRog4iDdNH1acdiYPq/ejfcWthgRjFpdyPT9imc9ydtCF2r7pQ0cfeM
 Xzk2XYyo3F5pRs6IhfA+diyyxFrAe9uLledEO3YL7V81zY4Z/MFORKiez12plxcacOrfb6EnSeYGG
 psTwTOY1PD59RqPwVsWMiQL8;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1v81To-008o7C-1G; Sun, 12 Oct 2025 19:11:41 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH 08/10] smb: client: call ib_dma_unmap_sg if mr->sgt.nents is
 not 0
Date: Sun, 12 Oct 2025 21:10:28 +0200
Message-ID: <80fd0da52841a169d780af362d928d25cb948134.1760295528.git.metze@samba.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1760295528.git.metze@samba.org>
References: <cover.1760295528.git.metze@samba.org>
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

This seems to be the more reliable way to check if we need to
call ib_dma_unmap_sg().

Fixes: c7398583340a ("CIFS: SMBD: Implement RDMA memory registration")
Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: Long Li <longli@microsoft.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
---
 fs/smb/client/smbdirect.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/fs/smb/client/smbdirect.c b/fs/smb/client/smbdirect.c
index af0642e94d7e..21dcd326af3d 100644
--- a/fs/smb/client/smbdirect.c
+++ b/fs/smb/client/smbdirect.c
@@ -2365,9 +2365,8 @@ static void destroy_mr_list(struct smbdirect_socket *sc)
 	spin_unlock_irqrestore(&sc->mr_io.all.lock, flags);
 
 	list_for_each_entry_safe(mr, tmp, &all_list, list) {
-		if (mr->state == SMBDIRECT_MR_INVALIDATED)
-			ib_dma_unmap_sg(sc->ib.dev, mr->sgt.sgl,
-				mr->sgt.nents, mr->dir);
+		if (mr->sgt.nents)
+			ib_dma_unmap_sg(sc->ib.dev, mr->sgt.sgl, mr->sgt.nents, mr->dir);
 		ib_dereg_mr(mr->mr);
 		kfree(mr->sgt.sgl);
 		list_del(&mr->list);
@@ -2589,6 +2588,7 @@ struct smbdirect_mr_io *smbd_register_mr(struct smbd_connection *info,
 	ib_dma_unmap_sg(sc->ib.dev, mr->sgt.sgl, mr->sgt.nents, mr->dir);
 
 dma_map_error:
+	mr->sgt.nents = 0;
 	mr->state = SMBDIRECT_MR_ERROR;
 	if (atomic_dec_and_test(&sc->mr_io.used.count))
 		wake_up(&sc->mr_io.cleanup.wait_queue);
@@ -2651,8 +2651,12 @@ void smbd_deregister_mr(struct smbdirect_mr_io *mr)
 		 */
 		mr->state = SMBDIRECT_MR_INVALIDATED;
 
-	if (mr->state == SMBDIRECT_MR_INVALIDATED) {
+	if (mr->sgt.nents) {
 		ib_dma_unmap_sg(sc->ib.dev, mr->sgt.sgl, mr->sgt.nents, mr->dir);
+		mr->sgt.nents = 0;
+	}
+
+	if (mr->state == SMBDIRECT_MR_INVALIDATED) {
 		mr->state = SMBDIRECT_MR_READY;
 		if (atomic_inc_return(&sc->mr_io.ready.count) == 1)
 			wake_up(&sc->mr_io.ready.wait_queue);
-- 
2.43.0


