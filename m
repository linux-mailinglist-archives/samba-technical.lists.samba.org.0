Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C420C866A5
	for <lists+samba-technical@lfdr.de>; Tue, 25 Nov 2025 19:03:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=zIEeuAQWXhWx5bGrN/f/RwSnLgS5KBzfwS1sKBp+gjU=; b=maOU5QRdWXYSoNA6Pnk+KlRFv0
	AtzVQlhzr9jppAqkpZX5b1ScRTmqYD8Y1WrVw7ovtbwlZrrv1I0ux993HYq+NWBa5zF4+JXhG+kSC
	Ng4Fh9K79JF8KGgRrx9eZM50JpPnAPudDcfLat3p5MX7OjIjc93pVUSDaEZq0n+zaDCgkQeMY3IXI
	0Q18nGoJEpttxkJIfgLliKfFpnGOSYj4+gUip0+MyjzMZMig36lZ1qOxGViJRhUBOiQexzmNtv0vZ
	A+LM6jqbYji8vBUoSRy9xyUrKQUA6IIrbAW4DiYFelOJCEu+pxv8wl1emq0rPZj0Hwl98NoD6jbWZ
	131gc7Pw==;
Received: from ip6-localhost ([::1]:56192 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vNxNJ-00D8JE-2E; Tue, 25 Nov 2025 18:02:50 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:16010) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vNxJc-00D7Ce-7U
 for samba-technical@lists.samba.org; Tue, 25 Nov 2025 17:59:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=zIEeuAQWXhWx5bGrN/f/RwSnLgS5KBzfwS1sKBp+gjU=; b=rT9c1Y+shh8XYkMfQjuGROfawD
 g7v/ZTRUOGuVUeGEIlpnkgW5RzIJHQ8zVoVD1/2imrS31E3x2CayS5MM+9mZt3AAPNrBZ4yzMChoN
 wZTdD/sfb1VrC7JE6zM/cLxSTOvVEN+9b8aWh2qfOrFkj/t408tII4Db6R8gtG2sbiZApSCcAXIks
 XHvlO/IX8iTP4uZWT7viINRtQ8P8E4XulVytHwf8CSPVqeWxuNr+PQOt53uSxCHqDGvmGEt2uqVYD
 3bs+L1/7XYnVOPFr6kzA+PrPcmnSzVFsjQGQ1ZV5HmE2VdiQvHp464m2itB0iu7QTEuBcfomwC788
 ryyHkoYBujP+A6+p7FyEW5UAnWaCn40VMqsiNfjIFYSZfqK/x29SLfJJ/4KoYUDYwnKk+tU3KshfD
 TXKym7PUixv0fQJfJ9brlFQF1d9ITrIqrjQuiKs9vdKeuJCjsvLVRsXk2sMAa6yjqjK+b4POtoOvH
 2czzP6qbR6tLk8iYhJdOgIyr;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vNxJZ-00FcqA-0t; Tue, 25 Nov 2025 17:58:57 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v4 023/145] smb: smbdirect: introduce
 smbdirect_connection_send_io_done()
Date: Tue, 25 Nov 2025 18:54:29 +0100
Message-ID: <ccf547f423c935b3deab1bab49b09351f811841a.1764091285.git.metze@samba.org>
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

This is a combination of send_done() of client and server.
It will replace both...

Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: Long Li <longli@microsoft.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
Signed-off-by: Steve French <stfrench@microsoft.com>
---
 .../common/smbdirect/smbdirect_connection.c   | 43 +++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/fs/smb/common/smbdirect/smbdirect_connection.c b/fs/smb/common/smbdirect/smbdirect_connection.c
index 7a2aaa1747dd..9608d153ed1a 100644
--- a/fs/smb/common/smbdirect/smbdirect_connection.c
+++ b/fs/smb/common/smbdirect/smbdirect_connection.c
@@ -170,3 +170,46 @@ static void smbdirect_connection_idle_timer_work(struct work_struct *work)
 		"schedule send of empty idle message\n");
 	queue_work(sc->workqueue, &sc->idle.immediate_work);
 }
+
+__maybe_unused /* this is temporary while this file is included in others */
+static void smbdirect_connection_send_io_done(struct ib_cq *cq, struct ib_wc *wc)
+{
+	struct smbdirect_send_io *msg =
+		container_of(wc->wr_cqe, struct smbdirect_send_io, cqe);
+	struct smbdirect_socket *sc = msg->socket;
+	struct smbdirect_send_io *sibling, *next;
+	int lcredits = 0;
+
+	smbdirect_log_rdma_send(sc, SMBDIRECT_LOG_INFO,
+		"smbdirect_send_io completed. status='%s (%d)', opcode=%d\n",
+		ib_wc_status_msg(wc->status), wc->status, wc->opcode);
+
+	/*
+	 * Free possible siblings and then the main send_io
+	 */
+	list_for_each_entry_safe(sibling, next, &msg->sibling_list, sibling_list) {
+		list_del_init(&sibling->sibling_list);
+		smbdirect_connection_free_send_io(sibling);
+		lcredits += 1;
+	}
+	/* Note this frees wc->wr_cqe, but not wc */
+	smbdirect_connection_free_send_io(msg);
+	lcredits += 1;
+
+	if (unlikely(wc->status != IB_WC_SUCCESS || WARN_ON_ONCE(wc->opcode != IB_WC_SEND))) {
+		if (wc->status != IB_WC_WR_FLUSH_ERR)
+			smbdirect_log_rdma_send(sc, SMBDIRECT_LOG_ERR,
+				"wc->status=%s (%d) wc->opcode=%d\n",
+				ib_wc_status_msg(wc->status), wc->status, wc->opcode);
+		smbdirect_socket_schedule_cleanup(sc, -ECONNABORTED);
+		return;
+	}
+
+	atomic_add(lcredits, &sc->send_io.lcredits.count);
+	wake_up(&sc->send_io.lcredits.wait_queue);
+
+	if (atomic_dec_and_test(&sc->send_io.pending.count))
+		wake_up(&sc->send_io.pending.zero_wait_queue);
+
+	wake_up(&sc->send_io.pending.dec_wait_queue);
+}
-- 
2.43.0


