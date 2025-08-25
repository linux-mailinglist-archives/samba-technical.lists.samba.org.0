Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 810FCB34D5E
	for <lists+samba-technical@lfdr.de>; Mon, 25 Aug 2025 23:02:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=O+3cR0T6UYcy1n3Z2L6sQzAUxjptaLR5kw5+vtodiSo=; b=JsNRlNozpBz3flcqp+8ramVpNK
	uZSpDhOeadm0X+7GKUGx9q0akBVCUc1YKsNndfH4+x8g8ShpU1ljdRRqI/dX7VUHZAa6T77U/bXQr
	8XfrtzKYEaTj2qVpRl1w2XiRa8JO3j2OVoGuq6zA7IjuuEprw/PUaa059pRJX4W2zXGtBQqXlzE8t
	SfHxbpf4XPXIwQVdMR/5nv5t3/f3o1ytYsaiOdUoTrt8Pk0STNEkUA9LOEgbkL0NwOhYTcKxqRMDB
	PmYuHvZ+ndhhirKtwWKMYUvsuufoc/EKCIttgj73exK2711HtEfuJVjzhdbighPlyWNOClPIVlwH9
	A9Ot7sDg==;
Received: from ip6-localhost ([::1]:32956 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uqeKu-000THz-VO; Mon, 25 Aug 2025 21:02:41 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:12148) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uqeGn-000Rbs-HS
 for samba-technical@lists.samba.org; Mon, 25 Aug 2025 20:58:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=O+3cR0T6UYcy1n3Z2L6sQzAUxjptaLR5kw5+vtodiSo=; b=rb9ULTS0xf4ED7lDUXxuwlCgoX
 P3HtQDExGOc21AvteY4vZJVotvr6Nye3BZjzg5o9PPK5sDiEP+btrQ+p150J/0LQtLPP1rrCTZ1Xt
 rD/SRf0B03WcJs8tlfvIPUeGjkUQ0fW1VbVJQ8WwYVDWvXTth1hz2WSmQQapga91icnIsLl33hPiw
 0MbSX/i2b8h526hxhvC1mvpWdG2Heov6hoxM8tGvNyFNuY1kYxutg+DPJhVqjv8jppfGvcEBoLM0/
 oGlpnp34kFqMdF5q8F6GYPvoaMkCpWxSo0VkKl70tJS4ulMlSRgcxcVYjODvK7IBG1pokArlRjZh3
 rIapQdmE3beSOmRZb8fIvqk1u1/SFhs9jHcQNs6OCV/ikxHC606TsCHTQzjKtJtLotO7kJSPc6T+v
 SIPob4mbQAT+eeV2lTvyZsPjSjJSi+xBD/L1EPFIKW1hDm5cyL4NmZk/9naiRcCzpUFbIkaQ0WDou
 UJ4XZmPEAUih346VjocWBuls;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uqeGl-000mXX-1L; Mon, 25 Aug 2025 20:58:23 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v4 100/142] smb: server: make use of struct
 smbdirect_send_batch
Date: Mon, 25 Aug 2025 22:41:01 +0200
Message-ID: <372ca7c624c39510dc9eadf835bfe744c036c5d8.1756139607.git.metze@samba.org>
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

This makes it easier to move functions to the common
smbdirect code in future.

Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
---
 fs/smb/server/transport_rdma.c | 21 +++++++--------------
 1 file changed, 7 insertions(+), 14 deletions(-)

diff --git a/fs/smb/server/transport_rdma.c b/fs/smb/server/transport_rdma.c
index d4bc737a9882..cca926ad2677 100644
--- a/fs/smb/server/transport_rdma.c
+++ b/fs/smb/server/transport_rdma.c
@@ -118,13 +118,6 @@ struct smb_direct_transport {
 
 static const struct ksmbd_transport_ops ksmbd_smb_direct_transport_ops;
 
-struct smb_direct_send_ctx {
-	struct list_head	msg_list;
-	int			wr_cnt;
-	bool			need_invalidate_rkey;
-	unsigned int		remote_key;
-};
-
 struct smb_direct_rdma_rw_msg {
 	struct smb_direct_transport	*t;
 	struct ib_cqe		cqe;
@@ -156,7 +149,7 @@ static inline int get_buf_page_count(void *buf, int size)
 static void smb_direct_destroy_pools(struct smb_direct_transport *transport);
 static void smb_direct_post_recv_credits(struct work_struct *work);
 static int smb_direct_post_send_data(struct smb_direct_transport *t,
-				     struct smb_direct_send_ctx *send_ctx,
+				     struct smbdirect_send_batch *send_ctx,
 				     struct kvec *iov, int niov,
 				     int remaining_data_length);
 
@@ -871,7 +864,7 @@ static int smb_direct_post_send(struct smb_direct_transport *t,
 }
 
 static void smb_direct_send_ctx_init(struct smb_direct_transport *t,
-				     struct smb_direct_send_ctx *send_ctx,
+				     struct smbdirect_send_batch *send_ctx,
 				     bool need_invalidate_rkey,
 				     unsigned int remote_key)
 {
@@ -882,7 +875,7 @@ static void smb_direct_send_ctx_init(struct smb_direct_transport *t,
 }
 
 static int smb_direct_flush_send_list(struct smb_direct_transport *t,
-				      struct smb_direct_send_ctx *send_ctx,
+				      struct smbdirect_send_batch *send_ctx,
 				      bool is_last)
 {
 	struct smbdirect_socket *sc = &t->socket;
@@ -946,7 +939,7 @@ static int wait_for_credits(struct smb_direct_transport *t,
 }
 
 static int wait_for_send_credits(struct smb_direct_transport *t,
-				 struct smb_direct_send_ctx *send_ctx)
+				 struct smbdirect_send_batch *send_ctx)
 {
 	struct smbdirect_socket *sc = &t->socket;
 	int ret;
@@ -1081,7 +1074,7 @@ static int get_mapped_sg_list(struct ib_device *device, void *buf, int size,
 }
 
 static int post_sendmsg(struct smb_direct_transport *t,
-			struct smb_direct_send_ctx *send_ctx,
+			struct smbdirect_send_batch *send_ctx,
 			struct smbdirect_send_io *msg)
 {
 	struct smbdirect_socket *sc = &t->socket;
@@ -1120,7 +1113,7 @@ static int post_sendmsg(struct smb_direct_transport *t,
 }
 
 static int smb_direct_post_send_data(struct smb_direct_transport *t,
-				     struct smb_direct_send_ctx *send_ctx,
+				     struct smbdirect_send_batch *send_ctx,
 				     struct kvec *iov, int niov,
 				     int remaining_data_length)
 {
@@ -1198,7 +1191,7 @@ static int smb_direct_writev(struct ksmbd_transport *t,
 			sizeof(struct smbdirect_data_transfer);
 	int ret;
 	struct kvec vec;
-	struct smb_direct_send_ctx send_ctx;
+	struct smbdirect_send_batch send_ctx;
 
 	if (sc->status != SMBDIRECT_SOCKET_CONNECTED)
 		return -ENOTCONN;
-- 
2.43.0


