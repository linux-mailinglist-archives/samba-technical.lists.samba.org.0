Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B6C98BF1BB1
	for <lists+samba-technical@lfdr.de>; Mon, 20 Oct 2025 16:08:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=Ed4fK+ZnP6nEhONReVTtgBkffmW6wnsU1RMQraJBj68=; b=R8XKNiRmCacpyJRAyRUMzlvKjo
	XUS+gjF3vQRSw1vX9Jwvo9JJ7sIm35ibjy+63XpS1sancIiR0B0qDDt0GyfnMYgPeS1K1jywJcTxg
	Y7iTnHvgOZqFgOgVjyiNqCCC1Vt+Jn7kOCvSVwdO0ytmBgRehvEcDfrQaZ4A9otC6ZFpjM9Zy/H8X
	wUyZlvQNTiCsxWwiUP6nhsRqf6+u5vhENGeqci1V2oBes5BeWFPlIdDJ/MzjOKdLmwT6tRf/yroeO
	8tZZ8y3eY0pDWxSLFGcpfKIw2/sWzEIifdLZ9E/MrliDPtkeuf+5pF3m8quXhN5V/wMO/e0q9KltK
	RFuLH/fw==;
Received: from ip6-localhost ([::1]:41210 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vAqYN-008MoS-4j; Mon, 20 Oct 2025 14:08:03 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:63304) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vAqYH-008MnQ-OO
 for samba-technical@lists.samba.org; Mon, 20 Oct 2025 14:08:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=Ed4fK+ZnP6nEhONReVTtgBkffmW6wnsU1RMQraJBj68=; b=y0aKVQAsEyh/XBpYCaBN4HL+dH
 nVuugCGriBiJ6yE/8Tysgv7RqZFBEHr1pES6oZ8oWX9JLF3l7uj8JwmLYYPRkYujgZmeJmDWOE0zM
 V5FYoEDtoB/NnUABK/2kHmKauumhYNLq6FcsaA4wAlok1J+Y21YWhehg+1b0CxwkttKJ+9PRNgny8
 s72bvtXCMzPSAc3SMR5x5vwsN0msXZRWNugYdKMUhtTMp7/km2RBqqXPUFU9shuIG/MCNnfsJMzFJ
 xjcTo8o0zX07ffk2nWGrlomRoTVkRqWKosZ8wr99Zd70E6NLGfFkPmj/3GaMY1QSXZ3epcKBIJ0On
 RoovSgGc+54osy+o5alY0ZIslvWKShitcZyFyy8dl/TERZi5ypFlCQdv5sSawIm7VIJnu2RHp1zRd
 PI/ATF91N7W0IigjcvCuw+eUP91GgxEyLttD+2+XccqUAGAOPDdKcvAkmJbPZo2yfD0Ldxn+CW4qZ
 JDQ7rGqBFqAxjHLjG4AD598n;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vAqYG-00AATl-2J; Mon, 20 Oct 2025 14:07:56 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH] smb: server: let smb_direct_cm_handler() call ib_drain_qp()
 after smb_direct_disconnect_rdma_work()
Date: Mon, 20 Oct 2025 16:07:53 +0200
Message-ID: <20251020140753.155159-1-metze@samba.org>
X-Mailer: git-send-email 2.43.0
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

All handlers triggered by ib_drain_qp() should already see the
broken connection.

smb_direct_cm_handler() is called under a mutex of the rdma_cm,
we should make sure ib_drain_qp() and all rdma layer logic completes
and unlocks the mutex.

It means free_transport() will also already see the connection
as SMBDIRECT_SOCKET_DISCONNECTED, so we need to call
crdma_[un]lock_handler(sc->rdma.cm_id) around
ib_drain_qp(), rdma_destroy_qp(), ib_free_cq() and ib_dealloc_pd().

Otherwise we free resources while the ib_drain_qp() within
smb_direct_cm_handler() is still running.

We have to unlock before rdma_destroy_id() as it locks again.

Fixes: 141fa9824c0f ("ksmbd: call ib_drain_qp when disconnected")
Fixes: 4c564f03e23b ("smb: server: make use of common smbdirect_socket")
Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
---
 fs/smb/server/transport_rdma.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/fs/smb/server/transport_rdma.c b/fs/smb/server/transport_rdma.c
index 1b597f9f85e3..019e5f70d7b3 100644
--- a/fs/smb/server/transport_rdma.c
+++ b/fs/smb/server/transport_rdma.c
@@ -465,6 +465,9 @@ static void free_transport(struct smb_direct_transport *t)
 	disable_delayed_work_sync(&sc->idle.timer_work);
 	disable_work_sync(&sc->idle.immediate_work);
 
+	if (sc->rdma.cm_id)
+		rdma_lock_handler(sc->rdma.cm_id);
+
 	if (sc->ib.qp) {
 		ib_drain_qp(sc->ib.qp);
 		sc->ib.qp = NULL;
@@ -493,8 +496,10 @@ static void free_transport(struct smb_direct_transport *t)
 		ib_free_cq(sc->ib.recv_cq);
 	if (sc->ib.pd)
 		ib_dealloc_pd(sc->ib.pd);
-	if (sc->rdma.cm_id)
+	if (sc->rdma.cm_id) {
+		rdma_unlock_handler(sc->rdma.cm_id);
 		rdma_destroy_id(sc->rdma.cm_id);
+	}
 
 	smb_direct_destroy_pools(sc);
 	ksmbd_conn_free(KSMBD_TRANS(t)->conn);
@@ -1682,10 +1687,10 @@ static int smb_direct_cm_handler(struct rdma_cm_id *cm_id,
 	}
 	case RDMA_CM_EVENT_DEVICE_REMOVAL:
 	case RDMA_CM_EVENT_DISCONNECTED: {
-		ib_drain_qp(sc->ib.qp);
-
 		sc->status = SMBDIRECT_SOCKET_DISCONNECTED;
 		smb_direct_disconnect_rdma_work(&sc->disconnect_work);
+		if (sc->ib.qp)
+			ib_drain_qp(sc->ib.qp);
 		break;
 	}
 	case RDMA_CM_EVENT_CONNECT_ERROR: {
-- 
2.43.0


