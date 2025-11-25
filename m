Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id BB842C86861
	for <lists+samba-technical@lfdr.de>; Tue, 25 Nov 2025 19:15:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=r0KUAx3Qlam8o9Y6BtQRDDN753USx9Jau3sHXoSmAg8=; b=AA7+cttz3VgSc5FG/pEwqVaURK
	zcedF1tunLO3kf8LbUMbjJEovaMG+IecBedRZs+X1AG+Mcb0T3dlxK6QBLC9kvxa1wgxIHd4ub9x3
	/juqWhW6raM0HxE3mPJMIuWXuTCdV5rr6D/BjWex8OC6l9DNeX+Ipcjy/mgMgBITAg5DJ4uM1CPQh
	BaZE3R0NIR+xqNLsXAWF53FVlBKG73KSTukLBNQS+DQ14KbyTjkMtzBjbUgcz5DHreVkzq12Wr2KU
	9p/jp60JgdvtfDpdAA2LaNwuAaqy2zM1Z8uxIa2IOcfi8YnZr05/9J918hQbKFUS569uy4wzJ0UNA
	nWuRCCwQ==;
Received: from ip6-localhost ([::1]:44888 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vNxZK-00DCWN-4j; Tue, 25 Nov 2025 18:15:15 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:54994) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vNxU2-00DAbI-AT
 for samba-technical@lists.samba.org; Tue, 25 Nov 2025 18:10:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=r0KUAx3Qlam8o9Y6BtQRDDN753USx9Jau3sHXoSmAg8=; b=uYH6x9lDAjrvp46NxQv/x0pKd3
 /vKucJzGFCl1jOuHaatiF+p4sWbe3mCEvr55Qh+PY68IbQMwgOCAIvMjrAvGm9ebH5S/HKc0C/qu8
 zOXh2kMZUzxwnNA2DLSkieT7FDoFAqye69DVCXacyos9NdgNUOPq/1O+YPxJy0N8322S2wwUoRCrX
 cS+inuCJ2zJ46lRJT5RyINqmtazCinB8mURIEj1IP7B6O2pR/hZEMGlCtSwGp5mI4+lsdDPnDhswx
 GEkQs6GYOJ1R5GFnLvncKKnrtaDl2iiDacqsVj0PlYc3O6Kfk595jt1wNfEy4MvnLxRKh59pbOsPr
 a65/mHFFqy4Tf15CAK7tCswkHByR51dzL4j5LhVpJ9tn5ghCgmlZWWRlZc/peVefoKQixmXJSZgSa
 nxl4IidCutSDv14MN0jYeEjfA4vkxV/X3l8ImTeYLQEk3K3d5aeTbk0CVvaAtmdDwZ/aMvSk9+xI8
 Ks7IY8MCZ8HQF35fCBC2Rqk2;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vNxTS-00Fe6g-0T; Tue, 25 Nov 2025 18:09:11 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v4 091/145] smb: client: introduce and use
 smbd_mr_fill_buffer_descriptor()
Date: Tue, 25 Nov 2025 18:55:37 +0100
Message-ID: <ef4709dd8b44f416f8dbc8022ad34d8514f9abde.1764091285.git.metze@samba.org>
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

This will allow us to make struct smbdirect_mr_io private in future.

Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: Long Li <longli@microsoft.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
Signed-off-by: Steve French <stfrench@microsoft.com>
---
 fs/smb/client/smb2pdu.c   | 8 ++------
 fs/smb/client/smbdirect.c | 6 ++++++
 fs/smb/client/smbdirect.h | 2 ++
 3 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/fs/smb/client/smb2pdu.c b/fs/smb/client/smb2pdu.c
index ce56237928a0..72062bafbbaa 100644
--- a/fs/smb/client/smb2pdu.c
+++ b/fs/smb/client/smb2pdu.c
@@ -4518,9 +4518,7 @@ smb2_new_read_req(void **buf, unsigned int *total_len,
 		req->ReadChannelInfoLength =
 			cpu_to_le16(sizeof(struct smbdirect_buffer_descriptor_v1));
 		v1 = (struct smbdirect_buffer_descriptor_v1 *) &req->Buffer[0];
-		v1->offset = cpu_to_le64(rdata->mr->mr->iova);
-		v1->token = cpu_to_le32(rdata->mr->mr->rkey);
-		v1->length = cpu_to_le32(rdata->mr->mr->length);
+		smbd_mr_fill_buffer_descriptor(rdata->mr, v1);
 
 		*total_len += sizeof(*v1) - 1;
 	}
@@ -5068,9 +5066,7 @@ smb2_async_writev(struct cifs_io_subrequest *wdata)
 		req->WriteChannelInfoLength =
 			cpu_to_le16(sizeof(struct smbdirect_buffer_descriptor_v1));
 		v1 = (struct smbdirect_buffer_descriptor_v1 *) &req->Buffer[0];
-		v1->offset = cpu_to_le64(wdata->mr->mr->iova);
-		v1->token = cpu_to_le32(wdata->mr->mr->rkey);
-		v1->length = cpu_to_le32(wdata->mr->mr->length);
+		smbd_mr_fill_buffer_descriptor(wdata->mr, v1);
 
 		rqst.rq_iov[0].iov_len += sizeof(*v1);
 
diff --git a/fs/smb/client/smbdirect.c b/fs/smb/client/smbdirect.c
index 18b71f58e387..4ad1d13de812 100644
--- a/fs/smb/client/smbdirect.c
+++ b/fs/smb/client/smbdirect.c
@@ -1196,6 +1196,12 @@ struct smbdirect_mr_io *smbd_register_mr(struct smbd_connection *info,
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
index f600dc4a8eba..9f14f5cb4a38 100644
--- a/fs/smb/client/smbdirect.h
+++ b/fs/smb/client/smbdirect.h
@@ -60,6 +60,8 @@ int smbd_send(struct TCP_Server_Info *server,
 struct smbdirect_mr_io *smbd_register_mr(
 	struct smbd_connection *info, struct iov_iter *iter,
 	bool writing, bool need_invalidate);
+void smbd_mr_fill_buffer_descriptor(struct smbdirect_mr_io *mr,
+				    struct smbdirect_buffer_descriptor_v1 *v1);
 void smbd_deregister_mr(struct smbdirect_mr_io *mr);
 
 
-- 
2.43.0


