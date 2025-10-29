Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 78C10C1AADB
	for <lists+samba-technical@lfdr.de>; Wed, 29 Oct 2025 14:29:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=zlbU6R3ZmLjT6Xl5IZ0R2/9PwvjosVdqU8P5D/TS5Us=; b=ZPWaLCKUa36KwSmYDcVBBaQJmv
	8hgnWdiZ1QpRj3bW5/X5nrxNLb5Em24+gqzXz2b8DHhXPVC6k3NTOo55KPYoANX1nH8z/ifvsW0Oz
	ecsHRE3idBzNaRfGjd9tSDK6VisEXZkgRKk8AjVEEvTgzrasFEZczlxsXS4mP+349x6hKKOXK7ZHg
	eswx/LXBm4EdV9Pj78PKp6ec2UIKHrjgdc+p4taDKcecVb0mSX9yqv7SGiq7xzHV5cvo9DA9dFuZ0
	TWiEV+7Tw/oFa4ZOdrR4Suc/4HlOt+2KkDJluEw8WaG572AGE3UndMHAFMiANG9gKHvaur3DTnZqg
	iOOdYyow==;
Received: from ip6-localhost ([::1]:49668 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vE6Ej-0097A0-0w; Wed, 29 Oct 2025 13:29:13 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:55912) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vE6Al-0095vx-GB
 for samba-technical@lists.samba.org; Wed, 29 Oct 2025 13:25:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=zlbU6R3ZmLjT6Xl5IZ0R2/9PwvjosVdqU8P5D/TS5Us=; b=3fm6AIMs1eW95xKee63NSbbYxY
 9rx9RnMzRvY/92MmxVtQXskqBRsACRu/IhSBZ4ciC5qwRAshGMzAFEcmj7e9uBduSAg/TvVYb95ua
 s/kLvzIWgphNPkcxaJFc8ekqCnVi/2b92u/WlQzlJUmYOffnpbbH7Nn9ymZQ1Uxwux9/Zbf4H2fBb
 YjgW5c5p2Wk9NmGLk/m7TqirOYh2Oum7dXeqm9nzwVPHF8qgCd1S7al25Z46u5e0rzba4L0DSO4m+
 A634z9b4Upmg7ufZMdg37+kpHZWT4JNma6z7akhs5RHAlMb19o3u7SX/98C0rtd1Ks+zD7/+Q5mBL
 gf79dMdmnLnFeGK44y6W7U6PyVGiBxQHn38ooyQGfVnyPS+Ovv/eLjW4idTA7PdhYs7i6cq3gsmjf
 I/d78QIIPKCZlex/UaJFbIEAm1WlgL3tzhY45Omzy+4aDytPgQAxutv3VWXopYnUcHGDXaLQG1MxP
 qSESc+ljzp3b7i2lK/EN2uJ0;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vE6Ai-00BbaW-1P; Wed, 29 Oct 2025 13:25:04 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v2 026/127] smb: smbdirect: introduce
 smbdirect_connection_post_recv_io()
Date: Wed, 29 Oct 2025 14:20:04 +0100
Message-ID: <ba5b2506daf831e8e0ab00ea53024ba2cd63120d.1761742839.git.metze@samba.org>
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

This is basically a copy of smbd_post_recv() in the client and
smb_direct_post_recv() in the server.

The only difference is that this returns early if the connection
is already broken.

Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: Long Li <longli@microsoft.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
Signed-off-by: Steve French <stfrench@microsoft.com>
---
 .../common/smbdirect/smbdirect_connection.c   | 42 +++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/fs/smb/common/smbdirect/smbdirect_connection.c b/fs/smb/common/smbdirect/smbdirect_connection.c
index 448723d438af..959b0c49857f 100644
--- a/fs/smb/common/smbdirect/smbdirect_connection.c
+++ b/fs/smb/common/smbdirect/smbdirect_connection.c
@@ -839,6 +839,48 @@ static void smbdirect_connection_send_io_done(struct ib_cq *cq, struct ib_wc *wc
 	wake_up(&sc->send_io.pending.dec_wait_queue);
 }
 
+__maybe_unused /* this is temporary while this file is included in orders */
+static int smbdirect_connection_post_recv_io(struct smbdirect_recv_io *msg)
+{
+	struct smbdirect_socket *sc = msg->socket;
+	struct smbdirect_socket_parameters *sp = &sc->parameters;
+	struct ib_recv_wr recv_wr = {
+		.wr_cqe = &msg->cqe,
+		.sg_list = &msg->sge,
+		.num_sge = 1,
+	};
+	int ret;
+
+	if (unlikely(sc->first_error))
+		return sc->first_error;
+
+	msg->sge.addr = ib_dma_map_single(sc->ib.dev,
+					  msg->packet,
+					  sp->max_recv_size,
+					  DMA_FROM_DEVICE);
+	ret = ib_dma_mapping_error(sc->ib.dev, msg->sge.addr);
+	if (ret)
+		return ret;
+
+	msg->sge.length = sp->max_recv_size;
+	msg->sge.lkey = sc->ib.pd->local_dma_lkey;
+
+	ret = ib_post_recv(sc->ib.qp, &recv_wr, NULL);
+	if (ret) {
+		smbdirect_log_rdma_recv(sc, SMBDIRECT_LOG_ERR,
+			"ib_post_recv failed ret=%d (%s)\n",
+			ret, errname(ret));
+		ib_dma_unmap_single(sc->ib.dev,
+				    msg->sge.addr,
+				    msg->sge.length,
+				    DMA_FROM_DEVICE);
+		msg->sge.length = 0;
+		smbdirect_connection_schedule_disconnect(sc, ret);
+	}
+
+	return ret;
+}
+
 static bool smbdirect_map_sges_single_page(struct smbdirect_map_sges *state,
 					   struct page *page, size_t off, size_t len)
 {
-- 
2.43.0


