Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 010C0B34CE6
	for <lists+samba-technical@lfdr.de>; Mon, 25 Aug 2025 22:54:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=KV1HkgjiZgdGTK+Tvyw+wYdIgNkypxNvc5D6zXWiefc=; b=GfugPDoxgxjgKw6zJ/u9x5O9Be
	1u4gF6nnVgibMfI2BYe09IT4Gsr0i0htR/k+b6+1gmDa1cCIV9fhQ5CTyg2oqS4VqO6Kdb8IlCQEn
	xu4kDZY8hW20E/NfZUZ/WYdjLVQa5DobP/jOy0dSNVIU7W9pUqPCtlYqvIA1Aw4wsHdyCSTE9Y01l
	J3wnzT1fCHlnqh0BWJ8D7R5s6bBmDtr3aR34JA8+xkiip7ZHRXRp810WZCjYxxT5HTLVz6QZLQJQE
	viX+k3K/bUB3orYaNAnv0aTrd9RcCGM9ZdGFVxX6FJc82jvJgI2FsB1f1mfW7Ifo8wSqOVzw/KyPu
	IRN75gIA==;
Received: from ip6-localhost ([::1]:65348 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uqeDE-000Q7j-TU; Mon, 25 Aug 2025 20:54:45 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:52790) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uqeAf-000P68-JB
 for samba-technical@lists.samba.org; Mon, 25 Aug 2025 20:52:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=KV1HkgjiZgdGTK+Tvyw+wYdIgNkypxNvc5D6zXWiefc=; b=o+L7tL7w+vSFXg3jh62GQKAJAR
 MIQ48sJXE/KBK/rN+KMilhThRk41SxmOB9mOM6dnp6EGE7K/lsyDPA4cSa0HRcAxfeW1vkbFktnEA
 1Oz6lGVLZv+NOaQFL+FLInaINJ8mzDzD3yetHnPov9InA9Jo8nCDZG1cppwHBEqZa9lXOLOCBeLxT
 C9jZ5gH4GnQOkB2+gkGbS62DPVm3TQJWeazUeejnjPG9GH4dlCDxWW9LEiSwcIZyZaV+84AY3YnIx
 9ZIRDB5l+e09Ge0ce3+llFYvR/3fMVVlMpY6WbxetT77SHQwHb7X31GNrTmYBQGfgEnw27wt80ds0
 thjYRYjlL5KW2nZZP/Ze8R4Up/T9YrKCxO+PdjQQj/qSvFdqvDIjQTkW6BAhlNptJoq/HxTvIfYJo
 Klpf86B+QfDsqLtRrd7Q6/SD+ij5iCv4kIftr+tgESmUzYHycz0xHJs59R2MCwwq5ce5Hxr34toco
 OXs3AbuclbpKWqx9TqUlapxh;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uqeAa-000lGY-33; Mon, 25 Aug 2025 20:52:01 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v4 061/142] smb: client: pass struct smbdirect_socket to
 smbd_post_recv()
Date: Mon, 25 Aug 2025 22:40:22 +0200
Message-ID: <d14aa1fe7c5bbc8650e439072124eba11cece0b0.1756139607.git.metze@samba.org>
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
 Tom Talpey <tom@talpey.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This will make it easier to move function to the common code
in future.

Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: Long Li <longli@microsoft.com>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
---
 fs/smb/client/smbdirect.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/fs/smb/client/smbdirect.c b/fs/smb/client/smbdirect.c
index 31b9b398b6e5..e00a70125ca8 100644
--- a/fs/smb/client/smbdirect.c
+++ b/fs/smb/client/smbdirect.c
@@ -35,7 +35,7 @@ static struct smbdirect_recv_io *_get_first_reassembly(
 		struct smbdirect_socket *sc);
 
 static int smbd_post_recv(
-		struct smbd_connection *info,
+		struct smbdirect_socket *sc,
 		struct smbdirect_recv_io *response);
 
 static int smbd_post_send_empty(struct smbd_connection *info);
@@ -506,8 +506,6 @@ static void smbd_post_send_credits(struct work_struct *work)
 	struct smbdirect_recv_io *response;
 	struct smbdirect_socket *sc =
 		container_of(work, struct smbdirect_socket, recv_io.posted.refill_work);
-	struct smbd_connection *info =
-		container_of(sc, struct smbd_connection, socket);
 
 	if (sc->status != SMBDIRECT_SOCKET_CONNECTED) {
 		return;
@@ -521,7 +519,7 @@ static void smbd_post_send_credits(struct work_struct *work)
 				break;
 
 			response->first_segment = false;
-			rc = smbd_post_recv(info, response);
+			rc = smbd_post_recv(sc, response);
 			if (rc) {
 				log_rdma_recv(ERR,
 					"post_recv failed rc=%d\n", rc);
@@ -1179,9 +1177,8 @@ static int smbd_post_send_full_iter(struct smbd_connection *info,
  * The interaction is controlled by send/receive credit system
  */
 static int smbd_post_recv(
-		struct smbd_connection *info, struct smbdirect_recv_io *response)
+		struct smbdirect_socket *sc, struct smbdirect_recv_io *response)
 {
-	struct smbdirect_socket *sc = &info->socket;
 	struct smbdirect_socket_parameters *sp = &sc->parameters;
 	struct ib_recv_wr recv_wr;
 	int rc = -EIO;
@@ -1226,7 +1223,7 @@ static int smbd_negotiate(struct smbd_connection *info)
 	sc->status = SMBDIRECT_SOCKET_NEGOTIATE_RUNNING;
 
 	sc->recv_io.expected = SMBDIRECT_EXPECT_NEGOTIATE_REP;
-	rc = smbd_post_recv(info, response);
+	rc = smbd_post_recv(sc, response);
 	log_rdma_event(INFO, "smbd_post_recv rc=%d iov.addr=0x%llx iov.length=%u iov.lkey=0x%x\n",
 		       rc, response->sge.addr,
 		       response->sge.length, response->sge.lkey);
-- 
2.43.0


