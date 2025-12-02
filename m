Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 470D7C9D080
	for <lists+samba-technical@lfdr.de>; Tue, 02 Dec 2025 22:16:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=ETifBO0BRItXYdw2g8UEDYG5jajyOkRES59f2VUFBMk=; b=R/GUrl+o3cjLDCr/9qglL5KcKE
	thfiWpGbx2Fl5si2zHsriSgfovIy44eRq3HKmaO/pq6XtqgwEw2A2cxVrD1MXzSmexWaxp5dc3CD5
	/coWoaTam+EgyssuUN32lH9bPtvXDh+S/PuLZLVdA/ga4zC1snp7KmUAfGrX9IL1cE/4N+fyfrOXK
	UgUKfmEHEGrwC0fwH9rz3l+oGPMYYd6GgvjBkX8S1oziLCg9yonjA5Qk5dtpL8L0YZxKtmnlQ2rDi
	LjMcD5v/ErW5ADEVG5J/ebCfPQLUicJ92Z8/DKzQNGOq568FlsYQv2hkWS+I+zoDkZvodOBDxTQ8S
	crHf7qsg==;
Received: from ip6-localhost ([::1]:54200 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vQXj8-00FbIG-2l; Tue, 02 Dec 2025 21:16:02 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:53424) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vQXj4-00FbI9-5G
 for samba-technical@lists.samba.org; Tue, 02 Dec 2025 21:16:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=ETifBO0BRItXYdw2g8UEDYG5jajyOkRES59f2VUFBMk=; b=eZ1uqJbVLSNunOTtAIIH6+cjRE
 1tY2sYgWIvaASJZtkKIl+54Veud9peLCWJ98iVAPYDJkdxxaIzEhav6Mj2wSHmptllpTxaIGauJKn
 B6arNtV/2TvKVOdNVKrefrbS6WYaTF1W1Eb51NWwDZX3d4Vb9V2A0z6Dl75yHYpjCyEewmF7sr89D
 fz9g43bC7FlX7JHvo8RzWyh/dUDS3bB2/OmeOZGBYQb8sjyQ955eTPFzjTskTEAnIfOcVa8Fk1Wt1
 C5LOVJmr5NxQQ4FfjS1HD5pikSaHbHeElBBs8OF1js4f3obWTnl8Z+X3QlbkPs9s2doN29UjmVx6U
 WM0Na6yCpQRzrRPxFzmkis4AordC5NO7mN28C/Hkv+PPi81gFxeNVh/ChbD+jLouB19R1v5DuZEVJ
 BvmOte8RoILYXKRX+/vp8dJe0Ak1Lp9tWkvqHH5QGocURGxpYzo4+k2ySCMqeiWFb/SfaWq/HmWE4
 CWRxiMGqlRFPRzfs4RS6i7gw;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vQXj3-00Ghsx-0u; Tue, 02 Dec 2025 21:15:57 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [RFC PATCH 2/4] smb: server: initialize recv_io->cqe.done = recv_done
 just once
Date: Tue,  2 Dec 2025 22:15:25 +0100
Message-ID: <212a61f6053319e9114ebb55319dc0ad71c6204a.1764709225.git.metze@samba.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1764709225.git.metze@samba.org>
References: <cover.1764709225.git.metze@samba.org>
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

smbdirect_recv_io structures are pre-allocated so we can set the
callback function just once.

This will make it easy to move smb_direct_post_recv to common code
soon.

Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
Signed-off-by: Steve French <stfrench@microsoft.com>
---
 fs/smb/server/transport_rdma.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/fs/smb/server/transport_rdma.c b/fs/smb/server/transport_rdma.c
index 4e7ab8d9314f..222d1b5365e8 100644
--- a/fs/smb/server/transport_rdma.c
+++ b/fs/smb/server/transport_rdma.c
@@ -758,7 +758,6 @@ static int smb_direct_post_recv(struct smbdirect_socket *sc,
 		return ret;
 	recvmsg->sge.length = sp->max_recv_size;
 	recvmsg->sge.lkey = sc->ib.pd->local_dma_lkey;
-	recvmsg->cqe.done = recv_done;
 
 	wr.wr_cqe = &recvmsg->cqe;
 	wr.next = NULL;
@@ -2339,6 +2338,7 @@ static int smb_direct_prepare(struct ksmbd_transport *t)
 
 static int smb_direct_connect(struct smbdirect_socket *sc)
 {
+	struct smbdirect_recv_io *recv_io;
 	int ret;
 
 	ret = smb_direct_init_params(sc);
@@ -2353,6 +2353,9 @@ static int smb_direct_connect(struct smbdirect_socket *sc)
 		return ret;
 	}
 
+	list_for_each_entry(recv_io, &sc->recv_io.free.list, list)
+		recv_io->cqe.done = recv_done;
+
 	ret = smb_direct_create_qpair(sc);
 	if (ret) {
 		pr_err("Can't accept RDMA client: %d\n", ret);
-- 
2.43.0


