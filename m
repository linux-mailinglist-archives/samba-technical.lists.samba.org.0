Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 66CE7C1AD9D
	for <lists+samba-technical@lfdr.de>; Wed, 29 Oct 2025 14:43:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=Lyw+JIk9kUaRQH5MY4lIkRc7yplHwKTmnToOqUwYiCw=; b=WrTSFukBSU04mDfZqoCxTN48Sq
	nLHGEzS0O1ZmaSV6lD9H58Ou9gXF1B9F6wPZ0HxR2pHrIR/ORjn9WyWV9Hd+7mJIC2tD/4VhfXeCZ
	WqBqaMPMjAVDfPumfDHXyMKHTzeT28i6CFH5d7Iw+JXBWWOA4TYr0IQSnsIKS9hqlLAjCy/BuR5L5
	py6wIie22oKxb6H262B4LJJNtT3MToAPz7pVVJrFmSqcECBlrKy61gZktSGLOmOOPLQq67z7cWWmr
	JsYDKyKlbfzpyfDf9FIM01RmMKCQnIEurWiJdMH7KYfJlh6KEiGUSWQD0W3c0OV9bPqjIOSRQDh4u
	GTU6FePg==;
Received: from ip6-localhost ([::1]:18460 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vE6SZ-009C18-3Q; Wed, 29 Oct 2025 13:43:31 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:50046) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vE6Gb-0097or-N8
 for samba-technical@lists.samba.org; Wed, 29 Oct 2025 13:31:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=Lyw+JIk9kUaRQH5MY4lIkRc7yplHwKTmnToOqUwYiCw=; b=iWiEdmOU7vU5T8mV5FfhURLS43
 A9xe/34pPYXQA48uMTQhJQK097qYqRcJbLLbyo7uJU8PNqNwsyCyVsmtkdbTpbQqinic62htItaBr
 pulkLtYl119VsFovciGVGbfB878FhVwRvwc5mvciB+tVELK/tRwdQjGpPvLcijvvJr5sgtwe5qobv
 n58h5u4E2M1nASEAXp55mvsFUDUri8vA4eQ51iSJSb4EPzZw7ADjbUBMcqo8RgeqzSOIt3NbSfpL/
 3H081Xd/NmW4tzr/NCW3cOSuPthkoyY/PdfIGqdDEvUJVLeCjdpuz2QKFJOuyazNW6TEKx4eEzvDQ
 mXS5FKx+GFeUR+vkH+MELXLf9SefWgRE/Gm4rtNoeT1b0SroXLVdnX6BLPd14Sofydc+t5KtO1A1D
 9I1Qnp/oULhnhQJQtjP1SmeJ3xzdd2FPtDuCIjEuX+4U9IPAH4FkmhFFlNaeOKR8s/cFfaBcyyVru
 ZrEcBLK0KarzWd2kPZEreqvT;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vE6GX-00BcUP-0x; Wed, 29 Oct 2025 13:31:06 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v2 086/127] smb: client: introduce and use
 smbd_mr_fill_buffer_descriptor()
Date: Wed, 29 Oct 2025 14:21:04 +0100
Message-ID: <77144f3024ca8209b1165a999e4cde36741ac773.1761742839.git.metze@samba.org>
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

This will allow us to make struct smbdirect_mr_io private in future.

Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: Long Li <longli@microsoft.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
---
 fs/smb/client/smb2pdu.c   | 8 ++------
 fs/smb/client/smbdirect.c | 6 ++++++
 fs/smb/client/smbdirect.h | 2 ++
 3 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/fs/smb/client/smb2pdu.c b/fs/smb/client/smb2pdu.c
index b0739a2661bf..a9a04c4db6dc 100644
--- a/fs/smb/client/smb2pdu.c
+++ b/fs/smb/client/smb2pdu.c
@@ -4480,9 +4480,7 @@ smb2_new_read_req(void **buf, unsigned int *total_len,
 		req->ReadChannelInfoLength =
 			cpu_to_le16(sizeof(struct smbdirect_buffer_descriptor_v1));
 		v1 = (struct smbdirect_buffer_descriptor_v1 *) &req->Buffer[0];
-		v1->offset = cpu_to_le64(rdata->mr->mr->iova);
-		v1->token = cpu_to_le32(rdata->mr->mr->rkey);
-		v1->length = cpu_to_le32(rdata->mr->mr->length);
+		smbd_mr_fill_buffer_descriptor(rdata->mr, v1);
 
 		*total_len += sizeof(*v1) - 1;
 	}
@@ -5030,9 +5028,7 @@ smb2_async_writev(struct cifs_io_subrequest *wdata)
 		req->WriteChannelInfoLength =
 			cpu_to_le16(sizeof(struct smbdirect_buffer_descriptor_v1));
 		v1 = (struct smbdirect_buffer_descriptor_v1 *) &req->Buffer[0];
-		v1->offset = cpu_to_le64(wdata->mr->mr->iova);
-		v1->token = cpu_to_le32(wdata->mr->mr->rkey);
-		v1->length = cpu_to_le32(wdata->mr->mr->length);
+		smbd_mr_fill_buffer_descriptor(wdata->mr, v1);
 
 		rqst.rq_iov[0].iov_len += sizeof(*v1);
 
diff --git a/fs/smb/client/smbdirect.c b/fs/smb/client/smbdirect.c
index 1e17daaac227..d52ded68dee4 100644
--- a/fs/smb/client/smbdirect.c
+++ b/fs/smb/client/smbdirect.c
@@ -1195,6 +1195,12 @@ struct smbdirect_mr_io *smbd_register_mr(struct smbd_connection *info,
 	return smbdirect_connection_register_mr_io(sc, iter, writing, need_invalidate);
 }
 
+void smbd_mr_fill_buffer_descriptor(struct smbdirect_mr_io *mr,
+				    struct smbdirect_buffer_descriptor_v1 *v1)
+{
+	smbdirect_mr_io_fill_buffer_descriptor(mr, v1);
+}
+
 /*
  * Deregister a MR after I/O is done
  * This function may wait if remote invalidation is not used
diff --git a/fs/smb/client/smbdirect.h b/fs/smb/client/smbdirect.h
index 577d37dbeb8a..09f7dd14b2c1 100644
--- a/fs/smb/client/smbdirect.h
+++ b/fs/smb/client/smbdirect.h
@@ -60,6 +60,8 @@ int smbd_send(struct TCP_Server_Info *server,
 struct smbdirect_mr_io *smbd_register_mr(
 	struct smbd_connection *info, struct iov_iter *iter,
 	bool writing, bool need_invalidate);
+void smbd_mr_fill_buffer_descriptor(struct smbdirect_mr_io *mr,
+				    struct smbdirect_buffer_descriptor_v1 *v1);
 void smbd_deregister_mr(struct smbdirect_mr_io *mr);
 
 #else
-- 
2.43.0


