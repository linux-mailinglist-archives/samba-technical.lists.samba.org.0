Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BEBAC85636
	for <lists+samba-technical@lfdr.de>; Tue, 25 Nov 2025 15:23:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=ckxi+Ny6Ssn+nYf4B+DC4jJuzF+9RijXAfEiulV6/fc=; b=wlrlRKTmr3SfkGCJ+nLJil1iwj
	RllXKJ2K2cqsmoIPrcFHBd4kt4qoaMKb1eKMmgv68PP4iEo1zDnNXGM4YVWk0AaBLr/8FGWnN7QZp
	PMLqXotsAIkWHiX6+e9OKZ8UdiM3TKf/O7ZKVdaAvlRZdb+52DjuxCPi1er2s0AnL/IV6HCJxbdEW
	Sii2s95aq/nwV+kxHMyzdjKzFd6h9uEgtf6Y+QSj3pJOheosBHZU07xDe2ZPLp85KdbcCJ4fWtq39
	LaWscmoi1nnHmUPURq/Yuo60fdJl6orfx6HpxJMEjBeZsRImzgkeyT8jvj7mTQHk91WraUpuayx+I
	8Ajge8YA==;
Received: from ip6-localhost ([::1]:54190 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vNtwH-00D5ik-55; Tue, 25 Nov 2025 14:22:41 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:29422) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vNtw1-00D5e6-MU
 for samba-technical@lists.samba.org; Tue, 25 Nov 2025 14:22:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=ckxi+Ny6Ssn+nYf4B+DC4jJuzF+9RijXAfEiulV6/fc=; b=f/hfujGuOo18/8CyHkWp5Bngvu
 ch1SouJpzEyOEbSyHOdZPQ1K8MEeewUSiwHus2Fi51CbrVWGFOMca2tH7PAr3yA91SxfQ6eVXz5ty
 pC1A2mFPfRUpdgLgKqscwbFzglthq+D5qWKSG8jCntDWlyZQWtv+5aaXyIlU28kSrUXuVQXI3jGJ0
 SUMuWFlOKtIEY9SBIDW2OTU4UP+Cm3zHkA64F5iNI/h4/mW59odk9RmgCi7Pl2Z0LEjfnvtGMR2K7
 keNEO/9fCb+Br+TEw0vuflIF+VEEnC45fPHIZoxFqpuIisAq3x/uzMdG+4z3MmYOLz2rr7O+j+Vn7
 hIusIPvzXbtiRoahxnwvbag/hnK28kYeRBKT0rLkp1VcyaR1KYlKutJX+vUz2HOe3KEftT3ixgs/B
 7SeXzaQ1+/m7Xoj+AuaZ2zBLJyBHrn79hysmJ1Mxad2TkG/RCr8QGXr8jKWLgf5A4AD7hmSW/Cc01
 fEfCVrp8zBasFEYwLOCy5S+q;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vNtvz-00Fatr-01; Tue, 25 Nov 2025 14:22:23 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v3 4/4] smb: client: relax WARN_ON_ONCE(SMBDIRECT_SOCKET_*)
 checks in recv_done() and smbd_conn_upcall()
Date: Tue, 25 Nov 2025 15:21:54 +0100
Message-ID: <e4daffdf71686facd6aeaa87534584ae33f7a712.1764080338.git.metze@samba.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1764080338.git.metze@samba.org>
References: <cover.1764080338.git.metze@samba.org>
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
Cc: Tom Talpey <tom@talpey.com>, Paulo Alcantara <pc@manguebit.org>,
 metze@samba.org, Steve French <smfrench@gmail.com>,
 Namjae Jeon <linkinjeon@kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

sc->first_error might already be set and sc->status
is thus unexpected, so this should avoid the WARN[_ON]_ONCE()
if sc->first_error is already set and have a usable error path.

While there set sc->first_error as soon as possible.

This is done based on a problem seen in similar places on
the server. And there it was already very useful in order
to find the problem when we have a meaningful WARN_ONCE()
that prints details about the connection.

This is much more useful:

[  309.560973] expected[NEGOTIATE_NEEDED] != RDMA_CONNECT_RUNNING
first_error=0 local=192.168.0.200:445 remote=192.168.0.100:60445
[  309.561034] WARNING: CPU: 2 PID: 78 at transport_rdma.c:643
recv_done+0x2fa/0x3d0 [ksmbd]

than what we had before (only):

[  894.140316] WARNING: CPU: 1 PID: 116 at
fs/smb/server/transport_rdma.c:642 recv_done+0x308/0x360 [ksmbd]

Fixes: 58dfba8a2d4e ("smb: client/smbdirect: replace SMBDIRECT_SOCKET_CONNECTING with more detailed states")
Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: Long Li <longli@microsoft.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: Paulo Alcantara <pc@manguebit.org>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
---
 fs/smb/client/smbdirect.c | 28 +++++++++++++++-------------
 1 file changed, 15 insertions(+), 13 deletions(-)

diff --git a/fs/smb/client/smbdirect.c b/fs/smb/client/smbdirect.c
index c6c428c2e08d..788a0670c4a8 100644
--- a/fs/smb/client/smbdirect.c
+++ b/fs/smb/client/smbdirect.c
@@ -7,6 +7,7 @@
 #include <linux/module.h>
 #include <linux/highmem.h>
 #include <linux/folio_queue.h>
+#define __SMBDIRECT_SOCKET_DISCONNECT(__sc) smbd_disconnect_rdma_connection(__sc)
 #include "../common/smbdirect/smbdirect_pdu.h"
 #include "smbdirect.h"
 #include "cifs_debug.h"
@@ -186,6 +187,9 @@ static void smbd_disconnect_rdma_work(struct work_struct *work)
 	struct smbdirect_socket *sc =
 		container_of(work, struct smbdirect_socket, disconnect_work);
 
+	if (sc->first_error == 0)
+		sc->first_error = -ECONNABORTED;
+
 	/*
 	 * make sure this and other work is not queued again
 	 * but here we don't block and avoid
@@ -197,9 +201,6 @@ static void smbd_disconnect_rdma_work(struct work_struct *work)
 	disable_work(&sc->idle.immediate_work);
 	disable_delayed_work(&sc->idle.timer_work);
 
-	if (sc->first_error == 0)
-		sc->first_error = -ECONNABORTED;
-
 	switch (sc->status) {
 	case SMBDIRECT_SOCKET_NEGOTIATE_NEEDED:
 	case SMBDIRECT_SOCKET_NEGOTIATE_RUNNING:
@@ -242,6 +243,9 @@ static void smbd_disconnect_rdma_work(struct work_struct *work)
 
 static void smbd_disconnect_rdma_connection(struct smbdirect_socket *sc)
 {
+	if (sc->first_error == 0)
+		sc->first_error = -ECONNABORTED;
+
 	/*
 	 * make sure other work (than disconnect_work) is
 	 * not queued again but here we don't block and avoid
@@ -252,9 +256,6 @@ static void smbd_disconnect_rdma_connection(struct smbdirect_socket *sc)
 	disable_work(&sc->idle.immediate_work);
 	disable_delayed_work(&sc->idle.timer_work);
 
-	if (sc->first_error == 0)
-		sc->first_error = -ECONNABORTED;
-
 	switch (sc->status) {
 	case SMBDIRECT_SOCKET_RESOLVE_ADDR_FAILED:
 	case SMBDIRECT_SOCKET_RESOLVE_ROUTE_FAILED:
@@ -322,27 +323,27 @@ static int smbd_conn_upcall(
 
 	switch (event->event) {
 	case RDMA_CM_EVENT_ADDR_RESOLVED:
-		WARN_ON_ONCE(sc->status != SMBDIRECT_SOCKET_RESOLVE_ADDR_RUNNING);
+		if (SMBDIRECT_CHECK_STATUS_DISCONNECT(sc, SMBDIRECT_SOCKET_RESOLVE_ADDR_RUNNING))
+			break;
 		sc->status = SMBDIRECT_SOCKET_RESOLVE_ROUTE_NEEDED;
 		wake_up(&sc->status_wait);
 		break;
 
 	case RDMA_CM_EVENT_ROUTE_RESOLVED:
-		WARN_ON_ONCE(sc->status != SMBDIRECT_SOCKET_RESOLVE_ROUTE_RUNNING);
+		if (SMBDIRECT_CHECK_STATUS_DISCONNECT(sc, SMBDIRECT_SOCKET_RESOLVE_ROUTE_RUNNING))
+			break;
 		sc->status = SMBDIRECT_SOCKET_RDMA_CONNECT_NEEDED;
 		wake_up(&sc->status_wait);
 		break;
 
 	case RDMA_CM_EVENT_ADDR_ERROR:
 		log_rdma_event(ERR, "connecting failed event=%s\n", event_name);
-		WARN_ON_ONCE(sc->status != SMBDIRECT_SOCKET_RESOLVE_ADDR_RUNNING);
 		sc->status = SMBDIRECT_SOCKET_RESOLVE_ADDR_FAILED;
 		smbd_disconnect_rdma_work(&sc->disconnect_work);
 		break;
 
 	case RDMA_CM_EVENT_ROUTE_ERROR:
 		log_rdma_event(ERR, "connecting failed event=%s\n", event_name);
-		WARN_ON_ONCE(sc->status != SMBDIRECT_SOCKET_RESOLVE_ROUTE_RUNNING);
 		sc->status = SMBDIRECT_SOCKET_RESOLVE_ROUTE_FAILED;
 		smbd_disconnect_rdma_work(&sc->disconnect_work);
 		break;
@@ -428,7 +429,8 @@ static int smbd_conn_upcall(
 					min_t(u8, sp->responder_resources,
 					      peer_responder_resources);
 
-		WARN_ON_ONCE(sc->status != SMBDIRECT_SOCKET_RDMA_CONNECT_RUNNING);
+		if (SMBDIRECT_CHECK_STATUS_DISCONNECT(sc, SMBDIRECT_SOCKET_RDMA_CONNECT_RUNNING))
+			break;
 		sc->status = SMBDIRECT_SOCKET_NEGOTIATE_NEEDED;
 		wake_up(&sc->status_wait);
 		break;
@@ -437,7 +439,6 @@ static int smbd_conn_upcall(
 	case RDMA_CM_EVENT_UNREACHABLE:
 	case RDMA_CM_EVENT_REJECTED:
 		log_rdma_event(ERR, "connecting failed event=%s\n", event_name);
-		WARN_ON_ONCE(sc->status != SMBDIRECT_SOCKET_RDMA_CONNECT_RUNNING);
 		sc->status = SMBDIRECT_SOCKET_RDMA_CONNECT_FAILED;
 		smbd_disconnect_rdma_work(&sc->disconnect_work);
 		break;
@@ -699,7 +700,8 @@ static void recv_done(struct ib_cq *cq, struct ib_wc *wc)
 		negotiate_done =
 			process_negotiation_response(response, wc->byte_len);
 		put_receive_buffer(sc, response);
-		WARN_ON_ONCE(sc->status != SMBDIRECT_SOCKET_NEGOTIATE_RUNNING);
+		if (SMBDIRECT_CHECK_STATUS_WARN(sc, SMBDIRECT_SOCKET_NEGOTIATE_RUNNING))
+			negotiate_done = false;
 		if (!negotiate_done) {
 			sc->status = SMBDIRECT_SOCKET_NEGOTIATE_FAILED;
 			smbd_disconnect_rdma_connection(sc);
-- 
2.43.0


