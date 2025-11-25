Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id EAA60C868EF
	for <lists+samba-technical@lfdr.de>; Tue, 25 Nov 2025 19:19:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=k18e4IAtqqAZh0vu7fxNZxFYB/sed2l9E/hGTY71+68=; b=tDLelBYxCB/5jBlxmBHDk84mL0
	FYQqurv6qtJ8JdNM0a5i02q/lbe4nVe0knbUPWPmrL1BZeOYBXzBUQDgawnAEpHtEuPaqY3liyuLn
	7Yr3yZI72AA03FTDuH5lFdoMRXN6jr15U+bCtkBDpWkUyVKEFidHL174anj3NRYE8QwQVDcaYgZL5
	CeKel/upAEWnamXnr2N1W/f0lu8JQ3+15+e7Z59sL2w7HLYyMKz4whyaguxm9VLxb+IPv0j3HMXiM
	hTsIC9OhKtcCvju8sXY1IwSo/9my+YqX1A9fawlTbCitW7onp2QhuySPYDhp9JzImTchJ82Ztn2aU
	enU2plnw==;
Received: from ip6-localhost ([::1]:48506 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vNxdO-00DDnh-QX; Tue, 25 Nov 2025 18:19:28 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:61422) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vNxUZ-00DAln-V0
 for samba-technical@lists.samba.org; Tue, 25 Nov 2025 18:10:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=k18e4IAtqqAZh0vu7fxNZxFYB/sed2l9E/hGTY71+68=; b=n2Gal7VKCnzKF+pc1XpL5+lHKZ
 lWXNY/n6WxBTg6eQF8N88rAV6yBfcbsvhX7wZAsEsW/98ZCBVBMOWhNJmMVdeM5ZMERtHBDVARDKF
 XXmnNTf/r8GCPpiQGxwt4PjD7uanEi8J6oB7Qwd0FFJXLmTf+OVWlJGSOLMRIcHITFtACCRq+BX2C
 53quELgnZcK8yIaY4YJVZuk/ZS9nQWfFbKw/Pnukhtg4/NjMz9Dzd+Ysy7+b+l7WI1r9u6OoqeO5j
 H3tB3IShHqFVRD7Vt+cuyq5+Z0aJ1GytVRRot8tBClJ/3JIavCwKA8B/8vLqxzMIefsS4uKE7Te6I
 fT8V1+0HZmvqgkgZEQ5iwv3QJU1xN5Q/ga8MKfXZhIs3Px/k+GWLa7f2znEXE5Mppnh0+wh/rSMK9
 Ta6gKyk9iu3ivKbzUjE7zYtFsh57dANdrgcHmeOIVe5KDF6SohkORLASZnyw7W1+Jubj/mxfKtMkx
 +cC4ByMMaNyB39fTXlzMR4st;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vNxTn-00Fe6u-0J; Tue, 25 Nov 2025 18:09:41 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v4 092/145] smb: client: introduce and use
 smbd_debug_proc_show()
Date: Tue, 25 Nov 2025 18:55:38 +0100
Message-ID: <437d459195cca4ed649541a4b90e1e24c8ea19a8.1764091285.git.metze@samba.org>
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

This will allow us to make struct smbdirect_socket private
in future.

Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: Long Li <longli@microsoft.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
Signed-off-by: Steve French <stfrench@microsoft.com>
---
 fs/smb/client/cifs_debug.c | 67 +-------------------------------------
 fs/smb/client/smbdirect.c  | 15 +++++++++
 fs/smb/client/smbdirect.h  |  1 +
 3 files changed, 17 insertions(+), 66 deletions(-)

diff --git a/fs/smb/client/cifs_debug.c b/fs/smb/client/cifs_debug.c
index ceca2ef0ff8d..c4a12e6689b4 100644
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
@@ -456,11 +455,6 @@ static int cifs_debug_data_proc_show(struct seq_file *m, void *v)
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
@@ -475,66 +469,7 @@ static int cifs_debug_data_proc_show(struct seq_file *m, void *v)
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
index 4ad1d13de812..1a72505218ae 100644
--- a/fs/smb/client/smbdirect.c
+++ b/fs/smb/client/smbdirect.c
@@ -1212,3 +1212,18 @@ void smbd_deregister_mr(struct smbdirect_mr_io *mr)
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
index 9f14f5cb4a38..7986e87bf384 100644
--- a/fs/smb/client/smbdirect.h
+++ b/fs/smb/client/smbdirect.h
@@ -64,6 +64,7 @@ void smbd_mr_fill_buffer_descriptor(struct smbdirect_mr_io *mr,
 				    struct smbdirect_buffer_descriptor_v1 *v1);
 void smbd_deregister_mr(struct smbdirect_mr_io *mr);
 
+void smbd_debug_proc_show(struct TCP_Server_Info *server, struct seq_file *m);
 
 #else
 #define cifs_rdma_enabled(server)	0
-- 
2.43.0


