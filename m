Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 186F0C868A4
	for <lists+samba-technical@lfdr.de>; Tue, 25 Nov 2025 19:18:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=rTIFRPGHp14RU6S8wz0iQq0S/05PDnkVL9vegdas8e0=; b=eNLFp2dzvvTB8JfHpyWkxUL4Mu
	IrPEhsbKFvHxoTr53VUiaipoBHQ1llHmAF1utARoxna4E2UwIOVVGFVzUvw2hf2GgZ7HqM2sZTNxy
	o+Kw9l8KwnoFO41BpEgUjcBWOq60k1GSZKp8HfebMm30MMr0H5AE3K4UZHHRdw9/NOc7rW/j+H5Jo
	YX3qp1BoA9cRcNWleCOij8SnkFF6FBiBOW/PkrtPMg3H+eedgWj622pO7pIIApDJ3GwkJ//nzsU0F
	5nbXt75eBDcsbAB0fxExwVPzHL6uNNjwq6VW98Ou16PH3Ajus4S57mYlfpRnaIgkWBHhFtQL6cjBF
	JyVMUinA==;
Received: from ip6-localhost ([::1]:34606 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vNxbs-00DDKR-Ix; Tue, 25 Nov 2025 18:17:53 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:61406) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vNxUY-00DAlH-5d
 for samba-technical@lists.samba.org; Tue, 25 Nov 2025 18:10:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=rTIFRPGHp14RU6S8wz0iQq0S/05PDnkVL9vegdas8e0=; b=huoMOTOHifA0tP5kFqRBGmuemJ
 evLbMiiKcg+WMBOAGieU5k+K30auvTOBTUVpbZdz05s03dWHd4mFjrIE03PsLFvuxy5ks5Tjm20Qa
 DczEMfDGh8lDaeaY4VaewvYr9Bv3TanzagxwFt6+xwXObmd+MQKmrvQa0+QG2KGgSyE+ZWd7Dh/U9
 XoKhLrtfpPXTC+7n8ytJ/BmfMGK2lmcrJbJCCLpVr22A46hYVDLuHdqYcl0/fdrybhx1VWhycFdOY
 W6TPVKCQl2x6aIqWVoXIh34Cqv0nNriDjZVcKUHKcdXXnx+IavryxscZKovxpf6rBIGrMdEgxgk37
 6/69P58CvDBK+WT7WSZ83zAezEeCPJmD2su6tOWjkR7+OOtUEaedVSJLyg7zeCH4uMGvcp9ZhVNft
 BY8KxZeotBRWprUPLHiILgqyqYWTVI9IFxXOlWfA7Od3an3ZnfetuFGlDpaLPsJFqu23YzkEC3tPb
 3iFddz9elimAUzIokuZ9LryX;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vNxSg-00Fe2v-11; Tue, 25 Nov 2025 18:08:23 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v4 089/145] smb: client: let smbd_post_send_full_iter() get
 remaining_length and return data_length
Date: Tue, 25 Nov 2025 18:55:35 +0100
Message-ID: <71859743ab698275ed41babafa2ecf1d6a88014f.1764091285.git.metze@samba.org>
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

This will simplify further changes in order to share
more common code in future.

Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: Long Li <longli@microsoft.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
Signed-off-by: Steve French <stfrench@microsoft.com>
---
 fs/smb/client/smbdirect.c | 24 +++++++++++++++---------
 1 file changed, 15 insertions(+), 9 deletions(-)

diff --git a/fs/smb/client/smbdirect.c b/fs/smb/client/smbdirect.c
index a924d1aa4a27..1f7b31cb15af 100644
--- a/fs/smb/client/smbdirect.c
+++ b/fs/smb/client/smbdirect.c
@@ -948,9 +948,9 @@ static void smbd_post_send_empty(struct smbdirect_socket *sc)
 
 static int smbd_post_send_full_iter(struct smbdirect_socket *sc,
 				    struct iov_iter *iter,
-				    int *_remaining_data_length)
+				    u32 remaining_data_length)
 {
-	int rc = 0;
+	int bytes = 0;
 
 	/*
 	 * smbd_post_send_iter() respects the
@@ -959,14 +959,16 @@ static int smbd_post_send_full_iter(struct smbdirect_socket *sc,
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
@@ -1366,16 +1368,20 @@ int smbd_send(struct TCP_Server_Info *server,
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


