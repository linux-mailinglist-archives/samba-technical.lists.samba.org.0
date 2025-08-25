Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id BFCCEB34DAD
	for <lists+samba-technical@lfdr.de>; Mon, 25 Aug 2025 23:09:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=esh5/BLG4ViP7Rsvd+k49zuMzjhOnNnug8OGAehW8i8=; b=ruaSujl3dPn18K5VMVeSWCT3qE
	NVI/r85a/x14BZJZA8z8iRWmIW/D637nTmmd8Yrg7WqGSHBWuU4y0YQtDV0CyaG7Mn2I+RLytnCBY
	yH9DgjA1A2l7+zlPeJ+WofsvkrPNmAQ1JtdDllT54PCfatuZI+wFog1EW5urQXdcoYusaQ15L5H/M
	8RlQua212a7s71EhE4S4WU4xBX5L+5sE2YRMZlLKpHBjugFIoPr6qKwfGuX1wYNjrkvgicFStOu/L
	EWOYmlP0qdTKsdMcO1TJfcjDy1MsgHaJdEm6pBEs0Db4FoRa6xQGcfVSg4JrHpLSxkFmzvHPaXb5q
	k7C4/gkQ==;
Received: from ip6-localhost ([::1]:39188 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uqeRb-000WOB-DO; Mon, 25 Aug 2025 21:09:36 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:57328) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uqeN3-000UH4-Ku
 for samba-technical@lists.samba.org; Mon, 25 Aug 2025 21:05:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=esh5/BLG4ViP7Rsvd+k49zuMzjhOnNnug8OGAehW8i8=; b=Ve4BI09+1J8fBjweehNISuR8B6
 Et9yBTiAeCxrLaeu3iZQ4bZFG3pAIWOVb0A8ia475PRL3bsZc3SpJhRR9AafPmXoNEe+a3R2Wsm92
 M/b6yZFxS3KnPN9FxJ5ANYSYz/BVLBJiKkCDDx/82yVcGhUOtfi9NMqDZvE9s+6XMISo6x/TjxIQo
 pCC7+saXVPF8BzJWt2OaK+1n0e7VAeflKo6zYUHQNtBQG2juC534JCQpbgVLL1lpSqwL7Je+0Iemb
 7qWrKFtsjRwJvZMgBqXtP6qXKFiOR6wpIjeuIVaCTR5AV8rMFQltFHAwUKgmOb01A/QCFFraRcNib
 MmAvLvV+nCcNmQZWAcpNp5QBTESP2arVFZ8vEz2+r8hkVRbWBJhd5oqJzTpBMcSJsOO3qO9PO3HXB
 XDw7vY7SVi83R2JSkquH+J2Il8zeq3aY8JSYfBhFjD+GetmzxKRnoKyewL5bp08yxlQ64DeRadzl2
 SD3Yu00o5gYQhtmsqU5MVCzn;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uqeN1-000nps-35; Mon, 25 Aug 2025 21:04:52 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v4 138/142] smb: server: pass struct smbdirect_socket to
 smb_direct_create_header()
Date: Mon, 25 Aug 2025 22:41:39 +0200
Message-ID: <000a2540a9a4af06f09cabfae971f817fe163c9d.1756139608.git.metze@samba.org>
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

This will make it easier to move function to the common code
in future.

Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
---
 fs/smb/server/transport_rdma.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/fs/smb/server/transport_rdma.c b/fs/smb/server/transport_rdma.c
index 600c541a919b..0c11855a2a8a 100644
--- a/fs/smb/server/transport_rdma.c
+++ b/fs/smb/server/transport_rdma.c
@@ -995,11 +995,10 @@ static int calc_rw_credits(struct smbdirect_socket *sc,
 			    sc->rw_io.credits.num_pages);
 }
 
-static int smb_direct_create_header(struct smb_direct_transport *t,
+static int smb_direct_create_header(struct smbdirect_socket *sc,
 				    int size, int remaining_data_length,
 				    struct smbdirect_send_io **sendmsg_out)
 {
-	struct smbdirect_socket *sc = &t->socket;
 	struct smbdirect_socket_parameters *sp = &sc->parameters;
 	struct smbdirect_send_io *sendmsg;
 	struct smbdirect_data_transfer *packet;
@@ -1163,7 +1162,7 @@ static int smb_direct_post_send_data(struct smb_direct_transport *t,
 	for (i = 0; i < niov; i++)
 		data_length += iov[i].iov_len;
 
-	ret = smb_direct_create_header(t, data_length, remaining_data_length,
+	ret = smb_direct_create_header(sc, data_length, remaining_data_length,
 				       &msg);
 	if (ret) {
 		atomic_inc(&sc->send_io.credits.count);
-- 
2.43.0


