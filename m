Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E719C1AEDB
	for <lists+samba-technical@lfdr.de>; Wed, 29 Oct 2025 14:50:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=4fO5qq0qL1cRiJe7BkTrCJ/qDmRr+WCqwpsq0YtDbsk=; b=Sl3lsNnJqcIX3wHDtnYRvki8FL
	GwpmrBcyrIFRZJI/eo6ilsx1xTxntGccnh2C1IHF5D4CgbNtbv14xg30ldTRquHLY2k1Q/4BlJtDz
	DsveL7cp8V7y3nyf+H+NE7gCd+2JJTR3ZnRh4NyeUWrtyzOjaS7UsNqppui606TrxCx8XY+IoaJWc
	FlrgzZu4JVNT/FnJDigHc4IGQjNI3NINnEoHa4iQTpEzzyYyHREsCgLWmxqNtJEeDkQwTb3K/7IvJ
	cJRsSaOIpmpoWlRk/tPKjuoisdbT+8Eh/QB3NGyc1twsGGByJqaWL0KCdZgwgemZx4p5MnLxvi5T6
	urXkz2nA==;
Received: from ip6-localhost ([::1]:23780 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vE6Yx-009ESr-55; Wed, 29 Oct 2025 13:50:08 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:31652) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vE6JX-0098p1-5J
 for samba-technical@lists.samba.org; Wed, 29 Oct 2025 13:34:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=4fO5qq0qL1cRiJe7BkTrCJ/qDmRr+WCqwpsq0YtDbsk=; b=ce5Eyugm1BmPQnI2OJOltoHTXu
 rUNLLTFCXmbaCrNofWdrpSommRlLGuupoT9unGIiwRclCxyBNpxlUDZXW5ygAVWablb14aL19wUMA
 ObwUaWoITu9mLtfEOH8XNXfzCdjLYDrw+dK8r8CuGubUuHrcMg1AWBFSnwHLq3bwRnHv9UwbGgbz9
 XeBCE2g+G9ZThMH1Va3DHLdO8EYDdtfTiwqHB154CLx08JsqI1KMkeN6zEpSn9Ijuz2846Ao1zNQg
 kdQrD/DuZhCAoZRvW4b43ga92KwPHPOFvngG5C+w5YiAW6LAm+JY9NDzELTqyX0eKArPQ+0M+Y32A
 9vm3WrTq1Gd21nkQpm2gNj8Dbd/zfKCzZnlI+KlLCSZ9SJKwGjID+n7nfQG8PokM/7Z4VFpOyglrr
 HdLYsOb22FDraWy57OLjl1IvlVr9DcHqQoZzetaM80sUtMRq7hi8aKSaVGsFNPspOJgDRVPs0MIf1
 YeZlf5ZrDHokba7oSMqEsVWe;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vE6JU-00Bd1B-06; Wed, 29 Oct 2025 13:34:08 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v2 116/127] smb: server: make use of
 smbdirect_connection_grant_recv_credits()
Date: Wed, 29 Oct 2025 14:21:34 +0100
Message-ID: <bcdf211d9dba43a54b97a85f1f622d762e5e7977.1761742839.git.metze@samba.org>
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

This is already used by the client too and will
help to share more common code.

Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
---
 fs/smb/server/transport_rdma.c | 25 ++++---------------------
 1 file changed, 4 insertions(+), 21 deletions(-)

diff --git a/fs/smb/server/transport_rdma.c b/fs/smb/server/transport_rdma.c
index d64896a2a1d1..55757c66cd44 100644
--- a/fs/smb/server/transport_rdma.c
+++ b/fs/smb/server/transport_rdma.c
@@ -492,25 +492,6 @@ static int smb_direct_read(struct ksmbd_transport *t, char *buf,
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
@@ -648,6 +629,7 @@ static int smb_direct_create_header(struct smbdirect_socket *sc,
 	struct smbdirect_socket_parameters *sp = &sc->parameters;
 	struct smbdirect_send_io *sendmsg;
 	struct smbdirect_data_transfer *packet;
+	u16 new_credits = 0;
 	int header_length;
 	int ret;
 
@@ -658,7 +640,8 @@ static int smb_direct_create_header(struct smbdirect_socket *sc,
 	/* Fill in the packet header */
 	packet = (struct smbdirect_data_transfer *)sendmsg->packet;
 	packet->credits_requested = cpu_to_le16(sp->send_credit_target);
-	packet->credits_granted = cpu_to_le16(manage_credits_prior_sending(sc));
+	new_credits = smbdirect_connection_grant_recv_credits(sc);
+	packet->credits_granted = cpu_to_le16(new_credits);
 
 	packet->flags = 0;
 	if (manage_keep_alive_before_sending(sc))
@@ -1064,7 +1047,7 @@ static int smb_direct_send_negotiate_response(struct smbdirect_socket *sc,
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


