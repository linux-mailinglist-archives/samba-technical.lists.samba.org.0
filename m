Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E55F9C1AD52
	for <lists+samba-technical@lfdr.de>; Wed, 29 Oct 2025 14:41:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=rANleGC/Y/8204Ru4by8qJkhUIdMHzrFbzxaZTJiSZY=; b=yFT/ivGpA5Vai0T6C9iIk/YooO
	ZfYy19ztAGBA+uY8dko/84bcz+JB3mV+D6hOjCdyFwIcPg90kSfJX5GGvI2JCaWnNhSzmfilt5LDL
	hxZqbWsmUU/rtRYRwLs4bgXpKhL3N00xJuATERzotyFl3CirrczekMMhkLIw5bUSkhtEHDp8Eopdu
	hmninE5qkRFzy4Ukb1tICr8j1eO+BMSMwIqNxe7BvkXlpj2eLxR2/Cot3mjzUvLA3LIT0pnC8Qifb
	G/gfu566H9zZ0eyZ5k8Ed19kw0pPtXAEtC7IWxxbFmnOtUPeV5pQ7kPaPKwvf5xhjcjVkeL7a28U5
	Wqz82BCw==;
Received: from ip6-localhost ([::1]:57580 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vE6Qs-009BQu-K9; Wed, 29 Oct 2025 13:41:46 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:50908) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vE6Fc-0097VA-PU
 for samba-technical@lists.samba.org; Wed, 29 Oct 2025 13:30:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=rANleGC/Y/8204Ru4by8qJkhUIdMHzrFbzxaZTJiSZY=; b=ku3dj6xGkzeekUpKH5+5ebfqf6
 MTucG5U4H38j+6HTRfC2OggGzFMhGJ91yA3FnCAP8s2rt2rWINcT/oOeZlwZ3bHaMRxeu1sbzhb23
 YwSVPIdrdnvBLGvzk3RjgH36rAWZs8kche6nl+oGjViCj9svhR2x8N3E9zLeOnLXLgcGkoey1Kae9
 OcbWZ+HucrhW3y0OK8kbiJi/vbJP+dt7EtU5JQlXgr4gkiB2LKii+gIEy76SJ5NbkaN9qfjeglv10
 Jq6/vl4CCMtX6lHKA434rMiRMK72guBaWR42iy0XBBSMIYUWyVSjCHctCZeXH5xzbWjfKO3zXAGC6
 r6RVjuS5I1oGj/bfEikkKH1cw2UOk5q2/mL2vrhfUiuG4jlhnF25Ds8W/tz0zYl4Fattmgyr2EOJJ
 iT0IcKzvG7X19Kbz/c56MXL8k7vetcgP5QYbGG95XQ1ILp215AnCkYjLWasfq29hBcRwPeGlc3Knl
 tDVUzi38Uh8NZ3Geb+G9aRNB;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vE6FW-00BcLI-38; Wed, 29 Oct 2025 13:30:03 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v2 077/127] smb: client: make use of
 smbdirect_connection_destroy_sync()
Date: Wed, 29 Oct 2025 14:20:55 +0100
Message-ID: <15ff885cb93591d78f4c03417151a3b882428624.1761742839.git.metze@samba.org>
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

Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: Long Li <longli@microsoft.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
---
 fs/smb/client/smbdirect.c | 63 +--------------------------------------
 1 file changed, 1 insertion(+), 62 deletions(-)

diff --git a/fs/smb/client/smbdirect.c b/fs/smb/client/smbdirect.c
index 0e393f6ab835..7d786d119184 100644
--- a/fs/smb/client/smbdirect.c
+++ b/fs/smb/client/smbdirect.c
@@ -1076,8 +1076,6 @@ void smbd_destroy(struct TCP_Server_Info *server)
 {
 	struct smbd_connection *info = server->smbd_conn;
 	struct smbdirect_socket *sc;
-	struct smbdirect_recv_io *response;
-	unsigned long flags;
 
 	if (!info) {
 		log_rdma_event(INFO, "rdma session already destroyed\n");
@@ -1085,68 +1083,9 @@ void smbd_destroy(struct TCP_Server_Info *server)
 	}
 	sc = &info->socket;
 
-	log_rdma_event(INFO, "cancelling and disable disconnect_work\n");
-	disable_work_sync(&sc->disconnect_work);
-
-	log_rdma_event(INFO, "destroying rdma session\n");
-	if (sc->status < SMBDIRECT_SOCKET_DISCONNECTING)
-		smbdirect_connection_disconnect_work(&sc->disconnect_work);
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
-	 * smbdirect_connection_disconnect_work(), but call it again...
-	 */
-	smbdirect_connection_wake_up_all(sc);
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
+	smbdirect_connection_destroy_sync(sc);
 
 	destroy_workqueue(sc->workqueue);
-	log_rdma_event(INFO,  "rdma session destroyed\n");
 	kfree(info);
 	server->smbd_conn = NULL;
 }
-- 
2.43.0


