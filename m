Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 17BFCBDF41C
	for <lists+samba-technical@lfdr.de>; Wed, 15 Oct 2025 17:05:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=uqHfZvIPYNUj+IkuMVTh9wKXZi5q/e4ZRc+uIT8Z73k=; b=Y0Yn6MbyEAiAQ1yfy4Echz7X/t
	+ktljJuhN6S93DGFoeQb4hHLc/9Mni3LqvCxTj1NJXCsDXaWxhFcbf7/a163w7+Z7VdJthm5o9IOP
	BcoI+h3HVxrVwi29x82lDq0eYSaHprv2ruY3lFOaQuw/uOs3Q8efMH7I7pJtVUupW2iXBZOgnB4xV
	9FLixEEkeNbIOdwzvVs6VLZJ0QxZ50oY/suZCYr/i0xg+F5c1JUzGVprLj9r0wsfx/biVrmCUvE1c
	uIK5lsXG3ccTp4gxbLegiRXIG/atZ/VxoEVPgoqvxwuU8uhkumjIasMCIOJxm8HAV2RTKDjy0md9N
	OKKomcdQ==;
Received: from ip6-localhost ([::1]:55614 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1v934N-007rDR-8X; Wed, 15 Oct 2025 15:05:39 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:65442) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1v934F-007rBu-8v
 for samba-technical@lists.samba.org; Wed, 15 Oct 2025 15:05:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=uqHfZvIPYNUj+IkuMVTh9wKXZi5q/e4ZRc+uIT8Z73k=; b=fGEPAv/Rr70eS7VenS1vPmmrGC
 16OGqcvd2PW4dLNBDy/E0J/li4heG4K7XbukZZAgdcuJ2ueOq9Zi2gwgQ6Tr2vJjMBHy2jRcV1IRT
 uWABHJ6PI6qFjaqArSA991yV2u0qd16KO3GF3shZQ4C1ei1li/MamrXmop0CiNW+kJV0gnkh5MfXb
 7AbFdbDnYx4lk7OqdCV9qYLpjrZr2cxzwmQyVLVPS9IYcGX/kAJX2Kk+RWTQE5ktbA2JEBD5APvIL
 gj8KagOhp94fy8SsbSeICxrBdg4C79We4btcjqhWg6WTy6pGq+tHx/T4p7IwrVCx2bgoY7/ruTzAw
 uElfYKFmoh2qxcaxdlQGwu1NUA4fe0TKVdRdmlnRbUVVfD6qx3oP06QY+qB5tsa8qUoI3osJrBOz0
 BmZxrRNuQ/ILuFo8AR8+9uRLtlTFxuFqzOL7gCnR6xSDzY58cGH36FJf8k26QznJfdlsrHxjjzs9f
 EWvLhFoK5k9fnreUnmsNXj3L;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1v934E-009NR1-0F; Wed, 15 Oct 2025 15:05:30 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH] smb: server: let free_transport() wait for
 SMBDIRECT_SOCKET_DISCONNECTED
Date: Wed, 15 Oct 2025 17:05:27 +0200
Message-ID: <20251015150527.1109622-1-metze@samba.org>
X-Mailer: git-send-email 2.43.0
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

We should wait for the rdma_cm to become SMBDIRECT_SOCKET_DISCONNECTED!

At least on the client side (with similar code)
wait_event_interruptible() often returns with -ERESTARTSYS instead of
waiting for SMBDIRECT_SOCKET_DISCONNECTED.
We should use wait_event() here too, which makes the code be identical
in client and server, which will help when moving to common functions.

Fixes: b31606097de8 ("smb: server: move smb_direct_disconnect_rdma_work() into free_transport()")
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
index a201c5871a77..94851ff25a02 100644
--- a/fs/smb/server/transport_rdma.c
+++ b/fs/smb/server/transport_rdma.c
@@ -450,11 +450,10 @@ static void free_transport(struct smb_direct_transport *t)
 	struct smbdirect_recv_io *recvmsg;
 
 	disable_work_sync(&sc->disconnect_work);
-	if (sc->status < SMBDIRECT_SOCKET_DISCONNECTING) {
+	if (sc->status < SMBDIRECT_SOCKET_DISCONNECTING)
 		smb_direct_disconnect_rdma_work(&sc->disconnect_work);
-		wait_event_interruptible(sc->status_wait,
-					 sc->status == SMBDIRECT_SOCKET_DISCONNECTED);
-	}
+	if (sc->status < SMBDIRECT_SOCKET_DISCONNECTED)
+		wait_event(sc->status_wait, sc->status == SMBDIRECT_SOCKET_DISCONNECTED);
 
 	/*
 	 * Wake up all waiters in all wait queues
-- 
2.43.0


