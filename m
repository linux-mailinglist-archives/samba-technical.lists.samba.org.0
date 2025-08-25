Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 46362B34DA1
	for <lists+samba-technical@lfdr.de>; Mon, 25 Aug 2025 23:08:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=KQDLTfiMCyb0U7S54nktlS5dL1/Nh4CX7psSRQehF3I=; b=vf4KvuX1ZchnmaOcOoT1fjimDq
	GmMLk0qomopjgmREgS1q4m5CLXhMlTqq5ex9WlUu3Zj+1wsWNYEeo8Cm+A0gpNiqvhGqEpm+N9Q06
	cpH817l9x/Wy0omfe0kLkoU4s1O39H6N5KO8Sy1DLa7m3k1tavrXW726KWY3ZOcJkvuPK8wU7Ty2y
	ym450Bn2BCB6ZDtCAGUZ6unvwzO/1cvCbaU5kro6JUesHBycK8bFnZTzaxVDAcH3ySJF/9DzZCFdI
	wRfZSovthrOvYcTxR7UsKHwS35FqbxdBwMoZhqHcKkdXmEPyphPxQMqq2KMx+6+ZreySnx9YK5B7x
	Q3HiCJ/A==;
Received: from ip6-localhost ([::1]:61530 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uqeQV-000Vmx-GQ; Mon, 25 Aug 2025 21:08:27 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:59698) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uqeLq-000TkH-T1
 for samba-technical@lists.samba.org; Mon, 25 Aug 2025 21:03:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=KQDLTfiMCyb0U7S54nktlS5dL1/Nh4CX7psSRQehF3I=; b=QfKO610vz9U4JUNJRJqeU1Fnsj
 68bDNCYULDMuogcjzMlRwF/ggLtNB6RHX9xlpqUmYyq67uKLftSabf+3+Afdr1DaJYsggzeByn+wL
 MayqY2+J6fIUwfaf8zTs1b32+DhegpeWyRgizjiANeWpKnG7ZhQNRCqhUk8oJpXUy8u6zriCHVFTH
 e+aWzX7M5o2R9x8eX32tAdmLl5d1aq78qKfDNwu50pRoRGXhImW6CoPxoQ/2wq/dundjl/xfOvMci
 eYho2FdUuFumQlejNU1nmnylhmFn+B5ja1FhEVjB5zNOAsKE1Ff4aeD/0dL3BgHcttE5nsbDQofC9
 1yxGx4Z9sClPKNsB4lKFgjWfKUsBKs7Qooqa6XJd6K9L7UjzBt8rwJ99ek0bhLKjzpLiquPT7iEnz
 JcgFiGlkoz1RrWcu6rxrTVX7hApM9Kw5gsFgwOK7bbrkphVr4yux5JMgNZt/3AL+gUEbbZqP4c4+g
 nUPbKs4u5XzjO7V1NZtIIJDs;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uqeLo-000naP-0K; Mon, 25 Aug 2025 21:03:36 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v4 131/142] smb: server: pass struct smbdirect_socket to
 smb_direct_flush_send_list()
Date: Mon, 25 Aug 2025 22:41:32 +0200
Message-ID: <b54e5b82e928a014016af83b93d0ff87aa98f730.1756139608.git.metze@samba.org>
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
index d29afc4be6a7..39ea9c51a24b 100644
--- a/fs/smb/server/transport_rdma.c
+++ b/fs/smb/server/transport_rdma.c
@@ -905,11 +905,10 @@ static void smb_direct_send_ctx_init(struct smbdirect_send_batch *send_ctx,
 	send_ctx->remote_key = remote_key;
 }
 
-static int smb_direct_flush_send_list(struct smb_direct_transport *t,
+static int smb_direct_flush_send_list(struct smbdirect_socket *sc,
 				      struct smbdirect_send_batch *send_ctx,
 				      bool is_last)
 {
-	struct smbdirect_socket *sc = &t->socket;
 	struct smbdirect_send_io *first, *last;
 	int ret;
 
@@ -977,7 +976,7 @@ static int wait_for_send_credits(struct smb_direct_transport *t,
 
 	if (send_ctx &&
 	    (send_ctx->wr_cnt >= 16 || atomic_read(&sc->send_io.credits.count) <= 1)) {
-		ret = smb_direct_flush_send_list(t, send_ctx, false);
+		ret = smb_direct_flush_send_list(sc, send_ctx, false);
 		if (ret)
 			return ret;
 	}
@@ -1297,7 +1296,7 @@ static int smb_direct_writev(struct ksmbd_transport *t,
 	}
 
 done:
-	ret = smb_direct_flush_send_list(st, &send_ctx, true);
+	ret = smb_direct_flush_send_list(sc, &send_ctx, true);
 
 	/*
 	 * As an optimization, we don't wait for individual I/O to finish
-- 
2.43.0


