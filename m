Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 44092C8661B
	for <lists+samba-technical@lfdr.de>; Tue, 25 Nov 2025 19:00:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=oZm05aMrBWILlRns9eYcYBhMWKmUmyljd6St4e2/qJU=; b=knPus1iRLQ7BW/E8uzF813R82W
	QK0fh8M72X+/UKY4zHe7tucU8/h13cRVoIqXay0wr2Ttxz3BPbS7IJQAxQG+vADwM7g6iy4fRN03r
	dbt0R9CVtOm7EXrUo7jETludHk3IYLQa+Xz/6WUh7Hh5FwwKZyDFKhe62//YpPhLhs9AW58HFzhF7
	2T7hqVvBoBBPs+9HhEUcxMHoOr4PIA7bBBYiFyX7uJot2lGchRxneeovuimz0xbjnFIw/xEujRNW8
	xTaMYSVDQLs10kRbbd7c1cUMakwq2EtAaUTATrL6IVlNd4RiWFnweg8kXIlctw+EZrRohJechs8Br
	VUhRBTvw==;
Received: from ip6-localhost ([::1]:25778 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vNxKk-00D7Up-Vf; Tue, 25 Nov 2025 18:00:11 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:23444) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vNxIi-00D6tT-6k
 for samba-technical@lists.samba.org; Tue, 25 Nov 2025 17:58:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=oZm05aMrBWILlRns9eYcYBhMWKmUmyljd6St4e2/qJU=; b=EHaOaaF6iBK1fXjCYXDaG4apAI
 MIzv2vzNRm+SDEVJmS+EANCXcnoClzhzkeurKBDdDvuTzgyA1s5lSz38jB6BnYRa4wniW6TNxRE+/
 eZr1AiC6OvdqcxIFdgyoxSSDVpkBTb/aupEbevduwG6yOTGdbT/L2RVADKnqXo9kl2PbhEXiefTIG
 ji/HANBjaRxRJlqirhIczMwBj5L77aE5V6uGlCGlfnSEp5lzoprBRDc4dbMMzMMMtydE6DsnyIyDE
 NDsRzp7AQjq3dbc7/RGmJ8pigAns/TIwwrM7vEQ0yBLgiAhfaUkSFs0ABmhQUmLGX4mCXYgFLEUYb
 JsJT7fRv/Z6+L6flXjOgzbXQ5RDWi5aF4xDeBcMJAqGe0gEobpa631cNLcUbUsSY95ln0s9lj6JPy
 HxP+CP1W2UKMMIl1CRAochbz9kiP9a42na7tyVQL/KRPe/0Iz5rHr0ls0NJWC/hOOEHVedoTOwKtP
 8PADe1LRMeazono24Lil7oi9;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vNxIc-00FchX-33; Tue, 25 Nov 2025 17:57:59 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v4 013/145] smb: smbdirect: introduce
 smbdirect_socket_cleanup_work()
Date: Tue, 25 Nov 2025 18:54:19 +0100
Message-ID: <536df07f757d68254694ae3197d7922c8ff78042.1764091285.git.metze@samba.org>
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

This is basically a copy of smbd_disconnect_rdma_work() and
smb_direct_disconnect_rdma_work() and will replace them in the
next steps.

Differences is that a message is logged if first error is still 0,
which makes it easier to analyze problems.

And also disable any complex work from recv_io objects,
currently these are not used and the work is always
disabled anyway, but this prepares future changes.

It also makes sure it's never used in an interrupt, which is
not expected anyway...

Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: Long Li <longli@microsoft.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
Signed-off-by: Steve French <stfrench@microsoft.com>
---
 fs/smb/common/smbdirect/smbdirect_socket.c | 90 +++++++++++++++++++++-
 1 file changed, 89 insertions(+), 1 deletion(-)

diff --git a/fs/smb/common/smbdirect/smbdirect_socket.c b/fs/smb/common/smbdirect/smbdirect_socket.c
index a249e758379f..2688866fffe6 100644
--- a/fs/smb/common/smbdirect/smbdirect_socket.c
+++ b/fs/smb/common/smbdirect/smbdirect_socket.c
@@ -6,6 +6,8 @@
 
 #include "smbdirect_internal.h"
 
+static void smbdirect_socket_cleanup_work(struct work_struct *work);
+
 __maybe_unused /* this is temporary while this file is included in others */
 static void smbdirect_socket_prepare_create(struct smbdirect_socket *sc,
 					    const struct smbdirect_socket_parameters *sp,
@@ -23,6 +25,8 @@ static void smbdirect_socket_prepare_create(struct smbdirect_socket *sc,
 	 * Remember the callers workqueue
 	 */
 	sc->workqueue = workqueue;
+
+	INIT_WORK(&sc->disconnect_work, smbdirect_socket_cleanup_work);
 }
 
 __maybe_unused /* this is temporary while this file is included in others */
@@ -45,7 +49,6 @@ static void smbdirect_socket_set_logging(struct smbdirect_socket *sc,
 	sc->logging.vaprintf = vaprintf;
 }
 
-__maybe_unused /* this is temporary while this file is included in others */
 static void smbdirect_socket_wake_up_all(struct smbdirect_socket *sc)
 {
 	/*
@@ -62,3 +65,88 @@ static void smbdirect_socket_wake_up_all(struct smbdirect_socket *sc)
 	wake_up_all(&sc->mr_io.ready.wait_queue);
 	wake_up_all(&sc->mr_io.cleanup.wait_queue);
 }
+
+static void smbdirect_socket_cleanup_work(struct work_struct *work)
+{
+	struct smbdirect_socket *sc =
+		container_of(work, struct smbdirect_socket, disconnect_work);
+	struct smbdirect_recv_io *recv_io, *recv_tmp;
+	unsigned long flags;
+
+	/*
+	 * This should not never be called in an interrupt!
+	 */
+	WARN_ON_ONCE(in_interrupt());
+
+	if (!sc->first_error) {
+		smbdirect_log_rdma_event(sc, SMBDIRECT_LOG_ERR,
+			"%s called with first_error==0\n",
+			smbdirect_socket_status_string(sc->status));
+
+		sc->first_error = -ECONNABORTED;
+	}
+
+	/*
+	 * make sure this and other work is not queued again
+	 * but here we don't block and avoid
+	 * disable[_delayed]_work_sync()
+	 */
+	disable_work(&sc->disconnect_work);
+	disable_work(&sc->recv_io.posted.refill_work);
+	disable_work(&sc->mr_io.recovery_work);
+	disable_work(&sc->idle.immediate_work);
+	disable_delayed_work(&sc->idle.timer_work);
+
+	/*
+	 * If any complex work was scheduled we
+	 * should disable it (only happens during
+	 * negotiation)...
+	 *
+	 * Note that sc->first_error is set before,
+	 * so any future smbdirect_connection_get_recv_io()
+	 * will see it and return NULL.
+	 */
+	spin_lock_irqsave(&sc->recv_io.free.lock, flags);
+	list_for_each_entry_safe(recv_io, recv_tmp, &sc->recv_io.free.list, list)
+		disable_work(&recv_io->complex_work);
+	spin_unlock_irqrestore(&sc->recv_io.free.lock, flags);
+
+	switch (sc->status) {
+	case SMBDIRECT_SOCKET_NEGOTIATE_NEEDED:
+	case SMBDIRECT_SOCKET_NEGOTIATE_RUNNING:
+	case SMBDIRECT_SOCKET_NEGOTIATE_FAILED:
+	case SMBDIRECT_SOCKET_CONNECTED:
+	case SMBDIRECT_SOCKET_ERROR:
+		sc->status = SMBDIRECT_SOCKET_DISCONNECTING;
+		rdma_disconnect(sc->rdma.cm_id);
+		break;
+
+	case SMBDIRECT_SOCKET_CREATED:
+	case SMBDIRECT_SOCKET_RESOLVE_ADDR_NEEDED:
+	case SMBDIRECT_SOCKET_RESOLVE_ADDR_RUNNING:
+	case SMBDIRECT_SOCKET_RESOLVE_ADDR_FAILED:
+	case SMBDIRECT_SOCKET_RESOLVE_ROUTE_NEEDED:
+	case SMBDIRECT_SOCKET_RESOLVE_ROUTE_RUNNING:
+	case SMBDIRECT_SOCKET_RESOLVE_ROUTE_FAILED:
+	case SMBDIRECT_SOCKET_RDMA_CONNECT_NEEDED:
+	case SMBDIRECT_SOCKET_RDMA_CONNECT_RUNNING:
+	case SMBDIRECT_SOCKET_RDMA_CONNECT_FAILED:
+		/*
+		 * rdma_{accept,connect}() never reached
+		 * RDMA_CM_EVENT_ESTABLISHED
+		 */
+		sc->status = SMBDIRECT_SOCKET_DISCONNECTED;
+		break;
+
+	case SMBDIRECT_SOCKET_DISCONNECTING:
+	case SMBDIRECT_SOCKET_DISCONNECTED:
+	case SMBDIRECT_SOCKET_DESTROYED:
+		break;
+	}
+
+	/*
+	 * Wake up all waiters in all wait queues
+	 * in order to notice the broken connection.
+	 */
+	smbdirect_socket_wake_up_all(sc);
+}
-- 
2.43.0


