Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BFF7C869E2
	for <lists+samba-technical@lfdr.de>; Tue, 25 Nov 2025 19:29:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=8ln6pEKfmyIY/rY1SKqQzyGTI1gZAB4hx/DCrFw6Lp4=; b=MDTBy9SacAzJ5GeKYpTv8Jhh7C
	kIz7TYt9aatgEd6WAyAFkX5tEseHnR8BmXndLHr2rJndevuJKCPiYXLgtmGHgGBdQkLStsstSqTjG
	o25gCO/nUb3H4GdEGxw/RkOstqTnt1vNxm9OHu9j/w7a6qnij/idWjSdisqwARuGtvbycmyDLPf1H
	oPhe/3BZ01llWsD1S1FW1mQajXCxLcgZiTlyToaodMj2N6f8o855oIOzghUSmd4fhQvUV9I8SDfQq
	Afy7bMj3OlkN4vKKh63QfijAKZcY4B5sHuwALreT9vk29H1WZMyvj+ID8qmUsUUYHuXcZe4DRYI3D
	miJe1Tog==;
Received: from ip6-localhost ([::1]:35856 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vNxn5-00DFoa-IC; Tue, 25 Nov 2025 18:29:28 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:24082) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vNxmr-00DFoA-Bo
 for samba-technical@lists.samba.org; Tue, 25 Nov 2025 18:29:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=8ln6pEKfmyIY/rY1SKqQzyGTI1gZAB4hx/DCrFw6Lp4=; b=0sLWn0KLNGfM+QjzhrqquL0Mpj
 cUsW3oLIuq3QxO+3B99jvHYkDv8k7rueNYVNqc0n8BIJGFkPKNRa+cqwY9U7s8gluhClEZcKsKDSL
 KsRU32HzyvqJZyK37IQNI73gLoifhUoBcUAIAWfDy7H1WVnXOm97HgKFO/PRlYToYY1qoMggUcZ7A
 KkviAt8OB3B//cYdQKbbCXQksylRssiRougN01kFr3xGhQaQ/+WJ1kDqgqwQOzC1fDnnf+OS0mpsH
 CpEdGhy219OXOoLif5VLvL60oXUhDHrQ+rGUiLyYU91jVtA3O7Qg3LHsMBWEdQZifkVsAYzwD9+3+
 cFkYWsL6J5zwVz82awOKALMPWvsrmhHssN2Uo7W2XLkc0K2omWZJeJrHLoWctTOiMe6+v9UJZ3mQU
 nc4EeJDpfvIq1UVsXpMcbardH0AO5UQQgZR4ewg9qITGh9ZZ8vMER3yoQpeat2BqBN2ngHLF/LyRf
 3zwORF4XnthuWwlJtuz+xqW3;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vNxgR-00FfUX-2F; Tue, 25 Nov 2025 18:22:37 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v4 122/145] smb: server: make use of
 smbdirect_connection_grant_recv_credits()
Date: Tue, 25 Nov 2025 18:56:08 +0100
Message-ID: <2829c13eaae71087f9822288ccd878be9bea88fc.1764091285.git.metze@samba.org>
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
Cc: metze@samba.org, Steve French <smfrench@gmail.com>,
 Tom Talpey <tom@talpey.com>, Namjae Jeon <linkinjeon@kernel.org>,
 Steve French <stfrench@microsoft.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is already used by the client too and will
help to share more common code.

Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
Signed-off-by: Steve French <stfrench@microsoft.com>
---
 fs/smb/server/transport_rdma.c | 25 ++++---------------------
 1 file changed, 4 insertions(+), 21 deletions(-)

diff --git a/fs/smb/server/transport_rdma.c b/fs/smb/server/transport_rdma.c
index 5534de7a23ef..eb3189a0b7df 100644
--- a/fs/smb/server/transport_rdma.c
+++ b/fs/smb/server/transport_rdma.c
@@ -503,25 +503,6 @@ static int smb_direct_read(struct ksmbd_transport *t, char *buf,
 	return ret;
 }
 
-static int manage_credits_prior_sending(struct smbdirect_socket *sc)
-{
-	int new_credits;
-
-	if (atomic_read(&sc->recv_io.credits.count) >= sc->recv_io.credits.target)
-		return 0;
-
-	new_credits = atomic_read(&sc->recv_io.posted.count);
-	if (new_credits == 0)
-		return 0;
-
-	new_credits -= atomic_read(&sc->recv_io.credits.count);
-	if (new_credits <= 0)
-		return 0;
-
-	atomic_add(new_credits, &sc->recv_io.credits.count);
-	return new_credits;
-}
-
 static int manage_keep_alive_before_sending(struct smbdirect_socket *sc)
 {
 	struct smbdirect_socket_parameters *sp = &sc->parameters;
@@ -663,6 +644,7 @@ static int smb_direct_create_header(struct smbdirect_socket *sc,
 	struct smbdirect_socket_parameters *sp = &sc->parameters;
 	struct smbdirect_send_io *sendmsg;
 	struct smbdirect_data_transfer *packet;
+	u16 new_credits = 0;
 	int header_length;
 	int ret;
 
@@ -673,7 +655,8 @@ static int smb_direct_create_header(struct smbdirect_socket *sc,
 	/* Fill in the packet header */
 	packet = (struct smbdirect_data_transfer *)sendmsg->packet;
 	packet->credits_requested = cpu_to_le16(sp->send_credit_target);
-	packet->credits_granted = cpu_to_le16(manage_credits_prior_sending(sc));
+	new_credits = smbdirect_connection_grant_recv_credits(sc);
+	packet->credits_granted = cpu_to_le16(new_credits);
 
 	packet->flags = 0;
 	if (manage_keep_alive_before_sending(sc))
@@ -1090,7 +1073,7 @@ static int smb_direct_send_negotiate_response(struct smbdirect_socket *sc,
 		resp->reserved = 0;
 		resp->credits_requested =
 				cpu_to_le16(sp->send_credit_target);
-		resp->credits_granted = cpu_to_le16(manage_credits_prior_sending(sc));
+		resp->credits_granted = cpu_to_le16(smbdirect_connection_grant_recv_credits(sc));
 		resp->max_readwrite_size = cpu_to_le32(sp->max_read_write_size);
 		resp->preferred_send_size = cpu_to_le32(sp->max_send_size);
 		resp->max_receive_size = cpu_to_le32(sp->max_recv_size);
-- 
2.43.0


