Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E289B1EBEF
	for <lists+samba-technical@lfdr.de>; Fri,  8 Aug 2025 17:29:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=eXbsRj8mKE/T03oWx7kMbqx7HXKNiF6SvCybERyXI+k=; b=Y3cbaAGVYKakcEusCvHhjN++w6
	jIy0feFIS3VtVsnq5OTHgd9TA2xargbhj9YhtSiPblc/hftcyp38OvMSb37IuNNdzrepDVj6K85DZ
	Ywr/Fyw5TQCN198XXbcKcXe2HB2Ip9fT9X60ut9tVebz7iu8vd8tgZFNuRpDn2z0z24wt8mIE0wiv
	qGb5t9b1F6a9t1kvRY01eAk96yQyqcWgvCGgq/uWOmE9/xyqgwCT0HMhzIQmYCGDmZLTMtbM8dWk7
	Oj1Je1wA0/kLsetTV8Rus2RdjmWxNrBR8Qtf35bYEyPs9WL7edoCP39B1P0pGUePJ7xMVADDtuW8l
	PDnuDEdg==;
Received: from ip6-localhost ([::1]:35256 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ukP24-00EgWL-Mb; Fri, 08 Aug 2025 15:29:25 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:20644) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1ukP1W-00EgLf-D4
 for samba-technical@lists.samba.org; Fri, 08 Aug 2025 15:28:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=eXbsRj8mKE/T03oWx7kMbqx7HXKNiF6SvCybERyXI+k=; b=EkF/cLVet45WFQmEQSxzkjP3V5
 U4dMTyMCoxjQ87OzOmnhIp96mlTbzqCj+qMQFgNvT/AWMkgnHD+F2PPmek27zQglYBZ+rIH+/IURv
 tNulFPS6ddCP+w7XIvfDUvF6xhRRjyp2Y3F8MJkWB9wDBd8lIt6PwnEDFBAw8j4Tajwaveqbx/dWb
 n3/4VX0K8qtYrH2jDfR8MZvoppb1swIR/xHPsy7ACS8XKox6t6p+KKluxtGfaEZBVURAYAF5CLTvL
 kiteSwl8Eza62DTvjTRrQBxc4KHKGDcEAIwxsNhUayiS398l5OqRU6PZj9X/9AWlwmnm0R/dvrFC2
 TkdttqmdZWViHm9PnmIvIs/Buj8AFDVtg8iEyCNw6FfTluvnFEHjtf4d/Sq0C66JuCKg+kPVCq8jS
 WXpAtxZASCl99iz92lr7oyUf0gV4EQE9oGZx1k8GBpKi5LBr+95cmXvorLTvF9hUOkKS5UhW1cKq9
 6lqCdV8igyGGbXRvE7TaFZTT;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1ukP1T-001pQD-1c; Fri, 08 Aug 2025 15:28:47 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v2 5/9] smb: client/smbdirect: replace
 SMBDIRECT_SOCKET_CONNECTING with more detailed states
Date: Fri,  8 Aug 2025 17:28:03 +0200
Message-ID: <1d5975ad17ca39ea17d73f157edeeae7814db5d7.1754666549.git.metze@samba.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1754666549.git.metze@samba.org>
References: <cover.1754666549.git.metze@samba.org>
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

The process of reaching a functional connection regresented by
SMBDIRECT_SOCKET_CONNECTED, is more complex than using a single
SMBDIRECT_SOCKET_CONNECTING state.

This will allow us to remove a lot of special variables and
completions in the following commits.

Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: Long Li <longli@microsoft.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
Signed-off-by: Steve French <stfrench@microsoft.com>
---
 fs/smb/client/smbdirect.c                  | 44 +++++++++++++++++++---
 fs/smb/common/smbdirect/smbdirect_socket.h | 14 ++++++-
 2 files changed, 51 insertions(+), 7 deletions(-)

diff --git a/fs/smb/client/smbdirect.c b/fs/smb/client/smbdirect.c
index c628e91c328b..fd26c6202f09 100644
--- a/fs/smb/client/smbdirect.c
+++ b/fs/smb/client/smbdirect.c
@@ -185,26 +185,39 @@ static int smbd_conn_upcall(
 
 	switch (event->event) {
 	case RDMA_CM_EVENT_ADDR_RESOLVED:
+		WARN_ON_ONCE(sc->status != SMBDIRECT_SOCKET_RESOLVE_ADDR_RUNNING);
+		sc->status = SMBDIRECT_SOCKET_RESOLVE_ROUTE_NEEDED;
+		info->ri_rc = 0;
+		complete(&info->ri_done);
+		break;
+
 	case RDMA_CM_EVENT_ROUTE_RESOLVED:
+		WARN_ON_ONCE(sc->status != SMBDIRECT_SOCKET_RESOLVE_ROUTE_RUNNING);
+		sc->status = SMBDIRECT_SOCKET_RDMA_CONNECT_NEEDED;
 		info->ri_rc = 0;
 		complete(&info->ri_done);
 		break;
 
 	case RDMA_CM_EVENT_ADDR_ERROR:
 		log_rdma_event(ERR, "connecting failed event=%s\n", event_name);
+		WARN_ON_ONCE(sc->status != SMBDIRECT_SOCKET_RESOLVE_ADDR_RUNNING);
+		sc->status = SMBDIRECT_SOCKET_RESOLVE_ADDR_FAILED;
 		info->ri_rc = -EHOSTUNREACH;
 		complete(&info->ri_done);
 		break;
 
 	case RDMA_CM_EVENT_ROUTE_ERROR:
 		log_rdma_event(ERR, "connecting failed event=%s\n", event_name);
+		WARN_ON_ONCE(sc->status != SMBDIRECT_SOCKET_RESOLVE_ROUTE_RUNNING);
+		sc->status = SMBDIRECT_SOCKET_RESOLVE_ROUTE_FAILED;
 		info->ri_rc = -ENETUNREACH;
 		complete(&info->ri_done);
 		break;
 
 	case RDMA_CM_EVENT_ESTABLISHED:
 		log_rdma_event(INFO, "connected event=%s\n", event_name);
-		sc->status = SMBDIRECT_SOCKET_CONNECTED;
+		WARN_ON_ONCE(sc->status != SMBDIRECT_SOCKET_RDMA_CONNECT_RUNNING);
+		sc->status = SMBDIRECT_SOCKET_NEGOTIATE_NEEDED;
 		wake_up_interruptible(&info->status_wait);
 		break;
 
@@ -212,7 +225,8 @@ static int smbd_conn_upcall(
 	case RDMA_CM_EVENT_UNREACHABLE:
 	case RDMA_CM_EVENT_REJECTED:
 		log_rdma_event(ERR, "connecting failed event=%s\n", event_name);
-		sc->status = SMBDIRECT_SOCKET_DISCONNECTED;
+		WARN_ON_ONCE(sc->status != SMBDIRECT_SOCKET_RDMA_CONNECT_RUNNING);
+		sc->status = SMBDIRECT_SOCKET_RDMA_CONNECT_FAILED;
 		wake_up_interruptible(&info->status_wait);
 		break;
 
@@ -481,6 +495,12 @@ static void recv_done(struct ib_cq *cq, struct ib_wc *wc)
 		info->negotiate_done =
 			process_negotiation_response(response, wc->byte_len);
 		put_receive_buffer(info, response);
+		WARN_ON_ONCE(sc->status != SMBDIRECT_SOCKET_NEGOTIATE_RUNNING);
+		if (!info->negotiate_done)
+			sc->status = SMBDIRECT_SOCKET_NEGOTIATE_FAILED;
+		else
+			sc->status = SMBDIRECT_SOCKET_CONNECTED;
+
 		complete(&info->negotiate_completion);
 		return;
 
@@ -556,6 +576,7 @@ static struct rdma_cm_id *smbd_create_id(
 		struct smbd_connection *info,
 		struct sockaddr *dstaddr, int port)
 {
+	struct smbdirect_socket *sc = &info->socket;
 	struct rdma_cm_id *id;
 	int rc;
 	__be16 *sport;
@@ -578,6 +599,8 @@ static struct rdma_cm_id *smbd_create_id(
 	init_completion(&info->ri_done);
 	info->ri_rc = -ETIMEDOUT;
 
+	WARN_ON_ONCE(sc->status != SMBDIRECT_SOCKET_RESOLVE_ADDR_NEEDED);
+	sc->status = SMBDIRECT_SOCKET_RESOLVE_ADDR_RUNNING;
 	rc = rdma_resolve_addr(id, NULL, (struct sockaddr *)dstaddr,
 		RDMA_RESOLVE_TIMEOUT);
 	if (rc) {
@@ -598,6 +621,8 @@ static struct rdma_cm_id *smbd_create_id(
 	}
 
 	info->ri_rc = -ETIMEDOUT;
+	WARN_ON_ONCE(sc->status != SMBDIRECT_SOCKET_RESOLVE_ROUTE_NEEDED);
+	sc->status = SMBDIRECT_SOCKET_RESOLVE_ROUTE_RUNNING;
 	rc = rdma_resolve_route(id, RDMA_RESOLVE_TIMEOUT);
 	if (rc) {
 		log_rdma_event(ERR, "rdma_resolve_route() failed %i\n", rc);
@@ -644,6 +669,9 @@ static int smbd_ia_open(
 	struct smbdirect_socket *sc = &info->socket;
 	int rc;
 
+	WARN_ON_ONCE(sc->status != SMBDIRECT_SOCKET_CREATED);
+	sc->status = SMBDIRECT_SOCKET_RESOLVE_ADDR_NEEDED;
+
 	sc->rdma.cm_id = smbd_create_id(info, dstaddr, port);
 	if (IS_ERR(sc->rdma.cm_id)) {
 		rc = PTR_ERR(sc->rdma.cm_id);
@@ -1085,6 +1113,9 @@ static int smbd_negotiate(struct smbd_connection *info)
 	int rc;
 	struct smbdirect_recv_io *response = get_receive_buffer(info);
 
+	WARN_ON_ONCE(sc->status != SMBDIRECT_SOCKET_NEGOTIATE_NEEDED);
+	sc->status = SMBDIRECT_SOCKET_NEGOTIATE_RUNNING;
+
 	sc->recv_io.expected = SMBDIRECT_EXPECT_NEGOTIATE_REP;
 	rc = smbd_post_recv(info, response);
 	log_rdma_event(INFO, "smbd_post_recv rc=%d iov.addr=0x%llx iov.length=%u iov.lkey=0x%x\n",
@@ -1540,7 +1571,7 @@ static struct smbd_connection *_smbd_get_connection(
 	sc = &info->socket;
 	sp = &sc->parameters;
 
-	sc->status = SMBDIRECT_SOCKET_CONNECTING;
+	sc->status = SMBDIRECT_SOCKET_CREATED;
 	rc = smbd_ia_open(info, dstaddr, port);
 	if (rc) {
 		log_rdma_event(INFO, "smbd_ia_open rc=%d\n", rc);
@@ -1652,6 +1683,9 @@ static struct smbd_connection *_smbd_get_connection(
 
 	init_waitqueue_head(&info->status_wait);
 	init_waitqueue_head(&sc->recv_io.reassembly.wait_queue);
+
+	WARN_ON_ONCE(sc->status != SMBDIRECT_SOCKET_RDMA_CONNECT_NEEDED);
+	sc->status = SMBDIRECT_SOCKET_RDMA_CONNECT_RUNNING;
 	rc = rdma_connect(sc->rdma.cm_id, &conn_param);
 	if (rc) {
 		log_rdma_event(ERR, "rdma_connect() failed with %i\n", rc);
@@ -1660,10 +1694,10 @@ static struct smbd_connection *_smbd_get_connection(
 
 	wait_event_interruptible_timeout(
 		info->status_wait,
-		sc->status != SMBDIRECT_SOCKET_CONNECTING,
+		sc->status != SMBDIRECT_SOCKET_RDMA_CONNECT_RUNNING,
 		msecs_to_jiffies(RDMA_RESOLVE_TIMEOUT));
 
-	if (sc->status != SMBDIRECT_SOCKET_CONNECTED) {
+	if (sc->status != SMBDIRECT_SOCKET_NEGOTIATE_NEEDED) {
 		log_rdma_event(ERR, "rdma_connect failed port=%d\n", port);
 		goto rdma_connect_failed;
 	}
diff --git a/fs/smb/common/smbdirect/smbdirect_socket.h b/fs/smb/common/smbdirect/smbdirect_socket.h
index 3c4a8d627aa3..f43eabdd413d 100644
--- a/fs/smb/common/smbdirect/smbdirect_socket.h
+++ b/fs/smb/common/smbdirect/smbdirect_socket.h
@@ -8,9 +8,19 @@
 
 enum smbdirect_socket_status {
 	SMBDIRECT_SOCKET_CREATED,
-	SMBDIRECT_SOCKET_CONNECTING,
-	SMBDIRECT_SOCKET_CONNECTED,
+	SMBDIRECT_SOCKET_RESOLVE_ADDR_NEEDED,
+	SMBDIRECT_SOCKET_RESOLVE_ADDR_RUNNING,
+	SMBDIRECT_SOCKET_RESOLVE_ADDR_FAILED,
+	SMBDIRECT_SOCKET_RESOLVE_ROUTE_NEEDED,
+	SMBDIRECT_SOCKET_RESOLVE_ROUTE_RUNNING,
+	SMBDIRECT_SOCKET_RESOLVE_ROUTE_FAILED,
+	SMBDIRECT_SOCKET_RDMA_CONNECT_NEEDED,
+	SMBDIRECT_SOCKET_RDMA_CONNECT_RUNNING,
+	SMBDIRECT_SOCKET_RDMA_CONNECT_FAILED,
+	SMBDIRECT_SOCKET_NEGOTIATE_NEEDED,
+	SMBDIRECT_SOCKET_NEGOTIATE_RUNNING,
 	SMBDIRECT_SOCKET_NEGOTIATE_FAILED,
+	SMBDIRECT_SOCKET_CONNECTED,
 	SMBDIRECT_SOCKET_DISCONNECTING,
 	SMBDIRECT_SOCKET_DISCONNECTED,
 	SMBDIRECT_SOCKET_DESTROYED
-- 
2.43.0


