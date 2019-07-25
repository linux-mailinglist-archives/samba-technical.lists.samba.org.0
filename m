Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id C0E85746B3
	for <lists+samba-technical@lfdr.de>; Thu, 25 Jul 2019 08:01:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=bH5Q5Gxg0i9Emla8SFyr2TBLI3RlLoE16uELoyF9H/0=; b=vS5AHzdvJMMnBvxVZvU5+683g2
	SRfrcT3SR8C5l1WSuapaDnu2o3Kny6CuUR5n9YcbZvrls9kJ32+mbhbCyzZ/+ekzhzg6KDRzehKE9
	qtbPodr4l19Puq8lCwaB68TZ6qWXxrAmnLUjMtZUd9gG4GEAzPttyr2LIqwK/W5vCDhdKvWna5yn1
	b9BIOAZlLweP0T9myjGypyNqPM1bfhDx25GEoRPHgUk+SJT5lkDX4a8+73BmHv5ba80CIYvkIEBi3
	96ArzEuxOUJ6VK/RaDCFX3jwmnj5ndk1i+G0+sOnxHtP7eYdc29oUWrjm0+c1WRSxWE71VeZ6im51
	1H7vA0fA==;
Received: from localhost ([::1]:48898 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hqWoD-000AUr-CV; Thu, 25 Jul 2019 06:00:57 +0000
Received: from ozlabs.org ([2401:3900:2:1::2]:43799) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hqWo8-000AUk-8f
 for samba-technical@lists.samba.org; Thu, 25 Jul 2019 06:00:55 +0000
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 45vM5S6vQJz9s8m;
 Thu, 25 Jul 2019 16:00:44 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=meltin.net; s=201810;
 t=1564034445; bh=4IA5tGqQ5s5Y03VfRVzslGG42c8ShRvHBh2w7TXCQl0=;
 h=Date:From:To:Subject:From;
 b=k0zC0Txst+CFu+rMNTLihdsGzv0oZxKN4xU2knVWa1CQ+9itwZif9gp7mQyHlbxJo
 TVWqg828P4Qy7qkKWsI7XS+jJtQhOmUZNFPIX10P3/WqeIHGQzdx+e/t5a8EKU5xdf
 1UBAqPF38JWTYnsNjiRe2B7khtOgzjIu9uBupU84Ts4czIumZlf0Z0aL4y9aq9HuoP
 34eWSlrQMOhCB+jUMqrJQERda5rFBS/p62IpIKkB71T3pGrWRb0UJIf5GldetIYlS8
 ATbEhGSG+OiMplU8cWodDfFTYIBhHcP6qQZqJ8y3/40NXHru0MNICksGpihcPzi7o9
 ZKN8M1NB3gq5Q==
Date: Thu, 25 Jul 2019 16:00:43 +1000
To: Samba Technical <samba-technical@lists.samba.org>
Subject: [PATCH] Improve CTDB recovery master logging
Message-ID: <20190725160043.7da57188@martins.ozlabs.org>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="MP_/ONL16_CF3JCTOLILu/q5Qvb"
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

--MP_/ONL16_CF3JCTOLILu/q5Qvb
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Improves logging in 2 ways:

* Logs a clear message at the end of elections saying which node is
  master

* If the recovery lock is not set then periodically log details if the
  cluster is incomplete: master, incomplete duration, number of
  connected nodes

CI pipeline running here:

  https://gitlab.com/samba-team/devel/samba/pipelines/72839662

Please review and maybe push...

peace & happiness,
martin

--MP_/ONL16_CF3JCTOLILu/q5Qvb
Content-Type: text/x-patch
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=ctdb-recoverd-log.patch

From 1b8ac5533be6e16cee0b850b0ab752ded3edae9c Mon Sep 17 00:00:00 2001
From: Martin Schwenke <martin@meltin.net>
Date: Mon, 15 Jul 2019 09:15:04 +1000
Subject: [PATCH 1/2] ctdb-recoverd: Log the master at the end of elections

Signed-off-by: Martin Schwenke <martin@meltin.net>
---
 ctdb/server/ctdb_recoverd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/ctdb/server/ctdb_recoverd.c b/ctdb/server/ctdb_recoverd.c
index 652bf9ce4ea..2b5debc6c78 100644
--- a/ctdb/server/ctdb_recoverd.c
+++ b/ctdb/server/ctdb_recoverd.c
@@ -786,7 +786,7 @@ static void ctdb_election_timeout(struct tevent_context *ev,
 	rec->election_timeout = NULL;
 	fast_start = false;
 
-	DEBUG(DEBUG_WARNING,("Election period ended\n"));
+	D_WARNING("Election period ended, master=%u\n", rec->recmaster);
 }
 
 
-- 
2.20.1


From 6b2e4e5133bc7b41d8004b4c7d3d6ee63a03cb38 Mon Sep 17 00:00:00 2001
From: Martin Schwenke <martin@meltin.net>
Date: Tue, 16 Jul 2019 08:58:33 +1000
Subject: [PATCH 2/2] ctdb-recoverd: Periodically log recovery master of
 incomplete cluster

Only do this if the recovery lock is unset.  Log every minute for the
first 10 minutes, then every 10 minutes, then every hour.

This is useful for determining whether a split brain occurred.  It is
particularly useful if logging failed or was throttled at startup, so
there is no evidence of the split brain when it began.

Signed-off-by: Martin Schwenke <martin@meltin.net>
---
 ctdb/server/ctdb_recoverd.c | 119 ++++++++++++++++++++++++++++++++++++
 1 file changed, 119 insertions(+)

diff --git a/ctdb/server/ctdb_recoverd.c b/ctdb/server/ctdb_recoverd.c
index 2b5debc6c78..2633c755752 100644
--- a/ctdb/server/ctdb_recoverd.c
+++ b/ctdb/server/ctdb_recoverd.c
@@ -3091,6 +3091,112 @@ static void recd_sig_term_handler(struct tevent_context *ev,
 	exit(0);
 }
 
+/*
+ * Periodically log elements of the cluster state
+ *
+ * This can be used to confirm a split brain has occurred
+ */
+static void maybe_log_cluster_state(struct tevent_context *ev,
+				    struct tevent_timer *te,
+				    struct timeval current_time,
+				    void *private_data)
+{
+	struct ctdb_recoverd *rec = talloc_get_type_abort(
+		private_data, struct ctdb_recoverd);
+	struct ctdb_context *ctdb = rec->ctdb;
+	struct tevent_timer *tt;
+
+	static struct timeval start_incomplete = {
+		.tv_sec = 0,
+	};
+
+	bool is_complete;
+	bool was_complete;
+	unsigned int i;
+	double seconds;
+	unsigned int minutes;
+	unsigned int num_connected;
+
+	if (rec->recmaster != ctdb_get_pnn(ctdb)) {
+		goto done;
+	}
+
+	if (rec->nodemap == NULL) {
+		goto done;
+	}
+
+	is_complete = true;
+	num_connected = 0;
+	for (i = 0; i < rec->nodemap->num; i++) {
+		struct ctdb_node_and_flags *n = &rec->nodemap->nodes[i];
+
+		if (n->pnn == ctdb_get_pnn(ctdb)) {
+			continue;
+		}
+		if ((n->flags & NODE_FLAGS_DELETED) != 0) {
+			continue;
+		}
+		if ((n->flags & NODE_FLAGS_DISCONNECTED) != 0) {
+			is_complete = false;
+			continue;
+		}
+
+		num_connected++;
+	}
+
+	was_complete = timeval_is_zero(&start_incomplete);
+
+	if (is_complete) {
+		if (! was_complete) {
+			D_WARNING("Cluster complete with master=%u\n",
+				  rec->recmaster);
+			start_incomplete = timeval_zero();
+		}
+		goto done;
+	}
+
+	/* Cluster is newly incomplete... */
+	if (was_complete) {
+		start_incomplete = current_time;
+		minutes = 0;
+		goto log;
+	}
+
+	/*
+	 * Cluster has been incomplete since previous check, so figure
+	 * out how long (in minutes) and decide whether to log anything
+	 */
+	seconds = timeval_elapsed2(&start_incomplete, &current_time);
+	minutes = (unsigned int)seconds / 60;
+	if (minutes >= 60) {
+		/* Over an hour, log every hour */
+		if (minutes % 60 != 0) {
+			goto done;
+		}
+	} else if (minutes >= 10) {
+		/* Over 10 minutes, log every 10 minutes */
+		if (minutes % 10 != 0) {
+			goto done;
+		}
+	}
+
+log:
+	D_WARNING("Cluster incomplete with master=%u, elapsed=%u minutes, "
+		  "connected=%u\n",
+		  rec->recmaster,
+		  minutes,
+		  num_connected);
+
+done:
+	tt = tevent_add_timer(ctdb->ev,
+			      rec,
+			      timeval_current_ofs(60, 0),
+			      maybe_log_cluster_state,
+			      rec);
+	if (tt == NULL) {
+		DBG_WARNING("Failed to set up cluster state timer\n");
+	}
+}
 
 /*
   the main monitoring loop
@@ -3125,6 +3231,19 @@ static void monitor_cluster(struct ctdb_context *ctdb)
 		exit(1);
 	}
 
+	if (ctdb->recovery_lock == NULL) {
+		struct tevent_timer *tt;
+
+		tt = tevent_add_timer(ctdb->ev,
+				      rec,
+				      timeval_current_ofs(60, 0),
+				      maybe_log_cluster_state,
+				      rec);
+		if (tt == NULL) {
+			DBG_WARNING("Failed to set up cluster state timer\n");
+		}
+	}
+
 	/* register a message port for sending memory dumps */
 	ctdb_client_set_message_handler(ctdb, CTDB_SRVID_MEM_DUMP, mem_dump_handler, rec);
 
-- 
2.20.1


--MP_/ONL16_CF3JCTOLILu/q5Qvb--

