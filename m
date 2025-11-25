Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D5FC7C8683D
	for <lists+samba-technical@lfdr.de>; Tue, 25 Nov 2025 19:13:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=uNKr46pB+JZm+4OqIpFYuEdtmoIjS32aJvkVec6ZU+E=; b=ZV0Ij85JT0QsnyDL/ONjWK0MUi
	o6lujL8BTNbjq9RivL19gS7A7qlSkll5M4A6uRrtMbB/cQc5SVad1d/9gWDnqtQUjtwyMs/BRcnyp
	b6WH/Hw3T28MaE/s7rzdguoT3Vd53f+5MzSXjvFF4xuhr3Wcw9Z7ZHIQPyZL1sSoFxog+fy+fLsMA
	L/zlA2XMiDasBM8U4yNARC3KLrkVl0KreVI9b4d5xgo0TXfbTwuReCDsFq/fYB2ISk1MGY5MP9IAG
	TMzCgGD9cJzcwLKJ3sAlA3Y0737U+4xNvte+QNMlzuqtOCJiavLAbUNNVO/csqSFWlxMHtM6FCywg
	C5ukXn4A==;
Received: from ip6-localhost ([::1]:60390 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vNxXs-00DBtn-GD; Tue, 25 Nov 2025 18:13:45 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:60332) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vNxRd-00D9q1-UP
 for samba-technical@lists.samba.org; Tue, 25 Nov 2025 18:07:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=uNKr46pB+JZm+4OqIpFYuEdtmoIjS32aJvkVec6ZU+E=; b=t+Adcp9oNjM5c0qdfVn0uL2PQr
 /+5zhOfaG/e5NEQ0wzptRS2wurQb01dwmWCVVZ4IyjaVKMtYIRc7XIVW7OlG26S7Ay65i0Nbc98Oa
 qh3ISD4/AjgE3RIaGVTvl3PUTNnou25/NaAT+XOa9qExwE06Iv5erasSxiokyNGZOfuTHJ33k91p8
 3Vf3/ZiwcWNoycKi0uzCNik1rf1Ag7dEsp+AVBPmaqE6U/dNCAG34fXi5jA1VaT5c88KAchk/od8Y
 GmotEHQFFM0S03rI6hdd1azDWtnVQ/w6FQTw0KFC+MCF0irPatxiCb7Cbpy0y0NFvc/VDLPjnPgol
 QGiGU9br+B6g93i+BJedy16QdC0UIr/3001skXcxckLAg/WMhElS/7rBx5WdbBMay7S88urEMPeB8
 KrDj4MdzNNfwGUQiMjNrB37mYCKoJDI9/npfDJdjXN+/VZDUfV74qez9MPYtDvQ/k8StKVwd1tRCX
 UmMmt0ecbsJVlWYFihIvWAsf;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vNxOT-00FdeX-0F; Tue, 25 Nov 2025 18:04:01 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v4 068/145] smb: client: make use of
 smbdirect_connection_reassembly_{append, first}_recv_io()
Date: Tue, 25 Nov 2025 18:55:14 +0100
Message-ID: <4732f090a73e0ede18e2a56748604a426a19866f.1764091285.git.metze@samba.org>
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

These are exact copies of enqueue_reassembly() and _get_first_reassembly().

Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: Long Li <longli@microsoft.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
Signed-off-by: Steve French <stfrench@microsoft.com>
---
 fs/smb/client/smbdirect.c | 63 +++------------------------------------
 1 file changed, 4 insertions(+), 59 deletions(-)

diff --git a/fs/smb/client/smbdirect.c b/fs/smb/client/smbdirect.c
index 21d08171cc85..39d94bea2bbe 100644
--- a/fs/smb/client/smbdirect.c
+++ b/fs/smb/client/smbdirect.c
@@ -26,12 +26,6 @@ const struct smbdirect_socket_parameters *smbd_get_parameters(struct smbd_connec
 static int allocate_receive_buffers(struct smbdirect_socket *sc, int num_buf);
 static void destroy_receive_buffers(struct smbdirect_socket *sc);
 
-static void enqueue_reassembly(
-		struct smbdirect_socket *sc,
-		struct smbdirect_recv_io *response, int data_length);
-static struct smbdirect_recv_io *_get_first_reassembly(
-		struct smbdirect_socket *sc);
-
 static int smbd_post_recv(
 		struct smbdirect_socket *sc,
 		struct smbdirect_recv_io *response);
@@ -682,7 +676,7 @@ static void recv_done(struct ib_cq *cq, struct ib_wc *wc)
 			if (sc->recv_io.credits.target > old_recv_credit_target)
 				queue_work(sc->workqueue, &sc->recv_io.posted.refill_work);
 
-			enqueue_reassembly(sc, response, data_length);
+			smbdirect_connection_reassembly_append_recv_io(sc, response, data_length);
 			wake_up(&sc->recv_io.reassembly.wait_queue);
 		} else
 			smbdirect_connection_put_recv_io(response);
@@ -1296,55 +1290,6 @@ static int smbd_negotiate(struct smbdirect_socket *sc)
 	return rc;
 }
 
-/*
- * Implement Connection.FragmentReassemblyBuffer defined in [MS-SMBD] 3.1.1.1
- * This is a queue for reassembling upper layer payload and present to upper
- * layer. All the inncoming payload go to the reassembly queue, regardless of
- * if reassembly is required. The uuper layer code reads from the queue for all
- * incoming payloads.
- * Put a received packet to the reassembly queue
- * response: the packet received
- * data_length: the size of payload in this packet
- */
-static void enqueue_reassembly(
-	struct smbdirect_socket *sc,
-	struct smbdirect_recv_io *response,
-	int data_length)
-{
-	unsigned long flags;
-
-	spin_lock_irqsave(&sc->recv_io.reassembly.lock, flags);
-	list_add_tail(&response->list, &sc->recv_io.reassembly.list);
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
-	sc->statistics.enqueue_reassembly_queue++;
-}
-
-/*
- * Get the first entry at the front of reassembly queue
- * Caller is responsible for locking
- * return value: the first entry if any, NULL if queue is empty
- */
-static struct smbdirect_recv_io *_get_first_reassembly(struct smbdirect_socket *sc)
-{
-	struct smbdirect_recv_io *ret = NULL;
-
-	if (!list_empty(&sc->recv_io.reassembly.list)) {
-		ret = list_first_entry(
-			&sc->recv_io.reassembly.list,
-			struct smbdirect_recv_io, list);
-	}
-	return ret;
-}
-
 /* Preallocate all receive buffer on transport establishment */
 static int allocate_receive_buffers(struct smbdirect_socket *sc, int num_buf)
 {
@@ -1482,7 +1427,7 @@ void smbd_destroy(struct TCP_Server_Info *server)
 	log_rdma_event(INFO, "drain the reassembly queue\n");
 	do {
 		spin_lock_irqsave(&sc->recv_io.reassembly.lock, flags);
-		response = _get_first_reassembly(sc);
+		response = smbdirect_connection_reassembly_first_recv_io(sc);
 		if (response) {
 			list_del(&response->list);
 			spin_unlock_irqrestore(
@@ -1963,7 +1908,7 @@ int smbd_recv(struct smbd_connection *info, struct msghdr *msg)
 		/*
 		 * Need to make sure reassembly_data_length is read before
 		 * reading reassembly_queue_length and calling
-		 * _get_first_reassembly. This call is lock free
+		 * smbdirect_connection_reassembly_first_recv_io. This call is lock free
 		 * as we never read at the end of the queue which are being
 		 * updated in SOFTIRQ as more data is received
 		 */
@@ -1973,7 +1918,7 @@ int smbd_recv(struct smbd_connection *info, struct msghdr *msg)
 		to_read = size;
 		offset = sc->recv_io.reassembly.first_entry_offset;
 		while (data_read < size) {
-			response = _get_first_reassembly(sc);
+			response = smbdirect_connection_reassembly_first_recv_io(sc);
 			data_transfer = smbdirect_recv_io_payload(response);
 			data_length = le32_to_cpu(data_transfer->data_length);
 			remaining_data_length =
-- 
2.43.0


