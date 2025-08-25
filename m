Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B3D93B34CA1
	for <lists+samba-technical@lfdr.de>; Mon, 25 Aug 2025 22:49:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=9rGhBGFl6MV0NKSal2DirvvnNmsMvaZX4oYElfRRTPY=; b=R4fi0/mzZvCOGl1+MY6d81sT9g
	1KvxaXCeWmHyElpJ44i7l60jELBXg0wmEI3PoL8D57tHrcEj+58o0CBLtJIjsPi8/oTyhrzZy5iTR
	/Hr1jENg4d4o6x5oiXkR2HOcIZxUREcTEp3ddxBlm2EJ3TaZ66iLPD/qBwKC4iX9Qpkk2PHdtIhJd
	WAKr0OTu+Ir3HMPp3nCG2tGlZ4ApQKlWtxcFnGW1e+hCR8j85pLL6JH1n99TcDe3Dyt61mM+oY09F
	gFRI6ggtYK+Yo6yizksMT2yiNgSeaw4MX3RwAtgrOCIpRhCwhqM+XPorkkPezY6EnhEUoLbSUpMrC
	kz2KQDPA==;
Received: from ip6-localhost ([::1]:19318 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uqe8M-000O7e-Ug; Mon, 25 Aug 2025 20:49:43 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:55558) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uqe6i-000NWf-O2
 for samba-technical@lists.samba.org; Mon, 25 Aug 2025 20:48:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=9rGhBGFl6MV0NKSal2DirvvnNmsMvaZX4oYElfRRTPY=; b=0WmtbKOmXQkYX0Io13aaI4yl9d
 hwVtrDRlL8yn/3FzMJH3jY0NySqdgUyvCW6Kk/roBxPZIzpfRc1PX289nqyI99HDfHuemrVKf+hIB
 kf8eeULMHUjxdGxsSuqdVkHevMI5vB7pciWkirAoSV56e7zO34X1dNuAApKpVS/8Ha3/6VguxXSSz
 krB0rHJ3ulkM1HktfY3jnku6bp5TN/YWgyOCUaQRx/ziDemfwg3UZ5a+A5ra/gs40f+p5lmnldqDX
 rawHPvgND7zDJVjbSIWOOjlhoZn5b2t6wTUtusIMzrzUBiiMLJ3/t+tqd+UPkMBaOmqmlZwglXg31
 I5eQakh2m2adFQv5vJ5Wlc+6lV7qyCG0OCZNWFOG1vT2S4/Q+jHUIIDyoSPkm/+MXHT8TQGqY4IhA
 sLDjXYmrxLn/KC14dGxirOyNXzzQUrfjhVPzLQXHoO2zGMWu3lGZP7n1j/kYvIB+gGb2SupHfmnhH
 2Qi2G2/pscNWno7SnviemCpq;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uqe6f-000kR7-2F; Mon, 25 Aug 2025 20:47:57 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v4 037/142] smb: client: remove useless
 smbd_connection.send_immediate
Date: Mon, 25 Aug 2025 22:39:58 +0200
Message-ID: <2bdf4791685e76cd47402e7c87fd27337764f2dc.1756139607.git.metze@samba.org>
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
 Tom Talpey <tom@talpey.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

We always set it to true before having an if statement that checks it is
true...

Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: Long Li <longli@microsoft.com>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
---
 fs/smb/client/smbdirect.c | 10 ++--------
 fs/smb/client/smbdirect.h |  2 --
 2 files changed, 2 insertions(+), 10 deletions(-)

diff --git a/fs/smb/client/smbdirect.c b/fs/smb/client/smbdirect.c
index 62c0d27ec8bc..a65c3a841985 100644
--- a/fs/smb/client/smbdirect.c
+++ b/fs/smb/client/smbdirect.c
@@ -536,14 +536,10 @@ static void smbd_post_send_credits(struct work_struct *work)
 	}
 
 	/* Promptly send an immediate packet as defined in [MS-SMBD] 3.1.1.1 */
-	info->send_immediate = true;
 	if (atomic_read(&sc->recv_io.credits.count) <
 		sc->recv_io.credits.target - 1) {
-		if (info->keep_alive_requested == KEEP_ALIVE_PENDING ||
-		    info->send_immediate) {
-			log_keep_alive(INFO, "send an empty message\n");
-			smbd_post_send_empty(info);
-		}
+		log_keep_alive(INFO, "send an empty message\n");
+		smbd_post_send_empty(info);
 	}
 }
 
@@ -1080,8 +1076,6 @@ static int smbd_post_send_iter(struct smbd_connection *info,
 	atomic_add(new_credits, &sc->recv_io.credits.count);
 	packet->credits_granted = cpu_to_le16(new_credits);
 
-	info->send_immediate = false;
-
 	packet->flags = 0;
 	if (manage_keep_alive_before_sending(info))
 		packet->flags |= cpu_to_le16(SMBDIRECT_FLAG_RESPONSE_REQUESTED);
diff --git a/fs/smb/client/smbdirect.h b/fs/smb/client/smbdirect.h
index a4b368d14f51..3dd7408329f5 100644
--- a/fs/smb/client/smbdirect.h
+++ b/fs/smb/client/smbdirect.h
@@ -77,8 +77,6 @@ struct smbd_connection {
 	/* Activity accounting */
 	wait_queue_head_t wait_post_send;
 
-	bool send_immediate;
-
 	struct workqueue_struct *workqueue;
 	struct delayed_work idle_timer_work;
 
-- 
2.43.0


