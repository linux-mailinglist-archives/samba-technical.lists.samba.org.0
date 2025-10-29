Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id C867CC1ADE8
	for <lists+samba-technical@lfdr.de>; Wed, 29 Oct 2025 14:45:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=abMdsTUjWFKLgdKxdxnFPbzWh8tdWjm77OiDbb/AIJw=; b=hks+vXr5mlOtIh1CGILjrqWrgM
	u+VqP3zahydZWWWJrKWDpSRzvs4cbmVZmP8LlKAGZknfO1eKpgMRLo/gPJYZvWWYaaSCVPark/C5H
	0a9W9dpumJzNQCVuLF2n0yA4DnfxgxC1nCx6Vfxu9HTmPxjTZea7OWeMZxn/msDondMRahnRDpKC/
	kl1/AelM72+wp21/Oe6JU5sUKkNODXFxtIVfqpex1faS6qyimc7cQD1NkymcPrCQlaqcf5iu3XiRg
	7Y2QwYBHNTjq0yq+aLIqhwkiI76hs6+N3mimXHlNj4yk/j+Elq9HXaUZVwg5ZqiX3qMhooyxbCVu0
	z+4qukJg==;
Received: from ip6-localhost ([::1]:28374 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vE6UL-009Cl5-VX; Wed, 29 Oct 2025 13:45:22 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:51764) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vE6HN-00985R-Pj
 for samba-technical@lists.samba.org; Wed, 29 Oct 2025 13:32:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=abMdsTUjWFKLgdKxdxnFPbzWh8tdWjm77OiDbb/AIJw=; b=Es6jViwcywK4yQIjaRhipij+Kv
 e7tDi9NoMI+F7iF8E9KvROofCFHnrGyV3CeCnn6/PpLybjqvXZUdiA2WRuFVADKHEs9hDwjvyxClL
 wSQtC5vI5qsX2oEtnrCNqXEJ+7M81KZL+LyoEca8WejJkKl0uiCIJh0TURqyuFsg75WBKPcWLWQfI
 cWWyvaGcYMah5fRdJAniOvLCf1ra6N6VLbC7rfqsNKlLPTjpOgal/GSYMwe34ORUGWtfFp8+IVPVk
 abIbuKis1G9PADnGHlX9w1mp/f7be1x+YbZi951SbFriixNh7h3vbfWCixq72iWU9luaHQPYkGfB3
 FQD0YcWi7OER3DVSbdFyZSBvfEwE6aTVE2oK5cmEDmuA4wzup41iJBySKizRRt+rhfJ6hsqG0lFEv
 kSnSy9wFU/uXt3mQQtYz7RwORaHhIuB6cXhKlsst3clfermyoe6F86BxN0lgJnNWWdHtE8TKsASrm
 bdbMS6Di287f5lnTk/2RRlHm;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vE6HL-00Bcew-10; Wed, 29 Oct 2025 13:31:55 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v2 094/127] smb: server: make use of
 smbdirect_connection_wake_up_all()
Date: Wed, 29 Oct 2025 14:21:12 +0100
Message-ID: <2ba5c904020e197627a9b79937174f83cb4fdd91.1761742839.git.metze@samba.org>
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
Cc: metze@samba.org, Steve French <smfrench@gmail.com>,
 Tom Talpey <tom@talpey.com>, Namjae Jeon <linkinjeon@kernel.org>,
 Steve French <stfrench@microsoft.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is a superset of smb_direct_disconnect_wake_up_all() and
calling wake_up_all(&sc->mr_io.ready.wait_queue); and
wake_up_all(&sc->mr_io.cleanup.wait_queue); in addition
should not matter as it's not used on the server anyway.

Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
Signed-off-by: Steve French <stfrench@microsoft.com>
---
 fs/smb/server/transport_rdma.c | 20 +++-----------------
 1 file changed, 3 insertions(+), 17 deletions(-)

diff --git a/fs/smb/server/transport_rdma.c b/fs/smb/server/transport_rdma.c
index fa6371ed0b76..b78753801fe5 100644
--- a/fs/smb/server/transport_rdma.c
+++ b/fs/smb/server/transport_rdma.c
@@ -281,20 +281,6 @@ static struct smbdirect_recv_io *get_first_reassembly(struct smbdirect_socket *s
 		return NULL;
 }
 
-static void smb_direct_disconnect_wake_up_all(struct smbdirect_socket *sc)
-{
-	/*
-	 * Wake up all waiters in all wait queues
-	 * in order to notice the broken connection.
-	 */
-	wake_up_all(&sc->status_wait);
-	wake_up_all(&sc->send_io.lcredits.wait_queue);
-	wake_up_all(&sc->send_io.credits.wait_queue);
-	wake_up_all(&sc->send_io.pending.zero_wait_queue);
-	wake_up_all(&sc->recv_io.reassembly.wait_queue);
-	wake_up_all(&sc->rw_io.credits.wait_queue);
-}
-
 static void smb_direct_disconnect_rdma_work(struct work_struct *work)
 {
 	struct smbdirect_socket *sc =
@@ -350,7 +336,7 @@ static void smb_direct_disconnect_rdma_work(struct work_struct *work)
 	 * Wake up all waiters in all wait queues
 	 * in order to notice the broken connection.
 	 */
-	smb_direct_disconnect_wake_up_all(sc);
+	smbdirect_connection_wake_up_all(sc);
 }
 
 static void
@@ -412,7 +398,7 @@ smb_direct_disconnect_rdma_connection(struct smbdirect_socket *sc)
 	 * Wake up all waiters in all wait queues
 	 * in order to notice the broken connection.
 	 */
-	smb_direct_disconnect_wake_up_all(sc);
+	smbdirect_connection_wake_up_all(sc);
 
 	queue_work(sc->workqueue, &sc->disconnect_work);
 }
@@ -538,7 +524,7 @@ static void free_transport(struct smb_direct_transport *t)
 	 * Most likely this was already called via
 	 * smb_direct_disconnect_rdma_work(), but call it again...
 	 */
-	smb_direct_disconnect_wake_up_all(sc);
+	smbdirect_connection_wake_up_all(sc);
 
 	disable_work_sync(&sc->recv_io.posted.refill_work);
 	disable_delayed_work_sync(&sc->idle.timer_work);
-- 
2.43.0


