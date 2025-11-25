Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B0D58C869E3
	for <lists+samba-technical@lfdr.de>; Tue, 25 Nov 2025 19:29:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=E6xXOrIOeNMKIVWSSjIowgRbu8THe1GunvwOUilzAY4=; b=Yqs3W/3iAKiftyVCJ9soHCIIFv
	tfzLAjMOCYXAXsRgLtVCMEIvpo/gFfVrUUYyZ81jnXMYiD/gqEWaUMimPRVzSKdwU5Eb5rcesTcnG
	hsi7JCRaV8PIhhJqov3Yd0cUjwwKBilJwLrt+ZcEAlQMu3VrIODYM7l1bnM7Wmquw8wuTjjPmdmmB
	woux5d5/49nS2rf6stf90BnfZ3UD3dMWX5gnghdxrVD7WK4wW0qTZB33m6cFuQegsmtMSFzVes1fZ
	zLovbLYlz+Jm1CqBs9UwWiAFXqbrMUATQRU+tc7JLcDzOAxkxKqNNRsqmcKC4JZj9cMy9l+p9hk65
	1feWa82g==;
Received: from ip6-localhost ([::1]:26804 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vNxnC-00DFq0-QT; Tue, 25 Nov 2025 18:29:35 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:21966) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vNxmt-00DFoC-Bk
 for samba-technical@lists.samba.org; Tue, 25 Nov 2025 18:29:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=E6xXOrIOeNMKIVWSSjIowgRbu8THe1GunvwOUilzAY4=; b=tcjHMjGsNj15wMLO2px7DljD6c
 a6R9EFkOPpprFKuNfsBxS1cPz7ng5w84+YVugmrrqmn17zGxC+P05Z941uUcK2D1p4CiW3EHImepg
 lrLSlSMO3J3KXgUdJKLSMTgjp+nLizkv8AA2/aBA1nqTvyMfHHugcE+d6FxCrWmJU8KI+3lcS2sq4
 j0up4nUpub+2lRkQDGLhvBN7N0DvOg4QtGePLuI47q/ALLj7qAkS75pL+R9OWaG7c+QTg8ju6vNBz
 q44JIauOdXWeiGhB6+xpu+kGSo6UrJ90NIUeZvcbPBShnp3uz0m0xQmeVqiun9fe3R1looyJyI9mq
 KFCyq5FHqahFY1bfIbYyD5fNPsUJSh86xO89/b43WbjUc6hGP3o56m+SXgRvT4li6TC67VJNNUd1T
 2/WWMonxpBrLxp/QTb+YDgPez6T4mDJKeQVWdvISyTKjGDf4pRixS8cCdmW3ZLJiOu1BMLVOtBGf8
 78u0W2msJXpBSJS9njhTqX2W;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vNxhf-00Ffmv-1d; Tue, 25 Nov 2025 18:23:52 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v4 131/145] smb: server: make use of
 smbdirect_socket_create_accepting()/smbdirect_socket_release()
Date: Tue, 25 Nov 2025 18:56:17 +0100
Message-ID: <7da5d5f234aaa67562b3dbd71273973f5aa351e1.1764091285.git.metze@samba.org>
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

With this we no longer embed struct smbdirect_socket, which will allow
us to make it private in the following commits.

Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
Signed-off-by: Steve French <stfrench@microsoft.com>
---
 fs/smb/server/transport_rdma.c | 53 +++++++++++++++-------------------
 1 file changed, 23 insertions(+), 30 deletions(-)

diff --git a/fs/smb/server/transport_rdma.c b/fs/smb/server/transport_rdma.c
index 48c86b3a7ab1..85aed6963c86 100644
--- a/fs/smb/server/transport_rdma.c
+++ b/fs/smb/server/transport_rdma.c
@@ -42,8 +42,6 @@
 #define SMB_DIRECT_PORT_IWARP		5445
 #define SMB_DIRECT_PORT_INFINIBAND	445
 
-#define SMB_DIRECT_VERSION_LE		cpu_to_le16(SMBDIRECT_V1)
-
 /* SMB_DIRECT negotiation timeout (for the server) in seconds */
 #define SMB_DIRECT_NEGOTIATE_TIMEOUT		5
 
@@ -59,11 +57,6 @@
  */
 #define SMB_DIRECT_CM_INITIATOR_DEPTH		8
 
-/* Maximum number of retries on data transfer operations */
-#define SMB_DIRECT_CM_RETRY			6
-/* No need to retry on Receiver Not Ready since SMB_DIRECT manages credits */
-#define SMB_DIRECT_CM_RNR_RETRY		0
-
 /*
  * User configurable initial values per SMB_DIRECT transport connection
  * as defined in [MS-SMBD] 3.1.1.1
@@ -107,7 +100,7 @@ static struct workqueue_struct *smb_direct_wq;
 struct smb_direct_transport {
 	struct ksmbd_transport	transport;
 
-	struct smbdirect_socket socket;
+	struct smbdirect_socket *socket;
 };
 
 static bool smb_direct_logging_needed(struct smbdirect_socket *sc,
@@ -184,15 +177,13 @@ void init_smbd_max_io_size(unsigned int sz)
 unsigned int get_smbd_max_read_write_size(struct ksmbd_transport *kt)
 {
 	struct smb_direct_transport *t;
-	struct smbdirect_socket *sc;
 	const struct smbdirect_socket_parameters *sp;
 
 	if (kt->ops != &ksmbd_smb_direct_transport_ops)
 		return 0;
 
 	t = SMBD_TRANS(kt);
-	sc = &t->socket;
-	sp = smbdirect_socket_get_current_parameters(sc);
+	sp = smbdirect_socket_get_current_parameters(t->socket);
 
 	return sp->max_read_write_size;
 }
@@ -225,10 +216,9 @@ static struct smb_direct_transport *alloc_transport(struct rdma_cm_id *cm_id)
 	t = kzalloc(sizeof(*t), KSMBD_DEFAULT_GFP);
 	if (!t)
 		return NULL;
-	sc = &t->socket;
-	ret = smbdirect_socket_init_accepting(cm_id, sc);
+	ret = smbdirect_socket_create_accepting(cm_id, &sc);
 	if (ret)
-		goto socket_init_failed;
+		goto socket_create_failed;
 	smbdirect_socket_set_logging(sc, NULL,
 				     smb_direct_logging_needed,
 				     smb_direct_logging_vaprintf);
@@ -253,28 +243,31 @@ static struct smb_direct_transport *alloc_transport(struct rdma_cm_id *cm_id)
 	conn->transport = KSMBD_TRANS(t);
 	KSMBD_TRANS(t)->conn = conn;
 	KSMBD_TRANS(t)->ops = &ksmbd_smb_direct_transport_ops;
+
+	t->socket = sc;
 	return t;
 
 conn_alloc_failed:
 set_workqueue_failed:
 set_settings_failed:
 set_params_failed:
-socket_init_failed:
+	smbdirect_socket_release(sc);
+socket_create_failed:
 	kfree(t);
 	return NULL;
 }
 
 static void smb_direct_free_transport(struct ksmbd_transport *kt)
 {
-	kfree(SMBD_TRANS(kt));
+	struct smb_direct_transport *t = SMBD_TRANS(kt);
+
+	smbdirect_socket_release(t->socket);
+	kfree(t);
 }
 
 static void free_transport(struct smb_direct_transport *t)
 {
-	struct smbdirect_socket *sc = &t->socket;
-
-	smbdirect_socket_destroy_sync(sc);
-
+	smbdirect_socket_shutdown(t->socket);
 	ksmbd_conn_free(KSMBD_TRANS(t)->conn);
 }
 
@@ -282,7 +275,7 @@ static int smb_direct_read(struct ksmbd_transport *t, char *buf,
 			   unsigned int size, int unused)
 {
 	struct smb_direct_transport *st = SMBD_TRANS(t);
-	struct smbdirect_socket *sc = &st->socket;
+	struct smbdirect_socket *sc = st->socket;
 	struct msghdr msg = { .msg_flags = 0, };
 	struct kvec iov = {
 		.iov_base = buf,
@@ -303,7 +296,7 @@ static int smb_direct_writev(struct ksmbd_transport *t,
 			     bool need_invalidate, unsigned int remote_key)
 {
 	struct smb_direct_transport *st = SMBD_TRANS(t);
-	struct smbdirect_socket *sc = &st->socket;
+	struct smbdirect_socket *sc = st->socket;
 	struct iov_iter iter;
 
 	iov_iter_kvec(&iter, ITER_SOURCE, iov, niovs, buflen);
@@ -318,7 +311,7 @@ static int smb_direct_rdma_write(struct ksmbd_transport *t,
 				 unsigned int desc_len)
 {
 	struct smb_direct_transport *st = SMBD_TRANS(t);
-	struct smbdirect_socket *sc = &st->socket;
+	struct smbdirect_socket *sc = st->socket;
 
 	return smbdirect_connection_rdma_xmit(sc, buf, buflen,
 					      desc, desc_len, false);
@@ -330,7 +323,7 @@ static int smb_direct_rdma_read(struct ksmbd_transport *t,
 				unsigned int desc_len)
 {
 	struct smb_direct_transport *st = SMBD_TRANS(t);
-	struct smbdirect_socket *sc = &st->socket;
+	struct smbdirect_socket *sc = st->socket;
 
 	return smbdirect_connection_rdma_xmit(sc, buf, buflen,
 					      desc, desc_len, true);
@@ -339,9 +332,9 @@ static int smb_direct_rdma_read(struct ksmbd_transport *t,
 static void smb_direct_disconnect(struct ksmbd_transport *t)
 {
 	struct smb_direct_transport *st = SMBD_TRANS(t);
-	struct smbdirect_socket *sc = &st->socket;
+	struct smbdirect_socket *sc = st->socket;
 
-	ksmbd_debug(RDMA, "Disconnecting cm_id=%p\n", sc->rdma.cm_id);
+	ksmbd_debug(RDMA, "Disconnecting sc=%p\n", sc);
 
 	free_transport(st);
 }
@@ -349,9 +342,9 @@ static void smb_direct_disconnect(struct ksmbd_transport *t)
 static void smb_direct_shutdown(struct ksmbd_transport *t)
 {
 	struct smb_direct_transport *st = SMBD_TRANS(t);
-	struct smbdirect_socket *sc = &st->socket;
+	struct smbdirect_socket *sc = st->socket;
 
-	ksmbd_debug(RDMA, "smb-direct shutdown cm_id=%p\n", sc->rdma.cm_id);
+	ksmbd_debug(RDMA, "smb-direct shutdown sc=%p\n", sc);
 
 	smbdirect_socket_shutdown(sc);
 }
@@ -359,7 +352,7 @@ static void smb_direct_shutdown(struct ksmbd_transport *t)
 static int smb_direct_prepare(struct ksmbd_transport *t)
 {
 	struct smb_direct_transport *st = SMBD_TRANS(t);
-	struct smbdirect_socket *sc = &st->socket;
+	struct smbdirect_socket *sc = st->socket;
 	int ret;
 
 	ksmbd_debug(RDMA, "SMB_DIRECT Waiting for connection\n");
@@ -392,7 +385,7 @@ static int smb_direct_handle_connect_request(struct rdma_cm_id *new_cm_id,
 	t = alloc_transport(new_cm_id);
 	if (!t)
 		return -ENOMEM;
-	sc = &t->socket;
+	sc = t->socket;
 
 	ret = smbdirect_accept_connect_request(sc, &event->param.conn);
 	if (ret)
-- 
2.43.0


