Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B8E3C1AD94
	for <lists+samba-technical@lfdr.de>; Wed, 29 Oct 2025 14:43:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=SGEtkkFzyFUFgGsMeYvCCazxjc1vlEsRrmRb23kb1HI=; b=Wf598rcwPXfDhXbuofPxOFNdDx
	d70ivJboJBcvMd3ShSubN/WUqAHI/+Fm+pftIj50zghoXYs9PYlsow95zswCGf1aclGjK7qy2CDgt
	ftl29zLFGYRewx5rPUdIarE4pkYZV5ihCvZ4cpu2agZ7JnrfrNvWoBYCn/w1Pb3A18BNdQjVxPJCF
	KYT+M5eswC6zZ0UxF1P1QSFoCb4YUm6DwNgxgWyp6IoULvOHj4gPqX7mwMtLX2+1rjiLmSL2zo4WO
	ONhaYaSoGZQhDQJ9V5K187XVkQv6L49BJ3ZrQKmPEkkKa2uJkYmiy5gJE7wemcL6Twz2/wo69XyXu
	duNeEx6Q==;
Received: from ip6-localhost ([::1]:22806 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vE6SF-009Bxb-SK; Wed, 29 Oct 2025 13:43:12 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:29060) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vE6GR-0097lm-EY
 for samba-technical@lists.samba.org; Wed, 29 Oct 2025 13:31:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=SGEtkkFzyFUFgGsMeYvCCazxjc1vlEsRrmRb23kb1HI=; b=iXPMorhtHf3J2OAC7lWCiD5P2I
 kwdeHElFt9t2240x12KXn62cqGvoUuZR/yOsfJqAFRkEpLZXIo/b9zO/hGU/DP/eaasanwmoWPu6+
 j4iXBWNReQdG30G+cJBDJffR1+FxzbcXPC5kHay6/K8iLwss++ldaQHiHhLLcilXVgOWf4CXVvNgn
 F0eE4MZMsX0gXp96bNsaN3dY1CD9gPSBIppcK5haxXXddjd8uhbH4L4AQyjoEnNHOxdcLMATYSEpB
 6INoUc8IEhbT0vKo5wvbO54aVJP4OUkjC+xIOwgeduOoGXyQM9s8vaJYzNNAVO9iBg3qlWlEMdnFo
 fLeC8r4z5S0RPyg8ozUrhoT4nYx8Idj5me65IZ4A6qwq6EFVxFwyrpYV//g02iawd5VytRCJnWPfs
 4w+hNDJCNwAl/8Qn6SWKnakHOha608K16uJN/0o1ANAARkndMc0Q8AN770zqj1/F9kqxIA9eXQwHK
 oIb6mvWHjctzuLgCtG8Os/cO;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vE6GK-00BcRA-1n; Wed, 29 Oct 2025 13:30:52 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v2 084/127] smb: client: let smbd_post_send_full_iter() get
 remaining_length and return data_length
Date: Wed, 29 Oct 2025 14:21:02 +0100
Message-ID: <2cc6c3d37a7103ad51bfbad7209e016134e70461.1761742839.git.metze@samba.org>
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

This will simplify further changes in order to share
more common code in future.

Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: Long Li <longli@microsoft.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
---
 fs/smb/client/smbdirect.c | 24 +++++++++++++++---------
 1 file changed, 15 insertions(+), 9 deletions(-)

diff --git a/fs/smb/client/smbdirect.c b/fs/smb/client/smbdirect.c
index 34404a1d3e58..fb3cf25b78f8 100644
--- a/fs/smb/client/smbdirect.c
+++ b/fs/smb/client/smbdirect.c
@@ -947,9 +947,9 @@ static void smbd_post_send_empty(struct smbdirect_socket *sc)
 
 static int smbd_post_send_full_iter(struct smbdirect_socket *sc,
 				    struct iov_iter *iter,
-				    int *_remaining_data_length)
+				    u32 remaining_data_length)
 {
-	int rc = 0;
+	int bytes = 0;
 
 	/*
 	 * smbd_post_send_iter() respects the
@@ -958,14 +958,16 @@ static int smbd_post_send_full_iter(struct smbdirect_socket *sc,
 	 */
 
 	while (iov_iter_count(iter) > 0) {
-		rc = smbd_post_send_iter(sc, iter, *_remaining_data_length);
+		int rc;
+
+		rc = smbd_post_send_iter(sc, iter, remaining_data_length);
 		if (rc < 0)
-			break;
-		*_remaining_data_length -= rc;
-		rc = 0;
+			return rc;
+		remaining_data_length -= rc;
+		bytes += rc;
 	}
 
-	return rc;
+	return bytes;
 }
 
 /* Perform SMBD negotiate according to [MS-SMBD] 3.1.5.2 */
@@ -1365,16 +1367,20 @@ int smbd_send(struct TCP_Server_Info *server,
 			klen += rqst->rq_iov[i].iov_len;
 		iov_iter_kvec(&iter, ITER_SOURCE, rqst->rq_iov, rqst->rq_nvec, klen);
 
-		rc = smbd_post_send_full_iter(sc, &iter, &remaining_data_length);
+		rc = smbd_post_send_full_iter(sc, &iter, remaining_data_length);
 		if (rc < 0)
 			break;
+		remaining_data_length -= rc;
+		rc = 0;
 
 		if (iov_iter_count(&rqst->rq_iter) > 0) {
 			/* And then the data pages if there are any */
 			rc = smbd_post_send_full_iter(sc, &rqst->rq_iter,
-						      &remaining_data_length);
+						      remaining_data_length);
 			if (rc < 0)
 				break;
+			remaining_data_length -= rc;
+			rc = 0;
 		}
 
 	} while (++rqst_idx < num_rqst);
-- 
2.43.0


