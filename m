Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id AD2F5C866CF
	for <lists+samba-technical@lfdr.de>; Tue, 25 Nov 2025 19:04:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=PTIkaK4R1fwbk1Dbpkhq6l3vtvHNIvp16W4tkyHP4Aw=; b=FgHNmJlU0g3zC8pIs4y9h8nYda
	Aw9Xov5PEq0DKatFLYnxppyn+B35lxjIfDB2fOCCynt2+m+M8RGGrXWKnRKVSHwc0vGKAW5qvlnD+
	4ck/yWS5R77hNRMezqJ6UvX02qxfE+emwCeXc8t9+yVGgjmbAIzV0Hj8H3azabVrK7o7SKkgOPClA
	TpFOwLGn0SHMiX49bduS9cftw5HWaWZ6hOG3UlUfJz1p1UapRwi5mw2Kt8D95LqP5kIE7qfy1xto4
	ShRxAQd1CqyfLRLHJH5dkS41Ei+MgwNrAqdJI0JAZD3UexKHBpkA0H54KR4af5rG9LtRToHvROD8u
	1WtpiTlg==;
Received: from ip6-localhost ([::1]:49568 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vNxP8-00D8zW-PL; Tue, 25 Nov 2025 18:04:43 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:11078) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vNxKO-00D7Sl-V2
 for samba-technical@lists.samba.org; Tue, 25 Nov 2025 17:59:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=PTIkaK4R1fwbk1Dbpkhq6l3vtvHNIvp16W4tkyHP4Aw=; b=nN2zMW7isAONuyr7AqQKno3PVJ
 QrogCrAvT+iA9Lkt+kyFAMrcR+EhRQaqJ4JHZwvtBtbhteTr7g3Utx3tQCfyX2BWdgSdLadi2sL3P
 ypJf1b7VgWjs/vK2B2Iq1nGanJ8eHyaJyXilJu8IpmzC54jHe6l0ZB59BBlovg8EgCg0L/yKCVNnK
 l6f2D3M6Hvm8qTKSjF2aIvHQk9msfv4naFJfc6nUXEidqFCnmMYT8tJi+lk6/t6FH/k+fsdMVJu+o
 gHGcy8qQIdOyGtLflTeI9PdDO4LjVRej3fb40gy+ll9B0cCi+L+Anyba5+mh9VbUYodrf4NhRCcmh
 WgcpUeRAZ9D7O5ro6nMcciVP3PbQNTEV5VQE93TPAQa6nLH+V3gXhrifjVCJ3zLvmu2sbhmrvmti0
 OGOJpzQ66L8BNNKjyguRay/dPONykPAl7M6j4+VI6gQAKoILSAZf1trxZyOwFblJKMPSK23jKTJ+8
 /A9Fb0Vlgk5LTXYFjlCwnCcd;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vNxKL-00Fcy7-0g; Tue, 25 Nov 2025 17:59:45 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v4 031/145] smb: smbdirect: split out
 smbdirect_connection_recv_io_refill()
Date: Tue, 25 Nov 2025 18:54:37 +0100
Message-ID: <55deb09e9d8fd31ac7fa0993b2ec41213434f9c9.1764091285.git.metze@samba.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1764091285.git.metze@samba.org>
References: <cover.1764091285.git.metze@samba.org>
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

This will allow us to refill the recv queue in a sync way
after negotiation.

Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: Long Li <longli@microsoft.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
Signed-off-by: Steve French <stfrench@microsoft.com>
---
 .../common/smbdirect/smbdirect_connection.c   | 36 +++++++++++++------
 1 file changed, 25 insertions(+), 11 deletions(-)

diff --git a/fs/smb/common/smbdirect/smbdirect_connection.c b/fs/smb/common/smbdirect/smbdirect_connection.c
index f260d50a561b..5c604b6bc853 100644
--- a/fs/smb/common/smbdirect/smbdirect_connection.c
+++ b/fs/smb/common/smbdirect/smbdirect_connection.c
@@ -683,16 +683,13 @@ static int smbdirect_connection_post_recv_io(struct smbdirect_recv_io *msg)
 	return ret;
 }
 
-__maybe_unused /* this is temporary while this file is included in others */
-static void smbdirect_connection_recv_io_refill_work(struct work_struct *work)
+static int smbdirect_connection_recv_io_refill(struct smbdirect_socket *sc)
 {
-	struct smbdirect_socket *sc =
-		container_of(work, struct smbdirect_socket, recv_io.posted.refill_work);
 	int missing;
 	int posted = 0;
 
 	if (unlikely(sc->first_error))
-		return;
+		return sc->first_error;
 
 	/*
 	 * Find out how much smbdirect_recv_io buffers we should post.
@@ -738,7 +735,7 @@ static void smbdirect_connection_recv_io_refill_work(struct work_struct *work)
 				"smbdirect_connection_post_recv_io failed rc=%d (%s)\n",
 				ret, errname(ret));
 			smbdirect_connection_put_recv_io(recv_io);
-			return;
+			return ret;
 		}
 
 		atomic_inc(&sc->recv_io.posted.count);
@@ -747,7 +744,7 @@ static void smbdirect_connection_recv_io_refill_work(struct work_struct *work)
 
 	/* If nothing was posted we're done */
 	if (posted == 0)
-		return;
+		return 0;
 
 	/*
 	 * If we posted at least one smbdirect_recv_io buffer,
@@ -768,11 +765,28 @@ static void smbdirect_connection_recv_io_refill_work(struct work_struct *work)
 	 * grant the credit anyway.
 	 */
 	if (missing == 1 && sc->recv_io.credits.target != 1)
-		return;
+		return 0;
 
-	smbdirect_log_keep_alive(sc, SMBDIRECT_LOG_INFO,
-		"schedule send of an empty message\n");
-	queue_work(sc->workqueue, &sc->idle.immediate_work);
+	return posted;
+}
+
+__maybe_unused /* this is temporary while this file is included in others */
+static void smbdirect_connection_recv_io_refill_work(struct work_struct *work)
+{
+	struct smbdirect_socket *sc =
+		container_of(work, struct smbdirect_socket, recv_io.posted.refill_work);
+	int posted;
+
+	posted = smbdirect_connection_recv_io_refill(sc);
+	if (unlikely(posted < 0)) {
+		smbdirect_socket_schedule_cleanup(sc, posted);
+		return;
+	}
+	if (posted > 0) {
+		smbdirect_log_keep_alive(sc, SMBDIRECT_LOG_INFO,
+			"schedule send of an empty message\n");
+		queue_work(sc->workqueue, &sc->idle.immediate_work);
+	}
 }
 
 static bool smbdirect_map_sges_single_page(struct smbdirect_map_sges *state,
-- 
2.43.0


