Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id AA01DB34C77
	for <lists+samba-technical@lfdr.de>; Mon, 25 Aug 2025 22:46:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=keWFvjkuiOcRe5T2h3Mc2mxyKtHd08zqm23vO61ityg=; b=iFaoGnd0EOpytm41sS8+2uefSS
	9P9Mo739jO93+0/YKZjbxoG3AV7FEEyy2QDQrSY5v41Mdv6vPFXzuuLfzHR2aYKU0LJOy6UuDjpPE
	uvWzyNcD/t2d9t5mF4sisWgoqGCLF2plaqWZKqTurOe3rYayaz+xuDzZOFSDS+sDJrIGJ4Qb+98p3
	KVvRkxiubH+d+VlHzApp06bd7Klsflr2kOU67IyAD60lQFOr/nfU33IA2U1qb2d5KEs56W4jLaq7M
	i9+eXcw1WmnxblozoQbGj1TtwnpuWi34plTp70+hHWUHP4XUP7+HaDQKtAhnHYUSN63K7wLQvVnhO
	K9vmJUBQ==;
Received: from ip6-localhost ([::1]:60928 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uqe5X-000Mut-16; Mon, 25 Aug 2025 20:46:48 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:53742) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uqe4O-000MXS-DA
 for samba-technical@lists.samba.org; Mon, 25 Aug 2025 20:45:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=keWFvjkuiOcRe5T2h3Mc2mxyKtHd08zqm23vO61ityg=; b=S07guctC2dSZe1OuTKCTpH+Dj5
 vZlRK1iP6T0wJW1Bof9sewq3kp71QlyZ6WDyDkhYg5m0p62PVpEfD/pgMuyS6yB4rELBkI2HrY7sq
 SynAYpWjjORfwa2Mb8WOs2eR2dyypAzTT6oBekr/av+ew8uLxJSL0UFT9YvKxD0q/T+Ka0VcaFDIs
 +7fMRykpcnWjGxIM9oQwEnLqgZYaBxk6w8u7POxYUtc9x5Yva0zIj047OjfmcxdvcMOw0qGs7xFZJ
 WFMk4FNIe0UKiTfSxMIPeZTYIMV3HziyKuNqdAScMlb8wkE+ZXHKouFHek1CqXHsnVMUavOhF+1pq
 EpXiYSSOUTtoo1qoJcJ67qtDM4AfCXLgFkKytyW8IYMZnzfnyi/Lj6uObTZUO3rDjdHHXuWiRtuDe
 Nzzl19Cu7QXkatf1kNLZnHZI47VynAb2VS4RlYVHVQkXO1e4ZxjCUwxZhVCRMMilC9EQuEyyO/3ar
 Hw38KWk506DuVgXsnw6Mdk4E;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uqe4J-000jtU-20; Mon, 25 Aug 2025 20:45:31 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v4 022/142] smb: client: make use of
 smbdirect_socket.status_wait
Date: Mon, 25 Aug 2025 22:39:43 +0200
Message-ID: <9fd8512a8b8e1717ff0f0f7deb0453ac90092b0e.1756139607.git.metze@samba.org>
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
 Tom Talpey <tom@talpey.com>, Steve French <stfrench@microsoft.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This will allow us to have common helper functions soon.

Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: Long Li <longli@microsoft.com>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
Signed-off-by: Steve French <stfrench@microsoft.com>
---
 fs/smb/client/smbdirect.c | 32 ++++++++++++++++----------------
 fs/smb/client/smbdirect.h |  2 --
 2 files changed, 16 insertions(+), 18 deletions(-)

diff --git a/fs/smb/client/smbdirect.c b/fs/smb/client/smbdirect.c
index 8d1b6e36412c..f28110c7a30f 100644
--- a/fs/smb/client/smbdirect.c
+++ b/fs/smb/client/smbdirect.c
@@ -216,27 +216,27 @@ static int smbd_conn_upcall(
 	case RDMA_CM_EVENT_ADDR_RESOLVED:
 		WARN_ON_ONCE(sc->status != SMBDIRECT_SOCKET_RESOLVE_ADDR_RUNNING);
 		sc->status = SMBDIRECT_SOCKET_RESOLVE_ROUTE_NEEDED;
-		wake_up_interruptible(&info->status_wait);
+		wake_up_interruptible(&sc->status_wait);
 		break;
 
 	case RDMA_CM_EVENT_ROUTE_RESOLVED:
 		WARN_ON_ONCE(sc->status != SMBDIRECT_SOCKET_RESOLVE_ROUTE_RUNNING);
 		sc->status = SMBDIRECT_SOCKET_RDMA_CONNECT_NEEDED;
-		wake_up_interruptible(&info->status_wait);
+		wake_up_interruptible(&sc->status_wait);
 		break;
 
 	case RDMA_CM_EVENT_ADDR_ERROR:
 		log_rdma_event(ERR, "connecting failed event=%s\n", event_name);
 		WARN_ON_ONCE(sc->status != SMBDIRECT_SOCKET_RESOLVE_ADDR_RUNNING);
 		sc->status = SMBDIRECT_SOCKET_RESOLVE_ADDR_FAILED;
-		wake_up_interruptible(&info->status_wait);
+		wake_up_interruptible(&sc->status_wait);
 		break;
 
 	case RDMA_CM_EVENT_ROUTE_ERROR:
 		log_rdma_event(ERR, "connecting failed event=%s\n", event_name);
 		WARN_ON_ONCE(sc->status != SMBDIRECT_SOCKET_RESOLVE_ROUTE_RUNNING);
 		sc->status = SMBDIRECT_SOCKET_RESOLVE_ROUTE_FAILED;
-		wake_up_interruptible(&info->status_wait);
+		wake_up_interruptible(&sc->status_wait);
 		break;
 
 	case RDMA_CM_EVENT_ESTABLISHED:
@@ -296,7 +296,7 @@ static int smbd_conn_upcall(
 
 		WARN_ON_ONCE(sc->status != SMBDIRECT_SOCKET_RDMA_CONNECT_RUNNING);
 		sc->status = SMBDIRECT_SOCKET_NEGOTIATE_NEEDED;
-		wake_up_interruptible(&info->status_wait);
+		wake_up_interruptible(&sc->status_wait);
 		break;
 
 	case RDMA_CM_EVENT_CONNECT_ERROR:
@@ -305,7 +305,7 @@ static int smbd_conn_upcall(
 		log_rdma_event(ERR, "connecting failed event=%s\n", event_name);
 		WARN_ON_ONCE(sc->status != SMBDIRECT_SOCKET_RDMA_CONNECT_RUNNING);
 		sc->status = SMBDIRECT_SOCKET_RDMA_CONNECT_FAILED;
-		wake_up_interruptible(&info->status_wait);
+		wake_up_interruptible(&sc->status_wait);
 		break;
 
 	case RDMA_CM_EVENT_DEVICE_REMOVAL:
@@ -314,12 +314,12 @@ static int smbd_conn_upcall(
 		if (sc->status == SMBDIRECT_SOCKET_NEGOTIATE_FAILED) {
 			log_rdma_event(ERR, "event=%s during negotiation\n", event_name);
 			sc->status = SMBDIRECT_SOCKET_DISCONNECTED;
-			wake_up(&info->status_wait);
+			wake_up(&sc->status_wait);
 			break;
 		}
 
 		sc->status = SMBDIRECT_SOCKET_DISCONNECTED;
-		wake_up_interruptible(&info->status_wait);
+		wake_up_interruptible(&sc->status_wait);
 		wake_up_interruptible(&sc->recv_io.reassembly.wait_queue);
 		wake_up_interruptible_all(&info->wait_send_queue);
 		break;
@@ -580,7 +580,7 @@ static void recv_done(struct ib_cq *cq, struct ib_wc *wc)
 		else
 			sc->status = SMBDIRECT_SOCKET_CONNECTED;
 
-		wake_up_interruptible(&info->status_wait);
+		wake_up_interruptible(&sc->status_wait);
 		return;
 
 	/* SMBD data transfer packet */
@@ -684,7 +684,7 @@ static struct rdma_cm_id *smbd_create_id(
 		goto out;
 	}
 	rc = wait_event_interruptible_timeout(
-		info->status_wait,
+		sc->status_wait,
 		sc->status != SMBDIRECT_SOCKET_RESOLVE_ADDR_RUNNING,
 		msecs_to_jiffies(RDMA_RESOLVE_TIMEOUT));
 	/* e.g. if interrupted returns -ERESTARTSYS */
@@ -711,7 +711,7 @@ static struct rdma_cm_id *smbd_create_id(
 		goto out;
 	}
 	rc = wait_event_interruptible_timeout(
-		info->status_wait,
+		sc->status_wait,
 		sc->status != SMBDIRECT_SOCKET_RESOLVE_ROUTE_RUNNING,
 		msecs_to_jiffies(RDMA_RESOLVE_TIMEOUT));
 	/* e.g. if interrupted returns -ERESTARTSYS */
@@ -1218,7 +1218,7 @@ static int smbd_negotiate(struct smbd_connection *info)
 		return rc;
 
 	rc = wait_event_interruptible_timeout(
-		info->status_wait,
+		sc->status_wait,
 		sc->status != SMBDIRECT_SOCKET_NEGOTIATE_RUNNING,
 		secs_to_jiffies(SMBD_NEGOTIATE_TIMEOUT));
 	log_rdma_event(INFO, "wait_event_interruptible_timeout rc=%d\n", rc);
@@ -1445,7 +1445,7 @@ void smbd_destroy(struct TCP_Server_Info *server)
 		rdma_disconnect(sc->rdma.cm_id);
 		log_rdma_event(INFO, "wait for transport being disconnected\n");
 		wait_event_interruptible(
-			info->status_wait,
+			sc->status_wait,
 			sc->status == SMBDIRECT_SOCKET_DISCONNECTED);
 	}
 
@@ -1659,7 +1659,7 @@ static struct smbd_connection *_smbd_get_connection(
 	info->initiator_depth = 1;
 	info->responder_resources = SMBD_CM_RESPONDER_RESOURCES;
 
-	init_waitqueue_head(&info->status_wait);
+	init_waitqueue_head(&sc->status_wait);
 
 	sc->status = SMBDIRECT_SOCKET_CREATED;
 	rc = smbd_ia_open(info, dstaddr, port);
@@ -1782,7 +1782,7 @@ static struct smbd_connection *_smbd_get_connection(
 	}
 
 	wait_event_interruptible_timeout(
-		info->status_wait,
+		sc->status_wait,
 		sc->status != SMBDIRECT_SOCKET_RDMA_CONNECT_RUNNING,
 		msecs_to_jiffies(RDMA_RESOLVE_TIMEOUT));
 
@@ -1839,7 +1839,7 @@ static struct smbd_connection *_smbd_get_connection(
 	destroy_caches_and_workqueue(info);
 	sc->status = SMBDIRECT_SOCKET_NEGOTIATE_FAILED;
 	rdma_disconnect(sc->rdma.cm_id);
-	wait_event(info->status_wait,
+	wait_event(sc->status_wait,
 		sc->status == SMBDIRECT_SOCKET_DISCONNECTED);
 
 allocate_cache_failed:
diff --git a/fs/smb/client/smbdirect.h b/fs/smb/client/smbdirect.h
index 82b1d936e800..f250241d2d24 100644
--- a/fs/smb/client/smbdirect.h
+++ b/fs/smb/client/smbdirect.h
@@ -45,8 +45,6 @@ enum keep_alive_status {
 struct smbd_connection {
 	struct smbdirect_socket socket;
 
-	wait_queue_head_t status_wait;
-
 	struct work_struct disconnect_work;
 	struct work_struct post_send_credits_work;
 
-- 
2.43.0


