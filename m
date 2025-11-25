Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E656C86898
	for <lists+samba-technical@lfdr.de>; Tue, 25 Nov 2025 19:17:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=idw1C0nEA3EojNDx3c5+pPmnlfxkPYYpaS6zKJCIOvk=; b=2hZxiwfffYDEWmETYqYp/hPgq3
	nKJUrM8PKUvt+gX90XH14thTlZhP2MpBNWbePCP3RM0wkOY23/IqyjPlPPQZ479GBGgiLZKG6FnZu
	oDgRR2W9w3GasYU0L7fJ62TfbiheosDT87XjxzP5Kh0g3IL2MxVbEVkqmOo+cn3AyC7QRkjD9i79I
	lviTcoorIm+hiFLFbKiYaMMV1hhdsnMuv9BZYkH6rB6psXNzHviisOmfAMcF8DzgfShSiEZYbUZ7P
	BNvdwJ9Yyycc0jldy0cuE5zYDtwNCjuFcqnQ4czruFG81HmIvmUzQ6NHdK6Z3eEG7Y2Gia2xmN4V9
	r7wDmsRg==;
Received: from ip6-localhost ([::1]:18502 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vNxb5-00DD7F-RJ; Tue, 25 Nov 2025 18:17:04 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:48468) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vNxUQ-00DAis-PK
 for samba-technical@lists.samba.org; Tue, 25 Nov 2025 18:10:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=idw1C0nEA3EojNDx3c5+pPmnlfxkPYYpaS6zKJCIOvk=; b=w6I3/ZBBPeDY9HLH6Ib3R+Mtdr
 igXwIu+T5saafLQeoCzSybOmlmsC6hZHT0Diuj2okAU6OMrCs3zn2SK4QAkdC8bjLny14py8UwGyT
 CUDmU9i2ZFoEKD8qV7I2efI2Ua6YJ94Iko27gcGzldhfbNRdHy0DGeAnAASKDQWGaSft3gxNqhd3A
 dDRomxHjTP4QwqdInTPecgluTn2oya8blnVbOte4UeVvwj1OiXhyqFh210QM02FR9drudmKa0zM1n
 FIYG8APD+wKdt99g2KhbDdZVJ4zZCxe1PgijUe+unyr1lAQAyaYI3jPoeZ0/3OYO0h2G4tozzdvCA
 lY0DAb/lUpEL1iy3uqlDAVHWa94GC+0ahffEiRZz84eXST11E/HnBf/f97vmkGAaYS8tC9fZjQ2hi
 jmXaGetldbSXzA3frNycw2D2QfMDKLZQd6MxMgnLmvaf1k1TZuD53R7oaTJCwoiXnPRfX9P8+cwW4
 +YXG526n0ZlN1wiMMHXb50Xd;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vNxRR-00FdtN-2D; Tue, 25 Nov 2025 18:07:06 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v4 082/145] smb: client: make use of
 smbdirect_socket_destroy_sync()
Date: Tue, 25 Nov 2025 18:55:28 +0100
Message-ID: <c2a295e5a82c76e6894d0eda230cf19d6e016dcc.1764091285.git.metze@samba.org>
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

This is basically the same logic as before, but we now
use common code, which will also be used by the server soon.

Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: Long Li <longli@microsoft.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
Signed-off-by: Steve French <stfrench@microsoft.com>
---
 fs/smb/client/smbdirect.c | 63 +--------------------------------------
 1 file changed, 1 insertion(+), 62 deletions(-)

diff --git a/fs/smb/client/smbdirect.c b/fs/smb/client/smbdirect.c
index 489553456fcc..a240f3545f9a 100644
--- a/fs/smb/client/smbdirect.c
+++ b/fs/smb/client/smbdirect.c
@@ -1077,8 +1077,6 @@ void smbd_destroy(struct TCP_Server_Info *server)
 {
 	struct smbd_connection *info = server->smbd_conn;
 	struct smbdirect_socket *sc;
-	struct smbdirect_recv_io *response;
-	unsigned long flags;
 
 	if (!info) {
 		log_rdma_event(INFO, "rdma session already destroyed\n");
@@ -1086,68 +1084,9 @@ void smbd_destroy(struct TCP_Server_Info *server)
 	}
 	sc = &info->socket;
 
-	log_rdma_event(INFO, "cancelling and disable disconnect_work\n");
-	disable_work_sync(&sc->disconnect_work);
-
-	log_rdma_event(INFO, "destroying rdma session\n");
-	if (sc->status < SMBDIRECT_SOCKET_DISCONNECTING)
-		smbdirect_socket_cleanup_work(&sc->disconnect_work);
-	if (sc->status < SMBDIRECT_SOCKET_DISCONNECTED) {
-		log_rdma_event(INFO, "wait for transport being disconnected\n");
-		wait_event(sc->status_wait, sc->status == SMBDIRECT_SOCKET_DISCONNECTED);
-		log_rdma_event(INFO, "waited for transport being disconnected\n");
-	}
-
-	/*
-	 * Wake up all waiters in all wait queues
-	 * in order to notice the broken connection.
-	 *
-	 * Most likely this was already called via
-	 * smbdirect_socket_cleanup_work(), but call it again...
-	 */
-	smbdirect_socket_wake_up_all(sc);
-
-	log_rdma_event(INFO, "cancelling recv_io.posted.refill_work\n");
-	disable_work_sync(&sc->recv_io.posted.refill_work);
-
-	log_rdma_event(INFO, "drain qp\n");
-	ib_drain_qp(sc->ib.qp);
-
-	log_rdma_event(INFO, "cancelling idle timer\n");
-	disable_delayed_work_sync(&sc->idle.timer_work);
-	log_rdma_event(INFO, "cancelling send immediate work\n");
-	disable_work_sync(&sc->idle.immediate_work);
-
-	/* It's not possible for upper layer to get to reassembly */
-	log_rdma_event(INFO, "drain the reassembly queue\n");
-	do {
-		spin_lock_irqsave(&sc->recv_io.reassembly.lock, flags);
-		response = smbdirect_connection_reassembly_first_recv_io(sc);
-		if (response) {
-			list_del(&response->list);
-			spin_unlock_irqrestore(
-				&sc->recv_io.reassembly.lock, flags);
-			smbdirect_connection_put_recv_io(response);
-		} else
-			spin_unlock_irqrestore(
-				&sc->recv_io.reassembly.lock, flags);
-	} while (response);
-	sc->recv_io.reassembly.data_length = 0;
-
-	log_rdma_event(INFO, "freeing mr list\n");
-	smbdirect_connection_destroy_mr_list(sc);
-
-	log_rdma_event(INFO, "destroying qp\n");
-	smbdirect_connection_destroy_qp(sc);
-	rdma_destroy_id(sc->rdma.cm_id);
-
-	/* free mempools */
-	smbdirect_connection_destroy_mem_pools(sc);
-
-	sc->status = SMBDIRECT_SOCKET_DESTROYED;
+	smbdirect_socket_destroy_sync(sc);
 
 	destroy_workqueue(sc->workqueue);
-	log_rdma_event(INFO,  "rdma session destroyed\n");
 	kfree(info);
 	server->smbd_conn = NULL;
 }
-- 
2.43.0


