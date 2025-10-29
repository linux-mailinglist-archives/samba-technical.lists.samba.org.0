Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id C1DA8C1AD16
	for <lists+samba-technical@lfdr.de>; Wed, 29 Oct 2025 14:40:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=AMLNWWKURVS85TGG02f4PAk+Si3h7n55+l2qCtKWvcE=; b=0eoBbAAEj9iWyGs90qyqzGe1mz
	xEt3Yho/evgJhbhtVwMhrNYpULEE7lFcoKyqTRAYbK25gKvEeAKNYNck/AKZxA8ECqyEPXptxy4G0
	WoxP6l9OTXd/e0fXHCZFiT+ZXcvnw4ENwB3dep6MsA2LTUKt+I7aLbtVFGsmEP5vXwnZ444ErunOg
	SxgsHIat4FneV5weA6J6W1iZv2psr1NGQ9sWGJfAcKL2V2CUDh5g8rKfjsI+2wSK2uD8bVP2+TGSO
	91MEKLNi86U54rXr4WltDH+eP/6u/1vLY9hR+QVzv5ZCojHVxY6JNj+e5C/DshI1HGA/4+ZsUGbzb
	uKYx7+lA==;
Received: from ip6-localhost ([::1]:31036 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vE6Px-009B4R-5t; Wed, 29 Oct 2025 13:40:50 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:35146) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vE6FD-0097Ng-9S
 for samba-technical@lists.samba.org; Wed, 29 Oct 2025 13:29:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=AMLNWWKURVS85TGG02f4PAk+Si3h7n55+l2qCtKWvcE=; b=EkqQsy4RcWC5uVDt68Qt6CpVzw
 vUcd9jmut+gyJj3keyooEipiwBsCa/6LUZjjEjw8IipUchsivdGwIkJ5ovMYMZArwiAFLu1RVafTT
 GTE13d1EosZCIfdSUzEWaAto8oVZwMRbSJugdrwpbABCJd9UP7OB4lcbimV6Y/orTSaLuYt5xLpJ0
 VyDAotKHLWZzDiClMs0EKMz6ZsVrnf26gzaWPehF/sTM0OyRaAWyIjVhk2h9kjs3u36aMMkuXvetw
 pmH/YLtAvOr/2ZE8R8UVBMNBYjnB1+SgllMavPKMCy4O9FBy6SWP8LjIMCHD9WSudKVkdfFZC3ok5
 4f4I01IatozhPtll2KjI3ey1HZXzz6V2UYri+Ms/5cRV0b+AU2TPhQcISPuUlUrPyWyMWAgiFVemo
 wh6YULPgv9YsBgXXuvJAiiwLiQ9VPkDVIxsNi4IBc3H1wKGrADFddavztoF+GZeracBn6qW5u7lDr
 Y/Kk+WhxS7RAhgUEAYX+AGYO;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vE6F9-00BcHX-1Z; Wed, 29 Oct 2025 13:29:39 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v2 073/127] smb: client: initialize recv_io->cqe.done =
 recv_done just once
Date: Wed, 29 Oct 2025 14:20:51 +0100
Message-ID: <858013eba1c21c5913c21eff68efab9e9b66b94c.1761742839.git.metze@samba.org>
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
Cc: Tom Talpey <tom@talpey.com>, metze@samba.org,
 Steve French <smfrench@gmail.com>, Namjae Jeon <linkinjeon@kernel.org>,
 Steve French <stfrench@microsoft.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

smbdirect_recv_io structures are pre-allocated so we can set the
callback function just once.

This will make it easy to move smbd_post_recv() to common code
soon.

Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: Long Li <longli@microsoft.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
Signed-off-by: Steve French <stfrench@microsoft.com>
---
 fs/smb/client/smbdirect.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/fs/smb/client/smbdirect.c b/fs/smb/client/smbdirect.c
index 59ab8489ad9f..60582394ba29 100644
--- a/fs/smb/client/smbdirect.c
+++ b/fs/smb/client/smbdirect.c
@@ -1079,8 +1079,6 @@ static int smbd_post_recv(
 	response->sge.length = sp->max_recv_size;
 	response->sge.lkey = sc->ib.pd->local_dma_lkey;
 
-	response->cqe.done = recv_done;
-
 	recv_wr.wr_cqe = &response->cqe;
 	recv_wr.next = NULL;
 	recv_wr.sg_list = &response->sge;
@@ -1288,6 +1286,7 @@ static struct smbd_connection *_smbd_get_connection(
 	__be32 ird_ord_hdr[2];
 	char wq_name[80];
 	struct workqueue_struct *workqueue;
+	struct smbdirect_recv_io *recv_io;
 
 	/*
 	 * Create the initial parameters
@@ -1392,6 +1391,9 @@ static struct smbd_connection *_smbd_get_connection(
 		goto allocate_cache_failed;
 	}
 
+	list_for_each_entry(recv_io, &sc->recv_io.free.list, list)
+		recv_io->cqe.done = recv_done;
+
 	INIT_WORK(&sc->idle.immediate_work, send_immediate_empty_message);
 	/*
 	 * start with the negotiate timeout and SMBDIRECT_KEEPALIVE_PENDING
-- 
2.43.0


