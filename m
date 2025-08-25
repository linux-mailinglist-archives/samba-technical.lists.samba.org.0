Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 48AE4B34DA0
	for <lists+samba-technical@lfdr.de>; Mon, 25 Aug 2025 23:08:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=oS0yl2nXy+V3u5sMzkpR/in8rkDR0nCAj3OeM8LHdtE=; b=NBT1Js044XtEY8i5lEg090aDsV
	6xiw43Vuf66oIhs5kqhTUeiZayfOgqtEOaFyQcRn2pGLQkIZ6bN0odkPzsgGIkVV/FVmiz3SAhx1I
	eqJmCwhyU4x4c6qnK0stWu8DjmU+KVwZiVAyQYv8af9xy8pj1+SGHHqTkjPKWTJS+X/930tKNgv/G
	nmrP/PvY26OwMQfL/cJ43DJ5ByVXNDddtEM4zSNd3bZsqJNan2V53/aegJXoBnG6k3ErWG4necf9o
	79Sqgarfsc6uFqrre2dUUiTv66TvvMeXoKTu6wYZ4ll6atBVp3JM4oDGUA0QhAT0jOSEeb39lWVl3
	WLm09h3A==;
Received: from ip6-localhost ([::1]:62518 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uqeQD-000Vil-63; Mon, 25 Aug 2025 21:08:09 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:43946) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uqeLg-000Tfn-Ie
 for samba-technical@lists.samba.org; Mon, 25 Aug 2025 21:03:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=oS0yl2nXy+V3u5sMzkpR/in8rkDR0nCAj3OeM8LHdtE=; b=g54lGSxDGwvdYhlTiQJBU239tQ
 n/qbbee2D2yY+JZcw6zl2jSWCvezBD1J668l8YwvR4jTjMDI4jTypy6m7XNIZdusfzVWexRNxS/yC
 s5ilN3SyCl3PtcYLdT08DNFkcot8K8K+CXZmn/GUd9xjdTon10qR1g6n0lcw1W9HMxYhJ+LgCMMST
 LYNt83DDchkNrwq6WJ3Baw+QvnL4e5Ntctd+lE/uq08vjfrNoafJapv9u3d/drR8KQQnaGuykWdh7
 DEhKrFLlQdqM8GrHA3QTLdJSI2DqXdA1H0QDKJ1cTSWnunXzxdJSmK93tF5+bGAVXMdkFLVl2UWkA
 kV60itUTjs9Ah0Atc+xBISSZJfMWjr391riJBqkprq9FaSx7bCQU7OBKybc3SBQ43K+QFTh0HfJMZ
 Ru/tqHM5HrGt2V0dVzxV6g+pf2E73xpX3RjLfQj2wCmgsitz9i7K9F6t70qut5jH7pITAmWzx77qp
 yvMSl3q5fpIUnnmMLtDNDmoP;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uqeLf-000nYA-13; Mon, 25 Aug 2025 21:03:27 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v4 130/142] smb: server: pass struct smbdirect_socket to
 smb_direct_post_send()
Date: Mon, 25 Aug 2025 22:41:31 +0200
Message-ID: <1228751a1156b983be3631088e2f84402b022593.1756139607.git.metze@samba.org>
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
 fs/smb/server/transport_rdma.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/fs/smb/server/transport_rdma.c b/fs/smb/server/transport_rdma.c
index d2e587ae3931..d29afc4be6a7 100644
--- a/fs/smb/server/transport_rdma.c
+++ b/fs/smb/server/transport_rdma.c
@@ -879,10 +879,9 @@ static int manage_keep_alive_before_sending(struct smb_direct_transport *t)
 	return 0;
 }
 
-static int smb_direct_post_send(struct smb_direct_transport *t,
+static int smb_direct_post_send(struct smbdirect_socket *sc,
 				struct ib_send_wr *wr)
 {
-	struct smbdirect_socket *sc = &t->socket;
 	int ret;
 
 	atomic_inc(&sc->send_io.pending.count);
@@ -931,7 +930,7 @@ static int smb_direct_flush_send_list(struct smb_direct_transport *t,
 		last->wr.ex.invalidate_rkey = send_ctx->remote_key;
 	}
 
-	ret = smb_direct_post_send(t, &first->wr);
+	ret = smb_direct_post_send(sc, &first->wr);
 	if (!ret) {
 		smb_direct_send_ctx_init(send_ctx,
 					 send_ctx->need_invalidate_rkey,
@@ -1151,7 +1150,7 @@ static int post_sendmsg(struct smb_direct_transport *t,
 
 	msg->wr.wr_cqe = &msg->cqe;
 	msg->wr.send_flags = IB_SEND_SIGNALED;
-	return smb_direct_post_send(t, &msg->wr);
+	return smb_direct_post_send(sc, &msg->wr);
 }
 
 static int smb_direct_post_send_data(struct smb_direct_transport *t,
-- 
2.43.0


