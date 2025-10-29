Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 20287C1ADF7
	for <lists+samba-technical@lfdr.de>; Wed, 29 Oct 2025 14:45:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=x3RKBq5bQS7gxztO8s3r+jkzX6f094h3iqIdMA88o+k=; b=Qg8E9MgfasisajycR6GslH+Ux5
	kN4IHb44G8IPyNbkY2w2BpL5SXVt7ei0dI653a7Z0tU+6IDyVWWVcC8kk9n/XAaVu5hTx9ybxyflq
	WJy00qoCIF/qCmJQg0IQ3pBqumgx/EFnjBe7Z40N4IoeYu9P8yJkKVnKhAXan/Q319nA6yA949WZe
	E3of4b8k9cogaT8gSAYnhMRsLltcVRIQzkXaJfC+GH0UeT0PMAKGs9sWQv9HDczwbJzQ9Ha/aCuTy
	tXYRHSB8EU2VVQws7qyxNx6MXnaoTNJso5cizI7/KNfkPAbmjXxtbX2CpG5NLt9A/F17/JV0ezWpT
	wb/4//bA==;
Received: from ip6-localhost ([::1]:29698 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vE6Uc-009Cp1-Cw; Wed, 29 Oct 2025 13:45:39 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:51776) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vE6HV-00987o-7m
 for samba-technical@lists.samba.org; Wed, 29 Oct 2025 13:32:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=x3RKBq5bQS7gxztO8s3r+jkzX6f094h3iqIdMA88o+k=; b=kJkfvB/usyEW1yYcwouipWtA6w
 1dOB5eU1aaTQfAvj1cXm5WMCBvV6YGD8UtIQiwaoh5j62v6ylO/uXiDFeXttQuI0wY/NTF7xfD0kF
 IzfrqSBDYWZx45hB7iNwJ6iKNaqfnjyYeFK7Z5g44m7tvvvax5ivxCFBrN+nQb9ubhlhuQ0M6Og41
 /58trBcW6q99RD8kM1mP6qtsyGg3PrBkBK9iuwX/TYdz/mEfCqd8rYep7Umo/1y9nwU4t5BN63pZn
 NO+paM8clt/Gz1QPRgUd8bVSe4GM4lt34RGTSa7pMPxDJK6KGhpH4wI0i5gN8xsxPueO4vuCfFE+J
 azFNnnMBDkJey7zkTL8/yvaXkNQx/ymhVEFgccw1cJ186frVMn9ICaTHrZFM2/1uIxUoUkeQ1THRx
 DsgB448fm7rW6RwaY7xGof6g8cDczwhWlJbL48Ahy5iH3s/VsDa9u1v3bfMxXftMGRgM//3Vs7S66
 efo0BS/CfzdhYkaRVMVDNOZA;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vE6HR-00Bcfz-00; Wed, 29 Oct 2025 13:32:01 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v2 095/127] smb: server: make use of
 smbdirect_connection_disconnect_work()
Date: Wed, 29 Oct 2025 14:21:13 +0100
Message-ID: <762f2fbc1b1dbd5fb1484bb8d550ddeb7e6aacd5.1761742839.git.metze@samba.org>
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
 Tom Talpey <tom@talpey.com>, Namjae Jeon <linkinjeon@kernel.org>,
 Steve French <stfrench@microsoft.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Note smbdirect_socket_prepare_create() already calls INIT_WORK()
with smbdirect_connection_disconnect_work.

Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
Signed-off-by: Steve French <stfrench@microsoft.com>
---
 fs/smb/server/transport_rdma.c | 70 +++-------------------------------
 1 file changed, 5 insertions(+), 65 deletions(-)

diff --git a/fs/smb/server/transport_rdma.c b/fs/smb/server/transport_rdma.c
index b78753801fe5..a649194ab6c8 100644
--- a/fs/smb/server/transport_rdma.c
+++ b/fs/smb/server/transport_rdma.c
@@ -281,64 +281,6 @@ static struct smbdirect_recv_io *get_first_reassembly(struct smbdirect_socket *s
 		return NULL;
 }
 
-static void smb_direct_disconnect_rdma_work(struct work_struct *work)
-{
-	struct smbdirect_socket *sc =
-		container_of(work, struct smbdirect_socket, disconnect_work);
-
-	/*
-	 * make sure this and other work is not queued again
-	 * but here we don't block and avoid
-	 * disable[_delayed]_work_sync()
-	 */
-	disable_work(&sc->disconnect_work);
-	disable_work(&sc->recv_io.posted.refill_work);
-	disable_delayed_work(&sc->idle.timer_work);
-	disable_work(&sc->idle.immediate_work);
-
-	if (sc->first_error == 0)
-		sc->first_error = -ECONNABORTED;
-
-	switch (sc->status) {
-	case SMBDIRECT_SOCKET_NEGOTIATE_NEEDED:
-	case SMBDIRECT_SOCKET_NEGOTIATE_RUNNING:
-	case SMBDIRECT_SOCKET_NEGOTIATE_FAILED:
-	case SMBDIRECT_SOCKET_CONNECTED:
-	case SMBDIRECT_SOCKET_ERROR:
-		sc->status = SMBDIRECT_SOCKET_DISCONNECTING;
-		rdma_disconnect(sc->rdma.cm_id);
-		break;
-
-	case SMBDIRECT_SOCKET_CREATED:
-	case SMBDIRECT_SOCKET_RESOLVE_ADDR_NEEDED:
-	case SMBDIRECT_SOCKET_RESOLVE_ADDR_RUNNING:
-	case SMBDIRECT_SOCKET_RESOLVE_ADDR_FAILED:
-	case SMBDIRECT_SOCKET_RESOLVE_ROUTE_NEEDED:
-	case SMBDIRECT_SOCKET_RESOLVE_ROUTE_RUNNING:
-	case SMBDIRECT_SOCKET_RESOLVE_ROUTE_FAILED:
-	case SMBDIRECT_SOCKET_RDMA_CONNECT_NEEDED:
-	case SMBDIRECT_SOCKET_RDMA_CONNECT_RUNNING:
-	case SMBDIRECT_SOCKET_RDMA_CONNECT_FAILED:
-		/*
-		 * rdma_accept() never reached
-		 * RDMA_CM_EVENT_ESTABLISHED
-		 */
-		sc->status = SMBDIRECT_SOCKET_DISCONNECTED;
-		break;
-
-	case SMBDIRECT_SOCKET_DISCONNECTING:
-	case SMBDIRECT_SOCKET_DISCONNECTED:
-	case SMBDIRECT_SOCKET_DESTROYED:
-		break;
-	}
-
-	/*
-	 * Wake up all waiters in all wait queues
-	 * in order to notice the broken connection.
-	 */
-	smbdirect_connection_wake_up_all(sc);
-}
-
 static void
 smb_direct_disconnect_rdma_connection(struct smbdirect_socket *sc)
 {
@@ -475,8 +417,6 @@ static struct smb_direct_transport *alloc_transport(struct rdma_cm_id *cm_id)
 	 */
 	sp = &sc->parameters;
 
-	INIT_WORK(&sc->disconnect_work, smb_direct_disconnect_rdma_work);
-
 	sc->rdma.cm_id = cm_id;
 	cm_id->context = sc;
 
@@ -513,7 +453,7 @@ static void free_transport(struct smb_direct_transport *t)
 
 	disable_work_sync(&sc->disconnect_work);
 	if (sc->status < SMBDIRECT_SOCKET_DISCONNECTING)
-		smb_direct_disconnect_rdma_work(&sc->disconnect_work);
+		smbdirect_connection_disconnect_work(&sc->disconnect_work);
 	if (sc->status < SMBDIRECT_SOCKET_DISCONNECTED)
 		wait_event(sc->status_wait, sc->status == SMBDIRECT_SOCKET_DISCONNECTED);
 
@@ -522,7 +462,7 @@ static void free_transport(struct smb_direct_transport *t)
 	 * in order to notice the broken connection.
 	 *
 	 * Most likely this was already called via
-	 * smb_direct_disconnect_rdma_work(), but call it again...
+	 * smbdirect_connection_disconnect_work(), but call it again...
 	 */
 	smbdirect_connection_wake_up_all(sc);
 
@@ -1773,7 +1713,7 @@ static void smb_direct_shutdown(struct ksmbd_transport *t)
 
 	ksmbd_debug(RDMA, "smb-direct shutdown cm_id=%p\n", sc->rdma.cm_id);
 
-	smb_direct_disconnect_rdma_work(&sc->disconnect_work);
+	smbdirect_connection_disconnect_work(&sc->disconnect_work);
 }
 
 static int smb_direct_cm_handler(struct rdma_cm_id *cm_id,
@@ -1794,14 +1734,14 @@ static int smb_direct_cm_handler(struct rdma_cm_id *cm_id,
 	case RDMA_CM_EVENT_DEVICE_REMOVAL:
 	case RDMA_CM_EVENT_DISCONNECTED: {
 		sc->status = SMBDIRECT_SOCKET_DISCONNECTED;
-		smb_direct_disconnect_rdma_work(&sc->disconnect_work);
+		smbdirect_connection_disconnect_work(&sc->disconnect_work);
 		if (sc->ib.qp)
 			ib_drain_qp(sc->ib.qp);
 		break;
 	}
 	case RDMA_CM_EVENT_CONNECT_ERROR: {
 		sc->status = SMBDIRECT_SOCKET_DISCONNECTED;
-		smb_direct_disconnect_rdma_work(&sc->disconnect_work);
+		smbdirect_connection_disconnect_work(&sc->disconnect_work);
 		break;
 	}
 	default:
-- 
2.43.0


