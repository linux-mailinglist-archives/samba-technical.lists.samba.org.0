Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 00659B34D07
	for <lists+samba-technical@lfdr.de>; Mon, 25 Aug 2025 22:57:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=lU2BRT2wsLHZ3vXzRBI9o9DmdnoSuGTY6fGDF4CPwnw=; b=BTWZlt+QPjHdxLRpB2IsdGN/TD
	QMHoUbZhma0yEr1eea/9WnzfNBdqh2t0A8yQeeq031u2thSli4eTQo97R5gI8dRDY254s09GkPgNV
	9L6K8mDuqZ1T+Ybit74u5DnMfaGlFiIfKgIMd2LiFLrgCnEM6qdMHCE81oUD3cKahNoweClg6oxOJ
	Kg94P58kxvE0+5lXKir5MonmgZYwGbqNbtZimz7bztM3fZB+alTxHPYZzebm6VEjrIhAxd2D5s2o7
	yf95gx+ikwqytnv4j2MOE7h4vLY5XVMWJLo8luUDzhpGP3Spvfhj4sDgxnzEnXewqw/z8X59FqlqM
	L7iIMEbQ==;
Received: from ip6-localhost ([::1]:46382 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uqeFh-000R6M-F5; Mon, 25 Aug 2025 20:57:18 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:14366) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uqeCX-000Puq-AE
 for samba-technical@lists.samba.org; Mon, 25 Aug 2025 20:54:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=lU2BRT2wsLHZ3vXzRBI9o9DmdnoSuGTY6fGDF4CPwnw=; b=KR750XXdbvpJMr2wWq7Oa114qh
 sUAc3oGvX+QlJOUV1ZbCeQy0pDENkb0xWFD0GeCnm7sY+8HVAkYFZgev+wVla7h1mu2s83piJv1GA
 f6sKVwDBMuiMypVwjFyb/RRHXm7EDafIeBrg5MUfHDnH3QklmYD6POh9rpcsB+YGxzHR5sArA9Kcu
 B9WuCJqb5Z5ClcjenfqwoN6R18DdBJEYUyFWycuTqR7dr/fwWwGakXZcPPK9RK/wgfFguUK3e2NLB
 V/HThbVIl5yJINPgd9K0GLQSua5P3oPq8m1TzsbBkXUYqDPINMxnUS3mrLW7DvJBDFvM8sqYMusSb
 f1hUUFgv96e05WrhAVB5dy8lJZ75LSF7IgfxfLl0HjE8A4tpem2HvSQOJLZoUiKWZTVaJ2HJ0OvEx
 ids/lbboFy3UHB0oCACYJ03ym1D2Cu8m+wygW0rz2DEd0+sMnIYsi3JMPI+FXDydGOFJdT5ir8Yig
 kvP5MOZ0LUQldH98IQSkaueq;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uqeCT-000leE-2x; Mon, 25 Aug 2025 20:53:58 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v4 073/142] smb: client: pass struct smbdirect_socket to
 smbd_negotiate()
Date: Mon, 25 Aug 2025 22:40:34 +0200
Message-ID: <cb8d7ffbb4a9f01169890f63c86a6ad065a806f3.1756139607.git.metze@samba.org>
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

This will make it easier to move function to the common code
in future.

Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: Long Li <longli@microsoft.com>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
---
 fs/smb/client/smbdirect.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/fs/smb/client/smbdirect.c b/fs/smb/client/smbdirect.c
index e5219b9c0c8a..04f86fde11fe 100644
--- a/fs/smb/client/smbdirect.c
+++ b/fs/smb/client/smbdirect.c
@@ -1202,9 +1202,8 @@ static int smbd_post_recv(
 }
 
 /* Perform SMBD negotiate according to [MS-SMBD] 3.1.5.2 */
-static int smbd_negotiate(struct smbd_connection *info)
+static int smbd_negotiate(struct smbdirect_socket *sc)
 {
-	struct smbdirect_socket *sc = &info->socket;
 	struct smbdirect_socket_parameters *sp = &sc->parameters;
 	int rc;
 	struct smbdirect_recv_io *response = get_receive_buffer(sc);
@@ -1815,7 +1814,7 @@ static struct smbd_connection *_smbd_get_connection(
 
 	INIT_WORK(&sc->recv_io.posted.refill_work, smbd_post_send_credits);
 
-	rc = smbd_negotiate(info);
+	rc = smbd_negotiate(sc);
 	if (rc) {
 		log_rdma_event(ERR, "smbd_negotiate rc=%d\n", rc);
 		goto negotiation_failed;
-- 
2.43.0


