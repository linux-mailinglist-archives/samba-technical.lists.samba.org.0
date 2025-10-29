Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 81598C1AEA2
	for <lists+samba-technical@lfdr.de>; Wed, 29 Oct 2025 14:49:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=CwbS/YDlAkblJiLqlWWZTEX6vo3TSIfWqh/ZIAFYDwc=; b=VhwK416U82EU/SQ/KErotueVKu
	+LnUiPxuK0ciPKbVR6x7lwcxMKaV8z7/MTdLWCP+1XA4yEgK5BWDGLFC2TTPlheco/ADCTxEd/yac
	btSNQpvnfQoSi+pnj3VxRmJt5NqAY7aSNdDjJNDO/F0U4DFWUnY/w1fYPe2nmfNeKds8xBBh+PvSu
	k9wnfZkqLLg1uTYNBIje9eSoRLMGA91WF7+w0f5MnaoDJ9bKf7Hb+Vn72YJcf/ceHSXEROd5obpW6
	W+kxiqrQYpqAQBfqpPDflHMfzx0Xp7fKsCDJjw+htjlCRDGyKZ80C5hglILQeclZ2UrpLoXzltdiM
	LLdYcmtQ==;
Received: from ip6-localhost ([::1]:61200 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vE6Xz-009E4s-Us; Wed, 29 Oct 2025 13:49:08 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:28102) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vE6J3-0098em-FJ
 for samba-technical@lists.samba.org; Wed, 29 Oct 2025 13:33:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=CwbS/YDlAkblJiLqlWWZTEX6vo3TSIfWqh/ZIAFYDwc=; b=doas9AMnpeACmcRGPSLPWirzQL
 ZkzGmKI0KR/l6pOwhJgrqB+tyem+9zVxDHjpNB2BsN+7A/7K9siTmzHssxVq/K13KF/QdLm2Oulzb
 HIijPwF7hwyAGfZBtJz08ZqN+bDDE/Xx3v7SSIOste9zfClCq78Nqk6w1AQCFEJaq/g0CwTP7AtAW
 4zwV/WRnOh1rnf7T03iSURs3CNkWX9qvWYmRnfbt4TP42WWAiGBskef1Jksg1zly9rqIzNQ2MGXft
 5a++G125Q0rmOSdtF1TbnTfQAxfDT6g/bcZvCm3I/COliJOs84IOoN0/MQcw2kcsyIk9h1pcAf+Df
 JzprmcTWnODi8KAfMuBG2YNTm8YKfM2Aeg7bF7FObChpfx7KohbmetZ0iHGCFu4HnB8YkEVloswp4
 W9bMjpP/Di2HAryDf2Od17j9LekjWxABPc6JDu+kvypnY+QUlSQv5uY+/QqtUSFoNQI57rsja9ZBI
 t/0yd3m4EJxwhA9G3xNkwA8q;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vE6J2-00Bcwg-01; Wed, 29 Oct 2025 13:33:40 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v2 111/127] smb: server: make use of
 smbdirect_get_buf_page_count()
Date: Wed, 29 Oct 2025 14:21:29 +0100
Message-ID: <9203393dba708100644f38c6d3fcddab5027b37f.1761742839.git.metze@samba.org>
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

This will allow us to move code into common code
between client and server soon.

Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
---
 fs/smb/server/transport_rdma.c | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/fs/smb/server/transport_rdma.c b/fs/smb/server/transport_rdma.c
index 9cc8cffcc6e9..d8829cb57270 100644
--- a/fs/smb/server/transport_rdma.c
+++ b/fs/smb/server/transport_rdma.c
@@ -196,12 +196,6 @@ unsigned int get_smbd_max_read_write_size(struct ksmbd_transport *kt)
 	return sp->max_read_write_size;
 }
 
-static inline int get_buf_page_count(void *buf, int size)
-{
-	return DIV_ROUND_UP((uintptr_t)buf + size, PAGE_SIZE) -
-		(uintptr_t)buf / PAGE_SIZE;
-}
-
 static int smb_direct_post_send_data(struct smbdirect_socket *sc,
 				     struct smbdirect_send_batch *send_ctx,
 				     struct kvec *iov, int niov,
@@ -828,7 +822,7 @@ static int wait_for_rw_credits(struct smbdirect_socket *sc, int credits)
 static int calc_rw_credits(struct smbdirect_socket *sc,
 			   char *buf, unsigned int len)
 {
-	return DIV_ROUND_UP(get_buf_page_count(buf, len),
+	return DIV_ROUND_UP(smbdirect_get_buf_page_count(buf, len),
 			    sc->rw_io.credits.num_pages);
 }
 
@@ -904,7 +898,7 @@ static int get_sg_list(void *buf, int size, struct scatterlist *sg_list, int nen
 	int offset, len;
 	int i = 0;
 
-	if (size <= 0 || nentries < get_buf_page_count(buf, size))
+	if (size <= 0 || nentries < smbdirect_get_buf_page_count(buf, size))
 		return -EINVAL;
 
 	offset = offset_in_page(buf);
@@ -1095,7 +1089,7 @@ static int smb_direct_writev(struct ksmbd_transport *t,
 			v->iov_len = min_t(size_t,
 					   iov[iov_idx].iov_len - iov_ofs,
 					   possible_bytes);
-			page_count = get_buf_page_count(v->iov_base, v->iov_len);
+			page_count = smbdirect_get_buf_page_count(v->iov_base, v->iov_len);
 			if (page_count > possible_vecs) {
 				/*
 				 * If the number of pages in the buffer
@@ -1124,7 +1118,7 @@ static int smb_direct_writev(struct ksmbd_transport *t,
 				size_t elen = min_t(size_t, v->iov_len - fplen, epages*PAGE_SIZE);
 
 				v->iov_len = fplen + elen;
-				page_count = get_buf_page_count(v->iov_base, v->iov_len);
+				page_count = smbdirect_get_buf_page_count(v->iov_base, v->iov_len);
 				if (WARN_ON_ONCE(page_count > possible_vecs)) {
 					/*
 					 * Something went wrong in the above
@@ -1289,7 +1283,7 @@ static int smb_direct_rdma_xmit(struct smb_direct_transport *t,
 
 		msg->sgt.sgl = &msg->sg_list[0];
 		ret = sg_alloc_table_chained(&msg->sgt,
-					     get_buf_page_count(desc_buf, desc_buf_len),
+					     smbdirect_get_buf_page_count(desc_buf, desc_buf_len),
 					     msg->sg_list, SG_CHUNK_SIZE);
 		if (ret) {
 			ret = -ENOMEM;
@@ -1303,7 +1297,7 @@ static int smb_direct_rdma_xmit(struct smb_direct_transport *t,
 
 		ret = rdma_rw_ctx_init(&msg->rdma_ctx, sc->ib.qp, sc->ib.qp->port,
 				       msg->sgt.sgl,
-				       get_buf_page_count(desc_buf, desc_buf_len),
+				       smbdirect_get_buf_page_count(desc_buf, desc_buf_len),
 				       0,
 				       le64_to_cpu(desc[i].offset),
 				       le32_to_cpu(desc[i].token),
-- 
2.43.0


