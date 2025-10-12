Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FE77BD0A9F
	for <lists+samba-technical@lfdr.de>; Sun, 12 Oct 2025 21:11:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=hRIn8/fTMfm2RzHetMjt3FbglELaW9ofsowj6oUWlJs=; b=xl3ivFn/PnYHVfSRHy6bVb9Hv1
	RbmFQoAtMbgYkWmuTFnLUuyc7xFufs4iNSQWQRehCKJw0eSrJtVElgieLbMpy6RS5/vzDQ8GmLmfT
	jot3eBPdznCWJcPehC7kT0ilUPjX9N3Fygm4XjYHcrnefbvRzXT2IfzFXLhHUoV0SB5E6XHgLinLz
	fh+/qStPUiQ8PIz/xMgqeSbwahE1oeYZWVQfyWLo/sjjvykkduU8L3RSqxLkK8G8StrdAagWTdMe7
	w7XQrno1QhM+9sobupVXOTsTAWD37yV1Hgn2vRlEQgcUFZSWul3vGRBYLZmhmrU+SHo158eyxwX0W
	DIUwMoWA==;
Received: from ip6-localhost ([::1]:28764 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1v81Tr-007cVs-0S; Sun, 12 Oct 2025 19:11:44 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:17184) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1v81TM-007cP6-VO
 for samba-technical@lists.samba.org; Sun, 12 Oct 2025 19:11:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=hRIn8/fTMfm2RzHetMjt3FbglELaW9ofsowj6oUWlJs=; b=ulvfB/4+conEd9n/7EWytsdgYw
 w77c/TWmRjX5Jjb+avww7BYI3Axg2I6sPJ5lVDGTuTCAv4rZiU8DCU8md6/Ny3roE+8lJZeVT+CuR
 tqH5XG8gVCLy/j8D5Llt576VN5BPyV4NvShTtx9OFfic6ZkV/5RW+3T/+egGIjluNNUufg/xNKuNz
 dmjluJD3BBAqVXPAOCwnzzlZNs/cDH9UfZHBb+omIklVKblOw3xgESyRuwnNOlXM3JpLARUxgG/tf
 NL0w2ipUOf+5XOAssaUhFVKxLTNeBeXow8+n70Oo2fcINeDeZRQe2eCYqGywwtEfw6GeCF3Ox/LhJ
 5H+EIqLWjcR2bQw1MftmAAecLQ7h/+hPDFJ51IZ63qRIJ5cd25XP6ryJFvGgLxOTtah6IwwGG68GS
 nI4EHVhucuPCjkq322jad+zEJLnq3EkefRQ6IctK4yBhFK5q7sb6QvBQVkM1paEjNOlIjeSpckTvd
 XQvF4A83xcCfkNH1tdm4l2KL;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1v81TK-008o0z-0J; Sun, 12 Oct 2025 19:11:10 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH 04/10] smb: client: let destroy_mr_list() remove locked from
 the list
Date: Sun, 12 Oct 2025 21:10:24 +0200
Message-ID: <52d3cc6ab2a0d454b6db4a8a6fbc4d586d371f5e.1760295528.git.metze@samba.org>
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

This should make sure get_mr() can't see the removed entries.

Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: Long Li <longli@microsoft.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
---
 fs/smb/client/smbdirect.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/fs/smb/client/smbdirect.c b/fs/smb/client/smbdirect.c
index b7be67dacd09..b974ca4e0b2e 100644
--- a/fs/smb/client/smbdirect.c
+++ b/fs/smb/client/smbdirect.c
@@ -2355,9 +2355,16 @@ static void smbd_mr_recovery_work(struct work_struct *work)
 static void destroy_mr_list(struct smbdirect_socket *sc)
 {
 	struct smbdirect_mr_io *mr, *tmp;
+	LIST_HEAD(all_list);
+	unsigned long flags;
 
 	disable_work_sync(&sc->mr_io.recovery_work);
-	list_for_each_entry_safe(mr, tmp, &sc->mr_io.all.list, list) {
+
+	spin_lock_irqsave(&sc->mr_io.all.lock, flags);
+	list_splice_tail_init(&sc->mr_io.all.list, &all_list);
+	spin_unlock_irqrestore(&sc->mr_io.all.lock, flags);
+
+	list_for_each_entry_safe(mr, tmp, &all_list, list) {
 		if (mr->state == SMBDIRECT_MR_INVALIDATED)
 			ib_dma_unmap_sg(sc->ib.dev, mr->sgt.sgl,
 				mr->sgt.nents, mr->dir);
-- 
2.43.0


