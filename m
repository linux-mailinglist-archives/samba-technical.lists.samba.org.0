Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id EC764BF2F55
	for <lists+samba-technical@lfdr.de>; Mon, 20 Oct 2025 20:36:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=DfLZN6Bj30ZaNE2OUOxZcTpRTO7N80Vik19UR3xP8ls=; b=wT1dCBgpOzUAMdqmD7eQXApQ+V
	1x8vL4MTtu/B/VFt08N7l6EgoKJBbUxDTrTdzzaV/SocWbDjOjW5l8TGR/cCILmSDApKvmjhaRWCp
	JRwLAPHeR5IGJ1STaVdb3VvJ8oufs07pGJvJk1PEL46DJDJXlZMTYRZZ+gKZxpg/a9cqkevDGQ6xr
	PEFzGj83xYPX9dmq2tZCrY2ExEVOmP3+3HFj5OPTtX7JYk4FZHBAKNILYs2CUK5NBfuiYefIC+i0Q
	kgfcUYjd9/R1EMmLbAZlTEFowhRKDqgTNvIZSCMikeTLZK99wGjcvQyrpyKCi+LMFiFpCYSZC1J2h
	eLN/vIPw==;
Received: from ip6-localhost ([::1]:59824 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vAukD-008NJr-2X; Mon, 20 Oct 2025 18:36:33 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:36474) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vAuk6-008NJk-Pk
 for samba-technical@lists.samba.org; Mon, 20 Oct 2025 18:36:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=DfLZN6Bj30ZaNE2OUOxZcTpRTO7N80Vik19UR3xP8ls=; b=O1aURhnZ37vI7Q1CC201wtkk+p
 7S0OB8PSuTvbV+Dwg8fp8c3bRz1hgByUKQ4xvSkOpxMCuGThcWiIVg8iC3+zB9gi9PYCkteo8w9/M
 Bbeps5rCD4coqk2+/SbXZ83rcoHi9LrIyWOKdi/Cq9F+nILwIPP8ry/RnhYXkF0IKaeXyRUtS3KiN
 JNgWdAks0JZi73egStUyHQBU9Hx+oD4FkPatJ8kFGyg+4buWg+wpty3xvdV5EVEzKRVKxSBFuPXGl
 wcVO8g0iWdiG4ZC4YpFohDfnim0mBsoU1VYNI4NC8NucgSnoqDjfGvwbrMC43Adai5ssESTWfb9/j
 VXdnhbW9mszUs0bKeae2FzTUfp37GHke68IOX8Q/U0C3rdZnI0xksVJ0LPS9beIb8lNNDtDlfE7OI
 LcwsRxs9FCNTNsRm01SGwmn2DNa5Bd+CBq0G/FteZNV3SW0E5J3TaGct5ghs8e8TX3wZ2uNpd/A5i
 SD4RNktJqlce3l6EL0AiQiDr;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vAuk4-00ACNh-1x; Mon, 20 Oct 2025 18:36:24 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH 2/5] smb: server: smb_direct_disconnect_rdma_connection()
 already wakes all waiters on error
Date: Mon, 20 Oct 2025 20:35:59 +0200
Message-ID: <f509375aa6c0efba8d0b95d387826b78252092ab.1760984605.git.metze@samba.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1760984605.git.metze@samba.org>
References: <cover.1760984605.git.metze@samba.org>
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
 Tom Talpey <tom@talpey.com>, Namjae Jeon <linkinjeon@kernel.org>,
 Steve French <stfrench@microsoft.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

There's no need to care about pending or credit counters when we
already disconnecting.

And all related wait_event conditions already check for broken
connections too.

This will simplify the code and makes the following changes simpler.

Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
Signed-off-by: Steve French <stfrench@microsoft.com>
---
 fs/smb/server/transport_rdma.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/fs/smb/server/transport_rdma.c b/fs/smb/server/transport_rdma.c
index 019e5f70d7b3..c4df1328342d 100644
--- a/fs/smb/server/transport_rdma.c
+++ b/fs/smb/server/transport_rdma.c
@@ -988,8 +988,6 @@ static int smb_direct_post_send(struct smbdirect_socket *sc,
 	ret = ib_post_send(sc->ib.qp, wr, NULL);
 	if (ret) {
 		pr_err("failed to post send: %d\n", ret);
-		if (atomic_dec_and_test(&sc->send_io.pending.count))
-			wake_up(&sc->send_io.pending.zero_wait_queue);
 		smb_direct_disconnect_rdma_connection(sc);
 	}
 	return ret;
@@ -1038,8 +1036,6 @@ static int smb_direct_flush_send_list(struct smbdirect_socket *sc,
 					 send_ctx->need_invalidate_rkey,
 					 send_ctx->remote_key);
 	} else {
-		atomic_add(send_ctx->wr_cnt, &sc->send_io.credits.count);
-		wake_up(&sc->send_io.credits.wait_queue);
 		list_for_each_entry_safe(first, last, &send_ctx->msg_list,
 					 sibling_list) {
 			smb_direct_free_sendmsg(sc, first);
-- 
2.43.0


