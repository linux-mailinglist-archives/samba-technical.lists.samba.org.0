Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BE5EB34C7C
	for <lists+samba-technical@lfdr.de>; Mon, 25 Aug 2025 22:47:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=/H284UBY38VuuHhorIJQb1wax+TSkIL1Zc+xja+LQXU=; b=Hv/hFHUK+CqjqdJAY/wfZyowqv
	GPao6oypON4efA/Iesi9jmdLi7yZZQIEwLmTON2F4FywuGXX+FgnufYgjDyMZPxSJf3TLl319kOVO
	MA+Yg8ixFmgJZi1P0ItYMRwesU3g8mUBwW+HvkB5UUFoSIGPAkGocCyXWsHqZlZGlYWHGDg66tBG8
	VLtHejak/HW2P/7FuCZ+cq+AGUhIGRg9miJ6295bKZ0mOCtm7+udUubtDwpG88ql7f+VJQoOTGeqa
	Mn55DuyamXnDEtc7+6UdXlUtgq7fFPRQkLrD6vKYPjZ3Etw8XkB53o0DDmzKlKxYQABUoNHZdASJ/
	hFrSgiZw==;
Received: from ip6-localhost ([::1]:63514 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uqe5t-000N6C-Pa; Mon, 25 Aug 2025 20:47:10 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:53320) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uqe4k-000MgS-48
 for samba-technical@lists.samba.org; Mon, 25 Aug 2025 20:46:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=/H284UBY38VuuHhorIJQb1wax+TSkIL1Zc+xja+LQXU=; b=lnOCNgCCUUwTVk9J3j8UkgbijO
 N11wmazso2vBF6fvDRiGsmo5KnFGS0SQ99HorVjygSZvhT2CmyOCFW2bao2Kh3lzoOKqCsY7SqrBB
 I+fcqXrdSCyPU+IdQI0mRxFtcC+HJsssoWrJ/NaL9krXhevmdTYliN8k8JuxHBQ+Fjr5Te9iQldde
 qXnYAa1Goy39e6YkLzQztXyHE6N/UWmTL11ZzfhUxad6mQNUgSCivg/32XNeTgmIWzJJQx/fO+HBP
 T2VPiZYQJeEr9sGUiNHCdvum++MzlPuHbImuoJE+vmIwriawBvgh1tbIh+2MiVg1ad6gzmBmqUMVk
 AK/dMaKl9QW8Y5BpJHmo8WiuqoDETNe9YjlLdtJDsOlzg2dmw+Z9nR4FTLuGEPW0F+WsfZRFhfS1X
 FUDUM6DZk6Mayhnr+8zQYV4W4VA9sF5GV0m30TKxhswPZon4Tt0bQveWtXEzL7fJx9rvrm/KmpUZx
 aaGb8Q1MUIsgUVPJ7l+Wfexg;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uqe4f-000jxJ-2k; Mon, 25 Aug 2025 20:45:54 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v4 024/142] smb: client: make use of smbdirect_socket_init()
Date: Mon, 25 Aug 2025 22:39:45 +0200
Message-ID: <56c4be7b1d6f1fb5cd30e1fb3b22efec36e62c61.1756139607.git.metze@samba.org>
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
 Tom Talpey <tom@talpey.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

It's much safer to initialize the whole structure at
the beginning than doing it all over the place
and then miss to move it if code changes.

Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: Long Li <longli@microsoft.com>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
---
 fs/smb/client/smbdirect.c | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/fs/smb/client/smbdirect.c b/fs/smb/client/smbdirect.c
index b67a264a6030..ded912e904f0 100644
--- a/fs/smb/client/smbdirect.c
+++ b/fs/smb/client/smbdirect.c
@@ -1351,13 +1351,6 @@ static int allocate_receive_buffers(struct smbd_connection *info, int num_buf)
 	struct smbdirect_recv_io *response;
 	int i;
 
-	INIT_LIST_HEAD(&sc->recv_io.reassembly.list);
-	spin_lock_init(&sc->recv_io.reassembly.lock);
-	sc->recv_io.reassembly.data_length = 0;
-	sc->recv_io.reassembly.queue_length = 0;
-
-	INIT_LIST_HEAD(&sc->recv_io.free.list);
-	spin_lock_init(&sc->recv_io.free.lock);
 	info->count_receive_queue = 0;
 
 	init_waitqueue_head(&info->wait_receive_queues);
@@ -1656,14 +1649,12 @@ static struct smbd_connection *_smbd_get_connection(
 	if (!info)
 		return NULL;
 	sc = &info->socket;
+	smbdirect_socket_init(sc);
 	sp = &sc->parameters;
 
 	info->initiator_depth = 1;
 	info->responder_resources = SMBD_CM_RESPONDER_RESOURCES;
 
-	init_waitqueue_head(&sc->status_wait);
-
-	sc->status = SMBDIRECT_SOCKET_CREATED;
 	rc = smbd_ia_open(info, dstaddr, port);
 	if (rc) {
 		log_rdma_event(INFO, "smbd_ia_open rc=%d\n", rc);
@@ -1773,8 +1764,6 @@ static struct smbd_connection *_smbd_get_connection(
 	log_rdma_event(INFO, "connecting to IP %pI4 port %d\n",
 		&addr_in->sin_addr, port);
 
-	init_waitqueue_head(&sc->recv_io.reassembly.wait_queue);
-
 	WARN_ON_ONCE(sc->status != SMBDIRECT_SOCKET_RDMA_CONNECT_NEEDED);
 	sc->status = SMBDIRECT_SOCKET_RDMA_CONNECT_RUNNING;
 	rc = rdma_connect(sc->rdma.cm_id, &conn_param);
-- 
2.43.0


