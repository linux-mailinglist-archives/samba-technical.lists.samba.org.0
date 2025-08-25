Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E412B34D6C
	for <lists+samba-technical@lfdr.de>; Mon, 25 Aug 2025 23:04:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=67ADOIqlwYtUqV4eKru2vkKCiJAUrYomUO0tY3Lt+hM=; b=P5Uf+66oIaOjZOEKTZFrEUBJMc
	DLodzOR3xK1mcfKWAXnzDj1RWnrrJwBqhInAx5TCSFvGIgksJwr5dEypVqyWZRVXLWnkDxonuxGmu
	9RYUQQ9tNkBj9zcdOB88CsuxigOrJEgLBfXm28kKaSs5zfg0wyb+cyXo/bD2E8NzDRH/LSzd1WkrJ
	PbZGoEtYps9StEqauSmofXd9jOqgaTNXMcVsErdI/YIuce3G6JcE1FrDC3TvwjzVTzwciX2baCYDd
	dKt+jsRz5kTQoz3nlwUX2TIUQ5V1J+79JEH1FWpgBknIfWfNRp7/KDCXzydVwqkHZflsFBpgVUhae
	ZzXv9bnA==;
Received: from ip6-localhost ([::1]:55970 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uqeM6-000Tma-BJ; Mon, 25 Aug 2025 21:03:54 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:62346) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uqeHn-000S2G-OG
 for samba-technical@lists.samba.org; Mon, 25 Aug 2025 20:59:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=67ADOIqlwYtUqV4eKru2vkKCiJAUrYomUO0tY3Lt+hM=; b=tE3bjtdmnkWJdc5X8Ckpn1NbAx
 Ekay1pFLy9Q6uBiBe+rO0UPQxRo1m0w/YLZrLqZRQ4wuvRBPRsz65LVFk7RdagrHFrIugCjqXquqD
 mseyiZdutmn7xCsHbU+seUe9eZ49snc50TJ5oQn3vuNMrwIgY8HGQKXPJ3FaeIqEkBkJLfXJxPnj2
 b8VYnEyejsCoA7TW7lsl1szTPeh6N6vQKs1sGx8JgBvh1d409dQ5MPUu77l2L32e7bYzQFZ3uQOd9
 ItFUMqgCu3dP9zPbaLLXSEIeJlmyThfBpH/VxJKJmf0lRqEJn7FYleNhT3kE++mPcrCPj64QhvGdf
 FTMQ5OS4Paq68h7rGhGMfZxULRqFHX+Devy0mj1ZvpcgnJzQNzyAInsvdUvqUlskNyBqWA142SwIu
 6BmSI8Q0byRp/HHx+tBrt6NiPiOoGJJq4snzpWpOU9dsL7fypKmiqWeBDf7s+1fh4jyF2pAFzvOTp
 3owmrEXttm2bzZWbwI9g/9nT;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uqeHl-000mjg-1y; Mon, 25 Aug 2025 20:59:25 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v4 106/142] smb: server: replace smb_trans_direct_transfort()
 with SMBD_TRANS()
Date: Mon, 25 Aug 2025 22:41:07 +0200
Message-ID: <221c9121f3a498cd991983eb3dc5136156e0a627.1756139607.git.metze@samba.org>
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

The spelling of smb_trans_direct_transfort was wrong anyway
and we don't need the logic twice.

Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
---
 fs/smb/server/transport_rdma.c | 20 +++++++-------------
 1 file changed, 7 insertions(+), 13 deletions(-)

diff --git a/fs/smb/server/transport_rdma.c b/fs/smb/server/transport_rdma.c
index 02300d14bc2f..133898b0cd08 100644
--- a/fs/smb/server/transport_rdma.c
+++ b/fs/smb/server/transport_rdma.c
@@ -129,12 +129,6 @@ static int smb_direct_post_send_data(struct smb_direct_transport *t,
 				     struct kvec *iov, int niov,
 				     int remaining_data_length);
 
-static inline struct smb_direct_transport *
-smb_trans_direct_transfort(struct ksmbd_transport *t)
-{
-	return container_of(t, struct smb_direct_transport, transport);
-}
-
 static inline void
 *smbdirect_recv_io_payload(struct smbdirect_recv_io *recvmsg)
 {
@@ -618,7 +612,7 @@ static int smb_direct_read(struct ksmbd_transport *t, char *buf,
 	int to_copy, to_read, data_read, offset;
 	u32 data_length, remaining_data_length, data_offset;
 	int rc;
-	struct smb_direct_transport *st = smb_trans_direct_transfort(t);
+	struct smb_direct_transport *st = SMBD_TRANS(t);
 	struct smbdirect_socket *sc = &st->socket;
 
 again:
@@ -1164,7 +1158,7 @@ static int smb_direct_writev(struct ksmbd_transport *t,
 			     struct kvec *iov, int niovs, int buflen,
 			     bool need_invalidate, unsigned int remote_key)
 {
-	struct smb_direct_transport *st = smb_trans_direct_transfort(t);
+	struct smb_direct_transport *st = SMBD_TRANS(t);
 	struct smbdirect_socket *sc = &st->socket;
 	struct smbdirect_socket_parameters *sp = &sc->parameters;
 	int remaining_data_length;
@@ -1435,7 +1429,7 @@ static int smb_direct_rdma_write(struct ksmbd_transport *t,
 				 struct smbdirect_buffer_descriptor_v1 *desc,
 				 unsigned int desc_len)
 {
-	return smb_direct_rdma_xmit(smb_trans_direct_transfort(t), buf, buflen,
+	return smb_direct_rdma_xmit(SMBD_TRANS(t), buf, buflen,
 				    desc, desc_len, false);
 }
 
@@ -1444,13 +1438,13 @@ static int smb_direct_rdma_read(struct ksmbd_transport *t,
 				struct smbdirect_buffer_descriptor_v1 *desc,
 				unsigned int desc_len)
 {
-	return smb_direct_rdma_xmit(smb_trans_direct_transfort(t), buf, buflen,
+	return smb_direct_rdma_xmit(SMBD_TRANS(t), buf, buflen,
 				    desc, desc_len, true);
 }
 
 static void smb_direct_disconnect(struct ksmbd_transport *t)
 {
-	struct smb_direct_transport *st = smb_trans_direct_transfort(t);
+	struct smb_direct_transport *st = SMBD_TRANS(t);
 	struct smbdirect_socket *sc = &st->socket;
 
 	ksmbd_debug(RDMA, "Disconnecting cm_id=%p\n", sc->rdma.cm_id);
@@ -1460,7 +1454,7 @@ static void smb_direct_disconnect(struct ksmbd_transport *t)
 
 static void smb_direct_shutdown(struct ksmbd_transport *t)
 {
-	struct smb_direct_transport *st = smb_trans_direct_transfort(t);
+	struct smb_direct_transport *st = SMBD_TRANS(t);
 	struct smbdirect_socket *sc = &st->socket;
 
 	ksmbd_debug(RDMA, "smb-direct shutdown cm_id=%p\n", sc->rdma.cm_id);
@@ -1924,7 +1918,7 @@ static int smb_direct_create_qpair(struct smb_direct_transport *t,
 
 static int smb_direct_prepare(struct ksmbd_transport *t)
 {
-	struct smb_direct_transport *st = smb_trans_direct_transfort(t);
+	struct smb_direct_transport *st = SMBD_TRANS(t);
 	struct smbdirect_socket *sc = &st->socket;
 	struct smbdirect_socket_parameters *sp = &sc->parameters;
 	struct smbdirect_recv_io *recvmsg;
-- 
2.43.0


