Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 70167B34D8B
	for <lists+samba-technical@lfdr.de>; Mon, 25 Aug 2025 23:06:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=+yutqYzfF3Lt8v1a3G4Z5pG3D461I4SJlOrP8aeosCE=; b=ht40TqWg4MCveOVjvDOJemVZuJ
	JMjX7tfWoFBfsrjfxqBTfuCt6TRHEJI1LSCIlZ1FwcbJBvFl2U9v7eC1P2hthIneEhvZA3fQDuzPW
	BpbgEqxpU1K5dGgoENPwFHavT5Ci6Wiv1eaoDQX79UFJJR0W+Bje4osxmdzcRBfWUUDJRL40T3KpH
	MYs827y3GJnpn9ni5Xgy7PvmJrstfPgp3j1fP68SpPvHEDEYIIYjH0J3EpaHYNjHsqtx8/nuahReP
	dPia35SIfU17QnV5W8r3V2nRbrZ12YDWG5g7aorxC7yUiCCnI5RuDZGql/P8r52o3pp3rJUdDLq0J
	SIh1B0tA==;
Received: from ip6-localhost ([::1]:55330 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uqeO9-000Uff-O5; Mon, 25 Aug 2025 21:06:02 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:49196) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uqeJd-000SnG-LM
 for samba-technical@lists.samba.org; Mon, 25 Aug 2025 21:01:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=+yutqYzfF3Lt8v1a3G4Z5pG3D461I4SJlOrP8aeosCE=; b=agdmsyM5qGhi5d72KkLPpJUsB8
 XZhHXnNOL8zV8PLYcX9rnkn8JrEb4M7Au+NBTrXYQFtOfApGb+WFy9XyDmAxB9bM/gyXaVMSoWnXG
 ntJ5uYPi98EyT6JWeV/E9u5hNAJMfNXsz6I5bDAP91QEnaYkr8a3QoJU5Uk01MagfDCbrp62/xG6+
 S57cmrb/mlr1BkrXt2yL4uMm+NwIFgMrb3993RB89PqOT0V3h+vsBGSc6yD+0pM/IddHPDopyYxZK
 gnPi2D1ZDHdC4jRCszCPMXrFV42YtZcUY5/FtYPG5bdcdopbsJMxl8ofVw/7OVxOkArmKauYBwU/s
 HxreqcKrOkhJQQOmbgUaOEDKfe/XCMt3K3B3HrdFmT+Y6rhgl+zk0TXEl0xRqaD5hhL8whAdbVkS4
 KDQn159+KKY/+jBDYE1VC48CmHbYTKD469IPtrcjqIzY4QLSDRSyd5irnTemnYM1MDRMHOmW8AjU8
 WVqVxy0HEr+vePgEBeM8q/lA;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uqeJY-000n6W-2d; Mon, 25 Aug 2025 21:01:18 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v4 117/142] smb: server: pass struct smbdirect_socket to
 smb_direct_{create, destroy}_pools()
Date: Mon, 25 Aug 2025 22:41:18 +0200
Message-ID: <57eaa0bb38e89012940583dbc607ffc41c1cc15c.1756139607.git.metze@samba.org>
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
 Tom Talpey <tom@talpey.com>, Namjae Jeon <linkinjeon@kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This will make it easier to move function to the common code
in future.

Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
---
 fs/smb/server/transport_rdma.c | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/fs/smb/server/transport_rdma.c b/fs/smb/server/transport_rdma.c
index a998f6c04aab..1aabd617c6ec 100644
--- a/fs/smb/server/transport_rdma.c
+++ b/fs/smb/server/transport_rdma.c
@@ -133,7 +133,7 @@ static inline int get_buf_page_count(void *buf, int size)
 		(uintptr_t)buf / PAGE_SIZE;
 }
 
-static void smb_direct_destroy_pools(struct smb_direct_transport *transport);
+static void smb_direct_destroy_pools(struct smbdirect_socket *sc);
 static void smb_direct_post_recv_credits(struct work_struct *work);
 static int smb_direct_post_send_data(struct smb_direct_transport *t,
 				     struct smbdirect_send_batch *send_ctx,
@@ -412,7 +412,7 @@ static void free_transport(struct smb_direct_transport *t)
 	if (sc->rdma.cm_id)
 		rdma_destroy_id(sc->rdma.cm_id);
 
-	smb_direct_destroy_pools(t);
+	smb_direct_destroy_pools(sc);
 	ksmbd_conn_free(KSMBD_TRANS(t)->conn);
 }
 
@@ -1835,9 +1835,8 @@ static int smb_direct_init_params(struct smb_direct_transport *t,
 	return 0;
 }
 
-static void smb_direct_destroy_pools(struct smb_direct_transport *t)
+static void smb_direct_destroy_pools(struct smbdirect_socket *sc)
 {
-	struct smbdirect_socket *sc = &t->socket;
 	struct smbdirect_recv_io *recvmsg;
 
 	while ((recvmsg = get_free_recvmsg(sc)))
@@ -1856,15 +1855,14 @@ static void smb_direct_destroy_pools(struct smb_direct_transport *t)
 	sc->send_io.mem.cache = NULL;
 }
 
-static int smb_direct_create_pools(struct smb_direct_transport *t)
+static int smb_direct_create_pools(struct smbdirect_socket *sc)
 {
-	struct smbdirect_socket *sc = &t->socket;
 	struct smbdirect_socket_parameters *sp = &sc->parameters;
 	char name[80];
 	int i;
 	struct smbdirect_recv_io *recvmsg;
 
-	snprintf(name, sizeof(name), "smbdirect_send_io_pool_%p", t);
+	snprintf(name, sizeof(name), "smbdirect_send_io_pool_%p", sc);
 	sc->send_io.mem.cache = kmem_cache_create(name,
 					     sizeof(struct smbdirect_send_io) +
 					      sizeof(struct smbdirect_negotiate_resp),
@@ -1878,7 +1876,7 @@ static int smb_direct_create_pools(struct smb_direct_transport *t)
 	if (!sc->send_io.mem.pool)
 		goto err;
 
-	snprintf(name, sizeof(name), "smbdirect_recv_io_pool_%p", t);
+	snprintf(name, sizeof(name), "smbdirect_recv_io_pool_%p", sc);
 	sc->recv_io.mem.cache = kmem_cache_create(name,
 					     sizeof(struct smbdirect_recv_io) +
 					     sp->max_recv_size,
@@ -1903,7 +1901,7 @@ static int smb_direct_create_pools(struct smb_direct_transport *t)
 
 	return 0;
 err:
-	smb_direct_destroy_pools(t);
+	smb_direct_destroy_pools(sc);
 	return -ENOMEM;
 }
 
@@ -2059,6 +2057,7 @@ static int smb_direct_prepare(struct ksmbd_transport *t)
 
 static int smb_direct_connect(struct smb_direct_transport *st)
 {
+	struct smbdirect_socket *sc = &st->socket;
 	int ret;
 	struct ib_qp_cap qp_cap;
 
@@ -2068,7 +2067,7 @@ static int smb_direct_connect(struct smb_direct_transport *st)
 		return ret;
 	}
 
-	ret = smb_direct_create_pools(st);
+	ret = smb_direct_create_pools(sc);
 	if (ret) {
 		pr_err("Can't init RDMA pool: %d\n", ret);
 		return ret;
-- 
2.43.0


