Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 19DBAC868A7
	for <lists+samba-technical@lfdr.de>; Tue, 25 Nov 2025 19:18:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=MP5KVFJ+WAUDu8ay9oEpG62uSdtjgnSYuMNJWqRhG2I=; b=bTkcqAaZHo437NXOMDNpjShH4W
	RzgLNmEDa33QZDjqdB1Nerk2cxU/2xfTZkfD1mS0Q8mzGY1G4MpdYvSKZookaxA/iVUh8A/ZZwtWa
	LmU61ftJ0Zeu3wn+sUks+eRz5esO+Zequtkq0iX3ljFw835WEqjL7vY6czzBxOcPU8k5AM2y1/yhs
	yvTXjIMP1DV0Bn7mPYXuPhY0F2gokDdZmxIdOxqjYmuQsy8pGMPK0yVa0Xwnzfcufm8/mC12guFgE
	KfBbeLgUaupAL1ZDZWee0dYjVQWRMhibgMMw0dzSKK0VQCz3dEs34FPCLV4GZ+Al1+gIesB8lGyDx
	5Y0FCsFw==;
Received: from ip6-localhost ([::1]:34964 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vNxc7-00DDPP-A8; Tue, 25 Nov 2025 18:18:08 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:61358) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vNxUY-00DAl9-BG
 for samba-technical@lists.samba.org; Tue, 25 Nov 2025 18:10:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=MP5KVFJ+WAUDu8ay9oEpG62uSdtjgnSYuMNJWqRhG2I=; b=lZSXwKYaWf9ZyQa4aIiEl0sX/L
 vRGNQHd61M+v4omxLYUvlzVKWgf99gKAC0gV16QWirATJx/Bf/a1IluTNfmv22ck4TiNsqG69hNYq
 MJY3PwGTFO3DR9Bb1ZGDXCgR59pP9eHdsshRzVKQZ69f1Bz4wJjOb6kuHH2Xy6guGZKMEr8O3J/s+
 JLFs+V+mYhSUTFFZL3oTwDlXUotTOJhFgkTkYVkP6H/9LOIFBAbN+GVbOvxWS+KIYSxYdjQAg0erF
 OZj4GPWTCfi8ta9wYoFpVwdOs0P6AXnOkpx4qe83eZq9uvwC1bc2kFW6/rHYP4pmiUmfXr8xKsl1h
 etTHHfJDyGW8aIPT0H3JvnLhy7ubEmema5SfZyxRv2+OqdYUNe+Y05iRUypMuNKvEjZxCV0wXew4c
 ThxsEWvH4AKqGfzhfn01+lZ4QLPk06t5aXHFT+RuD2Qwk0fc396ygUUNLyayE+qmcrJ0aY5+BaLaw
 hdm2VhTnyW5z9vqUdGPEmchM;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vNxRe-00Fdww-3A; Tue, 25 Nov 2025 18:07:19 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v4 084/145] smb: client: let smbd_post_send() make use of
 request->wr
Date: Tue, 25 Nov 2025 18:55:30 +0100
Message-ID: <2d427d59556804d80ef93fbbf71b2be80f6abbe4.1764091285.git.metze@samba.org>
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
Cc: Tom Talpey <tom@talpey.com>, metze@samba.org,
 Steve French <smfrench@gmail.com>, Namjae Jeon <linkinjeon@kernel.org>,
 Steve French <stfrench@microsoft.com>
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
Signed-off-by: Steve French <stfrench@microsoft.com>
---
 fs/smb/client/smbdirect.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/fs/smb/client/smbdirect.c b/fs/smb/client/smbdirect.c
index 5f0d0271083b..5b234f44e1b1 100644
--- a/fs/smb/client/smbdirect.c
+++ b/fs/smb/client/smbdirect.c
@@ -787,7 +787,6 @@ static int manage_keep_alive_before_sending(struct smbdirect_socket *sc)
 static int smbd_post_send(struct smbdirect_socket *sc,
 		struct smbdirect_send_io *request)
 {
-	struct ib_send_wr send_wr;
 	int rc, i;
 
 	for (i = 0; i < request->num_sge; i++) {
@@ -803,14 +802,14 @@ static int smbd_post_send(struct smbdirect_socket *sc,
 
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
 		smbdirect_socket_schedule_cleanup(sc, rc);
-- 
2.43.0


