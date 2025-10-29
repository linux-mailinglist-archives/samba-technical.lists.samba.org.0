Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FA82C1AF27
	for <lists+samba-technical@lfdr.de>; Wed, 29 Oct 2025 14:51:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=WFmF5+Nt1NBCDo66N7R5SUSiASwFwn+Nbs5KdfV8Sx8=; b=3t+C9jmg/FZpLE+Lr/dJ/+GxG4
	/cuKBRLkzL6G7caCXDuWWyAZp2AIDgu1eWLkGNtKBIIIQwVgCEsyMvs3uBjeUoNvKHw3jpj/0l6Dw
	ZRbzwXd92vW8gRe0bTM+lH0cc1GS0vKycIvlnEjGm5rnx75CTEurNt1J/M5pMh0g3Cb7d/D8EVRNw
	9VjWG6GyEBgSRPesDdeBnxYtLr/tk/ZVCoKUmNdVO4TCB9lBSBuh/tul7a3vheASJP+C/bqQR96Ec
	9W49fHHf/Yib8Q8z4ApRT9J1FBHEkCl8ElEfiKr0olA/YrOKLFW0o1jwIdBnlJDRQDttJpdO6zMIe
	8oo4Thgg==;
Received: from ip6-localhost ([::1]:29478 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vE6a9-009Erc-85; Wed, 29 Oct 2025 13:51:21 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:44854) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vE6Jy-0098yn-SI
 for samba-technical@lists.samba.org; Wed, 29 Oct 2025 13:34:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=WFmF5+Nt1NBCDo66N7R5SUSiASwFwn+Nbs5KdfV8Sx8=; b=dyDRVakfNY0eIxuzZn5uZT2LWh
 9gJ51C9DR2QpyE1xmybRsZjWnk54yaEuPoEWv16FQbJ9X6GbVXM8PB70qbGnEKDRyDNUzVE32CHkf
 cV+HjVVun7b7M86YklU5xkb6xCU/ITSv4Sxir02TrBuGwNJj6h08uzpDqivCBF2F4qeRd7HU09eqG
 sRl1YVkPEcSphuMcCElZylVoZtMIDocBNx5JnxENz2lChbN3XuCYIQbHgpLKSJH2/AF9wVxRqb/l+
 otqRARAf+i58V6ZFcl+D1ObpagieB0VGzy76dt5d6YX0Danv9Gx6YOHQwQuB8kLL2kPR1WT8xztD3
 TRSjaEYuRDFxpzQLJBtu0Su+qr6yH6vEWqklryCmRe7Yg3YOtl8ZqMF+nMZv4d2NSzQVHfp4tmm7B
 /FIZ0rv+fmLbp9KzgrfQNl1I3hIDVhwf8ovO+tcMjYJZrE6x4DjicFFYxGNzPhkXhxh04516F7r08
 DKgOFzGFdR7W7Aj5d+U2fXXS;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vE6Jx-00Bd5p-0g; Wed, 29 Oct 2025 13:34:37 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v2 121/127] smb: server: split out smb_direct_send_iter() out
 of smb_direct_writev()
Date: Wed, 29 Oct 2025 14:21:39 +0100
Message-ID: <ee587568b35f5bd2ae8580a4f29c843a09ddfe20.1761742839.git.metze@samba.org>
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

This will help to move to common code in future.

Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
---
 fs/smb/server/transport_rdma.c | 47 +++++++++++++++++++++++-----------
 1 file changed, 32 insertions(+), 15 deletions(-)

diff --git a/fs/smb/server/transport_rdma.c b/fs/smb/server/transport_rdma.c
index d888b5396cd6..8a5183426bbb 100644
--- a/fs/smb/server/transport_rdma.c
+++ b/fs/smb/server/transport_rdma.c
@@ -757,43 +757,47 @@ static int smb_direct_post_send_data(struct smbdirect_socket *sc,
 	return ret;
 }
 
-static int smb_direct_writev(struct ksmbd_transport *t,
-			     struct kvec *iov, int niovs, int buflen,
-			     bool need_invalidate, unsigned int remote_key)
+static int smb_direct_send_iter(struct smbdirect_socket *sc,
+				struct iov_iter *iter,
+				bool need_invalidate,
+				unsigned int remote_key)
 {
-	struct smb_direct_transport *st = SMBD_TRANS(t);
-	struct smbdirect_socket *sc = &st->socket;
 	struct smbdirect_socket_parameters *sp = &sc->parameters;
 	int ret;
 	struct smbdirect_send_batch send_ctx;
-	struct iov_iter iter;
 	int error = 0;
+	__be32 hdr;
 
 	if (sc->status != SMBDIRECT_SOCKET_CONNECTED)
 		return -ENOTCONN;
 
-	//FIXME: skip RFC1002 header..
-	if (WARN_ON_ONCE(niovs <= 1 || iov[0].iov_len != 4))
+	/*
+	 * For now we expect the iter to have the full
+	 * message, including a 4 byte length header.
+	 */
+	if (iov_iter_count(iter) <= 4)
+		return -EINVAL;
+	if (!copy_from_iter_full(&hdr, sizeof(hdr), iter))
+		return -EFAULT;
+	if (iov_iter_count(iter) != be32_to_cpu(hdr))
 		return -EINVAL;
-	iov_iter_kvec(&iter, ITER_SOURCE, iov, niovs, buflen);
-	iov_iter_advance(&iter, 4);
 
 	/*
 	 * The size must fit into the negotiated
 	 * fragmented send size.
 	 */
-	if (iov_iter_count(&iter) > sp->max_fragmented_send_size)
+	if (iov_iter_count(iter) > sp->max_fragmented_send_size)
 		return -EMSGSIZE;
 
 	ksmbd_debug(RDMA, "Sending smb (RDMA): smb_len=%zu\n",
-		    iov_iter_count(&iter));
+		    iov_iter_count(iter));
 
 	smb_direct_send_ctx_init(&send_ctx, need_invalidate, remote_key);
-	while (iov_iter_count(&iter)) {
+	while (iov_iter_count(iter)) {
 		ret = smb_direct_post_send_data(sc,
 						&send_ctx,
-						&iter,
-						iov_iter_count(&iter));
+						iter,
+						iov_iter_count(iter));
 		if (unlikely(ret)) {
 			error = ret;
 			break;
@@ -820,6 +824,19 @@ static int smb_direct_writev(struct ksmbd_transport *t,
 	return ret;
 }
 
+static int smb_direct_writev(struct ksmbd_transport *t,
+			     struct kvec *iov, int niovs, int buflen,
+			     bool need_invalidate, unsigned int remote_key)
+{
+	struct smb_direct_transport *st = SMBD_TRANS(t);
+	struct smbdirect_socket *sc = &st->socket;
+	struct iov_iter iter;
+
+	iov_iter_kvec(&iter, ITER_SOURCE, iov, niovs, buflen);
+
+	return smb_direct_send_iter(sc, &iter, need_invalidate, remote_key);
+}
+
 static int smb_direct_rdma_write(struct ksmbd_transport *t,
 				 void *buf, unsigned int buflen,
 				 struct smbdirect_buffer_descriptor_v1 *desc,
-- 
2.43.0


