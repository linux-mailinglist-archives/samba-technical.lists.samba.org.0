Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C394C8671D
	for <lists+samba-technical@lfdr.de>; Tue, 25 Nov 2025 19:06:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=BkzrHLtQ6ivyW1BZRQxOplaEFYBbBZHCbjgD3AHpLLk=; b=uMAtFLwJBpgysEmKTDu4XqfCGL
	z98AhBKP7xZzZ6wGHwnnLAyLbRFk3a3sbOGgE7DC0ouZyvpLTzoy1+BGm+ypj9ttAEwDT03r6ssxR
	KS4nmkUO9sg57KWbHrGvsf4mLg0+K1D1JNVAtBaevByr06Bl01k2R79VIW1ayvAtkYtI7/jAHkdRj
	/JMqv9z45UmPl4iI1AIt6+kZnkU6GzW6fHKoCHR8wa9WGqp4J50Ue5BXV1nxPgSrScsRF0EG35Fyi
	NM/VlDUcqkFIW+ANe7VWJ96+W344GoShhw45nw/STMsdd1o1LPe7MJc65fXVlvaWEgFbrMH9IzXyV
	xCVeg3lw==;
Received: from ip6-localhost ([::1]:26796 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vNxQz-00D9aX-1c; Tue, 25 Nov 2025 18:06:38 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:12262) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vNxLJ-00D7lm-FO
 for samba-technical@lists.samba.org; Tue, 25 Nov 2025 18:00:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=BkzrHLtQ6ivyW1BZRQxOplaEFYBbBZHCbjgD3AHpLLk=; b=fUX2T798ppnu+DxRXrWunkDtHE
 h9PX6lWmcMV4NQ7EIWVu8UN6Yjjk3H9bvq2walsr06uIU2laeRPIE5nvz9v8hAVh37ThU+Dcmzlpf
 o/aaNpXc9QYlPqU0o5MsP5NifwOiDHCv6nEoIl2sNjEuBkRADVpHDPrqT9Ryw9L5x8To8PMXR0IIE
 hiKhB+WkZcva8iYtuZIDy7yF8TcdNHSd3ttStR+NClzIigSebWdTZFIv0lUHmX4GsZqg+julDldD7
 esEKw4zb+Ru4S7J1obOjIZQkMTgIyp3nPXbr1CPJ5cs+3WYkoe8NnJ1zT9vqDXaF4lFyochxvhfiU
 Le7yefCrHPaKHlaiKOI2uE4F/RdSZ+4cYi5NaolShZZ4WtTvlW4GGyVh5vHDT4nE0vll4sp7MfvVy
 /LUVLsf4v/3bifsKo/Oz3bkzQDy1NBuW3PxPUkH+iecBqMKl4eZTm5yj7f/etAtQGzZ1N28NG9fqg
 LNWkZw8EKjWiqyd8RykznTNp;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vNxLD-00Fd5a-2r; Tue, 25 Nov 2025 18:00:40 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v4 039/145] smb: smbdirect: introduce
 smbdirect_socket_destroy[_sync]()
Date: Tue, 25 Nov 2025 18:54:45 +0100
Message-ID: <c5aaca24cab6689774d6cb77b0d2902524ba1eec.1764091285.git.metze@samba.org>
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

This will be used in common between client and server in
order to destroy all resources attached to a connection.

Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: Long Li <longli@microsoft.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
Signed-off-by: Steve French <stfrench@microsoft.com>
---
 .../common/smbdirect/smbdirect_connection.c   |   4 -
 fs/smb/common/smbdirect/smbdirect_internal.h  |   8 +
 fs/smb/common/smbdirect/smbdirect_mr.c        |   1 -
 fs/smb/common/smbdirect/smbdirect_socket.c    | 151 ++++++++++++++++++
 4 files changed, 159 insertions(+), 5 deletions(-)

diff --git a/fs/smb/common/smbdirect/smbdirect_connection.c b/fs/smb/common/smbdirect/smbdirect_connection.c
index c1e159b41a36..dcaab7383e7d 100644
--- a/fs/smb/common/smbdirect/smbdirect_connection.c
+++ b/fs/smb/common/smbdirect/smbdirect_connection.c
@@ -77,8 +77,6 @@ static u32 smbdirect_rdma_rw_send_wrs(struct ib_device *dev,
 	return factor * attr->cap.max_rdma_ctxs;
 }
 
-static void smbdirect_connection_destroy_qp(struct smbdirect_socket *sc);
-
 __maybe_unused /* this is temporary while this file is included in others */
 static int smbdirect_connection_create_qp(struct smbdirect_socket *sc)
 {
@@ -258,8 +256,6 @@ static void smbdirect_connection_destroy_qp(struct smbdirect_socket *sc)
 	}
 }
 
-static void smbdirect_connection_destroy_mem_pools(struct smbdirect_socket *sc);
-
 __maybe_unused /* this is temporary while this file is included in others */
 static int smbdirect_connection_create_mem_pools(struct smbdirect_socket *sc)
 {
diff --git a/fs/smb/common/smbdirect/smbdirect_internal.h b/fs/smb/common/smbdirect/smbdirect_internal.h
index 43ef6e39f28e..ead845948089 100644
--- a/fs/smb/common/smbdirect/smbdirect_internal.h
+++ b/fs/smb/common/smbdirect/smbdirect_internal.h
@@ -40,6 +40,14 @@ static int smbdirect_socket_wait_for_credits(struct smbdirect_socket *sc,
 					     atomic_t *total_credits,
 					     int needed);
 
+static void smbdirect_connection_destroy_qp(struct smbdirect_socket *sc);
+
+static void smbdirect_connection_destroy_mem_pools(struct smbdirect_socket *sc);
+
+static void smbdirect_connection_put_recv_io(struct smbdirect_recv_io *msg);
+
 static void smbdirect_connection_idle_timer_work(struct work_struct *work);
 
+static void smbdirect_connection_destroy_mr_list(struct smbdirect_socket *sc);
+
 #endif /* __FS_SMB_COMMON_SMBDIRECT_INTERNAL_H__ */
diff --git a/fs/smb/common/smbdirect/smbdirect_mr.c b/fs/smb/common/smbdirect/smbdirect_mr.c
index d52e5b8ab71c..35dc2a6c9b89 100644
--- a/fs/smb/common/smbdirect/smbdirect_mr.c
+++ b/fs/smb/common/smbdirect/smbdirect_mr.c
@@ -6,7 +6,6 @@
 
 #include "smbdirect_internal.h"
 
-static void smbdirect_connection_destroy_mr_list(struct smbdirect_socket *sc);
 static void smbdirect_connection_mr_io_recovery_work(struct work_struct *work);
 
 /*
diff --git a/fs/smb/common/smbdirect/smbdirect_socket.c b/fs/smb/common/smbdirect/smbdirect_socket.c
index 9093352d1a57..b0079c1f59aa 100644
--- a/fs/smb/common/smbdirect/smbdirect_socket.c
+++ b/fs/smb/common/smbdirect/smbdirect_socket.c
@@ -280,6 +280,157 @@ static void smbdirect_socket_cleanup_work(struct work_struct *work)
 	smbdirect_socket_wake_up_all(sc);
 }
 
+static void smbdirect_socket_destroy(struct smbdirect_socket *sc)
+{
+	struct smbdirect_recv_io *recv_io;
+	struct smbdirect_recv_io *recv_tmp;
+	LIST_HEAD(all_list);
+	unsigned long flags;
+
+	smbdirect_log_rdma_event(sc, SMBDIRECT_LOG_INFO,
+		"status=%s first_error=%1pe",
+		smbdirect_socket_status_string(sc->status),
+		SMBDIRECT_DEBUG_ERR_PTR(sc->first_error));
+
+	/*
+	 * This should not never be called in an interrupt!
+	 */
+	WARN_ON_ONCE(in_interrupt());
+
+	if (sc->status == SMBDIRECT_SOCKET_DESTROYED)
+		return;
+
+	WARN_ONCE(sc->status != SMBDIRECT_SOCKET_DISCONNECTED,
+		  "status=%s first_error=%1pe",
+		  smbdirect_socket_status_string(sc->status),
+		  SMBDIRECT_DEBUG_ERR_PTR(sc->first_error));
+
+	/*
+	 * Wake up all waiters in all wait queues
+	 * in order to notice the broken connection.
+	 *
+	 * Most likely this was already called via
+	 * smbdirect_socket_cleanup_work(), but call it again...
+	 */
+	smbdirect_socket_wake_up_all(sc);
+
+	disable_work_sync(&sc->disconnect_work);
+	disable_work_sync(&sc->recv_io.posted.refill_work);
+	disable_work_sync(&sc->mr_io.recovery_work);
+	disable_work_sync(&sc->idle.immediate_work);
+	disable_delayed_work_sync(&sc->idle.timer_work);
+
+	/*
+	 * If any complex work was scheduled we
+	 * should disable it (only happens during
+	 * negotiation)...
+	 *
+	 * Note was already set in sc->first_error in
+	 * smbdirect_socket_schedule_cleanup() or
+	 * smbdirect_socket_cleanup_work(), both
+	 * before time before:
+	 * spin_lock_irqsave(&sc->recv_io.free.lock, flags),
+	 * so any future smbdirect_connection_get_recv_io()
+	 * will see it and return NULL. And we don't
+	 * need to get the lock here again, while
+	 * trying disable_work_sync().
+	 */
+	list_for_each_entry_safe(recv_io, recv_tmp, &sc->recv_io.free.list, list)
+		disable_work_sync(&recv_io->complex_work);
+
+	if (sc->rdma.cm_id)
+		rdma_lock_handler(sc->rdma.cm_id);
+
+	if (sc->ib.qp) {
+		smbdirect_log_rdma_event(sc, SMBDIRECT_LOG_INFO,
+			"drain qp\n");
+		ib_drain_qp(sc->ib.qp);
+	}
+
+	/* It's not possible for upper layer to get to reassembly */
+	smbdirect_log_rdma_event(sc, SMBDIRECT_LOG_INFO,
+		"drain the reassembly queue\n");
+	spin_lock_irqsave(&sc->recv_io.reassembly.lock, flags);
+	list_splice_tail_init(&sc->recv_io.reassembly.list, &all_list);
+	spin_unlock_irqrestore(&sc->recv_io.reassembly.lock, flags);
+	list_for_each_entry_safe(recv_io, recv_tmp, &all_list, list)
+		smbdirect_connection_put_recv_io(recv_io);
+	sc->recv_io.reassembly.data_length = 0;
+
+	smbdirect_log_rdma_event(sc, SMBDIRECT_LOG_INFO,
+		"freeing mr list\n");
+	smbdirect_connection_destroy_mr_list(sc);
+
+	smbdirect_log_rdma_event(sc, SMBDIRECT_LOG_INFO,
+		"destroying qp\n");
+	smbdirect_connection_destroy_qp(sc);
+	if (sc->rdma.cm_id) {
+		rdma_unlock_handler(sc->rdma.cm_id);
+		smbdirect_log_rdma_event(sc, SMBDIRECT_LOG_INFO,
+			"destroying cm_id\n");
+		rdma_destroy_id(sc->rdma.cm_id);
+		sc->rdma.cm_id = NULL;
+	}
+
+	smbdirect_log_rdma_event(sc, SMBDIRECT_LOG_INFO,
+		"destroying mem pools\n");
+	smbdirect_connection_destroy_mem_pools(sc);
+
+	sc->status = SMBDIRECT_SOCKET_DESTROYED;
+
+	smbdirect_log_rdma_event(sc, SMBDIRECT_LOG_INFO,
+		"rdma session destroyed\n");
+}
+
+__maybe_unused /* this is temporary while this file is included in others */
+static void smbdirect_socket_destroy_sync(struct smbdirect_socket *sc)
+{
+	smbdirect_log_rdma_event(sc, SMBDIRECT_LOG_INFO,
+		"status=%s first_error=%1pe",
+		smbdirect_socket_status_string(sc->status),
+		SMBDIRECT_DEBUG_ERR_PTR(sc->first_error));
+
+	/*
+	 * This should not never be called in an interrupt!
+	 */
+	WARN_ON_ONCE(in_interrupt());
+
+	smbdirect_log_rdma_event(sc, SMBDIRECT_LOG_INFO,
+		"cancelling and disable disconnect_work\n");
+	disable_work_sync(&sc->disconnect_work);
+
+	smbdirect_log_rdma_event(sc, SMBDIRECT_LOG_INFO,
+		"destroying rdma session\n");
+	if (sc->status < SMBDIRECT_SOCKET_DISCONNECTING) {
+		/*
+		 * SMBDIRECT_LOG_INFO is enough here
+		 * as this is the typical case where
+		 * we terminate the connection ourself.
+		 */
+		smbdirect_socket_schedule_cleanup_lvl(sc,
+						      SMBDIRECT_LOG_INFO,
+						      -ESHUTDOWN);
+		smbdirect_socket_cleanup_work(&sc->disconnect_work);
+	}
+	if (sc->status < SMBDIRECT_SOCKET_DISCONNECTED) {
+		smbdirect_log_rdma_event(sc, SMBDIRECT_LOG_INFO,
+			"wait for transport being disconnected\n");
+		wait_event(sc->status_wait, sc->status == SMBDIRECT_SOCKET_DISCONNECTED);
+		smbdirect_log_rdma_event(sc, SMBDIRECT_LOG_INFO,
+			"waited for transport being disconnected\n");
+	}
+
+	/*
+	 * Once we reached SMBDIRECT_SOCKET_DISCONNECTED,
+	 * we should call smbdirect_socket_destroy()
+	 */
+	smbdirect_socket_destroy(sc);
+	smbdirect_log_rdma_event(sc, SMBDIRECT_LOG_INFO,
+		"status=%s first_error=%1pe",
+		smbdirect_socket_status_string(sc->status),
+		SMBDIRECT_DEBUG_ERR_PTR(sc->first_error));
+}
+
 __maybe_unused /* this is temporary while this file is included in others */
 static int smbdirect_socket_wait_for_credits(struct smbdirect_socket *sc,
 					     enum smbdirect_socket_status expected_status,
-- 
2.43.0


