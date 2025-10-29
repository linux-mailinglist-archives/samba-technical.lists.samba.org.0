Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C03CC1ADB2
	for <lists+samba-technical@lfdr.de>; Wed, 29 Oct 2025 14:44:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=AYrBUIz+gTNOgZNfdkKD0+K1iv+7Vduyiv0/L2DDslE=; b=6R2ESXWbK3772PGywBs04M/1Xq
	qS5UNnLrLl3Kcu1jrs5Aqbw4iP45lln2OxsrkHaAP+rsUAgDLPw8QEIGdOIipqZxT7FH9tfMEq7xA
	hWHtMC/rd/kABEc9HcsZuPOuUXGdEirw1M1uMtwSRLH2jE+HxckEgn6SzE0MSX/e4urEFhWCY8paQ
	w7mhGm3q/0hZyGqAVtmJ9Dq6Er6TxHLTRfeOZX47/tgrllPwlYX6/HGC8LjSYRpNN/kUcTopS1lDn
	hioLJ/Vi/+aquKS0La9RZGyv+E4iXs+ncZD9QyOQAXh8QzzNGTy4S2GLXbxR4Q6FngodS8ju8fjDE
	fQOnYdbQ==;
Received: from ip6-localhost ([::1]:23396 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vE6Sv-009CAy-IU; Wed, 29 Oct 2025 13:43:54 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:53118) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vE6Gl-0097s3-ND
 for samba-technical@lists.samba.org; Wed, 29 Oct 2025 13:31:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=AYrBUIz+gTNOgZNfdkKD0+K1iv+7Vduyiv0/L2DDslE=; b=UfLKOGw4BAE/NZJCOLVUtmCEDk
 TM/Y+RPJ4ra3LY4uzbxBqkmYARxaYjundx1LJ2F/O27oBtAyfCAQiAJixbZmKpbtkoB5QzAit212i
 3YRHyDbEh1i4J8bZ4Vtv45yidAvpMgv8cjWK0NMAkql05B9TO5+VoeMCuhByqjNaOUzfm8bw40uMi
 ST5GshTVIzc/uD0I9gejBXBbXPqDuok/vm5oTQpJggSimVSU6QFFC6s5Hs9kD87YrEh3XNa9oh48j
 56uVMNzARWPlEr8+lddvDqExHHW9Qub2EP0S3VRMyXBjsS5lod6UEm7yzlXG2+iVISDVObkhh7+4l
 UmD4ui49yQb6JTrKF46TAbBzlEEIN2t9xt5T9t4xHGHzySquTlPKAtqfz14b2stPrGaoidjAEIFFf
 0TIHi2dPZOspTFleWIwicJjD4Dp9BEVUeSY7mmu67Y/PEngMlK6cMwHjqTm7bJSeYS8/ICSHCjF2K
 GGkTdiknRk1IAKygDeNLCG8/;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vE6Ge-00BcVu-1P; Wed, 29 Oct 2025 13:31:14 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v2 087/127] smb: client: introduce and use
 smbd_debug_proc_show()
Date: Wed, 29 Oct 2025 14:21:05 +0100
Message-ID: <6d5b50eb670c02dc583b0b67ff7db41ed6da68af.1761742839.git.metze@samba.org>
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

This will allow us to make struct smbdirect_socket private
in future.

Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: Long Li <longli@microsoft.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
---
 fs/smb/client/cifs_debug.c | 67 +-------------------------------------
 fs/smb/client/smbdirect.c  | 15 +++++++++
 fs/smb/client/smbdirect.h  |  2 ++
 3 files changed, 18 insertions(+), 66 deletions(-)

diff --git a/fs/smb/client/cifs_debug.c b/fs/smb/client/cifs_debug.c
index 1fb71d2d31b5..5076d4a96bda 100644
--- a/fs/smb/client/cifs_debug.c
+++ b/fs/smb/client/cifs_debug.c
@@ -24,7 +24,6 @@
 #endif
 #ifdef CONFIG_CIFS_SMB_DIRECT
 #include "smbdirect.h"
-#include "../common/smbdirect/smbdirect_pdu.h"
 #endif
 #include "cifs_swn.h"
 #include "cached_dir.h"
@@ -457,11 +456,6 @@ static int cifs_debug_data_proc_show(struct seq_file *m, void *v)
 	c = 0;
 	spin_lock(&cifs_tcp_ses_lock);
 	list_for_each_entry(server, &cifs_tcp_ses_list, tcp_ses_list) {
-#ifdef CONFIG_CIFS_SMB_DIRECT
-		struct smbdirect_socket *sc;
-		struct smbdirect_socket_parameters *sp;
-#endif
-
 		/* channel info will be printed as a part of sessions below */
 		if (SERVER_IS_CHAN(server))
 			continue;
@@ -476,66 +470,7 @@ static int cifs_debug_data_proc_show(struct seq_file *m, void *v)
 		seq_printf(m, "\nClientGUID: %pUL", server->client_guid);
 		spin_unlock(&server->srv_lock);
 #ifdef CONFIG_CIFS_SMB_DIRECT
-		if (!server->rdma)
-			goto skip_rdma;
-
-		if (!server->smbd_conn) {
-			seq_printf(m, "\nSMBDirect transport not available");
-			goto skip_rdma;
-		}
-		sc = &server->smbd_conn->socket;
-		sp = &sc->parameters;
-
-		seq_printf(m, "\nSMBDirect protocol version: 0x%x "
-			"transport status: %s (%u)",
-			SMBDIRECT_V1,
-			smbdirect_socket_status_string(sc->status),
-			sc->status);
-		seq_printf(m, "\nConn receive_credit_max: %u "
-			"send_credit_target: %u max_send_size: %u",
-			sp->recv_credit_max,
-			sp->send_credit_target,
-			sp->max_send_size);
-		seq_printf(m, "\nConn max_fragmented_recv_size: %u "
-			"max_fragmented_send_size: %u max_receive_size:%u",
-			sp->max_fragmented_recv_size,
-			sp->max_fragmented_send_size,
-			sp->max_recv_size);
-		seq_printf(m, "\nConn keep_alive_interval: %u "
-			"max_readwrite_size: %u rdma_readwrite_threshold: %u",
-			sp->keepalive_interval_msec * 1000,
-			sp->max_read_write_size,
-			server->rdma_readwrite_threshold);
-		seq_printf(m, "\nDebug count_get_receive_buffer: %llu "
-			"count_put_receive_buffer: %llu count_send_empty: %llu",
-			sc->statistics.get_receive_buffer,
-			sc->statistics.put_receive_buffer,
-			sc->statistics.send_empty);
-		seq_printf(m, "\nRead Queue "
-			"count_enqueue_reassembly_queue: %llu "
-			"count_dequeue_reassembly_queue: %llu "
-			"reassembly_data_length: %u "
-			"reassembly_queue_length: %u",
-			sc->statistics.enqueue_reassembly_queue,
-			sc->statistics.dequeue_reassembly_queue,
-			sc->recv_io.reassembly.data_length,
-			sc->recv_io.reassembly.queue_length);
-		seq_printf(m, "\nCurrent Credits send_credits: %u "
-			"receive_credits: %u receive_credit_target: %u",
-			atomic_read(&sc->send_io.credits.count),
-			atomic_read(&sc->recv_io.credits.count),
-			sc->recv_io.credits.target);
-		seq_printf(m, "\nPending send_pending: %u ",
-			atomic_read(&sc->send_io.pending.count));
-		seq_printf(m, "\nMR responder_resources: %u "
-			"max_frmr_depth: %u mr_type: 0x%x",
-			sp->responder_resources,
-			sp->max_frmr_depth,
-			sc->mr_io.type);
-		seq_printf(m, "\nMR mr_ready_count: %u mr_used_count: %u",
-			atomic_read(&sc->mr_io.ready.count),
-			atomic_read(&sc->mr_io.used.count));
-skip_rdma:
+		smbd_debug_proc_show(server, m);
 #endif
 		seq_printf(m, "\nNumber of credits: %d,%d,%d Dialect 0x%x",
 			server->credits,
diff --git a/fs/smb/client/smbdirect.c b/fs/smb/client/smbdirect.c
index d52ded68dee4..745879bf3a3f 100644
--- a/fs/smb/client/smbdirect.c
+++ b/fs/smb/client/smbdirect.c
@@ -1211,3 +1211,18 @@ void smbd_deregister_mr(struct smbdirect_mr_io *mr)
 {
 	smbdirect_connection_deregister_mr_io(mr);
 }
+
+void smbd_debug_proc_show(struct TCP_Server_Info *server, struct seq_file *m)
+{
+	if (!server->rdma)
+		return;
+
+	if (!server->smbd_conn) {
+		seq_puts(m, "\nSMBDirect transport not available");
+		return;
+	}
+
+	smbdirect_connection_legacy_debug_proc_show(&server->smbd_conn->socket,
+						    server->rdma_readwrite_threshold,
+						    m);
+}
diff --git a/fs/smb/client/smbdirect.h b/fs/smb/client/smbdirect.h
index 09f7dd14b2c1..7986e87bf384 100644
--- a/fs/smb/client/smbdirect.h
+++ b/fs/smb/client/smbdirect.h
@@ -64,6 +64,8 @@ void smbd_mr_fill_buffer_descriptor(struct smbdirect_mr_io *mr,
 				    struct smbdirect_buffer_descriptor_v1 *v1);
 void smbd_deregister_mr(struct smbdirect_mr_io *mr);
 
+void smbd_debug_proc_show(struct TCP_Server_Info *server, struct seq_file *m);
+
 #else
 #define cifs_rdma_enabled(server)	0
 struct smbd_connection {};
-- 
2.43.0


