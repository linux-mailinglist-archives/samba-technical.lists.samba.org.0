Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id DEBD6C86A15
	for <lists+samba-technical@lfdr.de>; Tue, 25 Nov 2025 19:31:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=Pr6uFoEmMB9T+tkJ3IxLkRvCsBMSjEQVa0Z7Myvcimo=; b=jsk28hjfGnRgSD/1qLvda696zK
	kFK/nuvwTmiiuBnbnEbnamfyvid8locClOybfBNjsCsKGjypGWHCZ4VbitPRfc8jHEvUv5xuQ+3Zt
	E5AxmNfC+G4KIEXdpxw4wBnJycqDDaw0655Hz5GHxzhDDnitW5xMnWu5rIj0FWijmtacFBhg9M5Ls
	loU5vd7YYSOGaucyvqsliRVUp34InVMQAg06vA8Bs2imwjtw8jY6Q8mC8W5gIaiWmQNDBWXSu3mWW
	O21T8fHb2q/AuMrWFR5Q4cEb/ojKNYM1jMEe2mHnIPKQiIgXsuC70W26Cr6UILgR9gQJKsN6pf23w
	kLvepq4A==;
Received: from ip6-localhost ([::1]:50504 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vNxoc-00DGDX-BI; Tue, 25 Nov 2025 18:31:04 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:22004) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vNxmv-00DFoG-9u
 for samba-technical@lists.samba.org; Tue, 25 Nov 2025 18:29:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=Pr6uFoEmMB9T+tkJ3IxLkRvCsBMSjEQVa0Z7Myvcimo=; b=BZ1ZqOhrSwU4cNWKqxekEFOacD
 x9sfe3k3ZY1+8bHUCxKuuA5kLYXlAuuI+EHXi/NwE5Wfx9a7CTBtqbkDQBhicPoTjyk1vQhDIHpcF
 xNXbKTAcgayWVJ0MQY40OrKW/lVGam+zD/NUHAx4ku51eyaJj24ms3gi9CSxcTrtWc+NSdkWroPnr
 uqmaLcYFJ9R8X+uZNZQkpAwi2+dHdk0wbD+v2M/6VmWVARWbfud3aEQ7f7Rrf6fwsLvgYRJg9gynl
 m11r+LXZ5ex3/64Tjosrv62WuQ38/1TQHcMhLwC42jSdLEGbAOJXGTgkI0eIQ/c6zskqHlL9B7a6R
 j8dHQuAPQ7w/wLLNbzLbLyy2bbLIw3rlXfOEnnVfWHllJKkSZJd+MLmv/O6Nz3xk1e/AFEtV4kJTB
 aCh428HNt5VxuHN2ChAAQviHoe9+2NOWUYRCgs2lHSRfdpUW5gZx8gSVuCOEA7JCBFmH8UcSL3pqW
 VA16mmiYE5l1TMn751Wrr4Cc;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vNxh7-00FfgO-1G; Tue, 25 Nov 2025 18:23:18 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v4 127/145] smb: server: split out smb_direct_send_iter() out
 of smb_direct_writev()
Date: Tue, 25 Nov 2025 18:56:13 +0100
Message-ID: <6d7dde779fc3ec602e16ebcc85a6b0d13ae9d42e.1764091285.git.metze@samba.org>
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

This will help to move to common code in future.

Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
Signed-off-by: Steve French <stfrench@microsoft.com>
---
 fs/smb/server/transport_rdma.c | 47 +++++++++++++++++++++++-----------
 1 file changed, 32 insertions(+), 15 deletions(-)

diff --git a/fs/smb/server/transport_rdma.c b/fs/smb/server/transport_rdma.c
index b153a47be237..f9913321389b 100644
--- a/fs/smb/server/transport_rdma.c
+++ b/fs/smb/server/transport_rdma.c
@@ -772,43 +772,47 @@ static int smb_direct_post_send_data(struct smbdirect_socket *sc,
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
@@ -835,6 +839,19 @@ static int smb_direct_writev(struct ksmbd_transport *t,
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


