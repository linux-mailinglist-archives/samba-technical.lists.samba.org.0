Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F2B2B8E778
	for <lists+samba-technical@lfdr.de>; Sun, 21 Sep 2025 23:49:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=4kfmFWh3PjNYF6KjyAbOTCar7TG+054KRDnMpYtVKCg=; b=3Fn5lG+ElgG7U/u7QUGb4QhcP/
	MMXU4cAmDFYbKNBECjDJ86Bqf4DW2U3Lw83hCEb9WZKB5fTMgAz/6bVC2mQqVK8LGzn1fEmJx2XF+
	xO5NZakLjXk2fk2a1FjgsOsLdLfiJ4/CONCQ9WlB9Kbdp0MHb1XDldHmGFQ9mEHiT5MMSrlfMvTM+
	0J5mR6+NffdFceeB6my0zyuZmFNdYKSYsTkRnys4lXTeELQjynl4MnCdozl4vIg8HzLpE59IOb/97
	2QmXP1+rFJacvKSHtaHx+YwpxX8V8liCyUPZ8ZSSOvLF3lCzQWfcyA/Ph6LdWsjLw6fSg14a6FMma
	Dy3GDaIg==;
Received: from ip6-localhost ([::1]:50260 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1v0Rvd-004U6z-LK; Sun, 21 Sep 2025 21:49:05 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:27200) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1v0RuB-004Td2-7e
 for samba-technical@lists.samba.org; Sun, 21 Sep 2025 21:47:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=4kfmFWh3PjNYF6KjyAbOTCar7TG+054KRDnMpYtVKCg=; b=M+iBh0iRLiS44QffXcNa74XTTH
 ESWcpuwbv4OUOns+XT1MGbrYEkCmxlNh+vb58VJm/HAyXFvyo7hyVu6JACFhvLo1hbKVSYCPv41D2
 X/SJyU4tDNprspnwd9G6ZhMUv/L+oUNk9K9NHJCLMh7Y8d9tQxCOEHjr1hSun4X0Uy7y6uCmrat8C
 a07SoAFbhdGKXgASPqOu8jk+4J93+W0b80jUJFgc2c0nJbzhLHKKUuTKQ2qrpC8wv8UK2FPdgLDzv
 7tIqTnXBBj++9sGeMvn041qhlea0ACmGTA1e1MrdNsv4E4DIe58vmMqG0C9EQF95AmqRsNhlmWaCG
 t1MMNtHwe6ME2YxG6/flnSCDEVy7YkWCvVgeCwd47K6nGpVIPHYVpJ/NRLh1FbU1lIJexxNCCY04J
 mbbvO6f0cJuiiv45Anq4ciELWg1tblZU9xFotA3O3eSxmHkkszzSUbAz9pg3nzPHtqowSa3C5JbI0
 8RvL/C32Z4/B7fdpORWlANGv;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1v0Ru7-005Gi9-16; Sun, 21 Sep 2025 21:47:31 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH 16/18] smb: server: make consitent use of spin_lock_irq{save,
 restore}() in transport_rdma.c
Date: Sun, 21 Sep 2025 23:45:03 +0200
Message-ID: <40be1bab1c2fcc9361ee432062d87f73ae7c8855.1758489989.git.metze@samba.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1758489988.git.metze@samba.org>
References: <cover.1758489988.git.metze@samba.org>
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
 Tom Talpey <tom@talpey.com>, Namjae Jeon <linkinjeon@kernel.org>,
 Steve French <stfrench@microsoft.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

There is a mix of using spin_lock() and spin_lock_irq(), which
is confusing as IB_POLL_WORKQUEUE is used and no code would
be called from any interrupt. So using spin_lock() or even
mutexes would be ok.

But we'll soon share common code with the client, which uses
IB_POLL_SOFTIRQ.

And Documentation/kernel-hacking/locking.rst section
"Cheat Sheet For Locking" says:

-  Otherwise (== data can be touched in an interrupt), use
   spin_lock_irqsave() and
   spin_unlock_irqrestore().

So in order to keep it simple and safe we use that version
now. It will help merging functions into common code and
have consistent locking in all cases.

Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
Signed-off-by: Steve French <stfrench@microsoft.com>
---
 fs/smb/server/transport_rdma.c | 39 +++++++++++++++++++++-------------
 1 file changed, 24 insertions(+), 15 deletions(-)

diff --git a/fs/smb/server/transport_rdma.c b/fs/smb/server/transport_rdma.c
index ba4dfdcb321a..f9734d7025b4 100644
--- a/fs/smb/server/transport_rdma.c
+++ b/fs/smb/server/transport_rdma.c
@@ -150,21 +150,24 @@ static struct
 smbdirect_recv_io *get_free_recvmsg(struct smbdirect_socket *sc)
 {
 	struct smbdirect_recv_io *recvmsg = NULL;
+	unsigned long flags;
 
-	spin_lock(&sc->recv_io.free.lock);
+	spin_lock_irqsave(&sc->recv_io.free.lock, flags);
 	if (!list_empty(&sc->recv_io.free.list)) {
 		recvmsg = list_first_entry(&sc->recv_io.free.list,
 					   struct smbdirect_recv_io,
 					   list);
 		list_del(&recvmsg->list);
 	}
-	spin_unlock(&sc->recv_io.free.lock);
+	spin_unlock_irqrestore(&sc->recv_io.free.lock, flags);
 	return recvmsg;
 }
 
 static void put_recvmsg(struct smbdirect_socket *sc,
 			struct smbdirect_recv_io *recvmsg)
 {
+	unsigned long flags;
+
 	if (likely(recvmsg->sge.length != 0)) {
 		ib_dma_unmap_single(sc->ib.dev,
 				    recvmsg->sge.addr,
@@ -173,9 +176,9 @@ static void put_recvmsg(struct smbdirect_socket *sc,
 		recvmsg->sge.length = 0;
 	}
 
-	spin_lock(&sc->recv_io.free.lock);
+	spin_lock_irqsave(&sc->recv_io.free.lock, flags);
 	list_add(&recvmsg->list, &sc->recv_io.free.list);
-	spin_unlock(&sc->recv_io.free.lock);
+	spin_unlock_irqrestore(&sc->recv_io.free.lock, flags);
 
 	queue_work(sc->workqueue, &sc->recv_io.posted.refill_work);
 }
@@ -184,7 +187,9 @@ static void enqueue_reassembly(struct smbdirect_socket *sc,
 			       struct smbdirect_recv_io *recvmsg,
 			       int data_length)
 {
-	spin_lock(&sc->recv_io.reassembly.lock);
+	unsigned long flags;
+
+	spin_lock_irqsave(&sc->recv_io.reassembly.lock, flags);
 	list_add_tail(&recvmsg->list, &sc->recv_io.reassembly.list);
 	sc->recv_io.reassembly.queue_length++;
 	/*
@@ -195,7 +200,7 @@ static void enqueue_reassembly(struct smbdirect_socket *sc,
 	 */
 	virt_wmb();
 	sc->recv_io.reassembly.data_length += data_length;
-	spin_unlock(&sc->recv_io.reassembly.lock);
+	spin_unlock_irqrestore(&sc->recv_io.reassembly.lock, flags);
 }
 
 static struct smbdirect_recv_io *get_first_reassembly(struct smbdirect_socket *sc)
@@ -468,14 +473,16 @@ static void free_transport(struct smb_direct_transport *t)
 
 	ksmbd_debug(RDMA, "drain the reassembly queue\n");
 	do {
-		spin_lock(&sc->recv_io.reassembly.lock);
+		unsigned long flags;
+
+		spin_lock_irqsave(&sc->recv_io.reassembly.lock, flags);
 		recvmsg = get_first_reassembly(sc);
 		if (recvmsg) {
 			list_del(&recvmsg->list);
-			spin_unlock(&sc->recv_io.reassembly.lock);
+			spin_unlock_irqrestore(&sc->recv_io.reassembly.lock, flags);
 			put_recvmsg(sc, recvmsg);
 		} else {
-			spin_unlock(&sc->recv_io.reassembly.lock);
+			spin_unlock_irqrestore(&sc->recv_io.reassembly.lock, flags);
 		}
 	} while (recvmsg);
 	sc->recv_io.reassembly.data_length = 0;
@@ -768,6 +775,7 @@ static int smb_direct_read(struct ksmbd_transport *t, char *buf,
 	if (sc->recv_io.reassembly.data_length >= size) {
 		int queue_length;
 		int queue_removed = 0;
+		unsigned long flags;
 
 		/*
 		 * Need to make sure reassembly_data_length is read before
@@ -823,9 +831,9 @@ static int smb_direct_read(struct ksmbd_transport *t, char *buf,
 				if (queue_length) {
 					list_del(&recvmsg->list);
 				} else {
-					spin_lock_irq(&sc->recv_io.reassembly.lock);
+					spin_lock_irqsave(&sc->recv_io.reassembly.lock, flags);
 					list_del(&recvmsg->list);
-					spin_unlock_irq(&sc->recv_io.reassembly.lock);
+					spin_unlock_irqrestore(&sc->recv_io.reassembly.lock, flags);
 				}
 				queue_removed++;
 				put_recvmsg(sc, recvmsg);
@@ -838,10 +846,10 @@ static int smb_direct_read(struct ksmbd_transport *t, char *buf,
 			data_read += to_copy;
 		}
 
-		spin_lock_irq(&sc->recv_io.reassembly.lock);
+		spin_lock_irqsave(&sc->recv_io.reassembly.lock, flags);
 		sc->recv_io.reassembly.data_length -= data_read;
 		sc->recv_io.reassembly.queue_length -= queue_removed;
-		spin_unlock_irq(&sc->recv_io.reassembly.lock);
+		spin_unlock_irqrestore(&sc->recv_io.reassembly.lock, flags);
 
 		sc->recv_io.reassembly.first_entry_offset = offset;
 		ksmbd_debug(RDMA,
@@ -2107,6 +2115,7 @@ static int smb_direct_prepare(struct ksmbd_transport *t)
 	struct smbdirect_socket_parameters *sp = &sc->parameters;
 	struct smbdirect_recv_io *recvmsg;
 	struct smbdirect_negotiate_req *req;
+	unsigned long flags;
 	int ret;
 
 	/*
@@ -2153,10 +2162,10 @@ static int smb_direct_prepare(struct ksmbd_transport *t)
 
 	ret = smb_direct_send_negotiate_response(sc, ret);
 out:
-	spin_lock_irq(&sc->recv_io.reassembly.lock);
+	spin_lock_irqsave(&sc->recv_io.reassembly.lock, flags);
 	sc->recv_io.reassembly.queue_length--;
 	list_del(&recvmsg->list);
-	spin_unlock_irq(&sc->recv_io.reassembly.lock);
+	spin_unlock_irqrestore(&sc->recv_io.reassembly.lock, flags);
 	put_recvmsg(sc, recvmsg);
 
 	return ret;
-- 
2.43.0


