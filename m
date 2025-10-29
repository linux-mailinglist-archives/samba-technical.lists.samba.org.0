Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id C8BC0C1AE7B
	for <lists+samba-technical@lfdr.de>; Wed, 29 Oct 2025 14:48:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=QT0wcuyTVjBt2vovQItUScCBG/tc9d8Ct1i5N6thBNs=; b=Z5seLDLHTRW27Q/1EdPAL3zjBF
	r9dsQ7V3di6aJsrmCjv4qfP80yzf9EIpmjoWkD3BoPnJ9OsnJsGaS9S0am8iRV7vIXq2x4d+3NVK6
	tp228vlKGB6iGe9mzmO74kYrDhT2orO+n9g2LmXuV2uNdAhEgBL10G0RBJ1Qy+gbYRus0nJF5gT7R
	ArbQBL2H4aD7nVss2b4+gSKd0WzjX6XsZvIzKKjFJSMMnPU1c7MIybYJql1wRbT2eBbdGaKuwKx5a
	87Uveap2J0A+R6tVJRfqgmHAF9BMh35jmJygdTdw6JfwzeIUdJ4/oInAMJtX9eTgSEDUqjeEMhUl4
	V3lNrDvw==;
Received: from ip6-localhost ([::1]:62252 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vE6XD-009Dko-Pb; Wed, 29 Oct 2025 13:48:20 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:61674) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vE6In-0098ZJ-9A
 for samba-technical@lists.samba.org; Wed, 29 Oct 2025 13:33:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=QT0wcuyTVjBt2vovQItUScCBG/tc9d8Ct1i5N6thBNs=; b=3t5xOq7bd7cYTnjGxPJjV2fIYq
 Wq13aQG34ZRotDV6SCRDOJhkb3A28cC4D+J5Ig7yYsVg1MfYQ8Xtja6pevPuTg9eTg8wk+U5Sb1bI
 XMdoyr27+v+QSMI5bahqUY+CYCj/spxGxKmxiAacqaSbWwxTpuLrKWGxd7jwENKE45KqKgGVsk/Gm
 n8oKzbLxmIp/axxyVNWvURDEvrUm+BL6r829bgF7x9ZuzfqZrcfc1YytjBcNPmZ7q4eeVRC/TdCAb
 /z39DbXTJpJAL7Am/LbMmp/HKVhSdagfF96U+ZZ6y7VIvovmd+12RXipNYL+e+BAOR69njm7Z7+WV
 CW9PhrmcYGv2IktvfhsmtOt+w/LGr8ODjM9LYYGVS2037TBkIfoQq9RW5ASD0xiwiiP6bhTF0/keN
 mlXIzC6c+hKE+STHI82Nes0gHITV+hHPop90fB1O5uYGUnr8CxZyAtI/0t6vtZbgHMwEQbnZ8IVWZ
 yUK2bq9FCu6Ri4knHbAPliVX;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vE6Ij-00BcuG-2c; Wed, 29 Oct 2025 13:33:22 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v2 108/127] smb: server: initialize recv_io->cqe.done =
 recv_done just once
Date: Wed, 29 Oct 2025 14:21:26 +0100
Message-ID: <3195bc5e016de833559acabea2bf65ad8ba6cf5b.1761742839.git.metze@samba.org>
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
index 2f55764a5f2e..0919ef007602 100644
--- a/fs/smb/server/transport_rdma.c
+++ b/fs/smb/server/transport_rdma.c
@@ -547,7 +547,6 @@ static int smb_direct_post_recv(struct smbdirect_socket *sc,
 		return ret;
 	recvmsg->sge.length = sp->max_recv_size;
 	recvmsg->sge.lkey = sc->ib.pd->local_dma_lkey;
-	recvmsg->cqe.done = recv_done;
 
 	wr.wr_cqe = &recvmsg->cqe;
 	wr.next = NULL;
@@ -1761,6 +1760,7 @@ static int smb_direct_prepare(struct ksmbd_transport *t)
 
 static int smb_direct_connect(struct smbdirect_socket *sc)
 {
+	struct smbdirect_recv_io *recv_io;
 	int ret;
 
 	sc->rdma.cm_id->event_handler = smb_direct_cm_handler;
@@ -1777,6 +1777,9 @@ static int smb_direct_connect(struct smbdirect_socket *sc)
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


