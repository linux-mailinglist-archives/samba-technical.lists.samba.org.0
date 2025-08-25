Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 51474B34C92
	for <lists+samba-technical@lfdr.de>; Mon, 25 Aug 2025 22:48:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=vR/GIUyuVHiWlyyPDjuauznDoHjd/N2hSnjPlBVcY1U=; b=jFxn1+sshbMdDN/W9i2g8nB7tg
	eHS/tYre29DPFCjrvUkIQPHuI9X1tEVpwwFWZzOgvZsurjUCDA8Lz28UMsOyAaBfw0hRYw4E9zd2/
	hVUIByTaRrS/XMK9DOugZLh4IX34oub9f6L+7stMYLzQcywGxLIldJcK6JvtvaUYgU9ox97EcYPuM
	dfOoKPXZL0tqn4tMSIzRJadux/Dxps9TpSgJfACXS5wN4POgazaWL6lj4u6AjabwiVkZ+IlsNNlCS
	xmJIC4mTCdG6P4lbbA0GQrsiPKy/VGVy+no9aY2cUEYXX7dXN8NKNGA5EVSWAt39z9np3rJ2OUUC4
	f0ZbrGHg==;
Received: from ip6-localhost ([::1]:19738 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uqe7C-000NeZ-EU; Mon, 25 Aug 2025 20:48:31 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:44128) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uqe5l-000N6K-3A
 for samba-technical@lists.samba.org; Mon, 25 Aug 2025 20:47:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=vR/GIUyuVHiWlyyPDjuauznDoHjd/N2hSnjPlBVcY1U=; b=UiP3Kuz1FYQgLT39F9EwqhskpL
 onh7nQnom0ibA/2CNLJ18qOpFTiTTPEkQgHCs2KJRta0tbZaci5i8o1/tJAwXlDQQSXS93Ms678OE
 onoUoayDONxW3n1vVTPZJBrTTRJthAUEWFlFiohHjdIZO+m6tUrSr455jmfLqxJ/AGTSx5oB/y7T+
 qwmjpehlu4bXrk9+lgKw5xhWVmXDsNsJq+EHmGMJdVI0wEY9WKXjFhJWSWzShyI2xKZKke847nsj7
 rt3mgH7W7aYMumUAU4RagS9h3znNO97Tk/1dGsPq3cXhP8WG689xuPSX1PZ6ESi688A9YBiC1mOct
 YpToLehDRGPaJ7PAtTAKF2yEVLrOl3Og59d3gCnKFD/phu3/O2a6d5hV6vIFdn65lxuVkYVZtI3YX
 lvfsr1hyvzPiHYdCQDHl1vE22+JBHmtQ1KXbSlO22CGqq9rIhEArrvW0/2axhx9zOhninSkeZpwLL
 l+U9I8VRU4cFIh3NMPuKU3h3;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uqe5j-000kDs-0V; Mon, 25 Aug 2025 20:46:59 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v4 031/142] smb: client: queue post_recv_credits_work also if
 the peer raises the credit target
Date: Mon, 25 Aug 2025 22:39:52 +0200
Message-ID: <207f19af6a22d271101dd91e446a344623518608.1756139607.git.metze@samba.org>
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

This is already handled in the server, but currently it done
in a very complex way there. So we do it much simpler.

Note that put_receive_buffer() will take care of it
in case data_length is 0.

Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: Long Li <longli@microsoft.com>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
---
 fs/smb/client/smbdirect.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/fs/smb/client/smbdirect.c b/fs/smb/client/smbdirect.c
index a61c7d2afbdf..40aafc606ac8 100644
--- a/fs/smb/client/smbdirect.c
+++ b/fs/smb/client/smbdirect.c
@@ -562,6 +562,7 @@ static void recv_done(struct ib_cq *cq, struct ib_wc *wc)
 	struct smbdirect_socket *sc = response->socket;
 	struct smbd_connection *info =
 		container_of(sc, struct smbd_connection, socket);
+	int old_recv_credit_target;
 	int data_length = 0;
 	bool negotiate_done = false;
 
@@ -616,6 +617,7 @@ static void recv_done(struct ib_cq *cq, struct ib_wc *wc)
 		}
 
 		atomic_dec(&info->receive_credits);
+		old_recv_credit_target = info->receive_credit_target;
 		info->receive_credit_target =
 			le16_to_cpu(data_transfer->credits_requested);
 		if (le16_to_cpu(data_transfer->credits_granted)) {
@@ -646,6 +648,9 @@ static void recv_done(struct ib_cq *cq, struct ib_wc *wc)
 		 * reassembly queue and wake up the reading thread
 		 */
 		if (data_length) {
+			if (info->receive_credit_target > old_recv_credit_target)
+				queue_work(info->workqueue, &info->post_send_credits_work);
+
 			enqueue_reassembly(info, response, data_length);
 			wake_up(&sc->recv_io.reassembly.wait_queue);
 		} else
-- 
2.43.0


