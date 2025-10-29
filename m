Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B71CDC1ADCA
	for <lists+samba-technical@lfdr.de>; Wed, 29 Oct 2025 14:44:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=L8FTnyEHkZ7qfPqM15XDKUFuftXacxejlrWlqNb7SNs=; b=JBJBvw48FMQhskD3xY06pvLR+Z
	57J7JU8JhQj4nvfTTZdLRmjQo7mfkvOn6JjG1ixEAki/RCFTqHBjQxassik3S390RUYRKdGDcfZSD
	5wQ8A3f6+8HeP9Ojw5Qsv7tng2w/FUqKUpYu8jncDRNNAYAQQFztDpke0kBnkwqXM7B7X4E6Gxast
	4o4C5ltT8bRK/66hmD9fYJIDNbx6dxjn7LYzMjxH2bRkMfZLiTspxRvMWb2PhAED15jHUeFhrasbB
	D/KBhDGVC4Gatq/+fnkmW/CBb+Me9MYj/KpGvUPLThBKBF3PeRHr9AGj1VumKFcb6/6Wpvm9EPifw
	fwC9tVvQ==;
Received: from ip6-localhost ([::1]:49502 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vE6Tl-009CWk-OK; Wed, 29 Oct 2025 13:44:46 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:41784) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vE6HC-00980v-K1
 for samba-technical@lists.samba.org; Wed, 29 Oct 2025 13:32:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=L8FTnyEHkZ7qfPqM15XDKUFuftXacxejlrWlqNb7SNs=; b=pO9q8OJbZnaXK5wB1VZbSPJcBV
 qRHwDOtHxst5NXNy69EbumEoHiVQ3AD3xW3QflyOq28w9XQCtK05XRYlscRNMYk83s4C8Qn6MOTiJ
 d3xjCD+vdFXRcT20+NEEOKVaVeOZH31fwf06TXaYCjmD/ALcY1w5ag2KD+owivHsr6+FH/Zvnirtn
 NRz8Co8sD+rdLRJY+umVwvtljdsZkSlz/gXE4fOeDtCU/9kl9hmMV+1Sy0RWx6YgfoQ73PHe+a6vM
 3Usp6PbPMSh7Fc38zqBIrm4s/22Kv5Pox6225fqsaF+40oVcyAEQDJuDVH4bKZJXevTCiW4bRO6Sn
 3k4dRJJJWtlamdoC+aK+mXM2VjsQslWuiBRnrBLLeog/WRiOwPI9wDC4FGHOiv3+7Kr4wmNukudYK
 p6/qGk8Bi5NhZ8W5PAhqQ01HpS/2Z+ZuktN/MpuhecwAiHhKXmV8SIMIyndJWH37hkeefJwLWYWI/
 +tQ1QHrjT2dIiYRuQQ2RabHY;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vE6HA-00Bcd4-0g; Wed, 29 Oct 2025 13:31:44 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v2 092/127] smb: server: make use of
 smbdirect_socket_prepare_create()
Date: Wed, 29 Oct 2025 14:21:10 +0100
Message-ID: <f4ad4a6c9da518220174ee41e1017635dd53946a.1761742839.git.metze@samba.org>
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
 Tom Talpey <tom@talpey.com>, Namjae Jeon <linkinjeon@kernel.org>,
 Steve French <stfrench@microsoft.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This prepares the use of functions from smbdirect_connection.c.

Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
Signed-off-by: Steve French <stfrench@microsoft.com>
---
 fs/smb/server/transport_rdma.c | 28 +++++++++++++++++-----------
 1 file changed, 17 insertions(+), 11 deletions(-)

diff --git a/fs/smb/server/transport_rdma.c b/fs/smb/server/transport_rdma.c
index 9bf023b797ad..bcc584884f29 100644
--- a/fs/smb/server/transport_rdma.c
+++ b/fs/smb/server/transport_rdma.c
@@ -397,20 +397,14 @@ static struct smb_direct_transport *alloc_transport(struct rdma_cm_id *cm_id)
 {
 	struct smb_direct_transport *t;
 	struct smbdirect_socket *sc;
+	struct smbdirect_socket_parameters init_params = {};
 	struct smbdirect_socket_parameters *sp;
 	struct ksmbd_conn *conn;
 
-	t = kzalloc(sizeof(*t), KSMBD_DEFAULT_GFP);
-	if (!t)
-		return NULL;
-	sc = &t->socket;
-	smbdirect_socket_init(sc);
-	sp = &sc->parameters;
-
-	sc->workqueue = smb_direct_wq;
-
-	INIT_WORK(&sc->disconnect_work, smb_direct_disconnect_rdma_work);
-
+	/*
+	 * Create the initial parameters
+	 */
+	sp = &init_params;
 	sp->negotiate_timeout_msec = SMB_DIRECT_NEGOTIATE_TIMEOUT * 1000;
 	sp->initiator_depth = SMB_DIRECT_CM_INITIATOR_DEPTH;
 	sp->responder_resources = 1;
@@ -423,6 +417,18 @@ static struct smb_direct_transport *alloc_transport(struct rdma_cm_id *cm_id)
 	sp->keepalive_interval_msec = SMB_DIRECT_KEEPALIVE_SEND_INTERVAL * 1000;
 	sp->keepalive_timeout_msec = SMB_DIRECT_KEEPALIVE_RECV_TIMEOUT * 1000;
 
+	t = kzalloc(sizeof(*t), KSMBD_DEFAULT_GFP);
+	if (!t)
+		return NULL;
+	sc = &t->socket;
+	smbdirect_socket_prepare_create(sc, sp, smb_direct_wq);
+	/*
+	 * from here we operate on the copy.
+	 */
+	sp = &sc->parameters;
+
+	INIT_WORK(&sc->disconnect_work, smb_direct_disconnect_rdma_work);
+
 	sc->rdma.cm_id = cm_id;
 	cm_id->context = sc;
 
-- 
2.43.0


