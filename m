Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B17CD91C14
	for <lists+samba-technical@lfdr.de>; Mon, 19 Aug 2019 06:35:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=tHpsxhkcwX586Z02RieB4DGAuMXCgVGLIiVTQdbd2Co=; b=BeNbquoRwdPl5mp1pRjeZZgvG0
	fSSWrX/9Y1/CTrnm3D1mL+lsC0O7YjucWlQx4F1qZndRYF3bTuT69afE9uhqnUN9DkCVcdD5SzYwn
	KziQihVgrhoWQynDc3y4V2jngaS+4x/mikfaqrO1GXoi0+NlwWx4YdKIk95NPXxYlPoQaAzaTlT/h
	ayt+C3OHEmzEwrrHRojihMPrU3eOtUrtLqRMOaz3yyeIY/WVaBZiE5H4+qeWrWe+eXRj/gbD/AgZU
	dm+ONCG/njQUwpUo+1+7KLRH9zFEvaz9on6E0HBA6EnXVmBjyxB+hzCNiUK5TVebdG1HlfqAT2XaC
	Eq2wqpcw==;
Received: from localhost ([::1]:48422 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hzZNY-006v6M-NS; Mon, 19 Aug 2019 04:34:48 +0000
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:37553 helo=ozlabs.org) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hzZNU-006v6F-FG
 for samba-technical@lists.samba.org; Mon, 19 Aug 2019 04:34:47 +0000
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 46Bh0T12rWz9sND;
 Mon, 19 Aug 2019 14:34:33 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=meltin.net; s=201810;
 t=1566189273; bh=bstONMyXuzJIzTRebYPTKjVlr8oCoCAv/+v+vT1H8dA=;
 h=Date:From:To:Subject:In-Reply-To:References:From;
 b=INClqs7FlRFfFIMDFYhM+HYfWCJhj6dLEs012QiOw+AXqeBEkHdzOLg8i2vSh+Ps5
 MTKL+Wa9xOQ9BryYinbw2e1esTb+InDoawpK1rGQHLuLC3HKZZ0RSoVkRX8OchQ5sb
 n+8xB1pF/VNMSazeDfxZGT5vwBAt8K0dfcR8ifuAcqPB/x4aeyzKJxoQiYjSx7xwwm
 6kXAfp5VOIGNxlablHmCbfI3WN3VqU/eVZa9ttnUWwe78nwIf3alge9fHHuD2YPJ3N
 oyTHWoZy/dPNqTp1fShKrq1SBgHXl9HXF7X0P4B/QHmadWD6ABnnOtojBxbYxHN0z5
 6JnWv44ujgZfA==
Date: Mon, 19 Aug 2019 14:34:31 +1000
To: samba-technical@lists.samba.org
Subject: Re: [PATCH] ctdb-daemon: Make STOP_NODE control wait until complete
 (bug 14087)
Message-ID: <20190819143431.6371768b@martins.ozlabs.org>
In-Reply-To: <20190817102447.55faa4c7@martins.ozlabs.org>
References: <20190817102447.55faa4c7@martins.ozlabs.org>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="MP_/.ivD_ilctDbHrpZ=HgMlE2m"
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

--MP_/.ivD_ilctDbHrpZ=HgMlE2m
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Sat, 17 Aug 2019 10:24:47 +1000, Martin Schwenke via samba-technical
<samba-technical@lists.samba.org> wrote:

> STOP_NODE is supported by a periodic check in the recovery daemon's
> main_loop(), which notices the flag change, and schedules a recovery
> and freezes databases.  If STOP_NODE returns immediately then the
> associated recovery can complete and the node can be continued before
> databases are actually frozen.  This means that the databases on the
> stopped node will node never be marked invalid and the recovery
> following CONTINUE_NODE can resurrect deleted records.
> 
> CONTINUE_NODE must wait for an in-progress STOP_NODE to complete
> before commencing.
> 
> Multiple STOP_NODE controls are also serialised.  This isn't strictly
> necessary but will stop more deeply nested event loops.
> 
> Went through this pipelines with a slightly different commit message:
> 
>   https://gitlab.com/samba-team/devel/samba/pipelines/76501176
> 
> Now running in this one:
> 
>   https://gitlab.com/samba-team/devel/samba/pipelines/76849217
> 
> Please review and maybe push...

Now with patch!  :-)

peace & happiness,
martin

--MP_/.ivD_ilctDbHrpZ=HgMlE2m
Content-Type: text/x-patch
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename=0001-ctdb-daemon-Make-STOP_NODE-control-wait-until-comple.patch

From 2924f4a35f90f981816bff6efeb734a671ee2960 Mon Sep 17 00:00:00 2001
From: Martin Schwenke <martin@meltin.net>
Date: Fri, 9 Aug 2019 22:01:56 +1000
Subject: [PATCH] ctdb-daemon: Make STOP_NODE control wait until complete

STOP_NODE is supported by a periodic check in the recovery daemon's
main_loop(), which notices the flag change, and schedules a recovery
and freezes databases.  If STOP_NODE returns immediately then the
associated recovery can complete and the node can be continued before
databases are actually frozen.  This means that the databases on the
stopped node will node never be marked invalid and the recovery
following CONTINUE_NODE can resurrect deleted records.

CONTINUE_NODE must wait for an in-progress STOP_NODE to complete
before commencing.

Multiple STOP_NODE controls are also serialised.  This isn't strictly
necessary but will stop more deeply nested event loops.

BUG: https://bugzilla.samba.org/show_bug.cgi?id=14087
RN: Avoid overlap and collision of node stops and continues
Signed-off-by: Martin Schwenke <martin@meltin.net>
---
 ctdb/server/ctdb_recover.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/ctdb/server/ctdb_recover.c b/ctdb/server/ctdb_recover.c
index 343728839c1..96c2472ebb5 100644
--- a/ctdb/server/ctdb_recover.c
+++ b/ctdb/server/ctdb_recover.c
@@ -1420,17 +1420,35 @@ int32_t ctdb_control_set_recmaster(struct ctdb_context *ctdb, uint32_t opcode, T
 	return 0;
 }
 
+static bool stop_in_flight = false;
 
 int32_t ctdb_control_stop_node(struct ctdb_context *ctdb)
 {
+
+	while (stop_in_flight) {
+		tevent_loop_once(ctdb->ev);
+	}
+
+	stop_in_flight = true;
+
 	DEBUG(DEBUG_ERR, ("Stopping node\n"));
 	ctdb->nodes[ctdb->pnn]->flags |= NODE_FLAGS_STOPPED;
 
+	while (! ctdb_db_all_frozen(ctdb)) {
+		tevent_loop_once(ctdb->ev);
+	}
+
+	stop_in_flight = false;
+
 	return 0;
 }
 
 int32_t ctdb_control_continue_node(struct ctdb_context *ctdb)
 {
+	while (stop_in_flight) {
+		tevent_loop_once(ctdb->ev);
+	}
+
 	DEBUG(DEBUG_ERR, ("Continue node\n"));
 	ctdb->nodes[ctdb->pnn]->flags &= ~NODE_FLAGS_STOPPED;
 
-- 
2.23.0.rc1


--MP_/.ivD_ilctDbHrpZ=HgMlE2m--

