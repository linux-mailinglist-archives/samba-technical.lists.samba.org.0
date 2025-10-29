Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C8B4C1AB17
	for <lists+samba-technical@lfdr.de>; Wed, 29 Oct 2025 14:30:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=GOi0ORirNZxGAhcvh5mMlbPeJ4YM4Ek0oe7GsgT7n68=; b=J48NCbih4+Cj6lkFEe/qazqyRE
	90DLvGKYV3y+oTuSfvhEst8kC8U2Vh6+eVgrjV0hFnNItSVvfK+TOHKYodhXLxxuHC4nHq2SHTaj6
	V54XUlCQek1gH+bVelsCs/WG3tISOtZqao+IvpGyPOlDRUo9guFWWKdDlWOc5ts7MvA9uy1+3GOUl
	ZI8T/HK6XSq56VWRm6nL+UUqXTSzIZLgFJs0N65mEw4MYAScK9TwBddmjy9BNDQqbT1grlF9RY+PM
	4W1HJbmKT25LqhGKv4XWmLDWCigdSjhioDd4ArhZA1SGLhwifWkrEjf+SH49g3jxfcp0w8+OFngfr
	iKvn+6aA==;
Received: from ip6-localhost ([::1]:61636 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vE6G5-0097ah-VX; Wed, 29 Oct 2025 13:30:38 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:63254) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vE6BC-00964k-AA
 for samba-technical@lists.samba.org; Wed, 29 Oct 2025 13:25:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=GOi0ORirNZxGAhcvh5mMlbPeJ4YM4Ek0oe7GsgT7n68=; b=fYjjSlbghyTdIrIB4/frm2CuoH
 WvqTMPgvWPjR1mHj+SsWbRZtgw9X8U8dH/YPTZMV/owh0d5tD+OsNZq6a0rowI0Cnlus0BYUheai/
 DOydN6BkjwSXgvAtL0PfjnJ0M0quTIMH+zOuGP32e5V7A2iw9+VxjGXhi6BAnTj2FrFwGMV+fIwt9
 V9FqKEfD8/ljjQRS6bQkB/6FRzCoa99mhG0xVccv/ulVqpexVAa+7JblJDMeJOy/YATFer5Q8uPV7
 sirnXGk/hLgBMIjDwi3pzqT1bm/STDSOCFh7OIuSUZqFP84Brscnftns+pjVZTMGiIzmkha7WAq6w
 3J99eVLb1+cUcNDQSKkq/5FiK+DwyZUDhvRF+lrSnx9bIYDyTTIghCFSRVrKCeVVsuoXmDzIqvE6s
 iVjpq71fgcaoC3A6PYoNkQAVCd38kCFxJAJ4QSFSF5sR/0e0P+7AbPnNOzqAbrYLZWniH5h6K0Wx0
 FlRlFBSN3UJ1K5meeshm72Tu;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vE6B6-00Bbdj-26; Wed, 29 Oct 2025 13:25:28 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v2 030/127] smb: smbdirect: introduce
 smbdirect_connection_wait_for_credits()
Date: Wed, 29 Oct 2025 14:20:08 +0100
Message-ID: <b67ab02598dbea9f0b19227e4937631d4096d276.1761742839.git.metze@samba.org>
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

This is a copy of wait_for_credits() in the server, which
will be replaced by this soon.

This will allow us to share more common code between client
and server soon.

Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: Long Li <longli@microsoft.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
---
 .../common/smbdirect/smbdirect_connection.c   | 27 +++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/fs/smb/common/smbdirect/smbdirect_connection.c b/fs/smb/common/smbdirect/smbdirect_connection.c
index c1281807ff8c..1b84e0789d77 100644
--- a/fs/smb/common/smbdirect/smbdirect_connection.c
+++ b/fs/smb/common/smbdirect/smbdirect_connection.c
@@ -796,6 +796,33 @@ static void smbdirect_connection_idle_timer_work(struct work_struct *work)
 	queue_work(sc->workqueue, &sc->idle.immediate_work);
 }
 
+__maybe_unused /* this is temporary while this file is included in orders */
+static int smbdirect_connection_wait_for_credits(struct smbdirect_socket *sc,
+						 wait_queue_head_t *waitq,
+						 atomic_t *total_credits,
+						 int needed)
+{
+	int ret;
+
+	if (WARN_ON_ONCE(needed < 0))
+		return -EINVAL;
+
+	do {
+		if (atomic_sub_return(needed, total_credits) >= 0)
+			return 0;
+
+		atomic_add(needed, total_credits);
+		ret = wait_event_interruptible(*waitq,
+					       atomic_read(total_credits) >= needed ||
+					       sc->status != SMBDIRECT_SOCKET_CONNECTED);
+
+		if (sc->status != SMBDIRECT_SOCKET_CONNECTED)
+			return -ENOTCONN;
+		else if (ret < 0)
+			return ret;
+	} while (true);
+}
+
 __maybe_unused /* this is temporary while this file is included in orders */
 static void smbdirect_connection_send_io_done(struct ib_cq *cq, struct ib_wc *wc)
 {
-- 
2.43.0


