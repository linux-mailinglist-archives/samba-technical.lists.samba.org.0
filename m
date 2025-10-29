Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 97F0CC1ABE4
	for <lists+samba-technical@lfdr.de>; Wed, 29 Oct 2025 14:35:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=gwtA90qHUDRRIeITCseJy4xJQphcx+VjQRDbFQAyn/8=; b=nuqI/0WxwdlGG9TDFayoBd/YqC
	rhZhx16s4l8LxigCjF9R06wbrSmj+vEPtTRTy+DDPHPZp0EfgOCQzqTqc5FZAuU9/RirvnyaeGulR
	QBUNWFM2/XSaa/hFdB711fueu6lkXch2cncRWTxsC/j8Ly/6g6jWsTEsos7kKaFMf7SK4Raj8Vun3
	dMZDy7peWIz9SARWt/uv90a6WCD/9koVtOUucfoUABheP9951fitE4ZXHBrM+lAP53Wqt6Vh8P8zh
	uY9Qt1Pv+NNOqzSuhJ5l4WdRlFVXl4itA+0Y8fdz1kcQ80hy6juVbJPGj+j0Cw7fuwcqAQXwGSl5l
	1vvjoX4A==;
Received: from ip6-localhost ([::1]:39646 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vE6Kx-0099EP-Pq; Wed, 29 Oct 2025 13:35:40 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:36376) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vE6DE-0096jY-Rb
 for samba-technical@lists.samba.org; Wed, 29 Oct 2025 13:27:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=gwtA90qHUDRRIeITCseJy4xJQphcx+VjQRDbFQAyn/8=; b=xykaod2RlpALl/sRRPBjohFKQV
 WWPiTwkH4GvoSIg5Xr8qfB/dUnWw+qK/0WMsz+5nYIhl+ekHQseI1tCuw84ejCkXEjhlw3sO1FYOK
 dkJ38boXdp7mvuKDT9lN8SBodIFAp3I3Zj+awrSlJtvzDLyzHLgQfq6BltWJ/qOmY0QLsoixDNbPk
 UNqTzs9QLU4cxBI3N8I8bENY8qP8+1NBstlwZhpmJY9Dl90oYLFuGAVbD91MzoBbm0djzv78CJFs3
 J2BOZYJiRfaIlxtLunXcgqD/dMKE/KBTVblBiw7iunEVQguci/0zqM2Drm7p2BWkuSzuS3/zSI867
 sQxRVf8+BjchgPG8wS6vz/AjakTVWVKonPeuBdsv3mEoumYmtWRVQFqpUXOtfD9bNSLyimEVvpNKF
 kjjrcKcmcaPK/nrw2oz13BNmzcCx+z6Y16+SpkPphUX3BEh99Ws+oTqmsW1KCid7POQyILN5Vszlu
 8edBbPRYmcqBaVKUdDSowOAB;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vE6DC-00Bbyg-0L; Wed, 29 Oct 2025 13:27:38 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v2 052/127] smb: smbdirect: introduce
 smbdirect_socket_create_{kern, accepting}() and smbdirect_socket_release()
Date: Wed, 29 Oct 2025 14:20:30 +0100
Message-ID: <aca55a3b7d71c3f52abc7fc21919f7eedf6b013c.1761742839.git.metze@samba.org>
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
 Tom Talpey <tom@talpey.com>, Namjae Jeon <linkinjeon@kernel.org>
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
---
 .../common/smbdirect/smbdirect_connection.c   | 96 ++++++++++++++++++-
 fs/smb/common/smbdirect/smbdirect_socket.h    | 33 +++++++
 2 files changed, 128 insertions(+), 1 deletion(-)

diff --git a/fs/smb/common/smbdirect/smbdirect_connection.c b/fs/smb/common/smbdirect/smbdirect_connection.c
index 34be36cf5d00..de87acdaf595 100644
--- a/fs/smb/common/smbdirect/smbdirect_connection.c
+++ b/fs/smb/common/smbdirect/smbdirect_connection.c
@@ -94,7 +94,6 @@ static int smbdirect_socket_rdma_event_handler(struct rdma_cm_id *id,
 	return 1;
 }
 
-__maybe_unused /* this is temporary while this file is included in orders */
 static int smbdirect_socket_init_new(struct net *net, struct smbdirect_socket *sc)
 {
 	struct rdma_cm_id *id;
@@ -119,6 +118,31 @@ static int smbdirect_socket_init_new(struct net *net, struct smbdirect_socket *s
 }
 
 __maybe_unused /* this is temporary while this file is included in orders */
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
@@ -134,6 +158,32 @@ static int smbdirect_socket_init_accepting(struct rdma_cm_id *id, struct smbdire
 	return 0;
 }
 
+__maybe_unused /* this is temporary while this file is included in orders */
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
 __maybe_unused /* this is temporary while this file is included in orders */
 static int smbdirect_socket_set_initial_parameters(struct smbdirect_socket *sc,
 						   const struct smbdirect_socket_parameters *sp)
@@ -1251,6 +1301,50 @@ static void smbdirect_socket_shutdown(struct smbdirect_socket *sc)
 	smbdirect_connection_schedule_disconnect(sc, -ECONNABORTED);
 }
 
+__maybe_unused /* this is temporary while this file is included in orders */
+static void smbdirect_socket_release_disconnect(struct kref *kref)
+{
+	struct smbdirect_socket *sc =
+		container_of(kref, struct smbdirect_socket, refs.disconnect);
+
+	/*
+	 * For now do a sync disconnect/destroy
+	 */
+	smbdirect_connection_destroy_sync(sc);
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
+	smbdirect_connection_destroy_sync(sc);
+	kfree(sc);
+}
+
+__maybe_unused /* this is temporary while this file is included in orders */
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
 static void smbdirect_connection_idle_timer_work(struct work_struct *work)
 {
 	struct smbdirect_socket *sc =
diff --git a/fs/smb/common/smbdirect/smbdirect_socket.h b/fs/smb/common/smbdirect/smbdirect_socket.h
index c930d7531965..e44ab31ee852 100644
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
@@ -491,6 +521,9 @@ static __always_inline void smbdirect_socket_init(struct smbdirect_socket *sc)
 	INIT_WORK(&sc->disconnect_work, __smbdirect_socket_disabled_work);
 	disable_work_sync(&sc->disconnect_work);
 
+	kref_init(&sc->refs.disconnect);
+	sc->refs.destroy = (struct kref) KREF_INIT(REFCOUNT_MAX);
+
 	sc->rdma.expected_event = RDMA_CM_EVENT_INTERNAL;
 
 	sc->ib.poll_ctx = IB_POLL_UNBOUND_WORKQUEUE;
-- 
2.43.0


