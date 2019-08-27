Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id BB93D9DB98
	for <lists+samba-technical@lfdr.de>; Tue, 27 Aug 2019 04:18:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=ZMYagr/WE3Y3IEP0n4+4SEYN+FXlCIELHPdQhlAEA9Q=; b=15VUF32EL3LMHLhYuj8YqDUfys
	XGmr/qVUT7JekAn546K5u6akqV54OMEUihSe1ewTXz5OOp7MSCavLFx//3ZtMqDzQcWRvcWRFFl4F
	8A8EKCaIAfKJYPrBPD39gS5ttUZOt7gjo4bybkJCPX9worQEBkGtWrRHXVvy4bZk4fWhhIbi/3fb0
	TyCnYRnYFeM6qxLlmFEUanBuKXEXirG8p4rdUNMDDJJPDATDr7qRqEOyDj7r6mO/qBwhFxSK5Gq0C
	vK/cKMT0X651naCHaWlRcopAGEtK3bed5YSSevL6MyfpSKvwx003xgAUVCj7OLK9gEPJMAfHl9bS/
	+J8SaZNQ==;
Received: from localhost ([::1]:18420 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1i2R3D-008byG-Ee; Tue, 27 Aug 2019 02:17:39 +0000
Received: from ozlabs.org ([2401:3900:2:1::2]:59427) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1i2R38-008by8-Sv
 for samba-technical@lists.samba.org; Tue, 27 Aug 2019 02:17:37 +0000
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 46HXZS1njcz9s7T;
 Tue, 27 Aug 2019 12:17:20 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=meltin.net; s=201810;
 t=1566872240; bh=6lS79QxirNZBhRrQOpsEV0shEjoMuuVKJ7YMuCm/Wq4=;
 h=Date:From:To:Subject:From;
 b=PGDs7LVwLNRD6D955q6iEcuuAp6y4Qbk9AuBGcjXDIAjB9vPoFdf0cjJOdp9ETmVa
 8NMM7acQtqayEbbO1DnD7FcNQqI0qmxUkdfaMBl9JJie7b0y/xoB5RqvYchjRJaiV8
 gf/7f8wY3/uki1FbF/H+It0rtMpdUovZjqxm6caKZESHpVpW3C4IHeVEDpcPM57w3Z
 UuxlPq4fpzhfKB4BGv949WbtnxUjCs/kZt3nqfnNi27mA/W9VcBwyaqELB5S6I1Rjf
 FbSmg5Sf21zOJUNMJof3be8h9QLNvAXvx7A65AisfnqF1Ao+HfuvDej1ZAWw2Hxvc0
 jinigbjU3FN4Q==
Date: Tue, 27 Aug 2019 12:17:19 +1000
To: Samba Technical <samba-technical@lists.samba.org>
Subject: [PATCH] ctdb-recoverd: Fix typo in previous fix
Message-ID: <20190827121719.2be9307f@martins.ozlabs.org>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="MP_/a_1m0sIHc+E_/84AvRr=pWp"
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

--MP_/a_1m0sIHc+E_/84AvRr=pWp
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

The typo will probably do no harm but logically it is very wrong.  :-(

BUG: https://bugzilla.samba.org/show_bug.cgi?id=14085

Please review and maybe push...

peace & happiness,
martin

--MP_/a_1m0sIHc+E_/84AvRr=pWp
Content-Type: text/x-patch
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename=0001-ctdb-recoverd-Fix-typo-in-previous-fix.patch

From fb425383d263c31bf84f38d623ed03459b463001 Mon Sep 17 00:00:00 2001
From: Martin Schwenke <martin@meltin.net>
Date: Tue, 27 Aug 2019 12:13:51 +1000
Subject: [PATCH] ctdb-recoverd: Fix typo in previous fix

BUG: https://bugzilla.samba.org/show_bug.cgi?id=14085

Signed-off-by: Martin Schwenke <martin@meltin.net>
---
 ctdb/server/ctdb_recoverd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/ctdb/server/ctdb_recoverd.c b/ctdb/server/ctdb_recoverd.c
index c1c2a88b12c..5f7fd71ae41 100644
--- a/ctdb/server/ctdb_recoverd.c
+++ b/ctdb/server/ctdb_recoverd.c
@@ -2998,7 +2998,7 @@ static void main_loop(struct ctdb_context *ctdb, struct ctdb_recoverd *rec,
 			continue;
 		}
 		if (! ctdb_node_has_capabilities(rec->caps,
-						 ctdb->nodes[j]->pnn,
+						 nodemap->nodes[j].pnn,
 						 CTDB_CAP_LMASTER)) {
 			continue;
 		}
-- 
2.23.0.rc1


--MP_/a_1m0sIHc+E_/84AvRr=pWp--

