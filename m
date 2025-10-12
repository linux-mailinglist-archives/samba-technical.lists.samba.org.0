Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A6C34BD0A8E
	for <lists+samba-technical@lfdr.de>; Sun, 12 Oct 2025 21:11:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=EczH4a/lE4mr5DCu0Qj5rfn+wCdiHyux9zcbz5iTCjQ=; b=XVpKhpvxEMGCtNIgTQCF0BfCt6
	Oy5fxwlZPTaEzqjx1koAKYp2exI3rjaMB4WQgyqjE47ekGtWIPVpvunx2fnc0N3D3ysBi4J9s13Ms
	icCia2ugAlnr/MztLBjMlDJxidEUl9hrhR9QDMe4vxv+jWOFx2y9I3slMwsw/V5qO+ldyPhCrW6k/
	UoOvE/a0R4Yyzg1Uy//UpwpwRNgjTe2krkIVOGNlwGmkemnqbAMjlUyX5blomFvMhZvUr6tNgft9A
	2zAA2ABUPafXjk3SO1UIsVcByxB9efQzUDwVDs4YzOVfMGQc7SZmvKcot8KYvYSd84vo2ybbJOpgY
	gcMdgYDw==;
Received: from ip6-localhost ([::1]:57306 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1v81TB-007cJQ-2X; Sun, 12 Oct 2025 19:11:01 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:43038) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1v81T6-007cJJ-BC
 for samba-technical@lists.samba.org; Sun, 12 Oct 2025 19:10:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=EczH4a/lE4mr5DCu0Qj5rfn+wCdiHyux9zcbz5iTCjQ=; b=Ks/iFauuZhHCEEPhD7ZLk4ctyl
 ReNdcZbBP+8oQX8pnvKlJTtBe7FfVnATQQQVUoJ73I3QtvQqUHEitnYkSttZwskYOsO1xhIhbAbCV
 TWCi3f9s59NjMxXUw4ta3kW1GpCjbubiRmQDvVrsT42NehMyrN86nKMsQbqWZLyNORaPMWlJrf7bA
 dazCWtLM3cJKqXKSL+PzjR0AdsfhuJLy+h6w6pw069OYnK5oH1FOY/r5/vXRmKNg3/4mEueU4Sh1K
 qn24i6l0rS5GIVjD6GFeDjnnwkTo8OKZsEeOuJIgL/XX4zrzHZIu4SxlWoqXAJcWp9jWvDvEIaFtR
 Aij/SZM2sj0ASBiqTwcTxXzsSnznlPhwPp6x4xQHp6I3Lu7l7uIfwr7yEIjBHc5q4psNV81hXMu4J
 1pftxPK7R/QsB2CVfuxgxE+yG6j+B4wKaa8QxGwgPNmZE7zzlvS9L1O07+Cg6JXQQxfPtiR29wqyQ
 K+KrA0npQO17dLxNo+hAXAkz;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1v81T5-008nzt-1e; Sun, 12 Oct 2025 19:10:55 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH 02/10] smb: client: change smbd_deregister_mr() to return void
Date: Sun, 12 Oct 2025 21:10:22 +0200
Message-ID: <bbb80797eba59ed159bb60525edd601b0de448a2.1760295528.git.metze@samba.org>
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

No callers checks the return value and this makes further
changes easier.

Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: Long Li <longli@microsoft.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
---
 fs/smb/client/smbdirect.c | 4 +---
 fs/smb/client/smbdirect.h | 2 +-
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/fs/smb/client/smbdirect.c b/fs/smb/client/smbdirect.c
index 316f398c70f4..a20aa2ddf57d 100644
--- a/fs/smb/client/smbdirect.c
+++ b/fs/smb/client/smbdirect.c
@@ -2612,7 +2612,7 @@ static void local_inv_done(struct ib_cq *cq, struct ib_wc *wc)
  * and we have to locally invalidate the buffer to prevent data is being
  * modified by remote peer after upper layer consumes it
  */
-int smbd_deregister_mr(struct smbdirect_mr_io *smbdirect_mr)
+void smbd_deregister_mr(struct smbdirect_mr_io *smbdirect_mr)
 {
 	struct ib_send_wr *wr;
 	struct smbdirect_socket *sc = smbdirect_mr->socket;
@@ -2662,8 +2662,6 @@ int smbd_deregister_mr(struct smbdirect_mr_io *smbdirect_mr)
 done:
 	if (atomic_dec_and_test(&sc->mr_io.used.count))
 		wake_up(&sc->mr_io.cleanup.wait_queue);
-
-	return rc;
 }
 
 static bool smb_set_sge(struct smb_extract_to_rdma *rdma,
diff --git a/fs/smb/client/smbdirect.h b/fs/smb/client/smbdirect.h
index d67ac5ddaff4..577d37dbeb8a 100644
--- a/fs/smb/client/smbdirect.h
+++ b/fs/smb/client/smbdirect.h
@@ -60,7 +60,7 @@ int smbd_send(struct TCP_Server_Info *server,
 struct smbdirect_mr_io *smbd_register_mr(
 	struct smbd_connection *info, struct iov_iter *iter,
 	bool writing, bool need_invalidate);
-int smbd_deregister_mr(struct smbdirect_mr_io *mr);
+void smbd_deregister_mr(struct smbdirect_mr_io *mr);
 
 #else
 #define cifs_rdma_enabled(server)	0
-- 
2.43.0


