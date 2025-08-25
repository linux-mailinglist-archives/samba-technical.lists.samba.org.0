Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C9D9B34CC7
	for <lists+samba-technical@lfdr.de>; Mon, 25 Aug 2025 22:52:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=+BkAtarVbo/Pg7POrei8KmWlwGi/T9mvQ78+nC2JiIw=; b=SXxuLlAKzxL8GBD6v6sMdVfLER
	AvM0riU1OCAicu5mAXYmPINGaE9TnPXMvL+doL0HpXsmPrFPWM9ZFFJ12I64wNmTNRZfbLsQFLUF1
	rQ6xV/lbZ8+4emMwGeg95hxaH+bUHz8Yzt0hNfCKKezRxdrqBsIfFvnhkC/cfqVBqT6/3bhusUYZ0
	o4s4MVoKPUJmUs9/md17aSRa9gr4iq1K1xjzBohGZFv4BMSSmu6BJ2d8ZfDaUBWbc7HOfqNfkKQa9
	SWlqaFg1ZAs8PDN7wY4MgHCW1fl46qLs8YnbUD0h5GCy4cmE6KEiRrWjs9nJfOJL54GfwJllIYCjG
	yTDO/QEQ==;
Received: from ip6-localhost ([::1]:45810 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uqeAs-000P8e-NP; Mon, 25 Aug 2025 20:52:20 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:62466) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uqe8Y-000OGG-Eb
 for samba-technical@lists.samba.org; Mon, 25 Aug 2025 20:50:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=+BkAtarVbo/Pg7POrei8KmWlwGi/T9mvQ78+nC2JiIw=; b=MunEwPXDt3bJVpMVvxHOUw4CQi
 iTvr57SMs6VyWfD7/03WOaSJv5t1/JlKVPvJd7gH3wSQx5U0SL9tgvRHQ/fX+jTc7CIWarTrmJ1Fp
 C59UopBg9MAJe6hylTS0hQYVBcBGYtrJmjvl0J68QPMPv55aSSNfjsNDcylwErSSOKo/P90tC2dVd
 TaOIm3l+Pzl0TRGfXrE8tSVpv2wGf2HL7KG/7lmL16SjVBZj+TQqLo7CUvuwlPvhlaPgKWwW56NRd
 MFE14gwrzfJupcbVvOKWYpDgF8ItpEwGmhOOHa3CKwnSM2/bEEd/N+6FR9KpHGFtHNpdMzW5gXlsW
 qnhO0Nhq34B+p3qK5knX4D1WbsjheV3BoDf/ZBDwfNjottOaIWR991ejLSA2yh7U42cxpK3jzRNDD
 /5EGe87J8eTmjG0tZAHhbog/jEzxTbPnVfuhkLqc+uSn/MS8Uq/gjdPnDJlE+vKX1PHTLuHys0xzd
 5DS/nAcIrBAAyFbkjihS4CV4;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uqe8V-000kpe-39; Mon, 25 Aug 2025 20:49:52 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v4 049/142] smb: client: move rdma_readwrite_threshold from
 smbd_connection to TCP_Server_Info
Date: Mon, 25 Aug 2025 22:40:10 +0200
Message-ID: <1e537c128aa175137fd2cb69bd11f4eef0745f6a.1756139607.git.metze@samba.org>
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

This belongs to the SMB layer not to the transport layer, it
just uses the negotiated transport parameters to adjust the
value if needed.

Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: Long Li <longli@microsoft.com>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
---
 fs/smb/client/cifs_debug.c |  2 +-
 fs/smb/client/cifsglob.h   |  7 +++++++
 fs/smb/client/smb2pdu.c    |  2 +-
 fs/smb/client/smbdirect.c  | 15 +++++++++++----
 fs/smb/client/smbdirect.h  |  7 -------
 5 files changed, 20 insertions(+), 13 deletions(-)

diff --git a/fs/smb/client/cifs_debug.c b/fs/smb/client/cifs_debug.c
index bb6bb1e3b723..eca7bd0df7d3 100644
--- a/fs/smb/client/cifs_debug.c
+++ b/fs/smb/client/cifs_debug.c
@@ -459,7 +459,7 @@ static int cifs_debug_data_proc_show(struct seq_file *m, void *v)
 			"max_readwrite_size: %x rdma_readwrite_threshold: %x",
 			sp->keepalive_interval_msec * 1000,
 			sp->max_read_write_size,
-			server->smbd_conn->rdma_readwrite_threshold);
+			server->rdma_readwrite_threshold);
 		seq_printf(m, "\nDebug count_get_receive_buffer: %llx "
 			"count_put_receive_buffer: %llx count_send_empty: %llx",
 			sc->statistics.get_receive_buffer,
diff --git a/fs/smb/client/cifsglob.h b/fs/smb/client/cifsglob.h
index 1e64a4fb6af0..f87a1ca33592 100644
--- a/fs/smb/client/cifsglob.h
+++ b/fs/smb/client/cifsglob.h
@@ -814,6 +814,13 @@ struct TCP_Server_Info {
 	unsigned int	max_read;
 	unsigned int	max_write;
 	unsigned int	min_offload;
+	/*
+	 * If payload is less than or equal to the threshold,
+	 * use RDMA send/recv to send upper layer I/O.
+	 * If payload is more than the threshold,
+	 * use RDMA read/write through memory registration for I/O.
+	 */
+	unsigned int	rdma_readwrite_threshold;
 	unsigned int	retrans;
 	struct {
 		bool requested; /* "compress" mount option set*/
diff --git a/fs/smb/client/smb2pdu.c b/fs/smb/client/smb2pdu.c
index 2df93a75e3b8..0dedea47bf96 100644
--- a/fs/smb/client/smb2pdu.c
+++ b/fs/smb/client/smb2pdu.c
@@ -4411,7 +4411,7 @@ static inline bool smb3_use_rdma_offload(struct cifs_io_parms *io_parms)
 		return false;
 
 	/* offload also has its overhead, so only do it if desired */
-	if (io_parms->length < server->smbd_conn->rdma_readwrite_threshold)
+	if (io_parms->length < server->rdma_readwrite_threshold)
 		return false;
 
 	return true;
diff --git a/fs/smb/client/smbdirect.c b/fs/smb/client/smbdirect.c
index 220ebd00a9d7..0eb46b01da32 100644
--- a/fs/smb/client/smbdirect.c
+++ b/fs/smb/client/smbdirect.c
@@ -489,10 +489,6 @@ static bool process_negotiation_response(
 	}
 	sp->max_fragmented_send_size =
 		le32_to_cpu(packet->max_fragmented_size);
-	info->rdma_readwrite_threshold =
-		rdma_readwrite_threshold > sp->max_fragmented_send_size ?
-		sp->max_fragmented_send_size :
-		rdma_readwrite_threshold;
 
 
 	sp->max_read_write_size = min_t(u32,
@@ -1898,6 +1894,7 @@ struct smbd_connection *smbd_get_connection(
 	struct TCP_Server_Info *server, struct sockaddr *dstaddr)
 {
 	struct smbd_connection *ret;
+	const struct smbdirect_socket_parameters *sp;
 	int port = SMBD_PORT;
 
 try_again:
@@ -1908,6 +1905,16 @@ struct smbd_connection *smbd_get_connection(
 		port = SMB_PORT;
 		goto try_again;
 	}
+	if (!ret)
+		return NULL;
+
+	sp = &ret->socket.parameters;
+
+	server->rdma_readwrite_threshold =
+		rdma_readwrite_threshold > sp->max_fragmented_send_size ?
+		sp->max_fragmented_send_size :
+		rdma_readwrite_threshold;
+
 	return ret;
 }
 
diff --git a/fs/smb/client/smbdirect.h b/fs/smb/client/smbdirect.h
index 8ebbbc0b0499..4eec2ac4ba80 100644
--- a/fs/smb/client/smbdirect.h
+++ b/fs/smb/client/smbdirect.h
@@ -43,13 +43,6 @@ struct smbd_connection {
 	/* Memory registrations */
 	/* Maximum number of pages in a single RDMA write/read on this connection */
 	int max_frmr_depth;
-	/*
-	 * If payload is less than or equal to the threshold,
-	 * use RDMA send/recv to send upper layer I/O.
-	 * If payload is more than the threshold,
-	 * use RDMA read/write through memory registration for I/O.
-	 */
-	int rdma_readwrite_threshold;
 	enum ib_mr_type mr_type;
 	struct list_head mr_list;
 	spinlock_t mr_list_lock;
-- 
2.43.0


