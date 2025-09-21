Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 22069B8E775
	for <lists+samba-technical@lfdr.de>; Sun, 21 Sep 2025 23:48:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=/d7fagOsnCE0cqJu+bN2pL70FTdVCbTcJxByJAxgvd4=; b=s0ZQpVCbOiB3PrRaANpjOtVczD
	cC89FaaYsdP1zehTDZUyeKXQiNHhNx9/7/aLRfhmjvFB6aBIZLhGCpeX9ITiDV/xwB5YUd6NwusLt
	R1jLBsmdZ3ueTKB90afWHyXCWaVmTMV0/8phvdYOeij6XrjHsjcAubcBf7XmEwScSZtThxGUZ8KYV
	V5uPpRIibD+Q6y1xT6H8wn6Z0nkAkHX6hj2xeL1DdS4JcMZdwQe8H4zrkDUkSS+YW3Su1ZD+yVDUi
	WRqT6v07FSsy9DWyQyeL2q0UcWBDmEha2pMJodFwTkg2V++mxdjoe6tAMcv8O8PbgZ9ELEZhl2E5B
	GaREVq5Q==;
Received: from ip6-localhost ([::1]:26772 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1v0RvO-004U2D-Ne; Sun, 21 Sep 2025 21:48:51 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:18808) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1v0Ru1-004TZT-Qr
 for samba-technical@lists.samba.org; Sun, 21 Sep 2025 21:47:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=/d7fagOsnCE0cqJu+bN2pL70FTdVCbTcJxByJAxgvd4=; b=GkbUP0FVLG14H5kkXoOVha/zQw
 SoZwoH92ZI0UkzyeL2lwOQOTDWIPXhfbOEjKMOoDwWNcsBKkPrQ6BGt79D+OTVr4tMuiJA1RjxfiS
 nPCf34qdOxsSyJjKPgwiw9ofYMcs5Jnz076MlpDctz3ncyOCAPZIsF51dRBZ+v7kt/7tZChJ9NkVn
 WqQiSFdxRSCMYn10t8QYDNUZkXxmOg0l9JO+4t6Su2HxPFlGttT4jH4Sy5DYNrk7zK+XT7e8nlxm9
 OdQf9xvu/xh/3EFJt5q1rlHhxaahUctgi900y5lPEY7I3QCQC4aVdrx8e8la8/NUJP0bQ12yHw/dT
 c+v+3jGcTkNP+hqjtmvyztHGSeKch9ATVSK27jX2xz8rKsllindopgjyxGAknUn8YDxEEpYi34aOW
 XP9RI0fmGLN0hw9FjcFbEBJe9aMOm7dZlpyYeT+Xrbvm/mid14tKcLhn45UKeYmI7Q0qTBLe6tv8p
 Ks3D2w0ohCP6iuROUidUGkGY;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1v0Ru0-005Ggh-0G; Sun, 21 Sep 2025 21:47:24 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH 15/18] smb: server: let {free_transport,
 smb_direct_disconnect_rdma_{work, connection}}() wake up all wait queues
Date: Sun, 21 Sep 2025 23:45:02 +0200
Message-ID: <e15437e4d5a71cb9adc08178d4b35054118e89b1.1758489989.git.metze@samba.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1758489988.git.metze@samba.org>
References: <cover.1758489988.git.metze@samba.org>
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

This is important in order to let all waiters notice a broken connection.

We also go via smb_direct_disconnect_rdma_{work,connection}() for broken
connections.

Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
Signed-off-by: Steve French <stfrench@microsoft.com>
---
 fs/smb/server/transport_rdma.c | 40 +++++++++++++++++++++++++++++-----
 1 file changed, 34 insertions(+), 6 deletions(-)

diff --git a/fs/smb/server/transport_rdma.c b/fs/smb/server/transport_rdma.c
index cd4398ae8b98..ba4dfdcb321a 100644
--- a/fs/smb/server/transport_rdma.c
+++ b/fs/smb/server/transport_rdma.c
@@ -207,6 +207,19 @@ static struct smbdirect_recv_io *get_first_reassembly(struct smbdirect_socket *s
 		return NULL;
 }
 
+static void smb_direct_disconnect_wake_up_all(struct smbdirect_socket *sc)
+{
+	/*
+	 * Wake up all waiters in all wait queues
+	 * in order to notice the broken connection.
+	 */
+	wake_up_all(&sc->status_wait);
+	wake_up_all(&sc->send_io.credits.wait_queue);
+	wake_up_all(&sc->send_io.pending.zero_wait_queue);
+	wake_up_all(&sc->recv_io.reassembly.wait_queue);
+	wake_up_all(&sc->rw_io.credits.wait_queue);
+}
+
 static void smb_direct_disconnect_rdma_work(struct work_struct *work)
 {
 	struct smbdirect_socket *sc =
@@ -257,6 +270,12 @@ static void smb_direct_disconnect_rdma_work(struct work_struct *work)
 	case SMBDIRECT_SOCKET_DESTROYED:
 		break;
 	}
+
+	/*
+	 * Wake up all waiters in all wait queues
+	 * in order to notice the broken connection.
+	 */
+	smb_direct_disconnect_wake_up_all(sc);
 }
 
 static void
@@ -314,6 +333,12 @@ smb_direct_disconnect_rdma_connection(struct smbdirect_socket *sc)
 		break;
 	}
 
+	/*
+	 * Wake up all waiters in all wait queues
+	 * in order to notice the broken connection.
+	 */
+	smb_direct_disconnect_wake_up_all(sc);
+
 	queue_work(sc->workqueue, &sc->disconnect_work);
 }
 
@@ -421,8 +446,14 @@ static void free_transport(struct smb_direct_transport *t)
 					 sc->status == SMBDIRECT_SOCKET_DISCONNECTED);
 	}
 
-	wake_up_all(&sc->send_io.credits.wait_queue);
-	wake_up_all(&sc->send_io.pending.zero_wait_queue);
+	/*
+	 * Wake up all waiters in all wait queues
+	 * in order to notice the broken connection.
+	 *
+	 * Most likely this was already called via
+	 * smb_direct_disconnect_rdma_work(), but call it again...
+	 */
+	smb_direct_disconnect_wake_up_all(sc);
 
 	disable_work_sync(&sc->recv_io.posted.refill_work);
 	disable_delayed_work_sync(&sc->idle.timer_work);
@@ -1644,14 +1675,11 @@ static int smb_direct_cm_handler(struct rdma_cm_id *cm_id,
 
 		sc->status = SMBDIRECT_SOCKET_DISCONNECTED;
 		smb_direct_disconnect_rdma_work(&sc->disconnect_work);
-		wake_up_all(&sc->status_wait);
-		wake_up_all(&sc->recv_io.reassembly.wait_queue);
-		wake_up_all(&sc->send_io.credits.wait_queue);
 		break;
 	}
 	case RDMA_CM_EVENT_CONNECT_ERROR: {
 		sc->status = SMBDIRECT_SOCKET_DISCONNECTED;
-		wake_up_all(&sc->status_wait);
+		smb_direct_disconnect_rdma_work(&sc->disconnect_work);
 		break;
 	}
 	default:
-- 
2.43.0


