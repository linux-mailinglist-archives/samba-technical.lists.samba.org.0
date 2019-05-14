Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::443:1])
	by mail.lfdr.de (Postfix) with ESMTPS id BBC551CB8D
	for <lists+samba-technical@lfdr.de>; Tue, 14 May 2019 17:15:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=mDXd47dUbdIME2MwL+W1O1V5hG3NgLgMd8O7SLemdQU=; b=X0f0sW6h7fTIZ7hIVYTDo7lt0P
	+KHNNpBkd6mi1blFH0Xj9eRHjiauI+SDdPBEoE7fVVEcrxRoPKnL0XcuuhpQS5XnpgwJWU1T4Zu2R
	rbuJ7nK52ChQQWfK+1ox7cJTqo1FUxT5gOOV2/DBxLUdv3kL3KUTo8XKp8lgQvNMwQo9VClQekSe5
	s3Q6kjVlRyM62IsQAelzqb6PD6KlXZChJ+YdNeBSmZ6oyziTpNKG2vPVMkgEQ712pCJnK69r1Hvap
	oGcg0URIS6nMGUbe2trOfDqSnZ9gZzXlfqZWrJMw0OYw5cj+X5dJ9dZoJ5VG6BL6WFAwO7gmRBfRq
	C0sezo5g==;
Received: from localhost ([::1]:33992 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hQZ8d-003boC-2j; Tue, 14 May 2019 15:14:43 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::147:1]:59544) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hQZ8Y-003bli-6v
 for samba-technical@lists.samba.org; Tue, 14 May 2019 15:14:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Message-ID:Date:To:From:CC;
 bh=mDXd47dUbdIME2MwL+W1O1V5hG3NgLgMd8O7SLemdQU=; b=tvve1L7hIP27R2NCRvU9+bDnij
 H40NKfEVQaIHgGR8DcTBwA/gzor7Zb4A7s7Tz5CdvAHqnXoOzP5dE4tiIykWCygSyFu/d9eA6Nwlr
 ws7cmmWuBqb1H//9e+dQDgysqWPXYaxnWahJxqShX88KhTRKLPs8xI3/nKCeNuZl4PEo=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1hQZ8X-0000EK-RB
 for samba-technical@lists.samba.org; Tue, 14 May 2019 15:14:38 +0000
To: samba-technical@lists.samba.org
Subject: [PATCH] Add missing OOM check to quota code
Date: Tue, 14 May 2019 17:14:36 +0200
Message-ID: <2147255.6v8QEAuP3E@magrathea.fritz.box>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="nextPart3921544.3RV2KlcPCx"
Content-Transfer-Encoding: 7Bit
X-BeenThere: samba-technical@lists.samba.org
X-Mailman-Version: 2.1.23
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
From: Andreas Schneider via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andreas Schneider <asn@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is a multi-part message in MIME format.

--nextPart3921544.3RV2KlcPCx
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi,

just a small cleanup patch.


Review much appreciated.


Thanks,


	Andreas

-- 
Andreas Schneider                      asn@samba.org
Samba Team                             www.samba.org
GPG-ID:     8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D
--nextPart3921544.3RV2KlcPCx
Content-Disposition: attachment; filename="s3-libsmb-Add-missing-OOM-check-in-fill_quota_buffer.patch01.txt"
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="UTF-8"; name="s3-libsmb-Add-missing-OOM-check-in-fill_quota_buffer.patch01.txt"

From 3d1b230e84f53e1a60be6ef48d5921f75b440a01 Mon Sep 17 00:00:00 2001
From: Andreas Schneider <asn@samba.org>
Date: Tue, 14 May 2019 12:48:14 +0200
Subject: [PATCH] s3:libsmb: Add missing OOM check in fill_quota_buffer()

Found by covscan (csbuild).

Signed-off-by: Andreas Schneider <asn@samba.org>
---
 source3/libsmb/cliquota.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/source3/libsmb/cliquota.c b/source3/libsmb/cliquota.c
index 52f98eb9e8f..17655e095f3 100644
--- a/source3/libsmb/cliquota.c
+++ b/source3/libsmb/cliquota.c
@@ -587,13 +587,19 @@ NTSTATUS fill_quota_buffer(TALLOC_CTX *mem_ctx,
 			      SMB_NTQUOTA_LIST **end_ptr)
 {
 	int ndr_flags = NDR_SCALARS | NDR_BUFFERS;
-	struct ndr_push *qndr = ndr_push_init_ctx(mem_ctx);
+	struct ndr_push *qndr = NULL;
 	uint32_t start_offset = 0;
 	uint32_t padding = 0;
 	if (qlist == NULL) {
 		/* We must push at least one. */
 		return NT_STATUS_NO_MORE_ENTRIES;
 	}
+
+	qndr = ndr_push_init_ctx(mem_ctx);
+	if (qndr == NULL) {
+		return NT_STATUS_NO_MEMORY;
+	}
+
 	for (;qlist != NULL; qlist = qlist->next) {
 		struct file_quota_information info = {0};
 		enum ndr_err_code err;
-- 
2.21.0


--nextPart3921544.3RV2KlcPCx--




