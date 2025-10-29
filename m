Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 87DAFC1AD63
	for <lists+samba-technical@lfdr.de>; Wed, 29 Oct 2025 14:42:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=qYVFIP4D8wpWTdKmc06AXstkxo8olWxGnecaSifkGdc=; b=qUCF1yvidcGhGlYQlHZQ6r2sZv
	wNiOPPsJwRodQ+anPieGJ5VvRjgJd0Ujhajbtw2YHLogEYwk8Xf7lKvrL7RxPQoQYzcBxB+9sB+Ms
	M3f9BpQFdQQjChPObguRRkhRmf2ugJeZzAElY0Za27Op27HgTVio8iuZIeYGvIHuFI4SohUrY2nA/
	8HQwYIvflcf0ZjcAifCIKMc8oDIqVffKGuzyCV6uUQJ8EBDIXacAJHymqocYNsPJalhgUL236SbGM
	ktLo38AjRIxRdu4oggwWitwGyU4C5JwY+neXIJktzmmZHid1hnEuOrBTJtQx+S5P4JycuFkiBinud
	ZQ3vrRPg==;
Received: from ip6-localhost ([::1]:62264 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vE6RK-009BZa-Rv; Wed, 29 Oct 2025 13:42:15 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:19698) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vE6Fr-0097ZA-8H
 for samba-technical@lists.samba.org; Wed, 29 Oct 2025 13:30:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=qYVFIP4D8wpWTdKmc06AXstkxo8olWxGnecaSifkGdc=; b=EUIw0JrNNSxPXnNC1tgaDs+nO1
 BeJ9uTNJJ8Rs6tlbeIwOPH6JvYz5yN6pAnVNPNBxowSBy84xOM9iaEHr+7951IEj9WM7Vq5ZAqhML
 2FlAkaJtJtlrSKS/WYr5IQdGfcqYM3652NpvC1LgHWRtUIaduNaRGAnPpt+6Q3VeJWNSQorxlnkZB
 xGVtf0OAayCBOPsA7oE47MLsHLH78s1mfAX/WRPHV/wdwRZefym9gjkNexL6xK16+R7TICvMNBNet
 nz+40cG9kpbKSw6C9dMF0xkyfo1VbobDVzJ3bw251kwFuk1u9USf7FdMebG3Me8d3q45kInAUJNIZ
 CFeebUndRaYxCfAORhq87rwXUw4CSjZPsjClQLDVWO5wZUlof4o5kiWEuOcnfZmNk9aVV4jOyeLbf
 c0xB9HERpL4WEpRd+GsqXCFK+7p/7RiyEokUwH/H5cOdX6csdAvQhGkucAxyvh+fU9tqd8uTpt/V9
 ImggF4I//SShdVsPE+tNYBB7;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vE6Fk-00BcNe-33; Wed, 29 Oct 2025 13:30:17 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v2 079/127] smb: client: let smbd_post_send() make use of
 request->wr
Date: Wed, 29 Oct 2025 14:20:57 +0100
Message-ID: <6464bc9d29a384891701c79c5ab4843e349da55f.1761742839.git.metze@samba.org>
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

We don't need a stack variable in addition.

Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: Long Li <longli@microsoft.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
---
 fs/smb/client/smbdirect.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/fs/smb/client/smbdirect.c b/fs/smb/client/smbdirect.c
index 2860f9c5502c..e2f93d4af0a7 100644
--- a/fs/smb/client/smbdirect.c
+++ b/fs/smb/client/smbdirect.c
@@ -786,7 +786,6 @@ static int manage_keep_alive_before_sending(struct smbdirect_socket *sc)
 static int smbd_post_send(struct smbdirect_socket *sc,
 		struct smbdirect_send_io *request)
 {
-	struct ib_send_wr send_wr;
 	int rc, i;
 
 	for (i = 0; i < request->num_sge; i++) {
@@ -802,14 +801,14 @@ static int smbd_post_send(struct smbdirect_socket *sc,
 
 	request->cqe.done = smbdirect_connection_send_io_done;
 
-	send_wr.next = NULL;
-	send_wr.wr_cqe = &request->cqe;
-	send_wr.sg_list = request->sge;
-	send_wr.num_sge = request->num_sge;
-	send_wr.opcode = IB_WR_SEND;
-	send_wr.send_flags = IB_SEND_SIGNALED;
+	request->wr.next = NULL;
+	request->wr.wr_cqe = &request->cqe;
+	request->wr.sg_list = request->sge;
+	request->wr.num_sge = request->num_sge;
+	request->wr.opcode = IB_WR_SEND;
+	request->wr.send_flags = IB_SEND_SIGNALED;
 
-	rc = ib_post_send(sc->ib.qp, &send_wr, NULL);
+	rc = ib_post_send(sc->ib.qp, &request->wr, NULL);
 	if (rc) {
 		log_rdma_send(ERR, "ib_post_send failed rc=%d\n", rc);
 		smbdirect_connection_schedule_disconnect(sc, rc);
-- 
2.43.0


