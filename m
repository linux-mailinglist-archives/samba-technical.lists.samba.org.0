Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A79588C9FE
	for <lists+samba-technical@lfdr.de>; Wed, 14 Aug 2019 06:00:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=OOVpic6HgxIDkX48DVCNQVAeohz0HKshY7iX9fZAvUM=; b=GTPIRsD3LeemDP/dE8uHLrEHJN
	cEVWL2G05Xb027Uo9y6qkXdyEUDzMSQljhsjXyDqHYg7H4LfA4f1PvZkaol/VR/EX4RtI6fTQvTXg
	49+qOv8mxjpjzu5zuUcyU+o+gRTDnlDqdk9vNkJ+LqEfmQWAXjisIZWjBqCvqqxKznsdyl5yKE8D7
	O8Gs2BMaPHb7T7E+gTg+UjP7VhTcBhOrb6sXTY6IhuCWc2j5Dw9EhNAr6VYIH2iuy5xauaUWE2JHO
	ffOYaICVxgYLnXxFRAEOnSYPeXZ3o9SVchJdeHkcEJaloI44bh3DZv3HoIcofHsXrKLJK6XJ8VZE7
	dfD64imA==;
Received: from localhost ([::1]:39048 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hxkSX-006E03-G8; Wed, 14 Aug 2019 04:00:25 +0000
Received: from ozlabs.org ([203.11.71.1]:55673) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hxkST-006Dzw-2Z
 for samba-technical@lists.samba.org; Wed, 14 Aug 2019 04:00:24 +0000
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 467bTB5PSnz9sML;
 Wed, 14 Aug 2019 14:00:14 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=meltin.net; s=201810;
 t=1565755214; bh=ac9C96pUJW1YvJ9DQhTrhYWOcffqLW9WTrWZVhjw7ME=;
 h=Date:From:To:Subject:From;
 b=SLTOXkgLJsGj/YgqQ8P8Qa7/fs64Alv4+A7upJs6XLJPdVDFQPU6yNakR8JyQZqXC
 LRD7C0HRvP821gBhBXboEIiWhQOHVF7+F19/XUfsOnYaopVU6+q9Z2NdgMrEgdiGRC
 D3VuXIgusSFraxB881XW21wRH+lmO+JKakBDpPQK9n4ayXjwlAY673U3hm7zwvjQol
 pn/Of+WEspdpQMSMZQuV3SExLF3zl0kRV6dw8YQojCgin/oLyznpbn9N7czL8zogyS
 lfl7tkebq41/qISm3/JZNB7DntgilRFXKF5vjQI+/zIjvuZY2GPmVLDnHuR0Lk+PN8
 bo2qSIBjvC48g==
Date: Wed, 14 Aug 2019 14:00:13 +1000
To: Samba Technical <samba-technical@lists.samba.org>
Subject: [PATCH] ctdb-tools: Fix usage for "ctdb cattdb"
Message-ID: <20190814140013.75102664@martins.ozlabs.org>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="MP_/XpcYTUkFUMIZEZI5Ctdh/9o"
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

--MP_/XpcYTUkFUMIZEZI5Ctdh/9o
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Minor copy and paste fixup.

Included in this pipeline:

  https://gitlab.com/samba-team/devel/samba/pipelines/76265339

Please review and maybe push...

peace & happiness,
martin

--MP_/XpcYTUkFUMIZEZI5Ctdh/9o
Content-Type: text/x-patch
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename=0001-ctdb-tools-Fix-usage-for-ctdb-cattdb.patch

From de13eb9dcd4f2af82cfd7797653e83996ec5a9b6 Mon Sep 17 00:00:00 2001
From: Martin Schwenke <martin@meltin.net>
Date: Thu, 1 Aug 2019 16:16:31 +1000
Subject: [PATCH] ctdb-tools: Fix usage for "ctdb cattdb"

Signed-off-by: Martin Schwenke <martin@meltin.net>
---
 ctdb/tools/ctdb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/ctdb/tools/ctdb.c b/ctdb/tools/ctdb.c
index 2cc72eedc76..4bbe8843671 100644
--- a/ctdb/tools/ctdb.c
+++ b/ctdb/tools/ctdb.c
@@ -2183,7 +2183,7 @@ static int control_cattdb(TALLOC_CTX *mem_ctx, struct ctdb_context *ctdb,
 	int ret;
 
 	if (argc != 1) {
-		usage("catdb");
+		usage("cattdb");
 	}
 
 	if (! db_exists(mem_ctx, ctdb, argv[0], &db_id, &db_name, &db_flags)) {
-- 
2.20.1


--MP_/XpcYTUkFUMIZEZI5Ctdh/9o--

