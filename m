Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E761C86994
	for <lists+samba-technical@lfdr.de>; Tue, 25 Nov 2025 19:26:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=25Y2bje89bkmFk93rvd5Xg4/YUiURq3x5QZeqV+uznM=; b=Gu2SKylzcB217DKjm1BEKa2EC3
	6X1kzj0thvsv2gwlyV7L+pSiDN8/uHTa8J+J0/St1EKB70EiiyGad1IMMdTSw/bl0rVz0eR4eo6cU
	N6Zn/n/sCmFYeR22vfiQVjscRbcN+f/JmAtik2tS9GICQtghKAghJpklIdMABgerH3lCL2MXhfvjI
	TWrc2ZXhgPQ+jT3LlcSg07VrU5qnngGCzvy0T+YRBaHdphkqTbA3tunIw4pBkC6y7BJtI0S+1DC06
	sgVRai0ui2zPN6iuJbqiXLi5pQrEzyjHMq+XpIMHljMKyu4Y5rl6zun4mfRh56XcFg12Y8TbvHwjx
	ejXf4gPA==;
Received: from ip6-localhost ([::1]:22820 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vNxji-00DFaO-FG; Tue, 25 Nov 2025 18:25:59 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:63784) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vNxgf-00DEk8-4q
 for samba-technical@lists.samba.org; Tue, 25 Nov 2025 18:23:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=25Y2bje89bkmFk93rvd5Xg4/YUiURq3x5QZeqV+uznM=; b=TcEGlYxULnfTEmQDY9yX95ypUN
 A8Kdpb7oK0MiYzIUcMbRTmjTOlRtJi8U4xcAzk9P8+KTakPcV5J/75alHxEpSQFNNdVY2RNjPDAyH
 IoOdE6+HHUiVMwSSxiN9h80/ABR1msr1xQzmv/3FocxspxB7MjHt26PIoMAYQBcfyvzrFPV7IJJDX
 5USdQZmoOqJfT7EWCglSJrfudbU5ceRuC2U+1dJV7K/b0RryXrFLnUn1xRTHXQpUlqPKvCwEUmZ1i
 dPdZsXu/6NxDheDK0soKrz7zqtEl9fDmGYRlQFZuFA9c2ORyKT7tTo7QxU8FGkF4UWyXw/CXAazVt
 sjMNQeMDnuSPB2PrVz+4mM6fduIetxe47H9XFk8UZp3RdBgYLYsqUAIPwv767M9tLzWXeDfspnD5m
 K/aggoB2a4oRSwaqHH1VFZMur1h5jBqV2LaeNmPT3vfmprlSm+dR1rn/r0RMYGgXhb3G6rXaW9F8A
 kZ572kmuJVBHEcxy6loHzinP;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vNxg4-00FfLC-2Q; Tue, 25 Nov 2025 18:22:16 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v4 120/145] smb: server: make use of
 smbdirect_socket_destroy_sync()
Date: Tue, 25 Nov 2025 18:56:06 +0100
Message-ID: <8508ad34a578c48db2481cffbb758bc151858992.1764091285.git.metze@samba.org>
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

This is basically the same logic as before, but we now
use common code, which will also be used by the server soon.

Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
Signed-off-by: Steve French <stfrench@microsoft.com>
---
 fs/smb/server/transport_rdma.c | 49 +---------------------------------
 1 file changed, 1 insertion(+), 48 deletions(-)

diff --git a/fs/smb/server/transport_rdma.c b/fs/smb/server/transport_rdma.c
index a6afa7eefa20..19522fc4af38 100644
--- a/fs/smb/server/transport_rdma.c
+++ b/fs/smb/server/transport_rdma.c
@@ -289,56 +289,9 @@ static void smb_direct_free_transport(struct ksmbd_transport *kt)
 static void free_transport(struct smb_direct_transport *t)
 {
 	struct smbdirect_socket *sc = &t->socket;
-	struct smbdirect_recv_io *recvmsg;
-
-	disable_work_sync(&sc->disconnect_work);
-	if (sc->status < SMBDIRECT_SOCKET_DISCONNECTING)
-		smbdirect_socket_cleanup_work(&sc->disconnect_work);
-	if (sc->status < SMBDIRECT_SOCKET_DISCONNECTED)
-		wait_event(sc->status_wait, sc->status == SMBDIRECT_SOCKET_DISCONNECTED);
-
-	/*
-	 * Wake up all waiters in all wait queues
-	 * in order to notice the broken connection.
-	 *
-	 * Most likely this was already called via
-	 * smbdirect_socket_cleanup_work(), but call it again...
-	 */
-	smbdirect_socket_wake_up_all(sc);
-
-	disable_work_sync(&sc->recv_io.posted.refill_work);
-	disable_delayed_work_sync(&sc->idle.timer_work);
-	disable_work_sync(&sc->idle.immediate_work);
-
-	if (sc->rdma.cm_id)
-		rdma_lock_handler(sc->rdma.cm_id);
 
-	if (sc->ib.qp)
-		ib_drain_qp(sc->ib.qp);
-
-	ksmbd_debug(RDMA, "drain the reassembly queue\n");
-	do {
-		unsigned long flags;
-
-		spin_lock_irqsave(&sc->recv_io.reassembly.lock, flags);
-		recvmsg = smbdirect_connection_reassembly_first_recv_io(sc);
-		if (recvmsg) {
-			list_del(&recvmsg->list);
-			spin_unlock_irqrestore(&sc->recv_io.reassembly.lock, flags);
-			smbdirect_connection_put_recv_io(recvmsg);
-		} else {
-			spin_unlock_irqrestore(&sc->recv_io.reassembly.lock, flags);
-		}
-	} while (recvmsg);
-	sc->recv_io.reassembly.data_length = 0;
-
-	smbdirect_connection_destroy_qp(sc);
-	if (sc->rdma.cm_id) {
-		rdma_unlock_handler(sc->rdma.cm_id);
-		rdma_destroy_id(sc->rdma.cm_id);
-	}
+	smbdirect_socket_destroy_sync(sc);
 
-	smbdirect_connection_destroy_mem_pools(sc);
 	ksmbd_conn_free(KSMBD_TRANS(t)->conn);
 }
 
-- 
2.43.0


