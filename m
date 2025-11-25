Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id C1E4AC86756
	for <lists+samba-technical@lfdr.de>; Tue, 25 Nov 2025 19:08:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=2om9wjKVdZ81jGCMJQ2rHgmpe6rkzOwkCBDni17o95M=; b=h7JAA9I7eYpBuG+XRsJfM5s9LL
	3Fs1p3fKGoy5rO3DEI1W8cXD8Szrr80QvzMN2W0zz13OjeD6xwUam9v57bitgZYyQE2OBKDGp7HTG
	R0ejnQebEUflFQOKW658uWO24x6NzVoCJdJIZfZYlDMaG8cEupVYoe4ScHYUbirEUN0pG0PKfCKrx
	HTOIhQyyKVVLWSpnWALVUNrLioPHpPmGemdqbLS1RQeARaKDN9KjOEIKy+8mZVdmcfc7omrOCnqkc
	OTKadIancO8JSjllDfjv008TfQdYuFGuREpYoMY84whUn+tNVJXerABGkQpmrwdl2YJTbhBXApZ/e
	OizopT7Q==;
Received: from ip6-localhost ([::1]:52056 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vNxSj-00DA7f-2K; Tue, 25 Nov 2025 18:08:26 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:21156) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vNxM6-00D7zt-Gh
 for samba-technical@lists.samba.org; Tue, 25 Nov 2025 18:01:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=2om9wjKVdZ81jGCMJQ2rHgmpe6rkzOwkCBDni17o95M=; b=Pa+0+7hbLtg05XoLRAX2lnB0ej
 w6JY7TgqlM7kdMh4DDJ3MX4U2/W2pV4n9UdO48XmT9oVGkZh0jlZCDWy4/zN3/b3PIM2F5CE1mOID
 P8KI20vXwPeJEtF4BzicQ4axr4pu7ieO1Jm0YJ4Co8K3x5+wQKrg0DdKzZocpPGPzulBs+fUTKv8T
 azvAIL1aD+b02wFj3wb0lKEYon7EzxpmeTG8RtHvVg23OP1N5mgp1tCD1JC5bVNvpq4HYNm5qH9nS
 LQqYtnCNAALRnvAJGv8ph5+XYi1QCDlAzgjP3POdWzDkeOcMdTwRUgqtrde/MtJLqYsb4RSfyhuBP
 aOKP/f92DPhqGcq5CDgDqXzGTP/eIETwTnPm6cbpXMtTa1nlpYNAi/clSvZ8bq3gj6BccWoibJQE8
 6tekbNEXmfRtQk1CXvQPKLX+6K84iv8XEjw18OXbcDMNQiAlwbkg4UxTG6+kNELKlJ0C72vTiweol
 1Eje3CWJgadkffOut4aEAadY;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vNxLz-00FdDb-3C; Tue, 25 Nov 2025 18:01:28 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v4 046/145] smb: smbdirect: introduce
 smbdirect_connection_negotiation_done()
Date: Tue, 25 Nov 2025 18:54:52 +0100
Message-ID: <687931d9c4d99549ac0e26c5e8b48fefbec4dbcb.1764091285.git.metze@samba.org>
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

This will be used by client and server in order to turn the
connection into a usable state.

Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: Long Li <longli@microsoft.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
Signed-off-by: Steve French <stfrench@microsoft.com>
---
 .../common/smbdirect/smbdirect_connection.c   | 48 ++++++++++++++++++-
 1 file changed, 46 insertions(+), 2 deletions(-)

diff --git a/fs/smb/common/smbdirect/smbdirect_connection.c b/fs/smb/common/smbdirect/smbdirect_connection.c
index 8ee3a1e28f82..3576737ec199 100644
--- a/fs/smb/common/smbdirect/smbdirect_connection.c
+++ b/fs/smb/common/smbdirect/smbdirect_connection.c
@@ -19,6 +19,9 @@ struct smbdirect_map_sges {
 static ssize_t smbdirect_map_sges_from_iter(struct iov_iter *iter, size_t len,
 					    struct smbdirect_map_sges *state);
 
+static void smbdirect_connection_recv_io_refill_work(struct work_struct *work);
+static void smbdirect_connection_send_immediate_work(struct work_struct *work);
+
 __maybe_unused /* this is temporary while this file is included in others */
 static void smbdirect_connection_qp_event_handler(struct ib_event *event, void *context)
 {
@@ -154,6 +157,49 @@ static void smbdirect_connection_rdma_established(struct smbdirect_socket *sc)
 	sc->rdma.expected_event = RDMA_CM_EVENT_DISCONNECTED;
 }
 
+__maybe_unused /* this is temporary while this file is included in others */
+static void smbdirect_connection_negotiation_done(struct smbdirect_socket *sc)
+{
+	if (unlikely(sc->first_error))
+		return;
+
+	if (sc->status != SMBDIRECT_SOCKET_NEGOTIATE_RUNNING) {
+		/*
+		 * Something went wrong...
+		 */
+		smbdirect_log_rdma_event(sc, SMBDIRECT_LOG_ERR,
+			"status=%s first_error=%1pe local: %pISpsfc remote: %pISpsfc\n",
+			smbdirect_socket_status_string(sc->status),
+			SMBDIRECT_DEBUG_ERR_PTR(sc->first_error),
+			&sc->rdma.cm_id->route.addr.src_addr,
+			&sc->rdma.cm_id->route.addr.dst_addr);
+		return;
+	}
+
+	/*
+	 * We are done, so we can wake up the waiter.
+	 */
+	WARN_ONCE(sc->status == SMBDIRECT_SOCKET_CONNECTED,
+		  "status=%s first_error=%1pe",
+		  smbdirect_socket_status_string(sc->status),
+		  SMBDIRECT_DEBUG_ERR_PTR(sc->first_error));
+	sc->status = SMBDIRECT_SOCKET_CONNECTED;
+
+	/*
+	 * We need to setup the refill and send immediate work
+	 * in order to get a working connection.
+	 */
+	INIT_WORK(&sc->recv_io.posted.refill_work, smbdirect_connection_recv_io_refill_work);
+	INIT_WORK(&sc->idle.immediate_work, smbdirect_connection_send_immediate_work);
+
+	smbdirect_log_rdma_event(sc, SMBDIRECT_LOG_INFO,
+		"negotiated: local: %pISpsfc remote: %pISpsfc\n",
+		&sc->rdma.cm_id->route.addr.src_addr,
+		&sc->rdma.cm_id->route.addr.dst_addr);
+
+	wake_up(&sc->status_wait);
+}
+
 static u32 smbdirect_rdma_rw_send_wrs(struct ib_device *dev,
 				      const struct ib_qp_init_attr *attr)
 {
@@ -1193,7 +1239,6 @@ static void smbdirect_connection_send_io_done(struct ib_cq *cq, struct ib_wc *wc
 	wake_up(&sc->send_io.pending.dec_wait_queue);
 }
 
-__maybe_unused /* this is temporary while this file is included in others */
 static void smbdirect_connection_send_immediate_work(struct work_struct *work)
 {
 	struct smbdirect_socket *sc =
@@ -1511,7 +1556,6 @@ static int smbdirect_connection_recv_io_refill(struct smbdirect_socket *sc)
 	return posted;
 }
 
-__maybe_unused /* this is temporary while this file is included in others */
 static void smbdirect_connection_recv_io_refill_work(struct work_struct *work)
 {
 	struct smbdirect_socket *sc =
-- 
2.43.0


