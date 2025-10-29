Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 872EAC1AAB7
	for <lists+samba-technical@lfdr.de>; Wed, 29 Oct 2025 14:28:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=W25Lc2rBDqaolDVFFyXbWKKD1MzRZBLvvcJSdADQXBk=; b=u7QN8mG5OxCErRCDdDWwsxL7x0
	zsABL3lQmrwQKdCZmSddTdzU1hxnGreheiBkwdfQJCZb51POkwlPfww1M27cLmNwMS+fv7J+pyzEo
	Snu1HM6OC3LlKIacULYRWxWA8LmniMd49CHNxeBoVn2C/31g4QUA9h5zrPmQk6PqdOOtxN0+rGaw5
	wPQo/YRnrTkv+8eR0hZqMyVjIbrX69ncVeR7M24GxbH1cBN/Iyn8NXqDMeT7kirjXkgShuzaIYmHu
	RdmOPwHqZR5goGIgFCM6M352OBnSgpquoUXKstB7ykwu2zXRiE/UWaexbE1jHvJRNmJg0s2y0qA8T
	gy7FgHlg==;
Received: from ip6-localhost ([::1]:63766 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vE6DS-0096jD-UE; Wed, 29 Oct 2025 13:27:55 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:28778) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vE6AB-0095lQ-UK
 for samba-technical@lists.samba.org; Wed, 29 Oct 2025 13:24:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=W25Lc2rBDqaolDVFFyXbWKKD1MzRZBLvvcJSdADQXBk=; b=F9CDmvM1wqunuPRljm0wy5OvkO
 DSFVIeWe2GysAe32Vq/m76x+ihRwHhBYjTwrSiU8JzV5bOYoOs4rCiCjDDksr4fo0Z1YGQBGwd80C
 fPBEUGZtPHHrAZ6OnnFIgTTSZOdAyrsAKJi4we9eslmJ45POYM9Lxi6byXivb3GZfYabwavTJo5id
 hWkQJaRyWHShRC/m8GBnpUyzhgG8I8SlRH95z/fnIz00Y/WobTwgqIGWY/ThQ0raqLPgD0gU3k5j6
 lRpqvos00b+MtF5N5s+U/msS9aEAjMLyYB8HRepfVKhnhO72N73kf8GOqxjz2XySM+HzdqOcyjNYS
 ZLY5/HeqiQVj9HmOQUb03hoXlN8/9kP6SVqrK+MTqAB01F11qqBbt5dh7ad2FIlGs+46+wtXz0nDO
 SPIPabt1rOZg7VzlR5xeEm8wJhkTYAWtgfvSdWEZTagNrA11JBQ5HiMzCQ1G/Opl48sS5efuQW296
 lOEzgcyDKLnacXKrS513w1Lr;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vE6A9-00BbVL-26; Wed, 29 Oct 2025 13:24:29 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v2 020/127] smb: smbdirect: introduce
 smbdirect_connection_send_io_done()
Date: Wed, 29 Oct 2025 14:19:58 +0100
Message-ID: <2506202c043d04c50fa500207b5bb57952e577ef.1761742839.git.metze@samba.org>
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
index e5e8432f88e6..05a68991587c 100644
--- a/fs/smb/common/smbdirect/smbdirect_connection.c
+++ b/fs/smb/common/smbdirect/smbdirect_connection.c
@@ -375,3 +375,46 @@ static void smbdirect_connection_idle_timer_work(struct work_struct *work)
 		"schedule send of empty idle message\n");
 	queue_work(sc->workqueue, &sc->idle.immediate_work);
 }
+
+__maybe_unused /* this is temporary while this file is included in orders */
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
+		smbdirect_connection_schedule_disconnect(sc, -ECONNABORTED);
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


