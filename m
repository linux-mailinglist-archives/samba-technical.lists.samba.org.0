Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B9509C1AC89
	for <lists+samba-technical@lfdr.de>; Wed, 29 Oct 2025 14:39:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=n/KAblsQXDaf4rGjCuOL+re5yQhMQXgXAj4jCSyK7Dw=; b=f+v88Ut/mgDZZh7wlrh9uh549c
	O+04xF7FJh7KG66SaD6BM/nHgQRtFC+t+lT3gIdWuCnb/GgKPs61PydCWuiQYrh0zwOKsaZND/tkt
	wCZNc4A5w2w/9Yq6KfB4pSDOSiA2zA5DKY0ajS4o4cfR/+6jVGGCuqMFywrhjdUkkX/nl9AaUhrAp
	9ERzWXd9WB+W2Ala/WKKFk9EF7Jq2FibwXIaTWHfMnWscE+gdzRBYsbxzy9mxPIi7nGoYbRLtK6NJ
	xauNHm6EvVOy2Z08XGSZFHb9r35pBe7i84/v78V4E3F6c2hEKPXuPCWFCxZXeecWkikZWEcMSPHr1
	aAuajv7A==;
Received: from ip6-localhost ([::1]:65530 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vE6O7-009AOT-0A; Wed, 29 Oct 2025 13:38:55 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:58748) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vE6ES-00978E-6k
 for samba-technical@lists.samba.org; Wed, 29 Oct 2025 13:29:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=n/KAblsQXDaf4rGjCuOL+re5yQhMQXgXAj4jCSyK7Dw=; b=C3OBaRGbKEZ38hsaVieALNuZc4
 J5c+21q5RmgA2GjQ9woK2RoYPdCJKKSbbVoR2T1N8Im0WVMyR7ThOcwDLuOf+sflbU/o2F0DZXJRK
 HZ787GEhcwPvHPwzNOI8TpXFZzmrV+XB7AFjJDwR9AtwV85NLJThIMNKpsykfXBJoInjCj0ITHut6
 qt7nfdpPqOy/A0+9DnsUlfYdclR6FSyy0uKAilRzyC+HTp/o5q1KMeqdMcD1GbTSFAYCwg5Vqe9LC
 f1VLF13JYmK/GmJRFfG/RY643UwBtLSw/+lxDkXPQ4jqgEN1XEvZXHjiPuhezxi/5hpXQzv2QxYpO
 Micye5+ooP+xs9ljkSiNYxaTPuq6Ui+t/NOSWwEY0eaLPfNAIgPVvxhWGdGnAmmjGvumQVd/9mznU
 1q5Y5hrPcjMyXtMZ/CVzBGKJN1bLsqSorPvQcK/fpsPau51Tq8Sw5Bnx4yqXkljlK7PvupK7C2TDZ
 JcTr5dRzmHrvfNqh/Ar0Dx+v;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vE6EO-00BcAS-1G; Wed, 29 Oct 2025 13:28:52 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v2 065/127] smb: client: make use of
 smbdirect_frwr_is_supported()
Date: Wed, 29 Oct 2025 14:20:43 +0100
Message-ID: <74930afdb9ca1f722e7c92273af8aaabb2bcdf53.1761742839.git.metze@samba.org>
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
index e61f41fd020b..ab8ce4c46bd6 100644
--- a/fs/smb/client/smbdirect.c
+++ b/fs/smb/client/smbdirect.c
@@ -783,20 +783,6 @@ static struct rdma_cm_id *smbd_create_id(
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
@@ -814,7 +800,7 @@ static int smbd_ia_open(
 	}
 	sc->ib.dev = sc->rdma.cm_id->device;
 
-	if (!frwr_is_supported(&sc->ib.dev->attrs)) {
+	if (!smbdirect_frwr_is_supported(&sc->ib.dev->attrs)) {
 		log_rdma_event(ERR, "Fast Registration Work Requests (FRWR) is not supported\n");
 		log_rdma_event(ERR, "Device capability flags = %llx max_fast_reg_page_list_len = %u\n",
 			       sc->ib.dev->attrs.device_cap_flags,
-- 
2.43.0


