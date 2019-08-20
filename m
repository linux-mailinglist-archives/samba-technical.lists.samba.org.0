Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 09C6C957D4
	for <lists+samba-technical@lfdr.de>; Tue, 20 Aug 2019 09:06:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=jYo0UHztLgMB+2cslzl33lWcEbNPy/KBExqTUItZJD8=; b=jdWuv7+Z3X3C1KA18gw9+hvYO3
	q354ivHW0y79f5TxbwPW5ywsa9xL31bBo4SG9Xy0onaMPEv3gn75lK939Ek23tYkg2nSqqs9nZnSM
	2mnyTbVGqM7BFJBqh50d0yabDomwriLLg1/odJ22WhVsXWH5hTOeeWaC4xvtPiuy4+bObr1XGBAN7
	nvbPiOgec2s0vFMQZ0UO/kOAgvz05GRtVt7nehcWbLcbx6VhMt9olPjwJTbz7XN6IZZbwkwGMuLFN
	92OHSbYxMEW+1t37AmKxqD9abiCCU3raBysB+RJYg82W5H/l7sHwBdSSCqkDusMOskKWmIiK9hhtE
	q9+9Bt5g==;
Received: from localhost ([::1]:28844 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hzyDM-0079cU-NX; Tue, 20 Aug 2019 07:05:56 +0000
Received: from bilbo.ozlabs.org ([203.11.71.1]:38895 helo=ozlabs.org) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hzyDE-0079cN-E2
 for samba-technical@lists.samba.org; Tue, 20 Aug 2019 07:05:51 +0000
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 46CMJN59Srz9sN1;
 Tue, 20 Aug 2019 17:05:40 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=meltin.net; s=201810;
 t=1566284740; bh=aOlmoZnSsL2aUSbeQCQzgDY2UbV5zixDnjILOARG+os=;
 h=Date:From:To:Subject:In-Reply-To:References:From;
 b=mW1R7fhkgmVKWsUTc1m1lo8Bietavcnn2MzrTyRd02lE7hhN8adqq3TcbaxfhRgUn
 7PewtxTbGVazExbi3EWdVpPee94yNsQcmCRq8ipcgKNaLSEdmzKEXNiyDeNQv0yHo4
 RlYSeaFTwLUhzr/yfeNggJefxLdbVwdnk65KPsPrELZZ0syTeiw+D+mxWvgztU8+1x
 U1u+73nQ1cS/450iSXfzJ0z2j3Dbt2E7cUcC35sv7vbfquHjo84iBS6kXf96a4cy+c
 byNmWu2cbXI9IAiCNRebuFku38FXO1tbIxsEt/nrd61BuczQ5nrNjRSHA9aMoSHhvV
 TRjiaLj56cLOg==
Date: Tue, 20 Aug 2019 17:05:39 +1000
To: Martin Schwenke via samba-technical <samba-technical@lists.samba.org>
Subject: Re: [PATCH] ctdb-daemon: Make STOP_NODE control wait until complete
 (bug 14087)
Message-ID: <20190820170539.36b828e4@martins.ozlabs.org>
In-Reply-To: <20190819143431.6371768b@martins.ozlabs.org>
References: <20190817102447.55faa4c7@martins.ozlabs.org>
 <20190819143431.6371768b@martins.ozlabs.org>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="MP_/g+xInGRQPuzL=lsIYxWrDgB"
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

--MP_/g+xInGRQPuzL=lsIYxWrDgB
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Mon, 19 Aug 2019 14:34:31 +1000, Martin Schwenke via samba-technical
<samba-technical@lists.samba.org> wrote:

> On Sat, 17 Aug 2019 10:24:47 +1000, Martin Schwenke via samba-technical
> <samba-technical@lists.samba.org> wrote:
> 
> > STOP_NODE is supported by a periodic check in the recovery daemon's
> > main_loop(), which notices the flag change, and schedules a recovery
> > and freezes databases.  If STOP_NODE returns immediately then the
> > associated recovery can complete and the node can be continued before
> > databases are actually frozen.  This means that the databases on the
> > stopped node will node never be marked invalid and the recovery
> > following CONTINUE_NODE can resurrect deleted records.
> > 
> > CONTINUE_NODE must wait for an in-progress STOP_NODE to complete
> > before commencing.
> > 
> > Multiple STOP_NODE controls are also serialised.  This isn't strictly
> > necessary but will stop more deeply nested event loops.
> > 
> > Went through this pipelines with a slightly different commit message:
> > 
> >   https://gitlab.com/samba-team/devel/samba/pipelines/76501176
> > 
> > Now running in this one:
> > 
> >   https://gitlab.com/samba-team/devel/samba/pipelines/76849217
> > 
> > Please review and maybe push...  
> 
> Now with patch!  :-)

After further discussion with Amitay, we determined that this was the
wrong approach because things could loop forever. So, it either needed
timeouts and the associated timeout handling, which all adds a lot of
complication and is hard to get right, or it needs to be done
properly.  ;-)

New patch set attached to do it properly.  This does the steps to make
the node inactive in the NODE_STOP control.  For consistency it also
does the same thing to the SET_BAN_STATE control.

A variation (different commit order/messages, slightly different
logging, didn't drop unused code) passed the following GitLab CI
pipeline:

  https://gitlab.com/samba-team/devel/samba/pipelines/77082113

Please review and maybe push...

peace & happiness,
martin

--MP_/g+xInGRQPuzL=lsIYxWrDgB
Content-Type: text/x-patch
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=ctdb-stop.patch

From cf47a05713d09485a11d373ef71b1c080e031bd1 Mon Sep 17 00:00:00 2001
From: Martin Schwenke <martin@meltin.net>
Date: Mon, 19 Aug 2019 21:47:03 +1000
Subject: [PATCH 1/4] ctdb-daemon: Factor out new function
 ctdb_node_become_inactive()

This is a superset of ctdb_local_node_got_banned() so will replace
that function, and will also be used in the NODE_STOP control.

BUG: https://bugzilla.samba.org/show_bug.cgi?id=14087

Signed-off-by: Martin Schwenke <martin@meltin.net>
---
 ctdb/include/ctdb_private.h |  2 ++
 ctdb/server/ctdb_recover.c  | 43 +++++++++++++++++++++++++++++++++++++
 2 files changed, 45 insertions(+)

diff --git a/ctdb/include/ctdb_private.h b/ctdb/include/ctdb_private.h
index 1e9619faddf..d9d13fad358 100644
--- a/ctdb/include/ctdb_private.h
+++ b/ctdb/include/ctdb_private.h
@@ -819,6 +819,8 @@ int32_t ctdb_control_recd_ping(struct ctdb_context *ctdb);
 int32_t ctdb_control_set_recmaster(struct ctdb_context *ctdb,
 				   uint32_t opcode, TDB_DATA indata);
 
+void ctdb_node_become_inactive(struct ctdb_context *ctdb);
+
 int32_t ctdb_control_stop_node(struct ctdb_context *ctdb);
 int32_t ctdb_control_continue_node(struct ctdb_context *ctdb);
 
diff --git a/ctdb/server/ctdb_recover.c b/ctdb/server/ctdb_recover.c
index 343728839c1..df60a4cb9c0 100644
--- a/ctdb/server/ctdb_recover.c
+++ b/ctdb/server/ctdb_recover.c
@@ -1420,6 +1420,49 @@ int32_t ctdb_control_set_recmaster(struct ctdb_context *ctdb, uint32_t opcode, T
 	return 0;
 }
 
+void ctdb_node_become_inactive(struct ctdb_context *ctdb)
+{
+	struct ctdb_db_context *ctdb_db;
+
+	D_WARNING("Making node INACTIVE\n");
+
+	/*
+	 * Do not service database calls - reset generation to invalid
+	 * so this node ignores any REQ/REPLY CALL/DMASTER
+	 */
+	ctdb->vnn_map->generation = INVALID_GENERATION;
+	for (ctdb_db = ctdb->db_list; ctdb_db != NULL; ctdb_db = ctdb_db->next) {
+		ctdb_db->generation = INVALID_GENERATION;
+	}
+
+	/*
+	 * Although this bypasses the control, the only thing missing
+	 * is the deferred drop of all public IPs, which isn't
+	 * necessary because they are dropped below
+	 */
+	if (ctdb->recovery_mode != CTDB_RECOVERY_ACTIVE) {
+		D_NOTICE("Recovery mode set to ACTIVE\n");
+		ctdb->recovery_mode = CTDB_RECOVERY_ACTIVE;
+	}
+
+	/*
+	 * Initiate database freeze - this will be scheduled for
+	 * immediate execution and will be in progress long before the
+	 * calling control returns
+	 */
+	ctdb_daemon_send_control(ctdb,
+				 ctdb->pnn,
+				 0,
+				 CTDB_CONTROL_FREEZE,
+				 0,
+				 CTDB_CTRL_FLAG_NOREPLY,
+				 tdb_null,
+				 NULL,
+				 NULL);
+
+	D_NOTICE("Dropping all public IP addresses\n");
+	ctdb_release_all_ips(ctdb);
+}
 
 int32_t ctdb_control_stop_node(struct ctdb_context *ctdb)
 {
-- 
2.23.0.rc1


From ebb2fb587d3d92409c89882bc36e1dd7cc04c1f7 Mon Sep 17 00:00:00 2001
From: Martin Schwenke <martin@meltin.net>
Date: Mon, 19 Aug 2019 21:52:57 +1000
Subject: [PATCH 2/4] ctdb-daemon: Switch banning code to use
 ctdb_node_become_inactive()

There's no reason to avoid immediately setting recovery mode to active
and initiating freeze of databases.

This effectively reverts the following commits:

  d8f3b490bbb691c9916eed0df5b980c1aef23c85
  b4357a79d916b1f8ade8fa78563fbef0ce670aa9

The latter is now implemented using a control, resulting in looser
coupling.

See also the following commit:

  f8141e91a693912ea1107a49320e83702a80757a

BUG: https://bugzilla.samba.org/show_bug.cgi?id=14087

Signed-off-by: Martin Schwenke <martin@meltin.net>
---
 ctdb/server/ctdb_banning.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/ctdb/server/ctdb_banning.c b/ctdb/server/ctdb_banning.c
index 9cd163645a1..11794dc5b0b 100644
--- a/ctdb/server/ctdb_banning.c
+++ b/ctdb/server/ctdb_banning.c
@@ -129,7 +129,7 @@ int32_t ctdb_control_set_ban_state(struct ctdb_context *ctdb, TDB_DATA indata)
 			 ctdb_ban_node_event, ctdb);
 
 	if (!already_banned) {
-		ctdb_local_node_got_banned(ctdb);
+		ctdb_node_become_inactive(ctdb);
 	}
 	return 0;
 }
-- 
2.23.0.rc1


From ff87b5d1628fad6c45c4eb5aba79173b3a9914b1 Mon Sep 17 00:00:00 2001
From: Martin Schwenke <martin@meltin.net>
Date: Tue, 20 Aug 2019 11:29:42 +1000
Subject: [PATCH 3/4] ctdb-daemon: Drop unused function
 ctdb_local_node_got_banned()

BUG: https://bugzilla.samba.org/show_bug.cgi?id=14087

Signed-off-by: Martin Schwenke <martin@meltin.net>
---
 ctdb/include/ctdb_private.h |  1 -
 ctdb/server/ctdb_banning.c  | 24 ------------------------
 2 files changed, 25 deletions(-)

diff --git a/ctdb/include/ctdb_private.h b/ctdb/include/ctdb_private.h
index d9d13fad358..1f168dae2b8 100644
--- a/ctdb/include/ctdb_private.h
+++ b/ctdb/include/ctdb_private.h
@@ -481,7 +481,6 @@ int ctdb_ibw_init(struct ctdb_context *ctdb);
 
 /* from ctdb_banning.c */
 
-void ctdb_local_node_got_banned(struct ctdb_context *ctdb);
 int32_t ctdb_control_set_ban_state(struct ctdb_context *ctdb, TDB_DATA indata);
 int32_t ctdb_control_get_ban_state(struct ctdb_context *ctdb, TDB_DATA *outdata);
 void ctdb_ban_self(struct ctdb_context *ctdb);
diff --git a/ctdb/server/ctdb_banning.c b/ctdb/server/ctdb_banning.c
index 11794dc5b0b..3c711575e8c 100644
--- a/ctdb/server/ctdb_banning.c
+++ b/ctdb/server/ctdb_banning.c
@@ -57,30 +57,6 @@ static void ctdb_ban_node_event(struct tevent_context *ev,
 	}
 }
 
-void ctdb_local_node_got_banned(struct ctdb_context *ctdb)
-{
-	struct ctdb_db_context *ctdb_db;
-
-	DEBUG(DEBUG_NOTICE, ("This node has been banned - releasing all public "
-			     "IPs and setting the generation to INVALID.\n"));
-
-	/* Reset the generation id to 1 to make us ignore any
-	   REQ/REPLY CALL/DMASTER someone sends to us.
-	   We are now banned so we shouldnt service database calls
-	   anymore.
-	*/
-	ctdb->vnn_map->generation = INVALID_GENERATION;
-	for (ctdb_db = ctdb->db_list; ctdb_db != NULL; ctdb_db = ctdb_db->next) {
-		ctdb_db->generation = INVALID_GENERATION;
-	}
-
-	/* Recovery daemon will set the recovery mode ACTIVE and freeze
-	 * databases.
-	 */
-
-	ctdb_release_all_ips(ctdb);
-}
-
 int32_t ctdb_control_set_ban_state(struct ctdb_context *ctdb, TDB_DATA indata)
 {
 	struct ctdb_ban_state *bantime = (struct ctdb_ban_state *)indata.dptr;
-- 
2.23.0.rc1


From 1b9665be27d02c6f7601e3106edbc8884b846feb Mon Sep 17 00:00:00 2001
From: Martin Schwenke <martin@meltin.net>
Date: Mon, 19 Aug 2019 21:48:04 +1000
Subject: [PATCH 4/4] ctdb-daemon: Make node inactive in the NODE_STOP control

Currently some of this is supported by a periodic check in the
recovery daemon's main_loop(), which notices the flag change, sets
recovery mode active and freezes databases.  If STOP_NODE returns
immediately then the associated recovery can complete and the node can
be continued before databases are actually frozen.

Instead, immediately do all of the things that make a node inactive.

BUG: https://bugzilla.samba.org/show_bug.cgi?id=14087
RN: Stop "ctdb stop" from completing before freezing databases

Signed-off-by: Martin Schwenke <martin@meltin.net>
---
 ctdb/server/ctdb_recover.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/ctdb/server/ctdb_recover.c b/ctdb/server/ctdb_recover.c
index df60a4cb9c0..1654c6d3978 100644
--- a/ctdb/server/ctdb_recover.c
+++ b/ctdb/server/ctdb_recover.c
@@ -1469,6 +1469,8 @@ int32_t ctdb_control_stop_node(struct ctdb_context *ctdb)
 	DEBUG(DEBUG_ERR, ("Stopping node\n"));
 	ctdb->nodes[ctdb->pnn]->flags |= NODE_FLAGS_STOPPED;
 
+	ctdb_node_become_inactive(ctdb);
+
 	return 0;
 }
 
-- 
2.23.0.rc1


--MP_/g+xInGRQPuzL=lsIYxWrDgB--

