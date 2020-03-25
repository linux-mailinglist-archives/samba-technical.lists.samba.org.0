Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 1455219312D
	for <lists+samba-technical@lfdr.de>; Wed, 25 Mar 2020 20:31:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=JTOKPle64Y3CcsUT3NLGdNuqHsoqlanFLCnXhn2nAO4=; b=GxcM2XIbMrjbOt5sSYZl5BBdaW
	avyJSN4JlWPYNT1Q9eAQKC+mHKvf4fSJI3fYmcVOfIOTwyR0bx5X58t0aNQl7lZ4lDfL1BeJHKXx1
	CG+2GKG5m/6jTld6hUgu0S966tJdE1BX5O139ohpwj5OZxAz59jpajXX+9PZPlaLibfEUQO4L+asH
	MUW21glssU7k1wgeTLvWv9MOIljRDC4Qe8QLbMF1Tq5/LLSLYfPMNTRutO4B7UIeOnPCRSfYPimuI
	qOQFE0/wwusG+BtFQzihKt9P36RKEP9oKjn1oqcNNuf7arNAStSxkMH7U6ETPRhPSscjquo+TtkyB
	ReccHcwQ==;
Received: from localhost ([::1]:51420 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jHBjV-000irR-PD; Wed, 25 Mar 2020 19:30:33 +0000
Received: from [13.77.154.182] (port=37590 helo=linux.microsoft.com) 
 by hr1.samba.org with esmtp (Exim) id 1jHBjR-000irI-Lk
 for samba-technical@lists.samba.org; Wed, 25 Mar 2020 19:30:31 +0000
Received: by linux.microsoft.com (Postfix, from userid 1004)
 id 5956420B4737; Wed, 25 Mar 2020 12:30:24 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 5956420B4737
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxonhyperv.com;
 s=default; t=1585164624;
 bh=JTOKPle64Y3CcsUT3NLGdNuqHsoqlanFLCnXhn2nAO4=;
 h=From:To:Cc:Subject:Date:Reply-To:From;
 b=OwgWT/j+a88JSBxb/rt6FAeu2wCIayAMGUkyBZpi9tL2y59B4zn9Ww3JWvkaXXwlw
 s9qozR0xVpfeefTYvoG9n2GqKFlVRR+RWEScgsSI1DPpx145t6RsVf3u4F98yVGgvl
 n84cMyFzRyiKXNcrAPwAUUdKscIX0FhV5mO1jx2Q=
To: Steve French <sfrench@samba.org>, linux-cifs@vger.kernel.org,
 samba-technical@lists.samba.org, linux-kernel@vger.kernel.org
Subject: [PATCH] cifs: smbd: Calculate the correct maximum packet size for
 segmented SMBDirect send/receive
Date: Wed, 25 Mar 2020 12:30:14 -0700
Message-Id: <1585164614-123696-1-git-send-email-longli@linuxonhyperv.com>
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
 fs/cifs/smb2ops.c   | 38 ++++++++++++++++----------------------
 fs/cifs/smbdirect.c |  3 +--
 2 files changed, 17 insertions(+), 24 deletions(-)

diff --git a/fs/cifs/smb2ops.c b/fs/cifs/smb2ops.c
index 4c0922596467..9043d34eef43 100644
--- a/fs/cifs/smb2ops.c
+++ b/fs/cifs/smb2ops.c
@@ -332,16 +332,6 @@ smb2_negotiate_wsize(struct cifs_tcon *tcon, struct smb_vol *volume_info)
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
 
@@ -360,8 +350,15 @@ smb3_negotiate_wsize(struct cifs_tcon *tcon, struct smb_vol *volume_info)
 #ifdef CONFIG_CIFS_SMB_DIRECT
 	if (server->rdma) {
 		if (server->sign)
+			/*
+			 * Account for SMB2 data transfer packet header
+			 * SMB2_READ/SMB2_WRITE (49) and possible encryption
+			 * headers
+			 */
 			wsize = min_t(unsigned int,
-				wsize, server->smbd_conn->max_fragmented_send_size);
+				wsize,
+				server->smbd_conn->max_fragmented_send_size -
+					49 - sizeof(struct smb2_transform_hdr));
 		else
 			wsize = min_t(unsigned int,
 				wsize, server->smbd_conn->max_readwrite_size);
@@ -382,16 +379,6 @@ smb2_negotiate_rsize(struct cifs_tcon *tcon, struct smb_vol *volume_info)
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
@@ -411,8 +398,15 @@ smb3_negotiate_rsize(struct cifs_tcon *tcon, struct smb_vol *volume_info)
 #ifdef CONFIG_CIFS_SMB_DIRECT
 	if (server->rdma) {
 		if (server->sign)
+			/*
+			 * Account for SMB2 data transfer packet header
+			 * SMB2_READ/SMB2_WRITE (49) and possible encryption
+			 * headers
+			 */
 			rsize = min_t(unsigned int,
-				rsize, server->smbd_conn->max_fragmented_recv_size);
+				rsize,
+				server->smbd_conn->max_fragmented_recv_size -
+					49 - sizeof(struct smb2_transform_hdr));
 		else
 			rsize = min_t(unsigned int,
 				rsize, server->smbd_conn->max_readwrite_size);
diff --git a/fs/cifs/smbdirect.c b/fs/cifs/smbdirect.c
index eb1e40af9f3a..0327b575ab87 100644
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


