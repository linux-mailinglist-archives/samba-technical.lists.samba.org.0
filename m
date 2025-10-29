Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id DD49CC1AA87
	for <lists+samba-technical@lfdr.de>; Wed, 29 Oct 2025 14:26:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=xO+zQdTr4nLoA6zxZmNOT1NDY6BXo5SP8zluU2kTL5s=; b=BNqF696grjd+g57ybbZBRgF6T+
	TxktrZhaBREOT4xt85+FWuPOnbIq4j9dN18/+xfX8gXcbSb9DZwKoFMGFzHHPcfeMcOyUBV9UyW66
	SMnC4t91UJaGkFZs2EcBfEfUbSPduu+wFDiLiVfFVZ3yU4RIAjli+jYMXXfNCBjUTkPMdZUsZHxu7
	CIPL7BKQRG3ZpCjCzIyMy13ScY9dx6EXsUfTNe+EjTN+FLR4NQG6vqAmMEKCRjH51EmxCEfFFTkvH
	zYJ8aZgaqHvXsPQDY4G6Y/6zV3tWh+/x7Xm7nBfe4aQ3KCs7tob1+JZk+WnB9D1sbXg/C1FuL1rnq
	RE0bZvAA==;
Received: from ip6-localhost ([::1]:22250 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vE6Bt-0096FN-SI; Wed, 29 Oct 2025 13:26:19 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:58532) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vE69f-0095Z9-0x
 for samba-technical@lists.samba.org; Wed, 29 Oct 2025 13:24:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=xO+zQdTr4nLoA6zxZmNOT1NDY6BXo5SP8zluU2kTL5s=; b=xNEe14XqYTAJogSypLQtS+UE5q
 P6UiLm3hwSHJG2n1xVp91UvndAPCLcicfxtmPc3723a/rD08mnT/fYRaHPncA35o7hFemdFvmyCfi
 JMFsipD0jQpCjxCeRgMmLMpkQDIByUuCUn8xxMkkffMtw5ynfQAwCi9BGgihU4Jq3vG+Vyc/0yb7l
 sGl7SxMyWmX0a67Rt6hMGgLwjOv8sTGqzJIjavMwToNUaeGfXmHH2s+5Ae9ovSLaL0CaFJLCGtMGg
 lDWt8pxi0qcJ4c5LROCInlyX/aERkslqlfz5rLbs9SVQSpdKraXrpg378QIY0HclZUK0V53Npw0bG
 5vb2r/7D5/nBV7hHb3gXxRkftkMzbvxJwxHpAgaGEQ5nP42eM76OF/C+P2Ay3rXDtlWQ1ZbDqONvI
 iNu2EZNOMS1a2xEanunwkRJtKgKXSIYd7wQauoX8/gvb6dNfGo4uDcqJtlE0yAH2vDYlUL9oTdXkr
 TdvAWAZmhzDoOf5BUekO1oPs;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vE69b-00BbQ7-0M; Wed, 29 Oct 2025 13:23:55 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v2 014/127] smb: smbdirect: introduce
 smbdirect_connection_reassembly_{append, first}_recv_io()
Date: Wed, 29 Oct 2025 14:19:52 +0100
Message-ID: <0c4c928d9616ffb4bbb81ff5e03ae4dd7e99cf79.1761742839.git.metze@samba.org>
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

These are basically copies of enqueue_reassembly() and
[_]get_first_reassembly() of both client and server. The only difference
is that enqueue_reassembly() of the server does not have:
sc->statistics.enqueue_reassembly_queue++

Also smbdirect_connection_reassembly_first_recv_io() makes use of
list_first_entry_or_null() in order to simplify the code.

In the next commits they will replace the existing functions.

Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: Long Li <longli@microsoft.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
Signed-off-by: Steve French <stfrench@microsoft.com>
---
 .../common/smbdirect/smbdirect_connection.c   | 35 +++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/fs/smb/common/smbdirect/smbdirect_connection.c b/fs/smb/common/smbdirect/smbdirect_connection.c
index dc0a5cea67bf..27f8545ee30d 100644
--- a/fs/smb/common/smbdirect/smbdirect_connection.c
+++ b/fs/smb/common/smbdirect/smbdirect_connection.c
@@ -110,6 +110,41 @@ static void smbdirect_connection_put_recv_io(struct smbdirect_recv_io *msg)
 	queue_work(sc->workqueue, &sc->recv_io.posted.refill_work);
 }
 
+__maybe_unused /* this is temporary while this file is included in orders */
+static void smbdirect_connection_reassembly_append_recv_io(struct smbdirect_socket *sc,
+							   struct smbdirect_recv_io *msg,
+							   u32 data_length)
+{
+	unsigned long flags;
+
+	spin_lock_irqsave(&sc->recv_io.reassembly.lock, flags);
+	list_add_tail(&msg->list, &sc->recv_io.reassembly.list);
+	sc->recv_io.reassembly.queue_length++;
+	/*
+	 * Make sure reassembly_data_length is updated after list and
+	 * reassembly_queue_length are updated. On the dequeue side
+	 * reassembly_data_length is checked without a lock to determine
+	 * if reassembly_queue_length and list is up to date
+	 */
+	virt_wmb();
+	sc->recv_io.reassembly.data_length += data_length;
+	spin_unlock_irqrestore(&sc->recv_io.reassembly.lock, flags);
+	sc->statistics.enqueue_reassembly_queue++;
+}
+
+__maybe_unused /* this is temporary while this file is included in orders */
+static struct smbdirect_recv_io *
+smbdirect_connection_reassembly_first_recv_io(struct smbdirect_socket *sc)
+{
+	struct smbdirect_recv_io *msg;
+
+	msg = list_first_entry_or_null(&sc->recv_io.reassembly.list,
+				       struct smbdirect_recv_io,
+				       list);
+
+	return msg;
+}
+
 __maybe_unused /* this is temporary while this file is included in orders */
 static void smbdirect_connection_schedule_disconnect(struct smbdirect_socket *sc,
 						     int error)
-- 
2.43.0


