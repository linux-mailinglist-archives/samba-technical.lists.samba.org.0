Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C5A0C1AE0C
	for <lists+samba-technical@lfdr.de>; Wed, 29 Oct 2025 14:46:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=YYlUDgvjyu0ekyz1PZhc9Om1Pa6WzW1moshsaTOwYSY=; b=uhG1XBVyg20jfCGm2TZMagoYCq
	HKumRNNu+ayJw6HEg6eghAflQgAHuSYVZygVcEmo7O0tJDZujNmmYIZfbmIbWfDpgN3Q9ZHA66jMg
	22AuxU6yrdb8NGnUQt9Iqc8VZUC85kxPKrkuca5tgVUeKat7UtaLItByzkpjZFw5TBJ38iHIG0f7y
	uTv2E43JbCHUc5xnH1Xcc5iIUTp4F7WoLqy51fO+JGVC4c8nvrtGGBK3r/wBlL2PFpov5wIR2aPjd
	lli1IbC+3U6As+E+Itea+sTLOOkcIwr70xToPGBhz7Rco31s+ixasygfm4QJjWCD7kS9Jtdw+WmDi
	oSOZoAfA==;
Received: from ip6-localhost ([::1]:62848 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vE6VJ-009D3x-HM; Wed, 29 Oct 2025 13:46:22 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:46964) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vE6Hn-0098Ed-KS
 for samba-technical@lists.samba.org; Wed, 29 Oct 2025 13:32:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=YYlUDgvjyu0ekyz1PZhc9Om1Pa6WzW1moshsaTOwYSY=; b=UddFQYjE25tgCpV00G7gTnc1YJ
 cgCreLwWHaPnjaiEjNe56zuf7fnfi0gB8ZZ5ptabLI0rd3xBJgrWJ98xlRL5crgXJZTjcOkm/ZNpV
 QxdArUptpWB2BzxNtbARkjoPobHpAxis1KbWSBsDg2/MqYXRouViCLMsJP3xEcQBBBm3Mi3JMtSbw
 fUApc4rBnagOcvODWgXIQqhtI8iyHV1p8LXRtCPtvuhcoWw22bExiCnK+RcbL7Bn1kD0/OcmcF20V
 Ldn4CrKZlWGaqC3gOKO51t4ajWNQYmUcDj0Ltm7AS4RHhH+WN0huB08ZcErpcIVYbtt3x78Cyac4F
 oGB5z8ZGEIUEWOelw30xeawTJRfe54zZLa1dfWZGWcRqVa4JkDECoojy3eG8aCV/9MFnaYLy5RPir
 8sEZohrwOi5jAkAD8xKblamBrhbCUmejrEIsm+sFJ1NKxxR+wvorqy3FwU/JwxPUIXClOONvFZeMf
 bNYhAGJwnsMyEDRr9uW78nJs;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vE6Hl-00Bcis-0V; Wed, 29 Oct 2025 13:32:21 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v2 098/127] smb: server: make use of
 smbdirect_connection_reassembly_{append, first}_recv_io()
Date: Wed, 29 Oct 2025 14:21:16 +0100
Message-ID: <aeb14bd1236d88d23326d299f7183bde27a63993.1761742839.git.metze@samba.org>
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
 Tom Talpey <tom@talpey.com>, Namjae Jeon <linkinjeon@kernel.org>,
 Steve French <stfrench@microsoft.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

These are basically copies of enqueue_reassembly() and
get_first_reassembly().  The only difference is that
sc->statistics.enqueue_reassembly_queue now updated.

Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
Signed-off-by: Steve French <stfrench@microsoft.com>
---
 fs/smb/server/transport_rdma.c | 41 +++++-----------------------------
 1 file changed, 6 insertions(+), 35 deletions(-)

diff --git a/fs/smb/server/transport_rdma.c b/fs/smb/server/transport_rdma.c
index cc64be846daf..fdf8ac7d5d34 100644
--- a/fs/smb/server/transport_rdma.c
+++ b/fs/smb/server/transport_rdma.c
@@ -215,35 +215,6 @@ static inline void
 	return (void *)recvmsg->packet;
 }
 
-static void enqueue_reassembly(struct smbdirect_socket *sc,
-			       struct smbdirect_recv_io *recvmsg,
-			       int data_length)
-{
-	unsigned long flags;
-
-	spin_lock_irqsave(&sc->recv_io.reassembly.lock, flags);
-	list_add_tail(&recvmsg->list, &sc->recv_io.reassembly.list);
-	sc->recv_io.reassembly.queue_length++;
-	/*
-	 * Make sure reassembly_data_length is updated after list and
-	 * reassembly_queue_length are updated. On the dequeue side
-	 * reassembly_data_length is checked without a lock to determine
-	 * if reassembly_queue_length and list is up to date
-	 */
-	virt_wmb();
-	sc->recv_io.reassembly.data_length += data_length;
-	spin_unlock_irqrestore(&sc->recv_io.reassembly.lock, flags);
-}
-
-static struct smbdirect_recv_io *get_first_reassembly(struct smbdirect_socket *sc)
-{
-	if (!list_empty(&sc->recv_io.reassembly.list))
-		return list_first_entry(&sc->recv_io.reassembly.list,
-				struct smbdirect_recv_io, list);
-	else
-		return NULL;
-}
-
 static void smb_direct_send_immediate_work(struct work_struct *work)
 {
 	struct smbdirect_socket *sc =
@@ -383,7 +354,7 @@ static void free_transport(struct smb_direct_transport *t)
 		unsigned long flags;
 
 		spin_lock_irqsave(&sc->recv_io.reassembly.lock, flags);
-		recvmsg = get_first_reassembly(sc);
+		recvmsg = smbdirect_connection_reassembly_first_recv_io(sc);
 		if (recvmsg) {
 			list_del(&recvmsg->list);
 			spin_unlock_irqrestore(&sc->recv_io.reassembly.lock, flags);
@@ -541,7 +512,7 @@ static void recv_done(struct ib_cq *cq, struct ib_wc *wc)
 		sc->recv_io.reassembly.full_packet_received = true;
 		WARN_ON_ONCE(sc->status != SMBDIRECT_SOCKET_NEGOTIATE_NEEDED);
 		sc->status = SMBDIRECT_SOCKET_NEGOTIATE_RUNNING;
-		enqueue_reassembly(sc, recvmsg, 0);
+		smbdirect_connection_reassembly_append_recv_io(sc, recvmsg, 0);
 		wake_up(&sc->status_wait);
 		return;
 	case SMBDIRECT_EXPECT_DATA_TRANSFER: {
@@ -609,7 +580,7 @@ static void recv_done(struct ib_cq *cq, struct ib_wc *wc)
 			if (sc->recv_io.credits.target > old_recv_credit_target)
 				queue_work(sc->workqueue, &sc->recv_io.posted.refill_work);
 
-			enqueue_reassembly(sc, recvmsg, (int)data_length);
+			smbdirect_connection_reassembly_append_recv_io(sc, recvmsg, data_length);
 			wake_up(&sc->recv_io.reassembly.wait_queue);
 		} else
 			smbdirect_connection_put_recv_io(recvmsg);
@@ -695,7 +666,7 @@ static int smb_direct_read(struct ksmbd_transport *t, char *buf,
 		/*
 		 * Need to make sure reassembly_data_length is read before
 		 * reading reassembly_queue_length and calling
-		 * get_first_reassembly. This call is lock free
+		 * smbdirect_connection_reassembly_first_recv_io. This call is lock free
 		 * as we never read at the end of the queue which are being
 		 * updated in SOFTIRQ as more data is received
 		 */
@@ -705,7 +676,7 @@ static int smb_direct_read(struct ksmbd_transport *t, char *buf,
 		to_read = size;
 		offset = sc->recv_io.reassembly.first_entry_offset;
 		while (data_read < size) {
-			recvmsg = get_first_reassembly(sc);
+			recvmsg = smbdirect_connection_reassembly_first_recv_io(sc);
 			data_transfer = smbdirect_recv_io_payload(recvmsg);
 			data_length = le32_to_cpu(data_transfer->data_length);
 			remaining_data_length =
@@ -2148,7 +2119,7 @@ static int smb_direct_prepare(struct ksmbd_transport *t)
 	if (ret <= 0 || sc->status != SMBDIRECT_SOCKET_NEGOTIATE_RUNNING)
 		return ret < 0 ? ret : -ETIMEDOUT;
 
-	recvmsg = get_first_reassembly(sc);
+	recvmsg = smbdirect_connection_reassembly_first_recv_io(sc);
 	if (!recvmsg)
 		return -ECONNABORTED;
 
-- 
2.43.0


