Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::443:1])
	by mail.lfdr.de (Postfix) with ESMTPS id ABB681C189
	for <lists+samba-technical@lfdr.de>; Tue, 14 May 2019 06:48:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=FGIJpF/DvE7WvvRmYREE0l3NdZKO5dgWnC4T1+gKl14=; b=Lqvnl7dlhjKjTdyLF+Cn7q8aGQ
	fEqbA10sWOWJOXO9bsW6oHWvOeR+F01gefpNprmko7LbRPOPpkymogamrFIGgA/P3eySDc4CH0kR/
	3qkJJNlzJ1R2nOUVzSIMv3qaU+iCF+K+aJ/8MX3nzfGP1VeKsU2XuCDgWEjDbB/XUdEvSvQT/qzLr
	Xpw5DAZ4ss7kmn+2Lougchx7yDbPbrohBgLFJPq7P25OdwQGRoB6KOp8qTaYwDhUXQGojo4sJIicc
	z4ezsr4xMycgfgrVewY8wFvBSMscq3oIKOxBw7cWtFAqwfnYjHyq6b7i7gF0i6BUDdXwrGQBbuHP2
	uLSmsDVQ==;
Received: from localhost ([::1]:58166 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hQPML-003RDH-4a; Tue, 14 May 2019 04:48:13 +0000
Received: from ozlabs.org ([203.11.71.1]:59737) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hQPMF-003RDA-Tg
 for samba-technical@lists.samba.org; Tue, 14 May 2019 04:48:10 +0000
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4534tn6t5rz9sBp;
 Tue, 14 May 2019 14:48:01 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=meltin.net; s=201810;
 t=1557809282; bh=fR1Op9DUMMBokV/k+AxUsFF6JwfkpF8XyfZqD9CXpiM=;
 h=Date:From:To:Subject:From;
 b=VtxB2HMz0EASG/33Lm/UpXcvwB9KrLezABdIFAjKAsZm7pxSSnhGZsQJEHU5AYtjY
 FJQk8+NiZYjRzW+tL3e22PFHF1dy2JXlMmy/1l/J8onHujgisnJZotCRgXIJDeRejh
 XfDeVDoTRga15dr9YkiAVb5gLx7Ja1LU3rY6zn2729K2dJonnnuqUzV7EH2ehB38s5
 ODEZpdYnFw6A5C+DLEcTHqy10ODFKC00qDRfUd3ojMfiAXcDFzvTxBTbKPI9jQ6AZJ
 Fi+lRupmd/LiWxrHepLp18QlgIw9fmuzr8JT8FOb1NbiHLvYEGKeEVVHK7f0uI76tF
 YSYBljQWDWpXg==
Date: Tue, 14 May 2019 14:48:01 +1000
To: Samba Technical <samba-technical@lists.samba.org>
Subject: [PATCH] Fix CTDB memory leaks (bug #13943)
Message-ID: <20190514144801.2d476fdb@martins.ozlabs.org>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="MP_/FXsWvvLbvJ6mzlkJlnt.yrm"
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
From: Martin Schwenke via samba-technical <samba-technical@lists.samba.org>
Reply-To: Martin Schwenke <martin@meltin.net>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

--MP_/FXsWvvLbvJ6mzlkJlnt.yrm
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Fix 3 memory leaks in CTDB eventd and recoverd.

Includes one patch from Amitay already reviewed by me.

Please review and maybe push...

peace & happiness,
martin

--MP_/FXsWvvLbvJ6mzlkJlnt.yrm
Content-Type: text/x-patch
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=BZ13943.patch

From 12482db6b28c9c49b41246df12b76318f574e6b7 Mon Sep 17 00:00:00 2001
From: Martin Schwenke <martin@meltin.net>
Date: Sat, 11 May 2019 14:24:24 +1000
Subject: [PATCH 1/3] ctdb-recoverd: Fix memory leak

state is always freed before exiting this function, so allocate fde
off it instead of long-lived ctdb context.

BUG: https://bugzilla.samba.org/show_bug.cgi?id=13943

Signed-off-by: Martin Schwenke <martin@meltin.net>
---
 ctdb/server/ctdb_recoverd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/ctdb/server/ctdb_recoverd.c b/ctdb/server/ctdb_recoverd.c
index dbadaec4399..a179fa52fc9 100644
--- a/ctdb/server/ctdb_recoverd.c
+++ b/ctdb/server/ctdb_recoverd.c
@@ -1134,7 +1134,7 @@ static int helper_run(struct ctdb_recoverd *rec, TALLOC_CTX *mem_ctx,
 
 	state->done = false;
 
-	fde = tevent_add_fd(rec->ctdb->ev, rec->ctdb, state->fd[0],
+	fde = tevent_add_fd(rec->ctdb->ev, state, state->fd[0],
 			    TEVENT_FD_READ, helper_handler, state);
 	if (fde == NULL) {
 		goto fail;
-- 
2.20.1


From e4a7f452a3cd80cf90cf35d3c2fb3faf4c4d546f Mon Sep 17 00:00:00 2001
From: Martin Schwenke <martin@meltin.net>
Date: Sat, 11 May 2019 17:33:57 +1000
Subject: [PATCH 2/3] ctdb-common: Fix memory leak

BUG: https://bugzilla.samba.org/show_bug.cgi?id=13943

Signed-off-by: Martin Schwenke <martin@meltin.net>
---
 ctdb/common/event_script.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/ctdb/common/event_script.c b/ctdb/common/event_script.c
index 8978d1452c0..8bdfdd0b5ca 100644
--- a/ctdb/common/event_script.c
+++ b/ctdb/common/event_script.c
@@ -117,7 +117,8 @@ int event_script_get_list(TALLOC_CTX *mem_ctx,
 	}
 
 	*out = script_list;
-	return 0;
+	ret = 0;
+	goto done;
 
 nomem:
 	ret = ENOMEM;
-- 
2.20.1


From d4f46874f399eb0ff93457c2bce194c995bffa0c Mon Sep 17 00:00:00 2001
From: Amitay Isaacs <amitay@gmail.com>
Date: Mon, 13 May 2019 17:07:59 +1000
Subject: [PATCH 3/3] ctdb-common: Fix memory leak in run_proc

BUG: https://bugzilla.samba.org/show_bug.cgi?id=13943

Signed-off-by: Amitay Isaacs <amitay@gmail.com>
Reviewed-by: Martin Schwenke <martin@meltin.net>
---
 ctdb/common/run_proc.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/ctdb/common/run_proc.c b/ctdb/common/run_proc.c
index 037b6d9651d..0c3c1de72fe 100644
--- a/ctdb/common/run_proc.c
+++ b/ctdb/common/run_proc.c
@@ -302,13 +302,15 @@ again:
 		proc->fd = -1;
 	}
 
+	DLIST_REMOVE(run_ctx->plist, proc);
+
 	/* Active run_proc request */
 	if (proc->req != NULL) {
 		run_proc_done(proc->req);
+	} else {
+		talloc_free(proc);
 	}
 
-	DLIST_REMOVE(run_ctx->plist, proc);
-
 	goto again;
 }
 
@@ -426,6 +428,7 @@ static void run_proc_done(struct tevent_req *req)
 	if (state->proc->output != NULL) {
 		state->output = talloc_steal(state, state->proc->output);
 	}
+	talloc_steal(state, state->proc);
 
 	tevent_req_done(req);
 }
-- 
2.20.1


--MP_/FXsWvvLbvJ6mzlkJlnt.yrm--

