Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D102AC6D67
	for <lists+samba-technical@lfdr.de>; Wed, 28 May 2025 18:03:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=/jmE3OrOek0uyTvGELgfC3Erx3e9sATf5y9xZJo9UcM=; b=uRAw+X0maGPsctBVhFVWE4Ach8
	NO7QvFh+rc4IS7o/EG+KevgBz07Yv4o2tOTbfJCVEw+yGRvrWTYB8xDz/t793Z4RiwsVUIlQ2//l3
	L0J1ImJI7JCsrNOM2uDRBde+6FwPAKHJj5TsZtX7F0yteENi4QXCaOuW+00MJObtqb/do90lmhuEm
	VsW/w+Z22nwA/2tY4bfYWgWrePrzx0B0SYfKrrh6sKy3+GRtjATtFPaBhTJMNyW4lhexHIxZH3yfg
	jTOhpxq3/spldBspSvqvhviggmreg7ZbBUiuLO8WOsHPN0grexv3OJwpgv7RIhUli/J4p4owAFWCj
	+/307/1g==;
Received: from ip6-localhost ([::1]:42270 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uKJFF-004MA6-ID; Wed, 28 May 2025 16:03:10 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:58918) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uKJEo-004M0p-IZ
 for samba-technical@lists.samba.org; Wed, 28 May 2025 16:02:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-Id:Date:Cc:To:From;
 bh=/jmE3OrOek0uyTvGELgfC3Erx3e9sATf5y9xZJo9UcM=; b=OHDS8/uyMwpWoeq1CRLNuh8n8X
 GeC1RzcZXZjIuWsxEsKrg2cmVozKg9rmpgKDTFL5lJYVH7ghaAyHca8N4liHg8+BQS2EqcMqjWWDh
 nZTwA2/opr5dKFCs4jpafmy7tKLb26dgXGdFITu7WQHG49RnoqSR0OUxMHm3dmvYNrXGLgnGMgGKH
 CxkdjzEFy9e9o7u/4N7gDb6YsHKritIsKq897qFUDz4srRRKTuuPJ6XuvUY3CWolvrqZIX3r/voQO
 sMCtHcXI7rxdze7ougMAW9jXUw9utbdS/AxHZIANsgfQzJGdbz+2i9KEJZ/LLDbmbxv2G5TaLQ9XI
 HWfBTJoP/0PUiFeACJIrJ10R9WtmZp4tuBNOvtxMo6u1Sp7McI+l9162CSpd8/K4uBtC0u3kL3RLD
 dXwMWJ+Wz9fRCoSSxl7jfbBuVDo9ZlYM+b+5ZlqIKb4NVqcJwJoT5VbxAtR8srLM9juz2MmYhCCo1
 DN19NxJgWmvqOqlkkLgAXOPc;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uKJEi-007hKU-12; Wed, 28 May 2025 16:02:36 +0000
To: linux-cifs@vger.kernel.org
Subject: [PATCH v2 05/12] smb: client: make use of common smbdirect.h
Date: Wed, 28 May 2025 18:01:34 +0200
Message-Id: <cd1351a794c6af9c2a7f6f0820bb266df3f9cf40.1748446473.git.metze@samba.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1748446473.git.metze@samba.org>
References: <cover.1748446473.git.metze@samba.org>
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
Cc: Meetakshi Setiya <meetakshisetiyaoss@gmail.com>,
 Tom Talpey <tom@talpey.com>, samba-technical@lists.samba.org,
 Hyunchul Lee <hyc.lee@gmail.com>, metze@samba.org,
 Steve French <smfrench@gmail.com>, Namjae Jeon <linkinjeon@kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: Long Li <longli@microsoft.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: Hyunchul Lee <hyc.lee@gmail.com>
Cc: Meetakshi Setiya <meetakshisetiyaoss@gmail.com>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
---
 fs/smb/client/smb2pdu.c   | 17 +++++++++--------
 fs/smb/client/smbdirect.h |  7 -------
 2 files changed, 9 insertions(+), 15 deletions(-)

diff --git a/fs/smb/client/smb2pdu.c b/fs/smb/client/smb2pdu.c
index 701a138b82c8..3529b829cda7 100644
--- a/fs/smb/client/smb2pdu.c
+++ b/fs/smb/client/smb2pdu.c
@@ -36,6 +36,7 @@
 #include "smb2glob.h"
 #include "cifspdu.h"
 #include "cifs_spnego.h"
+#include "../common/smbdirect/smbdirect.h"
 #include "smbdirect.h"
 #include "trace.h"
 #ifdef CONFIG_CIFS_DFS_UPCALL
@@ -4442,10 +4443,10 @@ smb2_new_read_req(void **buf, unsigned int *total_len,
 #ifdef CONFIG_CIFS_SMB_DIRECT
 	/*
 	 * If we want to do a RDMA write, fill in and append
-	 * smbd_buffer_descriptor_v1 to the end of read request
+	 * smbdirect_buffer_descriptor_v1 to the end of read request
 	 */
 	if (rdata && smb3_use_rdma_offload(io_parms)) {
-		struct smbd_buffer_descriptor_v1 *v1;
+		struct smbdirect_buffer_descriptor_v1 *v1;
 		bool need_invalidate = server->dialect == SMB30_PROT_ID;
 
 		rdata->mr = smbd_register_mr(server->smbd_conn, &rdata->subreq.io_iter,
@@ -4459,8 +4460,8 @@ smb2_new_read_req(void **buf, unsigned int *total_len,
 		req->ReadChannelInfoOffset =
 			cpu_to_le16(offsetof(struct smb2_read_req, Buffer));
 		req->ReadChannelInfoLength =
-			cpu_to_le16(sizeof(struct smbd_buffer_descriptor_v1));
-		v1 = (struct smbd_buffer_descriptor_v1 *) &req->Buffer[0];
+			cpu_to_le16(sizeof(struct smbdirect_buffer_descriptor_v1));
+		v1 = (struct smbdirect_buffer_descriptor_v1 *) &req->Buffer[0];
 		v1->offset = cpu_to_le64(rdata->mr->mr->iova);
 		v1->token = cpu_to_le32(rdata->mr->mr->rkey);
 		v1->length = cpu_to_le32(rdata->mr->mr->length);
@@ -4968,10 +4969,10 @@ smb2_async_writev(struct cifs_io_subrequest *wdata)
 #ifdef CONFIG_CIFS_SMB_DIRECT
 	/*
 	 * If we want to do a server RDMA read, fill in and append
-	 * smbd_buffer_descriptor_v1 to the end of write request
+	 * smbdirect_buffer_descriptor_v1 to the end of write request
 	 */
 	if (smb3_use_rdma_offload(io_parms)) {
-		struct smbd_buffer_descriptor_v1 *v1;
+		struct smbdirect_buffer_descriptor_v1 *v1;
 		bool need_invalidate = server->dialect == SMB30_PROT_ID;
 
 		wdata->mr = smbd_register_mr(server->smbd_conn, &wdata->subreq.io_iter,
@@ -4990,8 +4991,8 @@ smb2_async_writev(struct cifs_io_subrequest *wdata)
 		req->WriteChannelInfoOffset =
 			cpu_to_le16(offsetof(struct smb2_write_req, Buffer));
 		req->WriteChannelInfoLength =
-			cpu_to_le16(sizeof(struct smbd_buffer_descriptor_v1));
-		v1 = (struct smbd_buffer_descriptor_v1 *) &req->Buffer[0];
+			cpu_to_le16(sizeof(struct smbdirect_buffer_descriptor_v1));
+		v1 = (struct smbdirect_buffer_descriptor_v1 *) &req->Buffer[0];
 		v1->offset = cpu_to_le64(wdata->mr->mr->iova);
 		v1->token = cpu_to_le32(wdata->mr->mr->rkey);
 		v1->length = cpu_to_le32(wdata->mr->mr->length);
diff --git a/fs/smb/client/smbdirect.h b/fs/smb/client/smbdirect.h
index 4da0974ce730..8561e19a23a3 100644
--- a/fs/smb/client/smbdirect.h
+++ b/fs/smb/client/smbdirect.h
@@ -177,13 +177,6 @@ enum smbd_message_type {
 	SMBD_TRANSFER_DATA,
 };
 
-/* The packet fields for a registered RDMA buffer */
-struct smbd_buffer_descriptor_v1 {
-	__le64 offset;
-	__le32 token;
-	__le32 length;
-} __packed;
-
 /* Maximum number of SGEs used by smbdirect.c in any send work request */
 #define SMBDIRECT_MAX_SEND_SGE	6
 
-- 
2.34.1


