Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 784E2B34D97
	for <lists+samba-technical@lfdr.de>; Mon, 25 Aug 2025 23:07:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=AzoqKD4DGs+JKwATvoIbZq8BPrFHr4SsTooF+wy6t0I=; b=udsgiwsHHq3EC3fkLBFw4+GBMv
	IlYmFcV2FEyYFnTQUWB/OD//O/k8l6qL95PsSBL9GTKcjv+b18/Y0jX+klsqKgb5gk2Sc0U5w1g0a
	AGRv6Qw5OoMgPfIt4IiscnUJNxJak7UPrq6y79Ca4fmANTxGSCbIzpPzwuX5yfiojAZGoKdMMuLme
	ONxJvZpiVImVQDWldJ+gSczvzUUU43HOQsVcn3zRFztNDhVcTpG+6wZ41Pm1jrk4meClM6jFGe+Td
	cjVrA46m9WUofphxkadSmwpebt5hSE12GPV8yuNDM3ZOZRXiRg76cw9QHVEfydPK/ERqGFFte+Ro1
	vy6y3OCA==;
Received: from ip6-localhost ([::1]:46268 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uqePf-000VOn-7l; Mon, 25 Aug 2025 21:07:35 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:52634) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uqeL2-000TP2-IH
 for samba-technical@lists.samba.org; Mon, 25 Aug 2025 21:02:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=AzoqKD4DGs+JKwATvoIbZq8BPrFHr4SsTooF+wy6t0I=; b=Y3Vr0HS495J+uJujNd9I8/jNyp
 ILjDVHQSjd5WdkGrI7f7shvth5uNpkw6YBjQhVhVYL4R/uDIbRteaYEv5vYoVo3vMB5hQ/Y8myrE1
 6ZqF3m+Mu+g1t/DBgEGZIgs8C0AIUhqL2zp8ZpVQVgfJJdkMRONlymD3mVFL0GpD+85qJkAW/qtTo
 9yMI/B3loXhS6p1sme2DCepRJOjfW7y+YFnsPp3LOBYzJU89Wf//KN7W+qmYJRdnhv1CxaN5a6EvG
 i+kP/Ggd/LBgkC20BR7A6lVnUMtWD3p5v6MNmZ57MjODTswltBMAmJxnYbYsgAS2Jw8Mj78s+iX9H
 kFh2VNK3fQ3YnI8z4+ScWg2d0fJ0KhKpsG1ypZuMnuOLRvy75mBDVVPqt3rrKb+24GZARNaU6mcST
 8JjCFIEfznbOwdxYrGjcVrQjHugK8qiVxOSlVNIVTXAatlYpmw2aHBO7dqw+ftRhsWJ2wP5iT/0e7
 dhaU4O+4/epsc7EA/5VhgwSn;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uqeKx-000nPv-2Q; Mon, 25 Aug 2025 21:02:44 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v4 126/142] smb: server: pass struct smbdirect_socket to
 smb_direct_prepare_negotiation()
Date: Mon, 25 Aug 2025 22:41:27 +0200
Message-ID: <1cb0d1dcf980ee599c1a8f1a1c30bdb4292fa788.1756139607.git.metze@samba.org>
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
index 99a8e1b1860d..48f739af65e9 100644
--- a/fs/smb/server/transport_rdma.c
+++ b/fs/smb/server/transport_rdma.c
@@ -1703,11 +1703,10 @@ static int smb_direct_accept_client(struct smbdirect_socket *sc)
 	return 0;
 }
 
-static int smb_direct_prepare_negotiation(struct smb_direct_transport *t)
+static int smb_direct_prepare_negotiation(struct smbdirect_socket *sc)
 {
-	struct smbdirect_socket *sc = &t->socket;
-	int ret;
 	struct smbdirect_recv_io *recvmsg;
+	int ret;
 
 	WARN_ON_ONCE(sc->status != SMBDIRECT_SOCKET_CREATED);
 	sc->status = SMBDIRECT_SOCKET_RDMA_CONNECT_NEEDED;
@@ -2063,7 +2062,7 @@ static int smb_direct_connect(struct smb_direct_transport *st)
 		return ret;
 	}
 
-	ret = smb_direct_prepare_negotiation(st);
+	ret = smb_direct_prepare_negotiation(sc);
 	if (ret) {
 		pr_err("Can't negotiate: %d\n", ret);
 		return ret;
-- 
2.43.0


