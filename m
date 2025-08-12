Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B7DACB22E07
	for <lists+samba-technical@lfdr.de>; Tue, 12 Aug 2025 18:46:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=ERVUo3T0K1V1ICM1xbcGMqpxXJvvpB6g8yY0M1SC97I=; b=k+tMPWo5Geg09DP205f/wZivJY
	53LAI+ccazbRlxlB7zpBO2TSlQC3Zs6hujijdkcq51ql8SCoXdn73YHQAHqIWPu7geotPXStEcdsR
	eWKd28lTxT2yGFSBc9mifCmFdSHjYIv1Cw1GgJ80b61UcUwKb00BlscdzsRF87wxPGXlyYkcHbnME
	1wtxUBTC2sodzXQ6KpEFb/CMj0pKEh/Z/7pwreDjP5Jyhx5C50cz5JbWtNxkgDAytHv3Vxf22fWCe
	uA7SHeXdsqreZJytOAGFBf2exgZdUDVF7ZzWIde+YOuaqGDV2+JfNUe1agOJu8f/0sb9kdL7b2hkY
	mF1VN5Bw==;
Received: from ip6-localhost ([::1]:48048 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uls8L-00Ev4G-DL; Tue, 12 Aug 2025 16:45:57 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:27310) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uls8G-00Ev3H-7f
 for samba-technical@lists.samba.org; Tue, 12 Aug 2025 16:45:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=ERVUo3T0K1V1ICM1xbcGMqpxXJvvpB6g8yY0M1SC97I=; b=KvsLd1ZyDGzhzAMu2fBrvUFrUX
 ZeMlVBiMYeCal40kLbmjdLITf45QvAMyPcmapL3iYXlUJhtjucxo0FYWTrXnrVCVmRktoSNzvN+NG
 zUTYQRZsTQyzy5MXkTGYJabXlG0AwcuE2kB6I/C9ZkpeMKQ5z4oYW9zOqE1sZXUL2EJ6q0gUV5xN/
 g5N+Rwmlv0V8sRGgQWnC4Ahhbvbi8ZRobCIdcJhxAsp9BP1aFXYJ1iuViv3zAPeqiGufby0fgbaIP
 avJTwayr7ywrF1BNUCaV9TNfPxno0Jixl6coth3A38AWOPP8ef2Yu57VGhAQxxPwClVm5nIWJFzrU
 93KvOIhCsrnuZd2V3yapF85X0NN3BwtVpemlomkOD+tXSXgt93nXN968gTeHLr4UYHGe7Er/IhIfs
 XqRNzTykW+YNoVxTmuWPIlBo5w10I2arYM9TpI3+DGTbMq3BPBx8r6QDPQi4QVQA7CrjkzocZkZKY
 3hZp+sfHkJk3gfvwQSdblhGA;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uls8F-002SgS-0o; Tue, 12 Aug 2025 16:45:51 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH] smb: server: split ksmbd_rdma_stop_listening() out of
 ksmbd_rdma_destroy()
Date: Tue, 12 Aug 2025 18:45:46 +0200
Message-ID: <20250812164546.29238-1-metze@samba.org>
X-Mailer: git-send-email 2.43.0
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

We can't call destroy_workqueue(smb_direct_wq); before stop_sessions()!

Otherwise already existing connections try to use smb_direct_wq as
a NULL pointer.

Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Fixes: 0626e6641f6b ("cifsd: add server handler for central processing and tranport layers")
Signed-off-by: Stefan Metzmacher <metze@samba.org>
---
 fs/smb/server/connection.c     | 3 ++-
 fs/smb/server/transport_rdma.c | 5 ++++-
 fs/smb/server/transport_rdma.h | 4 +++-
 3 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/fs/smb/server/connection.c b/fs/smb/server/connection.c
index d1f36f899699..525409706805 100644
--- a/fs/smb/server/connection.c
+++ b/fs/smb/server/connection.c
@@ -517,7 +517,8 @@ void ksmbd_conn_transport_destroy(void)
 {
 	mutex_lock(&init_lock);
 	ksmbd_tcp_destroy();
-	ksmbd_rdma_destroy();
+	ksmbd_rdma_stop_listening();
 	stop_sessions();
+	ksmbd_rdma_destroy();
 	mutex_unlock(&init_lock);
 }
diff --git a/fs/smb/server/transport_rdma.c b/fs/smb/server/transport_rdma.c
index 99964a75d13e..16bf68dbf4ae 100644
--- a/fs/smb/server/transport_rdma.c
+++ b/fs/smb/server/transport_rdma.c
@@ -2200,7 +2200,7 @@ int ksmbd_rdma_init(void)
 	return 0;
 }
 
-void ksmbd_rdma_destroy(void)
+void ksmbd_rdma_stop_listening(void)
 {
 	if (!smb_direct_listener.cm_id)
 		return;
@@ -2209,7 +2209,10 @@ void ksmbd_rdma_destroy(void)
 	rdma_destroy_id(smb_direct_listener.cm_id);
 
 	smb_direct_listener.cm_id = NULL;
+}
 
+void ksmbd_rdma_destroy(void)
+{
 	if (smb_direct_wq) {
 		destroy_workqueue(smb_direct_wq);
 		smb_direct_wq = NULL;
diff --git a/fs/smb/server/transport_rdma.h b/fs/smb/server/transport_rdma.h
index 0fb692c40e21..659ed668de2d 100644
--- a/fs/smb/server/transport_rdma.h
+++ b/fs/smb/server/transport_rdma.h
@@ -13,13 +13,15 @@
 
 #ifdef CONFIG_SMB_SERVER_SMBDIRECT
 int ksmbd_rdma_init(void);
+void ksmbd_rdma_stop_listening(void);
 void ksmbd_rdma_destroy(void);
 bool ksmbd_rdma_capable_netdev(struct net_device *netdev);
 void init_smbd_max_io_size(unsigned int sz);
 unsigned int get_smbd_max_read_write_size(void);
 #else
 static inline int ksmbd_rdma_init(void) { return 0; }
-static inline int ksmbd_rdma_destroy(void) { return 0; }
+static inline void ksmbd_rdma_stop_listening(void) { return };
+static inline void ksmbd_rdma_destroy(void) { return; }
 static inline bool ksmbd_rdma_capable_netdev(struct net_device *netdev) { return false; }
 static inline void init_smbd_max_io_size(unsigned int sz) { }
 static inline unsigned int get_smbd_max_read_write_size(void) { return 0; }
-- 
2.43.0


