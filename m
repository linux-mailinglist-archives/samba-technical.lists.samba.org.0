Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 53510B34D95
	for <lists+samba-technical@lfdr.de>; Mon, 25 Aug 2025 23:07:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=EHCJGSztatIzvewE30sb0Aqd1xrRp5FNsdWHZU/dZPA=; b=ltDcDU41oca1dsnTCP6h1n0Nc3
	qzfmDi4svwn7HLN2L2eikjBX8m8bB4RiyxmoA9inj+j+AyK0KA3Xk0NPqO5D9xCexUJJS5X0S5cUG
	RXI39xxnhuaLNZO6S/oF7vF24rX4KDbO7wgixIAZCJxItTSCTDw5vJPFi7p8w3KlFjpJsgpS5ikfc
	Ay2W0u0D1ypCnK7PYrXmFINKNnp/p8hOGFQeE5jWmmEiMUhQ2UxkO0tgJatVWfgJgiq0+KzY4+gcG
	1w+obtbBlt4xs06+ni399epceY2hsvYcMaKAljImMGhgHl2kcMlYjTbFXh/AX2xnPR/ZbQBNfjkd0
	ibKC1Vzw==;
Received: from ip6-localhost ([::1]:46550 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uqePL-000VEr-Go; Mon, 25 Aug 2025 21:07:15 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:29138) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uqeKh-000TGC-Qa
 for samba-technical@lists.samba.org; Mon, 25 Aug 2025 21:02:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=EHCJGSztatIzvewE30sb0Aqd1xrRp5FNsdWHZU/dZPA=; b=xhoHXX5C4o3q/fkPwkqX1mj8Up
 YZ1zzx8gBTS5FqAqHcITFvp7hur2n3R/nStjUl0aZFwd2y5Z/AC8u+jVCIPa7MmVpsEhKh9v8UYPL
 icGzz9Xf42duCbTJLEmnblLsOWg0MOpNz7B8KjttvKu+gbRj8pqCSbjVchVQ8IqgZmc/obMcmcfys
 blqV8S7hEkQfTfsE28zbRsQ2RO9CdwckHCT2GA4RPG4vDfLmW3zpcZ2AG6sd5KYRd1bbAsobIMRRJ
 1736SdZZ/ZYRGwSPYdwRAxt63NOmttVMPICCCoqAq2mdgIsEnj6epnA+cgkoT+ceWZz2S2oA4QTb3
 owX2yXwVzko2W98gDb+RiU7bhu89YmyyGdxTCA3a5okMzVOD/f6zw3LYzu4YFK/RDxA2yfs01HJPW
 RBt7jnGSVunw/0/uf4H5kndex3dFQ6FVonnTfnM4Vbjiw0Fg4aBTrdDe4T/hInGXNvRsI+uRE1kC0
 5uixUyrC0eqaPIQSFJiv3O0l;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uqeKf-000nLS-0e; Mon, 25 Aug 2025 21:02:25 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v4 124/142] smb: server: pass struct smbdirect_socket to
 smb_direct_post_recv()
Date: Mon, 25 Aug 2025 22:41:25 +0200
Message-ID: <72569a316bb1cbc21a80ff48accda6eb9f27a380.1756139607.git.metze@samba.org>
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
 fs/smb/server/transport_rdma.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/fs/smb/server/transport_rdma.c b/fs/smb/server/transport_rdma.c
index 2650c6c5e1af..21271c8a9573 100644
--- a/fs/smb/server/transport_rdma.c
+++ b/fs/smb/server/transport_rdma.c
@@ -620,10 +620,9 @@ static void recv_done(struct ib_cq *cq, struct ib_wc *wc)
 	smb_direct_disconnect_rdma_connection(sc);
 }
 
-static int smb_direct_post_recv(struct smb_direct_transport *t,
+static int smb_direct_post_recv(struct smbdirect_socket *sc,
 				struct smbdirect_recv_io *recvmsg)
 {
-	struct smbdirect_socket *sc = &t->socket;
 	struct smbdirect_socket_parameters *sp = &sc->parameters;
 	struct ib_recv_wr wr;
 	int ret;
@@ -780,8 +779,6 @@ static void smb_direct_post_recv_credits(struct work_struct *work)
 {
 	struct smbdirect_socket *sc =
 		container_of(work, struct smbdirect_socket, recv_io.posted.refill_work);
-	struct smb_direct_transport *t =
-		container_of(sc, struct smb_direct_transport, socket);
 	struct smbdirect_recv_io *recvmsg;
 	int credits = 0;
 	int ret;
@@ -794,7 +791,7 @@ static void smb_direct_post_recv_credits(struct work_struct *work)
 
 			recvmsg->first_segment = false;
 
-			ret = smb_direct_post_recv(t, recvmsg);
+			ret = smb_direct_post_recv(sc, recvmsg);
 			if (ret) {
 				pr_err("Can't post recv: %d\n", ret);
 				put_recvmsg(sc, recvmsg);
@@ -1722,7 +1719,7 @@ static int smb_direct_prepare_negotiation(struct smb_direct_transport *t)
 	if (!recvmsg)
 		return -ENOMEM;
 
-	ret = smb_direct_post_recv(t, recvmsg);
+	ret = smb_direct_post_recv(sc, recvmsg);
 	if (ret) {
 		pr_err("Can't post recv: %d\n", ret);
 		goto out_err;
-- 
2.43.0


