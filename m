Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 81F17C86949
	for <lists+samba-technical@lfdr.de>; Tue, 25 Nov 2025 19:23:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=sT31C4tAeKhL06V6v2TfzRVrbNatNC0ToY8SoAngLck=; b=ZAVJuhR9KpTiF32gY87e399jvK
	dvNcJdfjMh7vxN2C77YnoIBbSpLaRdvWvP1C5tKmUuLVFUOpBZ9rVvcoPQaK6iBcQpjVp88UkkBtc
	8To46ANnfgvtbGsm5AJ4EhKThGbmmZjO6XImmCz48fvt8bHtPjXq6WCZkBB6DBP/9peKUD3hex0Rb
	XgvfR6KSxr0R7vOrKuPJF9bEAGmckUjrqSmdvre+1DovgNienIBiQWEebyB7k2gJmcrbawqJ5yP5N
	YNfaYqmeZQBN2avCDF6XmI7+dZdEdGZMLbiAFv6csb9giXwcQJxxs6Yd6C2h86JF/6lwPkfg7U6ku
	+AVccrLA==;
Received: from ip6-localhost ([::1]:63238 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vNxgh-00DEhN-QW; Tue, 25 Nov 2025 18:22:53 +0000
Received: from hr2.samba.org ([144.76.82.148]:40694) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vNxcj-00DDgR-AJ
 for samba-technical@lists.samba.org; Tue, 25 Nov 2025 18:20:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=sT31C4tAeKhL06V6v2TfzRVrbNatNC0ToY8SoAngLck=; b=ibEVN0szryxig3nrrKmUHZyXwh
 ygIbaTjXcyfnkqdKIDDom1c9PKjT2E/F0u1eXOt36inYbEDbC/8Aj/Gyrb0uELC5KJP6mJ3QYbYVC
 NC7zsBW7UiwEV5nHBMRbIrXoTo4ERbKAGa2MEahsVs6NmBzPuPDyRwPnyhXjk9tnsEDQ9KauXY7vo
 bsJW7Li3Emybxy7E5FFiVP/1hxgi44uJ3iidV/d7J1aeklmsQWY8mXJy9gk7rAYxnPb5lED/QqjF0
 gvy/H44jps3QtUxWYvS1lXAMB9e/OOSmnnMLR7mSBo3lfSknIOxo1uxuJ0cW8mpTs4oUQWIJTD0Nc
 EzNXc6xt135y0PE8BeHw893e9ufhOVWWuiGFcH6tDI2Jw+hRdhWOGKwJbjU/XUGZgRLjb8/37eu6G
 4fEV9RKK9UjtO+Ou1wGqdp+aH/a3WYQgn7g3ImMg3FoWK9ifrDCaa7xTg4zp1fqdHNGyPOM8bTtvB
 upzd2KmcT/YkzM65rPo8GX6q;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vNxVg-00FeOE-0W; Tue, 25 Nov 2025 18:11:29 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v4 106/145] smb: server: make use of
 smbdirect_frwr_is_supported()
Date: Tue, 25 Nov 2025 18:55:52 +0100
Message-ID: <231e4c2aa79d4ccff6661c14ffe21c6ae768c347.1764091285.git.metze@samba.org>
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
index 9ebf19c5fa80..37c7f9524c6c 100644
--- a/fs/smb/server/transport_rdma.c
+++ b/fs/smb/server/transport_rdma.c
@@ -2212,15 +2212,6 @@ static int smb_direct_connect(struct smbdirect_socket *sc)
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
@@ -2232,7 +2223,7 @@ static int smb_direct_handle_connect_request(struct rdma_cm_id *new_cm_id,
 	u8 peer_responder_resources;
 	int ret;
 
-	if (!rdma_frwr_is_supported(&new_cm_id->device->attrs)) {
+	if (!smbdirect_frwr_is_supported(&new_cm_id->device->attrs)) {
 		ksmbd_debug(RDMA,
 			    "Fast Registration Work Requests is not supported. device capabilities=%llx\n",
 			    new_cm_id->device->attrs.device_cap_flags);
@@ -2394,7 +2385,7 @@ static int smb_direct_ib_client_add(struct ib_device *ib_dev)
 	if (ib_dev->node_type != RDMA_NODE_IB_CA)
 		smb_direct_port = SMB_DIRECT_PORT_IWARP;
 
-	if (!rdma_frwr_is_supported(&ib_dev->attrs))
+	if (!smbdirect_frwr_is_supported(&ib_dev->attrs))
 		return 0;
 
 	smb_dev = kzalloc(sizeof(*smb_dev), KSMBD_DEFAULT_GFP);
@@ -2518,7 +2509,7 @@ static bool ksmbd_find_rdma_capable_netdev(struct net_device *netdev)
 
 		ibdev = ib_device_get_by_netdev(netdev, RDMA_DRIVER_UNKNOWN);
 		if (ibdev) {
-			rdma_capable = rdma_frwr_is_supported(&ibdev->attrs);
+			rdma_capable = smbdirect_frwr_is_supported(&ibdev->attrs);
 			ib_device_put(ibdev);
 		}
 	}
-- 
2.43.0


