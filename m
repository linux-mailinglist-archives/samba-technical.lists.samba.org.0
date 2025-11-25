Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D3DAC867F5
	for <lists+samba-technical@lfdr.de>; Tue, 25 Nov 2025 19:11:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=GWNO9bOnG73qwTJbokJR7hKMfGwRsPeki/FjuKsS5R8=; b=0zDUg0BZupDEudk4LIE6WW37zT
	mFOy1ag9KJZ8xMA6e4GYEUiL7AAuE39tqCKeIXzTO8o+zBxOUtLBtI8VwlPVPZ84PXI+l4N2bhasz
	6cnq7M+xcUCbAaWwG+QeQJ1wDF+nNw6GR/kgDH4ArDBVz4eIScZDupMo1teL6ebMRp1UJcII450Cb
	06ZjYKpDbrza24Nk+qU/JXWawSpJVUWB4yKj/rt3q70QM4POOQqgV3TyRkYAy9F/A9Iu2bcLwyMOS
	FOX0lb1sb/fP5zLIgZx5edY4CP52qkXeKsilah7jrcvICr38iuXSmAnszfWnRscAF0htJxgPhceaD
	C5lWwaXQ==;
Received: from ip6-localhost ([::1]:32322 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vNxVN-00DB04-02; Tue, 25 Nov 2025 18:11:09 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:60378) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vNxN0-00D8I3-Hi
 for samba-technical@lists.samba.org; Tue, 25 Nov 2025 18:02:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=GWNO9bOnG73qwTJbokJR7hKMfGwRsPeki/FjuKsS5R8=; b=Dc6DOV06fjoTcNNITu8miNQCHA
 FunSbNj9XUSlhSemlaRu4bVVZnC4E6LJ393BH5BUX/byPS3PDx9+myNkphKAy9oPqN3UtZRIOtzaE
 ZeYMuObLgIRyIR+gHkTCjO+jv8gV3IYReAnZh1SLeta/Ugj23dcTfeTkEqPOMyOCQZ9YNfaFta97b
 iCP0IRn6samiczW7G+2W9c53yThaoV1f1g7v/sbGrnS7Mg8SJAkE6V/tet1MunGezETvXqUW6ceOL
 TpMmLe1jN1+LXSTXcoGNEemhpTItRQA+nY/DQiRAjJsBiiRRQTF5K8LYRiMfSckRq3NxIxow0WSMJ
 OsZsHpG0yHuehqYVgWm/2i7KzkC6UWvOrxiQ8rK80K3ZvMEiB3WcnSNoF0Plm5XErN2QGABc7Zmch
 XSpR7gHIFrOOI2plbRQUo5cgkrZCxbw2S2pVy1gbr2H/v/G4weQpDaqhNatLVY02ANi+QZZkHP8Es
 j5IbVlbWcR3AUzv2sz8e5NBJ;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vNxMv-00FdPi-1V; Tue, 25 Nov 2025 18:02:26 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v4 055/145] smb: smbdirect: introduce
 smbdirect_socket_create_{kern, accepting}() and smbdirect_socket_release()
Date: Tue, 25 Nov 2025 18:55:01 +0100
Message-ID: <804be7df8c1404c1229780a08c663fa7fe6f34f3.1764091285.git.metze@samba.org>
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
Cc: Tom Talpey <tom@talpey.com>, metze@samba.org,
 Steve French <smfrench@gmail.com>, Namjae Jeon <linkinjeon@kernel.org>,
 Steve French <stfrench@microsoft.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This provides functions which also allocate and free struct
smbdirect_socket.

This allows callers to use the same flow as with
sock_create_kern()/sock_release().

The end goal would be to use sock_create_kern()/sock_release(), but the
first step will be to use smbdirect specific functions without any
struct socket nor struct sock.

Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: Long Li <longli@microsoft.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
Signed-off-by: Steve French <stfrench@microsoft.com>
---
 fs/smb/common/smbdirect/smbdirect_socket.c | 95 +++++++++++++++++++++-
 fs/smb/common/smbdirect/smbdirect_socket.h | 33 ++++++++
 2 files changed, 127 insertions(+), 1 deletion(-)

diff --git a/fs/smb/common/smbdirect/smbdirect_socket.c b/fs/smb/common/smbdirect/smbdirect_socket.c
index 56ab5a8da447..12989140c297 100644
--- a/fs/smb/common/smbdirect/smbdirect_socket.c
+++ b/fs/smb/common/smbdirect/smbdirect_socket.c
@@ -51,7 +51,6 @@ static int smbdirect_socket_rdma_event_handler(struct rdma_cm_id *id,
 	return -ESTALE;
 }
 
-__maybe_unused /* this is temporary while this file is included in others */
 static int smbdirect_socket_init_new(struct net *net, struct smbdirect_socket *sc)
 {
 	struct rdma_cm_id *id;
@@ -84,6 +83,31 @@ static int smbdirect_socket_init_new(struct net *net, struct smbdirect_socket *s
 }
 
 __maybe_unused /* this is temporary while this file is included in others */
+static int smbdirect_socket_create_kern(struct net *net, struct smbdirect_socket **_sc)
+{
+	struct smbdirect_socket *sc;
+	int ret;
+
+	ret = -ENOMEM;
+	sc = kzalloc(sizeof(*sc), GFP_KERNEL);
+	if (!sc)
+		goto alloc_failed;
+
+	ret = smbdirect_socket_init_new(net, sc);
+	if (ret)
+		goto init_failed;
+
+	kref_init(&sc->refs.destroy);
+
+	*_sc = sc;
+	return 0;
+
+init_failed:
+	kfree(sc);
+alloc_failed:
+	return ret;
+}
+
 static int smbdirect_socket_init_accepting(struct rdma_cm_id *id, struct smbdirect_socket *sc)
 {
 	smbdirect_socket_init(sc);
@@ -99,6 +123,32 @@ static int smbdirect_socket_init_accepting(struct rdma_cm_id *id, struct smbdire
 	return 0;
 }
 
+__maybe_unused /* this is temporary while this file is included in others */
+static int smbdirect_socket_create_accepting(struct rdma_cm_id *id, struct smbdirect_socket **_sc)
+{
+	struct smbdirect_socket *sc;
+	int ret;
+
+	ret = -ENOMEM;
+	sc = kzalloc(sizeof(*sc), GFP_KERNEL);
+	if (!sc)
+		goto alloc_failed;
+
+	ret = smbdirect_socket_init_accepting(id, sc);
+	if (ret)
+		goto init_failed;
+
+	kref_init(&sc->refs.destroy);
+
+	*_sc = sc;
+	return 0;
+
+init_failed:
+	kfree(sc);
+alloc_failed:
+	return ret;
+}
+
 __maybe_unused /* this is temporary while this file is included in others */
 static int smbdirect_socket_set_initial_parameters(struct smbdirect_socket *sc,
 						   const struct smbdirect_socket_parameters *sp)
@@ -590,6 +640,49 @@ static void smbdirect_socket_shutdown(struct smbdirect_socket *sc)
 	smbdirect_socket_schedule_cleanup(sc, -ESHUTDOWN);
 }
 
+static void smbdirect_socket_release_disconnect(struct kref *kref)
+{
+	struct smbdirect_socket *sc =
+		container_of(kref, struct smbdirect_socket, refs.disconnect);
+
+	/*
+	 * For now do a sync disconnect/destroy
+	 */
+	smbdirect_socket_destroy_sync(sc);
+}
+
+static void smbdirect_socket_release_destroy(struct kref *kref)
+{
+	struct smbdirect_socket *sc =
+		container_of(kref, struct smbdirect_socket, refs.destroy);
+
+	/*
+	 * Do a sync disconnect/destroy...
+	 * hopefully a no-op, as it should be already
+	 * in DESTROYED state, before we free the memory.
+	 */
+	smbdirect_socket_destroy_sync(sc);
+	kfree(sc);
+}
+
+__maybe_unused /* this is temporary while this file is included in others */
+static void smbdirect_socket_release(struct smbdirect_socket *sc)
+{
+	/*
+	 * We expect only 1 disconnect reference
+	 * and if it is already 0, it's a use after free!
+	 */
+	WARN_ON_ONCE(kref_read(&sc->refs.disconnect) != 1);
+	WARN_ON(!kref_put(&sc->refs.disconnect, smbdirect_socket_release_disconnect));
+
+	/*
+	 * This may not trigger smbdirect_socket_release_destroy(),
+	 * if struct smbdirect_socket is embedded in another structure
+	 * indicated by REFCOUNT_MAX.
+	 */
+	kref_put(&sc->refs.destroy, smbdirect_socket_release_destroy);
+}
+
 __maybe_unused /* this is temporary while this file is included in others */
 static int smbdirect_socket_wait_for_credits(struct smbdirect_socket *sc,
 					     enum smbdirect_socket_status expected_status,
diff --git a/fs/smb/common/smbdirect/smbdirect_socket.h b/fs/smb/common/smbdirect/smbdirect_socket.h
index 8d75390037fc..957685ec5857 100644
--- a/fs/smb/common/smbdirect/smbdirect_socket.h
+++ b/fs/smb/common/smbdirect/smbdirect_socket.h
@@ -108,6 +108,36 @@ struct smbdirect_socket {
 
 	struct work_struct disconnect_work;
 
+	/*
+	 * The reference counts.
+	 */
+	struct {
+		/*
+		 * This holds the references by the
+		 * frontend, typically the smb layer.
+		 *
+		 * It is typically 1 and a disconnect
+		 * will happen if it reaches 0.
+		 */
+		struct kref disconnect;
+
+		/*
+		 * This holds the reference by the
+		 * backend, the code that manages
+		 * the lifetime of the whole
+		 * struct smbdirect_socket,
+		 * if this reaches 0 it can will
+		 * be freed.
+		 *
+		 * Can be REFCOUNT_MAX is part
+		 * of another structure.
+		 *
+		 * This is equal or higher than
+		 * the disconnect refcount.
+		 */
+		struct kref destroy;
+	} refs;
+
 	/* RDMA related */
 	struct {
 		struct rdma_cm_id *cm_id;
@@ -493,6 +523,9 @@ static __always_inline void smbdirect_socket_init(struct smbdirect_socket *sc)
 	INIT_WORK(&sc->disconnect_work, __smbdirect_socket_disabled_work);
 	disable_work_sync(&sc->disconnect_work);
 
+	kref_init(&sc->refs.disconnect);
+	sc->refs.destroy = (struct kref) KREF_INIT(REFCOUNT_MAX);
+
 	sc->rdma.expected_event = RDMA_CM_EVENT_INTERNAL;
 
 	sc->ib.poll_ctx = IB_POLL_UNBOUND_WORKQUEUE;
-- 
2.43.0


