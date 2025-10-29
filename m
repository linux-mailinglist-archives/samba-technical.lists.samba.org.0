Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 82E45C1AEC3
	for <lists+samba-technical@lfdr.de>; Wed, 29 Oct 2025 14:50:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=HJJJSUbJzjxdK6xHwhX7Qh0UWQgia5pxBe/CJs9S9rQ=; b=Zdv6PTVozNs4nn9BGrlJUP4nfJ
	9UQ/nCinRgCGQdrbs1M1RVr9GghoTetPxQrUPXkMosZoWRUyqRWCFsNywvLfT0EMSCe5L2Pldu8Bj
	8SWhPHjmUZbvIn2vbDVyEwBReBP3E81AVFuWTc/YaNEUF9fq3f2PqcmFCmQR1dMgk2CfKJH60ruec
	tq3sZthhg5uhR+EHakGCQXm6Is2BIxoceGNm6rjYerijYcE2645z3b/O+XgbbtnhLGdBIPDNqU8i3
	x/5k2SjTVMV9a5ldDuQT9IBeuxBoFb5z8KisGLebwPFWzaAq8OmFFVTgXNwGOfGSSLbEJj75uHXNd
	e/jEzXeg==;
Received: from ip6-localhost ([::1]:63208 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vE6Yo-009EOJ-T5; Wed, 29 Oct 2025 13:49:59 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:31644) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vE6JR-0098nS-46
 for samba-technical@lists.samba.org; Wed, 29 Oct 2025 13:34:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=HJJJSUbJzjxdK6xHwhX7Qh0UWQgia5pxBe/CJs9S9rQ=; b=deVPFJ0aw6xUDNOWvFPxou77L1
 1qTO9699LJICJb6xdZzI0ozqVHB0qG3PRehm9ckfQnR0iMiaZDI80zTbebvk5OXrvbhPxQxaqnTbK
 1lTtA2pJddn4Su6yfP5NJ6ZErQY20Dz0L7RyeSUqREM0cMufMKxiIkvpYWw2YJq3d/AaDoo0NQk9f
 mmtqz6xbxlUqrmUqYpMHsp9COkNhSbmhoBX2eknCj/IFiy40bFoiYCGpD30w4W5RZ730xFYjygnoC
 ggcgXoA9Ww0Bq352wh8TBlxLXZ3UbENtnBNZSz3+K4W5lCtEfQVTqaW/IaYYqwyoQq2XOCxJN2lsa
 kvZVdi13Gt9cXiOPyAH6vLSNWvyYBNVMHMhwKIrMGqsUaiI3EEvAlEHX9HJ/8hfkpHoz0J1iOWvmp
 IVvQOcM20JsmdUqLAJKE6f9oHSwPL8V7EfapuVvQwQvA/qj1iScYzfLQN6IYY2U4BYc1M1cGWWDMV
 XEVPSHoZcfsOxcPany/NQ7zi;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vE6JO-00Bd0f-13; Wed, 29 Oct 2025 13:34:02 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v2 115/127] smb: server: make use of
 smbdirect_connection_recvmsg()
Date: Wed, 29 Oct 2025 14:21:33 +0100
Message-ID: <70f80f5c37065fc5a144ef737f81dcfde08a09f0.1761742839.git.metze@samba.org>
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

This is basically the same logic, it just operates on iov_iter_kvec()
instead of a raw buffer pointer. This allows us to use common
code between client and server.

We keep returning -EINTR instead of -ERESTARTSYS if
wait_event_interruptible() fails. I don't if this is
required, but changing it is a task for another patch.

Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
---
 fs/smb/server/transport_rdma.c | 128 +++------------------------------
 1 file changed, 11 insertions(+), 117 deletions(-)

diff --git a/fs/smb/server/transport_rdma.c b/fs/smb/server/transport_rdma.c
index 98ecc9f7f482..d64896a2a1d1 100644
--- a/fs/smb/server/transport_rdma.c
+++ b/fs/smb/server/transport_rdma.c
@@ -201,12 +201,6 @@ static int smb_direct_post_send_data(struct smbdirect_socket *sc,
 				     struct kvec *iov, int niov,
 				     int remaining_data_length);
 
-static inline void
-*smbdirect_recv_io_payload(struct smbdirect_recv_io *recvmsg)
-{
-	return (void *)recvmsg->packet;
-}
-
 static void smb_direct_send_immediate_work(struct work_struct *work)
 {
 	struct smbdirect_socket *sc =
@@ -481,121 +475,21 @@ static void recv_done(struct ib_cq *cq, struct ib_wc *wc)
 static int smb_direct_read(struct ksmbd_transport *t, char *buf,
 			   unsigned int size, int unused)
 {
-	struct smbdirect_recv_io *recvmsg;
-	struct smbdirect_data_transfer *data_transfer;
-	int to_copy, to_read, data_read, offset;
-	u32 data_length, remaining_data_length, data_offset;
-	int rc;
 	struct smb_direct_transport *st = SMBD_TRANS(t);
 	struct smbdirect_socket *sc = &st->socket;
+	struct msghdr msg = { .msg_flags = 0, };
+	struct kvec iov = {
+		.iov_base = buf,
+		.iov_len = size,
+	};
+	int ret;
 
-again:
-	if (sc->status != SMBDIRECT_SOCKET_CONNECTED) {
-		pr_err("disconnected\n");
-		return -ENOTCONN;
-	}
-
-	/*
-	 * No need to hold the reassembly queue lock all the time as we are
-	 * the only one reading from the front of the queue. The transport
-	 * may add more entries to the back of the queue at the same time
-	 */
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
-			recvmsg = smbdirect_connection_reassembly_first_recv_io(sc);
-			data_transfer = smbdirect_recv_io_payload(recvmsg);
-			data_length = le32_to_cpu(data_transfer->data_length);
-			remaining_data_length =
-				le32_to_cpu(data_transfer->remaining_data_length);
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
-			if (recvmsg->first_segment && size == 4) {
-				unsigned int rfc1002_len =
-					data_length + remaining_data_length;
-				*((__be32 *)buf) = cpu_to_be32(rfc1002_len);
-				data_read = 4;
-				recvmsg->first_segment = false;
-				ksmbd_debug(RDMA,
-					    "returning rfc1002 length %d\n",
-					    rfc1002_len);
-				goto read_rfc1002_done;
-			}
-
-			to_copy = min_t(int, data_length - offset, to_read);
-			memcpy(buf + data_read, (char *)data_transfer + data_offset + offset,
-			       to_copy);
-
-			/* move on to the next buffer? */
-			if (to_copy == data_length - offset) {
-				queue_length--;
-				/*
-				 * No need to lock if we are not at the
-				 * end of the queue
-				 */
-				if (queue_length) {
-					list_del(&recvmsg->list);
-				} else {
-					spin_lock_irqsave(&sc->recv_io.reassembly.lock, flags);
-					list_del(&recvmsg->list);
-					spin_unlock_irqrestore(&sc->recv_io.reassembly.lock, flags);
-				}
-				queue_removed++;
-				smbdirect_connection_put_recv_io(recvmsg);
-				offset = 0;
-			} else {
-				offset += to_copy;
-			}
-
-			to_read -= to_copy;
-			data_read += to_copy;
-		}
-
-		spin_lock_irqsave(&sc->recv_io.reassembly.lock, flags);
-		sc->recv_io.reassembly.data_length -= data_read;
-		sc->recv_io.reassembly.queue_length -= queue_removed;
-		spin_unlock_irqrestore(&sc->recv_io.reassembly.lock, flags);
-
-		sc->recv_io.reassembly.first_entry_offset = offset;
-		ksmbd_debug(RDMA,
-			    "returning to thread data_read=%d reassembly_data_length=%d first_entry_offset=%d\n",
-			    data_read, sc->recv_io.reassembly.data_length,
-			    sc->recv_io.reassembly.first_entry_offset);
-read_rfc1002_done:
-		return data_read;
-	}
-
-	ksmbd_debug(RDMA, "wait_event on more data\n");
-	rc = wait_event_interruptible(sc->recv_io.reassembly.wait_queue,
-				      sc->recv_io.reassembly.data_length >= size ||
-				       sc->status != SMBDIRECT_SOCKET_CONNECTED);
-	if (rc)
-		return -EINTR;
+	iov_iter_kvec(&msg.msg_iter, ITER_DEST, &iov, 1, size);
 
-	goto again;
+	ret = smbdirect_connection_recvmsg(sc, &msg, 0);
+	if (ret == -ERESTARTSYS)
+		ret = -EINTR;
+	return ret;
 }
 
 static int manage_credits_prior_sending(struct smbdirect_socket *sc)
-- 
2.43.0


