Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id F2389C86A1B
	for <lists+samba-technical@lfdr.de>; Tue, 25 Nov 2025 19:31:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=YxIk446sp5RtKXzMpY46d++oqnke4cLjpBRcP2qXPAM=; b=jO1ZFLRbhtgnVtlRshufnJh1S5
	RDNpYZBW8jjW3Y4GLAz5jY+4H7c/27kOjlTnFwitc+mWHtDGiFQ8RfcmyHmV/8u0B2NgihD/R2qn7
	Ne/j9A/PitUPmm4XCjY2vzlxk+jhVZLwhuanqZB2rwK6R1RFHpCkvL6MLGBkm4cU3L54LPJmZTk6t
	t4bLJBNF7xUG7rScuM8oJylSfjtbP8hK217ACbn5IfTBX0gooEmLhBDs5bzyeA1VbDL/qFMrTlbKk
	IdNjZhcmAa8czEe87C+SXQONDctqgNoo6Zrjcakqgh6Ui/kbG9NKMiiEeN7orhyYPnb9+Dj0Z7SSf
	Fkc9CQ/Q==;
Received: from ip6-localhost ([::1]:62414 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vNxoq-00DGIh-Tm; Tue, 25 Nov 2025 18:31:17 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:22006) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vNxmv-00DFoH-8G
 for samba-technical@lists.samba.org; Tue, 25 Nov 2025 18:29:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=YxIk446sp5RtKXzMpY46d++oqnke4cLjpBRcP2qXPAM=; b=xU9RkpQg+LYaQl/QuCmq80pbZq
 cGjuCWYGREmbqVf6s0qccDN19UvItIYYq5i2Oh2Kt1l6BiMVu7NprFEs/Zt03IC2n3svhk5c4IK0f
 +FP4CQV1Qqn8c6dD961mTKl3M8Q1qD+Q1TMEYIuPyBCM9FZR9NYLxdquVtRu4U/N+0BymRJPO+7Oe
 gAWOmUc1m5bHJWijNhCjLZLFeze5qaX57qCLIUa1zEVB9vmNHP7DrgBpeG0/JFDl2sDKANgdhV7ic
 QgSaZALz26ATSuWzG9JrR56t9uGEINzVGVhDXmTKqhbtwuktk7YauS0iTOfIFPnm4vdSSMliD9+8U
 DtTO33D1P1mqdsM0HAzb/2GV/SG9hA3HHW4fziDThl2OiXDqpfrLr5+dAkWQ3zu6mqg5LOwwNiKPw
 whs0e4hgGsDFtxwDvJuctkiGPAlv8RS+UvKtCbrqxntgNGr81F+LBDEveQkMc0KiduYpj7R9yjT8B
 llPHEfPbv2fTe/++HH/n4LIz;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vNxgc-00FfXL-1M; Tue, 25 Nov 2025 18:22:47 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v4 123/145] smb: server: make use of
 smbdirect_connection_request_keep_alive()
Date: Tue, 25 Nov 2025 18:56:09 +0100
Message-ID: <c71eaa1d7f1f2b9f7754294af6dfa668a0d55708.1764091285.git.metze@samba.org>
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

This will help to share more common code soon.

Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
Signed-off-by: Steve French <stfrench@microsoft.com>
---
 fs/smb/server/transport_rdma.c | 19 +------------------
 1 file changed, 1 insertion(+), 18 deletions(-)

diff --git a/fs/smb/server/transport_rdma.c b/fs/smb/server/transport_rdma.c
index eb3189a0b7df..8062759efc9e 100644
--- a/fs/smb/server/transport_rdma.c
+++ b/fs/smb/server/transport_rdma.c
@@ -503,23 +503,6 @@ static int smb_direct_read(struct ksmbd_transport *t, char *buf,
 	return ret;
 }
 
-static int manage_keep_alive_before_sending(struct smbdirect_socket *sc)
-{
-	struct smbdirect_socket_parameters *sp = &sc->parameters;
-
-	if (sc->idle.keepalive == SMBDIRECT_KEEPALIVE_PENDING) {
-		sc->idle.keepalive = SMBDIRECT_KEEPALIVE_SENT;
-		/*
-		 * Now use the keepalive timeout (instead of keepalive interval)
-		 * in order to wait for a response
-		 */
-		mod_delayed_work(sc->workqueue, &sc->idle.timer_work,
-				 msecs_to_jiffies(sp->keepalive_timeout_msec));
-		return 1;
-	}
-	return 0;
-}
-
 static int smb_direct_post_send(struct smbdirect_socket *sc,
 				struct ib_send_wr *wr)
 {
@@ -659,7 +642,7 @@ static int smb_direct_create_header(struct smbdirect_socket *sc,
 	packet->credits_granted = cpu_to_le16(new_credits);
 
 	packet->flags = 0;
-	if (manage_keep_alive_before_sending(sc))
+	if (smbdirect_connection_request_keep_alive(sc))
 		packet->flags |= cpu_to_le16(SMBDIRECT_FLAG_RESPONSE_REQUESTED);
 
 	packet->reserved = 0;
-- 
2.43.0


