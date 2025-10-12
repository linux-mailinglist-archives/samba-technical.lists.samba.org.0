Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B2F1BD0ABD
	for <lists+samba-technical@lfdr.de>; Sun, 12 Oct 2025 21:12:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=voBS6RyuUxPMBSH2R7pCqkqRRHrWZabO6HsTgzBzjSE=; b=hEonPLcDJ/yTPTEEZd0P5XTIwT
	y3SS8jSH4QW8DonYdmWiIV8w5j8yv/4QpN/UyGLdbcJSdeqJsqQHx8v0a4/psJYErMndQDGmokJqW
	rSO1T1g31iSWN7VYpDtaGdshnaF/gtdM1ne+ot8n+b0DRrZmWRYFtpEtBmmTjBw5VdGyyszoDwB4Z
	JM+uk6/VegQQBkNizQ3qa6FbiVzh9oFtRC7NxpZ3mubSGOE5M56QeGYx/wAI1SjOFK2Lsb6QJD1/s
	3g01NbXOgQRmeDPlK9L4PXc8MlN+rwFAaOA8ds3PYm88Ga66+o1oO+juvhuaS3B59dJgj25j1xQRg
	i7bHLgVg==;
Received: from ip6-localhost ([::1]:61784 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1v81Uh-007cto-Gf; Sun, 12 Oct 2025 19:12:36 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:35244) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1v81UK-007coP-E6
 for samba-technical@lists.samba.org; Sun, 12 Oct 2025 19:12:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=voBS6RyuUxPMBSH2R7pCqkqRRHrWZabO6HsTgzBzjSE=; b=CDGwdUHsC0XSbmszsSQ2K3LQWE
 S7zttLS58/Bj51myyefohs/JIrrFsTYUx8qi39Y8oQGaLU4Eu/ciZPWhKdVIijGbA69d23G+I535f
 h0tc0hf+WV96d2/P5bQJ49CW+f3SUNh3ol2KHLPS6tIHrUSB6sPnMfB/bOLJe7RfSEJo1dD/2Qr1J
 KwT+KbduRGiB1Vzjy97Hxqn3vv9T6tJ5N+ZBy/OfneRnQDNUaLjEZdBxgfausAkHMijQzNBKSPZhJ
 Le/VuhP7LMSbj/ugZi0OTCyfvT4htVYDwbjBS0LpFDCbgwNdnlgRs0BUvIUIfK14QKizOkTL1RuCg
 oRtU8J1mvMOmqvJYL0Sj6Ts1rVJ6nWUXcBtw0TKm0ltQZJMJivGkM7XvgILE8SEPMqDpHi+jP7Td5
 fDtesqR/sZb1mc47Aq14J6VF7C1gpJ+xKyJ54bR2K1R7xYNnRseqyV6tmel7eoH98wePqzUG/8j0e
 Z3BCvAU2hYShB2oZAWv+e9yP;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1v81UH-008oEB-1M; Sun, 12 Oct 2025 19:12:09 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH 09/10] smb: client: let destroy_mr_list() call ib_dereg_mr()
 before ib_dma_unmap_sg()
Date: Sun, 12 Oct 2025 21:10:29 +0200
Message-ID: <dbfcd599ca86c5fb47099d2d8ed22f7520f26c90.1760295528.git.metze@samba.org>
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

This is more consistent as we call ib_dma_unmap_sg() only
when the memory is no longer registered.

This is the same pattern as calling ib_dma_unmap_sg() after
IB_WR_LOCAL_INV.

Fixes: c7398583340a ("CIFS: SMBD: Implement RDMA memory registration")
Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: Long Li <longli@microsoft.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
---
 fs/smb/client/smbdirect.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/fs/smb/client/smbdirect.c b/fs/smb/client/smbdirect.c
index 21dcd326af3d..c3330e43488f 100644
--- a/fs/smb/client/smbdirect.c
+++ b/fs/smb/client/smbdirect.c
@@ -2365,9 +2365,10 @@ static void destroy_mr_list(struct smbdirect_socket *sc)
 	spin_unlock_irqrestore(&sc->mr_io.all.lock, flags);
 
 	list_for_each_entry_safe(mr, tmp, &all_list, list) {
+		if (mr->mr)
+			ib_dereg_mr(mr->mr);
 		if (mr->sgt.nents)
 			ib_dma_unmap_sg(sc->ib.dev, mr->sgt.sgl, mr->sgt.nents, mr->dir);
-		ib_dereg_mr(mr->mr);
 		kfree(mr->sgt.sgl);
 		list_del(&mr->list);
 		kfree(mr);
-- 
2.43.0


