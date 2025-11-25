Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 34606C86899
	for <lists+samba-technical@lfdr.de>; Tue, 25 Nov 2025 19:17:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=vV3BTGOq8RafyQ/szXBK0ttBL9HdpSOnmTHiDABJQJY=; b=M+enVPynn2au2r1QbV5gwlIql2
	24caNl3djRCvzuGr3VFnA/ANiEby7YVoV9p7w70rdnhenLkSDStxTy1ADWOntspyCTb866vYKnnmX
	6y5jwgVSDZdqoVDZGjGmpyKUc2REk4bRWsqY9ick2RolLNVBnM+POFEXEqXMZgkcAtcsyNkSeVJQZ
	LfLlCfbCwKO5WKm8hzyq59BevTY6/K19RYyolKFrTvbLNgB0jNS3w5jRxsYnQb9J6MbOaHJZkQkws
	beUOowlWSQwrN8lYhDoDrHH07HUBrZS/S5icPcjikmIY6ivgpxGQX9TUnUCO1xDhh9fiIUq/sAQVW
	c9xRSuVQ==;
Received: from ip6-localhost ([::1]:38074 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vNxbD-00DDBI-55; Tue, 25 Nov 2025 18:17:12 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:61344) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vNxUW-00DAkl-DZ
 for samba-technical@lists.samba.org; Tue, 25 Nov 2025 18:10:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=vV3BTGOq8RafyQ/szXBK0ttBL9HdpSOnmTHiDABJQJY=; b=R5p6ag7qlfP9ohHlvwX7u+jFJA
 ZzkORxcsL6M+b/UhofLEEpXmFVEelzZp1JhOlBwKCFYwAvHAeZNOIE4kGE5LX6pMQJZpoDX2gecpc
 a6bTiIaUxk4kiEqgTDjttwTmBq2dM6wz458YyEJtLkYBITEwvXzrtEELtrGjWj7uTBWAvHfWa/COh
 uvhmCCnDGzzfa/Qynn/U8JsuAJ/IYadgaIuQg41zwJ4gzVP+M0YWaUi1xSFKbEjlLCZYE8RfpAs1D
 RuVdGSfTGGCz81s3s8FSP3u0a7NHrzpNf3cb0xbEdOC8MPEzwNHkOeQh9miXvu9+cjLuNce860XJA
 aaiHuoft5VI0bFjnxXqnmGUwNYOqg053DN/OKpey4NlRcSeVSP+bZd7nd5Qd9TI/G1Fpr0pZnUO37
 5DjEk+4LcdTMrD4KlvAgDUVfSZ028SEPNzWYrZJiH50gUQXuwJLfWqp3xel5ZYwZej8M+mkaRxcIL
 evQZaAunExkBxQCL3F4rUYVy;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vNxRY-00Fdv9-0I; Tue, 25 Nov 2025 18:07:12 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v4 083/145] smb: client: make use of
 smbdirect_connection_recvmsg()
Date: Tue, 25 Nov 2025 18:55:29 +0100
Message-ID: <9a9bc8c3236835ceaeb0027b61cd1aea087cbbb5.1764091285.git.metze@samba.org>
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

This is basically the same as it was copied before...

Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: Long Li <longli@microsoft.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
Signed-off-by: Steve French <stfrench@microsoft.com>
---
 fs/smb/client/smbdirect.c | 131 +-------------------------------------
 1 file changed, 1 insertion(+), 130 deletions(-)

diff --git a/fs/smb/client/smbdirect.c b/fs/smb/client/smbdirect.c
index a240f3545f9a..5f0d0271083b 100644
--- a/fs/smb/client/smbdirect.c
+++ b/fs/smb/client/smbdirect.c
@@ -1348,137 +1348,8 @@ struct smbd_connection *smbd_get_connection(
 int smbd_recv(struct smbd_connection *info, struct msghdr *msg)
 {
 	struct smbdirect_socket *sc = &info->socket;
-	struct smbdirect_recv_io *response;
-	struct smbdirect_data_transfer *data_transfer;
-	size_t size = iov_iter_count(&msg->msg_iter);
-	int to_copy, to_read, data_read, offset;
-	u32 data_length, remaining_data_length, data_offset;
-	int rc;
-
-	if (WARN_ON_ONCE(iov_iter_rw(&msg->msg_iter) == WRITE))
-		return -EINVAL; /* It's a bug in upper layer to get there */
-
-again:
-	/*
-	 * No need to hold the reassembly queue lock all the time as we are
-	 * the only one reading from the front of the queue. The transport
-	 * may add more entries to the back of the queue at the same time
-	 */
-	log_read(INFO, "size=%zd sc->recv_io.reassembly.data_length=%d\n", size,
-		sc->recv_io.reassembly.data_length);
-	if (sc->recv_io.reassembly.data_length >= size) {
-		int queue_length;
-		int queue_removed = 0;
-		unsigned long flags;
-
-		/*
-		 * Need to make sure reassembly_data_length is read before
-		 * reading reassembly_queue_length and calling
-		 * smbdirect_connection_reassembly_first_recv_io. This call is lock free
-		 * as we never read at the end of the queue which are being
-		 * updated in SOFTIRQ as more data is received
-		 */
-		virt_rmb();
-		queue_length = sc->recv_io.reassembly.queue_length;
-		data_read = 0;
-		to_read = size;
-		offset = sc->recv_io.reassembly.first_entry_offset;
-		while (data_read < size) {
-			response = smbdirect_connection_reassembly_first_recv_io(sc);
-			data_transfer = smbdirect_recv_io_payload(response);
-			data_length = le32_to_cpu(data_transfer->data_length);
-			remaining_data_length =
-				le32_to_cpu(
-					data_transfer->remaining_data_length);
-			data_offset = le32_to_cpu(data_transfer->data_offset);
-
-			/*
-			 * The upper layer expects RFC1002 length at the
-			 * beginning of the payload. Return it to indicate
-			 * the total length of the packet. This minimize the
-			 * change to upper layer packet processing logic. This
-			 * will be eventually remove when an intermediate
-			 * transport layer is added
-			 */
-			if (response->first_segment && size == 4) {
-				unsigned int rfc1002_len =
-					data_length + remaining_data_length;
-				__be32 rfc1002_hdr = cpu_to_be32(rfc1002_len);
-				if (copy_to_iter(&rfc1002_hdr, sizeof(rfc1002_hdr),
-						 &msg->msg_iter) != sizeof(rfc1002_hdr))
-					return -EFAULT;
-				data_read = 4;
-				response->first_segment = false;
-				log_read(INFO, "returning rfc1002 length %d\n",
-					rfc1002_len);
-				goto read_rfc1002_done;
-			}
-
-			to_copy = min_t(int, data_length - offset, to_read);
-			if (copy_to_iter((char *)data_transfer + data_offset + offset,
-					 to_copy, &msg->msg_iter) != to_copy)
-				return -EFAULT;
-
-			/* move on to the next buffer? */
-			if (to_copy == data_length - offset) {
-				queue_length--;
-				/*
-				 * No need to lock if we are not at the
-				 * end of the queue
-				 */
-				if (queue_length)
-					list_del(&response->list);
-				else {
-					spin_lock_irqsave(
-						&sc->recv_io.reassembly.lock, flags);
-					list_del(&response->list);
-					spin_unlock_irqrestore(
-						&sc->recv_io.reassembly.lock, flags);
-				}
-				queue_removed++;
-				sc->statistics.dequeue_reassembly_queue++;
-				smbdirect_connection_put_recv_io(response);
-				offset = 0;
-				log_read(INFO, "smbdirect_connection_put_recv_io offset=0\n");
-			} else
-				offset += to_copy;
-
-			to_read -= to_copy;
-			data_read += to_copy;
-
-			log_read(INFO, "_get_first_reassembly memcpy %d bytes data_transfer_length-offset=%d after that to_read=%d data_read=%d offset=%d\n",
-				 to_copy, data_length - offset,
-				 to_read, data_read, offset);
-		}
-
-		spin_lock_irqsave(&sc->recv_io.reassembly.lock, flags);
-		sc->recv_io.reassembly.data_length -= data_read;
-		sc->recv_io.reassembly.queue_length -= queue_removed;
-		spin_unlock_irqrestore(&sc->recv_io.reassembly.lock, flags);
-
-		sc->recv_io.reassembly.first_entry_offset = offset;
-		log_read(INFO, "returning to thread data_read=%d reassembly_data_length=%d first_entry_offset=%d\n",
-			 data_read, sc->recv_io.reassembly.data_length,
-			 sc->recv_io.reassembly.first_entry_offset);
-read_rfc1002_done:
-		return data_read;
-	}
-
-	log_read(INFO, "wait_event on more data\n");
-	rc = wait_event_interruptible(
-		sc->recv_io.reassembly.wait_queue,
-		sc->recv_io.reassembly.data_length >= size ||
-			sc->status != SMBDIRECT_SOCKET_CONNECTED);
-	/* Don't return any data if interrupted */
-	if (rc)
-		return rc;
-
-	if (sc->status != SMBDIRECT_SOCKET_CONNECTED) {
-		log_read(ERR, "disconnected\n");
-		return -ECONNABORTED;
-	}
 
-	goto again;
+	return smbdirect_connection_recvmsg(sc, msg, 0);
 }
 
 /*
-- 
2.43.0


