Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C88DB34D94
	for <lists+samba-technical@lfdr.de>; Mon, 25 Aug 2025 23:07:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=uOxATc5RifhFc2jk29RQKrrLWNJmkAYe3y/vjGX65BY=; b=p2tdN4ZR8KRgoyh0SEopzicgbN
	XNAypf1ROhnHa6pcKAT0YKB/qiQXScHarUTMHly7UyW1K0c/ugAQpypEDwIo8p0QlFDm5Ay+r0df8
	m6JO7V3FT9VgxhkUrgFsXPmG5CRa2BnrZN/GyemAVePSTBpCIqtCvF4hFn8f0ta5JauqHmJpcUqJ3
	3izDJRBjiYcAhNq6y5IlzUsInS6Z96f8bhS9yNWUB7c1Pnb4MrGO1BZycI3BtjCyJmRrm01i/kcuo
	TKvsOfFYiDxVwPp55GSjhpC8+YLwr5KMuYNGCOjUJHxHVvzfzpSjCT1Yx4knABtkBCGc8CR9eR7Pj
	uBX4gmnA==;
Received: from ip6-localhost ([::1]:55246 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uqePA-000V9c-Hc; Mon, 25 Aug 2025 21:07:04 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:15734) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uqeKY-000TC6-MM
 for samba-technical@lists.samba.org; Mon, 25 Aug 2025 21:02:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=uOxATc5RifhFc2jk29RQKrrLWNJmkAYe3y/vjGX65BY=; b=1hvp/0H87oLN+YeDPGvJjA85E2
 2BICWsWsTuX16kVa9bK9f3466xDbqN7vDI0e9tvIKFLzleYI3pVjTIq8okbJ8CXLWpUj1gOkr7j0G
 hfyA7CyouaLYuy4GESYG3jtckOf4rloMQJTT/S8mbmkJp9ovuSQSYYWQjAepSkW83Jts1grEMSwKJ
 MDzBdrEcDBGTRQi114T0U+yqT2fxnpdwEswNJvLQtLVShyFLLSfycgdPBM1B55z/98ktMe1m4M3Qq
 QKad3YNyS9RIFi5wa2NvklY7spnx2tt+UMuLI/uPWQ4Lo3qAuAikm1E6dAvYy7Um83BrKc8/mje3n
 /gNeDzZHX4LxgQhrlNjQpxD/Fyyvj/lvDy7GcaY5vb9NNt/BJ4QAXYyFj28nxpB6ZlhAeoNgddn+K
 /xio2MGE5rcr9BC0GQXLhoAul9i9x34HNtrqIwoysdP7I4QiMDPtxf1IRVJUqJqHVDZ/jspRgqZTQ
 zmkeH+1vznPrcsrx6MmC9Pyg;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uqeKW-000nJV-0p; Mon, 25 Aug 2025 21:02:16 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v4 123/142] smb: server: pass struct smbdirect_socket to
 smb_direct_create_qpair()
Date: Mon, 25 Aug 2025 22:41:24 +0200
Message-ID: <16f843d5c32cc39176d4cfe3f85569ad09826f16.1756139607.git.metze@samba.org>
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
 fs/smb/server/transport_rdma.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/fs/smb/server/transport_rdma.c b/fs/smb/server/transport_rdma.c
index c3be52f251c4..2650c6c5e1af 100644
--- a/fs/smb/server/transport_rdma.c
+++ b/fs/smb/server/transport_rdma.c
@@ -1894,10 +1894,9 @@ static int smb_direct_create_pools(struct smbdirect_socket *sc)
 	return -ENOMEM;
 }
 
-static int smb_direct_create_qpair(struct smb_direct_transport *t,
+static int smb_direct_create_qpair(struct smbdirect_socket *sc,
 				   struct ib_qp_cap *cap)
 {
-	struct smbdirect_socket *sc = &t->socket;
 	struct smbdirect_socket_parameters *sp = &sc->parameters;
 	int ret;
 	struct ib_qp_init_attr qp_attr;
@@ -2062,7 +2061,7 @@ static int smb_direct_connect(struct smb_direct_transport *st)
 		return ret;
 	}
 
-	ret = smb_direct_create_qpair(st, &qp_cap);
+	ret = smb_direct_create_qpair(sc, &qp_cap);
 	if (ret) {
 		pr_err("Can't accept RDMA client: %d\n", ret);
 		return ret;
-- 
2.43.0


