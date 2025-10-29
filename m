Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 91543C1AA6C
	for <lists+samba-technical@lfdr.de>; Wed, 29 Oct 2025 14:25:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=TZmLaAXpqeIVClbdHn3MsOEzdSOfsgLafNz0xtxcogo=; b=YFs86S6E0uebff2bBSRkH/12sf
	JssBzhBec1RCZe7lN+aLgAHmaxTCgfmSEQIQNABNFRsd0zTuipx82gegEPql8GAhdYzM5fQCES2XT
	Ab+fHfdtnkc2wQfnXA56gSdeHwn92hO66TOvs3fcM0SC3Uen7/3EurwUTgd47HkW+kWiSferTrFpR
	pNFFZEfGYnz3VPhdJy+d8vKMNRDz6fpnNIgaa+5okvm/XV8h/1rsNT3Y+4RjUupj3l7hWjoNRCjQs
	NmDKWqkZoCbW2i68j3sh7z7nGkmYohjbpezYGVy02/GJX+THkshfRiqgNPHH+6TyKkXDo0t4T/C7h
	82ARkizA==;
Received: from ip6-localhost ([::1]:46934 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vE6BB-0095yO-4F; Wed, 29 Oct 2025 13:25:34 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:21184) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vE69O-0095Uj-6D
 for samba-technical@lists.samba.org; Wed, 29 Oct 2025 13:23:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=TZmLaAXpqeIVClbdHn3MsOEzdSOfsgLafNz0xtxcogo=; b=E3laA9mrgpKO8Aggzkf9x/JTiU
 DdfY4aCWc0yriHo0pK4MzNa36O47CD2JiZYxLA7Ef1nKQunmAqq2dua19MV0nURkcZzCVLtJwAFjp
 NaCUU96vHAQdTJ2kVfGeAr4j4QjcA80TK/OYy0QhaEi6siOjgwCdWmnqcNSgz63oIJYNNJgAUiFVS
 UoMEJMy7adLCEJCeLEl6meug6ioM+xjIc0p/w4K/CWGQN4T7Mv2WAnOu2KyCoqov3IF6HYYAunHl7
 XWN9nv7cBQHqCe13B0RSYwzxS7She/pt8PKXGRTeQ0dJtOCpiZiKyYe+6Fjz5jvV2GIwWzBe9hQJp
 Uf7mnn297omLsnpuVOy6Qjz4A430Tti7b6tGh0/uPExDzPMU/YzxOE3dFtkfwwJ8KyFZba5PW9pAH
 wEFMp3/IAPIODDy8oSD7OdxcGtlJxXdqn4PqlDPqjYJ9jBzwY4DR7Ws0FVh93iE3cQzxi5kt7tbE6
 l9vqYDl2MfVgJXGUIK+fxx/U;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vE69K-00BbLf-0C; Wed, 29 Oct 2025 13:23:38 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v2 011/127] smb: smbdirect: introduce
 smbdirect_connection_disconnect_work()
Date: Wed, 29 Oct 2025 14:19:49 +0100
Message-ID: <b58745db371ade63c3a49b716b0afffb38143f73.1761742839.git.metze@samba.org>
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

This is basically a copy of smbd_disconnect_rdma_work() and
smb_direct_disconnect_rdma_work() and will replace them in the
next steps.

It also makes sure it's never used in an interrupt, which is
not expected anyway...

Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: Long Li <longli@microsoft.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
Signed-off-by: Steve French <stfrench@microsoft.com>
---
 .../common/smbdirect/smbdirect_connection.c   | 68 +++++++++++++++++++
 1 file changed, 68 insertions(+)

diff --git a/fs/smb/common/smbdirect/smbdirect_connection.c b/fs/smb/common/smbdirect/smbdirect_connection.c
index 654719f4388a..ebf47baa5d25 100644
--- a/fs/smb/common/smbdirect/smbdirect_connection.c
+++ b/fs/smb/common/smbdirect/smbdirect_connection.c
@@ -6,6 +6,8 @@
 
 #include "smbdirect_internal.h"
 
+static void smbdirect_connection_disconnect_work(struct work_struct *work);
+
 __maybe_unused /* this is temporary while this file is included in orders */
 static void smbdirect_socket_prepare_create(struct smbdirect_socket *sc,
 					    const struct smbdirect_socket_parameters *sp,
@@ -23,6 +25,8 @@ static void smbdirect_socket_prepare_create(struct smbdirect_socket *sc,
 	 * Remember the callers workqueue
 	 */
 	sc->workqueue = workqueue;
+
+	INIT_WORK(&sc->disconnect_work, smbdirect_connection_disconnect_work);
 }
 
 __maybe_unused /* this is temporary while this file is included in orders */
@@ -62,3 +66,67 @@ static void smbdirect_connection_wake_up_all(struct smbdirect_socket *sc)
 	wake_up_all(&sc->mr_io.ready.wait_queue);
 	wake_up_all(&sc->mr_io.cleanup.wait_queue);
 }
+
+static void smbdirect_connection_disconnect_work(struct work_struct *work)
+{
+	struct smbdirect_socket *sc =
+		container_of(work, struct smbdirect_socket, disconnect_work);
+
+	/*
+	 * This should not never be called in an interrupt!
+	 */
+	WARN_ON_ONCE(in_interrupt());
+
+	/*
+	 * make sure this and other work is not queued again
+	 * but here we don't block and avoid
+	 * disable[_delayed]_work_sync()
+	 */
+	disable_work(&sc->disconnect_work);
+	disable_work(&sc->recv_io.posted.refill_work);
+	disable_work(&sc->mr_io.recovery_work);
+	disable_work(&sc->idle.immediate_work);
+	disable_delayed_work(&sc->idle.timer_work);
+
+	if (sc->first_error == 0)
+		sc->first_error = -ECONNABORTED;
+
+	switch (sc->status) {
+	case SMBDIRECT_SOCKET_NEGOTIATE_NEEDED:
+	case SMBDIRECT_SOCKET_NEGOTIATE_RUNNING:
+	case SMBDIRECT_SOCKET_NEGOTIATE_FAILED:
+	case SMBDIRECT_SOCKET_CONNECTED:
+	case SMBDIRECT_SOCKET_ERROR:
+		sc->status = SMBDIRECT_SOCKET_DISCONNECTING;
+		rdma_disconnect(sc->rdma.cm_id);
+		break;
+
+	case SMBDIRECT_SOCKET_CREATED:
+	case SMBDIRECT_SOCKET_RESOLVE_ADDR_NEEDED:
+	case SMBDIRECT_SOCKET_RESOLVE_ADDR_RUNNING:
+	case SMBDIRECT_SOCKET_RESOLVE_ADDR_FAILED:
+	case SMBDIRECT_SOCKET_RESOLVE_ROUTE_NEEDED:
+	case SMBDIRECT_SOCKET_RESOLVE_ROUTE_RUNNING:
+	case SMBDIRECT_SOCKET_RESOLVE_ROUTE_FAILED:
+	case SMBDIRECT_SOCKET_RDMA_CONNECT_NEEDED:
+	case SMBDIRECT_SOCKET_RDMA_CONNECT_RUNNING:
+	case SMBDIRECT_SOCKET_RDMA_CONNECT_FAILED:
+		/*
+		 * rdma_{accept,connect}() never reached
+		 * RDMA_CM_EVENT_ESTABLISHED
+		 */
+		sc->status = SMBDIRECT_SOCKET_DISCONNECTED;
+		break;
+
+	case SMBDIRECT_SOCKET_DISCONNECTING:
+	case SMBDIRECT_SOCKET_DISCONNECTED:
+	case SMBDIRECT_SOCKET_DESTROYED:
+		break;
+	}
+
+	/*
+	 * Wake up all waiters in all wait queues
+	 * in order to notice the broken connection.
+	 */
+	smbdirect_connection_wake_up_all(sc);
+}
-- 
2.43.0


