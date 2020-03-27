Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 14063194F31
	for <lists+samba-technical@lfdr.de>; Fri, 27 Mar 2020 03:43:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=zvffKctMIj2SFnhEj55/AzFnvDRhG2tE5Rzn8kutAEA=; b=EnkTZlsi0lwTKcBDMpaSzpVcdg
	D1x9vseyJdFIU4gkxuAudMo3x2Njurf2bTdmW7bUD6BzgBAMN+vJ2Dxvt/CgGIA5p8IvOyslGGe5U
	hiVN8pSTETomq3BCfMHBWqqzm6f12LpunxKxaedkCN2UwU3Bj1liYujb4p+Z8sigLNMcYzZq5bwdl
	Q1tABbSWo0Rdtg0AFV7mOWuDx+/vDLGtdRxE4+RI0SDgMQGrZSS22QvwcmZhin3rkOw4eeILMV6DJ
	ejjTxDA47QKBGyJOvciGIXR4SbKRLdNjwUbkKP0OsoA0GUChXF55LJ+WRZBQN5C08+WiXeiSCJuoD
	lp/SHynA==;
Received: from localhost ([::1]:36764 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jHexD-000p6n-4V; Fri, 27 Mar 2020 02:42:39 +0000
Received: from [13.77.154.182] (port=53428 helo=linux.microsoft.com) 
 by hr1.samba.org with esmtp (Exim) id 1jHex6-000p6P-P9
 for samba-technical@lists.samba.org; Fri, 27 Mar 2020 02:42:36 +0000
Received: by linux.microsoft.com (Postfix, from userid 1004)
 id 976F620B4737; Thu, 26 Mar 2020 19:42:26 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 976F620B4737
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxonhyperv.com;
 s=default; t=1585276946;
 bh=zvffKctMIj2SFnhEj55/AzFnvDRhG2tE5Rzn8kutAEA=;
 h=From:To:Cc:Subject:Date:Reply-To:From;
 b=YFR8QAmQvBbsrDSG95KLNjrojPASe8E68C6aEhrFpr5LuqKVUydN5R2l2eOiec2Cj
 Y0DYwIzY/RBeF+ZnB3GcRdJ+LMBZrGnb+du5p2PbI75az+UcDBVBP5EXLQLlmXx/St
 t5YV8EFSnXPjlvLYgH0zYjOtGYpWIc2NEgzgvbIU=
To: Steve French <sfrench@samba.org>, linux-cifs@vger.kernel.org,
 samba-technical@lists.samba.org, linux-kernel@vger.kernel.org
Subject: [Patch v2] cifs: smbd: Calculate the correct maximum packet size for
 segmented SMBDirect send/receive
Date: Thu, 26 Mar 2020 19:42:24 -0700
Message-Id: <1585276944-5332-1-git-send-email-longli@linuxonhyperv.com>
X-Mailer: git-send-email 1.8.3.1
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
From: longli--- via samba-technical <samba-technical@lists.samba.org>
Reply-To: longli@microsoft.com
Cc: longli@linuxonhyperv.com
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

From: Long Li <longli@microsoft.com>

The packet size needs to take account of SMB2 header size and possible
encryption header size. This is only done when signing is used and it is for
RDMA send/receive, not read/write.

Also remove the dead SMBD code in smb2_negotiate_r(w)size.

Signed-off-by: Long Li <longli@microsoft.com>
---

Change since v1: defined SMB2_READWRITE_PDU_HEADER_SIZE for header size and corrected miscalculation

 fs/cifs/smb2ops.c   | 38 ++++++++++++++++----------------------
 fs/cifs/smb2pdu.h   |  3 +++
 fs/cifs/smbdirect.c |  3 +--
 3 files changed, 20 insertions(+), 24 deletions(-)

diff --git a/fs/cifs/smb2ops.c b/fs/cifs/smb2ops.c
index 9c9258fc8756..b36c46f48705 100644
--- a/fs/cifs/smb2ops.c
+++ b/fs/cifs/smb2ops.c
@@ -328,16 +328,6 @@ smb2_negotiate_wsize(struct cifs_tcon *tcon, struct smb_vol *volume_info)
 	/* start with specified wsize, or default */
 	wsize = volume_info->wsize ? volume_info->wsize : CIFS_DEFAULT_IOSIZE;
 	wsize = min_t(unsigned int, wsize, server->max_write);
-#ifdef CONFIG_CIFS_SMB_DIRECT
-	if (server->rdma) {
-		if (server->sign)
-			wsize = min_t(unsigned int,
-				wsize, server->smbd_conn->max_fragmented_send_size);
-		else
-			wsize = min_t(unsigned int,
-				wsize, server->smbd_conn->max_readwrite_size);
-	}
-#endif
 	if (!(server->capabilities & SMB2_GLOBAL_CAP_LARGE_MTU))
 		wsize = min_t(unsigned int, wsize, SMB2_MAX_BUFFER_SIZE);
 
@@ -356,8 +346,15 @@ smb3_negotiate_wsize(struct cifs_tcon *tcon, struct smb_vol *volume_info)
 #ifdef CONFIG_CIFS_SMB_DIRECT
 	if (server->rdma) {
 		if (server->sign)
+			/*
+			 * Account for SMB2 data transfer packet header and
+			 * possible encryption header
+			 */
 			wsize = min_t(unsigned int,
-				wsize, server->smbd_conn->max_fragmented_send_size);
+				wsize,
+				server->smbd_conn->max_fragmented_send_size -
+					SMB2_READWRITE_PDU_HEADER_SIZE -
+					sizeof(struct smb2_transform_hdr));
 		else
 			wsize = min_t(unsigned int,
 				wsize, server->smbd_conn->max_readwrite_size);
@@ -378,16 +375,6 @@ smb2_negotiate_rsize(struct cifs_tcon *tcon, struct smb_vol *volume_info)
 	/* start with specified rsize, or default */
 	rsize = volume_info->rsize ? volume_info->rsize : CIFS_DEFAULT_IOSIZE;
 	rsize = min_t(unsigned int, rsize, server->max_read);
-#ifdef CONFIG_CIFS_SMB_DIRECT
-	if (server->rdma) {
-		if (server->sign)
-			rsize = min_t(unsigned int,
-				rsize, server->smbd_conn->max_fragmented_recv_size);
-		else
-			rsize = min_t(unsigned int,
-				rsize, server->smbd_conn->max_readwrite_size);
-	}
-#endif
 
 	if (!(server->capabilities & SMB2_GLOBAL_CAP_LARGE_MTU))
 		rsize = min_t(unsigned int, rsize, SMB2_MAX_BUFFER_SIZE);
@@ -407,8 +394,15 @@ smb3_negotiate_rsize(struct cifs_tcon *tcon, struct smb_vol *volume_info)
 #ifdef CONFIG_CIFS_SMB_DIRECT
 	if (server->rdma) {
 		if (server->sign)
+			/*
+			 * Account for SMB2 data transfer packet header and
+			 * possible encryption header
+			 */
 			rsize = min_t(unsigned int,
-				rsize, server->smbd_conn->max_fragmented_recv_size);
+				rsize,
+				server->smbd_conn->max_fragmented_recv_size -
+					SMB2_READWRITE_PDU_HEADER_SIZE -
+					sizeof(struct smb2_transform_hdr));
 		else
 			rsize = min_t(unsigned int,
 				rsize, server->smbd_conn->max_readwrite_size);
diff --git a/fs/cifs/smb2pdu.h b/fs/cifs/smb2pdu.h
index dda928d05c13..10acf90f858d 100644
--- a/fs/cifs/smb2pdu.h
+++ b/fs/cifs/smb2pdu.h
@@ -120,6 +120,9 @@ struct smb2_sync_hdr {
 	__u8   Signature[16];
 } __packed;
 
+/* The total header size for SMB2 read and write */
+#define SMB2_READWRITE_PDU_HEADER_SIZE (48 + sizeof(struct smb2_sync_hdr))
+
 struct smb2_sync_pdu {
 	struct smb2_sync_hdr sync_hdr;
 	__le16 StructureSize2; /* size of wct area (varies, request specific) */
diff --git a/fs/cifs/smbdirect.c b/fs/cifs/smbdirect.c
index 5b1b97e9e0c9..a6ae29b3c4e7 100644
--- a/fs/cifs/smbdirect.c
+++ b/fs/cifs/smbdirect.c
@@ -2097,8 +2097,7 @@ int smbd_send(struct TCP_Server_Info *server,
 	for (i = 0; i < num_rqst; i++)
 		remaining_data_length += smb_rqst_len(server, &rqst_array[i]);
 
-	if (remaining_data_length + sizeof(struct smbd_data_transfer) >
-		info->max_fragmented_send_size) {
+	if (remaining_data_length > info->max_fragmented_send_size) {
 		log_write(ERR, "payload size %d > max size %d\n",
 			remaining_data_length, info->max_fragmented_send_size);
 		rc = -EINVAL;
-- 
2.17.1


