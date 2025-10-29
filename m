Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FB5BC1AB5D
	for <lists+samba-technical@lfdr.de>; Wed, 29 Oct 2025 14:32:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=YIMh36NASiYd+FL5RkDcGP5Kf2wKsc+rLqDkTJb55xM=; b=BnJRM9h/da2P+q+VxlpaDPwpHf
	7TCDv+HtrBGWmXKdALl6tmhql50OSQQxaxxjZ5RDK3ZQyRMbRT291grVTuT9g1ZsCf/9bl63GBvYU
	9D6TGzUupF9/mEb0KJ/QHukccXr3RnSYSLHzsOq+LJzYg0RV3T2W43cCP9fdx1g3eT7Eyfy3OGDFM
	mtGcRsf9vQzbvzYhVu+uPARhBe6ucHIWRTECiYO3DWxYkjJsRgmOErWk+UREz83kNReYTijdVOV0R
	hG2znenT6jbxx4paI5grR+SPAvpYg8nsw9Tv4PGvCrp7WBp5+O7+tfL6WHbew7NHg6h8Zjzk+8Xsr
	4t8KB+bw==;
Received: from ip6-localhost ([::1]:21534 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vE6Hb-00986c-HK; Wed, 29 Oct 2025 13:32:12 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:50698) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vE6Bl-0096Fd-VT
 for samba-technical@lists.samba.org; Wed, 29 Oct 2025 13:26:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=YIMh36NASiYd+FL5RkDcGP5Kf2wKsc+rLqDkTJb55xM=; b=0UR5ObdHEzpvhBDGCGE3Vw9xQN
 I547/3q1o+R0NUI7Lgg1J/l7BfpbGo+ChkrOqBR/qYJMDaIdHnmA++y06Gx5PTUq6em9o/HXs3fOy
 d+++kSOGCVCdxtd775+ralopgcyT2TIyTthzXqm26ggJs+BFs+FH4GdVErWe4iT5QNx/8H/f0G2HE
 GmYzPkEigXo32f6fexaqix61O4kNFbl7n6+HASyrrXHhLMN3FBRsyZl5SOb895L/4rN4uzIHI9M4k
 dJPCVnWBqudQOD81Q/zKMxHpRoWw3inOF7meIRyv5yX/pi0yyr2KPi9DQLt736cvDUCq0GV2ZNlXI
 zrGXoSvmPsDfmiT1XQEgRhUKHFCfmJAlg9x+FM1cN8RZ+2o8AqmLP2gfu3CyevrHbWKb6cvcD+GWP
 2djnwdgHP8focrWSGiipexDRoY5QkH+vGtCWCB6OFQcxTuFk+m1AfhJK3Se078gxaZ7tx6AY/D+PP
 g7oQgWFjaa7cVtXdMQQBBXeH;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vE6Bi-00Bbje-2E; Wed, 29 Oct 2025 13:26:06 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v2 036/127] smb: smbdirect: introduce
 smbdirect_connection_destroy[_sync]()
Date: Wed, 29 Oct 2025 14:20:14 +0100
Message-ID: <1143613c2eec793d4c4ad87d108b34dbd2fb11ec.1761742839.git.metze@samba.org>
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

This will be used in common between client and server in
order to destroy all resources attached to a connection.

Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: Long Li <longli@microsoft.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
---
 .../common/smbdirect/smbdirect_connection.c   | 126 ++++++++++++++++++
 1 file changed, 126 insertions(+)

diff --git a/fs/smb/common/smbdirect/smbdirect_connection.c b/fs/smb/common/smbdirect/smbdirect_connection.c
index cea05753c80e..6fe6c53e10ea 100644
--- a/fs/smb/common/smbdirect/smbdirect_connection.c
+++ b/fs/smb/common/smbdirect/smbdirect_connection.c
@@ -24,6 +24,8 @@ static void smbdirect_connection_schedule_disconnect(struct smbdirect_socket *sc
 static void smbdirect_connection_disconnect_work(struct work_struct *work);
 static void smbdirect_connection_idle_timer_work(struct work_struct *work);
 
+static void smbdirect_connection_destroy_mr_list(struct smbdirect_socket *sc);
+
 __maybe_unused /* this is temporary while this file is included in orders */
 static bool smbdirect_frwr_is_supported(const struct ib_device_attr *attrs)
 {
@@ -765,6 +767,130 @@ static void smbdirect_connection_disconnect_work(struct work_struct *work)
 	smbdirect_connection_wake_up_all(sc);
 }
 
+static void smbdirect_connection_destroy(struct smbdirect_socket *sc)
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
+	 * smbdirect_connection_disconnect_work(), but call it again...
+	 */
+	smbdirect_connection_wake_up_all(sc);
+
+	disable_work_sync(&sc->disconnect_work);
+	disable_work_sync(&sc->recv_io.posted.refill_work);
+	disable_work_sync(&sc->mr_io.recovery_work);
+	disable_work_sync(&sc->idle.immediate_work);
+	disable_delayed_work_sync(&sc->idle.timer_work);
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
+	list_for_each_entry_safe(recv_io, recv_tmp, &all_list, list) {
+		smbdirect_connection_put_recv_io(recv_io);
+	}
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
+__maybe_unused /* this is temporary while this file is included in orders */
+static void smbdirect_connection_destroy_sync(struct smbdirect_socket *sc)
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
+	smbdirect_log_rdma_event(sc, SMBDIRECT_LOG_INFO, "destroying rdma session\n");
+	if (sc->status < SMBDIRECT_SOCKET_DISCONNECTING)
+		smbdirect_connection_disconnect_work(&sc->disconnect_work);
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
+	 * we should call smbdirect_connection_destroy()
+	 */
+	smbdirect_connection_destroy(sc);
+	smbdirect_log_rdma_event(sc, SMBDIRECT_LOG_INFO,
+		"status=%s first_error=%1pe",
+		smbdirect_socket_status_string(sc->status),
+		SMBDIRECT_DEBUG_ERR_PTR(sc->first_error));
+}
+
 static void smbdirect_connection_idle_timer_work(struct work_struct *work)
 {
 	struct smbdirect_socket *sc =
-- 
2.43.0


