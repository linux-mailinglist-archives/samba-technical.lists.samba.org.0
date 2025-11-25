Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id C1286C86834
	for <lists+samba-technical@lfdr.de>; Tue, 25 Nov 2025 19:13:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=QS9GoDQ1rh9VRVeM8776IqDFlvfcs/cTHrcAYyciI1Y=; b=b7GqTpokX36gU/9r8OwJHxxmey
	/JJkmiZ7LIQDbQ+/8456X1KxwUyNPFVjr1RSfJ5oI90MawH1v4TnVNBU2M9wv6wZ/yGQdGDpek+/f
	HXIdYyMB3PjPTRlwmsrsyCLs4SIlaM/De1x4+IvFJ7JUnO8YQbFZVS8+WEoXjyeZNvBs5igIrkm0J
	+HjskbioaA4U1Zq0LXTfM3jcGa2zrdl489Er52lsgswpftdfoTrFqAyoQ2fonI3yYu7e4+QeyrNoy
	i05pKR2HYL7S0fyb4lCTyT1e7q28yfhiJLui7xsNanZM1gLCq9NHDWdHUYgiNFhBYxhcagHtqgGaq
	Ybc3aXwg==;
Received: from ip6-localhost ([::1]:31530 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vNxXK-00DBf8-Ey; Tue, 25 Nov 2025 18:13:11 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:38572) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vNxR3-00D9ej-KM
 for samba-technical@lists.samba.org; Tue, 25 Nov 2025 18:06:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=QS9GoDQ1rh9VRVeM8776IqDFlvfcs/cTHrcAYyciI1Y=; b=p245cYkRt8E9cEF6Y1b3RKt/Kg
 tEegB/ofbPmlE5EQkZ7ROMfe119fXlqxiD83bJw3lUKJJLRWrYBat9IbR9D7dnAfJWuxuzMXBzTLI
 QnZO2ehW0lwd4h7sVCkm423SluYOvmAr37CCtCgkSSJuaJMZ4icHEVQTYxFDknDDoaZmPLvYigXy4
 NqbG7NKw/L89Gp1cY1VQeUBVI6xawT3TqOuzhh1nkaruoyJyGsfpv1Vb89AaitYlzX0bj5Xf1h6fN
 /lPinBDAvVLMSK7KfohTG9axXJATgk94mGafjzFD/p2PB/ju1dgKaTjUxejta0ZlLS6N376m6Qpk+
 0394+nqVy6NY22sACNltZpFjwgRDlZdifRMag4FMrRsGCMGQQkcZyABydLhHzOPsC721nQ05geY0a
 fbsbid2a3W2zMJKiS21WrM9bsJ+uEYiqBHVtKcGPdSLU1YbR2X7xjKdnCPgEWK7RPpPJWzekkKS2b
 fbgZHrAOyiQEpKEuyXcOTks9;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vNxO1-00Fdce-0U; Tue, 25 Nov 2025 18:03:33 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v4 065/145] smb: client: make use of
 smbdirect_socket_cleanup_work()
Date: Tue, 25 Nov 2025 18:55:11 +0100
Message-ID: <91d51cd9289d61d24469799c22892b9ab32696ff.1764091285.git.metze@samba.org>
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

Note smbdirect_socket_prepare_create() already calls INIT_WORK()
with smbdirect_socket_cleanup_work.

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
index 33f3cbc0bbd9..1ad34066fbcb 100644
--- a/fs/smb/client/smbdirect.c
+++ b/fs/smb/client/smbdirect.c
@@ -216,65 +216,6 @@ do {									\
 #define log_rdma_mr(level, fmt, args...) \
 		log_rdma(level, LOG_RDMA_MR, fmt, ##args)
 
-static void smbd_disconnect_rdma_work(struct work_struct *work)
-{
-	struct smbdirect_socket *sc =
-		container_of(work, struct smbdirect_socket, disconnect_work);
-
-	if (sc->first_error == 0)
-		sc->first_error = -ECONNABORTED;
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
-	smbdirect_socket_wake_up_all(sc);
-}
-
 static void smbd_disconnect_rdma_connection(struct smbdirect_socket *sc)
 {
 	if (sc->first_error == 0)
@@ -373,13 +314,13 @@ static int smbd_conn_upcall(
 	case RDMA_CM_EVENT_ADDR_ERROR:
 		log_rdma_event(ERR, "connecting failed event=%s\n", event_name);
 		sc->status = SMBDIRECT_SOCKET_RESOLVE_ADDR_FAILED;
-		smbd_disconnect_rdma_work(&sc->disconnect_work);
+		smbdirect_socket_cleanup_work(&sc->disconnect_work);
 		break;
 
 	case RDMA_CM_EVENT_ROUTE_ERROR:
 		log_rdma_event(ERR, "connecting failed event=%s\n", event_name);
 		sc->status = SMBDIRECT_SOCKET_RESOLVE_ROUTE_FAILED;
-		smbd_disconnect_rdma_work(&sc->disconnect_work);
+		smbdirect_socket_cleanup_work(&sc->disconnect_work);
 		break;
 
 	case RDMA_CM_EVENT_ESTABLISHED:
@@ -474,7 +415,7 @@ static int smbd_conn_upcall(
 	case RDMA_CM_EVENT_REJECTED:
 		log_rdma_event(ERR, "connecting failed event=%s\n", event_name);
 		sc->status = SMBDIRECT_SOCKET_RDMA_CONNECT_FAILED;
-		smbd_disconnect_rdma_work(&sc->disconnect_work);
+		smbdirect_socket_cleanup_work(&sc->disconnect_work);
 		break;
 
 	case RDMA_CM_EVENT_DEVICE_REMOVAL:
@@ -485,7 +426,7 @@ static int smbd_conn_upcall(
 		}
 
 		sc->status = SMBDIRECT_SOCKET_DISCONNECTED;
-		smbd_disconnect_rdma_work(&sc->disconnect_work);
+		smbdirect_socket_cleanup_work(&sc->disconnect_work);
 		break;
 
 	default:
@@ -1634,7 +1575,7 @@ void smbd_destroy(struct TCP_Server_Info *server)
 
 	log_rdma_event(INFO, "destroying rdma session\n");
 	if (sc->status < SMBDIRECT_SOCKET_DISCONNECTING)
-		smbd_disconnect_rdma_work(&sc->disconnect_work);
+		smbdirect_socket_cleanup_work(&sc->disconnect_work);
 	if (sc->status < SMBDIRECT_SOCKET_DISCONNECTED) {
 		log_rdma_event(INFO, "wait for transport being disconnected\n");
 		wait_event(sc->status_wait, sc->status == SMBDIRECT_SOCKET_DISCONNECTED);
@@ -1646,7 +1587,7 @@ void smbd_destroy(struct TCP_Server_Info *server)
 	 * in order to notice the broken connection.
 	 *
 	 * Most likely this was already called via
-	 * smbd_disconnect_rdma_work(), but call it again...
+	 * smbdirect_socket_cleanup_work(), but call it again...
 	 */
 	smbdirect_socket_wake_up_all(sc);
 
@@ -1868,8 +1809,6 @@ static struct smbd_connection *_smbd_get_connection(
 	 */
 	sp = &sc->parameters;
 
-	INIT_WORK(&sc->disconnect_work, smbd_disconnect_rdma_work);
-
 	rc = smbd_ia_open(sc, dstaddr, port);
 	if (rc) {
 		log_rdma_event(INFO, "smbd_ia_open rc=%d\n", rc);
-- 
2.43.0


