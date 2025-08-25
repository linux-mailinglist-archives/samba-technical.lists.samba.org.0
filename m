Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 239CEB34D43
	for <lists+samba-technical@lfdr.de>; Mon, 25 Aug 2025 23:01:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=k3B6dKLWCEsQ3qGAJoTnM+/iq/jpPsieReUGyFeQr3k=; b=K1szIlzpncCwmnOZvYouSmuSnm
	wwV7HwzIDh0Bz4Iz8VtWcuOyyZjbEDOmMu4ouDiD1Jz+vpH28dT86AvbvlB1eyFhpg0Bw8NMH0T/9
	z3UPdtkNmFFedWXKXbzCKQN0k5Sg1pup/BNaMCvcFq7PiaplFTbVb9UInxC63YaKSCR+WlmMZPbU7
	zl0q63KJ+oOfLJewLyVJ9E4SG27aBflWADzK7xaGOV0yHcCOFJn19iURs9eN6gm6kbaOGIFF/xiDU
	HcYpEeuHKlcBhpg5v96YxUsrAsyg9GtRBtyvPgcZvEtksFEAJQnOYTg3ZoK+9/yLdWLOZ8prcol4h
	CLeqialA==;
Received: from ip6-localhost ([::1]:60990 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uqeJY-000Siz-Df; Mon, 25 Aug 2025 21:01:17 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:20262) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uqeFk-000RAx-Nv
 for samba-technical@lists.samba.org; Mon, 25 Aug 2025 20:57:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=k3B6dKLWCEsQ3qGAJoTnM+/iq/jpPsieReUGyFeQr3k=; b=wG8AyMLF4sV1IUSGwYB9y+htFc
 leBVa3ogOPT8e/6CH8wxo/p/L+p9DnrsIe18tvD2NFMWv6YV/dB5FPIqx2+T7djgRWYD0YPSfiFKl
 b0AfXYznRlTgQ9C6o1ptuPVaW7b8Vl83rgWapH+eIr+L5A6MMOfRsufUQ+A6YvxeNTpHPUDyfVmdR
 sfDS2zl328pknysl7jqgxmrtPbr0LBX5POtfnn4l+hmnF48zaaHqP5H/4ND7C0leNyNZwMksti5po
 b7RfvVBI+6mECvfUFX96lELct6+AzUmSofTCuywwiZ/rcYkDV43de5gPIPkdz5KA02KgYKMe9c2IF
 5ZvORel8nQpAiAZaMuluq2xWMxJ//jMxtQArwY4ttNXY57sNT2dZ+0ErZH4ACCqOb7eaMBMr+RZin
 R+6kbLnbDm7oUrcKDvBrAZfU0cV3Ssq57fXdnIj5OtQLtaQysUaPnr4qLA8z2vbtCg2NilwTchfog
 40gdxMlmmXqK6sICbeJ1rVMI;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uqeFi-000mK4-0a; Mon, 25 Aug 2025 20:57:18 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v4 093/142] smb: server: use disable_work_sync in
 transport_rdma.c
Date: Mon, 25 Aug 2025 22:40:54 +0200
Message-ID: <588cf97e0590ab4aa5a23c7e3cab17a9b706b736.1756139607.git.metze@samba.org>
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

This makes it safer during the disconnect and avoids
requeueing.

It's ok to call disable_work[_sync]() more than once.

Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
---
 fs/smb/server/transport_rdma.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/fs/smb/server/transport_rdma.c b/fs/smb/server/transport_rdma.c
index 5a64139c1961..fdcf53856665 100644
--- a/fs/smb/server/transport_rdma.c
+++ b/fs/smb/server/transport_rdma.c
@@ -386,9 +386,9 @@ static void free_transport(struct smb_direct_transport *t)
 	wait_event(t->wait_send_pending,
 		   atomic_read(&t->send_pending) == 0);
 
-	cancel_work_sync(&t->disconnect_work);
-	cancel_work_sync(&t->post_recv_credits_work);
-	cancel_work_sync(&t->send_immediate_work);
+	disable_work_sync(&t->disconnect_work);
+	disable_work_sync(&t->post_recv_credits_work);
+	disable_work_sync(&t->send_immediate_work);
 
 	if (sc->ib.qp) {
 		ib_drain_qp(sc->ib.qp);
-- 
2.43.0


