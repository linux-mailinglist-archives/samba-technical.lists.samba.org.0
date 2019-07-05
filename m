Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CA205FFF5
	for <lists+samba-technical@lfdr.de>; Fri,  5 Jul 2019 06:14:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=uehuQswZvEjjf490XWtExu0fOjx/MvxewcqOQlq902o=; b=D9vow727/cxWqhuXKKPw8ULQ7q
	RPy+0uRIe/75470m7MdQkd8LgU8/wDgxePMdfz+SYmJIaIqX0jbJcj6WLDUnygGtxILl72q9OW5Zy
	GpUCz3fddCEcZHlkvgb0XJqEfVISDu8pEVM254MFlh57soTP23xbvzDKx5f0nBzHogPHt1Xrx6wwJ
	l606BlTZIgzePl6AroRx9PWBoXVyzhELBHBgDTFdZYiFLj92qXDDDp/36sbH4L3qEgqOdJt6kpZdP
	NXehXs6SyDsGmEgUj7PJRN8s4wkrKwgqWf7TUtoeHqu8/NmptoEwIZOcCe1kY6dxE/xqSLgOY2UtI
	xdv/pLjA==;
Received: from localhost ([::1]:21418 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hjFbn-005HCo-AV; Fri, 05 Jul 2019 04:14:03 +0000
Received: from bilbo.ozlabs.org ([203.11.71.1]:57271 helo=ozlabs.org) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hjFbj-005HCh-CE
 for samba-technical@lists.samba.org; Fri, 05 Jul 2019 04:14:01 +0000
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 45g1gL4xH0z9sNs;
 Fri,  5 Jul 2019 14:13:50 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=meltin.net; s=201810;
 t=1562300030; bh=9EgXH+40Oc1dh43NmTTpVvr3YzYSvlNkUAfGSiTRzyA=;
 h=Date:From:To:Subject:From;
 b=od59xd4eMzhByKOgYCGbJoU6EiIdoULuOCEdyZP5Tu98t+gEmylpQV8J90bnuYBp8
 C+fb8E/8Q+VrjCBsMyJCfDKjdqRqa3WeUdNH1tl07i1XdT2bUOw1Ov8OE0BaB9oofg
 FacvZnllv5VVWLCliCna7HhhTrgbmsnIy+yi6rDP95/u7TsYrxKhzqy8th09mELkQO
 a0Th5GSRT2WYpzpM4Yz8MpEBnFDhFukO4Sbyk2hSaer9qtk6rhDlAtQ8sdmPBQxv/8
 OYmFnmRA8IQfV38QkY65PVmP/QQVTWv/kOiwomdAH6VpCcL0FExWMNtCcscF8tQ5vL
 cmSDlkx0k9bww==
Date: Fri, 5 Jul 2019 14:13:50 +1000
To: Samba Technical <samba-technical@lists.samba.org>
Subject: [PATCH] ctdb-tools: CID 1449530 - Negative loop bound
Message-ID: <20190705141350.39b099d4@martins.ozlabs.org>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="MP_/Nm29hjKXtPbxeefVM.suy92"
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
From: Martin Schwenke via samba-technical <samba-technical@lists.samba.org>
Reply-To: Martin Schwenke <martin@meltin.net>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

--MP_/Nm29hjKXtPbxeefVM.suy92
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Regression introduced by commit
2558f96da1f9be8034f26736c8050bb38a1f82a8.  count should be signed
because list_of_connected_nodes() returns -1 on failure.  Variable i
is used in both signed and unsigned contexts, so add new signed
variable j for use in signed context.

Please review and maybe push...

peace & happiness,
martin

--MP_/Nm29hjKXtPbxeefVM.suy92
Content-Type: text/x-patch
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename=0001-ctdb-tools-CID-1449530-Negative-loop-bound.patch

From 4411eb3bc1e0ecc9e31a153e6ad06f0471a1336b Mon Sep 17 00:00:00 2001
From: Martin Schwenke <martin@meltin.net>
Date: Wed, 3 Jul 2019 20:58:54 +1000
Subject: [PATCH] ctdb-tools: CID 1449530 - Negative loop bound

Regression introduced by commit
2558f96da1f9be8034f26736c8050bb38a1f82a8.  count should be signed
because list_of_connected_nodes() returns -1 on failure.  Variable i
is used in both signed and unsigned contexts, so add new signed
variable j for use in signed context.

Signed-off-by: Martin Schwenke <martin@meltin.net>
---
 ctdb/tools/ctdb.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/ctdb/tools/ctdb.c b/ctdb/tools/ctdb.c
index 9d46c981a0f..2cc72eedc76 100644
--- a/ctdb/tools/ctdb.c
+++ b/ctdb/tools/ctdb.c
@@ -3657,7 +3657,8 @@ static int control_reloadnodes(TALLOC_CTX *mem_ctx, struct ctdb_context *ctdb,
 	struct ctdb_req_control request;
 	struct ctdb_reply_control **reply;
 	bool reload;
-	unsigned int i, count;
+	unsigned int i;
+	int count;
 	int ret;
 	uint32_t *pnn_list;
 
@@ -3726,13 +3727,14 @@ static int control_reloadnodes(TALLOC_CTX *mem_ctx, struct ctdb_context *ctdb,
 					&request, NULL, &reply);
 	if (ret != 0) {
 		bool failed = false;
+		int j;
 
-		for (i=0; i<count; i++) {
-			ret = ctdb_reply_control_reload_nodes_file(reply[i]);
+		for (j=0; j<count; j++) {
+			ret = ctdb_reply_control_reload_nodes_file(reply[j]);
 			if (ret != 0) {
 				fprintf(stderr,
 					"Node %u failed to reload nodes\n",
-					pnn_list[i]);
+					pnn_list[j]);
 				failed = true;
 			}
 		}
-- 
2.20.1


--MP_/Nm29hjKXtPbxeefVM.suy92--

