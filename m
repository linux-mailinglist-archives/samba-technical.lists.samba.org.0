Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B367B34CC1
	for <lists+samba-technical@lfdr.de>; Mon, 25 Aug 2025 22:52:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=thLcxBK9S6VvvzO0EqmiVTt5P5yvBYBINv8wnIbjN/4=; b=SQm5MBKVGXhdW7wXhSHYTYI2XM
	pFDUXhkC6oS4o8uSu8ZAfg9dGH3jjSEVEWm0njm13x9+eihI/VMZjF7LnoXGAZvSS4bCsENl2iniq
	0uXsrO61uhe9WFiwcrFaFjqllEnAoujChEgg8qRqexsk87zyIeWpYa57OFqISXTA+jMwa/jtgapg7
	ZPr9VPjZnYNzTipdZz5lyVH6QQ8L2IdTZ76amJ1Aljx3AqkeeuanbF3++60LkTVn/yAkc6gDrY+Cs
	UOFr7MAGoWAvKagaY2Tc5kwWiurroCh7X5157CSbVzoz1PYW2BTTO0aOGu5qjOqrLL2JsjIdl0+kh
	zT5Gif+g==;
Received: from ip6-localhost ([::1]:57420 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uqeAY-000Oxr-Te; Mon, 25 Aug 2025 20:51:59 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:16660) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uqe8G-000O8v-O1
 for samba-technical@lists.samba.org; Mon, 25 Aug 2025 20:50:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=thLcxBK9S6VvvzO0EqmiVTt5P5yvBYBINv8wnIbjN/4=; b=ywnPNelfUnQrG4jj1wNhCAZOfe
 D7nvnMcDsS62mXbKbzaAV0UyFVPzaxR7epUsHiRiIsYcbDi/jEKA1f1kXVJMFKxp5dl5veztUOBag
 gNfUyKt+UCN1xvGz6rUcvURzTSvPD7pAJd1Rbibu8iACY+fOPCgcTpFwhVy2zfYIqaQHCejiMDXtO
 2U/BfTP3mXBags7r997AFJxUQJt6eOVHPRxgjS7i5M13MHCALostbxYoAwMb8MZ0hCkkMmRIdbSms
 V8J+I2wzms/6JBrwLvbhb3JuWsExrRQCZEbO5FxY0EOkIWhXNKZHgEYeqUkoBpkhgkbC2QGH3zStj
 fO6NjRHBFMiJR2VgeKmXfEje6q21karMFdCQCKWEjHQ5McgdLwRmpOtwitzW4w5SJvu0QIlU7N6wY
 JRmeyQ/u0CU2Mze6krEUVJadbjpDrrlGL/MDtgW+okbjXhg0eS2uPPsFOUFTYGsz06ofVDq0GPJyk
 pF1B4oufLDhFVl2VzvTm0c3A;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uqe8D-000km9-2A; Mon, 25 Aug 2025 20:49:33 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v4 047/142] smb: client: make use of
 smbdirect_socket.statistics
Date: Mon, 25 Aug 2025 22:40:08 +0200
Message-ID: <70c1f459fab31f9a31de1281de952ab8c4ec3bea.1756139607.git.metze@samba.org>
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

This will allow us to use common functions soon.

Note this generates the following warnings from
scripts/checkpatch.pl --quiet:

 WARNING: quoted string split across lines
 #40: FILE: fs/smb/client/cifs_debug.c:464:
 +               seq_printf(m, "\nDebug count_get_receive_buffer: %llx "
 +                       "count_put_receive_buffer: %llx count_send_empty: %llx",

 WARNING: quoted string split across lines
 #47: FILE: fs/smb/client/cifs_debug.c:469:
                 seq_printf(m, "\nRead Queue "
 +                       "count_enqueue_reassembly_queue: %llx "

 WARNING: quoted string split across lines
 #48: FILE: fs/smb/client/cifs_debug.c:470:
 +                       "count_enqueue_reassembly_queue: %llx "
 +                       "count_dequeue_reassembly_queue: %llx "

 total: 0 errors, 3 warnings, 83 lines checked
 scripts/checkpatch.pl: FAILED

But I left them in there, because it matches the code
arround it...

Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: Long Li <longli@microsoft.com>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
---
 fs/smb/client/cifs_debug.c | 18 +++++++++---------
 fs/smb/client/smbdirect.c  | 11 ++++++-----
 fs/smb/client/smbdirect.h  |  7 -------
 3 files changed, 15 insertions(+), 21 deletions(-)

diff --git a/fs/smb/client/cifs_debug.c b/fs/smb/client/cifs_debug.c
index 35c90d494cd9..bb6bb1e3b723 100644
--- a/fs/smb/client/cifs_debug.c
+++ b/fs/smb/client/cifs_debug.c
@@ -460,18 +460,18 @@ static int cifs_debug_data_proc_show(struct seq_file *m, void *v)
 			sp->keepalive_interval_msec * 1000,
 			sp->max_read_write_size,
 			server->smbd_conn->rdma_readwrite_threshold);
-		seq_printf(m, "\nDebug count_get_receive_buffer: %x "
-			"count_put_receive_buffer: %x count_send_empty: %x",
-			server->smbd_conn->count_get_receive_buffer,
-			server->smbd_conn->count_put_receive_buffer,
-			server->smbd_conn->count_send_empty);
+		seq_printf(m, "\nDebug count_get_receive_buffer: %llx "
+			"count_put_receive_buffer: %llx count_send_empty: %llx",
+			sc->statistics.get_receive_buffer,
+			sc->statistics.put_receive_buffer,
+			sc->statistics.send_empty);
 		seq_printf(m, "\nRead Queue "
-			"count_enqueue_reassembly_queue: %x "
-			"count_dequeue_reassembly_queue: %x "
+			"count_enqueue_reassembly_queue: %llx "
+			"count_dequeue_reassembly_queue: %llx "
 			"reassembly_data_length: %x "
 			"reassembly_queue_length: %x",
-			server->smbd_conn->count_enqueue_reassembly_queue,
-			server->smbd_conn->count_dequeue_reassembly_queue,
+			sc->statistics.enqueue_reassembly_queue,
+			sc->statistics.dequeue_reassembly_queue,
 			sc->recv_io.reassembly.data_length,
 			sc->recv_io.reassembly.queue_length);
 		seq_printf(m, "\nCurrent Credits send_credits: %x "
diff --git a/fs/smb/client/smbdirect.c b/fs/smb/client/smbdirect.c
index a597b0bbd521..2eaddf190354 100644
--- a/fs/smb/client/smbdirect.c
+++ b/fs/smb/client/smbdirect.c
@@ -1168,9 +1168,10 @@ static int smbd_post_send_iter(struct smbd_connection *info,
  */
 static int smbd_post_send_empty(struct smbd_connection *info)
 {
+	struct smbdirect_socket *sc = &info->socket;
 	int remaining_data_length = 0;
 
-	info->count_send_empty++;
+	sc->statistics.send_empty++;
 	return smbd_post_send_iter(info, NULL, &remaining_data_length);
 }
 
@@ -1307,7 +1308,7 @@ static void enqueue_reassembly(
 	virt_wmb();
 	sc->recv_io.reassembly.data_length += data_length;
 	spin_unlock(&sc->recv_io.reassembly.lock);
-	info->count_enqueue_reassembly_queue++;
+	sc->statistics.enqueue_reassembly_queue++;
 }
 
 /*
@@ -1346,7 +1347,7 @@ static struct smbdirect_recv_io *get_receive_buffer(struct smbd_connection *info
 			&sc->recv_io.free.list,
 			struct smbdirect_recv_io, list);
 		list_del(&ret->list);
-		info->count_get_receive_buffer++;
+		sc->statistics.get_receive_buffer++;
 	}
 	spin_unlock_irqrestore(&sc->recv_io.free.lock, flags);
 
@@ -1375,7 +1376,7 @@ static void put_receive_buffer(
 
 	spin_lock_irqsave(&sc->recv_io.free.lock, flags);
 	list_add_tail(&response->list, &sc->recv_io.free.list);
-	info->count_put_receive_buffer++;
+	sc->statistics.put_receive_buffer++;
 	spin_unlock_irqrestore(&sc->recv_io.free.lock, flags);
 
 	queue_work(info->workqueue, &sc->recv_io.posted.refill_work);
@@ -2034,7 +2035,7 @@ int smbd_recv(struct smbd_connection *info, struct msghdr *msg)
 						&sc->recv_io.reassembly.lock);
 				}
 				queue_removed++;
-				info->count_dequeue_reassembly_queue++;
+				sc->statistics.dequeue_reassembly_queue++;
 				put_receive_buffer(info, response);
 				offset = 0;
 				log_read(INFO, "put_receive_buffer offset=0\n");
diff --git a/fs/smb/client/smbdirect.h b/fs/smb/client/smbdirect.h
index bc72634f5433..39a56a54f8b6 100644
--- a/fs/smb/client/smbdirect.h
+++ b/fs/smb/client/smbdirect.h
@@ -65,13 +65,6 @@ struct smbd_connection {
 	wait_queue_head_t wait_post_send;
 
 	struct workqueue_struct *workqueue;
-
-	/* for debug purposes */
-	unsigned int count_get_receive_buffer;
-	unsigned int count_put_receive_buffer;
-	unsigned int count_enqueue_reassembly_queue;
-	unsigned int count_dequeue_reassembly_queue;
-	unsigned int count_send_empty;
 };
 
 /* Create a SMBDirect session */
-- 
2.43.0


