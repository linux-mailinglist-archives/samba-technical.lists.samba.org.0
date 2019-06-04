Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 85202344D7
	for <lists+samba-technical@lfdr.de>; Tue,  4 Jun 2019 12:55:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=q+eKijrATqX/WhhrbOfQiG9HXZF+5TgA1QMvWv66QVc=; b=A7/pzgBOamhninM+e+1HVOXWvC
	UgaMzgNnccKbXZSwipt7dCYZnw337H4xSU3SA+MFcMcLT4s2Og2ZWRHa2vov6hOSbpClausFexuzh
	t8m0P4rGVnJXtVaChkxrPXADOgS4HEp9zKAHjlw5qiv3CDv3uCCwg9hKF5k5W/CBb3ban6jI7Nr+L
	B7zEYO19XNClRte8vZOm2m9cd0M2IkJK+stUhTVsNY1H4HOfHkDiPXyJ5LFhHIEyal4lyzNdi9eU1
	QLNoVaqYXkgz5/I/vw7meYIMmssPpnhCDV73XQPw6kVZl4ISPU3viPTq2ONeYbou77dBgLmIfqQW/
	aUkADsFg==;
Received: from localhost ([::1]:32570 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hY75N-0052Gv-DG; Tue, 04 Jun 2019 10:54:33 +0000
Received: from bilbo.ozlabs.org ([203.11.71.1]:60563 helo=ozlabs.org) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hY75G-0052Go-Cu
 for samba-technical@lists.samba.org; Tue, 04 Jun 2019 10:54:30 +0000
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 45J81f3qrXz9s6w;
 Tue,  4 Jun 2019 20:54:14 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=meltin.net; s=201810;
 t=1559645658; bh=wvsOROxFzYOgLLwS2RVMBI/SBo03DRUURo7WrGemT7M=;
 h=Date:From:To:Subject:From;
 b=dvsALBJKGaKhAIfo/abIueT9KAcKoZU5yytZ1zgbV6OGHwhwrmyeSmTeyr8/+joAa
 fRulz8BUe4+YctWnAEhM9YSoSksx87IMao5FQD//xzNgPoRMt7a5gqcmtHZVWx9dUK
 S1B/DNcz803HX9wSAIJrHx36yHyhPODWiVkfMxHTjMEwer0RwP4grR9jl9jtqMvIib
 0ZUfEJ3VjTOD00w7S09EVHOgapZnQq5AbSRubafhrdfVuueefRr99pOAn0P6rdd7xO
 DO3N6Kwz0oUNSAM1a7GO66MMSnyaCNQKPdgPRnpOmJh4SPidTu1HC5yXQDiR+oIFCb
 tpjlwhBvULbnQ==
Date: Tue, 4 Jun 2019 20:54:02 +1000
To: Samba Technical <samba-technical@lists.samba.org>
Subject: [PATCH] Fix CTDB csbuild and Coverity issues
Message-ID: <20190604205402.4fadccb9@martins.ozlabs.org>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="MP_/Q=p.s/8I8g29ikNitkhvCKr"
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

--MP_/Q=p.s/8I8g29ikNitkhvCKr
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Here are a bunch of fixes for things found by csbuild and Coverity.
This doesn't fix everything... still more to do.

Please review and maybe push...

peace & happiness,
martin

--MP_/Q=p.s/8I8g29ikNitkhvCKr
Content-Type: text/x-patch
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=ctdb.patch

From 3fb04db113a803502b5470b8fad70038e1e460c6 Mon Sep 17 00:00:00 2001
From: Martin Schwenke <martin@meltin.net>
Date: Wed, 22 May 2019 21:52:17 +1000
Subject: [PATCH 01/28] ctdb-tools: Fix signed/unsigned comparisons by
 declaring as unsigned

These are the simple cases where a variable (usually a loop variable)
needs to be declared as an unsigned type (usually unsigned int or
size_t) instead of an int.

Signed-off-by: Martin Schwenke <martin@meltin.net>
---
 ctdb/tools/ctdb.c | 109 ++++++++++++++++++++++++++--------------------
 1 file changed, 62 insertions(+), 47 deletions(-)

diff --git a/ctdb/tools/ctdb.c b/ctdb/tools/ctdb.c
index 3c61c542ec4..84333ed1d49 100644
--- a/ctdb/tools/ctdb.c
+++ b/ctdb/tools/ctdb.c
@@ -92,7 +92,7 @@ static struct ctdb_node_and_flags *get_node_by_pnn(
 					struct ctdb_node_map *nodemap,
 					uint32_t pnn)
 {
-	int i;
+	unsigned int i;
 
 	for (i=0; i<nodemap->num; i++) {
 		if (nodemap->node[i].pnn == pnn) {
@@ -117,7 +117,7 @@ static const char *pretty_print_flags(TALLOC_CTX *mem_ctx, uint32_t flags)
 		{ NODE_FLAGS_INACTIVE,		    "INACTIVE" },
 	};
 	char *flags_str = NULL;
-	int i;
+	size_t i;
 
 	for (i=0; i<ARRAY_SIZE(flag_names); i++) {
 		if (flags & flag_names[i].flag) {
@@ -216,7 +216,7 @@ static bool verify_pnn(struct ctdb_context *ctdb, int pnn)
 {
 	struct ctdb_node_map *nodemap;
 	bool found;
-	int i;
+	unsigned int i;
 
 	if (pnn == -1) {
 		return false;
@@ -282,7 +282,7 @@ static bool parse_nodestring(TALLOC_CTX *mem_ctx, struct ctdb_context *ctdb,
 {
 	struct ctdb_node_map *nodemap, *nodemap2;
 	struct ctdb_node_and_flags *node;
-	int i;
+	unsigned int i;
 
 	nodemap = get_nodemap(ctdb, false);
 	if (nodemap == NULL) {
@@ -507,7 +507,8 @@ static struct ctdb_dbid *db_find(TALLOC_CTX *mem_ctx,
 {
 	struct ctdb_dbid *db = NULL;
 	const char *name;
-	int ret, i;
+	unsigned int i;
+	int ret;
 
 	for (i=0; i<dbmap->num; i++) {
 		ret = ctdb_ctrl_get_dbname(mem_ctx, ctdb->ev, ctdb->client,
@@ -535,7 +536,7 @@ static bool db_exists(TALLOC_CTX *mem_ctx, struct ctdb_context *ctdb,
 	struct ctdb_dbid *db = NULL;
 	uint32_t id = 0;
 	const char *name = NULL;
-	int i;
+	unsigned int i;
 	int ret = 0;
 
 	ret = ctdb_ctrl_get_dbmap(mem_ctx, ctdb->ev, ctdb->client,
@@ -599,7 +600,7 @@ static int h2i(char h)
 static int hex_to_data(const char *str, size_t len, TALLOC_CTX *mem_ctx,
 		       TDB_DATA *out)
 {
-	int i;
+	unsigned int i;
 	TDB_DATA data;
 
 	if (len & 0x01) {
@@ -731,7 +732,8 @@ static bool partially_online(TALLOC_CTX *mem_ctx,
 			     struct ctdb_node_and_flags *node)
 {
 	struct ctdb_iface_list *iface_list;
-	int ret, i;
+	unsigned int i;
+	int ret;
 	bool status = false;
 
 	if (node->flags != 0) {
@@ -761,7 +763,7 @@ static void print_nodemap_machine(TALLOC_CTX *mem_ctx,
 				  uint32_t mypnn)
 {
 	struct ctdb_node_and_flags *node;
-	int i;
+	unsigned int i;
 
 	printf("%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s\n",
 	       options.sep,
@@ -806,7 +808,7 @@ static void print_nodemap(TALLOC_CTX *mem_ctx, struct ctdb_context *ctdb,
 {
 	struct ctdb_node_and_flags *node;
 	int num_deleted_nodes = 0;
-	int i;
+	unsigned int i;
 
 	for (i=0; i<nodemap->num; i++) {
 		if (nodemap->node[i].flags & NODE_FLAGS_DELETED) {
@@ -845,7 +847,7 @@ static void print_status(TALLOC_CTX *mem_ctx, struct ctdb_context *ctdb,
 			 struct ctdb_vnn_map *vnnmap, int recmode,
 			 uint32_t recmaster)
 {
-	int i;
+	unsigned int i;
 
 	print_nodemap(mem_ctx, ctdb, nodemap, mypnn, true);
 
@@ -1186,7 +1188,7 @@ const struct {
 static void print_statistics_machine(struct ctdb_statistics *s,
 				     bool show_header)
 {
-	int i;
+	size_t i;
 
 	if (show_header) {
 		printf("CTDB version%s", options.sep);
@@ -1260,7 +1262,7 @@ static void print_statistics_machine(struct ctdb_statistics *s,
 static void print_statistics(struct ctdb_statistics *s)
 {
 	int tmp, days, hours, minutes, seconds;
-	int i;
+	size_t i;
 	const char *prefix = NULL;
 	int preflen = 0;
 
@@ -1429,7 +1431,7 @@ static void print_ip(TALLOC_CTX *mem_ctx, struct ctdb_context *ctdb,
 		     struct ctdb_public_ip_info **ipinfo,
 		     bool all_nodes)
 {
-	int i, j;
+	unsigned int i, j;
 	char *conf, *avail, *active;
 
 	if (options.machinereadable == 1) {
@@ -1546,7 +1548,8 @@ static int get_all_public_ips(struct ctdb_context *ctdb, TALLOC_CTX *mem_ctx,
 	struct ctdb_public_ip_list *ips;
 	struct db_hash_context *ipdb;
 	uint32_t *pnn_list;
-	int ret, count, i, j;
+	unsigned int j;
+	int ret, count, i;
 
 	nodemap = get_nodemap(ctdb, false);
 	if (nodemap == NULL) {
@@ -1653,7 +1656,8 @@ static int control_ip(TALLOC_CTX *mem_ctx, struct ctdb_context *ctdb,
 {
 	struct ctdb_public_ip_list *ips;
 	struct ctdb_public_ip_info **ipinfo;
-	int ret, i;
+	unsigned int i;
+	int ret;
 	bool do_all = false;
 
 	if (argc > 1) {
@@ -1716,7 +1720,8 @@ static int control_ipinfo(TALLOC_CTX *mem_ctx, struct ctdb_context *ctdb,
 {
 	struct ctdb_public_ip_info *ipinfo;
 	ctdb_sock_addr addr;
-	int ret, i;
+	unsigned int i;
+	int ret;
 
 	if (argc != 1) {
 		usage("ipinfo");
@@ -1766,7 +1771,8 @@ static int control_ifaces(TALLOC_CTX *mem_ctx, struct ctdb_context *ctdb,
 			  int argc, const char **argv)
 {
 	struct ctdb_iface_list *ifaces;
-	int ret, i;
+	unsigned int i;
+	int ret;
 
 	if (argc != 0) {
 		usage("ifaces");
@@ -1815,7 +1821,8 @@ static int control_setifacelink(TALLOC_CTX *mem_ctx, struct ctdb_context *ctdb,
 {
 	struct ctdb_iface_list *ifaces;
 	struct ctdb_iface *iface;
-	int ret, i;
+	unsigned int i;
+	int ret;
 
 	if (argc != 2) {
 		usage("setifacelink");
@@ -1923,7 +1930,8 @@ static int control_getdbmap(TALLOC_CTX *mem_ctx, struct ctdb_context *ctdb,
 			    int argc, const char **argv)
 {
 	struct ctdb_dbid_map *dbmap;
-	int ret, i;
+	unsigned int i;
+	int ret;
 
 	if (argc != 0) {
 		usage("getdbmap");
@@ -2065,7 +2073,7 @@ struct dump_record_state {
 
 static void dump_tdb_data(const char *name, TDB_DATA val)
 {
-	int i;
+	size_t i;
 
 	fprintf(stdout, "%s(%zu) = \"", name, val.dsize);
 	for (i=0; i<val.dsize; i++) {
@@ -3051,7 +3059,7 @@ static int control_tickle(TALLOC_CTX *mem_ctx, struct ctdb_context *ctdb,
 
 	if (argc == 0) {
 		struct ctdb_connection_list *clist;
-		int i;
+		unsigned int i;
 		unsigned int num_failed;
 
 		/* Client first but the src/dst logic is confused */
@@ -3109,7 +3117,7 @@ static int control_gettickles(TALLOC_CTX *mem_ctx, struct ctdb_context *ctdb,
 	ctdb_sock_addr addr;
 	struct ctdb_tickle_list *tickles;
 	unsigned port = 0;
-	int i;
+	unsigned int i;
 	int ret = 0;
 
 	if (argc < 1 || argc > 2) {
@@ -3184,7 +3192,7 @@ typedef int (*clist_reply_func)(struct ctdb_reply_control *reply);
 struct process_clist_state {
 	struct ctdb_connection_list *clist;
 	int count;
-	int num_failed, num_total;
+	unsigned int num_failed, num_total;
 	clist_reply_func reply_func;
 };
 
@@ -3200,7 +3208,7 @@ static struct tevent_req *process_clist_send(
 	struct tevent_req *req, *subreq;
 	struct process_clist_state *state;
 	struct ctdb_req_control request;
-	int i;
+	unsigned int i;
 
 	req = tevent_req_create(mem_ctx, &state, struct process_clist_state);
 	if (req == NULL) {
@@ -3395,7 +3403,7 @@ static int control_listnodes(TALLOC_CTX *mem_ctx, struct ctdb_context *ctdb,
 			     int argc, const char **argv)
 {
 	struct ctdb_node_map *nodemap;
-	int i;
+	unsigned int i;
 
 	if (argc != 0) {
 		usage("listnodes");
@@ -3430,7 +3438,7 @@ static int control_listnodes(TALLOC_CTX *mem_ctx, struct ctdb_context *ctdb,
 static bool nodemap_identical(struct ctdb_node_map *nodemap1,
 			      struct ctdb_node_map *nodemap2)
 {
-	int i;
+	unsigned int i;
 
 	if (nodemap1->num != nodemap2->num) {
 		return false;
@@ -3457,7 +3465,7 @@ static int check_node_file_changes(TALLOC_CTX *mem_ctx,
 				   struct ctdb_node_map *fnm,
 				   bool *reload)
 {
-	int i;
+	unsigned int i;
 	bool check_failed = false;
 
 	*reload = false;
@@ -3542,7 +3550,7 @@ static int check_node_file_changes(TALLOC_CTX *mem_ctx,
 
 struct disable_recoveries_state {
 	uint32_t *pnn_list;
-	int node_count;
+	unsigned int node_count;
 	bool *reply;
 	int status;
 	bool done;
@@ -3553,7 +3561,8 @@ static void disable_recoveries_handler(uint64_t srvid, TDB_DATA data,
 {
 	struct disable_recoveries_state *state =
 		(struct disable_recoveries_state *)private_data;
-	int ret, i;
+	unsigned int i;
+	int ret;
 
 	if (data.dsize != sizeof(int)) {
 		/* Ignore packet */
@@ -3643,9 +3652,9 @@ static int control_reloadnodes(TALLOC_CTX *mem_ctx, struct ctdb_context *ctdb,
 	struct ctdb_req_control request;
 	struct ctdb_reply_control **reply;
 	bool reload;
-	int ret, i;
+	unsigned int i, count;
+	int ret;
 	uint32_t *pnn_list;
-	int count;
 
 	nodemap = get_nodemap(ctdb, false);
 	if (nodemap == NULL) {
@@ -3745,7 +3754,8 @@ static int moveip(TALLOC_CTX *mem_ctx, struct ctdb_context *ctdb,
 	struct ctdb_node_map *nodemap;
 	struct ctdb_req_control request;
 	uint32_t *pnn_list;
-	int ret, i, count;
+	unsigned int i;
+	int ret, count;
 
 	ret = ctdb_message_disable_ip_check(mem_ctx, ctdb->ev, ctdb->client,
 					    CTDB_BROADCAST_CONNECTED,
@@ -3873,8 +3883,8 @@ static int control_addip(TALLOC_CTX *mem_ctx, struct ctdb_context *ctdb,
 	ctdb_sock_addr addr;
 	struct ctdb_public_ip_list *pubip_list;
 	struct ctdb_addr_info addr_info;
-	unsigned int mask;
-	int ret, i, retries = 0;
+	unsigned int mask, i;
+	int ret, retries = 0;
 
 	if (argc != 2) {
 		usage("addip");
@@ -3940,7 +3950,8 @@ static int control_delip(TALLOC_CTX *mem_ctx, struct ctdb_context *ctdb,
 	ctdb_sock_addr addr;
 	struct ctdb_public_ip_list *pubip_list;
 	struct ctdb_addr_info addr_info;
-	int ret, i;
+	unsigned int i;
+	int ret;
 
 	if (argc != 1) {
 		usage("delip");
@@ -4157,8 +4168,9 @@ static int control_restoredb(TALLOC_CTX *mem_ctx, struct ctdb_context *ctdb,
 	uint32_t *pnn_list;
 	char timebuf[128];
 	ssize_t n;
-	int fd, i;
-	int count, ret;
+	int fd;
+	unsigned long i, count;
+	int ret;
 	uint8_t db_flags;
 
 	if (argc < 1 || argc > 2) {
@@ -4398,7 +4410,8 @@ static int control_dumpdbbackup(TALLOC_CTX *mem_ctx, struct ctdb_context *ctdb,
 	char timebuf[128];
 	struct dumpdbbackup_state state;
 	ssize_t n;
-	int fd, ret, i;
+	unsigned long i;
+	int fd, ret;
 
 	if (argc != 1) {
 		usage("dumpbackup");
@@ -4660,7 +4673,7 @@ static int control_natgw(TALLOC_CTX *mem_ctx, struct ctdb_context *ctdb,
 static bool find_node_xpnn(TALLOC_CTX *mem_ctx, uint32_t *pnn)
 {
 	struct ctdb_node_map *nodemap;
-	int i;
+	unsigned int i;
 
 	nodemap = read_nodes_file(mem_ctx, CTDB_UNKNOWN_PNN);
 	if (nodemap == NULL) {
@@ -5559,7 +5572,8 @@ static int control_nodestatus(TALLOC_CTX *mem_ctx, struct ctdb_context *ctdb,
 {
 	const char *nodestring = NULL;
 	struct ctdb_node_map *nodemap;
-	int ret, i;
+	unsigned int i;
+	int ret;
 	bool print_hdr = false;
 
 	if (argc > 1) {
@@ -5607,7 +5621,7 @@ const struct {
 static void print_dbstatistics(const char *db_name,
 			       struct ctdb_db_statistics *s)
 {
-	int i;
+	size_t i;
 	const char *prefix = NULL;
 	int preflen = 0;
 
@@ -5654,7 +5668,7 @@ static void print_dbstatistics(const char *db_name,
 
 	printf(" Num Hot Keys:     %d\n", s->num_hot_keys);
 	for (i=0; i<s->num_hot_keys; i++) {
-		int j;
+		size_t j;
 		printf("     Count:%d Key:", s->hot_keys[i].count);
 		for (j=0; j<s->hot_keys[i].key.dsize; j++) {
 			printf("%02x", s->hot_keys[i].key.dptr[j] & 0xff);
@@ -5694,7 +5708,7 @@ static int control_dbstatistics(TALLOC_CTX *mem_ctx, struct ctdb_context *ctdb,
 
 struct disable_takeover_runs_state {
 	uint32_t *pnn_list;
-	int node_count;
+	unsigned int node_count;
 	bool *reply;
 	int status;
 	bool done;
@@ -5705,7 +5719,8 @@ static void disable_takeover_run_handler(uint64_t srvid, TDB_DATA data,
 {
 	struct disable_takeover_runs_state *state =
 		(struct disable_takeover_runs_state *)private_data;
-	int ret, i;
+	unsigned int i;
+	int ret;
 
 	if (data.dsize != sizeof(int)) {
 		/* Ignore packet */
@@ -6038,7 +6053,7 @@ static const struct ctdb_cmd {
 static const struct ctdb_cmd *match_command(const char *command)
 {
 	const struct ctdb_cmd *cmd;
-	int i;
+	size_t i;
 
 	for (i=0; i<ARRAY_SIZE(ctdb_commands); i++) {
 		cmd = &ctdb_commands[i];
@@ -6057,7 +6072,7 @@ static const struct ctdb_cmd *match_command(const char *command)
  */
 static void usage_full(void)
 {
-	int i;
+	size_t i;
 
 	poptPrintHelp(pc, stdout, 0);
 	printf("\nCommands:\n");
-- 
2.20.1


From 876751f06af1d23ffdef0514b1c49883fa6b04f0 Mon Sep 17 00:00:00 2001
From: Martin Schwenke <martin@meltin.net>
Date: Fri, 24 May 2019 13:50:07 +1000
Subject: [PATCH 02/28] ctdb-tools: Fix signed/unsigned comparisons by
 declaring extra variable

This needs an extra variable because variable i has been used in both
signed and unsigned contexts.

Signed-off-by: Martin Schwenke <martin@meltin.net>
---
 ctdb/tools/ctdb.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/ctdb/tools/ctdb.c b/ctdb/tools/ctdb.c
index 84333ed1d49..38f9e5e1781 100644
--- a/ctdb/tools/ctdb.c
+++ b/ctdb/tools/ctdb.c
@@ -2363,6 +2363,7 @@ static int control_detach(TALLOC_CTX *mem_ctx, struct ctdb_context *ctdb,
 	uint8_t db_flags;
 	struct ctdb_node_map *nodemap;
 	int recmode;
+	unsigned int j;
 	int ret, ret2, i;
 
 	if (argc < 1) {
@@ -2386,29 +2387,29 @@ static int control_detach(TALLOC_CTX *mem_ctx, struct ctdb_context *ctdb,
 		return 1;
 	}
 
-	for (i=0; i<nodemap->num; i++) {
+	for (j=0; j<nodemap->num; j++) {
 		uint32_t value;
 
-		if (nodemap->node[i].flags & NODE_FLAGS_DISCONNECTED) {
+		if (nodemap->node[j].flags & NODE_FLAGS_DISCONNECTED) {
 			continue;
 		}
-		if (nodemap->node[i].flags & NODE_FLAGS_DELETED) {
+		if (nodemap->node[j].flags & NODE_FLAGS_DELETED) {
 			continue;
 		}
-		if (nodemap->node[i].flags & NODE_FLAGS_INACTIVE) {
+		if (nodemap->node[j].flags & NODE_FLAGS_INACTIVE) {
 			fprintf(stderr, "Database cannot be detached on"
 				" inactive (stopped or banned) node %u\n",
-				nodemap->node[i].pnn);
+				nodemap->node[j].pnn);
 			return 1;
 		}
 
 		ret = ctdb_ctrl_get_tunable(mem_ctx, ctdb->ev, ctdb->client,
-					    nodemap->node[i].pnn, TIMEOUT(),
+					    nodemap->node[j].pnn, TIMEOUT(),
 					    "AllowClientDBAttach", &value);
 		if (ret != 0) {
 			fprintf(stderr,
 				"Unable to get tunable AllowClientDBAttach"
-			        " from node %u\n", nodemap->node[i].pnn);
+			        " from node %u\n", nodemap->node[j].pnn);
 			return ret;
 		}
 
@@ -2416,7 +2417,7 @@ static int control_detach(TALLOC_CTX *mem_ctx, struct ctdb_context *ctdb,
 			fprintf(stderr,
 				"Database access is still active on node %u."
 			        " Set AllowclientDBAttach=0 on all nodes.\n",
-				nodemap->node[i].pnn);
+				nodemap->node[j].pnn);
 			return 1;
 		}
 	}
-- 
2.20.1


From f8479cd429b62e675bdb4562cd9729cda3ef284f Mon Sep 17 00:00:00 2001
From: Martin Schwenke <martin@meltin.net>
Date: Wed, 22 May 2019 21:57:07 +1000
Subject: [PATCH 03/28] ctdb-tools: Fix signed/unsigned comparisons by casting

Signed-off-by: Martin Schwenke <martin@meltin.net>
---
 ctdb/tools/ctdb.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/ctdb/tools/ctdb.c b/ctdb/tools/ctdb.c
index 38f9e5e1781..5445ba33cd2 100644
--- a/ctdb/tools/ctdb.c
+++ b/ctdb/tools/ctdb.c
@@ -229,7 +229,7 @@ static bool verify_pnn(struct ctdb_context *ctdb, int pnn)
 
 	found = false;
 	for (i=0; i<nodemap->num; i++) {
-		if (nodemap->node[i].pnn == pnn) {
+		if (nodemap->node[i].pnn == (uint32_t)pnn) {
 			found = true;
 			break;
 		}
@@ -1637,7 +1637,7 @@ static int get_all_public_ips(struct ctdb_context *ctdb, TALLOC_CTX *mem_ctx,
 		goto failed;
 	}
 
-	if (count != ips->num) {
+	if ((unsigned int)count != ips->num) {
 		goto failed;
 	}
 
@@ -2460,7 +2460,7 @@ static int control_dumpmemory(TALLOC_CTX *mem_ctx, struct ctdb_context *ctdb,
 	}
 
 	n = write(1, mem_str, strlen(mem_str));
-	if (n < 0 || n != strlen(mem_str)) {
+	if (n < 0 || (size_t)n != strlen(mem_str)) {
 		fprintf(stderr, "Failed to write talloc summary\n");
 		return 1;
 	}
@@ -2476,7 +2476,7 @@ static void dump_memory(uint64_t srvid, TDB_DATA data, void *private_data)
 
 	len = strnlen((const char *)data.dptr, data.dsize);
 	n = write(1, data.dptr, len);
-	if (n < 0 || n != len) {
+	if (n < 0 || (size_t)n != len) {
 		fprintf(stderr, "Failed to write talloc summary\n");
 	}
 
@@ -3578,7 +3578,7 @@ static void disable_recoveries_handler(uint64_t srvid, TDB_DATA data,
 		return;
 	}
 	for (i=0; i<state->node_count; i++) {
-		if (state->pnn_list[i] == ret) {
+		if (state->pnn_list[i] == (uint32_t)ret) {
 			state->reply[i] = true;
 			break;
 		}
@@ -5234,7 +5234,8 @@ static int control_tfetch(TALLOC_CTX *mem_ctx, struct ctdb_context *ctdb,
 		}
 
 		nwritten = sys_write(fd, data.dptr, data.dsize);
-		if (nwritten != data.dsize) {
+		if (nwritten == -1 ||
+		    (size_t)nwritten != data.dsize) {
 			fprintf(stderr, "Failed to write record to file\n");
 			close(fd);
 			goto fail;
@@ -5736,7 +5737,7 @@ static void disable_takeover_run_handler(uint64_t srvid, TDB_DATA data,
 		return;
 	}
 	for (i=0; i<state->node_count; i++) {
-		if (state->pnn_list[i] == ret) {
+		if (state->pnn_list[i] == (uint32_t)ret) {
 			state->reply[i] = true;
 			break;
 		}
-- 
2.20.1


From 32d874dca5b684e4da337c9af62779ae95901eba Mon Sep 17 00:00:00 2001
From: Martin Schwenke <martin@meltin.net>
Date: Wed, 22 May 2019 21:54:04 +1000
Subject: [PATCH 04/28] ctdb-tools: Fix signed/unsigned comparison by declaring
 as unsigned

Signed-off-by: Martin Schwenke <martin@meltin.net>
---
 ctdb/tools/ctdb_killtcp.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/ctdb/tools/ctdb_killtcp.c b/ctdb/tools/ctdb_killtcp.c
index fc443bd08e2..bab81092058 100644
--- a/ctdb/tools/ctdb_killtcp.c
+++ b/ctdb/tools/ctdb_killtcp.c
@@ -66,7 +66,8 @@ static struct tevent_req *reset_connections_send(
 {
 	struct tevent_req *req, *subreq;
 	struct reset_connections_state *state;
-	int i, ret;
+	unsigned int i;
+	int ret;
 
 	req = tevent_req_create(mem_ctx, &state,
 				struct reset_connections_state);
-- 
2.20.1


From f5c336da8b0455d52454e0783aa38f7628af6271 Mon Sep 17 00:00:00 2001
From: Martin Schwenke <martin@meltin.net>
Date: Tue, 28 May 2019 10:55:19 +1000
Subject: [PATCH 05/28] ctdb-tools: Fix signed/unsigned comparison by declaring
 as int

There's no point using unsigned here.  tdb_traverse() returns an int
for the number of records traversed and the number of empty records
can't exceed this value.

Signed-off-by: Martin Schwenke <martin@meltin.net>
---
 ctdb/tools/ltdbtool.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/ctdb/tools/ltdbtool.c b/ctdb/tools/ltdbtool.c
index edb17ce5557..d33480ce8fe 100644
--- a/ctdb/tools/ltdbtool.c
+++ b/ctdb/tools/ltdbtool.c
@@ -269,7 +269,7 @@ struct ltdb_traverse_ctx {
 	void* state;
 	size_t hsize;
 	bool skip_empty;
-	unsigned nempty;
+	int nempty;
 };
 
 static int
-- 
2.20.1


From 31828b726bbe74b576d377044a140734b24346dd Mon Sep 17 00:00:00 2001
From: Martin Schwenke <martin@meltin.net>
Date: Tue, 28 May 2019 10:57:49 +1000
Subject: [PATCH 06/28] ctdb-tools: Fix signed/unsigned conversion by declaring
 as size_t

All the top-level callers pass size_t.

Drop the ternary operator.  The value of hsize is always positive
because it is unsigned.

Signed-off-by: Martin Schwenke <martin@meltin.net>
---
 ctdb/tools/ltdbtool.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/ctdb/tools/ltdbtool.c b/ctdb/tools/ltdbtool.c
index d33480ce8fe..98a1b516751 100644
--- a/ctdb/tools/ltdbtool.c
+++ b/ctdb/tools/ltdbtool.c
@@ -96,7 +96,7 @@ static int usage(const char* cmd)
 static int
 ltdb_traverse(TDB_CONTEXT *tdb, int (*fn)(TDB_CONTEXT*, TDB_DATA, TDB_DATA,
 					  struct ctdb_ltdb_header*, void *),
-	      void *state, int hsize, bool skip_empty);
+	      void *state, size_t hsize, bool skip_empty);
 
 struct write_record_ctx {
 	TDB_CONTEXT* tdb;
@@ -125,7 +125,10 @@ static void dump_header_nop(struct dump_record_ctx* c,
 			    struct ctdb_ltdb_header* h)
 {}
 
-static int dump_db(const char* iname, FILE* ofile, int hsize, bool dump_header,
+static int dump_db(const char* iname,
+		   FILE* ofile,
+		   size_t hsize,
+		   bool dump_header,
 		   bool empty)
 {
 	int ret = -1;
@@ -307,12 +310,12 @@ ltdb_traverse_fn(TDB_CONTEXT* tdb, TDB_DATA key, TDB_DATA val,
 static int ltdb_traverse(TDB_CONTEXT *tdb,
 			 int (*fn)(TDB_CONTEXT*, TDB_DATA, TDB_DATA,
 				   struct ctdb_ltdb_header*, void *),
-			 void *state, int hsize, bool skip_empty)
+			 void *state, size_t hsize, bool skip_empty)
 {
 	struct ltdb_traverse_ctx ctx = {
 		.fn = fn,
 		.state = state,
-		.hsize = hsize < 0 ? sizeof(struct ctdb_ltdb_header) : hsize,
+		.hsize = hsize,
 		.skip_empty = skip_empty,
 		.nempty = 0,
 	};
-- 
2.20.1


From 0848a487d8019ff95028692444b351d515047027 Mon Sep 17 00:00:00 2001
From: Martin Schwenke <martin@meltin.net>
Date: Wed, 22 May 2019 21:57:43 +1000
Subject: [PATCH 07/28] ctdb-tools: Fix potentially uninitialised data

Signed-off-by: Martin Schwenke <martin@meltin.net>
---
 ctdb/tools/ctdb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/ctdb/tools/ctdb.c b/ctdb/tools/ctdb.c
index 5445ba33cd2..d79945460f9 100644
--- a/ctdb/tools/ctdb.c
+++ b/ctdb/tools/ctdb.c
@@ -5112,7 +5112,7 @@ static int control_ptrans(TALLOC_CTX *mem_ctx, struct ctdb_context *ctdb,
 	struct ctdb_transaction_handle *h;
 	uint8_t db_flags;
 	FILE *file;
-	TDB_DATA key, value;
+	TDB_DATA key = tdb_null, value = tdb_null;
 	int ret;
 
 	if (argc < 1 || argc > 2) {
-- 
2.20.1


From d261d5d1788057e8ba9f2879f4b754a8333c735f Mon Sep 17 00:00:00 2001
From: Martin Schwenke <martin@meltin.net>
Date: Wed, 22 May 2019 21:55:18 +1000
Subject: [PATCH 08/28] ctdb-common: Fix signed/unsigned comparisons by
 declaring as unsigned

Simple cases where a variable (usually a loop variable) needs to be
declared as an unsigned type (unsigned int or size_t) instead of an
int.

Signed-off-by: Martin Schwenke <martin@meltin.net>
---
 ctdb/common/cmdline.c   | 7 ++++---
 ctdb/common/logging.c   | 6 +++---
 ctdb/common/run_event.c | 5 +++--
 3 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/ctdb/common/cmdline.c b/ctdb/common/cmdline.c
index ee360d4c920..f3768c068fe 100644
--- a/ctdb/common/cmdline.c
+++ b/ctdb/common/cmdline.c
@@ -143,7 +143,7 @@ static int cmdline_options_define(TALLOC_CTX *mem_ctx,
 	return 0;
 }
 
-static bool cmdline_command_check(struct cmdline_command *cmd, int *max_len)
+static bool cmdline_command_check(struct cmdline_command *cmd, size_t *max_len)
 {
 	size_t len;
 
@@ -185,7 +185,7 @@ static bool cmdline_command_check(struct cmdline_command *cmd, int *max_len)
 }
 
 static bool cmdline_commands_check(struct cmdline_command *commands,
-				   int *max_len)
+				   size_t *max_len)
 {
 	int i;
 	bool ok;
@@ -213,7 +213,8 @@ int cmdline_init(TALLOC_CTX *mem_ctx,
 		 struct cmdline_context **result)
 {
 	struct cmdline_context *cmdline;
-	int ret, max_len = 0;
+	int ret;
+	size_t max_len = 0;
 	bool ok;
 
 	if (prog == NULL) {
diff --git a/ctdb/common/logging.c b/ctdb/common/logging.c
index 7ed500aeb0b..fd763170304 100644
--- a/ctdb/common/logging.c
+++ b/ctdb/common/logging.c
@@ -54,7 +54,7 @@ struct {
 
 bool debug_level_parse(const char *log_string, int *log_level)
 {
-	int i;
+	size_t i;
 
 	if (log_string == NULL) {
 		return false;
@@ -83,7 +83,7 @@ bool debug_level_parse(const char *log_string, int *log_level)
 
 const char *debug_level_to_string(int log_level)
 {
-	int i;
+	size_t i;
 
 	for (i=0; i < ARRAY_SIZE(log_string_map); i++) {
 		if (log_string_map[i].log_level == log_level) {
@@ -604,7 +604,7 @@ static int log_backend_parse(TALLOC_CTX *mem_ctx,
 {
 	struct log_backend *b = NULL;
 	char *t, *name, *option;
-	int i;
+	size_t i;
 
 	t = talloc_strdup(mem_ctx, logging);
 	if (t == NULL) {
diff --git a/ctdb/common/run_event.c b/ctdb/common/run_event.c
index 91b3dd3241a..27e7ad6055e 100644
--- a/ctdb/common/run_event.c
+++ b/ctdb/common/run_event.c
@@ -101,7 +101,7 @@ static int script_args(TALLOC_CTX *mem_ctx, const char *event_str,
 		       const char *arg_str, const char ***out)
 {
 	const char **argv;
-	int argc;
+	size_t argc;
 	size_t len;
 
 	/* Preallocate argv array to avoid reallocation. */
@@ -287,7 +287,8 @@ int run_event_list(struct run_event_context *run_ctx,
 {
 	struct event_script_list *s_list;
 	struct run_event_script_list *script_list;
-	int ret, i;
+	unsigned int i;
+	int ret;
 
 	ret = event_script_get_list(mem_ctx,
 				    run_event_script_dir(run_ctx),
-- 
2.20.1


From aa14bb7bd4f0c52e480d8a6f49867a790f880ed9 Mon Sep 17 00:00:00 2001
From: Martin Schwenke <martin@meltin.net>
Date: Sun, 2 Jun 2019 14:05:28 +1000
Subject: [PATCH 09/28] ctdb-common: Fix signed/unsigned comparisons by casting

In one case, given triviality of change, add missing braces and fix
whitespace.

Signed-off-by: Martin Schwenke <martin@meltin.net>
---
 ctdb/common/logging.c | 14 +++++++-------
 ctdb/common/path.c    |  2 +-
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/ctdb/common/logging.c b/ctdb/common/logging.c
index fd763170304..a4321b68ba9 100644
--- a/ctdb/common/logging.c
+++ b/ctdb/common/logging.c
@@ -63,7 +63,7 @@ bool debug_level_parse(const char *log_string, int *log_level)
 	if (isdigit(log_string[0])) {
 		int level = atoi(log_string);
 
-		if (level >= 0 && level < ARRAY_SIZE(log_string_map)) {
+		if (level >= 0 && (size_t)level < ARRAY_SIZE(log_string_map)) {
 			*log_level = level;
 			return true;
 		}
@@ -253,12 +253,12 @@ static int debug_level_to_priority(int level)
         };
         int priority;
 
-        if( level >= ARRAY_SIZE(priority_map) || level < 0)
-                priority = LOG_DEBUG;
-        else
-                priority = priority_map[level];
-
-        return priority;
+	if ((size_t)level >= ARRAY_SIZE(priority_map) || level < 0) {
+		priority = LOG_DEBUG;
+	} else {
+		priority = priority_map[level];
+	}
+	return priority;
 }
 
 struct syslog_log_state {
diff --git a/ctdb/common/path.c b/ctdb/common/path.c
index 69e606b4ede..ea3b08f4b2e 100644
--- a/ctdb/common/path.c
+++ b/ctdb/common/path.c
@@ -89,7 +89,7 @@ static bool path_construct(char *path, const char *subdir)
 			       subdir);
 	}
 
-	if (len >= sizeof(p)) {
+	if ((size_t)len >= sizeof(p)) {
 		return false;
 	}
 
-- 
2.20.1


From e19e883a1c3abd0984382bbc6257a750eec75ae6 Mon Sep 17 00:00:00 2001
From: Martin Schwenke <martin@meltin.net>
Date: Thu, 23 May 2019 17:49:26 +1000
Subject: [PATCH 10/28] ctdb-common: Use #ifdef to avoid TEST_RB_TREE not
 defined

Signed-off-by: Martin Schwenke <martin@meltin.net>
---
 ctdb/common/rb_tree.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/ctdb/common/rb_tree.c b/ctdb/common/rb_tree.c
index bacdea6c689..d94d15efd74 100644
--- a/ctdb/common/rb_tree.c
+++ b/ctdb/common/rb_tree.c
@@ -1029,7 +1029,7 @@ trbt_findfirstarray32(trbt_tree_t *tree, uint32_t keylen)
 }
 
 
-#if TEST_RB_TREE
+#ifdef TEST_RB_TREE
 static void printtree(trbt_node_t *node, int levels)
 {
 	int i;
@@ -1098,4 +1098,4 @@ exit(0);
 
 }
 
-#endif
+#endif /* TEST_RB_TREE */
-- 
2.20.1


From 934f9e6b4369734c5d57e4ed846982cac3cc08a7 Mon Sep 17 00:00:00 2001
From: Martin Schwenke <martin@meltin.net>
Date: Thu, 23 May 2019 17:51:46 +1000
Subject: [PATCH 11/28] ctdb-common: Avoid warning for potentially
 uninitialised pointers

s_list generates a warning, but initialise them both.

Signed-off-by: Martin Schwenke <martin@meltin.net>
---
 ctdb/common/run_event.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/ctdb/common/run_event.c b/ctdb/common/run_event.c
index 27e7ad6055e..3682f778768 100644
--- a/ctdb/common/run_event.c
+++ b/ctdb/common/run_event.c
@@ -285,8 +285,8 @@ int run_event_list(struct run_event_context *run_ctx,
 		   TALLOC_CTX *mem_ctx,
 		   struct run_event_script_list **output)
 {
-	struct event_script_list *s_list;
-	struct run_event_script_list *script_list;
+	struct event_script_list *s_list = NULL;
+	struct run_event_script_list *script_list = NULL;
 	unsigned int i;
 	int ret;
 
-- 
2.20.1


From 357bc0acc8aa66bec2ffb393ffc057105393f61e Mon Sep 17 00:00:00 2001
From: Martin Schwenke <martin@meltin.net>
Date: Thu, 23 May 2019 17:53:19 +1000
Subject: [PATCH 12/28] ctdb-common: Avoid unused value warning

The incremented value of argc is indeed never used.  Leave it as a
comment to warn anyone cutting and pasting the code.

Signed-off-by: Martin Schwenke <martin@meltin.net>
---
 ctdb/common/run_event.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/ctdb/common/run_event.c b/ctdb/common/run_event.c
index 3682f778768..ca4e572a806 100644
--- a/ctdb/common/run_event.c
+++ b/ctdb/common/run_event.c
@@ -146,7 +146,7 @@ static int script_args(TALLOC_CTX *mem_ctx, const char *event_str,
 	}
 
 	argv[argc] = NULL;
-	argc += 1;
+	/* argc += 1 */
 
 	*out = argv;
 	return 0;
-- 
2.20.1


From 8d433cf1ff7d4190c1c2a534764fa40a526aa3af Mon Sep 17 00:00:00 2001
From: Martin Schwenke <martin@meltin.net>
Date: Wed, 22 May 2019 21:55:56 +1000
Subject: [PATCH 13/28] ctdb-client: Fix signed/unsigned comparisons by
 declaring as unsigned

Simple cases where a variables and function parameters need to be
declared as an unsigned type instead of an int.

Signed-off-by: Martin Schwenke <martin@meltin.net>
---
 ctdb/client/client.h        | 8 ++++----
 ctdb/client/client_db.c     | 3 ++-
 ctdb/client/client_tunnel.c | 8 ++++----
 ctdb/client/client_util.c   | 2 +-
 4 files changed, 11 insertions(+), 10 deletions(-)

diff --git a/ctdb/client/client.h b/ctdb/client/client.h
index d4d145045e0..0df76a66e46 100644
--- a/ctdb/client/client.h
+++ b/ctdb/client/client.h
@@ -691,7 +691,7 @@ int ctdb_tunnel_destroy(struct tevent_context *ev,
 struct tevent_req *ctdb_tunnel_request_send(TALLOC_CTX *mem_ctx,
 					    struct tevent_context *ev,
 					    struct ctdb_tunnel_context *tctx,
-					    int destnode,
+					    uint32_t destnode,
 					    struct timeval timeout,
 					    uint8_t *buf, size_t buflen,
 					    bool wait_for_reply);
@@ -724,7 +724,7 @@ bool ctdb_tunnel_request_recv(struct tevent_req *req, int *perr,
  * @return 0 on success, errno on failure
  */
 int ctdb_tunnel_request(TALLOC_CTX *mem_ctx, struct tevent_context *ev,
-			struct ctdb_tunnel_context *tctx, int destnode,
+			struct ctdb_tunnel_context *tctx, uint32_t destnode,
 			struct timeval timeout, uint8_t *buf, size_t buflen,
 			bool wait_for_reply);
 
@@ -744,7 +744,7 @@ int ctdb_tunnel_request(TALLOC_CTX *mem_ctx, struct tevent_context *ev,
 struct tevent_req *ctdb_tunnel_reply_send(TALLOC_CTX *mem_ctx,
 					  struct tevent_context *ev,
 					  struct ctdb_tunnel_context *tctx,
-					  int destnode, uint32_t reqid,
+					  uint32_t destnode, uint32_t reqid,
 					  struct timeval timeout,
 					  uint8_t *buf, size_t buflen);
 
@@ -771,7 +771,7 @@ bool ctdb_tunnel_reply_recv(struct tevent_req *req, int *perr);
  * @return 0 on success, errno on failure
  */
 int ctdb_tunnel_reply(TALLOC_CTX *mem_ctx, struct tevent_context *ev,
-		      struct ctdb_tunnel_context *tctx, int destnode,
+		      struct ctdb_tunnel_context *tctx, uint32_t destnode,
 		      uint32_t reqid, struct timeval timeout,
 		      uint8_t *buf, size_t buflen);
 
diff --git a/ctdb/client/client_db.c b/ctdb/client/client_db.c
index c0ecdeb2d30..c9ddde3d422 100644
--- a/ctdb/client/client_db.c
+++ b/ctdb/client/client_db.c
@@ -2018,7 +2018,8 @@ static int ctdb_g_lock_unlock_update(struct tevent_req *req)
 	struct ctdb_g_lock_unlock_state *state = tevent_req_data(
 		req, struct ctdb_g_lock_unlock_state);
 	struct ctdb_g_lock *lock;
-	int ret, i;
+	unsigned int i;
+	int ret;
 
 	for (i=0; i<state->lock_list->num; i++) {
 		lock = &state->lock_list->lock[i];
diff --git a/ctdb/client/client_tunnel.c b/ctdb/client/client_tunnel.c
index a783afe47c8..13c35fb61be 100644
--- a/ctdb/client/client_tunnel.c
+++ b/ctdb/client/client_tunnel.c
@@ -392,7 +392,7 @@ static void ctdb_tunnel_request_done(struct tevent_req *subreq);
 struct tevent_req *ctdb_tunnel_request_send(TALLOC_CTX *mem_ctx,
 					    struct tevent_context *ev,
 					    struct ctdb_tunnel_context *tctx,
-					    int destnode,
+					    uint32_t destnode,
 					    struct timeval timeout,
 					    uint8_t *buf, size_t buflen,
 					    bool wait_for_reply)
@@ -544,7 +544,7 @@ bool ctdb_tunnel_request_recv(struct tevent_req *req, int *perr,
 }
 
 int ctdb_tunnel_request(TALLOC_CTX *mem_ctx, struct tevent_context *ev,
-			struct ctdb_tunnel_context *tctx, int destnode,
+			struct ctdb_tunnel_context *tctx, uint32_t destnode,
 			struct timeval timeout, uint8_t *buf, size_t buflen,
 			bool wait_for_reply)
 {
@@ -577,7 +577,7 @@ static void ctdb_tunnel_reply_done(struct tevent_req *subreq);
 struct tevent_req *ctdb_tunnel_reply_send(TALLOC_CTX *mem_ctx,
 					  struct tevent_context *ev,
 					  struct ctdb_tunnel_context *tctx,
-					  int destnode, uint32_t reqid,
+					  uint32_t destnode, uint32_t reqid,
 					  struct timeval timeout,
 					  uint8_t *buf, size_t buflen)
 {
@@ -667,7 +667,7 @@ bool ctdb_tunnel_reply_recv(struct tevent_req *req, int *perr)
 }
 
 int ctdb_tunnel_reply(TALLOC_CTX *mem_ctx, struct tevent_context *ev,
-		      struct ctdb_tunnel_context *tctx, int destnode,
+		      struct ctdb_tunnel_context *tctx, uint32_t destnode,
 		      uint32_t reqid, struct timeval timeout,
 		      uint8_t *buf, size_t buflen)
 {
diff --git a/ctdb/client/client_util.c b/ctdb/client/client_util.c
index c68135f0af9..35323ff9eac 100644
--- a/ctdb/client/client_util.c
+++ b/ctdb/client/client_util.c
@@ -41,7 +41,7 @@ int list_of_nodes(struct ctdb_node_map *nodemap,
 {
 	int num_nodes = 0;
 	uint32_t *list;
-	int i;
+	unsigned int i;
 
 	/* Allocate the list of same number of nodes */
 	list = talloc_array(mem_ctx, uint32_t, nodemap->num);
-- 
2.20.1


From 6f2cd9c2031515d7bbaea45c5f14ed5dc2d45a69 Mon Sep 17 00:00:00 2001
From: Martin Schwenke <martin@meltin.net>
Date: Wed, 22 May 2019 21:58:14 +1000
Subject: [PATCH 14/28] ctdb-client: Fix potentially uninitialised data

Signed-off-by: Martin Schwenke <martin@meltin.net>
---
 ctdb/client/client_db.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/ctdb/client/client_db.c b/ctdb/client/client_db.c
index c9ddde3d422..dfa8d970de5 100644
--- a/ctdb/client/client_db.c
+++ b/ctdb/client/client_db.c
@@ -1442,7 +1442,7 @@ int ctdb_fetch_lock(TALLOC_CTX *mem_ctx, struct tevent_context *ev,
 {
 	struct tevent_req *req;
 	struct ctdb_record_handle *h;
-	int ret;
+	int ret = 0;
 
 	req = ctdb_fetch_lock_send(mem_ctx, ev, client, db, key, readonly);
 	if (req == NULL) {
@@ -2249,7 +2249,7 @@ int ctdb_transaction_start(TALLOC_CTX *mem_ctx, struct tevent_context *ev,
 {
 	struct tevent_req *req;
 	struct ctdb_transaction_handle *h;
-	int ret;
+	int ret = 0;
 
 	req = ctdb_transaction_start_send(mem_ctx, ev, client, timeout, db,
 					  readonly);
-- 
2.20.1


From 20e3721b0603c69b06185800ef3bb63950f927df Mon Sep 17 00:00:00 2001
From: Martin Schwenke <martin@meltin.net>
Date: Wed, 22 May 2019 21:58:46 +1000
Subject: [PATCH 15/28] ctdb-tests: Fix signed/unsigned comparison by using
 constant

Variable reqid is unsigned, so don't compare with -1.

Signed-off-by: Martin Schwenke <martin@meltin.net>
---
 ctdb/tests/src/reqid_test.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/ctdb/tests/src/reqid_test.c b/ctdb/tests/src/reqid_test.c
index 39f1fbdcc69..fe2a84ee551 100644
--- a/ctdb/tests/src/reqid_test.c
+++ b/ctdb/tests/src/reqid_test.c
@@ -40,7 +40,7 @@ int main(void)
 
 	for (i=0; i<1024*1024; i++) {
 		reqid = reqid_new(reqid_ctx, data);
-		assert(reqid != -1);
+		assert(reqid != REQID_INVALID);
 	}
 
 	for (i=0; i<1024; i++) {
-- 
2.20.1


From e72b6e3dc59bc2c23c48463710783881261bbd60 Mon Sep 17 00:00:00 2001
From: Martin Schwenke <martin@meltin.net>
Date: Thu, 23 May 2019 08:43:58 +1000
Subject: [PATCH 16/28] ctdb-recovery: Fix signed/unsigned comparisons by
 declaring as unsigned

Simple cases where variables need to be declared as an unsigned type
instead of an int.

Signed-off-by: Martin Schwenke <martin@meltin.net>
---
 ctdb/server/ctdb_recover.c  | 10 +++++----
 ctdb/server/ctdb_recoverd.c | 42 ++++++++++++++++++++++---------------
 2 files changed, 31 insertions(+), 21 deletions(-)

diff --git a/ctdb/server/ctdb_recover.c b/ctdb/server/ctdb_recover.c
index cfe77f643a6..343728839c1 100644
--- a/ctdb/server/ctdb_recover.c
+++ b/ctdb/server/ctdb_recover.c
@@ -144,7 +144,7 @@ ctdb_control_getnodemap(struct ctdb_context *ctdb, uint32_t opcode, TDB_DATA ind
 int
 ctdb_control_reload_nodes_file(struct ctdb_context *ctdb, uint32_t opcode)
 {
-	int i, num_nodes;
+	unsigned int i, num_nodes;
 	TALLOC_CTX *tmp_ctx;
 	struct ctdb_node **nodes;
 
@@ -453,7 +453,8 @@ int32_t ctdb_control_push_db(struct ctdb_context *ctdb, TDB_DATA indata)
 {
 	struct ctdb_marshall_buffer *reply = (struct ctdb_marshall_buffer *)indata.dptr;
 	struct ctdb_db_context *ctdb_db;
-	int i, ret;
+	unsigned int i;
+	int ret;
 	struct ctdb_rec_data_old *rec;
 
 	if (indata.dsize < offsetof(struct ctdb_marshall_buffer, data)) {
@@ -554,7 +555,8 @@ static void db_push_msg_handler(uint64_t srvid, TDB_DATA indata,
 		private_data, struct db_push_state);
 	struct ctdb_marshall_buffer *recs;
 	struct ctdb_rec_data_old *rec;
-	int i, ret;
+	unsigned int i;
+	int ret;
 
 	if (state->failed) {
 		return;
@@ -1255,7 +1257,7 @@ int32_t ctdb_control_try_delete_records(struct ctdb_context *ctdb, TDB_DATA inda
 {
 	struct ctdb_marshall_buffer *reply = (struct ctdb_marshall_buffer *)indata.dptr;
 	struct ctdb_db_context *ctdb_db;
-	int i;
+	unsigned int i;
 	struct ctdb_rec_data_old *rec;
 	struct ctdb_marshall_buffer *records;
 
diff --git a/ctdb/server/ctdb_recoverd.c b/ctdb/server/ctdb_recoverd.c
index 3e63bd1e7a5..617d8fa28b5 100644
--- a/ctdb/server/ctdb_recoverd.c
+++ b/ctdb/server/ctdb_recoverd.c
@@ -430,7 +430,8 @@ static int set_recovery_mode(struct ctdb_context *ctdb,
 static int create_missing_remote_databases(struct ctdb_context *ctdb, struct ctdb_node_map_old *nodemap, 
 					   uint32_t pnn, struct ctdb_dbid_map_old *dbmap, TALLOC_CTX *mem_ctx)
 {
-	int i, j, db, ret;
+	unsigned int i, j, db;
+	int ret;
 	struct ctdb_dbid_map_old *remote_dbmap;
 
 	/* verify that all other nodes have all our databases */
@@ -494,7 +495,8 @@ static int create_missing_remote_databases(struct ctdb_context *ctdb, struct ctd
 static int create_missing_local_databases(struct ctdb_context *ctdb, struct ctdb_node_map_old *nodemap, 
 					  uint32_t pnn, struct ctdb_dbid_map_old **dbmap, TALLOC_CTX *mem_ctx)
 {
-	int i, j, db, ret;
+	unsigned int i, j, db;
+	int ret;
 	struct ctdb_dbid_map_old *remote_dbmap;
 
 	/* verify that we have all database any other node has */
@@ -654,7 +656,8 @@ static void vacuum_fetch_handler(uint64_t srvid, TDB_DATA data,
 		private_data, struct ctdb_recoverd);
 	struct ctdb_context *ctdb = rec->ctdb;
 	struct ctdb_marshall_buffer *recs;
-	int ret, i;
+	unsigned int i;
+	int ret;
 	TALLOC_CTX *tmp_ctx = talloc_new(ctdb);
 	const char *name;
 	struct ctdb_dbid_map_old *dbmap=NULL;
@@ -805,7 +808,7 @@ static void ctdb_wait_election(struct ctdb_recoverd *rec)
  */
 static int update_local_flags(struct ctdb_recoverd *rec, struct ctdb_node_map_old *nodemap)
 {
-	int j;
+	unsigned int j;
 	struct ctdb_context *ctdb = rec->ctdb;
 	TALLOC_CTX *mem_ctx = talloc_new(ctdb);
 
@@ -1027,7 +1030,7 @@ static void ctdb_recovery_unlock(struct ctdb_recoverd *rec)
 static void ban_misbehaving_nodes(struct ctdb_recoverd *rec, bool *self_ban)
 {
 	struct ctdb_context *ctdb = rec->ctdb;
-	int i;
+	unsigned int i;
 	struct ctdb_banning_state *ban_state;
 
 	*self_ban = false;
@@ -1184,7 +1187,8 @@ static int ctdb_takeover(struct ctdb_recoverd *rec,
 {
 	static char prog[PATH_MAX+1] = "";
 	char *arg;
-	int i, ret;
+	unsigned int i;
+	int ret;
 
 	if (!ctdb_set_helper("takeover_helper", prog, sizeof(prog),
 			     "CTDB_TAKEOVER_HELPER", CTDB_HELPER_BINDIR,
@@ -1223,7 +1227,7 @@ static bool do_takeover_run(struct ctdb_recoverd *rec,
 	uint32_t *nodes = NULL;
 	struct ctdb_disable_message dtr;
 	TDB_DATA data;
-	int i;
+	size_t i;
 	uint32_t *rebalance_nodes = rec->force_rebalance_nodes;
 	int ret;
 	bool ok;
@@ -1335,7 +1339,8 @@ static int do_recovery(struct ctdb_recoverd *rec,
 		       struct ctdb_node_map_old *nodemap, struct ctdb_vnn_map *vnnmap)
 {
 	struct ctdb_context *ctdb = rec->ctdb;
-	int i, ret;
+	unsigned int i;
+	int ret;
 	struct ctdb_dbid_map_old *dbmap;
 	bool self_ban;
 
@@ -1542,7 +1547,8 @@ struct election_message {
  */
 static void ctdb_election_data(struct ctdb_recoverd *rec, struct election_message *em)
 {
-	int ret, i;
+	unsigned int i;
+	int ret;
 	struct ctdb_node_map_old *nodemap;
 	struct ctdb_context *ctdb = rec->ctdb;
 
@@ -2049,7 +2055,7 @@ static void monitor_handler(uint64_t srvid, TDB_DATA data, void *private_data)
 	struct ctdb_node_flag_change *c = (struct ctdb_node_flag_change *)data.dptr;
 	struct ctdb_node_map_old *nodemap=NULL;
 	TALLOC_CTX *tmp_ctx;
-	int i;
+	unsigned int i;
 
 	if (data.dsize != sizeof(*c)) {
 		DEBUG(DEBUG_ERR,(__location__ "Invalid data in ctdb_node_flag_change\n"));
@@ -2175,8 +2181,8 @@ static enum monitor_result verify_recmode(struct ctdb_context *ctdb, struct ctdb
 	TALLOC_CTX *mem_ctx = talloc_new(ctdb);
 	struct ctdb_client_control_state *state;
 	enum monitor_result status;
-	int j;
-	
+	unsigned int j;
+
 	rmdata = talloc(mem_ctx, struct verify_recmode_normal_data);
 	CTDB_NO_MEMORY_FATAL(ctdb, rmdata);
 	rmdata->count  = 0;
@@ -2268,8 +2274,8 @@ static enum monitor_result verify_recmaster(struct ctdb_recoverd *rec, struct ct
 	TALLOC_CTX *mem_ctx = talloc_new(ctdb);
 	struct ctdb_client_control_state *state;
 	enum monitor_result status;
-	int j;
-	
+	unsigned int j;
+
 	rmdata = talloc(mem_ctx, struct verify_recmaster_data);
 	CTDB_NO_MEMORY_FATAL(ctdb, rmdata);
 	rmdata->rec    = rec;
@@ -2351,7 +2357,7 @@ static bool interfaces_have_changed(struct ctdb_context *ctdb,
 		ret = true;
 	} else {
 		/* See if interface names or link states have changed */
-		int i;
+		unsigned int i;
 		for (i = 0; i < rec->ifaces->num; i++) {
 			struct ctdb_iface * iface = &rec->ifaces->ifaces[i];
 			if (strcmp(iface->name, ifaces->ifaces[i].name) != 0) {
@@ -2387,7 +2393,8 @@ static int verify_local_ip_allocation(struct ctdb_context *ctdb,
 				      struct ctdb_node_map_old *nodemap)
 {
 	TALLOC_CTX *mem_ctx = talloc_new(NULL);
-	int ret, j;
+	unsigned int j;
+	int ret;
 	bool need_takeover_run = false;
 	struct ctdb_public_ip_list_old *ips = NULL;
 
@@ -2638,7 +2645,8 @@ static void main_loop(struct ctdb_context *ctdb, struct ctdb_recoverd *rec,
 	struct ctdb_vnn_map *remote_vnnmap=NULL;
 	uint32_t num_lmasters;
 	int32_t debug_level;
-	int i, j, ret;
+	unsigned int i, j;
+	int ret;
 	bool self_ban;
 
 
-- 
2.20.1


From cf0204ab756664b8f2dbb916bad645d1cd0b7c18 Mon Sep 17 00:00:00 2001
From: Martin Schwenke <martin@meltin.net>
Date: Thu, 23 May 2019 17:47:24 +1000
Subject: [PATCH 17/28] ctdb-recovery: Fix signed/unsigned comparison by
 casting

Signed-off-by: Martin Schwenke <martin@meltin.net>
---
 ctdb/server/ctdb_recoverd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/ctdb/server/ctdb_recoverd.c b/ctdb/server/ctdb_recoverd.c
index 617d8fa28b5..3e0d84f3935 100644
--- a/ctdb/server/ctdb_recoverd.c
+++ b/ctdb/server/ctdb_recoverd.c
@@ -2256,7 +2256,7 @@ static void verify_recmaster_callback(struct ctdb_client_control_state *state)
 	/* if we got a response, then the recmaster will be stored in the
 	   status field
 	*/
-	if (state->status != rmdata->pnn) {
+	if ((uint32_t)state->status != rmdata->pnn) {
 		DEBUG(DEBUG_ERR,("Node %d thinks node %d is recmaster. Need a new recmaster election\n", state->c->hdr.destnode, state->status));
 		ctdb_set_culprit(rmdata->rec, state->c->hdr.destnode);
 		rmdata->status = MONITOR_ELECTION_NEEDED;
-- 
2.20.1


From 0e219fd7dc4097a628af2541b13c308eeb322e76 Mon Sep 17 00:00:00 2001
From: Martin Schwenke <martin@meltin.net>
Date: Thu, 23 May 2019 17:50:32 +1000
Subject: [PATCH 18/28] ctdb-recovery: Avoid -1 as a PNN, use CTDB_UNKNOWN_PNN
 instead

Signed-off-by: Martin Schwenke <martin@meltin.net>
---
 ctdb/server/ctdb_recoverd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/ctdb/server/ctdb_recoverd.c b/ctdb/server/ctdb_recoverd.c
index 3e0d84f3935..652bf9ce4ea 100644
--- a/ctdb/server/ctdb_recoverd.c
+++ b/ctdb/server/ctdb_recoverd.c
@@ -2436,7 +2436,7 @@ static int verify_local_ip_allocation(struct ctdb_context *ctdb,
 	}
 
 	for (j=0; j<ips->num; j++) {
-		if (ips->ips[j].pnn == -1 &&
+		if (ips->ips[j].pnn == CTDB_UNKNOWN_PNN &&
 		    nodemap->nodes[pnn].flags == 0) {
 			DEBUG(DEBUG_WARNING,
 			      ("Unassigned IP %s can be served by this node\n",
-- 
2.20.1


From 6327b62a62233da2b525f296299ba74b027e9a27 Mon Sep 17 00:00:00 2001
From: Martin Schwenke <martin@meltin.net>
Date: Sat, 25 May 2019 22:04:10 +1000
Subject: [PATCH 19/28] ctdb-recovery: Fix signed/unsigned comparisons by
 declaring as unsigned

Simple cases where variables and function parameters need to be
declared as an unsigned type instead of an int.

Signed-off-by: Martin Schwenke <martin@meltin.net>
---
 ctdb/server/ctdb_recovery_helper.c | 31 +++++++++++++++---------------
 1 file changed, 16 insertions(+), 15 deletions(-)

diff --git a/ctdb/server/ctdb_recovery_helper.c b/ctdb/server/ctdb_recovery_helper.c
index eed71da5df8..f2ea9b1fd56 100644
--- a/ctdb/server/ctdb_recovery_helper.c
+++ b/ctdb/server/ctdb_recovery_helper.c
@@ -154,7 +154,7 @@ static bool recdb_persistent(struct recdb_context *recdb)
 
 struct recdb_add_traverse_state {
 	struct recdb_context *recdb;
-	int mypnn;
+	uint32_t mypnn;
 };
 
 static int recdb_add_traverse(uint32_t reqid, struct ctdb_ltdb_header *header,
@@ -304,8 +304,8 @@ struct recdb_file_traverse_state {
 	bool persistent;
 	bool failed;
 	int fd;
-	int max_size;
-	int num_buffers;
+	size_t max_size;
+	unsigned int num_buffers;
 };
 
 static int recdb_file_traverse(struct tdb_context *tdb,
@@ -397,7 +397,7 @@ struct pull_database_state {
 	struct recdb_context *recdb;
 	uint32_t pnn;
 	uint64_t srvid;
-	int num_records;
+	unsigned int num_records;
 	int result;
 };
 
@@ -775,7 +775,7 @@ struct push_database_new_state {
 	int fd;
 	int num_buffers;
 	int num_buffers_sent;
-	int num_records;
+	unsigned int num_records;
 };
 
 static void push_database_new_started(struct tevent_req *subreq);
@@ -1892,8 +1892,8 @@ static bool recover_db_recv(struct tevent_req *req)
 struct db_recovery_state {
 	struct tevent_context *ev;
 	struct ctdb_dbid_map *dbmap;
-	int num_replies;
-	int num_failed;
+	unsigned int num_replies;
+	unsigned int num_failed;
 };
 
 struct db_recovery_one_state {
@@ -1925,7 +1925,7 @@ static struct tevent_req *db_recovery_send(TALLOC_CTX *mem_ctx,
 {
 	struct tevent_req *req, *subreq;
 	struct db_recovery_state *state;
-	int i;
+	unsigned int i;
 
 	req = tevent_req_create(mem_ctx, &state, struct db_recovery_state);
 	if (req == NULL) {
@@ -2022,7 +2022,7 @@ done:
 	}
 }
 
-static bool db_recovery_recv(struct tevent_req *req, int *count)
+static bool db_recovery_recv(struct tevent_req *req, unsigned int *count)
 {
 	struct db_recovery_state *state = tevent_req_data(
 		req, struct db_recovery_state);
@@ -2064,7 +2064,7 @@ struct recovery_state {
 	struct ctdb_client_context *client;
 	uint32_t generation;
 	uint32_t *pnn_list;
-	int count;
+	unsigned int count;
 	uint32_t destnode;
 	struct ctdb_node_map *nodemap;
 	uint32_t *caps;
@@ -2256,7 +2256,8 @@ static void recovery_capabilities_done(struct tevent_req *subreq)
 	struct ctdb_reply_control **reply;
 	struct ctdb_req_control request;
 	int *err_list;
-	int ret, i;
+	unsigned int i;
+	int ret;
 	bool status;
 
 	status = ctdb_client_control_multi_recv(subreq, &ret, state, &err_list,
@@ -2360,8 +2361,8 @@ static void recovery_active_done(struct tevent_req *subreq)
 	struct ctdb_req_control request;
 	struct ctdb_vnn_map *vnnmap;
 	int *err_list;
-	int ret, i;
-	unsigned int count;
+	int ret;
+	unsigned int count, i;
 	bool status;
 
 	status = ctdb_client_control_multi_recv(subreq, &ret, NULL, &err_list,
@@ -2544,7 +2545,7 @@ static void recovery_db_recovery_done(struct tevent_req *subreq)
 		req, struct recovery_state);
 	struct ctdb_req_control request;
 	bool status;
-	int count;
+	unsigned int count;
 
 	status = db_recovery_recv(subreq, &count);
 	TALLOC_FREE(subreq);
@@ -2553,7 +2554,7 @@ static void recovery_db_recovery_done(struct tevent_req *subreq)
 
 	if (! status) {
 		uint32_t max_pnn = CTDB_UNKNOWN_PNN, max_credits = 0;
-		int i;
+		unsigned int i;
 
 		/* Bans are not enabled */
 		if (state->tun_list->enable_bans == 0) {
-- 
2.20.1


From 2bf90f34d4504eac64bc5290471d3eb4a590647c Mon Sep 17 00:00:00 2001
From: Martin Schwenke <martin@meltin.net>
Date: Thu, 30 May 2019 15:32:03 +1000
Subject: [PATCH 20/28] ctdb-utils: Avoid warning about unused value

Signed-off-by: Martin Schwenke <martin@meltin.net>
---
 ctdb/utils/ping_pong/ping_pong.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/ctdb/utils/ping_pong/ping_pong.c b/ctdb/utils/ping_pong/ping_pong.c
index 3597daac201..1f2bad5516b 100644
--- a/ctdb/utils/ping_pong/ping_pong.c
+++ b/ctdb/utils/ping_pong/ping_pong.c
@@ -160,6 +160,10 @@ static void ping_pong(int fd, int num_locks)
 		}
 		if (do_check) {
 			ret = check_lock(fd, i, 1);
+			if (ret != 0) {
+				free(val);
+				return;
+			}
 		}
 		if (do_reads) {
 			unsigned char c;
-- 
2.20.1


From 91ca3dc861fc4084c0740099140e44d30ec2c698 Mon Sep 17 00:00:00 2001
From: Martin Schwenke <martin@meltin.net>
Date: Thu, 30 May 2019 15:33:05 +1000
Subject: [PATCH 21/28] ctdb-tests: Avoid potentially uninitialised data

Signed-off-by: Martin Schwenke <martin@meltin.net>
---
 ctdb/tests/src/run_event_test.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/ctdb/tests/src/run_event_test.c b/ctdb/tests/src/run_event_test.c
index 2d0053c459a..8b5dcd7beef 100644
--- a/ctdb/tests/src/run_event_test.c
+++ b/ctdb/tests/src/run_event_test.c
@@ -167,8 +167,8 @@ int main(int argc, const char **argv)
 {
 	TALLOC_CTX *mem_ctx;
 	struct tevent_context *ev;
-	struct run_proc_context *run_proc_ctx;
-	struct run_event_context *run_ctx;
+	struct run_proc_context *run_proc_ctx = NULL;
+	struct run_event_context *run_ctx = NULL;
 	int ret;
 
 	if (argc < 3) {
-- 
2.20.1


From ac1972d5c7045d0b40b4ab95cd725583c07163e7 Mon Sep 17 00:00:00 2001
From: Martin Schwenke <martin@meltin.net>
Date: Thu, 30 May 2019 15:37:38 +1000
Subject: [PATCH 22/28] ctdb-ipalloc: Fix signed/unsigned comparisons by
 declaring as unsigned

Signed-off-by: Martin Schwenke <martin@meltin.net>
---
 ctdb/server/ipalloc.c                  |  8 ++++----
 ctdb/server/ipalloc_common.c           |  7 ++++---
 ctdb/server/ipalloc_lcp2.c             | 17 +++++++++--------
 ctdb/server/ipalloc_nondeterministic.c |  4 ++--
 ctdb/server/ipalloc_private.h          |  2 +-
 5 files changed, 20 insertions(+), 18 deletions(-)

diff --git a/ctdb/server/ipalloc.c b/ctdb/server/ipalloc.c
index dce2b03cad2..e18c8994b87 100644
--- a/ctdb/server/ipalloc.c
+++ b/ctdb/server/ipalloc.c
@@ -92,7 +92,7 @@ static int getips_count_callback(void *param, void *data)
 static struct public_ip_list *
 create_merged_ip_list(struct ipalloc_state *ipalloc_state)
 {
-	int i, j;
+	unsigned int i, j;
 	struct public_ip_list *ip_list;
 	struct ctdb_public_ip_list *public_ips;
 	struct trbt_tree *ip_tree;
@@ -147,7 +147,7 @@ create_merged_ip_list(struct ipalloc_state *ipalloc_state)
 static bool populate_bitmap(struct ipalloc_state *ipalloc_state)
 {
 	struct public_ip_list *ip = NULL;
-	int i, j;
+	unsigned int i, j;
 
 	for (ip = ipalloc_state->all_ips; ip != NULL; ip = ip->next) {
 
@@ -210,14 +210,14 @@ void ipalloc_set_public_ips(struct ipalloc_state *ipalloc_state,
  * right now... */
 bool ipalloc_can_host_ips(struct ipalloc_state *ipalloc_state)
 {
-	int i;
+	unsigned int i;
 	bool have_ips = false;
 
 	for (i=0; i < ipalloc_state->num; i++) {
 		struct ctdb_public_ip_list *ips =
 			ipalloc_state->known_public_ips;
 		if (ips[i].num != 0) {
-			int j;
+			unsigned int j;
 			have_ips = true;
 			/* Succeed if an address is hosted on node i */
 			for (j=0; j < ips[i].num; j++) {
diff --git a/ctdb/server/ipalloc_common.c b/ctdb/server/ipalloc_common.c
index b8784dd71ad..a0152e3285d 100644
--- a/ctdb/server/ipalloc_common.c
+++ b/ctdb/server/ipalloc_common.c
@@ -41,7 +41,7 @@
 /* Given a physical node, return the number of
    public addresses that is currently assigned to this node.
 */
-int node_ip_coverage(int32_t pnn, struct public_ip_list *ips)
+int node_ip_coverage(uint32_t pnn, struct public_ip_list *ips)
 {
 	int num=0;
 
@@ -82,8 +82,9 @@ bool can_node_takeover_ip(struct ipalloc_state *ipalloc_state,
 int find_takeover_node(struct ipalloc_state *ipalloc_state,
 		       struct public_ip_list *ip)
 {
-	int pnn, min=0, num;
-	int i, numnodes;
+	unsigned int pnn;
+	int min=0, num;
+	unsigned int i, numnodes;
 
 	numnodes = ipalloc_state->num;
 	pnn    = -1;
diff --git a/ctdb/server/ipalloc_lcp2.c b/ctdb/server/ipalloc_lcp2.c
index 565b58c9a0c..743dc2e75b7 100644
--- a/ctdb/server/ipalloc_lcp2.c
+++ b/ctdb/server/ipalloc_lcp2.c
@@ -74,7 +74,7 @@ static uint32_t ip_distance(ctdb_sock_addr *ip1, ctdb_sock_addr *ip2)
  */
 static uint32_t ip_distance_2_sum(ctdb_sock_addr *ip,
 				  struct public_ip_list *ips,
-				  int pnn)
+				  unsigned int pnn)
 {
 	struct public_ip_list *t;
 	uint32_t d;
@@ -109,7 +109,8 @@ static uint32_t ip_distance_2_sum(ctdb_sock_addr *ip,
 /* Return the LCP2 imbalance metric for addresses currently assigned
    to the given node.
  */
-static uint32_t lcp2_imbalance(struct public_ip_list * all_ips, int pnn)
+static uint32_t lcp2_imbalance(struct public_ip_list * all_ips,
+			       unsigned int pnn)
 {
 	struct public_ip_list *t;
 
@@ -132,7 +133,7 @@ static bool lcp2_init(struct ipalloc_state *ipalloc_state,
 		      uint32_t **lcp2_imbalances,
 		      bool **rebalance_candidates)
 {
-	int i, numnodes;
+	unsigned int i, numnodes;
 	struct public_ip_list *t;
 
 	numnodes = ipalloc_state->num;
@@ -198,9 +199,9 @@ static void lcp2_allocate_unassigned(struct ipalloc_state *ipalloc_state,
 				     uint32_t *lcp2_imbalances)
 {
 	struct public_ip_list *t;
-	int dstnode, numnodes;
+	unsigned int dstnode, numnodes;
 
-	int minnode;
+	unsigned int minnode;
 	uint32_t mindsum, dstdsum, dstimbl;
 	uint32_t minimbl = 0;
 	struct public_ip_list *minip;
@@ -302,11 +303,11 @@ static void lcp2_allocate_unassigned(struct ipalloc_state *ipalloc_state,
  * combination to move from the source node.
  */
 static bool lcp2_failback_candidate(struct ipalloc_state *ipalloc_state,
-				    int srcnode,
+				    unsigned int srcnode,
 				    uint32_t *lcp2_imbalances,
 				    bool *rebalance_candidates)
 {
-	int dstnode, mindstnode, numnodes;
+	unsigned int dstnode, mindstnode, numnodes;
 	uint32_t srcimbl, srcdsum, dstimbl, dstdsum;
 	uint32_t minsrcimbl, mindstimbl;
 	struct public_ip_list *minip;
@@ -402,7 +403,7 @@ static bool lcp2_failback_candidate(struct ipalloc_state *ipalloc_state,
 
 struct lcp2_imbalance_pnn {
 	uint32_t imbalance;
-	int pnn;
+	unsigned int pnn;
 };
 
 static int lcp2_cmp_imbalance_pnn(const void * a, const void * b)
diff --git a/ctdb/server/ipalloc_nondeterministic.c b/ctdb/server/ipalloc_nondeterministic.c
index 534ac5b9ee7..3c2bdea06cb 100644
--- a/ctdb/server/ipalloc_nondeterministic.c
+++ b/ctdb/server/ipalloc_nondeterministic.c
@@ -37,8 +37,8 @@
 static void basic_failback(struct ipalloc_state *ipalloc_state,
 			   int num_ips)
 {
-	int i, numnodes;
-	int maxnode, maxnum, minnode, minnum, num, retries;
+	unsigned int i, numnodes, maxnode, minnode;
+	int maxnum, minnum, num, retries;
 	struct public_ip_list *t;
 
 	numnodes = ipalloc_state->num;
diff --git a/ctdb/server/ipalloc_private.h b/ctdb/server/ipalloc_private.h
index bfa872904d6..3ea3d310040 100644
--- a/ctdb/server/ipalloc_private.h
+++ b/ctdb/server/ipalloc_private.h
@@ -43,7 +43,7 @@ struct ipalloc_state {
 bool can_node_takeover_ip(struct ipalloc_state *ipalloc_state,
 			  int32_t pnn,
 			  struct public_ip_list *ip);
-int node_ip_coverage(int32_t pnn, struct public_ip_list *ips);
+int node_ip_coverage(uint32_t pnn, struct public_ip_list *ips);
 int find_takeover_node(struct ipalloc_state *ipalloc_state,
 		       struct public_ip_list *ip);
 
-- 
2.20.1


From b27c3f438e8ce9e1f2208d59122fee4cebfd1e0d Mon Sep 17 00:00:00 2001
From: Martin Schwenke <martin@meltin.net>
Date: Thu, 30 May 2019 15:40:42 +1000
Subject: [PATCH 23/28] ctdb-ipalloc: Avoid -1 as a PNN, use CTDB_UNKNOWN_PNN
 instead

This fixes warnings about signed versus unsigned comparisons.

Signed-off-by: Martin Schwenke <martin@meltin.net>
---
 ctdb/server/ipalloc.c                  |  6 +++---
 ctdb/server/ipalloc_common.c           | 14 +++++++-------
 ctdb/server/ipalloc_lcp2.c             | 21 +++++++++++----------
 ctdb/server/ipalloc_nondeterministic.c | 12 ++++++------
 4 files changed, 27 insertions(+), 26 deletions(-)

diff --git a/ctdb/server/ipalloc.c b/ctdb/server/ipalloc.c
index e18c8994b87..bacbdb32aee 100644
--- a/ctdb/server/ipalloc.c
+++ b/ctdb/server/ipalloc.c
@@ -67,7 +67,7 @@ static void *add_ip_callback(void *parm, void *data)
 	if (prev_ip == NULL) {
 		return parm;
 	}
-	if (this_ip->pnn == -1) {
+	if (this_ip->pnn == CTDB_UNKNOWN_PNN) {
 		this_ip->pnn = prev_ip->pnn;
 	}
 
@@ -125,7 +125,7 @@ create_merged_ip_list(struct ipalloc_state *ipalloc_state)
 			if (public_ips->ip[j].pnn == i) {
 				tmp_ip->pnn = public_ips->ip[j].pnn;
 			} else {
-				tmp_ip->pnn = -1;
+				tmp_ip->pnn = CTDB_UNKNOWN_PNN;
 			}
 			tmp_ip->addr = public_ips->ip[j].addr;
 			tmp_ip->next = NULL;
@@ -272,7 +272,7 @@ struct public_ip_list *ipalloc(struct ipalloc_state *ipalloc_state)
 	}
 
 	/* at this point ->pnn is the node which will own each IP
-	   or -1 if there is no node that can cover this ip
+	   or CTDB_UNKNOWN_PNN if there is no node that can cover this ip
 	*/
 
 	return (ret ? ipalloc_state->all_ips : NULL);
diff --git a/ctdb/server/ipalloc_common.c b/ctdb/server/ipalloc_common.c
index a0152e3285d..53d96d11e47 100644
--- a/ctdb/server/ipalloc_common.c
+++ b/ctdb/server/ipalloc_common.c
@@ -87,7 +87,7 @@ int find_takeover_node(struct ipalloc_state *ipalloc_state,
 	unsigned int i, numnodes;
 
 	numnodes = ipalloc_state->num;
-	pnn    = -1;
+	pnn = CTDB_UNKNOWN_PNN;
 	for (i=0; i<numnodes; i++) {
 		/* verify that this node can serve this ip */
 		if (!can_node_takeover_ip(ipalloc_state, i, ip)) {
@@ -97,7 +97,7 @@ int find_takeover_node(struct ipalloc_state *ipalloc_state,
 
 		num = node_ip_coverage(i, ipalloc_state->all_ips);
 		/* was this the first node we checked ? */
-		if (pnn == -1) {
+		if (pnn == CTDB_UNKNOWN_PNN) {
 			pnn = i;
 			min  = num;
 		} else {
@@ -107,7 +107,7 @@ int find_takeover_node(struct ipalloc_state *ipalloc_state,
 			}
 		}
 	}
-	if (pnn == -1) {
+	if (pnn == CTDB_UNKNOWN_PNN) {
 		DEBUG(DEBUG_WARNING,(__location__ " Could not find node to take over public address '%s'\n",
 				     ctdb_sock_addr_to_string(ipalloc_state,
 							      &ip->addr,
@@ -157,7 +157,7 @@ void basic_allocate_unassigned(struct ipalloc_state *ipalloc_state)
 	   each unassigned ip.
 	*/
 	for (t = ipalloc_state->all_ips; t != NULL; t = t->next) {
-		if (t->pnn == -1) {
+		if (t->pnn == CTDB_UNKNOWN_PNN) {
 			if (find_takeover_node(ipalloc_state, t)) {
 				DEBUG(DEBUG_WARNING,
 				      ("Failed to find node to cover ip %s\n",
@@ -174,10 +174,10 @@ void unassign_unsuitable_ips(struct ipalloc_state *ipalloc_state)
 	struct public_ip_list *t;
 
 	/* verify that the assigned nodes can serve that public ip
-	   and set it to -1 if not
+	   and set it to CTDB_UNKNOWN_PNN if not
 	*/
 	for (t = ipalloc_state->all_ips; t != NULL; t = t->next) {
-		if (t->pnn == -1) {
+		if (t->pnn == CTDB_UNKNOWN_PNN) {
 			continue;
 		}
 		if (!can_node_host_ip(ipalloc_state, t->pnn, t) != 0) {
@@ -187,7 +187,7 @@ void unassign_unsuitable_ips(struct ipalloc_state *ipalloc_state)
 						   ipalloc_state,
 						   &t->addr, false),
 					   t->pnn));
-			t->pnn = -1;
+			t->pnn = CTDB_UNKNOWN_PNN;
 		}
 	}
 }
diff --git a/ctdb/server/ipalloc_lcp2.c b/ctdb/server/ipalloc_lcp2.c
index 743dc2e75b7..9249a1db719 100644
--- a/ctdb/server/ipalloc_lcp2.c
+++ b/ctdb/server/ipalloc_lcp2.c
@@ -164,7 +164,7 @@ static bool lcp2_init(struct ipalloc_state *ipalloc_state,
 	 * changes.
 	 */
 	for (t = ipalloc_state->all_ips; t != NULL; t = t->next) {
-		if (t->pnn != -1) {
+		if (t->pnn != CTDB_UNKNOWN_PNN) {
 			(*rebalance_candidates)[t->pnn] = false;
 		}
 	}
@@ -217,13 +217,13 @@ static void lcp2_allocate_unassigned(struct ipalloc_state *ipalloc_state,
 		DEBUG(DEBUG_DEBUG,(" ----------------------------------------\n"));
 		DEBUG(DEBUG_DEBUG,(" CONSIDERING MOVES (UNASSIGNED)\n"));
 
-		minnode = -1;
+		minnode = CTDB_UNKNOWN_PNN;
 		mindsum = 0;
 		minip = NULL;
 
 		/* loop over each unassigned ip. */
 		for (t = ipalloc_state->all_ips; t != NULL ; t = t->next) {
-			if (t->pnn != -1) {
+			if (t->pnn != CTDB_UNKNOWN_PNN) {
 				continue;
 			}
 
@@ -249,7 +249,8 @@ static void lcp2_allocate_unassigned(struct ipalloc_state *ipalloc_state,
 				       dstimbl - lcp2_imbalances[dstnode]));
 
 
-				if ((minnode == -1) || (dstdsum < mindsum)) {
+				if (minnode == CTDB_UNKNOWN_PNN ||
+				    dstdsum < mindsum) {
 					minnode = dstnode;
 					minimbl = dstimbl;
 					mindsum = dstdsum;
@@ -262,7 +263,7 @@ static void lcp2_allocate_unassigned(struct ipalloc_state *ipalloc_state,
 		DEBUG(DEBUG_DEBUG,(" ----------------------------------------\n"));
 
 		/* If we found one then assign it to the given node. */
-		if (minnode != -1) {
+		if (minnode != CTDB_UNKNOWN_PNN) {
 			minip->pnn = minnode;
 			lcp2_imbalances[minnode] = minimbl;
 			DEBUG(DEBUG_INFO,(" %s -> %d [+%d]\n",
@@ -276,7 +277,7 @@ static void lcp2_allocate_unassigned(struct ipalloc_state *ipalloc_state,
 		/* There might be a better way but at least this is clear. */
 		have_unassigned = false;
 		for (t = ipalloc_state->all_ips; t != NULL; t = t->next) {
-			if (t->pnn == -1) {
+			if (t->pnn == CTDB_UNKNOWN_PNN) {
 				have_unassigned = true;
 			}
 		}
@@ -287,7 +288,7 @@ static void lcp2_allocate_unassigned(struct ipalloc_state *ipalloc_state,
 	 */
 	if (have_unassigned) {
 		for (t = ipalloc_state->all_ips; t != NULL; t = t->next) {
-			if (t->pnn == -1) {
+			if (t->pnn == CTDB_UNKNOWN_PNN) {
 				DEBUG(DEBUG_WARNING,
 				      ("Failed to find node to cover ip %s\n",
 				       ctdb_sock_addr_to_string(ipalloc_state,
@@ -317,7 +318,7 @@ static bool lcp2_failback_candidate(struct ipalloc_state *ipalloc_state,
 	srcimbl = 0;
 	minip = NULL;
 	minsrcimbl = 0;
-	mindstnode = -1;
+	mindstnode = CTDB_UNKNOWN_PNN;
 	mindstimbl = 0;
 
 	numnodes = ipalloc_state->num;
@@ -369,7 +370,7 @@ static bool lcp2_failback_candidate(struct ipalloc_state *ipalloc_state,
 
 			if ((dstimbl < lcp2_imbalances[srcnode]) &&
 			    (dstdsum < srcdsum) &&			\
-			    ((mindstnode == -1) ||				\
+			    ((mindstnode == CTDB_UNKNOWN_PNN) ||				\
 			     ((srcimbl + dstimbl) < (minsrcimbl + mindstimbl)))) {
 
 				minip = t;
@@ -381,7 +382,7 @@ static bool lcp2_failback_candidate(struct ipalloc_state *ipalloc_state,
 	}
 	DEBUG(DEBUG_DEBUG,(" ----------------------------------------\n"));
 
-        if (mindstnode != -1) {
+        if (mindstnode != CTDB_UNKNOWN_PNN) {
 		/* We found a move that makes things better... */
 		DEBUG(DEBUG_INFO,
 		      ("%d [%d] -> %s -> %d [+%d]\n",
diff --git a/ctdb/server/ipalloc_nondeterministic.c b/ctdb/server/ipalloc_nondeterministic.c
index 3c2bdea06cb..1e70c8b78a2 100644
--- a/ctdb/server/ipalloc_nondeterministic.c
+++ b/ctdb/server/ipalloc_nondeterministic.c
@@ -54,15 +54,15 @@ try_again:
 	   not greater than 1.
 	*/
 	for (t = ipalloc_state->all_ips; t != NULL; t = t->next) {
-		if (t->pnn == -1) {
+		if (t->pnn == CTDB_UNKNOWN_PNN) {
 			continue;
 		}
 
 		/* Get the highest and lowest number of ips's served by any 
 		   valid node which can serve this ip.
 		*/
-		maxnode = -1;
-		minnode = -1;
+		maxnode = CTDB_UNKNOWN_PNN;
+		minnode = CTDB_UNKNOWN_PNN;
 		for (i=0; i<numnodes; i++) {
 			/* only check nodes that can actually serve this ip */
 			if (!can_node_takeover_ip(ipalloc_state, i,
@@ -72,7 +72,7 @@ try_again:
 			}
 
 			num = node_ip_coverage(i, ipalloc_state->all_ips);
-			if (maxnode == -1) {
+			if (maxnode == CTDB_UNKNOWN_PNN) {
 				maxnode = i;
 				maxnum  = num;
 			} else {
@@ -81,7 +81,7 @@ try_again:
 					maxnum  = num;
 				}
 			}
-			if (minnode == -1) {
+			if (minnode == CTDB_UNKNOWN_PNN) {
 				minnode = i;
 				minnum  = num;
 			} else {
@@ -91,7 +91,7 @@ try_again:
 				}
 			}
 		}
-		if (maxnode == -1) {
+		if (maxnode == CTDB_UNKNOWN_PNN) {
 			DEBUG(DEBUG_WARNING,
 			      (__location__ " Could not find maxnode. May not be able to serve ip '%s'\n",
 			       ctdb_sock_addr_to_string(ipalloc_state,
-- 
2.20.1


From 4426d6cc7b33b14d3c2c7f77ce836da795dbf6ed Mon Sep 17 00:00:00 2001
From: Martin Schwenke <martin@meltin.net>
Date: Thu, 30 May 2019 15:41:42 +1000
Subject: [PATCH 24/28] ctdb-ipalloc: Fix warning about unused value assigned
 to srcimbl

To make this much clearer, move the declaration into the scope where
it is used.

Signed-off-by: Martin Schwenke <martin@meltin.net>
---
 ctdb/server/ipalloc_lcp2.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/ctdb/server/ipalloc_lcp2.c b/ctdb/server/ipalloc_lcp2.c
index 9249a1db719..7f64bf80b17 100644
--- a/ctdb/server/ipalloc_lcp2.c
+++ b/ctdb/server/ipalloc_lcp2.c
@@ -309,13 +309,12 @@ static bool lcp2_failback_candidate(struct ipalloc_state *ipalloc_state,
 				    bool *rebalance_candidates)
 {
 	unsigned int dstnode, mindstnode, numnodes;
-	uint32_t srcimbl, srcdsum, dstimbl, dstdsum;
+	uint32_t srcdsum, dstimbl, dstdsum;
 	uint32_t minsrcimbl, mindstimbl;
 	struct public_ip_list *minip;
 	struct public_ip_list *t;
 
 	/* Find an IP and destination node that best reduces imbalance. */
-	srcimbl = 0;
 	minip = NULL;
 	minsrcimbl = 0;
 	mindstnode = CTDB_UNKNOWN_PNN;
@@ -328,6 +327,8 @@ static bool lcp2_failback_candidate(struct ipalloc_state *ipalloc_state,
 			   srcnode, lcp2_imbalances[srcnode]));
 
 	for (t = ipalloc_state->all_ips; t != NULL; t = t->next) {
+		uint32_t srcimbl;
+
 		/* Only consider addresses on srcnode. */
 		if (t->pnn != srcnode) {
 			continue;
-- 
2.20.1


From 0e26952da63d8a6d784964e05f89dcf096b83a80 Mon Sep 17 00:00:00 2001
From: Martin Schwenke <martin@meltin.net>
Date: Thu, 30 May 2019 15:42:45 +1000
Subject: [PATCH 25/28] ctdb-ipalloc: Avoid warning about shifting signed 32
 bit value by 31 bits

Use a cast to force the value to be unsigned.

Signed-off-by: Martin Schwenke <martin@meltin.net>
---
 ctdb/server/ipalloc_lcp2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/ctdb/server/ipalloc_lcp2.c b/ctdb/server/ipalloc_lcp2.c
index 7f64bf80b17..bc2936bb76e 100644
--- a/ctdb/server/ipalloc_lcp2.c
+++ b/ctdb/server/ipalloc_lcp2.c
@@ -58,7 +58,7 @@ static uint32_t ip_distance(ctdb_sock_addr *ip1, ctdb_sock_addr *ip2)
 			/* Count number of leading zeroes.
 			 * FIXME? This could be optimised...
 			 */
-			while ((x & (1 << 31)) == 0) {
+			while ((x & ((uint32_t)1 << 31)) == 0) {
 				x <<= 1;
 				distance += 1;
 			}
-- 
2.20.1


From bf7227cf6b0038a222183d6ee492412636c98805 Mon Sep 17 00:00:00 2001
From: Martin Schwenke <martin@meltin.net>
Date: Wed, 29 May 2019 17:38:03 +1000
Subject: [PATCH 26/28] ctdb-cluster: CID 1435726: NULL pointer dereference

Also found by csbuild.

Signed-off-by: Martin Schwenke <martin@meltin.net>
---
 ctdb/cluster/cluster_conf.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/ctdb/cluster/cluster_conf.c b/ctdb/cluster/cluster_conf.c
index 540732d5b91..be79d5942a8 100644
--- a/ctdb/cluster/cluster_conf.c
+++ b/ctdb/cluster/cluster_conf.c
@@ -38,13 +38,24 @@ static bool check_static_string_change(const char *key,
 				       enum conf_update_mode mode)
 {
 	if (mode == CONF_MODE_RELOAD) {
-		if (strcmp(old_value, new_value) != 0) {
+		if (old_value == new_value) {
+			goto done;
+		}
+
+		/*
+		 * At this point old_value or new_value can not both
+		 * NULL, so if one is NULL then they are different
+		 */
+		if (old_value == NULL ||
+		    new_value == NULL ||
+		    strcmp(old_value, new_value) != 0) {
 			D_WARNING("Ignoring update of [%s] -> %s\n",
 				  CLUSTER_CONF_SECTION,
 				  key);
 		}
 	}
 
+done:
 	return true;
 }
 
-- 
2.20.1


From 7506f4421ac0332c0ae1027c56a905b0d46b6062 Mon Sep 17 00:00:00 2001
From: Martin Schwenke <martin@meltin.net>
Date: Wed, 29 May 2019 19:05:49 +1000
Subject: [PATCH 27/28] ctdb-daemon: Attempt to silence CID 1357985 (Unchecked
 return value)

Yes, the other callers check the return value of ctdb_lockdb_mark().
However, this is called in a void function and ctdb_lockdb_mark() has
already printed any error message.  All we can do is explicitly ignore
the return value.

Signed-off-by: Martin Schwenke <martin@meltin.net>
---
 ctdb/server/ctdb_lock.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/ctdb/server/ctdb_lock.c b/ctdb/server/ctdb_lock.c
index a559e244471..d42d47af85f 100644
--- a/ctdb/server/ctdb_lock.c
+++ b/ctdb/server/ctdb_lock.c
@@ -255,7 +255,7 @@ static void process_callbacks(struct lock_context *lock_ctx, bool locked)
 			break;
 
 		case LOCK_DB:
-			ctdb_lockdb_mark(lock_ctx->ctdb_db);
+			(void)ctdb_lockdb_mark(lock_ctx->ctdb_db);
 			break;
 		}
 	}
-- 
2.20.1


From 1ef4ad71d81d7be12f0330157d91e4bfac942b28 Mon Sep 17 00:00:00 2001
From: Martin Schwenke <martin@meltin.net>
Date: Wed, 29 May 2019 19:11:51 +1000
Subject: [PATCH 28/28] ctdb-utils: Fix CID 1125558 (Unchecked return value
 from library)

Signed-off-by: Martin Schwenke <martin@meltin.net>
---
 ctdb/utils/ping_pong/ping_pong.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/ctdb/utils/ping_pong/ping_pong.c b/ctdb/utils/ping_pong/ping_pong.c
index 1f2bad5516b..2b337faaf55 100644
--- a/ctdb/utils/ping_pong/ping_pong.c
+++ b/ctdb/utils/ping_pong/ping_pong.c
@@ -150,7 +150,13 @@ static void ping_pong(int fd, int num_locks)
 
 	start_timer();
 
-	lock_range(fd, 0, 1, true);
+	ret = lock_range(fd, 0, 1, true);
+	if (ret != 0) {
+		printf("initial lock at 0 failed! - %s\n", strerror(errno));
+		free(val);
+		return;
+	}
+
 	i = 0;
 
 	while (1) {
-- 
2.20.1


--MP_/Q=p.s/8I8g29ikNitkhvCKr--

