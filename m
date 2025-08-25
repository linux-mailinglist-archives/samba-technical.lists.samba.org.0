Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 63A28B34D0B
	for <lists+samba-technical@lfdr.de>; Mon, 25 Aug 2025 22:57:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=x8OsJE/W1lEUAFXssSWU3xsHKu/axgP/3qd1XffcU+Y=; b=abxFnvmerQupeSOS66x7iuu04q
	n1a6bRzv7weYHvHNa5PkrQrkOl8mM4y09dqEpxnEBwQFCqXg3O4HjtG5XxLksS5zYNZK1/AzZL0Ca
	Qx9QQcLC0NMK/W4Z/FPvqDo0aEjIXTLd+eQG98OCY/LBPsGMfR1J6y8EiAzGX9N/2NBpSP0BDu3Rr
	ARMNToj/0Lb++YjXFHrUxKEXyu3yciAmIDUUX1xs5L8GmLIY3K0iYdfBfmga0AdYvtS9Adb3V6eqw
	LhhM44kwyQiSF2Ji6DZxs4qFYkEndQaezBO6kD9UX8rqKa8IuVdU8X6PpCWGWe1HjbUofkxNsOXGN
	GuZ6WJxQ==;
Received: from ip6-localhost ([::1]:49158 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uqeGA-000RFY-FT; Mon, 25 Aug 2025 20:57:46 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:47834) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uqeCp-000Q1y-Gi
 for samba-technical@lists.samba.org; Mon, 25 Aug 2025 20:54:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=x8OsJE/W1lEUAFXssSWU3xsHKu/axgP/3qd1XffcU+Y=; b=enfKGYRpV/pQcwVjZbSjXOWdDx
 CyaDL8Cb8XbwN7yw9gRNHZXjisatjSH4jEqPlKmMJLL2NQsEluYnBWqa19lXVNxNx+yqeQDtMdsaQ
 GwZBBere4qEi7z7bQbD2+zqKtCY62c8vb+UQofa7VBcTvNJwK2TYu9UsoRlilgdPP0wUOdF5GqrEl
 4FZHeCYpr2+Dyl4RUQr+yGPDCgSFbupDfChd/YZ94x3MaZdr+U1zXOH4/GngMwe4sT5ZKpsYAJmfh
 iqbFLsvgy0KS+e/6yc2XpmPqbmrIqZps6ic9tFOxWxVvq5OpQqPytrUBktcjWziJUlqgGP0bjEqZi
 W00pRjXEYMCKG+Lz4XO8EKGIIb5Z0IYIuKFKMexe1bs45yONkWEqYKjliZPd40YIpdgqpIwFSrYw7
 0g2xczG/vy4KwF1oMOMRhg42j1X7j9tDii7F2Qvyp246obq2a4HXdvwwlAAav3tYNhLrGglzBygPY
 U3rJ8qSYQiGhbMADDprS3emE;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uqeCm-000liw-24; Mon, 25 Aug 2025 20:54:16 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v4 075/142] smb: client: remove unused struct smbdirect_socket
 argument of smbd_iter_to_mr()
Date: Mon, 25 Aug 2025 22:40:36 +0200
Message-ID: <9cfd603f478d090bb4d2099e34d754917e0aca5a.1756139607.git.metze@samba.org>
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
 Tom Talpey <tom@talpey.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This will make it easier to move function to the common code
in future.

Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: Long Li <longli@microsoft.com>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
---
 fs/smb/client/smbdirect.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/fs/smb/client/smbdirect.c b/fs/smb/client/smbdirect.c
index 8033be07bc77..d3cd89bd2cc7 100644
--- a/fs/smb/client/smbdirect.c
+++ b/fs/smb/client/smbdirect.c
@@ -2321,8 +2321,7 @@ static struct smbdirect_mr_io *get_mr(struct smbdirect_socket *sc)
 /*
  * Transcribe the pages from an iterator into an MR scatterlist.
  */
-static int smbd_iter_to_mr(struct smbd_connection *info,
-			   struct iov_iter *iter,
+static int smbd_iter_to_mr(struct iov_iter *iter,
 			   struct sg_table *sgt,
 			   unsigned int max_sg)
 {
@@ -2377,7 +2376,7 @@ struct smbdirect_mr_io *smbd_register_mr(struct smbd_connection *info,
 
 	log_rdma_mr(INFO, "num_pages=0x%x count=0x%zx depth=%u\n",
 		    num_pages, iov_iter_count(iter), sp->max_frmr_depth);
-	smbd_iter_to_mr(info, iter, &smbdirect_mr->sgt, sp->max_frmr_depth);
+	smbd_iter_to_mr(iter, &smbdirect_mr->sgt, sp->max_frmr_depth);
 
 	rc = ib_dma_map_sg(sc->ib.dev, smbdirect_mr->sgt.sgl,
 			   smbdirect_mr->sgt.nents, dir);
-- 
2.43.0


