Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C983B34D8C
	for <lists+samba-technical@lfdr.de>; Mon, 25 Aug 2025 23:06:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=vj8FPEHoTwHX2uOxr7ww/agmAMJWfZnIq6G/jKoRBGI=; b=OAyijS9fIEqvmTFGztJGTH9Dss
	hqyTaztFPRIToRspmYIR+hz4DpE7MelCe+KKzAUPpfD/zBR8GNRFqA4D03iaXkNi9JXCMYdT0lZBK
	OnoGMWQ5M/ZQYoHomBt+n48G2xlwTxRncmT8ZzPIlxrS5jlwLErL8JcMMu7VufursSPRR0ohB6pJd
	d6EZx/gNsnHrd7QU/78Lj8WyO3gL53U+CM46lK+quptJoR3IVKWn8uHv2JBFyDnINzE15/1qeCbmq
	KcSa0m51nfFVug11JV6vQNVp/sfs4kcLlYRL3X69Ve2e+0ViGIkD+q8y594Nr2SWfFTYYDqr5A8gI
	SA60H7mQ==;
Received: from ip6-localhost ([::1]:23326 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uqeOJ-000Ulf-PP; Mon, 25 Aug 2025 21:06:12 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:50740) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uqeJn-000Srq-EY
 for samba-technical@lists.samba.org; Mon, 25 Aug 2025 21:01:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=vj8FPEHoTwHX2uOxr7ww/agmAMJWfZnIq6G/jKoRBGI=; b=ueZRU0RXpzsr+nT37s3uRdjCEc
 cmCttACNAlTHNOOvYP4ZCrsEOSAWrXzMzTpp62/M/n4t+YOQpLRib/GIUP935GLqKM4O7z6PV0RP3
 8ViWk9It2PKVVvPBYGUMjz01vs/Ayx2PXRRuKgZuL2YxfMxuGndrBDewqvqumb3jBIt1aNQyd3HzO
 K5kn9+wWOJ6lrTxicLFOfIc+YGxSJ5SL7FxIyMWVsEjVWz0pWVUhf0nK5YOuEP1O4n1O9u1X5ICE6
 KgmpwQCBprD1klIXDQ0Gti4jF17QFHN8Jidva/3ugimWXw2XLXA5XUfgJEtzE/GUt8o9JzxfBvpxt
 RkgvLbiaBTEDmcN4QcK27YyZvoiORhn8FuW09oqrKwGEf6COEANYsJue5loWX6EI4ovXzkK/V2Lyc
 IgBTdIKToMorUVs4EbxRX3kp58PZysF53qJEdv+Wb05NFgnjnAQWareodM5UGxb6HRiuTVJyCFW3u
 qw/bsNRL1LK6IKkrsWNztvlK;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uqeJk-000n9G-27; Mon, 25 Aug 2025 21:01:28 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v4 118/142] smb: server: pass struct smbdirect_socket to
 smb_direct_get_max_fr_pages()
Date: Mon, 25 Aug 2025 22:41:19 +0200
Message-ID: <78953f40483affa55c3a85daffb4e60b74a59d69.1756139607.git.metze@samba.org>
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
 fs/smb/server/transport_rdma.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/fs/smb/server/transport_rdma.c b/fs/smb/server/transport_rdma.c
index 1aabd617c6ec..08f0128c804c 100644
--- a/fs/smb/server/transport_rdma.c
+++ b/fs/smb/server/transport_rdma.c
@@ -1749,10 +1749,8 @@ static int smb_direct_prepare_negotiation(struct smb_direct_transport *t)
 	return ret;
 }
 
-static unsigned int smb_direct_get_max_fr_pages(struct smb_direct_transport *t)
+static unsigned int smb_direct_get_max_fr_pages(struct smbdirect_socket *sc)
 {
-	struct smbdirect_socket *sc = &t->socket;
-
 	return min_t(unsigned int,
 		     sc->ib.dev->attrs.max_fast_reg_page_list_len,
 		     256);
@@ -1783,7 +1781,7 @@ static int smb_direct_init_params(struct smb_direct_transport *t,
 	 * are needed for MR registration, RDMA R/W, local & remote
 	 * MR invalidation.
 	 */
-	sc->rw_io.credits.num_pages = smb_direct_get_max_fr_pages(t);
+	sc->rw_io.credits.num_pages = smb_direct_get_max_fr_pages(sc);
 	sc->rw_io.credits.max = DIV_ROUND_UP(sp->max_read_write_size,
 					 (sc->rw_io.credits.num_pages - 1) *
 					 PAGE_SIZE);
-- 
2.43.0


