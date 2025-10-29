Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B99AC1AC6E
	for <lists+samba-technical@lfdr.de>; Wed, 29 Oct 2025 14:38:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=ewn7hEpn46xqrg3f/aglcZOHkTJEgenulzg1xHIIinU=; b=wKSTb4r8qr6wL7MOpOnXb2X4VQ
	CdqxlnZL+OR2yyDwd297yg07Dzbi6l/ibgx7wWlwxroK+7ZGnHGUcllmtRaznsJn6kHh6mNg0ILiQ
	0sTS5eVJwuxNKaup9fsVwqsEQ7aJSfmEdxTzSvxeFwa2DCQOO54rn8W2sLW36ghl0jrtopcVAbvMm
	RKXe33JKd/2oJYIdIqnhXZ7ezUc3s/gNQ7chLH9ABldSdXe7g9CzKPa1sBbO/vFywOzNnYwjQCzzr
	69OrWddmho7AxR1pagyhGI2pU9k/ftDGHvO2oCKPPXvVgiQmXkjcDubxCj+VrrtFc1a8oFC/ZvxbI
	tDXfEBlA==;
Received: from ip6-localhost ([::1]:23730 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vE6NF-009A5Z-Uu; Wed, 29 Oct 2025 13:38:03 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:26704) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vE6Dy-0096yP-Gu
 for samba-technical@lists.samba.org; Wed, 29 Oct 2025 13:28:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=ewn7hEpn46xqrg3f/aglcZOHkTJEgenulzg1xHIIinU=; b=LD7ot6wbX9Xki36CB3zagXZ+lU
 pkSKdNYyTHXHsW38V2CozJ6/tcJEb9dtftw+9bcR5lB29FaDcLx+ye3QLbO0Obb7K5yN6QpXSVr5c
 AMWfEtAntLH2Dqmwq8MPPNm6M0OQloNOYEJnYlXiREXBF4cRsMP5GOBw1csW+qJM3yiObVYoYVgqq
 lM4bnQC1PpYUkH1PkCIEND/A32ifhPSRPuZMSFxYgrWaYncytxTbeQAbH4cU0mwqpGYn2blEohWuo
 4qUd+WAuqv7tC2QAXQGtEA31Y8D6p6o+JSTUZmMShbt3LqOP8e3KwfpM5QhjBTRLkKz/yhnfdZaE0
 76dOtr1kMhNGdVwrTIs5JqLZaNwK2IeJG6a394j1CGa9Kmk5HWxJpT3qU41600apeB47dMeNipEMB
 1zDyW2j35AmKgtsqHr4c+6Ac43h1qSrplliX013G7SW69iRCqZdT3qjbMHow/2dvzlhb8FmTpzWOo
 7M9psWKOjQSv94Eer5ggRT4J;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vE6Dv-00Bc5W-2p; Wed, 29 Oct 2025 13:28:23 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v2 060/127] smb: client: make use of
 smbdirect_connection_disconnect_work()
Date: Wed, 29 Oct 2025 14:20:38 +0100
Message-ID: <af982eebbb96f3d8c4b4c26fcebdc882d9f1859a.1761742839.git.metze@samba.org>
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

Note smbdirect_socket_prepare_create() already calls INIT_WORK()
with smbdirect_connection_disconnect_work.

Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: Long Li <longli@microsoft.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
Signed-off-by: Steve French <stfrench@microsoft.com>
---
 fs/smb/client/smbdirect.c | 73 ++++-----------------------------------
 1 file changed, 6 insertions(+), 67 deletions(-)

diff --git a/fs/smb/client/smbdirect.c b/fs/smb/client/smbdirect.c
index c6f2bb5fc262..137fad17e5a1 100644
--- a/fs/smb/client/smbdirect.c
+++ b/fs/smb/client/smbdirect.c
@@ -213,65 +213,6 @@ do {									\
 #define log_rdma_mr(level, fmt, args...) \
 		log_rdma(level, LOG_RDMA_MR, fmt, ##args)
 
-static void smbd_disconnect_rdma_work(struct work_struct *work)
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
-	disable_work(&sc->mr_io.recovery_work);
-	disable_work(&sc->idle.immediate_work);
-	disable_delayed_work(&sc->idle.timer_work);
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
-		 * rdma_connect() never reached
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
 static void smbd_disconnect_rdma_connection(struct smbdirect_socket *sc)
 {
 	/*
@@ -366,14 +307,14 @@ static int smbd_conn_upcall(
 		log_rdma_event(ERR, "connecting failed event=%s\n", event_name);
 		WARN_ON_ONCE(sc->status != SMBDIRECT_SOCKET_RESOLVE_ADDR_RUNNING);
 		sc->status = SMBDIRECT_SOCKET_RESOLVE_ADDR_FAILED;
-		smbd_disconnect_rdma_work(&sc->disconnect_work);
+		smbdirect_connection_disconnect_work(&sc->disconnect_work);
 		break;
 
 	case RDMA_CM_EVENT_ROUTE_ERROR:
 		log_rdma_event(ERR, "connecting failed event=%s\n", event_name);
 		WARN_ON_ONCE(sc->status != SMBDIRECT_SOCKET_RESOLVE_ROUTE_RUNNING);
 		sc->status = SMBDIRECT_SOCKET_RESOLVE_ROUTE_FAILED;
-		smbd_disconnect_rdma_work(&sc->disconnect_work);
+		smbdirect_connection_disconnect_work(&sc->disconnect_work);
 		break;
 
 	case RDMA_CM_EVENT_ESTABLISHED:
@@ -468,7 +409,7 @@ static int smbd_conn_upcall(
 		log_rdma_event(ERR, "connecting failed event=%s\n", event_name);
 		WARN_ON_ONCE(sc->status != SMBDIRECT_SOCKET_RDMA_CONNECT_RUNNING);
 		sc->status = SMBDIRECT_SOCKET_RDMA_CONNECT_FAILED;
-		smbd_disconnect_rdma_work(&sc->disconnect_work);
+		smbdirect_connection_disconnect_work(&sc->disconnect_work);
 		break;
 
 	case RDMA_CM_EVENT_DEVICE_REMOVAL:
@@ -479,7 +420,7 @@ static int smbd_conn_upcall(
 		}
 
 		sc->status = SMBDIRECT_SOCKET_DISCONNECTED;
-		smbd_disconnect_rdma_work(&sc->disconnect_work);
+		smbdirect_connection_disconnect_work(&sc->disconnect_work);
 		break;
 
 	default:
@@ -1625,7 +1566,7 @@ void smbd_destroy(struct TCP_Server_Info *server)
 
 	log_rdma_event(INFO, "destroying rdma session\n");
 	if (sc->status < SMBDIRECT_SOCKET_DISCONNECTING)
-		smbd_disconnect_rdma_work(&sc->disconnect_work);
+		smbdirect_connection_disconnect_work(&sc->disconnect_work);
 	if (sc->status < SMBDIRECT_SOCKET_DISCONNECTED) {
 		log_rdma_event(INFO, "wait for transport being disconnected\n");
 		wait_event(sc->status_wait, sc->status == SMBDIRECT_SOCKET_DISCONNECTED);
@@ -1637,7 +1578,7 @@ void smbd_destroy(struct TCP_Server_Info *server)
 	 * in order to notice the broken connection.
 	 *
 	 * Most likely this was already called via
-	 * smbd_disconnect_rdma_work(), but call it again...
+	 * smbdirect_connection_disconnect_work(), but call it again...
 	 */
 	smbdirect_connection_wake_up_all(sc);
 
@@ -1859,8 +1800,6 @@ static struct smbd_connection *_smbd_get_connection(
 	 */
 	sp = &sc->parameters;
 
-	INIT_WORK(&sc->disconnect_work, smbd_disconnect_rdma_work);
-
 	rc = smbd_ia_open(sc, dstaddr, port);
 	if (rc) {
 		log_rdma_event(INFO, "smbd_ia_open rc=%d\n", rc);
-- 
2.43.0


