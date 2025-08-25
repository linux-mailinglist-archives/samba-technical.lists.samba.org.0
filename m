Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 34EAFB34DAA
	for <lists+samba-technical@lfdr.de>; Mon, 25 Aug 2025 23:09:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=pynBxh7fLsoz3of4JiCxtBBCus5L7YjnDUff3N5qq5M=; b=uAlpgcQqn6CqtAP4AHfWCAC7CP
	Ca6ShXeP0iKkxlfScK9XiMiT6HwIr5Z4LHYXvJWLxhwAvDlyY3ZDwipE2EvJkS54N0Ey46+pquc98
	WkzPFAyopvW4HfOW/ZpP0etvALpXPv2H8xnOQjpVBmJW1I8l3rT/crofoLzV+Yskcb86mC2rRR9+P
	Zf1FZotjyoCypBbP+LaP9FVZG+nXSegGaBqWbyJaj4G9sVVxok/PaqBWf9iHpnHcZ551TeEVQ6yM5
	6uqAgl9gFbVd1dtEi6pTYQ2nYoRqt+VfqBwbttICur9+YEOh01Getu/CGdAmEPS4kwUmdL/s01tCe
	Bkq3jPyg==;
Received: from ip6-localhost ([::1]:62612 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uqeRH-000WED-7e; Mon, 25 Aug 2025 21:09:15 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:19776) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uqeMl-000UA4-JD
 for samba-technical@lists.samba.org; Mon, 25 Aug 2025 21:04:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=pynBxh7fLsoz3of4JiCxtBBCus5L7YjnDUff3N5qq5M=; b=qDFtjq9UIljzYv6JDr6f1+JNS/
 sUpkLMMNBAfdqBYEgQ8NDEuFYx082lVGuNlfSBblUT/m+4Q6/LD5kpHxjcFehi7lqB/ZIFwaUd+rr
 4k6HbLWqWUKpTxEh1VQNkRHLOspnUXr/nrJ8hWkSGgNwJYduLkI3CyHNuY9iEKKHUYQk+x7YPXzx3
 UfgsW8KtteHojqs4LPWVGluKbg8kstxOEodpZ6QSs9fXBBU/y1LZlSs+4IN9jKzJ6lfWVf5Y1eNh0
 8JMVIeRaaw5hKAmSACuacTq5JnY64rH9ngE9jpDXzXxXONQFVo38RBuxb+Du2dRUFQjUi/MwklETe
 6q9zittPOAH8VDuoAvgLqIywFdFzQS0Jp/6pbsKg1JUqfRUWLDQMDBEJvmCkGwSI8rTCv7o9nYNNW
 IKmbFWpB5o1v4jMZYSWmKGKcSzHKqUjaR9Iz5QCtVoRoFV1Sjac1YA1zagqNIHyBWkQQi+GoO9WXW
 PbLCq5bHcnjD8xsYsY1ctPXT;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uqeMh-000nku-0b; Mon, 25 Aug 2025 21:04:31 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v4 136/142] smb: server: pass struct smbdirect_socket to
 manage_credits_prior_sending()
Date: Mon, 25 Aug 2025 22:41:37 +0200
Message-ID: <f993a7b5d2160f96e0d08d780386e7d42a787435.1756139608.git.metze@samba.org>
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
 fs/smb/server/transport_rdma.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/fs/smb/server/transport_rdma.c b/fs/smb/server/transport_rdma.c
index da48b2ec6dd3..8a57da09091c 100644
--- a/fs/smb/server/transport_rdma.c
+++ b/fs/smb/server/transport_rdma.c
@@ -841,9 +841,8 @@ static void send_done(struct ib_cq *cq, struct ib_wc *wc)
 	smb_direct_free_sendmsg(sc, sibling);
 }
 
-static int manage_credits_prior_sending(struct smb_direct_transport *t)
+static int manage_credits_prior_sending(struct smbdirect_socket *sc)
 {
-	struct smbdirect_socket *sc = &t->socket;
 	int new_credits;
 
 	if (atomic_read(&sc->recv_io.credits.count) >= sc->recv_io.credits.target)
@@ -1015,7 +1014,7 @@ static int smb_direct_create_header(struct smb_direct_transport *t,
 	/* Fill in the packet header */
 	packet = (struct smbdirect_data_transfer *)sendmsg->packet;
 	packet->credits_requested = cpu_to_le16(sp->send_credit_target);
-	packet->credits_granted = cpu_to_le16(manage_credits_prior_sending(t));
+	packet->credits_granted = cpu_to_le16(manage_credits_prior_sending(sc));
 
 	packet->flags = 0;
 	if (manage_keep_alive_before_sending(t))
@@ -1604,7 +1603,7 @@ static int smb_direct_send_negotiate_response(struct smb_direct_transport *t,
 		resp->reserved = 0;
 		resp->credits_requested =
 				cpu_to_le16(sp->send_credit_target);
-		resp->credits_granted = cpu_to_le16(manage_credits_prior_sending(t));
+		resp->credits_granted = cpu_to_le16(manage_credits_prior_sending(sc));
 		resp->max_readwrite_size = cpu_to_le32(sp->max_read_write_size);
 		resp->preferred_send_size = cpu_to_le32(sp->max_send_size);
 		resp->max_receive_size = cpu_to_le32(sp->max_recv_size);
-- 
2.43.0


