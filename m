Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 9244DB34DAB
	for <lists+samba-technical@lfdr.de>; Mon, 25 Aug 2025 23:09:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=QexmNMLtnlGcc9C4ck7Aqqf2yrsrvnd0shGljvLndPo=; b=ltfkdcEePgrB3B/jgKwraKWxzH
	jB6tNCXFSOskv/PKTRIGPcQ4W5L5M6MHaVtfFOh6GJjuTlwgKscPYMe3NLXhQK5VRROMSw+zpuE9g
	siBLUTqGVOKL0mvcN32ufffUaGxgOFWRXqSMyiY9+xwX03ILhnaQGzFKcqFNN0kIpYIUU3+xX3onJ
	AZXPoBVj6kTYKArVP43/0HDp2OHunMT+hErv+fAtTrcC9WFPqvmFmlM1lE4a/ZFR4Qr5e2CgBxPBe
	+LR2S5t2EJ+lf+DebFiMAA2Tz+FLTcTduah9rjaPjvtcUwnyjkcaVVQtHxVzHuibP9fVv/2J2ZHGL
	ZM4pI4WQ==;
Received: from ip6-localhost ([::1]:27236 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uqeRS-000WIf-RL; Mon, 25 Aug 2025 21:09:27 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:49086) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uqeMu-000UDW-Rl
 for samba-technical@lists.samba.org; Mon, 25 Aug 2025 21:04:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=QexmNMLtnlGcc9C4ck7Aqqf2yrsrvnd0shGljvLndPo=; b=aHVZSIsSuxoSAARHnx4TOj4ukF
 NPTv5RuaM+oPcFL7/TJZuHJhY9bYGm0H2YQqIownwo9Sh7TjuBrCoQtfLSbD1wNPzrNhhb2LgiJ5M
 yiVJSIoFvDYBckdw4t+Eg+WOp3A34H9qvxN2Ti5bXiGxicTKgOKN3Excr/ZvxJp0JQd7PeMOPvJxd
 +qjSEizS7dKU4gvAMqRp7K/n7MsbM33vuqzcRbevQb+4iPoaKb7VBxQcfHxIEGMNs+BiUfFYTkINK
 TAmE6m4jBW4L6o66BLUQgbMG8+EVd5ZniHgCMUUFk/iZ0s1E93nTJ9TpWnIfqBFKlp8iKtSO5g1Lh
 WbV7VXPs791UIT99WQXOYoRalRZ2O5C8TViWqA7/sXs6SP2kJT7H4/2XZtpgnovl5FcbxQkIMteaj
 HXpPKRt3y4c7yX29Pe7wc88OdXdjuV2/rVoTAN4Gu+E9lLDOGKJ+fItSrqwNb8lV1O9RyqJ2kiP18
 EOZcf1uJM9SSJd0HkEmH9qfM;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uqeMs-000nno-13; Mon, 25 Aug 2025 21:04:42 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v4 137/142] smb: server: pass struct smbdirect_socket to
 manage_keep_alive_before_sending()
Date: Mon, 25 Aug 2025 22:41:38 +0200
Message-ID: <5b574c6912b0de66687a06077ea41803ba632814.1756139608.git.metze@samba.org>
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
 fs/smb/server/transport_rdma.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/fs/smb/server/transport_rdma.c b/fs/smb/server/transport_rdma.c
index 8a57da09091c..600c541a919b 100644
--- a/fs/smb/server/transport_rdma.c
+++ b/fs/smb/server/transport_rdma.c
@@ -860,9 +860,8 @@ static int manage_credits_prior_sending(struct smbdirect_socket *sc)
 	return new_credits;
 }
 
-static int manage_keep_alive_before_sending(struct smb_direct_transport *t)
+static int manage_keep_alive_before_sending(struct smbdirect_socket *sc)
 {
-	struct smbdirect_socket *sc = &t->socket;
 	struct smbdirect_socket_parameters *sp = &sc->parameters;
 
 	if (sc->idle.keepalive == SMBDIRECT_KEEPALIVE_PENDING) {
@@ -1017,7 +1016,7 @@ static int smb_direct_create_header(struct smb_direct_transport *t,
 	packet->credits_granted = cpu_to_le16(manage_credits_prior_sending(sc));
 
 	packet->flags = 0;
-	if (manage_keep_alive_before_sending(t))
+	if (manage_keep_alive_before_sending(sc))
 		packet->flags |= cpu_to_le16(SMBDIRECT_FLAG_RESPONSE_REQUESTED);
 
 	packet->reserved = 0;
-- 
2.43.0


