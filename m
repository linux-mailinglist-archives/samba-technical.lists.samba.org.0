Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BD3FB34CCC
	for <lists+samba-technical@lfdr.de>; Mon, 25 Aug 2025 22:52:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=nJI0H4ilBK20OpQaG9Kglv2NydBNuQCIF+aIEOZ2Ct0=; b=5zjBQ4haB+3zwZJFzbhCWnS94j
	7ynwS6gkWTCHmIgneG8bfQgkfy8xtXT/V5MeXKTLMfZr0GqwHF80WVYJMQFrKbo7GbGbeNwmz18wa
	HVafQvizqgt3lll/qnIcZjPrvagbGflJPCNItB1RvCaCAYotJGCSIRm4u5xVHadZLjleawUIkuB5v
	EkpvC4ux/7dbtipFEe21rN/d5FV/PE52bBjUSqDIFBtNDCK/TD2h+HlzIwd/aQYmoaWQxwGc/8S1O
	J1Eqhy0GoEszHELvLaG4CHg1QZJ+DudOS9ls6GTUlMgYZf04R8Mv8zs1pxjaYiOS0AbLvB3nV2Ela
	IZR/DOwg==;
Received: from ip6-localhost ([::1]:38430 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uqeBE-000PIY-GD; Mon, 25 Aug 2025 20:52:40 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:24894) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uqe8z-000OP5-0i
 for samba-technical@lists.samba.org; Mon, 25 Aug 2025 20:50:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=nJI0H4ilBK20OpQaG9Kglv2NydBNuQCIF+aIEOZ2Ct0=; b=ljawLQ/LjeQtADLGQElMy8FVi0
 FQ2ByoZbIhdlF6AwwZkcelDqOauU3+NwbZIKsb5LQ/heh1XKTLIeV3OaXd6cLVTVNK98elg76ELMW
 6Cukz+fWMdpxxQVp/cs/JHWTFL1KaUUwZTxRDgo5oUd9sqfYnfG17YTfcvmSHV/d+UG+EMAhjjc6r
 HdjWCZymCaQ3OCCN2z6BF0FKJN/v2Fj/OkB0dCvQSscv+NkjpKvBHxgdrUw2aIK9U7pMwnHIz76gW
 IVCygBlbtbxX1rWV0BfN+KmOAJvd7WOKEfyqsCiMpbIkRekoTk4Y8+Nsz0ecHvbHGZEi6CwoLW1fS
 Q0AZDweCfD1vGIFbnRdV1ILxKXPgLGQ+aEuamwLmVMaGstx+tnq0HPrRVe6JzzCRqrEesVIdFAIyV
 PC2SvU4fNoIBg8L/VBTCYxqvUpen5j5+BkSqyDhaB45Ya2usqm/PQOHrQShoxDA8MK/ExP4pgPSAp
 ueP50RYOe7W7Qe86uuRqAOc1;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uqe8s-000kvo-2r; Mon, 25 Aug 2025 20:50:15 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v4 051/142] smb: client: add and use smbd_get_parameters()
Date: Mon, 25 Aug 2025 22:40:12 +0200
Message-ID: <124671bf9b9473af89bb6ec2bb7bf2e71032f2be.1756139607.git.metze@samba.org>
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

In future struct smbdirect_socket_parameters will be the only
public structure for the smb layer. This prepares this...

Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: Long Li <longli@microsoft.com>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
---
 fs/smb/client/smb2ops.c   | 8 ++++----
 fs/smb/client/smbdirect.c | 7 +++++++
 fs/smb/client/smbdirect.h | 2 ++
 3 files changed, 13 insertions(+), 4 deletions(-)

diff --git a/fs/smb/client/smb2ops.c b/fs/smb/client/smb2ops.c
index 94b1d7a395d5..87b6254e1e73 100644
--- a/fs/smb/client/smb2ops.c
+++ b/fs/smb/client/smb2ops.c
@@ -504,8 +504,8 @@ smb3_negotiate_wsize(struct cifs_tcon *tcon, struct smb3_fs_context *ctx)
 	wsize = min_t(unsigned int, wsize, server->max_write);
 #ifdef CONFIG_CIFS_SMB_DIRECT
 	if (server->rdma) {
-		struct smbdirect_socket_parameters *sp =
-			&server->smbd_conn->socket.parameters;
+		const struct smbdirect_socket_parameters *sp =
+			smbd_get_parameters(server->smbd_conn);
 
 		if (server->sign)
 			/*
@@ -555,8 +555,8 @@ smb3_negotiate_rsize(struct cifs_tcon *tcon, struct smb3_fs_context *ctx)
 	rsize = min_t(unsigned int, rsize, server->max_read);
 #ifdef CONFIG_CIFS_SMB_DIRECT
 	if (server->rdma) {
-		struct smbdirect_socket_parameters *sp =
-			&server->smbd_conn->socket.parameters;
+		const struct smbdirect_socket_parameters *sp =
+			smbd_get_parameters(server->smbd_conn);
 
 		if (server->sign)
 			/*
diff --git a/fs/smb/client/smbdirect.c b/fs/smb/client/smbdirect.c
index 7a1ae4704ab0..be4e90755a6c 100644
--- a/fs/smb/client/smbdirect.c
+++ b/fs/smb/client/smbdirect.c
@@ -13,6 +13,13 @@
 #include "cifsproto.h"
 #include "smb2proto.h"
 
+const struct smbdirect_socket_parameters *smbd_get_parameters(struct smbd_connection *conn)
+{
+	struct smbdirect_socket *sc = &conn->socket;
+
+	return &sc->parameters;
+}
+
 static struct smbdirect_recv_io *get_receive_buffer(
 		struct smbd_connection *info);
 static void put_receive_buffer(
diff --git a/fs/smb/client/smbdirect.h b/fs/smb/client/smbdirect.h
index 455618e676f5..7773939db5f2 100644
--- a/fs/smb/client/smbdirect.h
+++ b/fs/smb/client/smbdirect.h
@@ -59,6 +59,8 @@ struct smbd_connection {
 struct smbd_connection *smbd_get_connection(
 	struct TCP_Server_Info *server, struct sockaddr *dstaddr);
 
+const struct smbdirect_socket_parameters *smbd_get_parameters(struct smbd_connection *conn);
+
 /* Reconnect SMBDirect session */
 int smbd_reconnect(struct TCP_Server_Info *server);
 /* Destroy SMBDirect session */
-- 
2.43.0


