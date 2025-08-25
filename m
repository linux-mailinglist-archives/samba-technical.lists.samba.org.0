Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id CA6BEB34CF8
	for <lists+samba-technical@lfdr.de>; Mon, 25 Aug 2025 22:56:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=FI+qEL5myJk6s0GuUe2FtCh+ykqBZBfnhHlRKn1q1XA=; b=mAJJ3rBqdSF4OQkiuDjPZY7+YG
	vfYasB+zZ4Y/EqryFsgoMDAr4A31v9vkY4DKjS9j5+bvkgKROdw3r2kqpybRjXgq8cVYo12n4Z4y9
	oQ3yqDDGq/9Af5YFJX74wJr7G/gONoO5murpDxjGSsIVlh3vsrBT/n2cEyfz7UH5qF2+64J+JjihF
	4umRwhgXxB/NQq6mG+KQmH9L0488Xt0L0JHLj9865cyTKMOjnAhc8DueWMKAgOzn2NngApsBukUCk
	wdhO3Gr/wHecpMAusYmYSaGSiF6Kt1Yj00FF8SGxvhpqjlnc2yqczA7LIz/gBLT+oG2VT9nzMP4r3
	Woc4HmVw==;
Received: from ip6-localhost ([::1]:20100 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uqeEU-000Qe0-IY; Mon, 25 Aug 2025 20:56:03 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:42296) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uqeBZ-000PTM-PA
 for samba-technical@lists.samba.org; Mon, 25 Aug 2025 20:53:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=FI+qEL5myJk6s0GuUe2FtCh+ykqBZBfnhHlRKn1q1XA=; b=IkIF80jgAwdT9F2vAktZdMAtbP
 IAv2P2gVCseiXI8L1r16Yw647bjXu2WeClAPCP+laMN+SSnFffemmZn/HppUGWajemiz/TI52jKJw
 b/Ty9w16ErImqXhEOdE1XhEJriQJSqsHVF5OXj8zPGt9A+vW2k1QjQW7vCKnbq4v3sZrJnVL3WOBk
 /TriWvbhhVTy8UMiWcwwhk7YXweF2zqgrzMrEP0UcNQkc33u+ACK9GKiQPSncpa9O7Gs/REzl/z8j
 JevnzstHSrV2frm1uRX0L0ALxdGrciu1c7VoeGYvAD99U0fm3mBixn//gdZa/RQWnsuHE5VchpG4B
 LA/bFkYz2zrNT2kf7y7J/aEwTW35J2x2X2LUwyZgo145+G9xJz5U1cPfAuJ1Mn7pnFlRRQOFdAByT
 yNw+1k1KOwiCB31dSOGUcb/XMKkCgEUjjfmse+W0vvNL0GVtEgNiQx/dgRmUrPxWhptsH1587YGRV
 eLQSQTam5Sg2Q3Ajd5BzRuEQ;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uqeBW-000lTE-0I; Mon, 25 Aug 2025 20:52:58 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v4 067/142] smb: client: pass struct smbdirect_socket to
 smbd_post_send_full_iter()
Date: Mon, 25 Aug 2025 22:40:28 +0200
Message-ID: <a0c9463c4be4f91a9ad0fc49f7c99d2b5e534788.1756139607.git.metze@samba.org>
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
 fs/smb/client/smbdirect.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/fs/smb/client/smbdirect.c b/fs/smb/client/smbdirect.c
index b9ea58e8db46..baeda2192a27 100644
--- a/fs/smb/client/smbdirect.c
+++ b/fs/smb/client/smbdirect.c
@@ -1145,11 +1145,10 @@ static int smbd_post_send_empty(struct smbdirect_socket *sc)
 	return smbd_post_send_iter(sc, NULL, &remaining_data_length);
 }
 
-static int smbd_post_send_full_iter(struct smbd_connection *info,
+static int smbd_post_send_full_iter(struct smbdirect_socket *sc,
 				    struct iov_iter *iter,
 				    int *_remaining_data_length)
 {
-	struct smbdirect_socket *sc = &info->socket;
 	int rc = 0;
 
 	/*
@@ -2104,13 +2103,13 @@ int smbd_send(struct TCP_Server_Info *server,
 			klen += rqst->rq_iov[i].iov_len;
 		iov_iter_kvec(&iter, ITER_SOURCE, rqst->rq_iov, rqst->rq_nvec, klen);
 
-		rc = smbd_post_send_full_iter(info, &iter, &remaining_data_length);
+		rc = smbd_post_send_full_iter(sc, &iter, &remaining_data_length);
 		if (rc < 0)
 			break;
 
 		if (iov_iter_count(&rqst->rq_iter) > 0) {
 			/* And then the data pages if there are any */
-			rc = smbd_post_send_full_iter(info, &rqst->rq_iter,
+			rc = smbd_post_send_full_iter(sc, &rqst->rq_iter,
 						      &remaining_data_length);
 			if (rc < 0)
 				break;
-- 
2.43.0


