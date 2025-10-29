Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 86862C1AEEA
	for <lists+samba-technical@lfdr.de>; Wed, 29 Oct 2025 14:50:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=nhAdaTJMAdKZUNClUnrDVUlzVRxvoM7BSULl5H21iQ0=; b=R1BEZx8TyAPM5D8pYBAwq6JN5A
	Pu8IGBVQDdpY1FaHfG2gTQjClf8IIO/978S3x1PZVBYJ6uuVk0McPUZX1MPGp9Q+1PG/lyi9NxLz2
	ZXLaNDtckemOiUUTNZOliMz/5IA7AYnSYqCYNAdtvPf4cIZ/9QpPVmus2WAF5Jx8L5eXBfRhZyRuk
	3hOxFLB9Jb1RxTla1iDNio1IngtV4vC3OUNzEPmejlj16a1MwAu/vyHfy/uLKt6DyGr65e5F3dmZI
	12URxfgzanli9SXDdgsCSZqeggDoWEVPGPYjL+GLIvegVv00HPi6zZXHP0hvBDMZByxlNkcyIpBlk
	BopGzLrg==;
Received: from ip6-localhost ([::1]:22104 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vE6ZA-009EWs-Hc; Wed, 29 Oct 2025 13:50:21 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:19732) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vE6Jd-0098rs-OT
 for samba-technical@lists.samba.org; Wed, 29 Oct 2025 13:34:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=nhAdaTJMAdKZUNClUnrDVUlzVRxvoM7BSULl5H21iQ0=; b=JS/3IZv88ZdLQl9hRH2RZUNg8z
 yrjC+TSMoE7NVykocj8VNpPgTaJP/81fiUWCLfIynKzqDWFx6xPHivBVpEWn2tdUKwqNu9IdljuS9
 m9ndRXAznIaD2oe5popVmlJotdBQKwHmryxRs8dJxpKZrcpKwiLwd5/L9zpOY/WQ7PHkM3gR48LBJ
 YRLfunaitH/HPVT0qvP75f3/TNrZYmPXzUJeW8gkhPOH5vhqXFzmyZaU9r16OpKsXRDX7sUdQTXCF
 ieVrujKT2b+eRmYsjtF+bqigxx0qEpcamk9s26WJBjRQwXfrthUdct+JCbaTkclDuqExKUbERlj9i
 GCNXWTcBbTYsQc+BhDOBGrMovPGYPJlMyH8+uFZmJ4edH5S34d39ohrvv9r/XRxWpi8Z9nYyNJ0T6
 kRL+trUKNxvwHvMmpHVf62KnwJf1xKDqAMd8JDXFNgpffm01xaqTkw6DO8ea7FH4UDzJIWtHCuSqr
 Jaaicd+nKUtT5Fq4Cr4fbkFV;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vE6Ja-00Bd1v-2U; Wed, 29 Oct 2025 13:34:14 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v2 117/127] smb: server: make use of
 smbdirect_connection_request_keep_alive()
Date: Wed, 29 Oct 2025 14:21:35 +0100
Message-ID: <cbc34a7d8372a2d59120a012081f4c0b442e7be9.1761742839.git.metze@samba.org>
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
 Tom Talpey <tom@talpey.com>, Namjae Jeon <linkinjeon@kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This will help to share more common code soon.

Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
---
 fs/smb/server/transport_rdma.c | 19 +------------------
 1 file changed, 1 insertion(+), 18 deletions(-)

diff --git a/fs/smb/server/transport_rdma.c b/fs/smb/server/transport_rdma.c
index 55757c66cd44..72cd64149785 100644
--- a/fs/smb/server/transport_rdma.c
+++ b/fs/smb/server/transport_rdma.c
@@ -492,23 +492,6 @@ static int smb_direct_read(struct ksmbd_transport *t, char *buf,
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
@@ -644,7 +627,7 @@ static int smb_direct_create_header(struct smbdirect_socket *sc,
 	packet->credits_granted = cpu_to_le16(new_credits);
 
 	packet->flags = 0;
-	if (manage_keep_alive_before_sending(sc))
+	if (smbdirect_connection_request_keep_alive(sc))
 		packet->flags |= cpu_to_le16(SMBDIRECT_FLAG_RESPONSE_REQUESTED);
 
 	packet->reserved = 0;
-- 
2.43.0


