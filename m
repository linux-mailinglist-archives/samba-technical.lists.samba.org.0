Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C9D9B8E77E
	for <lists+samba-technical@lfdr.de>; Sun, 21 Sep 2025 23:49:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=eGimAKJXs+O7+IotBmTffj2Ph+qzQDzrvWKV4LdUPe0=; b=ECxNSFJ9Mx/XOWiL7roSWsXAdH
	jeuuC/k+lK0FTZ76fLcWogNPAq7i0lofRse8T96Evjx45twZhPUrWr3z6HhtiFtOhczeRDBrXDrn8
	1GcLt8aZj1w+LJW0Vvkr70Ep8chGAg2ivlp6afec/b4WjRWML9D1TwOmwYWuQ7EmSk5Rjh6ImC8Rr
	CNqN/H3s0k/W/kVBazQfQ7KpyJTWU400nSWkdWTJI7J0GYel3Qty+N6nGUiHIElRgazJrnuqDshNv
	g1bwteGwBoZd1lH5avwNkI0AmcG0AuX9u26GndnxmzkXr7nkKoz2TAfOGcsudZj2qoxjXzODBkr54
	mRYRSv/w==;
Received: from ip6-localhost ([::1]:22474 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1v0Rvz-004UEv-Vo; Sun, 21 Sep 2025 21:49:29 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:52788) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1v0RuS-004Tj4-7W
 for samba-technical@lists.samba.org; Sun, 21 Sep 2025 21:47:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=eGimAKJXs+O7+IotBmTffj2Ph+qzQDzrvWKV4LdUPe0=; b=WgJfKfug/OaTHnA57oS4xq/N8J
 BbuTMg7pULZSJcjpL12fJkJkhi8/IdM5su1ufP+ETGADXAnKwOKwEEuWo4cqyMSUIoq5zlxYJ+SBy
 LOeSLEVHgir2pttYOqpYWBg0NCCMk3d8YWm3WLuTbWWIX0q3ePP/miyQZA+5XD4VGF7gtCtt42VRH
 wEZM8mttb03pdV+jAbBXw7KA8AoNBqtPFUZGRn/wO8EbRjKX7KJgP7BsdsCACjnKMU3Roq6Um5UPj
 6oFNoJa+BQ6IoFiU0lSxyvRtJZQmog7qvHKNDtszEO1sQBdb94Dj28RrMjGWOacTcl9gIZy05bqa+
 MnaNyvFD0eR8euFz/CkVeZiji/5XDcmPGY6EP9cxBr/4o4QWFTIBnXQ5OiXwdcZHhofZEb9XzZojT
 +QUIeY+Vx0jJj8jEENqqQ24iEgryl5WCiqVg3vK4SrBGoZ3VsM2LQuklHeh2oWLudbueFYaTZ7PCL
 pVPremGHvq4aigqDK4JwACXd;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1v0RuN-005Gkl-2G; Sun, 21 Sep 2025 21:47:47 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH 18/18] smb: server: let smb_direct_flush_send_list()
 invalidate a remote key first
Date: Sun, 21 Sep 2025 23:45:05 +0200
Message-ID: <46360e2837bb22fd31c595f803f5e38f389746e2.1758489989.git.metze@samba.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1758489988.git.metze@samba.org>
References: <cover.1758489988.git.metze@samba.org>
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

If we want to invalidate a remote key we should do that as soon as
possible, so do it in the first send work request.

Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
Signed-off-by: Steve French <stfrench@microsoft.com>
---
 fs/smb/server/transport_rdma.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/fs/smb/server/transport_rdma.c b/fs/smb/server/transport_rdma.c
index e78347831d2f..27e3fc5139cc 100644
--- a/fs/smb/server/transport_rdma.c
+++ b/fs/smb/server/transport_rdma.c
@@ -1017,12 +1017,15 @@ static int smb_direct_flush_send_list(struct smbdirect_socket *sc,
 			       struct smbdirect_send_io,
 			       sibling_list);
 
+	if (send_ctx->need_invalidate_rkey) {
+		first->wr.opcode = IB_WR_SEND_WITH_INV;
+		first->wr.ex.invalidate_rkey = send_ctx->remote_key;
+		send_ctx->need_invalidate_rkey = false;
+		send_ctx->remote_key = 0;
+	}
+
 	last->wr.send_flags = IB_SEND_SIGNALED;
 	last->wr.wr_cqe = &last->cqe;
-	if (is_last && send_ctx->need_invalidate_rkey) {
-		last->wr.opcode = IB_WR_SEND_WITH_INV;
-		last->wr.ex.invalidate_rkey = send_ctx->remote_key;
-	}
 
 	ret = smb_direct_post_send(sc, &first->wr);
 	if (!ret) {
-- 
2.43.0


