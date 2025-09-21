Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BFCCB8E763
	for <lists+samba-technical@lfdr.de>; Sun, 21 Sep 2025 23:47:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=FKCaanVH/HKvXnWdBLFPgsTvOJnaQFL3U6ZUGyyEI1c=; b=JbSDUkFzYFqpCR3PO1OKqQsDy5
	ARLuyCvHauvnh/j9I10oinSyceWaeQowj79iRmvVe5mOZY7wDWJKOOH0+1b5RssNc+f6CLDY3Mwf3
	Q+WD0Pwa5PqN6TVLMK3e1NO8gOHlkqwEUUCXzxARRx75V4dF1W76aNamVQQ1sHSNz63KBiZuJ9JKt
	ZgDp7dG3C0eBloQrMDw6fuac7BKv2Iu1oMsBaUXxPsE7OaVsfRQC6FEwwk05+IZxvM/zUSza6nBMb
	BjHwyeSytveuhQIw1cU3v5b+vcr9jbzxvXehSqwI/qHc7lwAoDQqekSy4k6wYGl1nXT8gBuuhzCJz
	rDhINSzQ==;
Received: from ip6-localhost ([::1]:64610 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1v0RuR-004Tf9-Rb; Sun, 21 Sep 2025 21:47:52 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:35442) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1v0RtO-004TLj-6H
 for samba-technical@lists.samba.org; Sun, 21 Sep 2025 21:46:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=FKCaanVH/HKvXnWdBLFPgsTvOJnaQFL3U6ZUGyyEI1c=; b=yp/vTsbdKDeGg4q4tZVSrQlVnw
 wB3B4wEGXnqxmWeyJOWVqPhEtCCwgWU75Uk6Apo+7LFs5gevw9+NW54lG/gTADGFlscIoNPIcE6YY
 UfgCLSD2CT8wrODWHL/cfhuvaVkRu5jpHk5DMG3qIaXg12svbdM/3g+YtNqXJ+v9ASfbCHWpNCHRi
 xP3N/HMq+/Aoog7YV1RwR/BsASvd2JzU/2Qlxo6XZafguYAwtj+nA1f/z7x75En77BTvyfbbYBLOU
 GjPO3omNml9/Y8fx1jOlUgdtBTrGMJ7Qbl/WjoW2SpkhP+ivJ3FOjymaBz2DgN94xEY4PZnnd/xVY
 eLWjTVvZWX/2g3c8pHeXcg7Sl7AP9wkgx7IByas/ABEERySbjC4KjLdRFXEcokfQGmW7oGLPJjp2U
 BDsvuxoLTdQgXGVXI65MD/VC3I7nItgi9rV43wuJLKxdCoE12gPGQehcaIQuekpCvSFwVI1RatxFt
 bvinik/gQjFsacc4SVX0bmoJ;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1v0RtL-005GXJ-0y; Sun, 21 Sep 2025 21:46:44 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH 10/18] smb: client: defer calling ib_alloc_pd() after we are
 connected
Date: Sun, 21 Sep 2025 23:44:57 +0200
Message-ID: <cc7324dd64bc7267a21b2dec956448f32d10d315.1758489989.git.metze@samba.org>
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
Cc: Tom Talpey <tom@talpey.com>, metze@samba.org,
 Steve French <smfrench@gmail.com>, Namjae Jeon <linkinjeon@kernel.org>,
 Steve French <stfrench@microsoft.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

The protection domain is not needed until we're connected.

This makes further changes easier to follow...

Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: Long Li <longli@microsoft.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
Signed-off-by: Steve French <stfrench@microsoft.com>
---
 fs/smb/client/smbdirect.c | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/fs/smb/client/smbdirect.c b/fs/smb/client/smbdirect.c
index e6012523e422..d5e2b3009294 100644
--- a/fs/smb/client/smbdirect.c
+++ b/fs/smb/client/smbdirect.c
@@ -926,13 +926,6 @@ static int smbd_ia_open(
 	if (sc->ib.dev->attrs.kernel_cap_flags & IBK_SG_GAPS_REG)
 		sc->mr_io.type = IB_MR_TYPE_SG_GAPS;
 
-	sc->ib.pd = ib_alloc_pd(sc->ib.dev, 0);
-	if (IS_ERR(sc->ib.pd)) {
-		rc = PTR_ERR(sc->ib.pd);
-		log_rdma_event(ERR, "ib_alloc_pd() returned %d\n", rc);
-		goto out2;
-	}
-
 	return 0;
 
 out2:
@@ -1858,6 +1851,14 @@ static struct smbd_connection *_smbd_get_connection(
 		goto config_failed;
 	}
 
+	sc->ib.pd = ib_alloc_pd(sc->ib.dev, 0);
+	if (IS_ERR(sc->ib.pd)) {
+		rc = PTR_ERR(sc->ib.pd);
+		sc->ib.pd = NULL;
+		log_rdma_event(ERR, "ib_alloc_pd() returned %d\n", rc);
+		goto alloc_pd_failed;
+	}
+
 	sc->ib.send_cq =
 		ib_alloc_cq_any(sc->ib.dev, sc,
 				sp->send_credit_target, IB_POLL_SOFTIRQ);
@@ -2002,8 +2003,10 @@ static struct smbd_connection *_smbd_get_connection(
 	if (sc->ib.recv_cq)
 		ib_free_cq(sc->ib.recv_cq);
 
-config_failed:
 	ib_dealloc_pd(sc->ib.pd);
+
+alloc_pd_failed:
+config_failed:
 	rdma_destroy_id(sc->rdma.cm_id);
 
 create_id_failed:
-- 
2.43.0


