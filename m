Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B9840C86636
	for <lists+samba-technical@lfdr.de>; Tue, 25 Nov 2025 19:01:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=td+mDRlO4KLBe1dwcu8mq2h7nCS32fUqanVAFUTC3y4=; b=A13tVxdTff+pDKT5t0b71uZI8P
	WX3uN2U30lW6RfJnA8JMSd+1uGk4y84Hd0Iar+q0/QeAoqEp18tTXI7QqFuEt/mH6zZvyV9FuC3uJ
	05cAtsjRP2QkLZRUBfJm95fh2UjCfn38UiFd6n4PQCVvbahAcY5C6CVVtH7ScvmNupiRwaGk/Cs8z
	4G06O41mz0hXGmiiJTnEicxCAUSawqWZXBfuAFASvpOuCyTxJB6iuw2T3SUBhbOq6sWxb5W3lUkit
	nDU3EblFduaazojWo4XCHGoklhPWlunuh/ZvyXioIE9Zrgg4TdkIbOtYTV7nQhFR6O+HoQLQrj5L0
	UZcAoYSg==;
Received: from ip6-localhost ([::1]:38078 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vNxLQ-00D7j3-2C; Tue, 25 Nov 2025 18:00:53 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:29486) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vNxIx-00D6z9-ET
 for samba-technical@lists.samba.org; Tue, 25 Nov 2025 17:58:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=td+mDRlO4KLBe1dwcu8mq2h7nCS32fUqanVAFUTC3y4=; b=WwRmqayXDY8JIV2mgbToKY5z5m
 OyOlZiJBzEUorkP356+JMdLa86dF2rybdqTpecx5vey5UvFWQHdLosIXUyu+zaVZHDxEX1ay+FKlI
 Uo89HXnFgIpGKk01+0Wgx+b8PWmuKXHOKompToupgf76yypEjQrEYSirkQFT2incfrD0VaN+xVz80
 /V1iQQXMaYxkC/Z8JHPRMiNGFBXw/YUCcGdus30n8aE2+mz2wbXiLWq4s6qbifpnnnHrZN7iy9ejg
 OLvUSN0gtegbD1PNqndQYFabRb10/o01BSNStaq6knI4EBwe/jEvP3BlMa6SMcvY+gdEI8xR3l7P7
 fZ+93oJNWGwd5gqoXjr8dzrRlnevu6HY9Sc/t3azLyHmGsBTBhbmpP3LcRcOg4v9t/ZZ9N3kazToY
 VYwGTsf1mybnegUQUHtX5JUbJF02CaqqProdnl4UK+DGCdk2LHjElwtXAgNBe1K92oL5TdFno+N7G
 /60nsLE5WUjzR2TPht6dQZqI;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vNxIu-00Fcjb-2i; Tue, 25 Nov 2025 17:58:16 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v4 016/145] smb: smbdirect: introduce
 smbdirect_connection_{get, put}_recv_io()
Date: Tue, 25 Nov 2025 18:54:22 +0100
Message-ID: <df9c3bbbd8e214eebe6ea5b0e6c883fe47a874f5.1764091285.git.metze@samba.org>
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

These are basically copies of {get,put}_receive_buffer() in the client
and they are very similar to {get_free,put}_recvmsg() in the server.

The only difference to {get_free,put}_recvmsg() are the
updating of the sc->statistics.*.

In addition smbdirect_connection_get_recv_io() uses
list_first_entry_or_null() in order to simplify the code.
We also only use it on a healthy connection.

smbdirect_connection_put_recv_io() uses msg->socket instead
of an explicit argument. And it disables any complex_work.

Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: Long Li <longli@microsoft.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
Signed-off-by: Steve French <stfrench@microsoft.com>
---
 .../common/smbdirect/smbdirect_connection.c   | 47 +++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/fs/smb/common/smbdirect/smbdirect_connection.c b/fs/smb/common/smbdirect/smbdirect_connection.c
index 0a96f5db6ff3..db807fb9e3db 100644
--- a/fs/smb/common/smbdirect/smbdirect_connection.c
+++ b/fs/smb/common/smbdirect/smbdirect_connection.c
@@ -5,3 +5,50 @@
  */
 
 #include "smbdirect_internal.h"
+
+__maybe_unused /* this is temporary while this file is included in others */
+static struct smbdirect_recv_io *smbdirect_connection_get_recv_io(struct smbdirect_socket *sc)
+{
+	struct smbdirect_recv_io *msg = NULL;
+	unsigned long flags;
+
+	spin_lock_irqsave(&sc->recv_io.free.lock, flags);
+	if (likely(!sc->first_error))
+		msg = list_first_entry_or_null(&sc->recv_io.free.list,
+					       struct smbdirect_recv_io,
+					       list);
+	if (likely(msg)) {
+		list_del(&msg->list);
+		sc->statistics.get_receive_buffer++;
+	}
+	spin_unlock_irqrestore(&sc->recv_io.free.lock, flags);
+
+	return msg;
+}
+
+__maybe_unused /* this is temporary while this file is included in others */
+static void smbdirect_connection_put_recv_io(struct smbdirect_recv_io *msg)
+{
+	struct smbdirect_socket *sc = msg->socket;
+	unsigned long flags;
+
+	/*
+	 * Should already be disabled anyway.
+	 */
+	disable_work(&msg->complex_work);
+
+	if (likely(msg->sge.length != 0)) {
+		ib_dma_unmap_single(sc->ib.dev,
+				    msg->sge.addr,
+				    msg->sge.length,
+				    DMA_FROM_DEVICE);
+		msg->sge.length = 0;
+	}
+
+	spin_lock_irqsave(&sc->recv_io.free.lock, flags);
+	list_add_tail(&msg->list, &sc->recv_io.free.list);
+	sc->statistics.put_receive_buffer++;
+	spin_unlock_irqrestore(&sc->recv_io.free.lock, flags);
+
+	queue_work(sc->workqueue, &sc->recv_io.posted.refill_work);
+}
-- 
2.43.0


