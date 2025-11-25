Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 187A4C8696E
	for <lists+samba-technical@lfdr.de>; Tue, 25 Nov 2025 19:24:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=5UiHmF5qdnfn3Z/sWHoIjWsSJReGVGhwC9wdigR0CU8=; b=KIquSYQpqcn4FJkAFt3cHwTxbQ
	oCepEKDHYgOfkX1i6E0HzLakKO1P/8wjUvKCkKKb8k9iX3amhohj+vTS17DtwabpEi+Uai4Q9n1ls
	0ls9mfgVXSojr+V3lMaDe7olXvNI5sToDa7iEqHvefFOc51Bx7Kgtg3t32wLL0K+RVgQ3Z/Aa4tz6
	Faf0CaLbjC/f6vRsn9EurryKQ1rPA20Xp6EjEvjxgStlx35vHDDDaUjvdfJKvLMKYeWq9SixLxHjG
	sURMomaFOqej4hr2ulhkS6cbYdR0Z77V2FeSQrDK3X741V7pHF9GODodXP6SELkWlixHa1CNvZRQt
	zxk6RdJA==;
Received: from ip6-localhost ([::1]:23806 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vNxiF-00DF7D-UW; Tue, 25 Nov 2025 18:24:28 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:37834) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vNxgD-00DEbu-5F
 for samba-technical@lists.samba.org; Tue, 25 Nov 2025 18:22:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=5UiHmF5qdnfn3Z/sWHoIjWsSJReGVGhwC9wdigR0CU8=; b=k5c+JGOKrx4IIoQWLOOboZB7Kr
 ctav8aOGAnJOrrM/f1yP6+G+wN6Og9djVgtk3YWaDMubnmOQFg6jUD/uRUCSwVo1UUtS2bwR0zZfP
 n/XUXLM79UInCSJKhBlektvAmiFocPC5qWCqeMhbm7/rzrVYbRtkzxxjAsVzgvzc5spfNhB0V/05g
 J11lxZEqtYkAEI1K8cr4Zc0CYvgb56cv5r47oIjFPN/PD4LXlmTlLecX7r0mWI3mWvv8Ftnc8wHaY
 ZoEcgtLO47uSgrUq9xN1m42zr1rZhaes1RxfXnq3BB1aRDDx29b0EcRFAET2WCU4RI9cCOZgjFbRm
 AU7y0sLa9hGMhFrGy7rHpblcx0jzvD8oC/dvh5oFnbIji65VOj/XWrSO9O69Q+XMTFYiTqAq4Ya+d
 19R7JbdqNJbNOCZVGwt5UPzZc9jBpt8qTe4SFJpyKqH7rE9cVfx1TIbkukmvU9AqUBLqMqFo+8MwV
 0dwHW65Jhsa5bZ1kOJGRGY0E;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vNxdA-00FeWk-0o; Tue, 25 Nov 2025 18:19:13 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v4 114/145] smb: server: initialize recv_io->cqe.done =
 recv_done just once
Date: Tue, 25 Nov 2025 18:56:00 +0100
Message-ID: <6d9ae90aacbe51bf229020f703bcc3c6538a9331.1764091285.git.metze@samba.org>
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
index ffcfd9f859bf..e0a39558ebff 100644
--- a/fs/smb/server/transport_rdma.c
+++ b/fs/smb/server/transport_rdma.c
@@ -558,7 +558,6 @@ static int smb_direct_post_recv(struct smbdirect_socket *sc,
 		return ret;
 	recvmsg->sge.length = sp->max_recv_size;
 	recvmsg->sge.lkey = sc->ib.pd->local_dma_lkey;
-	recvmsg->cqe.done = recv_done;
 
 	wr.wr_cqe = &recvmsg->cqe;
 	wr.next = NULL;
@@ -1792,6 +1791,7 @@ static int smb_direct_prepare(struct ksmbd_transport *t)
 
 static int smb_direct_connect(struct smbdirect_socket *sc)
 {
+	struct smbdirect_recv_io *recv_io;
 	int ret;
 
 	sc->rdma.cm_id->event_handler = smb_direct_cm_handler;
@@ -1808,6 +1808,9 @@ static int smb_direct_connect(struct smbdirect_socket *sc)
 		return ret;
 	}
 
+	list_for_each_entry(recv_io, &sc->recv_io.free.list, list)
+		recv_io->cqe.done = recv_done;
+
 	ret = smbdirect_connection_create_qp(sc);
 	if (ret) {
 		pr_err("Can't accept RDMA client: %d\n", ret);
-- 
2.43.0


