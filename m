Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id CD162B1A115
	for <lists+samba-technical@lfdr.de>; Mon,  4 Aug 2025 14:17:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=vpYNfHJCm2TKf3k81xlz/NPMEPzdDJamDlwUAHDZ3Aw=; b=Stutock9XJIkA6KDzT+7jp9umu
	Cflp5LTL+gsHV0CovZ6qMIAfhO9bHcbx08q24DTDLOi6DUA8Ua4qN6zG0OPZ2J8a6Np9bxRgv+RDL
	h/OTAstPERuumUh06LBIc2apgpxSlpClFdSxPY8hlY04Om2p5fN6uLQsSSXGby+E7s4hGsX0q/dJl
	mf1PoPyc9iSHEJbK9miEEGubVKCgG9ip5EsCHAqFUPfvHDCx07CUBzko/+jOgwrVKFRvMa9icLcBC
	tSxDWr3GDilw+i3GWa1enbXZwWPpY6zHvcJzewJdI3UUvG70BEebioTX5JwfACWlQ7hnVFwh4UtOF
	SjKV9ohA==;
Received: from ip6-localhost ([::1]:45750 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uiu7g-00EIKk-0d; Mon, 04 Aug 2025 12:17:00 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:41746) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uiu7W-00EIHp-Ks
 for samba-technical@lists.samba.org; Mon, 04 Aug 2025 12:16:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=vpYNfHJCm2TKf3k81xlz/NPMEPzdDJamDlwUAHDZ3Aw=; b=EeswnoR/dQjL0ZIIYmNJmvpxLw
 5wYKObylEhgAh7gb9igoz7WFSn+zONY2s6Am+Krt8Ic6ncvPmEpra4BULYM4vb0LrIeQnmXVzMfN1
 MinyHpWGhwc7MoUIdjHEOifolktD3LginFK3azRQoM1LRARwP/g9FT954+9s7Jl5SRJcSMv0DHrD4
 hLY/zGzPDx2EBRex09Kf+WDEKGAlJhmrfgvPlgUve3g3f0Jm8BwEBwWQ/8z0ON6zv5GFH6fwMbTGz
 cQJs6UqXe97QSEklcSPkVluMOnT3uvbXutbsvzCjfQsg3GealZrMGAH349U4OSDyVa79z1UqCH6qE
 QBqmv1vE2/GUC3KkuOWELaDeHwRAPhLIbTVGnLLuan/jEjhPAJe/z2OdqgVStIih1pPf1Rs1fFD84
 94SFnv9qY+gzZi4/jtMVhIgMysDD6zzJMnvl9wANyV2pbo0h6RRcqWuxhDq9dL6lAIJcSyfMTQuSf
 dnpg5kAOj9oPbsfYeml4DOSN;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uiu7U-000wHH-1t; Mon, 04 Aug 2025 12:16:48 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH 4/4] smb: server: let recv_done() avoid touching data_transfer
 after cleanup/move
Date: Mon,  4 Aug 2025 14:15:53 +0200
Message-ID: <111d25fd9256d158e9521db36b6196972bd68b9d.1754309565.git.metze@samba.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1754309565.git.metze@samba.org>
References: <cover.1754309565.git.metze@samba.org>
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

Calling enqueue_reassembly() and wake_up_interruptible(&t->wait_reassembly_queue)
or put_receive_buffer() means the recvmsg/data_transfer pointer might
get re-used by another thread, which means these should be
the last operations before calling return.

Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Fixes: 0626e6641f6b ("cifsd: add server handler for central processing and tranport layers")
Signed-off-by: Stefan Metzmacher <metze@samba.org>
---
 fs/smb/server/transport_rdma.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/fs/smb/server/transport_rdma.c b/fs/smb/server/transport_rdma.c
index cd8a92fe372b..8d366db5f605 100644
--- a/fs/smb/server/transport_rdma.c
+++ b/fs/smb/server/transport_rdma.c
@@ -581,16 +581,11 @@ static void recv_done(struct ib_cq *cq, struct ib_wc *wc)
 			else
 				t->full_packet_received = true;
 
-			enqueue_reassembly(t, recvmsg, (int)data_length);
-			wake_up_interruptible(&t->wait_reassembly_queue);
-
 			spin_lock(&t->receive_credit_lock);
 			receive_credits = --(t->recv_credits);
 			avail_recvmsg_count = t->count_avail_recvmsg;
 			spin_unlock(&t->receive_credit_lock);
 		} else {
-			put_recvmsg(t, recvmsg);
-
 			spin_lock(&t->receive_credit_lock);
 			receive_credits = --(t->recv_credits);
 			avail_recvmsg_count = ++(t->count_avail_recvmsg);
@@ -612,6 +607,13 @@ static void recv_done(struct ib_cq *cq, struct ib_wc *wc)
 		if (is_receive_credit_post_required(receive_credits, avail_recvmsg_count))
 			mod_delayed_work(smb_direct_wq,
 					 &t->post_recv_credits_work, 0);
+
+		if (data_length) {
+			enqueue_reassembly(t, recvmsg, (int)data_length);
+			wake_up_interruptible(&t->wait_reassembly_queue);
+		} else
+			put_recvmsg(t, recvmsg);
+
 		return;
 	}
 	}
-- 
2.43.0


