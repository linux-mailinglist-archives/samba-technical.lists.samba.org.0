Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 13F615B5A3
	for <lists+samba-technical@lfdr.de>; Mon,  1 Jul 2019 09:16:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=RF2vms9tbRddEGdtfsM+WZn2jm7ODfT01Ll/7z95z1Y=; b=k7iFO6blk2tQLw0Si2aHOwtUwY
	QNjFaNNf8C/F3P9H9pcVDtrT1jAUPSBikXg0Wp67f30D/W2nLFWxBU4tf0wGvPB3bDaSTAgQT86uK
	GnFrzOa6zn7Y6aQLEIafo+pybAKyWlnzfm3iS0nnzXETNLU3UvM3EJcpD/NcWxsITlj+tniDZAUSC
	bnnZzC+t9K296oDT3xUQ3FFqUVtSX1vuS/GEXPrP/MLH2DysaEYx82Znkh7vYIC9GJo54ZUY75diL
	CxwoyPVbex53M5w9A8J0ksovt46Sq90mn2QDHo7om3r6ajF+V+NfPQ1OH2BcD5BatikQO7uPvPnXw
	9D3un1Tg==;
Received: from localhost ([::1]:65022 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hhqWk-004HgH-Ge; Mon, 01 Jul 2019 07:15:02 +0000
Received: from ozlabs.org ([2401:3900:2:1::2]:49799) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hhqWW-004Hg8-4j
 for samba-technical@lists.samba.org; Mon, 01 Jul 2019 07:14:54 +0000
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 45cdsp51mxz9s4V;
 Mon,  1 Jul 2019 17:14:38 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=meltin.net; s=201810;
 t=1561965278; bh=2bLUQH+bsKaRZIDuK/sRN3trhX2h1dEP+RMSi2QuGok=;
 h=Date:From:To:Subject:From;
 b=TLePlKoEJXnwdB5IOeTkjWIbRv3/m/zAgKoOxzTEePjBrSCxjSqYAbs6M/mFozG+4
 PZqe1encD21s2EN1beKPvqsARU2SHlOXja9D0v7qz/Yih27z1FBCLA3nNzqDOQn8Sf
 pAfA2QRKf6KoVGrVwn/DIAkj8VNf0viEBsGZoT+DTNTyCa+Qr5LMC6bu5T0av1JlLS
 3Et0lHnEhto7RaQt0oS2/SynTePB4a9ey7jwmFtUNcvP3GAjLJ8Yqw/nrSw9o7vkYx
 Kf0TJYk8TLNeoEHZQTtGIlZ12IeneHCYLrRBqrZwN98ZP4F6ZFwrpwK7CW5//n9yKq
 oF/SV8EiiFDOA==
Date: Mon, 1 Jul 2019 17:14:37 +1000
To: Samba Technical <samba-technical@lists.samba.org>
Subject: [PATCH] CTDB csbuild fixups
Message-ID: <20190701171437.337d5c2f@martins.ozlabs.org>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="MP_/h1/VjHv18ARt124wAMGyo0p"
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

--MP_/h1/VjHv18ARt124wAMGyo0p
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Lots of csbuild-related CTDB fixups.

This is also GitLab merge request:

  https://gitlab.com/samba-team/samba/merge_requests/578

with CI pipeline:

  https://gitlab.com/samba-team/devel/samba/pipelines/68715416

Please review and maybe push...

peace & happiness,
martin

--MP_/h1/VjHv18ARt124wAMGyo0p
Content-Type: text/x-patch
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=ctdb-csbuild.patch

From 12f4de4622c31bc6d694d95b8d7e9cbe8ecbe531 Mon Sep 17 00:00:00 2001
From: Martin Schwenke <martin@meltin.net>
Date: Sat, 8 Jun 2019 06:08:48 +1000
Subject: [PATCH 01/32] ctdb-daemon: Make old list_of_nodes() function static

The next commit will change the type of this function, which is only
used in this file.  So, make it static to isolate the change.

Signed-off-by: Martin Schwenke <martin@meltin.net>
---
 ctdb/include/ctdb_client.h |  3 ---
 ctdb/server/ctdb_client.c  | 10 +++++-----
 2 files changed, 5 insertions(+), 8 deletions(-)

diff --git a/ctdb/include/ctdb_client.h b/ctdb/include/ctdb_client.h
index a48e506d271..ef4950ab533 100644
--- a/ctdb/include/ctdb_client.h
+++ b/ctdb/include/ctdb_client.h
@@ -278,9 +278,6 @@ uint32_t *list_of_vnnmap_nodes(struct ctdb_context *ctdb,
 			       struct ctdb_vnn_map *vnn_map,
 			       TALLOC_CTX *mem_ctx, bool include_self);
 
-uint32_t *list_of_nodes(struct ctdb_context *ctdb,
-			struct ctdb_node_map_old *node_map,
-			TALLOC_CTX *mem_ctx, uint32_t mask, int exclude_pnn);
 uint32_t *list_of_active_nodes(struct ctdb_context *ctdb,
 			       struct ctdb_node_map_old *node_map,
 			       TALLOC_CTX *mem_ctx, bool include_self);
diff --git a/ctdb/server/ctdb_client.c b/ctdb/server/ctdb_client.c
index f66ecbea7c1..c5ffa121c3d 100644
--- a/ctdb/server/ctdb_client.c
+++ b/ctdb/server/ctdb_client.c
@@ -1772,11 +1772,11 @@ uint32_t *list_of_vnnmap_nodes(struct ctdb_context *ctdb,
 /* Get list of nodes not including those with flags specified by mask.
  * If exclude_pnn is not -1 then exclude that pnn from the list.
  */
-uint32_t *list_of_nodes(struct ctdb_context *ctdb,
-			struct ctdb_node_map_old *node_map,
-			TALLOC_CTX *mem_ctx,
-			uint32_t mask,
-			int exclude_pnn)
+static uint32_t *list_of_nodes(struct ctdb_context *ctdb,
+			       struct ctdb_node_map_old *node_map,
+			       TALLOC_CTX *mem_ctx,
+			       uint32_t mask,
+			       int exclude_pnn)
 {
 	int i, j, num_nodes;
 	uint32_t *nodes;
-- 
2.20.1


From 35ce8849866752e8d7a033462ab40bd448ce32f3 Mon Sep 17 00:00:00 2001
From: Martin Schwenke <martin@meltin.net>
Date: Sat, 8 Jun 2019 06:22:49 +1000
Subject: [PATCH 02/32] ctdb-daemon: Make type of list_of_nodes() consistent
 with callers

Instead of taking exclude_pnn as a parameter, calculate it from an
include_self_parameter, which is passed through from the 2 calling
functions.

While doing this, fix a signed/unsigned comparison issue by declaring
the new exclude_pnn local variable as an unsigned type.

Signed-off-by: Martin Schwenke <martin@meltin.net>
---
 ctdb/server/ctdb_client.c | 23 +++++++++++++++--------
 1 file changed, 15 insertions(+), 8 deletions(-)

diff --git a/ctdb/server/ctdb_client.c b/ctdb/server/ctdb_client.c
index c5ffa121c3d..42aa0f5fc39 100644
--- a/ctdb/server/ctdb_client.c
+++ b/ctdb/server/ctdb_client.c
@@ -1769,18 +1769,19 @@ uint32_t *list_of_vnnmap_nodes(struct ctdb_context *ctdb,
 	return nodes;
 }
 
-/* Get list of nodes not including those with flags specified by mask.
- * If exclude_pnn is not -1 then exclude that pnn from the list.
- */
+/* Get list of nodes not including those with flags specified by mask */
 static uint32_t *list_of_nodes(struct ctdb_context *ctdb,
 			       struct ctdb_node_map_old *node_map,
 			       TALLOC_CTX *mem_ctx,
 			       uint32_t mask,
-			       int exclude_pnn)
+			       bool include_self)
 {
 	int i, j, num_nodes;
+	uint32_t exclude_pnn;
 	uint32_t *nodes;
 
+	exclude_pnn = include_self ? CTDB_UNKNOWN_PNN : ctdb->pnn;
+
 	for (i=num_nodes=0;i<node_map->num;i++) {
 		if (node_map->nodes[i].flags & mask) {
 			continue;
@@ -1812,8 +1813,11 @@ uint32_t *list_of_active_nodes(struct ctdb_context *ctdb,
 				TALLOC_CTX *mem_ctx,
 				bool include_self)
 {
-	return list_of_nodes(ctdb, node_map, mem_ctx, NODE_FLAGS_INACTIVE,
-			     include_self ? -1 : ctdb->pnn);
+	return list_of_nodes(ctdb,
+			     node_map,
+			     mem_ctx,
+			     NODE_FLAGS_INACTIVE,
+			     include_self);
 }
 
 uint32_t *list_of_connected_nodes(struct ctdb_context *ctdb,
@@ -1821,8 +1825,11 @@ uint32_t *list_of_connected_nodes(struct ctdb_context *ctdb,
 				TALLOC_CTX *mem_ctx,
 				bool include_self)
 {
-	return list_of_nodes(ctdb, node_map, mem_ctx, NODE_FLAGS_DISCONNECTED,
-			     include_self ? -1 : ctdb->pnn);
+	return list_of_nodes(ctdb,
+			     node_map,
+			     mem_ctx,
+			     NODE_FLAGS_DISCONNECTED,
+			     include_self);
 }
 
 /*
-- 
2.20.1


From f4252f4b6cc1fee885a2d9987c39bab72ccf8826 Mon Sep 17 00:00:00 2001
From: Martin Schwenke <martin@meltin.net>
Date: Sat, 8 Jun 2019 06:38:56 +1000
Subject: [PATCH 03/32] ctdb-daemon: Fix signed/unsigned comparisons by
 declaring as unsigned

Signed-off-by: Martin Schwenke <martin@meltin.net>
---
 ctdb/include/ctdb_private.h        |  2 +-
 ctdb/server/ctdb_client.c          |  4 ++--
 ctdb/server/ctdb_daemon.c          |  2 +-
 ctdb/server/ctdb_freeze.c          | 10 +++++-----
 ctdb/server/ctdb_keepalive.c       |  2 +-
 ctdb/server/ctdb_lock_helper.c     |  3 ++-
 ctdb/server/ctdb_ltdb_server.c     |  2 +-
 ctdb/server/ctdb_persistent.c      |  2 +-
 ctdb/server/ctdb_server.c          | 10 +++++-----
 ctdb/server/ctdb_takeover.c        | 19 ++++++++++++-------
 ctdb/server/ctdb_takeover_helper.c |  6 +++---
 ctdb/server/ctdb_traverse.c        |  2 +-
 ctdb/server/ctdb_update_record.c   |  9 ++++++---
 ctdb/server/ctdb_vacuum.c          |  4 ++--
 ctdb/server/eventscript.c          |  2 +-
 15 files changed, 44 insertions(+), 35 deletions(-)

diff --git a/ctdb/include/ctdb_private.h b/ctdb/include/ctdb_private.h
index ea00bb12128..9eec244c4f2 100644
--- a/ctdb/include/ctdb_private.h
+++ b/ctdb/include/ctdb_private.h
@@ -713,7 +713,7 @@ int ctdb_load_persistent_health(struct ctdb_context *ctdb,
 int ctdb_update_persistent_health(struct ctdb_context *ctdb,
 				  struct ctdb_db_context *ctdb_db,
 				  const char *reason,/* NULL means healthy */
-				  int num_healthy_nodes);
+				  unsigned int num_healthy_nodes);
 int ctdb_recheck_persistent_health(struct ctdb_context *ctdb);
 
 int32_t ctdb_control_db_set_healthy(struct ctdb_context *ctdb,
diff --git a/ctdb/server/ctdb_client.c b/ctdb/server/ctdb_client.c
index 42aa0f5fc39..419333025cb 100644
--- a/ctdb/server/ctdb_client.c
+++ b/ctdb/server/ctdb_client.c
@@ -1746,7 +1746,7 @@ uint32_t *list_of_vnnmap_nodes(struct ctdb_context *ctdb,
 				TALLOC_CTX *mem_ctx,
 				bool include_self)
 {
-	int i, j, num_nodes;
+	unsigned int i, j, num_nodes;
 	uint32_t *nodes;
 
 	for (i=num_nodes=0;i<vnn_map->size;i++) {
@@ -1776,7 +1776,7 @@ static uint32_t *list_of_nodes(struct ctdb_context *ctdb,
 			       uint32_t mask,
 			       bool include_self)
 {
-	int i, j, num_nodes;
+	unsigned int i, j, num_nodes;
 	uint32_t exclude_pnn;
 	uint32_t *nodes;
 
diff --git a/ctdb/server/ctdb_daemon.c b/ctdb/server/ctdb_daemon.c
index acb40bdb8df..6a4e42d8010 100644
--- a/ctdb/server/ctdb_daemon.c
+++ b/ctdb/server/ctdb_daemon.c
@@ -1345,7 +1345,7 @@ static void ctdb_create_pidfile(TALLOC_CTX *mem_ctx)
 
 static void ctdb_initialise_vnn_map(struct ctdb_context *ctdb)
 {
-	int i, j, count;
+	unsigned int i, j, count;
 
 	/* initialize the vnn mapping table, skipping any deleted nodes */
 	ctdb->vnn_map = talloc(ctdb, struct ctdb_vnn_map);
diff --git a/ctdb/server/ctdb_freeze.c b/ctdb/server/ctdb_freeze.c
index 10841efa1b9..b4b99a0e5c9 100644
--- a/ctdb/server/ctdb_freeze.c
+++ b/ctdb/server/ctdb_freeze.c
@@ -86,7 +86,7 @@ static int db_transaction_start_handler(struct ctdb_db_context *ctdb_db,
 static int db_transaction_commit_handler(struct ctdb_db_context *ctdb_db,
 					 void *private_data)
 {
-	int healthy_nodes = *(int *)private_data;
+	unsigned int healthy_nodes = *(unsigned int *)private_data;
 	int ret;
 
 	tdb_add_flags(ctdb_db->ltdb->tdb, TDB_NOLOCK);
@@ -414,7 +414,7 @@ static int db_invalidate(struct ctdb_db_context *ctdb_db, void *private_data)
  */
 static int db_count(struct ctdb_db_context *ctdb_db, void *private_data)
 {
-	int *count = (int *)private_data;
+	unsigned int *count = (unsigned int *)private_data;
 
 	*count += 1;
 
@@ -464,7 +464,7 @@ static void ctdb_start_freeze(struct ctdb_context *ctdb)
 	ctdb_db_iterator(ctdb, db_invalidate, NULL);
 
 	if (ctdb->freeze_mode == CTDB_FREEZE_FROZEN) {
-		int count = 0;
+		unsigned int count = 0;
 
 		/*
 		 * Check if all the databases are frozen
@@ -711,7 +711,7 @@ static int db_cancel_transaction(struct ctdb_db_context *ctdb_db,
 
 struct db_commit_transaction_state {
 	uint32_t transaction_id;
-	int healthy_nodes;
+	unsigned int healthy_nodes;
 };
 
 static int db_commit_transaction(struct ctdb_db_context *ctdb_db,
@@ -809,7 +809,7 @@ int32_t ctdb_control_db_transaction_commit(struct ctdb_context *ctdb,
 		(struct ctdb_transdb *)indata.dptr;
 	struct ctdb_db_context *ctdb_db;
 	struct db_commit_transaction_state state;
-	int healthy_nodes, i;
+	unsigned int healthy_nodes, i;
 
 	ctdb_db = find_ctdb_db(ctdb, w->db_id);
 	if (ctdb_db == NULL) {
diff --git a/ctdb/server/ctdb_keepalive.c b/ctdb/server/ctdb_keepalive.c
index b4c9d3731c4..9155adef301 100644
--- a/ctdb/server/ctdb_keepalive.c
+++ b/ctdb/server/ctdb_keepalive.c
@@ -107,7 +107,7 @@ static void ctdb_check_for_dead_nodes(struct tevent_context *ev,
 				      struct timeval t, void *private_data)
 {
 	struct ctdb_context *ctdb = talloc_get_type(private_data, struct ctdb_context);
-	int i;
+	unsigned int i;
 
 	/* send a keepalive to all other nodes, unless */
 	for (i=0;i<ctdb->num_nodes;i++) {
diff --git a/ctdb/server/ctdb_lock_helper.c b/ctdb/server/ctdb_lock_helper.c
index f918b73dbd3..6b6fbbe27a5 100644
--- a/ctdb/server/ctdb_lock_helper.c
+++ b/ctdb/server/ctdb_lock_helper.c
@@ -86,7 +86,8 @@ static void usage(const char *progname)
 static uint8_t *hex_decode_talloc(TALLOC_CTX *mem_ctx,
 				  const char *hex_in, size_t *len)
 {
-	int i, num;
+	unsigned int i;
+	int num;
 	uint8_t *buffer;
 
 	*len = strlen(hex_in) / 2;
diff --git a/ctdb/server/ctdb_ltdb_server.c b/ctdb/server/ctdb_ltdb_server.c
index 8cc6c4ba4cc..022baf62d92 100644
--- a/ctdb/server/ctdb_ltdb_server.c
+++ b/ctdb/server/ctdb_ltdb_server.c
@@ -425,7 +425,7 @@ int ctdb_load_persistent_health(struct ctdb_context *ctdb,
 int ctdb_update_persistent_health(struct ctdb_context *ctdb,
 				  struct ctdb_db_context *ctdb_db,
 				  const char *given_reason,/* NULL means healthy */
-				  int num_healthy_nodes)
+				  unsigned int num_healthy_nodes)
 {
 	struct tdb_context *tdb = ctdb->db_persistent_health->tdb;
 	int ret;
diff --git a/ctdb/server/ctdb_persistent.c b/ctdb/server/ctdb_persistent.c
index fc286552747..26717441d17 100644
--- a/ctdb/server/ctdb_persistent.c
+++ b/ctdb/server/ctdb_persistent.c
@@ -178,7 +178,7 @@ int32_t ctdb_control_trans3_commit(struct ctdb_context *ctdb,
 {
 	struct ctdb_client *client;
 	struct ctdb_persistent_state *state;
-	int i;
+	unsigned int i;
 	struct ctdb_marshall_buffer *m = (struct ctdb_marshall_buffer *)recdata.dptr;
 	struct ctdb_db_context *ctdb_db;
 
diff --git a/ctdb/server/ctdb_server.c b/ctdb/server/ctdb_server.c
index c991b85d99b..eb11eb1f95c 100644
--- a/ctdb/server/ctdb_server.c
+++ b/ctdb/server/ctdb_server.c
@@ -72,7 +72,7 @@ static int convert_node_map_to_list(struct ctdb_context *ctdb,
 				    struct ctdb_node ***nodes,
 				    uint32_t *num_nodes)
 {
-	int i;
+	unsigned int i;
 
 	*nodes = talloc_zero_array(mem_ctx,
 					struct ctdb_node *, node_map->num);
@@ -157,7 +157,7 @@ int ctdb_set_address(struct ctdb_context *ctdb, const char *address)
 */
 uint32_t ctdb_get_num_active_nodes(struct ctdb_context *ctdb)
 {
-	int i;
+	unsigned int i;
 	uint32_t count=0;
 	for (i=0; i < ctdb->num_nodes; i++) {
 		if (!(ctdb->nodes[i]->flags & NODE_FLAGS_INACTIVE)) {
@@ -383,7 +383,7 @@ static void ctdb_defer_packet(struct ctdb_context *ctdb, struct ctdb_req_header
 static void ctdb_broadcast_packet_all(struct ctdb_context *ctdb, 
 				      struct ctdb_req_header *hdr)
 {
-	int i;
+	unsigned int i;
 	for (i=0; i < ctdb->num_nodes; i++) {
 		if (ctdb->nodes[i]->flags & NODE_FLAGS_DELETED) {
 			continue;
@@ -399,7 +399,7 @@ static void ctdb_broadcast_packet_all(struct ctdb_context *ctdb,
 static void ctdb_broadcast_packet_active(struct ctdb_context *ctdb,
 					 struct ctdb_req_header *hdr)
 {
-	int i;
+	unsigned int i;
 	for (i = 0; i < ctdb->num_nodes; i++) {
 		if (ctdb->nodes[i]->flags & NODE_FLAGS_INACTIVE) {
 			continue;
@@ -416,7 +416,7 @@ static void ctdb_broadcast_packet_active(struct ctdb_context *ctdb,
 static void ctdb_broadcast_packet_connected(struct ctdb_context *ctdb, 
 					    struct ctdb_req_header *hdr)
 {
-	int i;
+	unsigned int i;
 	for (i=0; i < ctdb->num_nodes; i++) {
 		if (ctdb->nodes[i]->flags & NODE_FLAGS_DELETED) {
 			continue;
diff --git a/ctdb/server/ctdb_takeover.c b/ctdb/server/ctdb_takeover.c
index d8dc1c34af5..844e3c32866 100644
--- a/ctdb/server/ctdb_takeover.c
+++ b/ctdb/server/ctdb_takeover.c
@@ -75,9 +75,11 @@ struct ctdb_vnn {
 	ctdb_sock_addr public_address;
 	uint8_t public_netmask_bits;
 
-	/* the node number that is serving this public address, if any.
-	   If no node serves this ip it is set to -1 */
-	int32_t pnn;
+	/*
+	 * The node number that is serving this public address - set
+	 * to CTDB_UNKNOWN_PNN if node is serving it
+	 */
+	uint32_t pnn;
 
 	/* List of clients to tickle for this public address */
 	struct ctdb_tcp_array *tcp_array;
@@ -370,7 +372,7 @@ static void ctdb_control_send_arp(struct tevent_context *ev,
 {
 	struct ctdb_takeover_arp *arp = talloc_get_type(private_data, 
 							struct ctdb_takeover_arp);
-	int i, ret;
+	int ret;
 	struct ctdb_tcp_array *tcparray;
 	const char *iface = ctdb_vnn_iface_string(arp->vnn);
 
@@ -382,6 +384,8 @@ static void ctdb_control_send_arp(struct tevent_context *ev,
 
 	tcparray = arp->tcparray;
 	if (tcparray) {
+		unsigned int i;
+
 		for (i=0;i<tcparray->num;i++) {
 			struct ctdb_connection *tcon;
 
@@ -1366,7 +1370,7 @@ int32_t ctdb_control_tcp_client(struct ctdb_context *ctdb, uint32_t client_id,
 static struct ctdb_connection *ctdb_tcp_find(struct ctdb_tcp_array *array,
 					   struct ctdb_connection *tcp)
 {
-	int i;
+	unsigned int i;
 
 	if (array == NULL) {
 		return NULL;
@@ -1949,7 +1953,7 @@ int32_t ctdb_control_get_tcp_tickle_list(struct ctdb_context *ctdb, TDB_DATA ind
 	ctdb_sock_addr *addr = (ctdb_sock_addr *)indata.dptr;
 	struct ctdb_tickle_list_old *list;
 	struct ctdb_tcp_array *tcparray;
-	int num, i;
+	unsigned int num, i;
 	struct ctdb_vnn *vnn;
 	unsigned port;
 
@@ -2393,7 +2397,8 @@ static int ctdb_reloadips_child(struct ctdb_context *ctdb)
 	TDB_DATA data;
 	struct ctdb_client_control_state *state;
 	bool first_add;
-	int i, ret;
+	unsigned int i;
+	int ret;
 
 	CTDB_NO_MEMORY(ctdb, mem_ctx);
 
diff --git a/ctdb/server/ctdb_takeover_helper.c b/ctdb/server/ctdb_takeover_helper.c
index 9aa77d14f1d..8740838cfdd 100644
--- a/ctdb/server/ctdb_takeover_helper.c
+++ b/ctdb/server/ctdb_takeover_helper.c
@@ -692,7 +692,7 @@ struct takeover_state {
 	struct tevent_context *ev;
 	struct ctdb_client_context *client;
 	struct timeval timeout;
-	int num_nodes;
+	unsigned int num_nodes;
 	uint32_t *pnns_connected;
 	int num_connected;
 	uint32_t *pnns_active;
@@ -1076,8 +1076,8 @@ void takeover_failed(struct tevent_req *req, int ret)
 		req, struct takeover_state);
 	struct tevent_req *subreq;
 	uint32_t max_pnn = CTDB_UNKNOWN_PNN;
-	int max_credits = 0;
-	int pnn;
+	unsigned int max_credits = 0;
+	uint32_t pnn;
 
 	/* Check that bans are enabled */
 	if (state->tun_list->enable_bans == 0) {
diff --git a/ctdb/server/ctdb_traverse.c b/ctdb/server/ctdb_traverse.c
index 5ea19709599..4865dcc94f0 100644
--- a/ctdb/server/ctdb_traverse.c
+++ b/ctdb/server/ctdb_traverse.c
@@ -390,7 +390,7 @@ static struct ctdb_traverse_all_handle *ctdb_daemon_traverse_all(struct ctdb_db_
 		/* volatile database, traverse all active nodes */
 		destination = CTDB_BROADCAST_ACTIVE;
 	} else {
-		int i;
+		unsigned int i;
 		/* persistent database, traverse one node, preferably
 		 * the local one
 		 */
diff --git a/ctdb/server/ctdb_update_record.c b/ctdb/server/ctdb_update_record.c
index 04b6901ce55..405499c81e2 100644
--- a/ctdb/server/ctdb_update_record.c
+++ b/ctdb/server/ctdb_update_record.c
@@ -53,7 +53,8 @@ struct ctdb_persistent_write_state {
  */
 static int ctdb_persistent_store(struct ctdb_persistent_write_state *state)
 {
-	int ret, i;
+	unsigned int i;
+	int ret;
 	struct ctdb_rec_data_old *rec = NULL;
 	struct ctdb_marshall_buffer *m = state->m;
 
@@ -73,8 +74,10 @@ static int ctdb_persistent_store(struct ctdb_persistent_write_state *state)
 		rec = ctdb_marshall_loop_next(m, rec, NULL, &header, &key, &data);
 
 		if (rec == NULL) {
-			DEBUG(DEBUG_ERR,("Failed to get next record %d for db_id 0x%08x in ctdb_persistent_store\n",
-					 i, state->ctdb_db->db_id));
+			D_ERR("Failed to get next record %u for db_id 0x%08x "
+			      "in ctdb_persistent_store\n",
+			      i,
+			      state->ctdb_db->db_id);
 			talloc_free(tmp_ctx);
 			goto failed;
 		}
diff --git a/ctdb/server/ctdb_vacuum.c b/ctdb/server/ctdb_vacuum.c
index 9d086917f3c..0c3770267bc 100644
--- a/ctdb/server/ctdb_vacuum.c
+++ b/ctdb/server/ctdb_vacuum.c
@@ -655,7 +655,7 @@ static void ctdb_vacuum_traverse_db(struct ctdb_db_context *ctdb_db,
 static void ctdb_process_vacuum_fetch_lists(struct ctdb_db_context *ctdb_db,
 					    struct vacuum_data *vdata)
 {
-	int i;
+	unsigned int i;
 	struct ctdb_context *ctdb = ctdb_db->ctdb;
 
 	for (i = 0; i < ctdb->num_nodes; i++) {
@@ -924,7 +924,7 @@ static struct vacuum_data *ctdb_vacuum_init_vacuum_data(
 					struct ctdb_db_context *ctdb_db,
 					TALLOC_CTX *mem_ctx)
 {
-	int i;
+	unsigned int i;
 	struct ctdb_context *ctdb = ctdb_db->ctdb;
 	struct vacuum_data *vdata;
 
diff --git a/ctdb/server/eventscript.c b/ctdb/server/eventscript.c
index 801e8a85e66..e7a74468cc2 100644
--- a/ctdb/server/eventscript.c
+++ b/ctdb/server/eventscript.c
@@ -741,7 +741,7 @@ static bool event_allowed_during_recovery(enum ctdb_event event)
 		CTDB_EVENT_RELEASE_IP,
 		CTDB_EVENT_IPREALLOCATED,
 	};
-	int i;
+	size_t i;
 
 	for (i = 0; i < ARRAY_SIZE(allowed_events); i++) {
 		if (event == allowed_events[i]) {
-- 
2.20.1


From 432efd2db2576f321a798b794d8a1f598db131d9 Mon Sep 17 00:00:00 2001
From: Martin Schwenke <martin@meltin.net>
Date: Sat, 8 Jun 2019 06:40:12 +1000
Subject: [PATCH 04/32] ctdb-daemon: Fix signed/unsigned comparisons by casting

Signed-off-by: Martin Schwenke <martin@meltin.net>
---
 ctdb/server/ctdb_client.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/ctdb/server/ctdb_client.c b/ctdb/server/ctdb_client.c
index 419333025cb..dc7836abb2e 100644
--- a/ctdb/server/ctdb_client.c
+++ b/ctdb/server/ctdb_client.c
@@ -97,7 +97,9 @@ int ctdb_call_local(struct ctdb_db_context *ctdb_db, struct ctdb_call *call,
 	c->header = header;
 
 	for (fn=ctdb_db->calls;fn;fn=fn->next) {
-		if (fn->id == call->call_id) break;
+		if (fn->id == (uint32_t)call->call_id) {
+			break;
+		}
 	}
 	if (fn == NULL) {
 		ctdb_set_error(ctdb, "Unknown call id %u\n", call->call_id);
-- 
2.20.1


From 36111948e96a89c05605c64622be555c3137ff63 Mon Sep 17 00:00:00 2001
From: Martin Schwenke <martin@meltin.net>
Date: Sat, 8 Jun 2019 06:40:40 +1000
Subject: [PATCH 05/32] ctdb-daemon: Fix signed/unsigned comparisons by using
 constant

Signed-off-by: Martin Schwenke <martin@meltin.net>
---
 ctdb/server/ctdb_takeover.c        | 6 +++---
 ctdb/server/ctdb_takeover_helper.c | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/ctdb/server/ctdb_takeover.c b/ctdb/server/ctdb_takeover.c
index 844e3c32866..3ac569a953a 100644
--- a/ctdb/server/ctdb_takeover.c
+++ b/ctdb/server/ctdb_takeover.c
@@ -298,7 +298,7 @@ static void ctdb_vnn_unassign_iface(struct ctdb_context *ctdb,
 	}
 	vnn->iface = NULL;
 	if (vnn->pnn == ctdb->pnn) {
-		vnn->pnn = -1;
+		vnn->pnn = CTDB_UNKNOWN_PNN;
 	}
 }
 
@@ -772,7 +772,7 @@ int32_t ctdb_control_takeover_ip(struct ctdb_context *ctdb,
 		return -1;
 	}
 
-	if (vnn->pnn != ctdb->pnn && have_ip && vnn->pnn != -1) {
+	if (vnn->pnn != ctdb->pnn && have_ip && vnn->pnn != CTDB_UNKNOWN_PNN) {
 		DEBUG(DEBUG_CRIT,(__location__ " takeoverip of IP %s is known to the kernel, "
 				  "and we have it on iface[%s], but it was assigned to node %d"
 				  "and we are node %d, banning ourself\n",
@@ -782,7 +782,7 @@ int32_t ctdb_control_takeover_ip(struct ctdb_context *ctdb,
 		return -1;
 	}
 
-	if (vnn->pnn == -1 && have_ip) {
+	if (vnn->pnn == CTDB_UNKNOWN_PNN && have_ip) {
 		/* This will cause connections to be reset and
 		 * reestablished.  However, this is a very unusual
 		 * situation and doing this will completely repair the
diff --git a/ctdb/server/ctdb_takeover_helper.c b/ctdb/server/ctdb_takeover_helper.c
index 8740838cfdd..254b48f0759 100644
--- a/ctdb/server/ctdb_takeover_helper.c
+++ b/ctdb/server/ctdb_takeover_helper.c
@@ -466,7 +466,7 @@ static struct tevent_req *take_ip_send(TALLOC_CTX *mem_ctx,
 		struct take_ip_one_state *substate;
 		struct ctdb_public_ip ip;
 
-		if (tmp_ip->pnn == -1) {
+		if (tmp_ip->pnn == CTDB_UNKNOWN_PNN) {
 			/* IP will be unassigned */
 			continue;
 		}
-- 
2.20.1


From 698f518a3c26a05799484007c91a564bbab38ff2 Mon Sep 17 00:00:00 2001
From: Martin Schwenke <martin@meltin.net>
Date: Sat, 8 Jun 2019 06:41:15 +1000
Subject: [PATCH 06/32] ctdb-daemon: Drop unused values assigned to variable

Signed-off-by: Martin Schwenke <martin@meltin.net>
---
 ctdb/server/ctdb_takeover_helper.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/ctdb/server/ctdb_takeover_helper.c b/ctdb/server/ctdb_takeover_helper.c
index 254b48f0759..ab8fb9bbe24 100644
--- a/ctdb/server/ctdb_takeover_helper.c
+++ b/ctdb/server/ctdb_takeover_helper.c
@@ -160,7 +160,6 @@ static void get_public_ips_done(struct tevent_req *subreq)
 						&reply);
 	TALLOC_FREE(subreq);
 	if (! status) {
-		found_errors = false;
 		for (i = 0; i < state->count; i++) {
 			if (err_list[i] != 0) {
 				uint32_t pnn = state->pnns[i];
@@ -169,7 +168,6 @@ static void get_public_ips_done(struct tevent_req *subreq)
 				      "node %u, ret=%d\n", pnn, err_list[i]);
 
 				state->ban_credits[pnn]++;
-				found_errors = true;
 			}
 		}
 
-- 
2.20.1


From 35af0a265f1b55b4a7b18bd220899a2cb3591466 Mon Sep 17 00:00:00 2001
From: Martin Schwenke <martin@meltin.net>
Date: Sat, 8 Jun 2019 06:56:00 +1000
Subject: [PATCH 07/32] ctdb-cluster-mutex: Ensure that the configured command
 is not empty

... and does not just contain whitespace.

Otherwise NULL can be passed as the first argument to execv().

Signed-off-by: Martin Schwenke <martin@meltin.net>
---
 ctdb/server/ctdb_cluster_mutex.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/ctdb/server/ctdb_cluster_mutex.c b/ctdb/server/ctdb_cluster_mutex.c
index 2e3cb8112ad..719b5c14f7a 100644
--- a/ctdb/server/ctdb_cluster_mutex.c
+++ b/ctdb/server/ctdb_cluster_mutex.c
@@ -176,6 +176,10 @@ static bool cluster_mutex_helper_args_cmd(TALLOC_CTX *mem_ctx,
 		return false;
 	}
 	n = strv_count(strv);
+	if (n == 0) {
+		D_ERR("Mutex helper command is empty \"%s\"\n", argstring);
+		return false;
+	}
 
 	/* Extra slot for NULL */
 	args = talloc_array(mem_ctx, char *, n + 1);
-- 
2.20.1


From f4cbb6f0b5504783e280e613ed615f228a69e250 Mon Sep 17 00:00:00 2001
From: Martin Schwenke <martin@meltin.net>
Date: Wed, 26 Jun 2019 15:55:41 +1000
Subject: [PATCH 08/32] ctdb-tests: Fix signed/unsigned comparison by declaring
 as unsigned

Signed-off-by: Martin Schwenke <martin@meltin.net>
---
 ctdb/tests/src/ctdb_io_test.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/ctdb/tests/src/ctdb_io_test.c b/ctdb/tests/src/ctdb_io_test.c
index e3cb0a98ffe..56fc44f3b37 100644
--- a/ctdb/tests/src/ctdb_io_test.c
+++ b/ctdb/tests/src/ctdb_io_test.c
@@ -113,7 +113,8 @@ static void test2_callback(uint8_t *data, size_t length, void *private_data)
 static void test2(void)
 {
 	struct ctdb_context *ctdb;
-	int fd, ret, i;
+	int fd, ret;
+	size_t i;
 	uint32_t pkt_size;
 	char req[1024] = { 0 };
 
-- 
2.20.1


From d95abccf7e5a67533d57a6d2931e02036f45875b Mon Sep 17 00:00:00 2001
From: Martin Schwenke <martin@meltin.net>
Date: Fri, 21 Jun 2019 21:47:06 +1000
Subject: [PATCH 09/32] ctdb-tests: Declare variable for return value of
 write(2) as ssize_t

Signed-off-by: Martin Schwenke <martin@meltin.net>
---
 ctdb/tests/src/ctdb_io_test.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/ctdb/tests/src/ctdb_io_test.c b/ctdb/tests/src/ctdb_io_test.c
index 56fc44f3b37..f624d145d12 100644
--- a/ctdb/tests/src/ctdb_io_test.c
+++ b/ctdb/tests/src/ctdb_io_test.c
@@ -78,7 +78,8 @@ static void test1_callback(uint8_t *data, size_t length, void *private_data)
 static void test1(void)
 {
 	struct ctdb_context *ctdb;
-	int fd, ret;
+	int fd;
+	ssize_t ret;
 	uint32_t pkt_size;
 
 	test_setup(test1_callback, &fd, &ctdb, NULL);
@@ -113,7 +114,8 @@ static void test2_callback(uint8_t *data, size_t length, void *private_data)
 static void test2(void)
 {
 	struct ctdb_context *ctdb;
-	int fd, ret;
+	int fd;
+	ssize_t ret;
 	size_t i;
 	uint32_t pkt_size;
 	char req[1024] = { 0 };
@@ -188,7 +190,7 @@ static void test3(void)
 	char *request;
 	size_t req_len;
 	int fd;
-	int ret;
+	ssize_t ret;
 
 	test_setup(test_cb, &fd, &ctdb, &queue);
 	request = talloc_zero_size(queue, queue->buffer_size);
@@ -253,7 +255,7 @@ static void test4(void)
 	char *request;
 	size_t req_len;
 	int fd;
-	int ret;
+	ssize_t ret;
 
 	test_setup(test_cb, &fd, &ctdb, &queue);
 
-- 
2.20.1


From bd1ebda7292ac2cbcee92b91e59329f57172c98d Mon Sep 17 00:00:00 2001
From: Martin Schwenke <martin@meltin.net>
Date: Fri, 21 Jun 2019 21:16:18 +1000
Subject: [PATCH 10/32] ctdb-tests: Add a local variable for repeated
 calculation

This improves readability.  Also, the asserts involving this
expression get more complicated in the next commit, so this will keep
those asserts within a single line.

Signed-off-by: Martin Schwenke <martin@meltin.net>
---
 ctdb/tests/src/ctdb_io_test.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/ctdb/tests/src/ctdb_io_test.c b/ctdb/tests/src/ctdb_io_test.c
index f624d145d12..99c63f4de5d 100644
--- a/ctdb/tests/src/ctdb_io_test.c
+++ b/ctdb/tests/src/ctdb_io_test.c
@@ -253,7 +253,7 @@ static void test4(void)
 	struct ctdb_queue *queue;
 	uint32_t pkt_size;
 	char *request;
-	size_t req_len;
+	size_t req_len, half_buf_size;
 	int fd;
 	ssize_t ret;
 
@@ -268,8 +268,10 @@ static void test4(void)
 	ret = write(fd, &pkt_size, sizeof(pkt_size));
 	assert(ret == sizeof(pkt_size));
 
-	ret = write(fd, request, req_len - (queue->buffer_size >> 1));
-	assert(ret == req_len - (queue->buffer_size >> 1));
+	half_buf_size = queue->buffer_size >> 1;
+
+	ret = write(fd, request, req_len - half_buf_size);
+	assert(ret == req_len - half_buf_size);
 
 	/*
 	 * process...
@@ -286,8 +288,8 @@ static void test4(void)
 	assert(queue->buffer.size == pkt_size);
 
 	/* writing remaining data */
-	ret = write(fd, request, queue->buffer_size >> 1);
-	assert(ret == (queue->buffer_size >> 1));
+	ret = write(fd, request, half_buf_size);
+	assert(ret == half_buf_size);
 
 	/* process... */
 	tevent_loop_once(ctdb->ev);
@@ -301,13 +303,13 @@ static void test4(void)
 	assert(queue->buffer.size == 0);
 
 	/* writing new packet to verify standard buffer size */
-	pkt_size = sizeof(uint32_t) + (queue->buffer_size >> 1);
+	pkt_size = sizeof(uint32_t) + half_buf_size;
 
 	ret = write(fd, &pkt_size, sizeof(pkt_size));
 	assert(ret == sizeof(pkt_size));
 
-	ret = write(fd, request, (queue->buffer_size >> 1));
-	assert(ret == (queue->buffer_size >> 1));
+	ret = write(fd, request, half_buf_size);
+	assert(ret == half_buf_size);
 
 	/* process... */
 	tevent_loop_once(ctdb->ev);
-- 
2.20.1


From b2daa17f5226d29bc7fd764a88f483d2459961cf Mon Sep 17 00:00:00 2001
From: Martin Schwenke <martin@meltin.net>
Date: Wed, 26 Jun 2019 15:59:10 +1000
Subject: [PATCH 11/32] ctdb-tests: Fix signed/unsigned comparisons by casting

Signed-off-by: Martin Schwenke <martin@meltin.net>
---
 ctdb/tests/src/ctdb_io_test.c | 38 +++++++++++++++++------------------
 1 file changed, 19 insertions(+), 19 deletions(-)

diff --git a/ctdb/tests/src/ctdb_io_test.c b/ctdb/tests/src/ctdb_io_test.c
index 99c63f4de5d..d8f22162514 100644
--- a/ctdb/tests/src/ctdb_io_test.c
+++ b/ctdb/tests/src/ctdb_io_test.c
@@ -86,10 +86,10 @@ static void test1(void)
 
 	pkt_size = sizeof(uint32_t) + test1_req_len;
 	ret = write(fd, &pkt_size, sizeof(pkt_size));
-	assert(ret == sizeof(pkt_size));
+	assert(ret != -1 && (size_t)ret == sizeof(pkt_size));
 
 	ret = write(fd, test1_req, test1_req_len);
-	assert(ret == test1_req_len);
+	assert(ret != -1 && (size_t)ret == test1_req_len);
 
 	tevent_loop_once(ctdb->ev);
 
@@ -132,23 +132,23 @@ static void test2(void)
 
 	pkt_size = sizeof(uint32_t) + test2_req_len[0];
 	ret = write(fd, &pkt_size, sizeof(pkt_size));
-	assert(ret == sizeof(pkt_size));
+	assert(ret != -1 && (size_t)ret == sizeof(pkt_size));
 
 	ret = write(fd, req, test2_req_len[0]);
-	assert(ret == test2_req_len[0]);
+	assert(ret != -1 && (size_t)ret == test2_req_len[0]);
 
 	/*
 	 * request 1
 	 */
 	pkt_size = sizeof(uint32_t) + test2_req_len[1];
 	ret = write(fd, &pkt_size, sizeof(pkt_size));
-	assert(ret == sizeof(pkt_size));
+	assert(ret != -1 && (size_t)ret == sizeof(pkt_size));
 
 	/*
 	 * Omit the last byte to avoid buffer processing.
 	 */
 	ret = write(fd, req, test2_req_len[1] - 1);
-	assert(ret == test2_req_len[1] - 1);
+	assert(ret != -1 && (size_t)ret == test2_req_len[1] - 1);
 
 	tevent_loop_once(ctdb->ev);
 
@@ -156,17 +156,17 @@ static void test2(void)
 	 * Write the missing byte now.
 	 */
 	ret = write(fd, &req[test2_req_len[1] - 1], 1);
-	assert(ret == 1);
+	assert(ret != -1 && (size_t)ret == 1);
 
 	/*
 	 * request 2
 	 */
 	pkt_size = sizeof(uint32_t) + test2_req_len[2];
 	ret = write(fd, &pkt_size, sizeof(pkt_size));
-	assert(ret == sizeof(pkt_size));
+	assert(ret != -1 && (size_t)ret == sizeof(pkt_size));
 
 	ret = write(fd, req, test2_req_len[2]);
-	assert(ret == test2_req_len[2]);
+	assert(ret != -1 && (size_t)ret == test2_req_len[2]);
 
 	tevent_loop_once(ctdb->ev);
 	tevent_loop_once(ctdb->ev);
@@ -206,19 +206,19 @@ static void test3(void)
 	pkt_size = sizeof(uint32_t) + req_len;
 
 	ret = write(fd, &pkt_size, sizeof(pkt_size));
-	assert(ret == sizeof(pkt_size));
+	assert(ret != -1 && (size_t)ret == sizeof(pkt_size));
 
 	ret = write(fd, request, req_len);
-	assert(ret == req_len);
+	assert(ret != -1 && (size_t)ret == req_len);
 
 	/* writing second, incomplete packet */
 	pkt_size = sizeof(uint32_t) + req_len;
 
 	ret = write(fd, &pkt_size, sizeof(pkt_size));
-	assert(ret == sizeof(pkt_size));
+	assert(ret != -1 && (size_t)ret == sizeof(pkt_size));
 
 	ret = write(fd, request, req_len >> 1);
-	assert(ret == req_len >> 1);
+	assert(ret != -1 && (size_t)ret == req_len >> 1);
 
 	/* process...only 1st packet can be processed */
 	tevent_loop_once(ctdb->ev);
@@ -228,7 +228,7 @@ static void test3(void)
 
 	/* writing another few bytes of the still incomplete packet */
 	ret = write(fd, request, (req_len >> 1) - 1);
-	assert(ret == (req_len >> 1) - 1);
+	assert(ret != -1 && (size_t)ret == (req_len >> 1) - 1);
 
 	/*
 	 * the packet is still incomplete and connot be processed
@@ -266,12 +266,12 @@ static void test4(void)
 	pkt_size = sizeof(uint32_t) + req_len;
 
 	ret = write(fd, &pkt_size, sizeof(pkt_size));
-	assert(ret == sizeof(pkt_size));
+	assert(ret != -1 && (size_t)ret == sizeof(pkt_size));
 
 	half_buf_size = queue->buffer_size >> 1;
 
 	ret = write(fd, request, req_len - half_buf_size);
-	assert(ret == req_len - half_buf_size);
+	assert(ret != -1 && (size_t)ret == req_len - half_buf_size);
 
 	/*
 	 * process...
@@ -289,7 +289,7 @@ static void test4(void)
 
 	/* writing remaining data */
 	ret = write(fd, request, half_buf_size);
-	assert(ret == half_buf_size);
+	assert(ret != -1 && (size_t)ret == half_buf_size);
 
 	/* process... */
 	tevent_loop_once(ctdb->ev);
@@ -306,10 +306,10 @@ static void test4(void)
 	pkt_size = sizeof(uint32_t) + half_buf_size;
 
 	ret = write(fd, &pkt_size, sizeof(pkt_size));
-	assert(ret == sizeof(pkt_size));
+	assert(ret != -1 && (size_t)ret == sizeof(pkt_size));
 
 	ret = write(fd, request, half_buf_size);
-	assert(ret == half_buf_size);
+	assert(ret != -1 && (size_t)ret == half_buf_size);
 
 	/* process... */
 	tevent_loop_once(ctdb->ev);
-- 
2.20.1


From 8e5210261aba8122fd9f801544da73a09cc4d980 Mon Sep 17 00:00:00 2001
From: Martin Schwenke <martin@meltin.net>
Date: Fri, 21 Jun 2019 14:37:11 +1000
Subject: [PATCH 12/32] ctdb-tests: Fix signed/unsigned comparisons by
 declaring as unsigned

Change declarations of variable and parameters, usually loop variables
and limits, from int to unsigned int, size_t or uint32_t.

Signed-off-by: Martin Schwenke <martin@meltin.net>
---
 ctdb/tests/src/cluster_wait.c               |  6 ++--
 ctdb/tests/src/cluster_wait.h               |  2 +-
 ctdb/tests/src/comm_client_test.c           |  7 ++--
 ctdb/tests/src/comm_test.c                  |  6 ++--
 ctdb/tests/src/ctdb_packet_parse.c          |  2 +-
 ctdb/tests/src/errcode.c                    |  6 ++--
 ctdb/tests/src/event_script_test.c          |  3 +-
 ctdb/tests/src/fake_ctdbd.c                 | 19 +++++------
 ctdb/tests/src/fetch_ring.c                 |  6 ++--
 ctdb/tests/src/protocol_basic_test.c        |  3 +-
 ctdb/tests/src/protocol_common.c            | 36 ++++++++++-----------
 ctdb/tests/src/protocol_common_basic.c      |  4 +--
 ctdb/tests/src/protocol_ctdb_compat_test.c  |  2 +-
 ctdb/tests/src/protocol_ctdb_test.c         |  2 +-
 ctdb/tests/src/protocol_types_compat_test.c | 28 ++++++++--------
 ctdb/tests/src/run_event_test.c             |  6 ++--
 ctdb/tests/src/sigcode.c                    |  6 ++--
 17 files changed, 76 insertions(+), 68 deletions(-)

diff --git a/ctdb/tests/src/cluster_wait.c b/ctdb/tests/src/cluster_wait.c
index 8b0bb429e81..d411591765b 100644
--- a/ctdb/tests/src/cluster_wait.c
+++ b/ctdb/tests/src/cluster_wait.c
@@ -34,7 +34,7 @@
 struct cluster_wait_state {
 	struct tevent_context *ev;
 	struct ctdb_client_context *client;
-	int num_nodes;
+	uint32_t num_nodes;
 	bool *ready;
 	bool join_done;
 };
@@ -54,7 +54,7 @@ static void cluster_wait_sync_unregistered(struct tevent_req *subreq);
 struct tevent_req *cluster_wait_send(TALLOC_CTX *mem_ctx,
 				     struct tevent_context *ev,
 				     struct ctdb_client_context *client,
-				     int num_nodes)
+				     uint32_t num_nodes)
 {
 	struct tevent_req *req, *subreq;
 	struct cluster_wait_state *state;
@@ -213,7 +213,7 @@ static void cluster_wait_join_handler(uint64_t srvid, TDB_DATA data,
 		req, struct cluster_wait_state);
 	struct tevent_req *subreq;
 	uint32_t pnn;
-	int i;
+	uint32_t i;
 
 	if (srvid != MSG_ID_JOIN) {
 		return;
diff --git a/ctdb/tests/src/cluster_wait.h b/ctdb/tests/src/cluster_wait.h
index 20aa6e969ac..e0c64ccbfc6 100644
--- a/ctdb/tests/src/cluster_wait.h
+++ b/ctdb/tests/src/cluster_wait.h
@@ -23,7 +23,7 @@
 struct tevent_req *cluster_wait_send(TALLOC_CTX *mem_ctx,
 				     struct tevent_context *ev,
 				     struct ctdb_client_context *client,
-				     int num_nodes);
+				     uint32_t num_nodes);
 
 bool cluster_wait_recv(struct tevent_req *req, int *perr);
 
diff --git a/ctdb/tests/src/comm_client_test.c b/ctdb/tests/src/comm_client_test.c
index 8db219e6ee4..41ed5f7ad46 100644
--- a/ctdb/tests/src/comm_client_test.c
+++ b/ctdb/tests/src/comm_client_test.c
@@ -32,7 +32,7 @@ struct writer_state {
 	struct comm_context *comm;
 	uint8_t *buf;
 	size_t *pkt_size;
-	int count, id;
+	size_t count, id;
 };
 
 static void writer_done(struct tevent_req *subreq);
@@ -42,12 +42,13 @@ static void dead_handler(void *private_data);
 static struct tevent_req *writer_send(TALLOC_CTX *mem_ctx,
 				      struct tevent_context *ev,
 				      int fd, size_t *pkt_size,
-				      int count)
+				      size_t count)
 {
 	struct tevent_req *req, *subreq;
 	struct writer_state *state;
 	size_t max_size = 0, buflen;
-	int i, ret;
+	size_t i;
+	int ret;
 
 	for (i=0; i<count; i++) {
 		if (pkt_size[i] > max_size) {
diff --git a/ctdb/tests/src/comm_test.c b/ctdb/tests/src/comm_test.c
index 5e1d6945da1..4595928e919 100644
--- a/ctdb/tests/src/comm_test.c
+++ b/ctdb/tests/src/comm_test.c
@@ -265,12 +265,12 @@ static void test3_writer_next(struct tevent_req *subreq);
 static struct tevent_req *test3_writer_send(TALLOC_CTX *mem_ctx,
 					    struct tevent_context *ev,
 					    struct comm_context *comm,
-					    size_t *pkt_size, int count)
+					    size_t *pkt_size, size_t count)
 {
 	struct tevent_req *req, *subreq;
 	struct test3_writer_state *state;
 	size_t max_size = 0, buflen;
-	int i;
+	size_t i;
 
 	for (i=0; i<count; i++) {
 		if (pkt_size[i] > max_size) {
@@ -352,7 +352,7 @@ static void test3_writer_recv(struct tevent_req *req, int *perr)
 	*perr = 0;
 }
 
-static void test3_writer(int fd, size_t *pkt_size, int count)
+static void test3_writer(int fd, size_t *pkt_size, size_t count)
 {
 	TALLOC_CTX *mem_ctx;
 	struct tevent_context *ev;
diff --git a/ctdb/tests/src/ctdb_packet_parse.c b/ctdb/tests/src/ctdb_packet_parse.c
index 707d697d931..0b99b34b3ca 100644
--- a/ctdb/tests/src/ctdb_packet_parse.c
+++ b/ctdb/tests/src/ctdb_packet_parse.c
@@ -30,7 +30,7 @@
 static TDB_DATA strace_parser(char *buf, TALLOC_CTX *mem_ctx)
 {
 	TDB_DATA data;
-	int i = 0, j = 0;
+	size_t i = 0, j = 0;
 
 	data.dptr = talloc_size(mem_ctx, strlen(buf));
 	if (data.dptr == NULL) {
diff --git a/ctdb/tests/src/errcode.c b/ctdb/tests/src/errcode.c
index 90853624add..7343e818be2 100644
--- a/ctdb/tests/src/errcode.c
+++ b/ctdb/tests/src/errcode.c
@@ -127,7 +127,7 @@ struct {
 
 static void dump(void)
 {
-	int i;
+	size_t i;
 
 	for (i=0; i<ARRAY_SIZE(err_codes); i++) {
 		printf("%s %d\n", err_codes[i].label, err_codes[i].code);
@@ -137,7 +137,7 @@ static void dump(void)
 static void match_label(const char *str)
 {
 	int code = -1;
-	int i;
+	size_t i;
 
 	for (i=0; i<ARRAY_SIZE(err_codes); i++) {
 		if (strcasecmp(err_codes[i].label, str) == 0) {
@@ -152,7 +152,7 @@ static void match_label(const char *str)
 static void match_code(int code)
 {
 	const char *label = "UNKNOWN";
-	int i;
+	size_t i;
 
 	for (i=0; i<ARRAY_SIZE(err_codes); i++) {
 		if (err_codes[i].code == code) {
diff --git a/ctdb/tests/src/event_script_test.c b/ctdb/tests/src/event_script_test.c
index 73c974dbd39..a78e4005828 100644
--- a/ctdb/tests/src/event_script_test.c
+++ b/ctdb/tests/src/event_script_test.c
@@ -46,7 +46,8 @@ static void usage(const char *prog)
 static void do_list(TALLOC_CTX *mem_ctx, int argc, const char **argv)
 {
 	struct event_script_list *script_list = NULL;
-	int ret, i;
+	unsigned int i;
+	int ret;
 
 	if (argc != 3) {
 		usage(argv[0]);
diff --git a/ctdb/tests/src/fake_ctdbd.c b/ctdb/tests/src/fake_ctdbd.c
index 899d05f30d5..6736d5dcdd0 100644
--- a/ctdb/tests/src/fake_ctdbd.c
+++ b/ctdb/tests/src/fake_ctdbd.c
@@ -1300,7 +1300,7 @@ fail:
 static bool ctdbd_verify(struct ctdbd_context *ctdb)
 {
 	struct node *node;
-	int i;
+	unsigned int i;
 
 	if (ctdb->node_map->num_nodes == 0) {
 		return true;
@@ -1370,7 +1370,7 @@ static int recover_check(struct tevent_req *req)
 	struct ctdbd_context *ctdb = state->ctdb;
 	struct tevent_req *subreq;
 	bool recovery_disabled;
-	int i;
+	unsigned int i;
 
 	recovery_disabled = false;
 	for (i=0; i<ctdb->node_map->num_nodes; i++) {
@@ -1833,7 +1833,7 @@ static void control_get_dbmap(TALLOC_CTX *mem_ctx,
 	struct ctdb_reply_control reply;
 	struct ctdb_dbid_map *dbmap;
 	struct database *db;
-	int i;
+	unsigned int i;
 
 	reply.rdata.opcode = request->opcode;
 
@@ -2377,7 +2377,7 @@ static void control_reload_nodes_file(TALLOC_CTX *mem_ctx,
 	struct ctdb_reply_control reply;
 	struct ctdb_node_map *nodemap;
 	struct node_map *node_map = ctdb->node_map;
-	int i;
+	unsigned int i;
 
 	reply.rdata.opcode = request->opcode;
 
@@ -2493,7 +2493,7 @@ static void control_release_ip(TALLOC_CTX *mem_ctx,
 	struct ctdb_reply_control reply;
 	struct ctdb_public_ip_list *ips = NULL;
 	struct ctdb_public_ip *t = NULL;
-	int i;
+	unsigned int i;
 
 	reply.rdata.opcode = request->opcode;
 
@@ -2559,7 +2559,7 @@ static void control_takeover_ip(TALLOC_CTX *mem_ctx,
 	struct ctdb_reply_control reply;
 	struct ctdb_public_ip_list *ips = NULL;
 	struct ctdb_public_ip *t = NULL;
-	int i;
+	unsigned int i;
 
 	reply.rdata.opcode = request->opcode;
 
@@ -2663,7 +2663,7 @@ static void control_get_nodemap(TALLOC_CTX *mem_ctx,
 	struct ctdb_reply_control reply;
 	struct ctdb_node_map *nodemap;
 	struct node *node;
-	int i;
+	unsigned int i;
 
 	reply.rdata.opcode = request->opcode;
 
@@ -2954,7 +2954,7 @@ static struct ctdb_iface_list *get_ctdb_iface_list(TALLOC_CTX *mem_ctx,
 {
 	struct ctdb_iface_list *iface_list;
 	struct interface *iface;
-	int i;
+	unsigned int i;
 
 	iface_list = talloc_zero(mem_ctx, struct ctdb_iface_list);
 	if (iface_list == NULL) {
@@ -3745,7 +3745,8 @@ static void client_read_handler(uint8_t *buf, size_t buflen,
 	struct ctdbd_context *ctdb = state->ctdb;
 	struct ctdb_req_header header;
 	size_t np;
-	int ret, i;
+	unsigned int i;
+	int ret;
 
 	ret = ctdb_req_header_pull(buf, buflen, &header, &np);
 	if (ret != 0) {
diff --git a/ctdb/tests/src/fetch_ring.c b/ctdb/tests/src/fetch_ring.c
index f746e789511..a8d103ed3f2 100644
--- a/ctdb/tests/src/fetch_ring.c
+++ b/ctdb/tests/src/fetch_ring.c
@@ -33,7 +33,7 @@
 
 #define MSG_ID_FETCH	0
 
-static uint32_t next_node(struct ctdb_client_context *client, int num_nodes)
+static uint32_t next_node(struct ctdb_client_context *client, uint32_t num_nodes)
 {
 	return (ctdb_client_pnn(client) + 1) % num_nodes;
 }
@@ -42,7 +42,7 @@ struct fetch_ring_state {
 	struct tevent_context *ev;
 	struct ctdb_client_context *client;
 	struct ctdb_db_context *ctdb_db;
-	int num_nodes;
+	uint32_t num_nodes;
 	int timelimit;
 	int interactive;
 	TDB_DATA key;
@@ -63,7 +63,7 @@ static struct tevent_req *fetch_ring_send(TALLOC_CTX *mem_ctx,
 					  struct tevent_context *ev,
 					  struct ctdb_client_context *client,
 					  struct ctdb_db_context *ctdb_db,
-					  int num_nodes, int timelimit,
+					  uint32_t num_nodes, int timelimit,
 					  int interactive)
 {
 	struct tevent_req *req, *subreq;
diff --git a/ctdb/tests/src/protocol_basic_test.c b/ctdb/tests/src/protocol_basic_test.c
index 4bacb47ada3..215c0829854 100644
--- a/ctdb/tests/src/protocol_basic_test.c
+++ b/ctdb/tests/src/protocol_basic_test.c
@@ -36,7 +36,8 @@ static void test_ctdb_chararray(void)
 	size_t len = rand_int(1000) + 1;
 	char p1[len], p2[len];
 	size_t buflen, np = 0;
-	int i, ret;
+	size_t i;
+	int ret;
 
 	for (i=0; i<len-1; i++) {
 		p1[i] = 'A' + rand_int(26);
diff --git a/ctdb/tests/src/protocol_common.c b/ctdb/tests/src/protocol_common.c
index 781947d13d1..73e9a8c5d0d 100644
--- a/ctdb/tests/src/protocol_common.c
+++ b/ctdb/tests/src/protocol_common.c
@@ -218,7 +218,7 @@ void verify_ctdb_statistics(struct ctdb_statistics *p1,
 
 void fill_ctdb_vnn_map(TALLOC_CTX *mem_ctx, struct ctdb_vnn_map *p)
 {
-	int i;
+	unsigned int i;
 
 	p->generation = rand32();
 	p->size = rand_int(20);
@@ -236,7 +236,7 @@ void fill_ctdb_vnn_map(TALLOC_CTX *mem_ctx, struct ctdb_vnn_map *p)
 
 void verify_ctdb_vnn_map(struct ctdb_vnn_map *p1, struct ctdb_vnn_map *p2)
 {
-	int i;
+	unsigned int i;
 
 	assert(p1->generation == p2->generation);
 	assert(p1->size == p2->size);
@@ -259,7 +259,7 @@ void verify_ctdb_dbid(struct ctdb_dbid *p1, struct ctdb_dbid *p2)
 
 void fill_ctdb_dbid_map(TALLOC_CTX *mem_ctx, struct ctdb_dbid_map *p)
 {
-	int i;
+	unsigned int i;
 
 	p->num = rand_int(40);
 	if (p->num > 0) {
@@ -275,7 +275,7 @@ void fill_ctdb_dbid_map(TALLOC_CTX *mem_ctx, struct ctdb_dbid_map *p)
 
 void verify_ctdb_dbid_map(struct ctdb_dbid_map *p1, struct ctdb_dbid_map *p2)
 {
-	int i;
+	unsigned int i;
 
 	assert(p1->num == p2->num);
 	for (i=0; i<p1->num; i++) {
@@ -714,7 +714,7 @@ void verify_ctdb_tunable_list(struct ctdb_tunable_list *p1,
 
 void fill_ctdb_tickle_list(TALLOC_CTX *mem_ctx, struct ctdb_tickle_list *p)
 {
-	int i;
+	unsigned int i;
 
 	fill_ctdb_sock_addr(mem_ctx, &p->addr);
 	p->num = rand_int(1000);
@@ -732,7 +732,7 @@ void fill_ctdb_tickle_list(TALLOC_CTX *mem_ctx, struct ctdb_tickle_list *p)
 void verify_ctdb_tickle_list(struct ctdb_tickle_list *p1,
 			     struct ctdb_tickle_list *p2)
 {
-	int i;
+	unsigned int i;
 
 	verify_ctdb_sock_addr(&p1->addr, &p2->addr);
 	assert(p1->num == p2->num);
@@ -806,7 +806,7 @@ void verify_ctdb_public_ip(struct ctdb_public_ip *p1,
 void fill_ctdb_public_ip_list(TALLOC_CTX *mem_ctx,
 			      struct ctdb_public_ip_list *p)
 {
-	int i;
+	unsigned int i;
 
 	p->num = rand_int(32);
 	if (p->num > 0) {
@@ -823,7 +823,7 @@ void fill_ctdb_public_ip_list(TALLOC_CTX *mem_ctx,
 void verify_ctdb_public_ip_list(struct ctdb_public_ip_list *p1,
 				struct ctdb_public_ip_list *p2)
 {
-	int i;
+	unsigned int i;
 
 	assert(p1->num == p2->num);
 	for (i=0; i<p1->num; i++) {
@@ -849,7 +849,7 @@ void verify_ctdb_node_and_flags(struct ctdb_node_and_flags *p1,
 
 void fill_ctdb_node_map(TALLOC_CTX *mem_ctx, struct ctdb_node_map *p)
 {
-	int i;
+	unsigned int i;
 
 	p->num = rand_int(32);
 	if (p->num > 0) {
@@ -866,7 +866,7 @@ void fill_ctdb_node_map(TALLOC_CTX *mem_ctx, struct ctdb_node_map *p)
 
 void verify_ctdb_node_map(struct ctdb_node_map *p1, struct ctdb_node_map *p2)
 {
-	int i;
+	unsigned int i;
 
 	assert(p1->num == p2->num);
 	for (i=0; i<p1->num; i++) {
@@ -894,7 +894,7 @@ void verify_ctdb_script(struct ctdb_script *p1, struct ctdb_script *p2)
 
 void fill_ctdb_script_list(TALLOC_CTX *mem_ctx, struct ctdb_script_list *p)
 {
-	int i;
+	unsigned int i;
 
 	p->num_scripts = rand_int(32);
 	if (p->num_scripts > 0) {
@@ -912,7 +912,7 @@ void fill_ctdb_script_list(TALLOC_CTX *mem_ctx, struct ctdb_script_list *p)
 void verify_ctdb_script_list(struct ctdb_script_list *p1,
 			     struct ctdb_script_list *p2)
 {
-	int i;
+	unsigned int i;
 
 	assert(p1->num_scripts == p2->num_scripts);
 	for (i=0; i<p1->num_scripts; i++) {
@@ -962,7 +962,7 @@ void verify_ctdb_iface(struct ctdb_iface *p1, struct ctdb_iface *p2)
 
 void fill_ctdb_iface_list(TALLOC_CTX *mem_ctx, struct ctdb_iface_list *p)
 {
-	int i;
+	unsigned int i;
 
 	p->num = rand_int(32);
 	if (p->num > 0) {
@@ -979,7 +979,7 @@ void fill_ctdb_iface_list(TALLOC_CTX *mem_ctx, struct ctdb_iface_list *p)
 void verify_ctdb_iface_list(struct ctdb_iface_list *p1,
 			    struct ctdb_iface_list *p2)
 {
-	int i;
+	unsigned int i;
 
 	assert(p1->num == p2->num);
 	for (i=0; i<p1->num; i++) {
@@ -1052,7 +1052,7 @@ void verify_ctdb_key_data(struct ctdb_key_data *p1, struct ctdb_key_data *p2)
 void fill_ctdb_db_statistics(TALLOC_CTX *mem_ctx,
 			     struct ctdb_db_statistics *p)
 {
-	int i;
+	unsigned int i;
 
 	p->locks.num_calls = rand32();
 	p->locks.num_current = rand32();
@@ -1081,7 +1081,7 @@ void fill_ctdb_db_statistics(TALLOC_CTX *mem_ctx,
 void verify_ctdb_db_statistics(struct ctdb_db_statistics *p1,
 			       struct ctdb_db_statistics *p2)
 {
-	int i;
+	unsigned int i;
 
 	assert(p1->locks.num_calls == p2->locks.num_calls);
 	assert(p1->locks.num_current == p2->locks.num_current);
@@ -1199,7 +1199,7 @@ void verify_ctdb_g_lock(struct ctdb_g_lock *p1, struct ctdb_g_lock *p2)
 
 void fill_ctdb_g_lock_list(TALLOC_CTX *mem_ctx, struct ctdb_g_lock_list *p)
 {
-	int i;
+	unsigned int i;
 
 	p->num = rand_int(20) + 1;
 	p->lock = talloc_zero_array(mem_ctx, struct ctdb_g_lock, p->num);
@@ -1212,7 +1212,7 @@ void fill_ctdb_g_lock_list(TALLOC_CTX *mem_ctx, struct ctdb_g_lock_list *p)
 void verify_ctdb_g_lock_list(struct ctdb_g_lock_list *p1,
 			     struct ctdb_g_lock_list *p2)
 {
-	int i;
+	unsigned int i;
 
 	assert(p1->num == p2->num);
 	for (i=0; i<p1->num; i++) {
diff --git a/ctdb/tests/src/protocol_common_basic.c b/ctdb/tests/src/protocol_common_basic.c
index cbc59606629..b8b82fd298c 100644
--- a/ctdb/tests/src/protocol_common_basic.c
+++ b/ctdb/tests/src/protocol_common_basic.c
@@ -70,7 +70,7 @@ double rand_double(void)
 
 void fill_buffer(void *p, size_t len)
 {
-	int i;
+	size_t i;
 	uint8_t *ptr = p;
 
 	for (i=0; i<len; i++) {
@@ -87,7 +87,7 @@ void verify_buffer(void *p1, void *p2, size_t len)
 
 void fill_string(char *p, size_t len)
 {
-	int i;
+	size_t i;
 
 	for (i=0; i<len-1; i++) {
 		p[i] = 'A' + rand_int(26);
diff --git a/ctdb/tests/src/protocol_ctdb_compat_test.c b/ctdb/tests/src/protocol_ctdb_compat_test.c
index f0235ddc9fa..77e10ef6d8f 100644
--- a/ctdb/tests/src/protocol_ctdb_compat_test.c
+++ b/ctdb/tests/src/protocol_ctdb_compat_test.c
@@ -1236,7 +1236,7 @@ int main(int argc, char *argv[])
 		CTDB_SRVID_DISABLE_RECOVERIES,
 		CTDB_SRVID_DISABLE_IP_CHECK,
 	};
-	int i;
+	unsigned int i;
 
 	if (argc == 2) {
 		int seed = atoi(argv[1]);
diff --git a/ctdb/tests/src/protocol_ctdb_test.c b/ctdb/tests/src/protocol_ctdb_test.c
index cb268679c41..9eb25d96186 100644
--- a/ctdb/tests/src/protocol_ctdb_test.c
+++ b/ctdb/tests/src/protocol_ctdb_test.c
@@ -328,7 +328,7 @@ int main(int argc, char *argv[])
 		CTDB_SRVID_DISABLE_RECOVERIES,
 		CTDB_SRVID_DISABLE_IP_CHECK,
 	};
-	int i;
+	size_t i;
 
 	if (argc == 2) {
 		int seed = atoi(argv[1]);
diff --git a/ctdb/tests/src/protocol_types_compat_test.c b/ctdb/tests/src/protocol_types_compat_test.c
index 59d6958a568..0f1e548d099 100644
--- a/ctdb/tests/src/protocol_types_compat_test.c
+++ b/ctdb/tests/src/protocol_types_compat_test.c
@@ -967,7 +967,7 @@ static void ctdb_tickle_list_push_old(struct ctdb_tickle_list *in,
 	struct ctdb_tickle_list_wire *wire =
 		(struct ctdb_tickle_list_wire *)buf;
 	size_t offset;
-	int i;
+	unsigned int i;
 
 	memcpy(&wire->addr, &in->addr, sizeof(ctdb_sock_addr));
 	wire->num = in->num;
@@ -987,7 +987,8 @@ static int ctdb_tickle_list_pull_old(uint8_t *buf, size_t buflen,
 	struct ctdb_tickle_list_wire *wire =
 		(struct ctdb_tickle_list_wire *)buf;
 	size_t offset;
-	int i, ret;
+	unsigned int i;
+	int ret;
 
 	if (buflen < offsetof(struct ctdb_tickle_list_wire, conn)) {
 		return EMSGSIZE;
@@ -1220,7 +1221,7 @@ struct ctdb_public_ip_list_wire {
 
 static size_t ctdb_public_ip_list_len_old(struct ctdb_public_ip_list *in)
 {
-	int i;
+	unsigned int i;
 	size_t len;
 
 	len = sizeof(uint32_t);
@@ -1236,7 +1237,7 @@ static void ctdb_public_ip_list_push_old(struct ctdb_public_ip_list *in,
 	struct ctdb_public_ip_list_wire *wire =
 		(struct ctdb_public_ip_list_wire *)buf;
 	size_t offset;
-	int i;
+	unsigned int i;
 
 	wire->num = in->num;
 
@@ -1255,7 +1256,7 @@ static int ctdb_public_ip_list_pull_old(uint8_t *buf, size_t buflen,
 	struct ctdb_public_ip_list_wire *wire =
 		(struct ctdb_public_ip_list_wire *)buf;
 	size_t offset;
-	int i;
+	unsigned int i;
 	bool ret;
 
 	if (buflen < sizeof(uint32_t)) {
@@ -1368,7 +1369,7 @@ static void ctdb_node_map_push_old(struct ctdb_node_map *in, uint8_t *buf)
 {
 	struct ctdb_node_map_wire *wire = (struct ctdb_node_map_wire *)buf;
 	size_t offset;
-	int i;
+	unsigned int i;
 
 	wire->num = in->num;
 
@@ -1386,7 +1387,7 @@ static int ctdb_node_map_pull_old(uint8_t *buf, size_t buflen,
 	struct ctdb_node_map *val;
 	struct ctdb_node_map_wire *wire = (struct ctdb_node_map_wire *)buf;
 	size_t offset;
-	int i;
+	unsigned int i;
 	bool ret;
 
 	if (buflen < sizeof(uint32_t)) {
@@ -1484,7 +1485,7 @@ struct ctdb_script_list_wire {
 
 static size_t ctdb_script_list_len_old(struct ctdb_script_list *in)
 {
-	int i;
+	unsigned int i;
 	size_t len;
 
 	if (in == NULL) {
@@ -1504,7 +1505,7 @@ static void ctdb_script_list_push_old(struct ctdb_script_list *in,
 	struct ctdb_script_list_wire *wire =
 		(struct ctdb_script_list_wire *)buf;
 	size_t offset;
-	int i;
+	unsigned int i;
 
 	if (in == NULL) {
 		return;
@@ -1527,7 +1528,7 @@ static int ctdb_script_list_pull_old(uint8_t *buf, size_t buflen,
 	struct ctdb_script_list_wire *wire =
 		(struct ctdb_script_list_wire *)buf;
 	size_t offset;
-	int i;
+	unsigned int i;
 	bool ret;
 
 	/* If event scripts have never been run, the result will be NULL */
@@ -2024,7 +2025,7 @@ static int ctdb_db_statistics_pull_old(uint8_t *buf, size_t buflen,
 	struct ctdb_db_statistics_wire *wire =
 		(struct ctdb_db_statistics_wire *)buf;
 	size_t offset;
-	int i;
+	unsigned int i;
 
 	if (buflen < sizeof(struct ctdb_db_statistics)) {
 		return EMSGSIZE;
@@ -2220,7 +2221,7 @@ static void ctdb_g_lock_list_push_old(struct ctdb_g_lock_list *in,
 				      uint8_t *buf)
 {
 	size_t offset = 0;
-	int i;
+	unsigned int i;
 
 	for (i=0; i<in->num; i++) {
 		ctdb_g_lock_push_old(&in->lock[i], &buf[offset]);
@@ -2235,7 +2236,8 @@ static int ctdb_g_lock_list_pull_old(uint8_t *buf, size_t buflen,
 	struct ctdb_g_lock_list *val;
 	unsigned count;
 	size_t offset;
-	int ret, i;
+	unsigned int i;
+	int ret;
 
 	val = talloc_zero(mem_ctx, struct ctdb_g_lock_list);
 	if (val == NULL) {
diff --git a/ctdb/tests/src/run_event_test.c b/ctdb/tests/src/run_event_test.c
index 8b5dcd7beef..cfe5f161d1d 100644
--- a/ctdb/tests/src/run_event_test.c
+++ b/ctdb/tests/src/run_event_test.c
@@ -60,7 +60,8 @@ static void do_run(TALLOC_CTX *mem_ctx, struct tevent_context *ev,
 	struct timeval timeout;
 	struct run_event_script_list *script_list = NULL;
 	char *arg_str;
-	int ret, t, i;
+	unsigned int i;
+	int ret, t;
 	bool status;
 
 	if (argc < 5) {
@@ -115,7 +116,8 @@ static void do_list(TALLOC_CTX *mem_ctx, struct tevent_context *ev,
 		    int argc, const char **argv)
 {
 	struct run_event_script_list *script_list = NULL;
-	int ret, i;
+	unsigned int i;
+	int ret;
 
 	ret = run_event_list(run_ctx, mem_ctx, &script_list);
 	if (ret != 0) {
diff --git a/ctdb/tests/src/sigcode.c b/ctdb/tests/src/sigcode.c
index 1318d246891..9e5ed819f8e 100644
--- a/ctdb/tests/src/sigcode.c
+++ b/ctdb/tests/src/sigcode.c
@@ -58,7 +58,7 @@ struct {
 
 static void dump(void)
 {
-	int i;
+	size_t i;
 
 	for (i=0; i<ARRAY_SIZE(sig_codes); i++) {
 		printf("%s %d\n", sig_codes[i].label, sig_codes[i].code);
@@ -68,7 +68,7 @@ static void dump(void)
 static void match_label(const char *str)
 {
 	int code = -1;
-	int i;
+	size_t i;
 
 	for (i=0; i<ARRAY_SIZE(sig_codes); i++) {
 		if (strcasecmp(sig_codes[i].label, str) == 0) {
@@ -83,7 +83,7 @@ static void match_label(const char *str)
 static void match_code(int code)
 {
 	const char *label = "UNKNOWN";
-	int i;
+	size_t i;
 
 	for (i=0; i<ARRAY_SIZE(sig_codes); i++) {
 		if (sig_codes[i].code == code) {
-- 
2.20.1


From 2ad90e56bd7d7b8164e770fe7b642c1d734e0859 Mon Sep 17 00:00:00 2001
From: Martin Schwenke <martin@meltin.net>
Date: Fri, 21 Jun 2019 14:39:20 +1000
Subject: [PATCH 13/32] ctdb-tests: Fix signed/unsigned comparisons by casting

These are all cases comparing a number of bytes written (int or
ssize_t) with a size_t, so casting to size_t is appropriate.

Signed-off-by: Martin Schwenke <martin@meltin.net>
---
 ctdb/tests/src/conf_test.c          | 2 +-
 ctdb/tests/src/line_test.c          | 2 +-
 ctdb/tests/src/pkt_write_test.c     | 2 +-
 ctdb/tests/src/sock_io_test.c       | 2 +-
 ctdb/tests/src/system_socket_test.c | 4 ++--
 5 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/ctdb/tests/src/conf_test.c b/ctdb/tests/src/conf_test.c
index b727cf34406..9b3bd8f0cc1 100644
--- a/ctdb/tests/src/conf_test.c
+++ b/ctdb/tests/src/conf_test.c
@@ -418,7 +418,7 @@ static void test11(const char *filename)
 	bool status;
 
 	ret = snprintf(reload, sizeof(reload), "%s.reload", filename);
-	assert(ret < sizeof(reload));
+	assert((size_t)ret < sizeof(reload));
 
 	ret = conf_init(mem_ctx, &conf);
 	assert(ret == 0);
diff --git a/ctdb/tests/src/line_test.c b/ctdb/tests/src/line_test.c
index 0c5a8211392..806d8836e5f 100644
--- a/ctdb/tests/src/line_test.c
+++ b/ctdb/tests/src/line_test.c
@@ -72,7 +72,7 @@ int main(int argc, const char **argv)
 
 		while (1) {
 			n = read(fd, buffer, sizeof(buffer));
-			assert(n >= 0 && n <= sizeof(buffer));
+			assert(n >= 0 && (size_t)n <= sizeof(buffer));
 
 			if (n == 0) {
 				break;
diff --git a/ctdb/tests/src/pkt_write_test.c b/ctdb/tests/src/pkt_write_test.c
index 3872670880d..dae92a5043a 100644
--- a/ctdb/tests/src/pkt_write_test.c
+++ b/ctdb/tests/src/pkt_write_test.c
@@ -84,7 +84,7 @@ static void writer_next(struct tevent_req *subreq)
 		return;
 	}
 
-	if (nwritten != state->buflen) {
+	if ((size_t)nwritten != state->buflen) {
 		tevent_req_error(req, EIO);
 		return;
 	}
diff --git a/ctdb/tests/src/sock_io_test.c b/ctdb/tests/src/sock_io_test.c
index d0048c18220..d0e424f5620 100644
--- a/ctdb/tests/src/sock_io_test.c
+++ b/ctdb/tests/src/sock_io_test.c
@@ -170,7 +170,7 @@ static void test2_reader(int fd)
 			return;
 		}
 
-		assert(n == pkt_len);
+		assert((size_t)n == pkt_len);
 		pkt_len += 10;
 	}
 }
diff --git a/ctdb/tests/src/system_socket_test.c b/ctdb/tests/src/system_socket_test.c
index b3959576b5e..da962f00a2c 100644
--- a/ctdb/tests/src/system_socket_test.c
+++ b/ctdb/tests/src/system_socket_test.c
@@ -82,7 +82,7 @@ static void test_arp(const char *addr_str, const char *hwaddr_str, bool reply)
 	assert(ret == 0);
 
 	num_written = write(STDOUT_FILENO, buf, len);
-	assert(num_written == len);
+	assert(num_written != -1 && (size_t)num_written == len);
 }
 
 #else /* HAVE_PACKETSOCKET  */
@@ -162,7 +162,7 @@ static void test_tcp(const char *src_str,
 	num_written = write(STDOUT_FILENO,
 			    buf + sizeof(struct ether_header),
 			    len);
-	assert(num_written == len);
+	assert(num_written != -1 && (size_t)num_written == len);
 
 	switch (ntohs(eth->ether_type)) {
 	case ETHERTYPE_IP:
-- 
2.20.1


From d5436f3d5f6fe45f8e3d3e0e4aedf3f4247549ed Mon Sep 17 00:00:00 2001
From: Martin Schwenke <martin@meltin.net>
Date: Fri, 21 Jun 2019 14:41:38 +1000
Subject: [PATCH 14/32] ctdb-tests: Don't compare an unsigned value with -1

The dummy reader should never be called, so contains an assert on the
buffer length that should always trigger.  Just abort() instead.

Signed-off-by: Martin Schwenke <martin@meltin.net>
---
 ctdb/tests/src/sock_io_test.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/ctdb/tests/src/sock_io_test.c b/ctdb/tests/src/sock_io_test.c
index d0e424f5620..ba4b6377d6d 100644
--- a/ctdb/tests/src/sock_io_test.c
+++ b/ctdb/tests/src/sock_io_test.c
@@ -178,7 +178,7 @@ static void test2_reader(int fd)
 static void test2_dummy_reader(uint8_t *buf, size_t buflen,
 			       void *private_data)
 {
-	assert(buflen == -1);
+	abort();
 }
 
 static void test2_writer(struct sock_queue *queue)
-- 
2.20.1


From 109b08c52fad1f69a8fd44474effb52ef656a3c7 Mon Sep 17 00:00:00 2001
From: Martin Schwenke <martin@meltin.net>
Date: Fri, 21 Jun 2019 16:08:58 +1000
Subject: [PATCH 15/32] ctdb-tests: Avoid warning about NULL dereference

Static analysis finds that earlier in the call path, ctdb_string_len()
checks for NULL, so complains that a NULL value can be passed to
strlen() here.  Avoid this by adding an assert().

Signed-off-by: Martin Schwenke <martin@meltin.net>
---
 ctdb/tests/src/protocol_types_compat_test.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/ctdb/tests/src/protocol_types_compat_test.c b/ctdb/tests/src/protocol_types_compat_test.c
index 0f1e548d099..59aef825b72 100644
--- a/ctdb/tests/src/protocol_types_compat_test.c
+++ b/ctdb/tests/src/protocol_types_compat_test.c
@@ -838,6 +838,7 @@ static size_t ctdb_var_list_len_old(struct ctdb_var_list *in)
 	size_t len = sizeof(uint32_t);
 
 	for (i=0; i<in->count; i++) {
+		assert(in->var[i] != NULL);
 		len += strlen(in->var[i]) + 1;
 	}
 	return len;
-- 
2.20.1


From 90f3db71f8b10c8706a8ed071f1899336d7a7a18 Mon Sep 17 00:00:00 2001
From: Martin Schwenke <martin@meltin.net>
Date: Sat, 22 Jun 2019 05:29:53 +1000
Subject: [PATCH 16/32] ctdb-tcp: Fix signed/unsigned comparisons by declaring
 as unsigned

Signed-off-by: Martin Schwenke <martin@meltin.net>
---
 ctdb/tcp/tcp_connect.c | 3 ++-
 ctdb/tcp/tcp_init.c    | 4 ++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/ctdb/tcp/tcp_connect.c b/ctdb/tcp/tcp_connect.c
index 385547e0e78..a8fca530470 100644
--- a/ctdb/tcp/tcp_connect.c
+++ b/ctdb/tcp/tcp_connect.c
@@ -300,7 +300,8 @@ static int ctdb_tcp_listen_automatic(struct ctdb_context *ctdb)
 	struct ctdb_tcp *ctcp = talloc_get_type(ctdb->private_data,
 						struct ctdb_tcp);
         ctdb_sock_addr sock;
-	int lock_fd, i;
+	int lock_fd;
+	unsigned int i;
 	const char *lock_path = CTDB_RUNDIR "/.socket_lock";
 	struct flock lock;
 	int one = 1;
diff --git a/ctdb/tcp/tcp_init.c b/ctdb/tcp/tcp_init.c
index b6083666e18..87d628aba93 100644
--- a/ctdb/tcp/tcp_init.c
+++ b/ctdb/tcp/tcp_init.c
@@ -70,7 +70,7 @@ static int ctdb_tcp_add_node(struct ctdb_node *node)
 */
 static int ctdb_tcp_initialise(struct ctdb_context *ctdb)
 {
-	int i;
+	unsigned int i;
 
 	/* listen on our own address */
 	if (ctdb_tcp_listen(ctdb) != 0) {
@@ -147,7 +147,7 @@ static void ctdb_tcp_shutdown(struct ctdb_context *ctdb)
 */
 static int ctdb_tcp_start(struct ctdb_context *ctdb)
 {
-	int i;
+	unsigned int i;
 
 	for (i=0; i < ctdb->num_nodes; i++) {
 		if (ctdb->nodes[i]->flags & NODE_FLAGS_DELETED) {
-- 
2.20.1


From ba31ab322f2c1dc6f66fdd6a5710422e79458660 Mon Sep 17 00:00:00 2001
From: Martin Schwenke <martin@meltin.net>
Date: Sat, 22 Jun 2019 05:53:15 +1000
Subject: [PATCH 17/32] ctdb-daemon: Replace function ctdb_ip_to_nodeid() with
 ctdb_ip_to_pnn()

Node ID is a poorly defined concept, indicating the slot in the node
map where the IP address was found.  This signed value also ends up
compared to num_nodes, which is unsigned, producing unwanted warnings.

Just return the PNN because this what both callers really want.

Signed-off-by: Martin Schwenke <martin@meltin.net>
---
 ctdb/include/ctdb_private.h |  3 ++-
 ctdb/server/ctdb_daemon.c   | 11 ++++-------
 ctdb/server/ctdb_server.c   | 14 ++++++--------
 ctdb/tcp/tcp_connect.c      | 10 ++++++----
 4 files changed, 18 insertions(+), 20 deletions(-)

diff --git a/ctdb/include/ctdb_private.h b/ctdb/include/ctdb_private.h
index 9eec244c4f2..7ea7691a36b 100644
--- a/ctdb/include/ctdb_private.h
+++ b/ctdb/include/ctdb_private.h
@@ -841,7 +841,8 @@ void ctdb_stop_recoverd(struct ctdb_context *ctdb);
 
 int ctdb_set_transport(struct ctdb_context *ctdb, const char *transport);
 
-int ctdb_ip_to_nodeid(struct ctdb_context *ctdb, const ctdb_sock_addr *nodeip);
+uint32_t ctdb_ip_to_pnn(struct ctdb_context *ctdb,
+			const ctdb_sock_addr *nodeip);
 
 void ctdb_load_nodes_file(struct ctdb_context *ctdb);
 
diff --git a/ctdb/server/ctdb_daemon.c b/ctdb/server/ctdb_daemon.c
index 6a4e42d8010..e9fbc29cb98 100644
--- a/ctdb/server/ctdb_daemon.c
+++ b/ctdb/server/ctdb_daemon.c
@@ -1374,21 +1374,18 @@ static void ctdb_initialise_vnn_map(struct ctdb_context *ctdb)
 
 static void ctdb_set_my_pnn(struct ctdb_context *ctdb)
 {
-	int nodeid;
-
 	if (ctdb->address == NULL) {
 		ctdb_fatal(ctdb,
 			   "Can not determine PNN - node address is not set\n");
 	}
 
-	nodeid = ctdb_ip_to_nodeid(ctdb, ctdb->address);
-	if (nodeid == -1) {
+	ctdb->pnn = ctdb_ip_to_pnn(ctdb, ctdb->address);
+	if (ctdb->pnn == CTDB_UNKNOWN_PNN) {
 		ctdb_fatal(ctdb,
-			   "Can not determine PNN - node address not found in node list\n");
+			   "Can not determine PNN - unknown node address\n");
 	}
 
-	ctdb->pnn = ctdb->nodes[nodeid]->pnn;
-	DEBUG(DEBUG_NOTICE, ("PNN is %u\n", ctdb->pnn));
+	D_NOTICE("PNN is %u\n", ctdb->pnn);
 }
 
 /*
diff --git a/ctdb/server/ctdb_server.c b/ctdb/server/ctdb_server.c
index eb11eb1f95c..dcd761a2961 100644
--- a/ctdb/server/ctdb_server.c
+++ b/ctdb/server/ctdb_server.c
@@ -45,24 +45,22 @@ int ctdb_set_transport(struct ctdb_context *ctdb, const char *transport)
 	return 0;
 }
 
-/*
-  Check whether an ip is a valid node ip
-  Returns the node id for this ip address or -1
-*/
-int ctdb_ip_to_nodeid(struct ctdb_context *ctdb, const ctdb_sock_addr *nodeip)
+/* Return the PNN for nodeip, CTDB_UNKNOWN_PNN if nodeip is invalid */
+uint32_t ctdb_ip_to_pnn(struct ctdb_context *ctdb,
+			const ctdb_sock_addr *nodeip)
 {
-	int nodeid;
+	unsigned int nodeid;
 
 	for (nodeid=0;nodeid<ctdb->num_nodes;nodeid++) {
 		if (ctdb->nodes[nodeid]->flags & NODE_FLAGS_DELETED) {
 			continue;
 		}
 		if (ctdb_same_ip(&ctdb->nodes[nodeid]->address, nodeip)) {
-			return nodeid;
+			return ctdb->nodes[nodeid]->pnn;
 		}
 	}
 
-	return -1;
+	return CTDB_UNKNOWN_PNN;
 }
 
 /* Load a nodes list file into a nodes array */
diff --git a/ctdb/tcp/tcp_connect.c b/ctdb/tcp/tcp_connect.c
index a8fca530470..d757abdf26c 100644
--- a/ctdb/tcp/tcp_connect.c
+++ b/ctdb/tcp/tcp_connect.c
@@ -244,7 +244,8 @@ static void ctdb_listen_event(struct tevent_context *ev, struct tevent_fd *fde,
 	struct ctdb_tcp *ctcp = talloc_get_type(ctdb->private_data, struct ctdb_tcp);
 	ctdb_sock_addr addr;
 	socklen_t len;
-	int fd, nodeid;
+	int fd;
+	uint32_t pnn;
 	struct ctdb_incoming *in;
 	int one = 1;
 	int ret;
@@ -255,10 +256,11 @@ static void ctdb_listen_event(struct tevent_context *ev, struct tevent_fd *fde,
 	if (fd == -1) return;
 	smb_set_close_on_exec(fd);
 
-	nodeid = ctdb_ip_to_nodeid(ctdb, &addr);
+	pnn = ctdb_ip_to_pnn(ctdb, &addr);
 
-	if (nodeid == -1) {
-		DEBUG(DEBUG_ERR, ("Refused connection from unknown node %s\n", ctdb_addr_to_str(&addr)));
+	if (pnn == CTDB_UNKNOWN_PNN) {
+		D_ERR("Refused connection from unknown node %s\n",
+		      ctdb_addr_to_str(&addr));
 		close(fd);
 		return;
 	}
-- 
2.20.1


From 09fe69ef8f4f26212677c34e3092740c25fe5aa0 Mon Sep 17 00:00:00 2001
From: Martin Schwenke <martin@meltin.net>
Date: Sat, 22 Jun 2019 06:23:12 +1000
Subject: [PATCH 18/32] ctdb-daemon: Don't index by PNN when initialising node
 flags

Indexing by PNN is wrong.

This also removes a signed/unsigned comparison because the PNN is not
compared to -1 anymore.

Signed-off-by: Martin Schwenke <martin@meltin.net>
---
 ctdb/server/ctdb_daemon.c | 21 ++++++++++++---------
 1 file changed, 12 insertions(+), 9 deletions(-)

diff --git a/ctdb/server/ctdb_daemon.c b/ctdb/server/ctdb_daemon.c
index e9fbc29cb98..c0553a18c14 100644
--- a/ctdb/server/ctdb_daemon.c
+++ b/ctdb/server/ctdb_daemon.c
@@ -1229,23 +1229,26 @@ failed:
 
 static void initialise_node_flags (struct ctdb_context *ctdb)
 {
-	if (ctdb->pnn == -1) {
-		ctdb_fatal(ctdb, "PNN is set to -1 (unknown value)");
+	unsigned int i;
+
+	/* Always found: PNN correctly set just before this is called */
+	for (i = 0; i < ctdb->num_nodes; i++) {
+		if (ctdb->pnn == ctdb->nodes[i]->pnn) {
+			break;
+		}
 	}
 
-	ctdb->nodes[ctdb->pnn]->flags &= ~NODE_FLAGS_DISCONNECTED;
+	ctdb->nodes[i]->flags &= ~NODE_FLAGS_DISCONNECTED;
 
 	/* do we start out in DISABLED mode? */
 	if (ctdb->start_as_disabled != 0) {
-		DEBUG(DEBUG_ERR,
-		      ("This node is configured to start in DISABLED state\n"));
-		ctdb->nodes[ctdb->pnn]->flags |= NODE_FLAGS_DISABLED;
+		D_ERR("This node is configured to start in DISABLED state\n");
+		ctdb->nodes[i]->flags |= NODE_FLAGS_DISABLED;
 	}
 	/* do we start out in STOPPED mode? */
 	if (ctdb->start_as_stopped != 0) {
-		DEBUG(DEBUG_ERR,
-		      ("This node is configured to start in STOPPED state\n"));
-		ctdb->nodes[ctdb->pnn]->flags |= NODE_FLAGS_STOPPED;
+		D_ERR("This node is configured to start in STOPPED state\n");
+		ctdb->nodes[i]->flags |= NODE_FLAGS_STOPPED;
 	}
 }
 
-- 
2.20.1


From ed16ba61c0a741e06e47e5ebac5b2c720168ef79 Mon Sep 17 00:00:00 2001
From: Martin Schwenke <martin@meltin.net>
Date: Sat, 8 Jun 2019 00:04:31 +1000
Subject: [PATCH 19/32] ctdb-protocol: Do not ignore return value of
 ctdb_g_lock_pull()

clang reports:

  ctdb/protocol/protocol_types.c:5191:3: warning: Value stored to 'ret' is never read

Found by csbuild.

Signed-off-by: Martin Schwenke <martin@meltin.net>
---
 ctdb/protocol/protocol_types.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/ctdb/protocol/protocol_types.c b/ctdb/protocol/protocol_types.c
index 416d4843b74..8090dbddadf 100644
--- a/ctdb/protocol/protocol_types.c
+++ b/ctdb/protocol/protocol_types.c
@@ -5208,5 +5208,5 @@ done:
 
 fail:
 	talloc_free(val);
-	return ENOMEM;
+	return ret;
 }
-- 
2.20.1


From bb5dc94ed15cad6926233f0e13bd8204128f8d0a Mon Sep 17 00:00:00 2001
From: Martin Schwenke <martin@meltin.net>
Date: Wed, 26 Jun 2019 16:14:28 +1000
Subject: [PATCH 20/32] ctdb-protocol: Fix signed/unsigned comparison by
 declaring as unsigned

Signed-off-by: Martin Schwenke <martin@meltin.net>
---
 ctdb/protocol/protocol_types.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/ctdb/protocol/protocol_types.c b/ctdb/protocol/protocol_types.c
index 8090dbddadf..5fb8f201e5d 100644
--- a/ctdb/protocol/protocol_types.c
+++ b/ctdb/protocol/protocol_types.c
@@ -1640,7 +1640,8 @@ int ctdb_rec_buffer_traverse(struct ctdb_rec_buffer *recbuf,
 	TDB_DATA key, data;
 	uint32_t reqid;
 	size_t offset, reclen;
-	int ret = 0, i;
+	unsigned int i;
+	int ret = 0;
 
 	offset = 0;
 	for (i=0; i<recbuf->count; i++) {
-- 
2.20.1


From 20f800a34c3d013e882ca1d6578da7af69a1c890 Mon Sep 17 00:00:00 2001
From: Martin Schwenke <martin@meltin.net>
Date: Sun, 23 Jun 2019 20:59:34 +1000
Subject: [PATCH 21/32] ctdb-protocol: Variable for return value of strlcpy()
 should be size_t

This avoids an unnecessary signed/unsigned comparison issue.

Signed-off-by: Martin Schwenke <martin@meltin.net>
---
 ctdb/protocol/protocol_util.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/ctdb/protocol/protocol_util.c b/ctdb/protocol/protocol_util.c
index 2a0d42a9f45..026f342bd7d 100644
--- a/ctdb/protocol/protocol_util.c
+++ b/ctdb/protocol/protocol_util.c
@@ -311,7 +311,7 @@ int ctdb_sock_addr_mask_from_string(const char *str,
 	char *p;
 	char s[64]; /* Much longer than INET6_ADDRSTRLEN */
 	unsigned int m;
-	ssize_t len;
+	size_t len;
 	int ret = 0;
 
 	if (addr == NULL || mask == NULL) {
-- 
2.20.1


From 52893533f57c9f474cd95d19bac2347a63572b47 Mon Sep 17 00:00:00 2001
From: Martin Schwenke <martin@meltin.net>
Date: Sun, 23 Jun 2019 21:00:38 +1000
Subject: [PATCH 22/32] ctdb-protocol: Avoid signed/unsigned comparison by
 casting

Signed-off-by: Martin Schwenke <martin@meltin.net>
---
 ctdb/protocol/protocol_types.c | 16 ++++++++--------
 ctdb/protocol/protocol_util.c  |  4 ++--
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/ctdb/protocol/protocol_types.c b/ctdb/protocol/protocol_types.c
index 5fb8f201e5d..d9388b74b1e 100644
--- a/ctdb/protocol/protocol_types.c
+++ b/ctdb/protocol/protocol_types.c
@@ -1680,19 +1680,19 @@ int ctdb_rec_buffer_write(struct ctdb_rec_buffer *recbuf, int fd)
 	ssize_t n;
 
 	n = write(fd, &recbuf->db_id, sizeof(uint32_t));
-	if (n == -1 || n != sizeof(uint32_t)) {
+	if (n == -1 || (size_t)n != sizeof(uint32_t)) {
 		return (errno != 0 ? errno : EIO);
 	}
 	n = write(fd, &recbuf->count, sizeof(uint32_t));
-	if (n == -1 || n != sizeof(uint32_t)) {
+	if (n == -1 || (size_t)n != sizeof(uint32_t)) {
 		return (errno != 0 ? errno : EIO);
 	}
 	n = write(fd, &recbuf->buflen, sizeof(size_t));
-	if (n == -1 || n != sizeof(size_t)) {
+	if (n == -1 || (size_t)n != sizeof(size_t)) {
 		return (errno != 0 ? errno : EIO);
 	}
 	n = write(fd, recbuf->buf, recbuf->buflen);
-	if (n == -1 || n != recbuf->buflen) {
+	if (n == -1 || (size_t)n != recbuf->buflen) {
 		return (errno != 0 ? errno : EIO);
 	}
 
@@ -1711,15 +1711,15 @@ int ctdb_rec_buffer_read(int fd, TALLOC_CTX *mem_ctx,
 	}
 
 	n = read(fd, &recbuf->db_id, sizeof(uint32_t));
-	if (n == -1 || n != sizeof(uint32_t)) {
+	if (n == -1 || (size_t)n != sizeof(uint32_t)) {
 		return (errno != 0 ? errno : EIO);
 	}
 	n = read(fd, &recbuf->count, sizeof(uint32_t));
-	if (n == -1 || n != sizeof(uint32_t)) {
+	if (n == -1 || (size_t)n != sizeof(uint32_t)) {
 		return (errno != 0 ? errno : EIO);
 	}
 	n = read(fd, &recbuf->buflen, sizeof(size_t));
-	if (n == -1 || n != sizeof(size_t)) {
+	if (n == -1 || (size_t)n != sizeof(size_t)) {
 		return (errno != 0 ? errno : EIO);
 	}
 
@@ -1729,7 +1729,7 @@ int ctdb_rec_buffer_read(int fd, TALLOC_CTX *mem_ctx,
 	}
 
 	n = read(fd, recbuf->buf, recbuf->buflen);
-	if (n == -1 || n != recbuf->buflen) {
+	if (n == -1 || (size_t)n != recbuf->buflen) {
 		return (errno != 0 ? errno : EIO);
 	}
 
diff --git a/ctdb/protocol/protocol_util.c b/ctdb/protocol/protocol_util.c
index 026f342bd7d..c67aa2e056f 100644
--- a/ctdb/protocol/protocol_util.c
+++ b/ctdb/protocol/protocol_util.c
@@ -147,7 +147,7 @@ int ctdb_sock_addr_to_buf(char *buf, socklen_t buflen,
 
 		ret = snprintf(buf+len, buflen-len,
 			       ":%u", ctdb_sock_addr_port(addr));
-		if (ret >= buflen-len) {
+		if (ret < 0 || (size_t)ret >= buflen-len) {
 			return ENOSPC;
 		}
 	}
@@ -485,7 +485,7 @@ int ctdb_connection_to_buf(char *buf, size_t buflen,
 	} else {
 		ret = snprintf(buf, buflen, "%s %s", client, server);
 	}
-	if (ret >= buflen) {
+	if (ret < 0 || (size_t)ret >= buflen) {
 		return ENOSPC;
 	}
 
-- 
2.20.1


From b4aa27471c58a4eec7fed0b7268532a97e6361ac Mon Sep 17 00:00:00 2001
From: Martin Schwenke <martin@meltin.net>
Date: Mon, 24 Jun 2019 14:02:53 +1000
Subject: [PATCH 23/32] ctdb-daemon: Drop unused function
 ctdb_vfork_with_logging()

Signed-off-by: Martin Schwenke <martin@meltin.net>
---
 ctdb/include/ctdb_private.h | 10 ----
 ctdb/server/ctdb_logging.c  | 96 -------------------------------------
 2 files changed, 106 deletions(-)

diff --git a/ctdb/include/ctdb_private.h b/ctdb/include/ctdb_private.h
index 7ea7691a36b..2bcc7c94156 100644
--- a/ctdb/include/ctdb_private.h
+++ b/ctdb/include/ctdb_private.h
@@ -675,16 +675,6 @@ struct lock_request *ctdb_lock_db(TALLOC_CTX *mem_ctx,
 bool ctdb_logging_init(TALLOC_CTX *mem_ctx, const char *logging,
 		       const char *debug_level);
 
-struct ctdb_log_state *ctdb_vfork_with_logging(TALLOC_CTX *mem_ctx,
-					       struct ctdb_context *ctdb,
-					       const char *log_prefix,
-					       const char *helper,
-					       int helper_argc,
-					       const char **helper_argv,
-					       void (*logfn)(const char *,
-							     uint16_t, void *),
-					       void *logfn_private, pid_t *pid);
-
 int ctdb_set_child_logging(struct ctdb_context *ctdb);
 
 /* from ctdb_logging_file.c */
diff --git a/ctdb/server/ctdb_logging.c b/ctdb/server/ctdb_logging.c
index e7ca9b2758d..8af787c189f 100644
--- a/ctdb/server/ctdb_logging.c
+++ b/ctdb/server/ctdb_logging.c
@@ -132,102 +132,6 @@ static void ctdb_child_log_handler(struct tevent_context *ev,
 	}
 }
 
-static int log_context_destructor(struct ctdb_log_state *log)
-{
-	/* Flush buffer in case it wasn't \n-terminated. */
-	if (log->buf_used > 0) {
-		write_to_log(log, log->buf, log->buf_used);
-	}
-	return 0;
-}
-
-/*
- * vfork + exec, redirecting child output to logging and specified callback.
- */
-struct ctdb_log_state *ctdb_vfork_with_logging(TALLOC_CTX *mem_ctx,
-					       struct ctdb_context *ctdb,
-					       const char *log_prefix,
-					       const char *helper,
-					       int helper_argc,
-					       const char **helper_argv,
-					       void (*logfn)(const char *, uint16_t, void *),
-					       void *logfn_private, pid_t *pid)
-{
-	int p[2];
-	struct ctdb_log_state *log;
-	struct tevent_fd *fde;
-	char **argv;
-	int i;
-	struct timeval before;
-	double delta_t;
-
-	log = talloc_zero(mem_ctx, struct ctdb_log_state);
-	CTDB_NO_MEMORY_NULL(ctdb, log);
-
-	log->prefix = log_prefix;
-	log->logfn = logfn;
-	log->logfn_private = logfn_private;
-
-	if (pipe(p) != 0) {
-		DEBUG(DEBUG_ERR, (__location__ " Failed to setup pipe for child logging:"
-				" %s\n", strerror(errno)));
-		goto free_log;
-	}
-
-	argv = talloc_array(mem_ctx, char *, helper_argc + 2);
-	if (argv == NULL) {
-		DEBUG(DEBUG_ERR, (__location__ "Failed to allocate memory for helper\n"));
-		goto free_log;
-	}
-	argv[0] = discard_const(helper);
-	argv[1] = talloc_asprintf(argv, "%d", p[1]);
-	if (argv[1] == NULL) {
-		DEBUG(DEBUG_ERR, (__location__ "Failed to allocate memory for helper\n"));
-		talloc_free(argv);
-		goto free_log;
-	}
-
-	for (i=0; i<helper_argc; i++) {
-		argv[i+2] = discard_const(helper_argv[i]);
-	}
-
-	before = timeval_current();
-
-	*pid = vfork();
-	if (*pid == 0) {
-		execv(helper, argv);
-		_exit(1);
-	}
-	close(p[1]);
-
-	if (*pid < 0) {
-		DEBUG(DEBUG_ERR, (__location__ "vfork failed for helper process\n"));
-		close(p[0]);
-		goto free_log;
-	}
-
-	delta_t = timeval_elapsed(&before);
-	if (delta_t > 3.0) {
-		DEBUG(DEBUG_WARNING, ("vfork() took %lf seconds\n", delta_t));
-	}
-
-	ctdb_track_child(ctdb, *pid);
-
-	log->pfd = p[0];
-	set_close_on_exec(log->pfd);
-	talloc_set_destructor(log, log_context_destructor);
-	fde = tevent_add_fd(ctdb->ev, log, log->pfd, TEVENT_FD_READ,
-			    ctdb_child_log_handler, log);
-	tevent_fd_set_auto_close(fde);
-
-	return log;
-
-free_log:
-	talloc_free(log);
-	return NULL;
-}
-
-
 /*
   setup for logging of child process stdout
 */
-- 
2.20.1


From 6346184d4e75413aee6df8a809191ef82122277d Mon Sep 17 00:00:00 2001
From: Martin Schwenke <martin@meltin.net>
Date: Mon, 24 Jun 2019 16:35:01 +1000
Subject: [PATCH 24/32] ctdb-common: Fix signed/unsigned comparisons by casting

One case needs an extra variable declared.

Signed-off-by: Martin Schwenke <martin@meltin.net>
---
 ctdb/common/ctdb_util.c    | 5 ++++-
 ctdb/common/event_script.c | 4 ++--
 ctdb/common/sock_io.c      | 2 +-
 3 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/ctdb/common/ctdb_util.c b/ctdb/common/ctdb_util.c
index 0f367c2100e..3f8fff925f0 100644
--- a/ctdb/common/ctdb_util.c
+++ b/ctdb/common/ctdb_util.c
@@ -111,7 +111,10 @@ bool ctdb_set_helper(const char *type, char *helper, size_t size,
 			      ("Unable to set %s - dir is NULL\n", type));
 		return false;
 	} else {
-		if (snprintf(helper, size, "%s/%s", dir, file) >= size) {
+		int ret;
+
+		ret = snprintf(helper, size, "%s/%s", dir, file);
+		if (ret < 0 || (size_t)ret >= size) {
 			DEBUG(DEBUG_ERR,
 			      ("Unable to set %s - path too long\n", type));
 			return false;
diff --git a/ctdb/common/event_script.c b/ctdb/common/event_script.c
index 8bdfdd0b5ca..edd607f7a14 100644
--- a/ctdb/common/event_script.c
+++ b/ctdb/common/event_script.c
@@ -159,7 +159,7 @@ int event_script_chmod(const char *script_dir,
 		script_file = script_name;
 	} else {
 		ret = snprintf(buf, sizeof(buf), "%s.script", script_name);
-		if (ret >= sizeof(buf)) {
+		if (ret < 0 || (size_t)ret >= sizeof(buf)) {
 			return ENAMETOOLONG;
 		}
 		script_file = buf;
@@ -196,7 +196,7 @@ int event_script_chmod(const char *script_dir,
 		       "%s/%s",
 		       script_dir,
 		       script_file);
-	if (ret >= sizeof(filename)) {
+	if (ret < 0 || (size_t)ret >= sizeof(filename)) {
 		return ENAMETOOLONG;
 	}
 
diff --git a/ctdb/common/sock_io.c b/ctdb/common/sock_io.c
index b5c9332526b..81e82c59ca0 100644
--- a/ctdb/common/sock_io.c
+++ b/ctdb/common/sock_io.c
@@ -198,7 +198,7 @@ static void sock_queue_handler(struct tevent_context *ev,
 		goto fail;
 	}
 
-	if (num_ready > queue->buflen - queue->end) {
+	if ((size_t)num_ready > queue->buflen - queue->end) {
 		queue->buf = talloc_realloc_size(queue, queue->buf,
 						 queue->end + num_ready);
 		if (queue->buf == NULL) {
-- 
2.20.1


From b17315a33ee011ac9bc195368a3465f1102cc37c Mon Sep 17 00:00:00 2001
From: Martin Schwenke <martin@meltin.net>
Date: Mon, 24 Jun 2019 16:36:47 +1000
Subject: [PATCH 25/32] ctdb-common: Fix error handling

According to the documentation, sendto() should either send the packet
as given or return with an error.  However, given that it can return
the number of bytes sent, treat the theoretical error of a short
packet send separately, since errno would not be set in this case.

Similarly, treat a short packet recv() separately from an error where
errno is set.

Signed-off-by: Martin Schwenke <martin@meltin.net>
---
 ctdb/common/system_socket.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/ctdb/common/system_socket.c b/ctdb/common/system_socket.c
index c6800431112..86cbdaab6ad 100644
--- a/ctdb/common/system_socket.c
+++ b/ctdb/common/system_socket.c
@@ -681,10 +681,14 @@ int ctdb_sys_send_tcp(const ctdb_sock_addr *dest,
 			     sizeof(dest->ip));
 		saved_errno = errno;
 		close(s);
-		if (ret != len) {
+		if (ret == -1) {
 			D_ERR("Failed sendto (%s)\n", strerror(saved_errno));
 			return -1;
 		}
+		if ((size_t)ret != len) {
+			DBG_ERR("Failed sendto - didn't send full packet\n");
+			return -1;
+		}
 		break;
 
 	case AF_INET6:
@@ -722,11 +726,14 @@ int ctdb_sys_send_tcp(const ctdb_sock_addr *dest,
 			     sizeof(tmpdest));
 		saved_errno = errno;
 		close(s);
-
-		if (ret != len) {
+		if (ret == -1) {
 			D_ERR("Failed sendto (%s)\n", strerror(saved_errno));
 			return -1;
 		}
+		if ((size_t)ret != len) {
+			DBG_ERR("Failed sendto - didn't send full packet\n");
+			return -1;
+		}
 		break;
 
 	default:
@@ -914,7 +921,10 @@ int ctdb_sys_read_tcp_packet(int s, void *private_data,
 	int ret;
 
 	nread = recv(s, pkt, sizeof(pkt), MSG_TRUNC);
-	if (nread < sizeof(*eth)) {
+	if (nread == -1) {
+		return errno;
+	}
+	if ((size_t)nread < sizeof(*eth)) {
 		return EMSGSIZE;
 	}
 
-- 
2.20.1


From 884707e7f47f47f6161f3ed6cb9c468131c15e7d Mon Sep 17 00:00:00 2001
From: Martin Schwenke <martin@meltin.net>
Date: Mon, 24 Jun 2019 16:42:21 +1000
Subject: [PATCH 26/32] ctdb-common: Fix signed/unsigned comparisons by
 declaring as unsigned

Signed-off-by: Martin Schwenke <martin@meltin.net>
---
 ctdb/common/ctdb_ltdb.c | 8 ++++----
 ctdb/common/run_event.c | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/ctdb/common/ctdb_ltdb.c b/ctdb/common/ctdb_ltdb.c
index 1fc9ce28c1b..73458754def 100644
--- a/ctdb/common/ctdb_ltdb.c
+++ b/ctdb/common/ctdb_ltdb.c
@@ -308,8 +308,8 @@ int ctdb_ltdb_delete(struct ctdb_db_context *ctdb_db, TDB_DATA key)
 
 int ctdb_trackingdb_add_pnn(struct ctdb_context *ctdb, TDB_DATA *data, uint32_t pnn)
 {
-	int byte_pos = pnn / 8;
-	int bit_mask   = 1 << (pnn % 8);
+	unsigned int byte_pos = pnn / 8;
+	unsigned char bit_mask = 1 << (pnn % 8);
 
 	if (byte_pos + 1 > data->dsize) {
 		char *buf;
@@ -334,10 +334,10 @@ int ctdb_trackingdb_add_pnn(struct ctdb_context *ctdb, TDB_DATA *data, uint32_t
 
 void ctdb_trackingdb_traverse(struct ctdb_context *ctdb, TDB_DATA data, ctdb_trackingdb_cb cb, void *private_data)
 {
-	int i;
+	unsigned int i;
 
 	for(i = 0; i < data.dsize; i++) {
-		int j;
+		unsigned int j;
 
 		for (j=0; j<8; j++) {
 			int mask = 1<<j;
diff --git a/ctdb/common/run_event.c b/ctdb/common/run_event.c
index ca4e572a806..d283664e2cf 100644
--- a/ctdb/common/run_event.c
+++ b/ctdb/common/run_event.c
@@ -519,7 +519,7 @@ struct run_event_state {
 	struct run_event_script_list *script_list;
 	const char **argv;
 	struct tevent_req *script_subreq;
-	int index;
+	unsigned int index;
 	bool cancelled;
 };
 
-- 
2.20.1


From ab661be40594b5dc82f7dac3c71863fe9a6246f1 Mon Sep 17 00:00:00 2001
From: Martin Schwenke <martin@meltin.net>
Date: Mon, 24 Jun 2019 16:42:58 +1000
Subject: [PATCH 27/32] ctdb-event: Assign missing return value

Otherwise ret == 0 is returned from successful call to
ctdb_int32_pull().

Signed-off-by: Martin Schwenke <martin@meltin.net>
---
 ctdb/event/event_protocol.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/ctdb/event/event_protocol.c b/ctdb/event/event_protocol.c
index 21adb430c20..baa9e1ecb82 100644
--- a/ctdb/event/event_protocol.c
+++ b/ctdb/event/event_protocol.c
@@ -317,6 +317,7 @@ static int ctdb_event_script_list_pull(uint8_t *buf,
 	value->script = talloc_array(value, struct ctdb_event_script,
 				     num_scripts);
 	if (value->script == NULL) {
+		ret = ENOMEM;
 		goto fail;
 	}
 
-- 
2.20.1


From 9892e00c6935d82d90f14b4d9387e160f063b319 Mon Sep 17 00:00:00 2001
From: Martin Schwenke <martin@meltin.net>
Date: Mon, 24 Jun 2019 16:44:37 +1000
Subject: [PATCH 28/32] ctdb-database: Fix signed/unsigned comparison by
 casting

Signed-off-by: Martin Schwenke <martin@meltin.net>
---
 ctdb/database/database_conf.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/ctdb/database/database_conf.c b/ctdb/database/database_conf.c
index 6bdb372bf03..4c7cb2d9ffe 100644
--- a/ctdb/database/database_conf.c
+++ b/ctdb/database/database_conf.c
@@ -96,7 +96,7 @@ static bool database_conf_validate_lock_debug_script(const char *key,
 		       "%s/%s",
 		       path_etcdir(),
 		       basename(script));
-	if (ret >= sizeof(script_path)) {
+	if (ret < 0 || (size_t)ret >= sizeof(script_path)) {
 		D_ERR("lock debug script path too long\n");
 		return false;
 	}
-- 
2.20.1


From 68d70b426dc0ce52b120e5afe40ed12c7c439cdd Mon Sep 17 00:00:00 2001
From: Martin Schwenke <martin@meltin.net>
Date: Mon, 24 Jun 2019 16:45:06 +1000
Subject: [PATCH 29/32] ctdb-event: Fix signed/unsigned comparisons by casting

Signed-off-by: Martin Schwenke <martin@meltin.net>
---
 ctdb/event/event_conf.c | 2 +-
 ctdb/event/event_tool.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/ctdb/event/event_conf.c b/ctdb/event/event_conf.c
index 33bfc7c5335..61ecf8e33eb 100644
--- a/ctdb/event/event_conf.c
+++ b/ctdb/event/event_conf.c
@@ -50,7 +50,7 @@ static bool event_conf_validate_debug_script(const char *key,
 		       "%s/%s",
 		       path_etcdir(),
 		       basename(script));
-	if (ret >= sizeof(script_path)) {
+	if (ret < 0 || (size_t)ret >= sizeof(script_path)) {
 		D_ERR("debug script path too long\n");
 		return false;
 	}
diff --git a/ctdb/event/event_tool.c b/ctdb/event/event_tool.c
index 6cc5dc9a822..9c95e6d9553 100644
--- a/ctdb/event/event_tool.c
+++ b/ctdb/event/event_tool.c
@@ -408,7 +408,7 @@ static int event_command_script_list(TALLOC_CTX *mem_ctx,
 			}
 
 			len = readlink(e->path, buf, sizeof(buf));
-			if (len == -1 || len >= sizeof(buf)) {
+			if (len == -1 || (size_t)len >= sizeof(buf)) {
 				/*
 				 * Not a link?  Disappeared?  Invalid
 				 * link target?  Something else?
-- 
2.20.1


From 964a18bbf9fbc79add1998889303e8b1e6a698ff Mon Sep 17 00:00:00 2001
From: Martin Schwenke <martin@meltin.net>
Date: Mon, 24 Jun 2019 17:01:07 +1000
Subject: [PATCH 30/32] ctdb-common: Mark ctdb_fatal() and ctdb_die() as
 _NORETURN_

This avoids static analysers continuing analysis after calls to these
functions and producing incorrect warnings.

Signed-off-by: Martin Schwenke <martin@meltin.net>
---
 ctdb/common/common.h | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/ctdb/common/common.h b/ctdb/common/common.h
index 6b2c98ef383..79f6b9ed03a 100644
--- a/ctdb/common/common.h
+++ b/ctdb/common/common.h
@@ -20,6 +20,8 @@
 #ifndef __CTDB_COMMON_H__
 #define __CTDB_COMMON_H__
 
+#include "lib/util/attr.h"
+
 /* From common/ctdb_io.c */
 
 typedef void (*ctdb_queue_cb_fn_t)(uint8_t *data, size_t length,
@@ -91,9 +93,9 @@ const char *ctdb_errstr(struct ctdb_context *ctdb);
 void ctdb_set_error(struct ctdb_context *ctdb, const char *fmt, ...)
 		    PRINTF_ATTRIBUTE(2,3);
 
-void ctdb_fatal(struct ctdb_context *ctdb, const char *msg);
+void ctdb_fatal(struct ctdb_context *ctdb, const char *msg) _NORETURN_;
 
-void ctdb_die(struct ctdb_context *ctdb, const char *msg);
+void ctdb_die(struct ctdb_context *ctdb, const char *msg) _NORETURN_;
 
 bool ctdb_set_helper(const char *type, char *helper, size_t size,
 		     const char *envvar,
-- 
2.20.1


From d8b591721710075c91e4a6a0589220e14a40c52d Mon Sep 17 00:00:00 2001
From: Martin Schwenke <martin@meltin.net>
Date: Tue, 25 Jun 2019 06:35:04 +1000
Subject: [PATCH 31/32] ctdb-daemon: Don't check if lock_ctx->ctdb_db is NULL

This can never be NULL.  It could probably be NULL in the past when
"all database" locks existed.

There are paths where is is checked for NULL and then later
dereferenced, causing static analysers to produce spurious warnings.

Signed-off-by: Martin Schwenke <martin@meltin.net>
---
 ctdb/server/ctdb_lock.c | 49 ++++++++++++++---------------------------
 1 file changed, 16 insertions(+), 33 deletions(-)

diff --git a/ctdb/server/ctdb_lock.c b/ctdb/server/ctdb_lock.c
index d42d47af85f..5f032ae568b 100644
--- a/ctdb/server/ctdb_lock.c
+++ b/ctdb/server/ctdb_lock.c
@@ -198,13 +198,9 @@ static int ctdb_lock_context_destructor(struct lock_context *lock_ctx)
 		} else {
 			DLIST_REMOVE(lock_ctx->ctdb->lock_current, lock_ctx);
 		}
-		if (lock_ctx->ctdb_db) {
-			lock_ctx->ctdb_db->lock_num_current--;
-		}
+		lock_ctx->ctdb_db->lock_num_current--;
 		CTDB_DECREMENT_STAT(lock_ctx->ctdb, locks.num_current);
-		if (lock_ctx->ctdb_db) {
-			CTDB_DECREMENT_DB_STAT(lock_ctx->ctdb_db, locks.num_current);
-		}
+		CTDB_DECREMENT_DB_STAT(lock_ctx->ctdb_db, locks.num_current);
 	} else {
 		if (lock_ctx->type == LOCK_RECORD) {
 			DLIST_REMOVE(lock_ctx->ctdb_db->lock_pending, lock_ctx);
@@ -212,9 +208,7 @@ static int ctdb_lock_context_destructor(struct lock_context *lock_ctx)
 			DLIST_REMOVE(lock_ctx->ctdb->lock_pending, lock_ctx);
 		}
 		CTDB_DECREMENT_STAT(lock_ctx->ctdb, locks.num_pending);
-		if (lock_ctx->ctdb_db) {
-			CTDB_DECREMENT_DB_STAT(lock_ctx->ctdb_db, locks.num_pending);
-		}
+		CTDB_DECREMENT_DB_STAT(lock_ctx->ctdb_db, locks.num_pending);
 	}
 
 	ctdb_lock_schedule(lock_ctx->ctdb);
@@ -357,25 +351,19 @@ static void ctdb_lock_handler(struct tevent_context *ev,
 
 	/* Update statistics */
 	CTDB_INCREMENT_STAT(lock_ctx->ctdb, locks.num_calls);
-	if (lock_ctx->ctdb_db) {
-		CTDB_INCREMENT_DB_STAT(lock_ctx->ctdb_db, locks.num_calls);
-	}
+	CTDB_INCREMENT_DB_STAT(lock_ctx->ctdb_db, locks.num_calls);
 
 	if (locked) {
-		if (lock_ctx->ctdb_db) {
-			CTDB_INCREMENT_STAT(lock_ctx->ctdb, locks.buckets[id]);
-			CTDB_UPDATE_LATENCY(lock_ctx->ctdb, lock_ctx->ctdb_db,
-					    lock_type_str[lock_ctx->type], locks.latency,
-					    lock_ctx->start_time);
-
-			CTDB_UPDATE_DB_LATENCY(lock_ctx->ctdb_db, lock_type_str[lock_ctx->type], locks.latency, t);
-			CTDB_INCREMENT_DB_STAT(lock_ctx->ctdb_db, locks.buckets[id]);
-		}
+		CTDB_INCREMENT_STAT(lock_ctx->ctdb, locks.buckets[id]);
+		CTDB_UPDATE_LATENCY(lock_ctx->ctdb, lock_ctx->ctdb_db,
+				    lock_type_str[lock_ctx->type], locks.latency,
+				    lock_ctx->start_time);
+
+		CTDB_UPDATE_DB_LATENCY(lock_ctx->ctdb_db, lock_type_str[lock_ctx->type], locks.latency, t);
+		CTDB_INCREMENT_DB_STAT(lock_ctx->ctdb_db, locks.buckets[id]);
 	} else {
 		CTDB_INCREMENT_STAT(lock_ctx->ctdb, locks.num_failed);
-		if (lock_ctx->ctdb_db) {
-			CTDB_INCREMENT_DB_STAT(lock_ctx->ctdb_db, locks.num_failed);
-		}
+		CTDB_INCREMENT_DB_STAT(lock_ctx->ctdb_db, locks.num_failed);
 	}
 
 	process_callbacks(lock_ctx, locked);
@@ -674,10 +662,7 @@ static struct lock_context *ctdb_find_lock_context(struct ctdb_context *ctdb)
 				   "request\n"));
 		DLIST_REMOVE(ctdb->lock_pending, lock_ctx);
 		CTDB_DECREMENT_STAT(ctdb, locks.num_pending);
-		if (lock_ctx->ctdb_db) {
-			CTDB_DECREMENT_DB_STAT(lock_ctx->ctdb_db,
-					       locks.num_pending);
-		}
+		CTDB_DECREMENT_DB_STAT(lock_ctx->ctdb_db, locks.num_pending);
 		talloc_free(lock_ctx);
 	}
 
@@ -825,11 +810,9 @@ static void ctdb_lock_schedule(struct ctdb_context *ctdb)
 	}
 	CTDB_DECREMENT_STAT(lock_ctx->ctdb, locks.num_pending);
 	CTDB_INCREMENT_STAT(lock_ctx->ctdb, locks.num_current);
-	if (lock_ctx->ctdb_db) {
-		lock_ctx->ctdb_db->lock_num_current++;
-		CTDB_DECREMENT_DB_STAT(lock_ctx->ctdb_db, locks.num_pending);
-		CTDB_INCREMENT_DB_STAT(lock_ctx->ctdb_db, locks.num_current);
-	}
+	lock_ctx->ctdb_db->lock_num_current++;
+	CTDB_DECREMENT_DB_STAT(lock_ctx->ctdb_db, locks.num_pending);
+	CTDB_INCREMENT_DB_STAT(lock_ctx->ctdb_db, locks.num_current);
 }
 
 
-- 
2.20.1


From eab2ce8b6bb5997866ad87a1692caa1746c68ee7 Mon Sep 17 00:00:00 2001
From: Martin Schwenke <martin@meltin.net>
Date: Tue, 25 Jun 2019 10:03:44 +1000
Subject: [PATCH 32/32] ctdb-build: Tweak hacking of rpcgen output

csbuild doesn't like the hack where variable buf is initialised to
itself to avoid an unused variable warning.  buf is unused so remove
it instead.

Signed-off-by: Martin Schwenke <martin@meltin.net>
---
 ctdb/wscript | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/ctdb/wscript b/ctdb/wscript
index 614e042bd70..51a09fdc63d 100644
--- a/ctdb/wscript
+++ b/ctdb/wscript
@@ -634,7 +634,7 @@ def build(bld):
                         target='utils/smnotify/smnotify.h',
                         rule='rpcgen -h ${SRC} > ${TGT}')
 
-    xdr_buf_hack = 'sed -e "s@^\([ \t]*register int32_t \*buf\);@\\1 = buf;@"'
+    xdr_buf_hack = 'grep -Fv "register int32_t *buf;"'
 
     bld.SAMBA_GENERATOR('ctdb-smnotify-x',
                         source='utils/smnotify/smnotify.x',
-- 
2.20.1


--MP_/h1/VjHv18ARt124wAMGyo0p--

