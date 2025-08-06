Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E04E6B1CB12
	for <lists+samba-technical@lfdr.de>; Wed,  6 Aug 2025 19:37:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=g1kHgwZ7mQVqKu++O+I/L1trspJXM5rBRssNx9pd/nc=; b=3gWNN1ex/bzj5zOty6JHWodw6g
	rI6SyjkOFdj4abjdOGHCGGQlj7g+AIlq+Rr+bbCcCn8swBlHC+QwFI4p0dh4H4R5w5yD3nujxYopY
	6GSmgK0kCSb/J3YAZvjZTjxibqWDdkFOu7K/1aysmUrBj31fbbmyLFRYJ2t1Xwk32AZiItUBt/ShZ
	fAweu6IQwUzQRANMRD/ABVk82oWW1Dy2FUKvm3F2l3u6R/FX8ReVtnb41lAmO3SH3uyQA5Bo38nUR
	6foiV8ZkmCVldF9E9WOE9q2mzQIyprPSNG+iAV0UrPF9AUYNVtWJSzVPgxWgns7mRUR5U1VjV+PtU
	Iv6bMzCw==;
Received: from ip6-localhost ([::1]:64576 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uji5G-00ERpS-BT; Wed, 06 Aug 2025 17:37:51 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:46196) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uji4L-00ERWE-DG
 for samba-technical@lists.samba.org; Wed, 06 Aug 2025 17:37:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=g1kHgwZ7mQVqKu++O+I/L1trspJXM5rBRssNx9pd/nc=; b=ovLNwj0q4kbj8wOJUTFyrNiUcL
 kNyqi6yravIkoDGOpCOeTtTqz4tcySxvP4U9M5wm5QLyy5Z7AiQcxBu+G4qUdPEG+5jBjkzAnWYdC
 5iskoQ5mIEbYaqCbx8kKfIWsOaexEG+uPsQ4bElBpGjkfVYYvw3LBneZmx0XsxFaFtpDspa7ED0BF
 5sWt8uCCcbS9A3+pi+AlnoR3u+nfzupBB2akJ00Qx4GC6YTkbqlSCQTsRc9S5u0FqddHCm5/nDBM5
 HRZNypJafYvzkGbxTH4nCQeL7O9qjx7sdBZDEK2ZU2I0ENnPZcq9HazL+pK4WeKEV2hzf6LHUAPH/
 aFpR9brL9jYrFDx4nDz5tAJJAWkrzf+JAdCDtgZGPUCf1jgrk4grtFCaNC8abYxqpaPN1HHVXhhvm
 6noB5bTVHCQfoMzdRugT+VG6/5Our+T27BnL9TBiI3IIPkYNiPc//62LDqzBtFGSV3L1OrkinL1Mb
 FBQwwHDUbBy4TTlu00P9eVWj;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uji4I-001OYT-0A; Wed, 06 Aug 2025 17:36:50 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH 05/18] smb: client: make use of struct smbdirect_send_io
Date: Wed,  6 Aug 2025 19:35:51 +0200
Message-ID: <1ef8960f0eb2066e8267f00f6ffda5e11d6b0867.1754501401.git.metze@samba.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1754501401.git.metze@samba.org>
References: <cover.1754501401.git.metze@samba.org>
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
 Tom Talpey <tom@talpey.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

The server will also use this soon, so that we can
split out common helper functions in future.

Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: Long Li <longli@microsoft.com>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
---
 fs/smb/client/smbdirect.c | 45 ++++++++++++++++++++-------------------
 fs/smb/client/smbdirect.h | 16 --------------
 2 files changed, 23 insertions(+), 38 deletions(-)

diff --git a/fs/smb/client/smbdirect.c b/fs/smb/client/smbdirect.c
index 5d1fa83583f6..c367efef8c7a 100644
--- a/fs/smb/client/smbdirect.c
+++ b/fs/smb/client/smbdirect.c
@@ -255,7 +255,7 @@ smbd_qp_async_error_upcall(struct ib_event *event, void *context)
 	}
 }
 
-static inline void *smbd_request_payload(struct smbd_request *request)
+static inline void *smbdirect_send_io_payload(struct smbdirect_send_io *request)
 {
 	return (void *)request->packet;
 }
@@ -269,12 +269,13 @@ static inline void *smbdirect_recv_io_payload(struct smbdirect_recv_io *response
 static void send_done(struct ib_cq *cq, struct ib_wc *wc)
 {
 	int i;
-	struct smbd_request *request =
-		container_of(wc->wr_cqe, struct smbd_request, cqe);
-	struct smbd_connection *info = request->info;
-	struct smbdirect_socket *sc = &info->socket;
+	struct smbdirect_send_io *request =
+		container_of(wc->wr_cqe, struct smbdirect_send_io, cqe);
+	struct smbdirect_socket *sc = request->socket;
+	struct smbd_connection *info =
+		container_of(sc, struct smbd_connection, socket);
 
-	log_rdma_send(INFO, "smbd_request 0x%p completed wc->status=%d\n",
+	log_rdma_send(INFO, "smbdirect_send_io 0x%p completed wc->status=%d\n",
 		request, wc->status);
 
 	for (i = 0; i < request->num_sge; i++)
@@ -291,12 +292,12 @@ static void send_done(struct ib_cq *cq, struct ib_wc *wc)
 		return;
 	}
 
-	if (atomic_dec_and_test(&request->info->send_pending))
-		wake_up(&request->info->wait_send_pending);
+	if (atomic_dec_and_test(&info->send_pending))
+		wake_up(&info->wait_send_pending);
 
-	wake_up(&request->info->wait_post_send);
+	wake_up(&info->wait_post_send);
 
-	mempool_free(request, request->info->request_mempool);
+	mempool_free(request, info->request_mempool);
 }
 
 static void dump_smbdirect_negotiate_resp(struct smbdirect_negotiate_resp *resp)
@@ -688,16 +689,16 @@ static int smbd_post_send_negotiate_req(struct smbd_connection *info)
 	struct smbdirect_socket_parameters *sp = &sc->parameters;
 	struct ib_send_wr send_wr;
 	int rc = -ENOMEM;
-	struct smbd_request *request;
+	struct smbdirect_send_io *request;
 	struct smbdirect_negotiate_req *packet;
 
 	request = mempool_alloc(info->request_mempool, GFP_KERNEL);
 	if (!request)
 		return rc;
 
-	request->info = info;
+	request->socket = sc;
 
-	packet = smbd_request_payload(request);
+	packet = smbdirect_send_io_payload(request);
 	packet->min_version = cpu_to_le16(SMBDIRECT_V1);
 	packet->max_version = cpu_to_le16(SMBDIRECT_V1);
 	packet->reserved = 0;
@@ -794,7 +795,7 @@ static int manage_keep_alive_before_sending(struct smbd_connection *info)
 
 /* Post the send request */
 static int smbd_post_send(struct smbd_connection *info,
-		struct smbd_request *request)
+		struct smbdirect_send_io *request)
 {
 	struct smbdirect_socket *sc = &info->socket;
 	struct smbdirect_socket_parameters *sp = &sc->parameters;
@@ -843,7 +844,7 @@ static int smbd_post_send_iter(struct smbd_connection *info,
 	int i, rc;
 	int header_length;
 	int data_length;
-	struct smbd_request *request;
+	struct smbdirect_send_io *request;
 	struct smbdirect_data_transfer *packet;
 	int new_credits = 0;
 
@@ -888,14 +889,14 @@ static int smbd_post_send_iter(struct smbd_connection *info,
 		goto err_alloc;
 	}
 
-	request->info = info;
+	request->socket = sc;
 	memset(request->sge, 0, sizeof(request->sge));
 
 	/* Fill in the data payload to find out how much data we can add */
 	if (iter) {
 		struct smb_extract_to_rdma extract = {
 			.nr_sge		= 1,
-			.max_sge	= SMBDIRECT_MAX_SEND_SGE,
+			.max_sge	= SMBDIRECT_SEND_IO_MAX_SGE,
 			.sge		= request->sge,
 			.device		= sc->ib.dev,
 			.local_dma_lkey	= sc->ib.pd->local_dma_lkey,
@@ -917,7 +918,7 @@ static int smbd_post_send_iter(struct smbd_connection *info,
 	}
 
 	/* Fill in the packet header */
-	packet = smbd_request_payload(request);
+	packet = smbdirect_send_io_payload(request);
 	packet->credits_requested = cpu_to_le16(sp->send_credit_target);
 
 	new_credits = manage_credits_prior_sending(info);
@@ -1447,11 +1448,11 @@ static int allocate_caches_and_workqueue(struct smbd_connection *info)
 	if (WARN_ON_ONCE(sp->max_recv_size < sizeof(struct smbdirect_data_transfer)))
 		return -ENOMEM;
 
-	scnprintf(name, MAX_NAME_LEN, "smbd_request_%p", info);
+	scnprintf(name, MAX_NAME_LEN, "smbdirect_send_io_%p", info);
 	info->request_cache =
 		kmem_cache_create(
 			name,
-			sizeof(struct smbd_request) +
+			sizeof(struct smbdirect_send_io) +
 				sizeof(struct smbdirect_data_transfer),
 			0, SLAB_HWCACHE_ALIGN, NULL);
 	if (!info->request_cache)
@@ -1562,7 +1563,7 @@ static struct smbd_connection *_smbd_get_connection(
 	sp->max_recv_size = smbd_max_receive_size;
 	sp->keepalive_interval_msec = smbd_keep_alive_interval * 1000;
 
-	if (sc->ib.dev->attrs.max_send_sge < SMBDIRECT_MAX_SEND_SGE ||
+	if (sc->ib.dev->attrs.max_send_sge < SMBDIRECT_SEND_IO_MAX_SGE ||
 	    sc->ib.dev->attrs.max_recv_sge < SMBDIRECT_RECV_IO_MAX_SGE) {
 		log_rdma_event(ERR,
 			"device %.*s max_send_sge/max_recv_sge = %d/%d too small\n",
@@ -1594,7 +1595,7 @@ static struct smbd_connection *_smbd_get_connection(
 	qp_attr.qp_context = info;
 	qp_attr.cap.max_send_wr = sp->send_credit_target;
 	qp_attr.cap.max_recv_wr = sp->recv_credit_max;
-	qp_attr.cap.max_send_sge = SMBDIRECT_MAX_SEND_SGE;
+	qp_attr.cap.max_send_sge = SMBDIRECT_SEND_IO_MAX_SGE;
 	qp_attr.cap.max_recv_sge = SMBDIRECT_RECV_IO_MAX_SGE;
 	qp_attr.cap.max_inline_data = 0;
 	qp_attr.sq_sig_type = IB_SIGNAL_REQ_WR;
diff --git a/fs/smb/client/smbdirect.h b/fs/smb/client/smbdirect.h
index 81b55c0de552..a8380bccf623 100644
--- a/fs/smb/client/smbdirect.h
+++ b/fs/smb/client/smbdirect.h
@@ -123,22 +123,6 @@ struct smbd_connection {
 	unsigned int count_send_empty;
 };
 
-/* Maximum number of SGEs used by smbdirect.c in any send work request */
-#define SMBDIRECT_MAX_SEND_SGE	6
-
-/* The context for a SMBD request */
-struct smbd_request {
-	struct smbd_connection *info;
-	struct ib_cqe cqe;
-
-	/* the SGE entries for this work request */
-	struct ib_sge sge[SMBDIRECT_MAX_SEND_SGE];
-	int num_sge;
-
-	/* SMBD packet header follows this structure */
-	u8 packet[];
-};
-
 /* Create a SMBDirect session */
 struct smbd_connection *smbd_get_connection(
 	struct TCP_Server_Info *server, struct sockaddr *dstaddr);
-- 
2.43.0


