Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 29107C1AAAE
	for <lists+samba-technical@lfdr.de>; Wed, 29 Oct 2025 14:27:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=cZk5aFXX5xXOW8YNodXNig7vV9ZrwNbfow1iOam+RsI=; b=mNXOwBynFC3bPYa+GKWP7tC1N6
	K7om5nujcBh8X9e2p9cdcotovfpd6UtG5ytKpUSiwwEhEIcCI4wc5VWkCa0M+yTCjqTQy4t1XQFU0
	wzMLRMOpvZiaNnT/2n3Bn0zQabCJ3Ua1g1PouCCroiU3c8PALDI3Qdz+VxlIunPeIGPxmxkvA4wF8
	bnxt1EliRrco8YTAZFYPTjwQo3j9BtGu7FwNNQtQ8YaPWDKF592RjxnvLBpFfydlcxCZy7sRH7MU9
	fRLDI7sJ2TDIO/dxKQRu/XMVkGcNyr4w08xVsCqvGpjEh5/mYa35yj2o/OtUvN1ZyWvQ8yNAhew0V
	0HnoBxeA==;
Received: from ip6-localhost ([::1]:29692 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vE6DB-0096dy-Bs; Wed, 29 Oct 2025 13:27:37 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:28770) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vE6A7-0095jQ-AR
 for samba-technical@lists.samba.org; Wed, 29 Oct 2025 13:24:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=cZk5aFXX5xXOW8YNodXNig7vV9ZrwNbfow1iOam+RsI=; b=b2vecFNWHfFXs+HBEeFSZpIf/e
 Ns1QggHOX42JblsMtxJ3UNyziqLP8Sbrs7chDy07ZlIQIO5qe7cURjetr9BtAL79Qfqq9ay05caM+
 /XXyR+p+q3duek5l8GVvAmcigbsXHDQdIVQoYrT72KgyE8SwDk5undDxAj700GsczF6Qcr8KAB8YA
 Ma9quDk+Vr3OLRyVQ75dFldxBboU2NqzReJewcvXhj+ocCOxLnrIoEg9Zp4NDdV+49jx6zVxr/tkQ
 2T8QvRU1noSrv/D7wf6TdUk0ezAXQUUClyj+ZIbZtnP+lUAEIG0kaxvFUsuNxUwnj2OAvX6dmT123
 a9N1I99nVsBkqF8qkEc8f1NbALbHSwuo3CkrTZcOvLA89hfafOnGXGrc9UKa8nu7sz7mN2FLLTZGZ
 ++YZOqG9M5L4X8Yz5As28VVJe+9WUFZZ4RV7lpCdBG85wemMmz4yNudwcFxMasLXholGRGN8F0CEg
 hJbi7cB7t5X117liwi5SFLr/;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vE6A3-00BbUf-39; Wed, 29 Oct 2025 13:24:24 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v2 019/127] smb: smbdirect: introduce
 smbdirect_connection_{alloc, free}_send_io()
Date: Wed, 29 Oct 2025 14:19:57 +0100
Message-ID: <39b84018bb623edc96b6f6b0fe943d1758d850ee.1761742839.git.metze@samba.org>
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
index e90aa3b72b44..e5e8432f88e6 100644
--- a/fs/smb/common/smbdirect/smbdirect_connection.c
+++ b/fs/smb/common/smbdirect/smbdirect_connection.c
@@ -88,6 +88,53 @@ static void smbdirect_connection_wake_up_all(struct smbdirect_socket *sc)
 	wake_up_all(&sc->mr_io.cleanup.wait_queue);
 }
 
+__maybe_unused /* this is temporary while this file is included in orders */
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
+__maybe_unused /* this is temporary while this file is included in orders */
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
 __maybe_unused /* this is temporary while this file is included in orders */
 static struct smbdirect_recv_io *smbdirect_connection_get_recv_io(struct smbdirect_socket *sc)
 {
-- 
2.43.0


