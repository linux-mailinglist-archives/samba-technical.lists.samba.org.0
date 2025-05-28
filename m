Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 2802CAC6D6A
	for <lists+samba-technical@lfdr.de>; Wed, 28 May 2025 18:03:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=4ooRWdjNozhLp5m5+ekeKM5KHHFY+pUa4ke1MjKgp9I=; b=TeuuVDc6zok8lSR97dsz49Acez
	UhFM0di77hovxyzXsLYNQ6e8AsbLUIOWWycNJsl9YcVKDNBUvbrI6Xdqwk6riulLX8JB1mt8rqLki
	8xW1a+xXI8Zgr2kMS5ndHRJz6TUe/q9385NlqGITjpOrNrdaMAQ8AulXWqKUgQR07u/izE6bgVX5X
	4snnvxjZVckH6qBrR4yNmnchWqZtm72kA691wPZ+SRWEylxb2b+cmlmN7mclEYhMvffOtCUYzerG5
	dJPpHSnzwj0QBsZ3s2cgN2kS++MBI4QROP9/x2ddRZKrG2bkhUDVd3wnOMgpcdc4u6cl7aUGiVeJc
	wrl47onw==;
Received: from ip6-localhost ([::1]:52432 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uKJFQ-004MCu-Pq; Wed, 28 May 2025 16:03:21 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:50894) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uKJEt-004M3R-O7
 for samba-technical@lists.samba.org; Wed, 28 May 2025 16:03:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-Id:Date:Cc:To:From;
 bh=4ooRWdjNozhLp5m5+ekeKM5KHHFY+pUa4ke1MjKgp9I=; b=dHInQV75XsrK5BbCaFq1Lmq4J6
 vZ0/VAA2qXCHfodRuuMFwbhm/fYb6/4Lp3LEHaUU+6eKf95/5BhPWnSPiQX8X/IS2ahjxCWhpYutF
 RWBrQVYlKTTJTjSo+TBZ9e7rAXDzaOaArFkpBa50QXNcGAq5J7rA7b9o4UoekJGdgwH/hLo6e+gD5
 oES/vM4M4qfDrEiuM+qufpwVh5N9lX4K3fuMGrzZcWtqQVDM5kYJTEgYObxUNAaxIw8qexmgESsoO
 1I7waW1G9EuH2V6kb14HCUhUUpjXSsvp6XG9fD1LpXIK86GLtMSgAzgMmapBueUTKmm1wFj/Wh2V4
 zL7nLSaZJjC6A+RR8bbj9h82T5gDFGWHuuD+U53ZaxXTnEj2WpWJdF4EzRV+0tZIDxg6xEUbcVV3P
 yNemMquIRtWuJB75xegbbPRnrHEMNyN1grjnVrmGlbVzE6wDh2K9AH+K+HtjZ7hFl9o9tAGi+0McA
 /1+wKt30GqHS3d8by4jYI1YE;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uKJEq-007hLy-0p; Wed, 28 May 2025 16:02:44 +0000
To: linux-cifs@vger.kernel.org
Subject: [PATCH v2 06/12] smb: server: make use of common smbdirect.h
Date: Wed, 28 May 2025 18:01:35 +0200
Message-Id: <ecbcf78d7b5817e6bf421c917c7b5b20ed3c27fe.1748446473.git.metze@samba.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1748446473.git.metze@samba.org>
References: <cover.1748446473.git.metze@samba.org>
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
Cc: Meetakshi Setiya <meetakshisetiyaoss@gmail.com>,
 Tom Talpey <tom@talpey.com>, samba-technical@lists.samba.org,
 Hyunchul Lee <hyc.lee@gmail.com>, metze@samba.org,
 Steve French <smfrench@gmail.com>, Namjae Jeon <linkinjeon@kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: Long Li <longli@microsoft.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: Hyunchul Lee <hyc.lee@gmail.com>
Cc: Meetakshi Setiya <meetakshisetiyaoss@gmail.com>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
---
 fs/smb/server/connection.c     |  4 ++--
 fs/smb/server/connection.h     | 10 ++++++----
 fs/smb/server/smb2pdu.c        | 11 ++++++-----
 fs/smb/server/smb2pdu.h        |  6 ------
 fs/smb/server/transport_rdma.c |  7 ++++---
 5 files changed, 18 insertions(+), 20 deletions(-)

diff --git a/fs/smb/server/connection.c b/fs/smb/server/connection.c
index 83764c230e9d..2e7515e57117 100644
--- a/fs/smb/server/connection.c
+++ b/fs/smb/server/connection.c
@@ -243,7 +243,7 @@ int ksmbd_conn_write(struct ksmbd_work *work)
 
 int ksmbd_conn_rdma_read(struct ksmbd_conn *conn,
 			 void *buf, unsigned int buflen,
-			 struct smb2_buffer_desc_v1 *desc,
+			 struct smbdirect_buffer_descriptor_v1 *desc,
 			 unsigned int desc_len)
 {
 	int ret = -EINVAL;
@@ -257,7 +257,7 @@ int ksmbd_conn_rdma_read(struct ksmbd_conn *conn,
 
 int ksmbd_conn_rdma_write(struct ksmbd_conn *conn,
 			  void *buf, unsigned int buflen,
-			  struct smb2_buffer_desc_v1 *desc,
+			  struct smbdirect_buffer_descriptor_v1 *desc,
 			  unsigned int desc_len)
 {
 	int ret = -EINVAL;
diff --git a/fs/smb/server/connection.h b/fs/smb/server/connection.h
index 14620e147dda..3821f0f53d3d 100644
--- a/fs/smb/server/connection.h
+++ b/fs/smb/server/connection.h
@@ -19,6 +19,8 @@
 #include "smb_common.h"
 #include "ksmbd_work.h"
 
+struct smbdirect_buffer_descriptor_v1;
+
 #define KSMBD_SOCKET_BACKLOG		16
 
 enum {
@@ -126,11 +128,11 @@ struct ksmbd_transport_ops {
 		      unsigned int remote_key);
 	int (*rdma_read)(struct ksmbd_transport *t,
 			 void *buf, unsigned int len,
-			 struct smb2_buffer_desc_v1 *desc,
+			 struct smbdirect_buffer_descriptor_v1 *desc,
 			 unsigned int desc_len);
 	int (*rdma_write)(struct ksmbd_transport *t,
 			  void *buf, unsigned int len,
-			  struct smb2_buffer_desc_v1 *desc,
+			  struct smbdirect_buffer_descriptor_v1 *desc,
 			  unsigned int desc_len);
 };
 
@@ -155,11 +157,11 @@ bool ksmbd_conn_lookup_dialect(struct ksmbd_conn *c);
 int ksmbd_conn_write(struct ksmbd_work *work);
 int ksmbd_conn_rdma_read(struct ksmbd_conn *conn,
 			 void *buf, unsigned int buflen,
-			 struct smb2_buffer_desc_v1 *desc,
+			 struct smbdirect_buffer_descriptor_v1 *desc,
 			 unsigned int desc_len);
 int ksmbd_conn_rdma_write(struct ksmbd_conn *conn,
 			  void *buf, unsigned int buflen,
-			  struct smb2_buffer_desc_v1 *desc,
+			  struct smbdirect_buffer_descriptor_v1 *desc,
 			  unsigned int desc_len);
 void ksmbd_conn_enqueue_request(struct ksmbd_work *work);
 void ksmbd_conn_try_dequeue_request(struct ksmbd_work *work);
diff --git a/fs/smb/server/smb2pdu.c b/fs/smb/server/smb2pdu.c
index 8d414239b3fe..7ddc69fe6320 100644
--- a/fs/smb/server/smb2pdu.c
+++ b/fs/smb/server/smb2pdu.c
@@ -23,6 +23,7 @@
 #include "asn1.h"
 #include "connection.h"
 #include "transport_ipc.h"
+#include "../common/smbdirect/smbdirect.h"
 #include "transport_rdma.h"
 #include "vfs.h"
 #include "vfs_cache.h"
@@ -6617,7 +6618,7 @@ static noinline int smb2_read_pipe(struct ksmbd_work *work)
 }
 
 static int smb2_set_remote_key_for_rdma(struct ksmbd_work *work,
-					struct smb2_buffer_desc_v1 *desc,
+					struct smbdirect_buffer_descriptor_v1 *desc,
 					__le32 Channel,
 					__le16 ChannelInfoLength)
 {
@@ -6653,7 +6654,7 @@ static ssize_t smb2_read_rdma_channel(struct ksmbd_work *work,
 	int err;
 
 	err = ksmbd_conn_rdma_write(work->conn, data_buf, length,
-				    (struct smb2_buffer_desc_v1 *)
+				    (struct smbdirect_buffer_descriptor_v1 *)
 				    ((char *)req + le16_to_cpu(req->ReadChannelInfoOffset)),
 				    le16_to_cpu(req->ReadChannelInfoLength));
 	if (err)
@@ -6724,7 +6725,7 @@ int smb2_read(struct ksmbd_work *work)
 			goto out;
 		}
 		err = smb2_set_remote_key_for_rdma(work,
-						   (struct smb2_buffer_desc_v1 *)
+						   (struct smbdirect_buffer_descriptor_v1 *)
 						   ((char *)req + ch_offset),
 						   req->Channel,
 						   req->ReadChannelInfoLength);
@@ -6919,7 +6920,7 @@ static ssize_t smb2_write_rdma_channel(struct ksmbd_work *work,
 		return -ENOMEM;
 
 	ret = ksmbd_conn_rdma_read(work->conn, data_buf, length,
-				   (struct smb2_buffer_desc_v1 *)
+				   (struct smbdirect_buffer_descriptor_v1 *)
 				   ((char *)req + le16_to_cpu(req->WriteChannelInfoOffset)),
 				   le16_to_cpu(req->WriteChannelInfoLength));
 	if (ret < 0) {
@@ -6984,7 +6985,7 @@ int smb2_write(struct ksmbd_work *work)
 			goto out;
 		}
 		err = smb2_set_remote_key_for_rdma(work,
-						   (struct smb2_buffer_desc_v1 *)
+						   (struct smbdirect_buffer_descriptor_v1 *)
 						   ((char *)req + ch_offset),
 						   req->Channel,
 						   req->WriteChannelInfoLength);
diff --git a/fs/smb/server/smb2pdu.h b/fs/smb/server/smb2pdu.h
index 17a0b18a8406..1b940cedb22f 100644
--- a/fs/smb/server/smb2pdu.h
+++ b/fs/smb/server/smb2pdu.h
@@ -133,12 +133,6 @@ struct create_posix_rsp {
 	u8 SidBuffer[44];
 } __packed;
 
-struct smb2_buffer_desc_v1 {
-	__le64 offset;
-	__le32 token;
-	__le32 length;
-} __packed;
-
 #define SMB2_0_IOCTL_IS_FSCTL 0x00000001
 
 struct smb_sockaddr_in {
diff --git a/fs/smb/server/transport_rdma.c b/fs/smb/server/transport_rdma.c
index 55fda2585583..99ceef3d83ba 100644
--- a/fs/smb/server/transport_rdma.c
+++ b/fs/smb/server/transport_rdma.c
@@ -23,6 +23,7 @@
 #include "connection.h"
 #include "smb_common.h"
 #include "../common/smb2status.h"
+#include "../common/smbdirect/smbdirect.h"
 #include "../common/smbdirect/smbdirect_pdu.h"
 #include "transport_rdma.h"
 
@@ -1355,7 +1356,7 @@ static void write_done(struct ib_cq *cq, struct ib_wc *wc)
 
 static int smb_direct_rdma_xmit(struct smb_direct_transport *t,
 				void *buf, int buf_len,
-				struct smb2_buffer_desc_v1 *desc,
+				struct smbdirect_buffer_descriptor_v1 *desc,
 				unsigned int desc_len,
 				bool is_read)
 {
@@ -1485,7 +1486,7 @@ static int smb_direct_rdma_xmit(struct smb_direct_transport *t,
 
 static int smb_direct_rdma_write(struct ksmbd_transport *t,
 				 void *buf, unsigned int buflen,
-				 struct smb2_buffer_desc_v1 *desc,
+				 struct smbdirect_buffer_descriptor_v1 *desc,
 				 unsigned int desc_len)
 {
 	return smb_direct_rdma_xmit(smb_trans_direct_transfort(t), buf, buflen,
@@ -1494,7 +1495,7 @@ static int smb_direct_rdma_write(struct ksmbd_transport *t,
 
 static int smb_direct_rdma_read(struct ksmbd_transport *t,
 				void *buf, unsigned int buflen,
-				struct smb2_buffer_desc_v1 *desc,
+				struct smbdirect_buffer_descriptor_v1 *desc,
 				unsigned int desc_len)
 {
 	return smb_direct_rdma_xmit(smb_trans_direct_transfort(t), buf, buflen,
-- 
2.34.1


