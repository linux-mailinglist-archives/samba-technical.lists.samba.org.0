Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BF9CAC52D2
	for <lists+samba-technical@lfdr.de>; Tue, 27 May 2025 18:14:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=R/0f3Sv1x7JOL/iypUZpNmP27h7PYl2XgsP5zY1Sd8o=; b=oKWDUs7yY1zaDAh6ZA9GE0S17Q
	b/9S7UPUQIveoPd9w9Xd1JyGKq4Uz/6f38aBEtw4FB2CMVwFp9T9k+bwxjn7XTZRJHZQ0ABdphOCM
	GL88RA6zNiS8lkwDWVvqBdSuvuQpHy63vVBENxY+8QOJkUE/4B5ClkUcHW3psaJCeedNR+woplpkC
	WpJS05T0h+WtYsEl+HsI5CKzDPod5okQ0zH814/fud1tNDc1aUhY0lcQgc5sDfKoaoMnbbgwl5ckJ
	XFTLl3Odz/HLkYaDfw3oVDeOMmCSxP8aX9qpDTm30ji1vRe5kaYaRNmQ1ALPAVNc+JBGuCMrImOMx
	Wgv78Ryw==;
Received: from ip6-localhost ([::1]:19284 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uJwx0-004HqL-6z; Tue, 27 May 2025 16:14:50 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:44476) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uJwwa-004Hlx-9O
 for samba-technical@lists.samba.org; Tue, 27 May 2025 16:14:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-Id:Date:Cc:To:From;
 bh=R/0f3Sv1x7JOL/iypUZpNmP27h7PYl2XgsP5zY1Sd8o=; b=DzmMKPa/xungUTFR9OEGgZ7hw+
 I1x4AbepWheUXGe4avz9Jym5pgVnSu18U4VKUw+++mou6pYWZ5gBzrvQHuLyzkVCBAA2ed28tWaiL
 vfnO7JQSnI290CHTZLy1lPiF7d/WXn8UPVm4Df8tfC7PeBa4lc6d/2xXFj596A37aFMc25vhPKdqr
 Lm5t5gq99ctrvVuSxRGWoc2DVwYMwexKf5hEZYPwMTZCrH7vDAonsdhfnbuBv5ZWq/8SnqxK3lUQH
 O9s6IEyUeuVIyoqt0mTGFTsMtHBllD4kCVahizDATRy4R3/iFyVFUf8goFqsML80TkuKDYvxAfroE
 T77cTatD0gUOl57EgXvrfcC4raSZEWGPSiWb/O/vIKRJ6EDtsQO7I+WJtWDVDNDh0k31AWvMFxHBp
 Pp8H+KmzJElOC0Id6RoRJVZsgHhEp3cQdJzULEBhDP2rN2Q/N7hcQcesEQ/JtSfD/AC2qbAbJyOOn
 tAaA7cN5Sw8X2Xu+KYku+2B+;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uJwwY-007Vnt-1X; Tue, 27 May 2025 16:14:22 +0000
To: linux-cifs@vger.kernel.org
Subject: [PATCH 4/5] smb: client: make use of common
 smb_direct_buffer_descriptor_v1
Date: Tue, 27 May 2025 18:13:01 +0200
Message-Id: <06ddf2c44a6f7917044d50b81f5b1a727fbe29ed.1748362221.git.metze@samba.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1748362221.git.metze@samba.org>
References: <cover.1748362221.git.metze@samba.org>
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
Cc: Tom Talpey <tom@talpey.com>, samba-technical@lists.samba.org,
 Hyunchul Lee <hyc.lee@gmail.com>, metze@samba.org,
 Steve French <smfrench@gmail.com>, Namjae Jeon <linkinjeon@kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: Long Li <longli@microsoft.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: Hyunchul Lee <hyc.lee@gmail.com>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
---
 fs/smb/client/smb2pdu.c   | 16 ++++++++--------
 fs/smb/client/smbdirect.h |  7 -------
 2 files changed, 8 insertions(+), 15 deletions(-)

diff --git a/fs/smb/client/smb2pdu.c b/fs/smb/client/smb2pdu.c
index 701a138b82c8..09b9bb1afd01 100644
--- a/fs/smb/client/smb2pdu.c
+++ b/fs/smb/client/smb2pdu.c
@@ -4442,10 +4442,10 @@ smb2_new_read_req(void **buf, unsigned int *total_len,
 #ifdef CONFIG_CIFS_SMB_DIRECT
 	/*
 	 * If we want to do a RDMA write, fill in and append
-	 * smbd_buffer_descriptor_v1 to the end of read request
+	 * smb_direct_buffer_descriptor_v1 to the end of read request
 	 */
 	if (rdata && smb3_use_rdma_offload(io_parms)) {
-		struct smbd_buffer_descriptor_v1 *v1;
+		struct smb_direct_buffer_descriptor_v1 *v1;
 		bool need_invalidate = server->dialect == SMB30_PROT_ID;
 
 		rdata->mr = smbd_register_mr(server->smbd_conn, &rdata->subreq.io_iter,
@@ -4459,8 +4459,8 @@ smb2_new_read_req(void **buf, unsigned int *total_len,
 		req->ReadChannelInfoOffset =
 			cpu_to_le16(offsetof(struct smb2_read_req, Buffer));
 		req->ReadChannelInfoLength =
-			cpu_to_le16(sizeof(struct smbd_buffer_descriptor_v1));
-		v1 = (struct smbd_buffer_descriptor_v1 *) &req->Buffer[0];
+			cpu_to_le16(sizeof(struct smb_direct_buffer_descriptor_v1));
+		v1 = (struct smb_direct_buffer_descriptor_v1 *) &req->Buffer[0];
 		v1->offset = cpu_to_le64(rdata->mr->mr->iova);
 		v1->token = cpu_to_le32(rdata->mr->mr->rkey);
 		v1->length = cpu_to_le32(rdata->mr->mr->length);
@@ -4968,10 +4968,10 @@ smb2_async_writev(struct cifs_io_subrequest *wdata)
 #ifdef CONFIG_CIFS_SMB_DIRECT
 	/*
 	 * If we want to do a server RDMA read, fill in and append
-	 * smbd_buffer_descriptor_v1 to the end of write request
+	 * smb_direct_buffer_descriptor_v1 to the end of write request
 	 */
 	if (smb3_use_rdma_offload(io_parms)) {
-		struct smbd_buffer_descriptor_v1 *v1;
+		struct smb_direct_buffer_descriptor_v1 *v1;
 		bool need_invalidate = server->dialect == SMB30_PROT_ID;
 
 		wdata->mr = smbd_register_mr(server->smbd_conn, &wdata->subreq.io_iter,
@@ -4990,8 +4990,8 @@ smb2_async_writev(struct cifs_io_subrequest *wdata)
 		req->WriteChannelInfoOffset =
 			cpu_to_le16(offsetof(struct smb2_write_req, Buffer));
 		req->WriteChannelInfoLength =
-			cpu_to_le16(sizeof(struct smbd_buffer_descriptor_v1));
-		v1 = (struct smbd_buffer_descriptor_v1 *) &req->Buffer[0];
+			cpu_to_le16(sizeof(struct smb_direct_buffer_descriptor_v1));
+		v1 = (struct smb_direct_buffer_descriptor_v1 *) &req->Buffer[0];
 		v1->offset = cpu_to_le64(wdata->mr->mr->iova);
 		v1->token = cpu_to_le32(wdata->mr->mr->rkey);
 		v1->length = cpu_to_le32(wdata->mr->mr->length);
diff --git a/fs/smb/client/smbdirect.h b/fs/smb/client/smbdirect.h
index 9c5b78a33311..a6ed8910e864 100644
--- a/fs/smb/client/smbdirect.h
+++ b/fs/smb/client/smbdirect.h
@@ -179,13 +179,6 @@ enum smbd_message_type {
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


