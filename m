Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 060ECB34D98
	for <lists+samba-technical@lfdr.de>; Mon, 25 Aug 2025 23:07:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=sEx3QFdjEkA0y5gDw1Fi6L8D2zym5QFaV4mLVFpID2g=; b=nZTpWQH9wckPJmh+3PmQ9vN5WN
	FdIM8CFQGpINn/PEJFA6TLLJ4HNxYpm5i5BKFVVJ4Vt57z0E7qNuheAM82k5XxGHcWid3I2HKUWVM
	ZHIx1p03Cr1ds5VYwFZADKTtHqLxYaFeT8z2JiXK/Wsx3RlHzJIK6BJJkCRdQ3wwpVy25fo1Tg+LR
	04RX8W8v9jKpEebnrxT7BrPiTEQdX5qfDQEv2Mg7ACsSLgVegjc3PcQ/GyWctTMV7nR+JgNZiyjJk
	vqjDZ40t+i+cnzHiIFsKMMeObJWmc4tdy/k9VvYBpsw2Xs/sU75xwtSyufQJ/Jj7tWvaLwuSkwNxt
	kqO2v0xQ==;
Received: from ip6-localhost ([::1]:20842 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uqePr-000VTM-25; Mon, 25 Aug 2025 21:07:47 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:32520) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uqeLA-000TS9-5v
 for samba-technical@lists.samba.org; Mon, 25 Aug 2025 21:03:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=sEx3QFdjEkA0y5gDw1Fi6L8D2zym5QFaV4mLVFpID2g=; b=ozTjWVOXWkX0TOlKkzZAgAgIBy
 7UBqOSZsSveJIqRmVt8dPneYI0GjC83TIfIEPGtGj4T1zWOmWB12t7V5tBDvdhZdOMhDNKuSTs6Pq
 D3FzdnFadPovSPDD3AdmziimXgBpCKP17HSDOBKiaxlCNBeHr7jvWnc4ZFjsaW3Z9VISNda2Frxak
 nn91uNVbFa2ZpTUAhRDi3HEf7ol/h7J+IwFh0V1b/4haoeoUm+2hRIQk7Zp4eOKEAqlaiqy7c923G
 mHHPgVGK59YDa12ngob328+hADybVVlONFP9N6810ljnw8lbeMkFeU73tE0tGDjhj3Ke4YwWWpaOR
 vWRul+7wcuk12DuIvgLCIUQFfQMZBfSPMQVjpEVMhzy2FrH3A8EJnwIf2eKPMQ7ZRm4D1xVIDHL56
 NryGYC7xqaeW0I614nZ0AXnapcclNPaisqv/adzWFkjAJuTQpxbzQG+y/1QsB+Oxe66/zifEdsLZN
 M6JFSAKYU/ENgbEhV6XMRhUz;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uqeL8-000nRT-0J; Mon, 25 Aug 2025 21:02:54 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v4 127/142] smb: server: pass struct smbdirect_socket to
 smb_direct_connect()
Date: Mon, 25 Aug 2025 22:41:28 +0200
Message-ID: <6744a08262b4b7df63ee1a8576d8887407a6f270.1756139607.git.metze@samba.org>
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
index 48f739af65e9..4551abb7bf92 100644
--- a/fs/smb/server/transport_rdma.c
+++ b/fs/smb/server/transport_rdma.c
@@ -2038,11 +2038,10 @@ static int smb_direct_prepare(struct ksmbd_transport *t)
 	return ret;
 }
 
-static int smb_direct_connect(struct smb_direct_transport *st)
+static int smb_direct_connect(struct smbdirect_socket *sc)
 {
-	struct smbdirect_socket *sc = &st->socket;
-	int ret;
 	struct ib_qp_cap qp_cap;
+	int ret;
 
 	ret = smb_direct_init_params(sc, &qp_cap);
 	if (ret) {
@@ -2166,7 +2165,7 @@ static int smb_direct_handle_connect_request(struct rdma_cm_id *new_cm_id,
 		sp->responder_resources = min_t(u8, sp->responder_resources,
 					       peer_responder_resources);
 
-	ret = smb_direct_connect(t);
+	ret = smb_direct_connect(sc);
 	if (ret)
 		goto out_err;
 
-- 
2.43.0


