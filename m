Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DC30C1AB08
	for <lists+samba-technical@lfdr.de>; Wed, 29 Oct 2025 14:30:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=9eW71573X0MGQI0YwDNN6+HY3cAEUv9tVvSPL9BTa8E=; b=kXMncdeTomQ2f2RddhkXZ9PPIN
	9tMjuHyMhFFwUL9tF02masolBpsB4wHfdSZZ4rVvT5b/y74KBBOEfeMMvpiqGVNcujPz8V2umHll/
	HLxTm9B1l9FF9fBGNXpabl63VXCEaIyM1uiBJECWmJZhgqU9gq9DVDjuogj0ew+3OL9BRbtYhIPd7
	WYNMBBo9Tas9O0M7m7baLjlra4USaY2g1raGl1wSslRtRhjWKxcoQtcPoMORY02bCGJS5tu7h0F7y
	whITwNXgtOX8rYRj9SdFJyziJgubgNwqaeXU/5w4tsLpbRvdtWyDLl11snkO+hcVzbrvfeUWaPErV
	nv5WQCwQ==;
Received: from ip6-localhost ([::1]:41228 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vE6Fa-0097Q6-2T; Wed, 29 Oct 2025 13:30:07 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:40198) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vE6Ax-0095zH-IE
 for samba-technical@lists.samba.org; Wed, 29 Oct 2025 13:25:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=9eW71573X0MGQI0YwDNN6+HY3cAEUv9tVvSPL9BTa8E=; b=PaN49msVFKbfGqY84NvGxI2GwC
 9AxQnyMuyN8mR6QOgcU7aMMFmGZfniZfBekgX4RqnTjrcQ8iqHTyc01EjB2wtWgQ0hu8uWOciuIl0
 eiZx9x3gF5YfIzMfw914aVcTHOsRJdITVnY1iyYNu9C+lHinpn2qAwUSlTgDcP5eugtYJV+D2gRG4
 j0omg0GYstckEjZLsw1kpJPVM7dV0elNWqIdf28RhiFM1uAaqVOsIxXH73jdmb+DsbUTMIOLxtf+M
 /p0F+BK27d2x4prkRi04SFU9WbArFyXkSk4yJUycS6Emod80fRvXfCwwIYIdb9lyP/yEOCK2zBGNf
 9emaIZ8y1VQNE03TnAJ5nCxUQnykUb7kywhl+Xkd17jK1YGKEZJl+ql0cjBiDRB6LgzKSGjtQ4Zn8
 GrU3qyQacDDXSehDddKdMaaPxTWm7upR6u7OsFcMzMjwOvCuU4/PbiO6aNsmng1MrZIPX7lOnKyAS
 LQMVBsqED4AUZ+5A1fTjcOFY;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vE6At-00BbcS-2M; Wed, 29 Oct 2025 13:25:15 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v2 028/127] smb: smbdirect: split out
 smbdirect_connection_recv_io_refill()
Date: Wed, 29 Oct 2025 14:20:06 +0100
Message-ID: <752ba3a9cb38bf0b0d092e882b274a4128b0f361.1761742839.git.metze@samba.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1761742839.git.metze@samba.org>
References: <cover.1761742839.git.metze@samba.org>
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

This will allow us to refill the recv queue in a sync way
after negotiation.

Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: Long Li <longli@microsoft.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
---
 .../common/smbdirect/smbdirect_connection.c   | 36 +++++++++++++------
 1 file changed, 25 insertions(+), 11 deletions(-)

diff --git a/fs/smb/common/smbdirect/smbdirect_connection.c b/fs/smb/common/smbdirect/smbdirect_connection.c
index 95e212877e9f..c1281807ff8c 100644
--- a/fs/smb/common/smbdirect/smbdirect_connection.c
+++ b/fs/smb/common/smbdirect/smbdirect_connection.c
@@ -881,16 +881,13 @@ static int smbdirect_connection_post_recv_io(struct smbdirect_recv_io *msg)
 	return ret;
 }
 
-__maybe_unused /* this is temporary while this file is included in orders */
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
@@ -936,7 +933,7 @@ static void smbdirect_connection_recv_io_refill_work(struct work_struct *work)
 				"smbdirect_connection_post_recv_io failed rc=%d (%s)\n",
 				ret, errname(ret));
 			smbdirect_connection_put_recv_io(recv_io);
-			return;
+			return ret;
 		}
 
 		atomic_inc(&sc->recv_io.posted.count);
@@ -945,7 +942,7 @@ static void smbdirect_connection_recv_io_refill_work(struct work_struct *work)
 
 	/* If nothing was posted we're done */
 	if (posted == 0)
-		return;
+		return 0;
 
 	/*
 	 * If we posted at least one smbdirect_recv_io buffer,
@@ -966,11 +963,28 @@ static void smbdirect_connection_recv_io_refill_work(struct work_struct *work)
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
+__maybe_unused /* this is temporary while this file is included in orders */
+static void smbdirect_connection_recv_io_refill_work(struct work_struct *work)
+{
+	struct smbdirect_socket *sc =
+		container_of(work, struct smbdirect_socket, recv_io.posted.refill_work);
+	int posted;
+
+	posted = smbdirect_connection_recv_io_refill(sc);
+	if (unlikely(posted < 0)) {
+		smbdirect_connection_schedule_disconnect(sc, posted);
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


