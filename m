Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B188C1AEB1
	for <lists+samba-technical@lfdr.de>; Wed, 29 Oct 2025 14:49:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=dZ7/3JmtMicIkuY/mNocOEJnKEpBBOv/T562l3U5sgI=; b=NT8607UMM0nWd65h5OfcPWsasu
	1L3TG+kDbs8iltCY3LRo9cJGHaHORLYGBXviYsXMcAmP/1K+QczvMphpd614S5WRxbQw2nOuttV6B
	sC3V9MsVn1Ps+kyEp7tlV5T4J2AZCj2X7ayXrKf/ZEF0L6nRJIuwRJUZXjkRllcaYBMQcPFTj7J37
	9kDl8MTBjX4mUy5pTN8FpcO9BddVzXH06mRKft1TRRxrEu/pFRYEyJUxQSxABtR9rLp3a9ucSIl7x
	EFLrad/Tn7KKCsqV3wNgvXx2DI3mznGwKP/7oTY8eU69wc0dLjCJpaXaU+7yNTb5LgAlfdJCvflgO
	6x/Ezm+Q==;
Received: from ip6-localhost ([::1]:62452 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vE6YP-009EF6-PX; Wed, 29 Oct 2025 13:49:34 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:46958) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vE6JK-0098lZ-PJ
 for samba-technical@lists.samba.org; Wed, 29 Oct 2025 13:34:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=dZ7/3JmtMicIkuY/mNocOEJnKEpBBOv/T562l3U5sgI=; b=GKU9Por+h4F8aZfCwW8ovTWluV
 vhf6PcJXO4ITluQy0IqjcXl5umtpklX6lWIVkHBqXXSqfjDQu5dJQ6SLB9+zmnHRRWUwc+EiryZuZ
 jE+b9R3tvtr9HKrUqB9nl5MmpOXciSWR7jXfSsnnGFpo6WjEk2ICDRVc+k8mWTa6RBxrcOH9+vK28
 t/AYq8KugnjAyYwrZErTJTdkw5lt9srKs6ebulhGrEEjeu1lE9+ITlVn3fZOOoFessR+I9N7hashy
 WIX83/tbGTX6o3mEhxVDD+TwrE0z1IDO3PAdqqGM9HipqJfRWfCDxAMzGGoPcvxtuxwaF5OBdPohN
 3evMDGeavOAMSfg+a+JV/w+0XhPN8xwGQVOxhQaaDWS8L1DHuIRb0mbl0aJHgC6KF14lfRjEVIbrv
 YFdiiBM905aoJdey7JDREaNAmy720+LEB2gH0bK38l58N3pkLoUoAG4pDGFtpuQwWAgGnnN7yPDUN
 E2j+WxKHgFDON1clz/XCVsU3;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vE6JI-00Bcza-26; Wed, 29 Oct 2025 13:33:56 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v2 114/127] smb: server: make use of
 smbdirect_connection_destroy_sync()
Date: Wed, 29 Oct 2025 14:21:32 +0100
Message-ID: <5f209aceb9b8b1a59350ba0c764f424244941c79.1761742839.git.metze@samba.org>
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

This is basically the same logic as before, but we now
use common code, which will also be used by the server soon.

Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
---
 fs/smb/server/transport_rdma.c | 49 +---------------------------------
 1 file changed, 1 insertion(+), 48 deletions(-)

diff --git a/fs/smb/server/transport_rdma.c b/fs/smb/server/transport_rdma.c
index 2845f58301fb..98ecc9f7f482 100644
--- a/fs/smb/server/transport_rdma.c
+++ b/fs/smb/server/transport_rdma.c
@@ -289,56 +289,9 @@ static void smb_direct_free_transport(struct ksmbd_transport *kt)
 static void free_transport(struct smb_direct_transport *t)
 {
 	struct smbdirect_socket *sc = &t->socket;
-	struct smbdirect_recv_io *recvmsg;
-
-	disable_work_sync(&sc->disconnect_work);
-	if (sc->status < SMBDIRECT_SOCKET_DISCONNECTING)
-		smbdirect_connection_disconnect_work(&sc->disconnect_work);
-	if (sc->status < SMBDIRECT_SOCKET_DISCONNECTED)
-		wait_event(sc->status_wait, sc->status == SMBDIRECT_SOCKET_DISCONNECTED);
-
-	/*
-	 * Wake up all waiters in all wait queues
-	 * in order to notice the broken connection.
-	 *
-	 * Most likely this was already called via
-	 * smbdirect_connection_disconnect_work(), but call it again...
-	 */
-	smbdirect_connection_wake_up_all(sc);
-
-	disable_work_sync(&sc->recv_io.posted.refill_work);
-	disable_delayed_work_sync(&sc->idle.timer_work);
-	disable_work_sync(&sc->idle.immediate_work);
-
-	if (sc->rdma.cm_id)
-		rdma_lock_handler(sc->rdma.cm_id);
 
-	if (sc->ib.qp)
-		ib_drain_qp(sc->ib.qp);
-
-	ksmbd_debug(RDMA, "drain the reassembly queue\n");
-	do {
-		unsigned long flags;
-
-		spin_lock_irqsave(&sc->recv_io.reassembly.lock, flags);
-		recvmsg = smbdirect_connection_reassembly_first_recv_io(sc);
-		if (recvmsg) {
-			list_del(&recvmsg->list);
-			spin_unlock_irqrestore(&sc->recv_io.reassembly.lock, flags);
-			smbdirect_connection_put_recv_io(recvmsg);
-		} else {
-			spin_unlock_irqrestore(&sc->recv_io.reassembly.lock, flags);
-		}
-	} while (recvmsg);
-	sc->recv_io.reassembly.data_length = 0;
-
-	smbdirect_connection_destroy_qp(sc);
-	if (sc->rdma.cm_id) {
-		rdma_unlock_handler(sc->rdma.cm_id);
-		rdma_destroy_id(sc->rdma.cm_id);
-	}
+	smbdirect_connection_destroy_sync(sc);
 
-	smbdirect_connection_destroy_mem_pools(sc);
 	ksmbd_conn_free(KSMBD_TRANS(t)->conn);
 }
 
-- 
2.43.0


