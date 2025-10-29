Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id CB0CEC1AE2A
	for <lists+samba-technical@lfdr.de>; Wed, 29 Oct 2025 14:46:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=E7ggdYeEdFHJlGINPQsrPGnqd/pfHpF/99bFkD2GYUo=; b=Lu+awPsnMWEvp0KYGZIG0Yzlfl
	1I9fJPq4jXyQNHu+LVsg3KBQpnVpxUFwF7Lwast6M/vdC4cNMQ2J/792qh4VQqSEtL438ldo0VGOb
	cgMdhOGRNCtQj5Ejif6+enI4hZzlB71JovLvYE0cEWTTqdI8/ENOeEu251DsHYE5K0jy/dGMEnuuO
	EcKJGjBbgw/e1lTR/9u+FBkeVZ0Apq65p8W8s3hqGVRQZdpxvmxTQoOXZFDEqUnp8pUcwBweaV6Ia
	GKudYaXoAL3T0pP2jcsHMS6OWcXwnLgRxQ2OLoRbL88+wwKdYCo5Z0QfXjnFC7Xu/W2Humfrtc8Fu
	aWAzokcA==;
Received: from ip6-localhost ([::1]:53454 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vE6Vn-009DDb-BD; Wed, 29 Oct 2025 13:46:51 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:61732) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vE6I3-0098Ja-Oj
 for samba-technical@lists.samba.org; Wed, 29 Oct 2025 13:32:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=E7ggdYeEdFHJlGINPQsrPGnqd/pfHpF/99bFkD2GYUo=; b=fVzxHvEI579+fe0yCzO0FCSnrW
 LPw8Ut0zAI7thzPZ+EQYDsA0xzCbSj/ZBjtTN+p6jwpqhJKAoGosRq1ow+CNAv46bOPT5arRLlmdD
 36Rnrrp6wtPEcnN3LpRjuEFz7KBy+Mp0UyZqsOuNZL/91bQl4cVHl1RPU1zh6f0W+hOOTV3YZbTBb
 yk4U6OgMr1eu4NHymNoPGNgISPzoHPfwplOoCyWkSXgQle9l1lHFLZrj3zcDpdVXzvPSDcGQB8xk6
 FVfsGnuaylgpnkZQTANQB9p0TXC++Y797KgoWU++dBYmElayyTKjrmnMqNOVWJHi0N/1nzGlXCqFv
 7c3MkfLd6HfEGVR7OKSlJqbiePsUsGrR4MQIpwKQWRWXxyRjBoGcohebNJyCt+7ik3OeLmYueGv5u
 DSfVuR42xck6kDjiDeAdze+zGP4f/sGGTFIBVnizEb0963ARkZt/cqt3BBniIGOW0ucxLv16gEw+o
 reXcZuKtIinaw6B73w1LkWgI;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vE6Hz-00BclQ-1a; Wed, 29 Oct 2025 13:32:36 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v2 100/127] smb: server: make use of
 smbdirect_frwr_is_supported()
Date: Wed, 29 Oct 2025 14:21:18 +0100
Message-ID: <d191362c9e5b2002cf665c3d2eab88d057c2cb3f.1761742839.git.metze@samba.org>
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
 Tom Talpey <tom@talpey.com>, Namjae Jeon <linkinjeon@kernel.org>,
 Steve French <stfrench@microsoft.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is an exact copy of rdma_frwr_is_supported().

Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
Signed-off-by: Steve French <stfrench@microsoft.com>
---
 fs/smb/server/transport_rdma.c | 15 +++------------
 1 file changed, 3 insertions(+), 12 deletions(-)

diff --git a/fs/smb/server/transport_rdma.c b/fs/smb/server/transport_rdma.c
index 886a350819bf..7181d9f62b09 100644
--- a/fs/smb/server/transport_rdma.c
+++ b/fs/smb/server/transport_rdma.c
@@ -2179,15 +2179,6 @@ static int smb_direct_connect(struct smbdirect_socket *sc)
 	return 0;
 }
 
-static bool rdma_frwr_is_supported(struct ib_device_attr *attrs)
-{
-	if (!(attrs->device_cap_flags & IB_DEVICE_MEM_MGT_EXTENSIONS))
-		return false;
-	if (attrs->max_fast_reg_page_list_len == 0)
-		return false;
-	return true;
-}
-
 static int smb_direct_handle_connect_request(struct rdma_cm_id *new_cm_id,
 					     struct rdma_cm_event *event)
 {
@@ -2199,7 +2190,7 @@ static int smb_direct_handle_connect_request(struct rdma_cm_id *new_cm_id,
 	u8 peer_responder_resources;
 	int ret;
 
-	if (!rdma_frwr_is_supported(&new_cm_id->device->attrs)) {
+	if (!smbdirect_frwr_is_supported(&new_cm_id->device->attrs)) {
 		ksmbd_debug(RDMA,
 			    "Fast Registration Work Requests is not supported. device capabilities=%llx\n",
 			    new_cm_id->device->attrs.device_cap_flags);
@@ -2361,7 +2352,7 @@ static int smb_direct_ib_client_add(struct ib_device *ib_dev)
 	if (ib_dev->node_type != RDMA_NODE_IB_CA)
 		smb_direct_port = SMB_DIRECT_PORT_IWARP;
 
-	if (!rdma_frwr_is_supported(&ib_dev->attrs))
+	if (!smbdirect_frwr_is_supported(&ib_dev->attrs))
 		return 0;
 
 	smb_dev = kzalloc(sizeof(*smb_dev), KSMBD_DEFAULT_GFP);
@@ -2485,7 +2476,7 @@ static bool ksmbd_find_rdma_capable_netdev(struct net_device *netdev)
 
 		ibdev = ib_device_get_by_netdev(netdev, RDMA_DRIVER_UNKNOWN);
 		if (ibdev) {
-			rdma_capable = rdma_frwr_is_supported(&ibdev->attrs);
+			rdma_capable = smbdirect_frwr_is_supported(&ibdev->attrs);
 			ib_device_put(ibdev);
 		}
 	}
-- 
2.43.0


