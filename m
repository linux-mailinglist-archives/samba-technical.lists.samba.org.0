Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 57066C866A2
	for <lists+samba-technical@lfdr.de>; Tue, 25 Nov 2025 19:02:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=8134CVNIUz+X5RC0wDtvgK444fg3Xtkyq/hqjNpdpkk=; b=wCv84TZDyK2NNdCt/TGcM732kU
	rUv7rp+09sHK/V9u7Id2GqzltGCiY5FbyHKHlJ5XqrhYrX5kjix6G0nmvXTY8dbArK7tqODHtSET/
	bOJip7Vjey/iEyBQTYZWGlDL9iI5GuxOdzk0oo4RLeCtg6VL+y21aIqLiVMswQdfk3KO0e4+UTRi+
	4CtshPjgSPW2b3KU2nRdzfGJYql9trYkmEs5FF/lObwzn2hDZQSPGgdcNUrkYiIOG7oDIIuhgpzrV
	Mhng9zd0vQuE9aWSNPZdD4BHyKfDDGJv+oduLvV5kzLLmvNnXxH86RIkR3SXwxMnAFiH5LAZJCCOi
	RNdw5NuA==;
Received: from ip6-localhost ([::1]:41910 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vNxN3-00D8C9-MP; Tue, 25 Nov 2025 18:02:34 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:15998) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vNxJY-00D7B5-JJ
 for samba-technical@lists.samba.org; Tue, 25 Nov 2025 17:59:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=8134CVNIUz+X5RC0wDtvgK444fg3Xtkyq/hqjNpdpkk=; b=S7SCsGIZjX1oWISDi0TzVfTxAV
 fFncKyf9SLvXxSORnjEuQ5a4DOEuMHTY6rNHIzWp8M3EIPh4Vyq34D7QfQRmm4krdVcKIOY7KKFhr
 azyaWmQ9Dnsi8ATHgKQCYwb746ZwQ3pbJ1P6m5WMguBuJS5alIOLlcUOmtmXSvaENEyIRKCD3uXqN
 Nm3aPBV+IzVLhusnJfxY7T7TXuIeMENlSxkeMf+WnoAndjlqLXR0E+i88AAHRo+Z6jnrDf2cSZ3LB
 XSnN0BXpkbm0PueMCBvSWfRVHPplvIWITL4fNv/LK9D2PowHlH4w3Tliw7nXfK6nnO9GFVxjQWRxM
 qFErhXmODOZANMX2E2tP2hbJPtcGiZh3hOV/Ta23mc2J6ohl8cx2WO1vj9Q8wIhy/oPZFwa6YZLtY
 tHieGK2gcbkz2lQUlXlS3rGWWfBNdw2+ClG1aS4VLB1nRT3nKDSHSE1JBNwG7JbpzJdzF9aQO5XSg
 7iZ/3xIue/tywUr7gGXr8r8l;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vNxJT-00FcpC-1h; Tue, 25 Nov 2025 17:58:51 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v4 022/145] smb: smbdirect: introduce
 smbdirect_connection_{alloc, free}_send_io()
Date: Tue, 25 Nov 2025 18:54:28 +0100
Message-ID: <b82b91721f389d390dd6af305ab9450ce989631f.1764091285.git.metze@samba.org>
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

These are more or less copies of smb_direct_{alloc,free}_sendmsg()
in the server.

The only difference is that we use ib_dma_unmap_page() for all sges,
this simplifies the logic and doesn't matter as
ib_dma_unmap_single() and ib_dma_unmap_page() both operate
on dma_addr_t and dma_unmap_single_attrs() is just an
alias for dma_unmap_page_attrs().
We already have in inconsistency like that in the client
code where we use ib_dma_unmap_single(), while we mapped
using ib_dma_map_page().

The new functions will replace the existing once in the next commits and
will also be used in the client.

Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: Long Li <longli@microsoft.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
Signed-off-by: Steve French <stfrench@microsoft.com>
---
 .../common/smbdirect/smbdirect_connection.c   | 47 +++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/fs/smb/common/smbdirect/smbdirect_connection.c b/fs/smb/common/smbdirect/smbdirect_connection.c
index f3176bb35977..7a2aaa1747dd 100644
--- a/fs/smb/common/smbdirect/smbdirect_connection.c
+++ b/fs/smb/common/smbdirect/smbdirect_connection.c
@@ -6,6 +6,53 @@
 
 #include "smbdirect_internal.h"
 
+__maybe_unused /* this is temporary while this file is included in others */
+static struct smbdirect_send_io *smbdirect_connection_alloc_send_io(struct smbdirect_socket *sc)
+{
+	struct smbdirect_send_io *msg;
+
+	msg = mempool_alloc(sc->send_io.mem.pool, sc->send_io.mem.gfp_mask);
+	if (!msg)
+		return ERR_PTR(-ENOMEM);
+	msg->socket = sc;
+	INIT_LIST_HEAD(&msg->sibling_list);
+	msg->num_sge = 0;
+
+	return msg;
+}
+
+__maybe_unused /* this is temporary while this file is included in others */
+static void smbdirect_connection_free_send_io(struct smbdirect_send_io *msg)
+{
+	struct smbdirect_socket *sc = msg->socket;
+	size_t i;
+
+	/*
+	 * The list needs to be empty!
+	 * The caller should take care of it.
+	 */
+	WARN_ON_ONCE(!list_empty(&msg->sibling_list));
+
+	/*
+	 * Note we call ib_dma_unmap_page(), even if some sges are mapped using
+	 * ib_dma_map_single().
+	 *
+	 * The difference between _single() and _page() only matters for the
+	 * ib_dma_map_*() case.
+	 *
+	 * For the ib_dma_unmap_*() case it does not matter as both take the
+	 * dma_addr_t and dma_unmap_single_attrs() is just an alias to
+	 * dma_unmap_page_attrs().
+	 */
+	for (i = 0; i < msg->num_sge; i++)
+		ib_dma_unmap_page(sc->ib.dev,
+				  msg->sge[i].addr,
+				  msg->sge[i].length,
+				  DMA_TO_DEVICE);
+
+	mempool_free(msg, sc->send_io.mem.pool);
+}
+
 __maybe_unused /* this is temporary while this file is included in others */
 static struct smbdirect_recv_io *smbdirect_connection_get_recv_io(struct smbdirect_socket *sc)
 {
-- 
2.43.0


