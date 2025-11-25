Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B950C86846
	for <lists+samba-technical@lfdr.de>; Tue, 25 Nov 2025 19:14:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=wOnXOIAXm1j8QawORK0SKlEutsnHaqh1y2eOYjmixi4=; b=yS4tSMUj/evEHV8BTWOmY5j+Te
	2Pb1eSNsvWMe2QeVXGaZOue7q/MgDF1J+rQ8pZYyWv4d9R268o4G9kt71QAR9X2hGF70e8ikEHfJB
	RZ3qiy6cOG1vFLVl3jobkJb8Q26+IdoFEi4SKZrRyJsCeBv514jOUNdX9l2Mc5KGxIlu8u1LXHkfX
	lCBFvG5h206OiiND70stMO5VppkYiMFTAVKWtRsEemPp+Tj8MCfQvVjqjx8+OJTi7einBJBwRdlLl
	1d2pHJW53eX/OdppwAM5lTJA1W/uVTWjNY08Zdn6ho+GpTKgccFs2AaARcDkXAtt1ToWiqzyhlbzK
	i785Qd0A==;
Received: from ip6-localhost ([::1]:51476 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vNxYE-00DC31-UH; Tue, 25 Nov 2025 18:14:07 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:12824) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vNxTN-00DAOZ-Md
 for samba-technical@lists.samba.org; Tue, 25 Nov 2025 18:09:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=wOnXOIAXm1j8QawORK0SKlEutsnHaqh1y2eOYjmixi4=; b=pRfAjVAtnbxu4budRCylsuv7+C
 2t0YMdV1PVqzv2C3JSGFDKxkrz1HRD+99QbFaEV1b9BI9IGDdKfoAK9YXk7asIu1dqPq9tKnE0cms
 ZTTN8Z+ZSrmxa4FaeWEmy9b7RCDnAKImclqLDFeQ7TYcX0rKT4y4+O7FP7ZQvDY4+MDbBMMrxn3pz
 Iz5q8/+ZOT2/xRszbqWfe4tYuYdGRiPaPpFNiXAi1lsSK3w7vpKDWtDNimnF1FaVQ3PP9BVnzTlqg
 KYpn1NVAIYkhyk/oefXEXdXoye1dlDZtvtVEpfkxns0DM9bW/HBDv97s3hUjCDoEG5oZBW5iYFf5z
 mOlmnPJ8Cbn3ECcL2GzVJIc2WBm2bHGkgfaXzcJ2pc8W4QjGOfSNRFLDUCnFqweMMZT50UHoVC7Bc
 sUsU9GMHJwqOlXyATyvmgz7wJ/aA6HHeBSTiJfYsXU788qMEbPyPd7bVieg7UVCII3VDSkS/dau7V
 vi0P4r/LmuTHIRfhCjwcDoC7;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vNxOo-00Fdg2-3C; Tue, 25 Nov 2025 18:04:31 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v4 070/145] smb: client: make use of
 smbdirect_frwr_is_supported()
Date: Tue, 25 Nov 2025 18:55:16 +0100
Message-ID: <10a7ab588dbc3e3a63aabd4dbbd094ecd726caff.1764091285.git.metze@samba.org>
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

This an exact copy of frwr_is_supported().

Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: Long Li <longli@microsoft.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
Signed-off-by: Steve French <stfrench@microsoft.com>
---
 fs/smb/client/smbdirect.c | 16 +---------------
 1 file changed, 1 insertion(+), 15 deletions(-)

diff --git a/fs/smb/client/smbdirect.c b/fs/smb/client/smbdirect.c
index d2359d6b18ba..11c72871981d 100644
--- a/fs/smb/client/smbdirect.c
+++ b/fs/smb/client/smbdirect.c
@@ -784,20 +784,6 @@ static struct rdma_cm_id *smbd_create_id(
 	return ERR_PTR(rc);
 }
 
-/*
- * Test if FRWR (Fast Registration Work Requests) is supported on the device
- * This implementation requires FRWR on RDMA read/write
- * return value: true if it is supported
- */
-static bool frwr_is_supported(struct ib_device_attr *attrs)
-{
-	if (!(attrs->device_cap_flags & IB_DEVICE_MEM_MGT_EXTENSIONS))
-		return false;
-	if (attrs->max_fast_reg_page_list_len == 0)
-		return false;
-	return true;
-}
-
 static int smbd_ia_open(
 		struct smbdirect_socket *sc,
 		struct sockaddr *dstaddr, int port)
@@ -815,7 +801,7 @@ static int smbd_ia_open(
 	}
 	sc->ib.dev = sc->rdma.cm_id->device;
 
-	if (!frwr_is_supported(&sc->ib.dev->attrs)) {
+	if (!smbdirect_frwr_is_supported(&sc->ib.dev->attrs)) {
 		log_rdma_event(ERR, "Fast Registration Work Requests (FRWR) is not supported\n");
 		log_rdma_event(ERR, "Device capability flags = %llx max_fast_reg_page_list_len = %u\n",
 			       sc->ib.dev->attrs.device_cap_flags,
-- 
2.43.0


