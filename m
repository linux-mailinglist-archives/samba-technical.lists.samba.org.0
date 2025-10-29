Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CED1C1AF3A
	for <lists+samba-technical@lfdr.de>; Wed, 29 Oct 2025 14:52:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=jDT8DvNL9D65Ab8DSDAkBrqynQMo8sXejI0Roqi/B2U=; b=1fwVF/hYVRHVsW4wjilj25RrPQ
	4yxwN14gJGrNcpgqyfqrz5xQ2yv7k5IoY467FYzjAKyQnhbBTBcecngQCVRI5lAgEPk6kvpFivjB9
	/bpwt6PtYVCQY7GNcruqg/7x10bZ4eCxeNT8LIWbD544a0u8Tj0NOnW65wkaxmPKKrnqSgr4d5wAq
	JzidCBQE+wEubJnTJ6dMH1efoBbKP6rB3O6wALEt1/Cv9XtSYxEGHmNMlJEynfYa4UHdJTJPeqV5D
	79IVv5Wk+WWldm5vzcHcNXSMzYPdqy6aoH6Toc1GHMnucqurJkREE0QtUxq0PHWBW8Dfcq7jwoAp6
	5q9dm40w==;
Received: from ip6-localhost ([::1]:33602 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vE6ak-009F4y-EO; Wed, 29 Oct 2025 13:51:58 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:41266) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vE6KM-00996p-1C
 for samba-technical@lists.samba.org; Wed, 29 Oct 2025 13:35:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=jDT8DvNL9D65Ab8DSDAkBrqynQMo8sXejI0Roqi/B2U=; b=KHAnFAFBqfC62bN7mevPSgkViY
 rDzqAsroSoqQmGDiSudf8j5yXKpv3xosOGC0E/v8ZALvliHc2deIys/llDQeof9ssraqOEPqN7b++
 E4lyW3BJVYlkQ9kGXC97WkXuSE1EIrzwSC+9HpD5wguZrrBLVoQYB0YG+nPegUrJvrZQD0EByP47V
 n4+Ga0LFvJrsnz8njfty+G4rPy2XCuUkCbLLrkA3lea/8NcGLKq/NuCUoRfPdIY0cDHI+UU10tQLv
 LZuUqBKMBLXRsytUsKTq506XZlVkC16wqTBQ1tO67FeDxZXSY/6BxCesKHo0saGEFM8+3s3n5gx7l
 72rF25dvlbsOBzdfyjwafCshH6DqOLS7EYOAOBa53VT4eWWEsO2rq+IdkRdA4mzjUBj0WAtkpGuYU
 HpqOuoyczo8Owt5X3+4nzwSN0rMPjZlAJEaWzoSwRlguJQ3Db/I829Ex8l2pWKbvucp1JcNy5QnRW
 z7stOJH+xY4o4oYMbrhf/bPw;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vE6KJ-00Bd98-24; Wed, 29 Oct 2025 13:34:59 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v2 125/127] smb: server: make use of
 smbdirect_socket_create_accepting()/smbdirect_socket_release()
Date: Wed, 29 Oct 2025 14:21:43 +0100
Message-ID: <f3501a680944a5861e1d1f34c9a57e7749747ba0.1761742839.git.metze@samba.org>
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

With this we no longer embed struct smbdirect_socket, which will allow
us to make it private in the following commits.

Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
---
 fs/smb/server/transport_rdma.c | 53 +++++++++++++++-------------------
 1 file changed, 23 insertions(+), 30 deletions(-)

diff --git a/fs/smb/server/transport_rdma.c b/fs/smb/server/transport_rdma.c
index d6162b8be58b..85aed6963c86 100644
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
-	smbdirect_connection_destroy_sync(sc);
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


