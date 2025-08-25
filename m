Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 7161BB34D4B
	for <lists+samba-technical@lfdr.de>; Mon, 25 Aug 2025 23:01:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=WOK7z6VcMh0Q6V3Wcyr0oxJOvqrXge65v8FPbcuga2s=; b=41ujwhHgn3nKQxDpj+q1heLTqE
	8zRw4eG5NsI+gYJVPRpy4RO5ukpwQOjmqDQeQb9SBj65yhKgnkoGWdfeV3fATcxGn/gdDbpwQlQ3l
	SsgwO1zWNkT1KustzGV6ptdF7TPspAl4dqM86UGB/SjpEqzfqf4IsORfXajQq3yD4MERXc9gufL9t
	i1er2HeMFGBRjA1IhA7SCdXVYXhqu9jfFkmvdsD3bT5/Edth6UMIrOZYQW2AmBvTRKiDAmQA3jPYB
	1PiTP3nCI3mw6okqj8fu8yxONq/ZctGuQeZFHzq/tIDmu9Ad0nJ4ff3MBsykSkozkxbkgQH9jXcVx
	bYKGRimA==;
Received: from ip6-localhost ([::1]:33140 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uqeJq-000SoN-0R; Mon, 25 Aug 2025 21:01:34 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:37500) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uqeG3-000RIt-Fc
 for samba-technical@lists.samba.org; Mon, 25 Aug 2025 20:57:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=WOK7z6VcMh0Q6V3Wcyr0oxJOvqrXge65v8FPbcuga2s=; b=R8VQ7PLgaGeNC2VCLgcTt+UCZ6
 e87LmmNHVIGMk2lEOpSy84noEYdbcsDnU8AVy8lqSAtmgYfpzCZQrDCS7ctnahoijqrJ41j032CG7
 Pp/sLQ0PqkjoUE/8M8RtgcU0RnjfHjk+3scbtw+VqiIdP8OIaJhYj2ZvGfK37wkIGT0EZwOiJfUFT
 gWn15Un5W/MYIy7CZWUAFn27h8QoFA/KoIQ9iYsk2PdDV8J1U4XXkgW/aAdSCGABK6Wl5oaVTZtnI
 AsYwZ3ekvY8ozon1CmVsGPe1HwGSGKX1lslEXNq/UPWtJ7bqMpPCDBnOmINShRZbkeWSVLJAzzVwz
 D7Ir7FgK0FGreCzBD92/jSxrLlIniOJf2QnL12gSBYfln34erV69rOSOsQR7qMthKk36VGn9kc6gU
 wh4CeVV6EeUMVdO6KxHwtpnmaLTcOeBMXe3w5lDQDeGkVyXXid8LYRSZdCA7Lfget9yP0b6dFtpY/
 3btoHdwiJwLb7xMHx0c9TL+9;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uqeG1-000mNZ-0v; Mon, 25 Aug 2025 20:57:37 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v4 095/142] smb: server: don't wait for info->send_pending ==
 0 on error
Date: Mon, 25 Aug 2025 22:40:56 +0200
Message-ID: <f786b32c48c2296ada72f3e49394d9f965f44f36.1756139607.git.metze@samba.org>
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

Instead we just wake up the waiters and let them return -ENOTCONN.

Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
---
 fs/smb/server/transport_rdma.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/fs/smb/server/transport_rdma.c b/fs/smb/server/transport_rdma.c
index 741b5b62b7d6..d5b01748f0c4 100644
--- a/fs/smb/server/transport_rdma.c
+++ b/fs/smb/server/transport_rdma.c
@@ -388,10 +388,7 @@ static void free_transport(struct smb_direct_transport *t)
 	}
 
 	wake_up_all(&t->wait_send_credits);
-
-	ksmbd_debug(RDMA, "wait for all send posted to IB to finish\n");
-	wait_event(t->wait_send_pending,
-		   atomic_read(&t->send_pending) == 0);
+	wake_up_all(&t->wait_send_pending);
 
 	disable_work_sync(&t->post_recv_credits_work);
 	disable_work_sync(&t->send_immediate_work);
@@ -1291,7 +1288,11 @@ static int smb_direct_writev(struct ksmbd_transport *t,
 	 */
 
 	wait_event(st->wait_send_pending,
-		   atomic_read(&st->send_pending) == 0);
+		   atomic_read(&st->send_pending) == 0 ||
+		   sc->status != SMBDIRECT_SOCKET_CONNECTED);
+	if (sc->status != SMBDIRECT_SOCKET_CONNECTED && ret == 0)
+		ret = -ENOTCONN;
+
 	return ret;
 }
 
@@ -1624,7 +1625,11 @@ static int smb_direct_send_negotiate_response(struct smb_direct_transport *t,
 	}
 
 	wait_event(t->wait_send_pending,
-		   atomic_read(&t->send_pending) == 0);
+		   atomic_read(&t->send_pending) == 0 ||
+		   sc->status != SMBDIRECT_SOCKET_CONNECTED);
+	if (sc->status != SMBDIRECT_SOCKET_CONNECTED)
+		return -ENOTCONN;
+
 	return 0;
 }
 
-- 
2.43.0


