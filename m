Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DC6BC86982
	for <lists+samba-technical@lfdr.de>; Tue, 25 Nov 2025 19:25:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=cqWnnWhFN0o3syiAo48N69KRxxH+6lXYSpa+6sSDVS8=; b=3oW/xEJPgZLyCKYp0daBhUZpYa
	1OlqWHPYgxvzQgS63p565EyuaBylshGoeLyzRq1cnSZ2cTCDRghXWpznyJuYDbW/BZwPE5dK6DL/O
	/QksA9qwngEFFLUXzfB6HiKk1FRXsp7pEHS/BhjDl1XOLoIJCnhM+eog/6xNgoDfKo4KrCKIr81Eo
	2Anspk5vFu8qawM/KkId986/wkjUZpAe89J/nX+St5WMQXy6VDGJ4wgAEAvMzCfEVCYDtm0dcpmjT
	TIhA1aN4GfUvyMNfLDAAYn1DSF+kMwkjcuEO3pKuroAJMQeJf9MM1HAqbeVCedbN3KdCniLBNKn9I
	zAZ93XXg==;
Received: from ip6-localhost ([::1]:36124 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vNxj0-00DFMe-55; Tue, 25 Nov 2025 18:25:15 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:63770) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vNxgZ-00DEiN-G5
 for samba-technical@lists.samba.org; Tue, 25 Nov 2025 18:22:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=cqWnnWhFN0o3syiAo48N69KRxxH+6lXYSpa+6sSDVS8=; b=UjdM13XFf2HXshtBGuqWCUx8Jd
 Xofvw9QYUhGDKzxCex0iIXi43n5iZns9g8k+H3oW0d7fANI1Wh9jjbpYx0kRP4lZze1kvrUOegXtH
 2LAjrysWzuVjnB1pp95MSg6WYRvpyxx4V0ODFnUMca+u/ssS2TwIO9rLbcsSyUs4TjsF7btszAsAK
 scHT9Cuauc+5gNHNSXO37V8124t5WAJ+yCLPyu9ffOcQ/uCFd4TLMyDgdgpXPI2W3lFt6U6Lke31A
 OU8jzTl+i1GdvjRkSaBox0em/5K48+q26a6fJ1mqQCHh7EorcbUUkvSdsvEFdxp0O7J1aa8rALI0P
 5NtAeLVY5otQdpIUa0JmvfBwwow//GgWvRFCyitrR0tN2NcQSBAVab/Pv7uFaYvPq0yoJFeTxVec7
 Q741DzkgFOtVqBNuJJFJMb8XoWOiKtBxUwucyTteWzuWuIvvz0kJnh4lS4Qs03D/L3r3t/IgmP7WJ
 Ol8WiHKJoy4ODs/tyEiSMCXa;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vNxdW-00Ff8O-1E; Tue, 25 Nov 2025 18:19:35 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v4 117/145] smb: server: make use of
 smbdirect_get_buf_page_count()
Date: Tue, 25 Nov 2025 18:56:03 +0100
Message-ID: <1d97ed7a4fda95eca8cc4bc14d971f56c259ad1c.1764091285.git.metze@samba.org>
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
Cc: metze@samba.org, Steve French <smfrench@gmail.com>,
 Tom Talpey <tom@talpey.com>, Namjae Jeon <linkinjeon@kernel.org>,
 Steve French <stfrench@microsoft.com>
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
Signed-off-by: Steve French <stfrench@microsoft.com>
---
 fs/smb/server/transport_rdma.c | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/fs/smb/server/transport_rdma.c b/fs/smb/server/transport_rdma.c
index 1c509ff2a32a..ca587ed6acce 100644
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
@@ -839,7 +833,7 @@ static int wait_for_rw_credits(struct smbdirect_socket *sc, int credits)
 static int calc_rw_credits(struct smbdirect_socket *sc,
 			   char *buf, unsigned int len)
 {
-	return DIV_ROUND_UP(get_buf_page_count(buf, len),
+	return DIV_ROUND_UP(smbdirect_get_buf_page_count(buf, len),
 			    sc->rw_io.credits.num_pages);
 }
 
@@ -915,7 +909,7 @@ static int get_sg_list(void *buf, int size, struct scatterlist *sg_list, int nen
 	int offset, len;
 	int i = 0;
 
-	if (size <= 0 || nentries < get_buf_page_count(buf, size))
+	if (size <= 0 || nentries < smbdirect_get_buf_page_count(buf, size))
 		return -EINVAL;
 
 	offset = offset_in_page(buf);
@@ -1106,7 +1100,7 @@ static int smb_direct_writev(struct ksmbd_transport *t,
 			v->iov_len = min_t(size_t,
 					   iov[iov_idx].iov_len - iov_ofs,
 					   possible_bytes);
-			page_count = get_buf_page_count(v->iov_base, v->iov_len);
+			page_count = smbdirect_get_buf_page_count(v->iov_base, v->iov_len);
 			if (page_count > possible_vecs) {
 				/*
 				 * If the number of pages in the buffer
@@ -1135,7 +1129,7 @@ static int smb_direct_writev(struct ksmbd_transport *t,
 				size_t elen = min_t(size_t, v->iov_len - fplen, epages*PAGE_SIZE);
 
 				v->iov_len = fplen + elen;
-				page_count = get_buf_page_count(v->iov_base, v->iov_len);
+				page_count = smbdirect_get_buf_page_count(v->iov_base, v->iov_len);
 				if (WARN_ON_ONCE(page_count > possible_vecs)) {
 					/*
 					 * Something went wrong in the above
@@ -1300,7 +1294,7 @@ static int smb_direct_rdma_xmit(struct smb_direct_transport *t,
 
 		msg->sgt.sgl = &msg->sg_list[0];
 		ret = sg_alloc_table_chained(&msg->sgt,
-					     get_buf_page_count(desc_buf, desc_buf_len),
+					     smbdirect_get_buf_page_count(desc_buf, desc_buf_len),
 					     msg->sg_list, SG_CHUNK_SIZE);
 		if (ret) {
 			ret = -ENOMEM;
@@ -1314,7 +1308,7 @@ static int smb_direct_rdma_xmit(struct smb_direct_transport *t,
 
 		ret = rdma_rw_ctx_init(&msg->rdma_ctx, sc->ib.qp, sc->ib.qp->port,
 				       msg->sgt.sgl,
-				       get_buf_page_count(desc_buf, desc_buf_len),
+				       smbdirect_get_buf_page_count(desc_buf, desc_buf_len),
 				       0,
 				       le64_to_cpu(desc[i].offset),
 				       le32_to_cpu(desc[i].token),
-- 
2.43.0


