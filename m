Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id EAE97B34CC3
	for <lists+samba-technical@lfdr.de>; Mon, 25 Aug 2025 22:52:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=D8nc4lXuqpXC3lzs1+L2B89YRfeb/dLlP0fwmi/G7Wg=; b=zr9Eec88eFAexY9/l+Ed27ovXX
	gDExbkxagSe0O1HH6K84WwGfcD21FekjYHTGIwHk2ZXKzZxmI4S0XK9fS82ll3SewDMZqUFcjQfIo
	TOhsDNXB8Fv8zWXIfqb3u1A1byrX54p90ZxTGPQTnZa6UFBSpxp0WohX1TCasIWeP90NfxfQWht5C
	D40tEOSIcHa6dRvIxuMIFyqUqx/ku8cDRfrKIv30SixiUuskvFi5gYuCwhIqqvtHnWaPOw8soHHpl
	gguqYAx4OFYeF1ib1rvXXPT7SGNeC+OWRyGv8PDbTQWKX10zBSh3Wsi7L6V5wReIMoejhfT08wjBb
	DfvnaHKA==;
Received: from ip6-localhost ([::1]:28632 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uqeAl-000P3d-BG; Mon, 25 Aug 2025 20:52:11 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:40138) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uqe87-000O57-V2
 for samba-technical@lists.samba.org; Mon, 25 Aug 2025 20:50:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=D8nc4lXuqpXC3lzs1+L2B89YRfeb/dLlP0fwmi/G7Wg=; b=usQNeFhFK/IZgFqW+Dzt2HgwVR
 6ZCkYm0ZI6Ufb1PlPTirtnV/KvnyH1FCHNPxZarVwi3Ttm9v/09IpgARfGRNRDMB/pKED1JE7qIoH
 BqgB4/0vQgrmzOHpRtCmmW5TR97udVlBqDOR8Xd9TKNMqBWlymK1lSzFw2sfhRAXjjAPzHmVfvaEE
 LUgtqwPnVVDVLOn8LXBDUshIBl9M9Ju/j+vzsW20uw7zFphZXlIh7EHB35B3i0bPPZ4jdSHHnjAX3
 BDimYS0ZtgbD2AEKkEgFbq/wbkBV5/RetfE80pCUkxHHIgkIt4E0eXZYPZAr7J8jzUWmAfVwYboAa
 0H3tSi6osqnuWArk7p7l6IHlVNkfN393yrz1pWzUCj6WUvZ3hKkLKYJc2M3VPKolPBWjVf/8iCWxq
 HcqPlLnq/oWmkCNVndKUyqEOV9Y3KIk+cgW1+RIqotWLCvzoehEo/9GSghYcBxYpHbj0gzqODKYDJ
 jRS1dFiGjmslq7CmUfWt+CCG;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uqe85-000kk7-02; Mon, 25 Aug 2025 20:49:25 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v4 046/142] smb: client: remove unused
 smbd_connection.count_reassembly_queue
Date: Mon, 25 Aug 2025 22:40:07 +0200
Message-ID: <92709bbdcf5c1a105812b60ebd7aefe4d6720759.1756139607.git.metze@samba.org>
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

This basically represents the same information as
sc->recv_io.reassembly.queue_length.

The only thing that's different is that
smbd_connection.count_reassembly_queue was updated in each
loop step, while sc->recv_io.reassembly.queue_length is only
updated once after the loop in smbd_recv.
Also sc->recv_io.reassembly.queue_length is updated under
a spinlock.

Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: Long Li <longli@microsoft.com>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
---
 fs/smb/client/cifs_debug.c | 3 +--
 fs/smb/client/smbdirect.c  | 2 --
 fs/smb/client/smbdirect.h  | 1 -
 3 files changed, 1 insertion(+), 5 deletions(-)

diff --git a/fs/smb/client/cifs_debug.c b/fs/smb/client/cifs_debug.c
index 8f1ad9cb6208..35c90d494cd9 100644
--- a/fs/smb/client/cifs_debug.c
+++ b/fs/smb/client/cifs_debug.c
@@ -465,12 +465,11 @@ static int cifs_debug_data_proc_show(struct seq_file *m, void *v)
 			server->smbd_conn->count_get_receive_buffer,
 			server->smbd_conn->count_put_receive_buffer,
 			server->smbd_conn->count_send_empty);
-		seq_printf(m, "\nRead Queue count_reassembly_queue: %x "
+		seq_printf(m, "\nRead Queue "
 			"count_enqueue_reassembly_queue: %x "
 			"count_dequeue_reassembly_queue: %x "
 			"reassembly_data_length: %x "
 			"reassembly_queue_length: %x",
-			server->smbd_conn->count_reassembly_queue,
 			server->smbd_conn->count_enqueue_reassembly_queue,
 			server->smbd_conn->count_dequeue_reassembly_queue,
 			sc->recv_io.reassembly.data_length,
diff --git a/fs/smb/client/smbdirect.c b/fs/smb/client/smbdirect.c
index 68450489c5d1..a597b0bbd521 100644
--- a/fs/smb/client/smbdirect.c
+++ b/fs/smb/client/smbdirect.c
@@ -1307,7 +1307,6 @@ static void enqueue_reassembly(
 	virt_wmb();
 	sc->recv_io.reassembly.data_length += data_length;
 	spin_unlock(&sc->recv_io.reassembly.lock);
-	info->count_reassembly_queue++;
 	info->count_enqueue_reassembly_queue++;
 }
 
@@ -2035,7 +2034,6 @@ int smbd_recv(struct smbd_connection *info, struct msghdr *msg)
 						&sc->recv_io.reassembly.lock);
 				}
 				queue_removed++;
-				info->count_reassembly_queue--;
 				info->count_dequeue_reassembly_queue++;
 				put_receive_buffer(info, response);
 				offset = 0;
diff --git a/fs/smb/client/smbdirect.h b/fs/smb/client/smbdirect.h
index 3963fd27d8b6..bc72634f5433 100644
--- a/fs/smb/client/smbdirect.h
+++ b/fs/smb/client/smbdirect.h
@@ -69,7 +69,6 @@ struct smbd_connection {
 	/* for debug purposes */
 	unsigned int count_get_receive_buffer;
 	unsigned int count_put_receive_buffer;
-	unsigned int count_reassembly_queue;
 	unsigned int count_enqueue_reassembly_queue;
 	unsigned int count_dequeue_reassembly_queue;
 	unsigned int count_send_empty;
-- 
2.43.0


