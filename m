Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id C6B8BC8665A
	for <lists+samba-technical@lfdr.de>; Tue, 25 Nov 2025 19:01:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=q8WoHaLN4EH2gjfj87NxF4/nUgHoRACqI6jB3cgK+9Y=; b=slBjTSF4kUbFaMgW6L2UjFoEh7
	ODfISjF404N+3/R0MKmFN72W8hvkJw8yopH6jkJQ5NK5HINbeEnxonRSESgSaaPUwizawC71xB+Pk
	Cy8fiX4RReaTLP2SiZUx3r37dE92v/JF2Iefeky/Rwcn+0iOqTD/5Lx8DU82ZY9X1OZI2g4BQkuPs
	eJTSIYAE7R7BDX1/clQc1Hy5TKzedtWwiDeA84yU2bxAeDnwZ4Ov/7vGTmK9/y0939cCda43i9Lur
	SaC2wMg8xuSbXdPwT6ENObUcsc0CSfd0uCZyax6xoPOWqWZf9//s8S3oZky/1PVII2HnmV712X1M1
	ChuDCWhQ==;
Received: from ip6-localhost ([::1]:31452 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vNxLj-00D7on-72; Tue, 25 Nov 2025 18:01:12 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:11912) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vNxJ2-00D70X-Hk
 for samba-technical@lists.samba.org; Tue, 25 Nov 2025 17:58:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=q8WoHaLN4EH2gjfj87NxF4/nUgHoRACqI6jB3cgK+9Y=; b=DDkhHIGx2um3/n55o/AZ2e9xBy
 otALGoAhE050cb/rIVz1uiADfIWzyhzpVQh9kCYBIrYmLxM/X7UbT/0UgK20gcXGPaWr5UT8Nz8/7
 t7TpL0b5fpuJFT+nPdAW/lg4bi8BEZwRNMf148I1MRh1QsSascHqWFiHfAyajLcmULIt8CyhhPWa+
 TtHOcfJ35kYMnU0vXjNCCwAWlsGAJyX/CT2cxjbINToiTEw84dNJ5WqgnskmNV7/o8J6SyebPGVIJ
 ddtWRPPs/hmtIPuW1c7MmKUb9t7ysUBrMcY2lhoTuREBr3KMnFUcALLIxh+qCynkmzNlkgjSUvd6c
 Lm/mlQYJXxdMzbkz6OrgO0Xdaph10II1etENSKYM6xJc1XmHFGdDq9LNfhX+3STMArPKJSxuG2h59
 A0s1JuyVMaPiqprOywLGeaGqM0D2qXM+FgfmtFSaO/WwxTPaJOfmu9O5akYGwA4C7arEiRmq1MLr1
 OBIikNRiRdJsVyP4lRv2oeg3;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vNxJ0-00Fckb-17; Tue, 25 Nov 2025 17:58:22 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v4 017/145] smb: smbdirect: introduce
 smbdirect_connection_reassembly_{append, first}_recv_io()
Date: Tue, 25 Nov 2025 18:54:23 +0100
Message-ID: <4aaf7160bc5d97d6dce6e62b8a5a5e50a4bce65b.1764091285.git.metze@samba.org>
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
 .../common/smbdirect/smbdirect_connection.c   | 40 +++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/fs/smb/common/smbdirect/smbdirect_connection.c b/fs/smb/common/smbdirect/smbdirect_connection.c
index db807fb9e3db..aa554527f993 100644
--- a/fs/smb/common/smbdirect/smbdirect_connection.c
+++ b/fs/smb/common/smbdirect/smbdirect_connection.c
@@ -52,3 +52,43 @@ static void smbdirect_connection_put_recv_io(struct smbdirect_recv_io *msg)
 
 	queue_work(sc->workqueue, &sc->recv_io.posted.refill_work);
 }
+
+__maybe_unused /* this is temporary while this file is included in others */
+static void smbdirect_connection_reassembly_append_recv_io(struct smbdirect_socket *sc,
+							   struct smbdirect_recv_io *msg,
+							   u32 data_length)
+{
+	unsigned long flags;
+
+	/*
+	 * The work should already/still be disabled
+	 */
+	disable_work(&msg->complex_work);
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
+__maybe_unused /* this is temporary while this file is included in others */
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
-- 
2.43.0


