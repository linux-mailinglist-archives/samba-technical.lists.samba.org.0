Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 954318EAC2
	for <lists+samba-technical@lfdr.de>; Thu, 15 Aug 2019 13:54:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=q7l9bIA/UF9oIHwIpJb3RC2gbGgLSHkf9dlqb1wUK3A=; b=rfeiGah4VeuQpfIeNeU1EekH2z
	1cLCu6pMPqucrWlGrMS5qUMKkZg526/htN0GSczBNNmGAtFej8KTqLgvdJ13GSXq1Y7q1J8rRJyY9
	GwSwtxYej/Gwu1Z4R4ixxTIP2cQsfiN4vwnCHfdvH5n3YRhKHyBvZjrnAZT7N4uezofaorpxnxEsP
	6I2HOr4Dw1AX30Mj3NtEY5V9WegKtNy3VhyDm0vQ2O7mTjMJVs790AN/Rcl7OEkvqlxCNaZ3ePy49
	ddda00/Zu0UYAws2qP4fga/QOkLOxAzgILKM0Ic1B8myu8V5hQocUPdbCy7GXpXgJMMSJuKkdKhVJ
	SXMGRBBA==;
Received: from localhost ([::1]:21616 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hyEKH-006KlC-7J; Thu, 15 Aug 2019 11:53:53 +0000
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:39883 helo=ozlabs.org) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hyEKB-006Kl5-24
 for samba-technical@lists.samba.org; Thu, 15 Aug 2019 11:53:50 +0000
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 468Pwt5jR7z9sN1;
 Thu, 15 Aug 2019 21:53:34 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=meltin.net; s=201810;
 t=1565870015; bh=7/YNxtBgC78iLjC4cRGTWOA0uYh/TCAZvposxbzrdbA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Y45BZDQo0gjF1ZBN298/7fFG7OEzGY/X7g6pgCatqw09pWCKZ3NpHRgX+uooZvhqC
 lT/Aqw0N1Z8tdX+MoR/NeRl/HAlf3HC79+C3hVK1x9XEf5II5ggkx2BcLmBWLoT3rE
 JsEYXXFA/f+J9pEbfwnY9GePCTU4U2JjdwE/ZFXgHxEXYBmCsnWnvdynomrxHJIYpI
 +tPvYwTzW/0ecqhjxSRgLNJIT8VZ9CR0GsiXwrThNxNMX2L2WXbZTzR7xCQDYiV9np
 Mpz54H7nnT5HPR60EbHt++w52tIR49baJrzcroFzl1l4uTS/xAfGRxFgN4c8LRnMFX
 j2dgWoFN/8qeg==
Date: Thu, 15 Aug 2019 21:53:33 +1000
To: Amitay Isaacs <amitay@gmail.com>
Subject: Re: [PATCH] CTDB TCP transport connectivity fixes (bug 14084)
Message-ID: <20190815215333.1ef3bc2b@martins.ozlabs.org>
In-Reply-To: <CAJ+X7mT5K7aKu8f=_gzv9U3fxtnRHygraJhYGOGzcify_FcY_g@mail.gmail.com>
References: <20190814135302.7cae603f@martins.ozlabs.org>
 <CAJ+X7mQRwy7Uwe4nAMKxxUgDno0HsJPxxj0_Lf48eOngo6EBaQ@mail.gmail.com>
 <20190814144404.484e9e45@martins.ozlabs.org>
 <CAJ+X7mT5K7aKu8f=_gzv9U3fxtnRHygraJhYGOGzcify_FcY_g@mail.gmail.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="MP_/I46wBEmvMqpOt1u3mfIkrr4"
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
Cc: Samba Technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

--MP_/I46wBEmvMqpOt1u3mfIkrr4
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Wed, 14 Aug 2019 15:17:01 +1000, Amitay Isaacs <amitay@gmail.com>
wrote:

> On Wed, Aug 14, 2019 at 2:44 PM Martin Schwenke <martin@meltin.net> wrote:
> >
> > On Wed, 14 Aug 2019 14:22:27 +1000, Amitay Isaacs <amitay@gmail.com>
> > wrote:
> >  
> > > On Wed, Aug 14, 2019 at 1:54 PM Martin Schwenke via samba-technical
> > > <samba-technical@lists.samba.org> wrote:  
> > > >
> > > > Fix for:
> > > >
> > > >   https://bugzilla.samba.org/show_bug.cgi?id=14084
> > > >
> > > > The solution is to only mark nodes as connected when both incoming and
> > > > outgoing connections are up.
> > > >
> > > > Included in this pipeline:
> > > >
> > > >   https://gitlab.com/samba-team/devel/samba/pipelines/76265339
> > > >
> > > > Please review and maybe push...  
> > >
> > > In the last patch, there is no need to add "node" element to "tnode".
> > > "tnode" already includes "ctdb" for upcalls.  
> >
> > It is needed to be able to easily pass the node as the argument to the
> > upcall.
> >
> > However, you're right that:
> >
> >   tnode->node->ctdb->upcalls->node_dead(tnode->node);
> >
> > could just be:
> >
> >   tnode->ctdb->upcalls->node_dead(tnode->node);
> >
> > Do you want to tweak it or should I?  
> 
> Ah.  In that case we need to change the private_data for
> ctdb_tcp_read_cb() to "node" from "tnode".  Then we have access to
> "node" required for upcall.

The attached, improved patch set does the above and also fixes the
problem where tnode->out_queue wasn't a useful indicator that the
outbound connection was up.  As discussed offline, tnode->out_queue is
now only created when the connection becomes writable.

Included in this pipeline:

  https://gitlab.com/samba-team/devel/samba/pipelines/76501176

Please review and maybe push...

peace & happiness,
martin

--MP_/I46wBEmvMqpOt1u3mfIkrr4
Content-Type: text/x-patch
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=ctdb-tcp.patch

From 967136a614029e4d557dc0f21dc038282c4c7535 Mon Sep 17 00:00:00 2001
From: Martin Schwenke <martin@meltin.net>
Date: Thu, 8 Aug 2019 16:20:44 +1000
Subject: [PATCH 1/7] ctdb-daemon: Add function ctdb_ip_to_node()

This is the core logic from ctdb_ip_to_pnn(), so re-implement that
that function using ctdb_ip_to_node().

Something similar (ctdb_ip_to_nodeid()) was recently removed in commit
010c1d77cd7e192b1fff39b7b91fccbdbbf4a786 because it wasn't required.
Now there is a use case.

BUG: https://bugzilla.samba.org/show_bug.cgi?id=14084
Signed-off-by: Martin Schwenke <martin@meltin.net>
---
 ctdb/include/ctdb_private.h |  2 ++
 ctdb/server/ctdb_server.c   | 24 +++++++++++++++++++-----
 2 files changed, 21 insertions(+), 5 deletions(-)

diff --git a/ctdb/include/ctdb_private.h b/ctdb/include/ctdb_private.h
index 2bcc7c94156..1e9619faddf 100644
--- a/ctdb/include/ctdb_private.h
+++ b/ctdb/include/ctdb_private.h
@@ -831,6 +831,8 @@ void ctdb_stop_recoverd(struct ctdb_context *ctdb);
 
 int ctdb_set_transport(struct ctdb_context *ctdb, const char *transport);
 
+struct ctdb_node *ctdb_ip_to_node(struct ctdb_context *ctdb,
+				  const ctdb_sock_addr *nodeip);
 uint32_t ctdb_ip_to_pnn(struct ctdb_context *ctdb,
 			const ctdb_sock_addr *nodeip);
 
diff --git a/ctdb/server/ctdb_server.c b/ctdb/server/ctdb_server.c
index dcd761a2961..9724d1fe0a8 100644
--- a/ctdb/server/ctdb_server.c
+++ b/ctdb/server/ctdb_server.c
@@ -45,9 +45,9 @@ int ctdb_set_transport(struct ctdb_context *ctdb, const char *transport)
 	return 0;
 }
 
-/* Return the PNN for nodeip, CTDB_UNKNOWN_PNN if nodeip is invalid */
-uint32_t ctdb_ip_to_pnn(struct ctdb_context *ctdb,
-			const ctdb_sock_addr *nodeip)
+/* Return the node structure for nodeip, NULL if nodeip is invalid */
+struct ctdb_node *ctdb_ip_to_node(struct ctdb_context *ctdb,
+				  const ctdb_sock_addr *nodeip)
 {
 	unsigned int nodeid;
 
@@ -56,11 +56,25 @@ uint32_t ctdb_ip_to_pnn(struct ctdb_context *ctdb,
 			continue;
 		}
 		if (ctdb_same_ip(&ctdb->nodes[nodeid]->address, nodeip)) {
-			return ctdb->nodes[nodeid]->pnn;
+			return ctdb->nodes[nodeid];
 		}
 	}
 
-	return CTDB_UNKNOWN_PNN;
+	return NULL;
+}
+
+/* Return the PNN for nodeip, CTDB_UNKNOWN_PNN if nodeip is invalid */
+uint32_t ctdb_ip_to_pnn(struct ctdb_context *ctdb,
+			const ctdb_sock_addr *nodeip)
+{
+	struct ctdb_node *node;
+
+	node = ctdb_ip_to_node(ctdb, nodeip);
+	if (node == NULL) {
+		return CTDB_UNKNOWN_PNN;
+	}
+
+	return node->pnn;
 }
 
 /* Load a nodes list file into a nodes array */
-- 
2.23.0.rc1


From 4a4089a0e900c097a175d4fe1c5ee54b49c5ce03 Mon Sep 17 00:00:00 2001
From: Martin Schwenke <martin@meltin.net>
Date: Fri, 9 Aug 2019 15:06:34 +1000
Subject: [PATCH 2/7] ctdb-tcp: Rename fd -> out_fd

in_fd is coming soon.

Fix coding style violations in the affected and adjacent lines.
Modernise some debug macros and make them more consistent (e.g. drop
logging of errno when strerror(errno) is already logged.

BUG: https://bugzilla.samba.org/show_bug.cgi?id=14084
Signed-off-by: Martin Schwenke <martin@meltin.net>
---
 ctdb/tcp/ctdb_tcp.h    |  2 +-
 ctdb/tcp/tcp_connect.c | 97 +++++++++++++++++++++++++-----------------
 ctdb/tcp/tcp_init.c    | 22 ++++++----
 3 files changed, 72 insertions(+), 49 deletions(-)

diff --git a/ctdb/tcp/ctdb_tcp.h b/ctdb/tcp/ctdb_tcp.h
index 0a998c94da4..acd343fb8f3 100644
--- a/ctdb/tcp/ctdb_tcp.h
+++ b/ctdb/tcp/ctdb_tcp.h
@@ -39,7 +39,7 @@ struct ctdb_incoming {
   state associated with one tcp node
 */
 struct ctdb_tcp_node {
-	int fd;
+	int out_fd;
 	struct ctdb_queue *out_queue;
 	struct tevent_fd *connect_fde;
 	struct tevent_timer *connect_te;
diff --git a/ctdb/tcp/tcp_connect.c b/ctdb/tcp/tcp_connect.c
index d757abdf26c..4253f3bef7c 100644
--- a/ctdb/tcp/tcp_connect.c
+++ b/ctdb/tcp/tcp_connect.c
@@ -50,9 +50,9 @@ void ctdb_tcp_stop_connection(struct ctdb_node *node)
 	talloc_free(tnode->connect_fde);
 	tnode->connect_fde = NULL;
 	tnode->connect_te = NULL;
-	if (tnode->fd != -1) {
-		close(tnode->fd);
-		tnode->fd = -1;
+	if (tnode->out_fd != -1) {
+		close(tnode->out_fd);
+		tnode->out_fd = -1;
 	}
 }
 
@@ -93,12 +93,13 @@ static void ctdb_node_connect_write(struct tevent_context *ev,
 	int error = 0;
 	socklen_t len = sizeof(error);
 	int one = 1;
+	int ret;
 
 	talloc_free(tnode->connect_te);
 	tnode->connect_te = NULL;
 
-	if (getsockopt(tnode->fd, SOL_SOCKET, SO_ERROR, &error, &len) != 0 ||
-	    error != 0) {
+	ret = getsockopt(tnode->out_fd, SOL_SOCKET, SO_ERROR, &error, &len);
+	if (ret != 0 || error != 0) {
 		ctdb_tcp_stop_connection(node);
 		tnode->connect_te = tevent_add_timer(ctdb->ev, tnode,
 						    timeval_current_ofs(1, 0),
@@ -109,19 +110,28 @@ static void ctdb_node_connect_write(struct tevent_context *ev,
 	talloc_free(tnode->connect_fde);
 	tnode->connect_fde = NULL;
 
-        if (setsockopt(tnode->fd,IPPROTO_TCP,TCP_NODELAY,(char *)&one,sizeof(one)) == -1) {
-		DEBUG(DEBUG_WARNING, ("Failed to set TCP_NODELAY on fd - %s\n",
-				      strerror(errno)));
+	ret = setsockopt(tnode->out_fd,
+			 IPPROTO_TCP,
+			 TCP_NODELAY,
+			 (char *)&one,
+			 sizeof(one));
+	if (ret == -1) {
+		DBG_WARNING("Failed to set TCP_NODELAY on fd - %s\n",
+			  strerror(errno));
 	}
-        if (setsockopt(tnode->fd,SOL_SOCKET,SO_KEEPALIVE,(char *)&one,sizeof(one)) == -1) {
-		DEBUG(DEBUG_WARNING, ("Failed to set KEEPALIVE on fd - %s\n",
-				      strerror(errno)));
+	ret = setsockopt(tnode->out_fd,
+			 SOL_SOCKET,
+			 SO_KEEPALIVE,(char *)&one,
+			 sizeof(one));
+	if (ret == -1) {
+		DBG_WARNING("Failed to set KEEPALIVE on fd - %s\n",
+			    strerror(errno));
 	}
 
-	ctdb_queue_set_fd(tnode->out_queue, tnode->fd);
+	ctdb_queue_set_fd(tnode->out_queue, tnode->out_fd);
 
 	/* the queue subsystem now owns this fd */
-	tnode->fd = -1;
+	tnode->out_fd = -1;
 
 	/* tell the ctdb layer we are connected */
 	node->ctdb->upcalls->node_connected(node);
@@ -149,26 +159,24 @@ void ctdb_tcp_node_connect(struct tevent_context *ev, struct tevent_timer *te,
 
 	sock_out = node->address;
 
-	tnode->fd = socket(sock_out.sa.sa_family, SOCK_STREAM, IPPROTO_TCP);
-	if (tnode->fd == -1) {
-		DEBUG(DEBUG_ERR, (__location__ " Failed to create socket\n"));
+	tnode->out_fd = socket(sock_out.sa.sa_family, SOCK_STREAM, IPPROTO_TCP);
+	if (tnode->out_fd == -1) {
+		DBG_ERR("Failed to create socket\n");
 		return;
 	}
 
-	ret = set_blocking(tnode->fd, false);
+	ret = set_blocking(tnode->out_fd, false);
 	if (ret != 0) {
-		DEBUG(DEBUG_ERR,
-		      (__location__
-		       " failed to set socket non-blocking (%s)\n",
-		       strerror(errno)));
-		close(tnode->fd);
-		tnode->fd = -1;
+		DBG_ERR("Failed to set socket non-blocking (%s)\n",
+			strerror(errno));
+		close(tnode->out_fd);
+		tnode->out_fd = -1;
 		return;
 	}
 
-	set_close_on_exec(tnode->fd);
+	set_close_on_exec(tnode->out_fd);
 
-	DEBUG(DEBUG_DEBUG, (__location__ " Created TCP SOCKET FD:%d\n", tnode->fd));
+	DBG_DEBUG("Created TCP SOCKET FD:%d\n", tnode->out_fd);
 
 	/* Bind our side of the socketpair to the same address we use to listen
 	 * on incoming CTDB traffic.
@@ -197,39 +205,48 @@ void ctdb_tcp_node_connect(struct tevent_context *ev, struct tevent_timer *te,
 	default:
 		DEBUG(DEBUG_ERR, (__location__ " unknown family %u\n",
 			sock_in.sa.sa_family));
-		close(tnode->fd);
-		tnode->fd = -1;
+		close(tnode->out_fd);
+		tnode->out_fd = -1;
 		return;
 	}
 
-	if (bind(tnode->fd, (struct sockaddr *)&sock_in, sockin_size) == -1) {
-		DEBUG(DEBUG_ERR, (__location__ " Failed to bind socket %s(%d)\n",
-				  strerror(errno), errno));
-		close(tnode->fd);
-		tnode->fd = -1;
+	ret = bind(tnode->out_fd, (struct sockaddr *)&sock_in, sockin_size);
+	if (ret == -1) {
+		DBG_ERR("Failed to bind socket (%s)\n", strerror(errno));
+		close(tnode->out_fd);
+		tnode->out_fd = -1;
 		return;
 	}
 
-	if (connect(tnode->fd, (struct sockaddr *)&sock_out, sockout_size) != 0 &&
-	    errno != EINPROGRESS) {
+	ret = connect(tnode->out_fd,
+		      (struct sockaddr *)&sock_out,
+		      sockout_size);
+	if (ret != 0 && errno != EINPROGRESS) {
 		ctdb_tcp_stop_connection(node);
-		tnode->connect_te = tevent_add_timer(ctdb->ev, tnode,
+		tnode->connect_te = tevent_add_timer(ctdb->ev,
+						     tnode,
 						     timeval_current_ofs(1, 0),
-						     ctdb_tcp_node_connect, node);
+						     ctdb_tcp_node_connect,
+						     node);
 		return;
 	}
 
 	/* non-blocking connect - wait for write event */
-	tnode->connect_fde = tevent_add_fd(node->ctdb->ev, tnode, tnode->fd,
+	tnode->connect_fde = tevent_add_fd(node->ctdb->ev,
+					   tnode,
+					   tnode->out_fd,
 					   TEVENT_FD_WRITE|TEVENT_FD_READ,
-					   ctdb_node_connect_write, node);
+					   ctdb_node_connect_write,
+					   node);
 
 	/* don't give it long to connect - retry in one second. This ensures
 	   that we find a node is up quickly (tcp normally backs off a syn reply
 	   delay by quite a lot) */
-	tnode->connect_te = tevent_add_timer(ctdb->ev, tnode,
+	tnode->connect_te = tevent_add_timer(ctdb->ev,
+					     tnode,
 					     timeval_current_ofs(1, 0),
-					     ctdb_tcp_node_connect, node);
+					     ctdb_tcp_node_connect,
+					     node);
 }
 
 /*
diff --git a/ctdb/tcp/tcp_init.c b/ctdb/tcp/tcp_init.c
index 87d628aba93..6b1299f32b5 100644
--- a/ctdb/tcp/tcp_init.c
+++ b/ctdb/tcp/tcp_init.c
@@ -38,16 +38,16 @@ static int tnode_destructor(struct ctdb_tcp_node *tnode)
 {
   //	struct ctdb_node *node = talloc_find_parent_bytype(tnode, struct ctdb_node);
 
-	if (tnode->fd != -1) {
-		close(tnode->fd);
-		tnode->fd = -1;
+	if (tnode->out_fd != -1) {
+		close(tnode->out_fd);
+		tnode->out_fd = -1;
 	}
 
 	return 0;
 }
 
 /*
-  initialise tcp portion of a ctdb node 
+  initialise tcp portion of a ctdb node
 */
 static int ctdb_tcp_add_node(struct ctdb_node *node)
 {
@@ -55,13 +55,19 @@ static int ctdb_tcp_add_node(struct ctdb_node *node)
 	tnode = talloc_zero(node, struct ctdb_tcp_node);
 	CTDB_NO_MEMORY(node->ctdb, tnode);
 
-	tnode->fd = -1;
+	tnode->out_fd = -1;
 	node->private_data = tnode;
 	talloc_set_destructor(tnode, tnode_destructor);
 
-	tnode->out_queue = ctdb_queue_setup(node->ctdb, node, tnode->fd, CTDB_TCP_ALIGNMENT,
-					    ctdb_tcp_tnode_cb, node, "to-node-%s", node->name);
-	
+	tnode->out_queue = ctdb_queue_setup(node->ctdb,
+					    node,
+					    tnode->out_fd,
+					    CTDB_TCP_ALIGNMENT,
+					    ctdb_tcp_tnode_cb,
+					    node,
+					    "to-node-%s",
+					    node->name);
+
 	return 0;
 }
 
-- 
2.23.0.rc1


From 1a41f045083ff36cd9d036c18f1dc329f6aac01b Mon Sep 17 00:00:00 2001
From: Martin Schwenke <martin@meltin.net>
Date: Fri, 9 Aug 2019 15:29:36 +1000
Subject: [PATCH 3/7] ctdb-tcp: Move incoming fd and queue into struct
 ctdb_tcp_node

This makes it easy to track both incoming and outgoing connectivity
states.

BUG: https://bugzilla.samba.org/show_bug.cgi?id=14084
Signed-off-by: Martin Schwenke <martin@meltin.net>
---
 ctdb/tcp/ctdb_tcp.h    | 14 ++++-----
 ctdb/tcp/tcp_connect.c | 64 +++++++++++++++++++++++++++---------------
 ctdb/tcp/tcp_init.c    |  8 ++++++
 ctdb/tcp/tcp_io.c      |  9 ++++--
 4 files changed, 61 insertions(+), 34 deletions(-)

diff --git a/ctdb/tcp/ctdb_tcp.h b/ctdb/tcp/ctdb_tcp.h
index acd343fb8f3..9a615fc6393 100644
--- a/ctdb/tcp/ctdb_tcp.h
+++ b/ctdb/tcp/ctdb_tcp.h
@@ -26,23 +26,19 @@ struct ctdb_tcp {
 	int listen_fd;
 };
 
-/*
-  state associated with an incoming connection
-*/
-struct ctdb_incoming {
-	struct ctdb_context *ctdb;
-	int fd;
-	struct ctdb_queue *queue;
-};
-
 /*
   state associated with one tcp node
 */
 struct ctdb_tcp_node {
 	int out_fd;
 	struct ctdb_queue *out_queue;
+
 	struct tevent_fd *connect_fde;
 	struct tevent_timer *connect_te;
+
+	struct ctdb_context *ctdb;
+	int in_fd;
+	struct ctdb_queue *in_queue;
 };
 
 
diff --git a/ctdb/tcp/tcp_connect.c b/ctdb/tcp/tcp_connect.c
index 4253f3bef7c..866454f3d29 100644
--- a/ctdb/tcp/tcp_connect.c
+++ b/ctdb/tcp/tcp_connect.c
@@ -262,8 +262,8 @@ static void ctdb_listen_event(struct tevent_context *ev, struct tevent_fd *fde,
 	ctdb_sock_addr addr;
 	socklen_t len;
 	int fd;
-	uint32_t pnn;
-	struct ctdb_incoming *in;
+	struct ctdb_node *node;
+	struct ctdb_tcp_node *tnode;
 	int one = 1;
 	int ret;
 
@@ -273,41 +273,61 @@ static void ctdb_listen_event(struct tevent_context *ev, struct tevent_fd *fde,
 	if (fd == -1) return;
 	smb_set_close_on_exec(fd);
 
-	pnn = ctdb_ip_to_pnn(ctdb, &addr);
-
-	if (pnn == CTDB_UNKNOWN_PNN) {
+	node = ctdb_ip_to_node(ctdb, &addr);
+	if (node == NULL) {
 		D_ERR("Refused connection from unknown node %s\n",
 		      ctdb_addr_to_str(&addr));
 		close(fd);
 		return;
 	}
 
-	in = talloc_zero(ctcp, struct ctdb_incoming);
-	in->fd = fd;
-	in->ctdb = ctdb;
+	tnode = talloc_get_type_abort(node->private_data,
+				      struct ctdb_tcp_node);
+	if (tnode == NULL) {
+		/* This can't happen - see ctdb_tcp_initialise() */
+		DBG_ERR("INTERNAL ERROR setting up connection from node %s\n",
+			ctdb_addr_to_str(&addr));
+		close(fd);
+		return;
+	}
 
-	ret = set_blocking(in->fd, false);
+	ret = set_blocking(fd, false);
 	if (ret != 0) {
-		DEBUG(DEBUG_ERR,
-		      (__location__
-		       " failed to set socket non-blocking (%s)\n",
-		       strerror(errno)));
-		close(in->fd);
-		in->fd = -1;
+		DBG_ERR("Failed to set socket non-blocking (%s)\n",
+			strerror(errno));
+		close(fd);
 		return;
 	}
 
-	set_close_on_exec(in->fd);
+	set_close_on_exec(fd);
 
-	DEBUG(DEBUG_DEBUG, (__location__ " Created SOCKET FD:%d to incoming ctdb connection\n", fd));
+	DBG_DEBUG("Created SOCKET FD:%d to incoming ctdb connection\n", fd);
 
-        if (setsockopt(in->fd,SOL_SOCKET,SO_KEEPALIVE,(char *)&one,sizeof(one)) == -1) {
-		DEBUG(DEBUG_WARNING, ("Failed to set KEEPALIVE on fd - %s\n",
-				      strerror(errno)));
+	ret = setsockopt(fd,
+			 SOL_SOCKET,
+			 SO_KEEPALIVE,
+			 (char *)&one,
+			 sizeof(one));
+	if (ret == -1) {
+		DBG_WARNING("Failed to set KEEPALIVE on fd - %s\n",
+			    strerror(errno));
+	}
+
+	tnode->in_queue = ctdb_queue_setup(ctdb,
+					   tnode,
+					   fd,
+					   CTDB_TCP_ALIGNMENT,
+					   ctdb_tcp_read_cb,
+					   tnode,
+					   "ctdbd-%s",
+					   ctdb_addr_to_str(&addr));
+	if (tnode->in_queue == NULL) {
+		DBG_ERR("Failed to set up incoming queue\n");
+		close(fd);
+		return;
 	}
 
-	in->queue = ctdb_queue_setup(ctdb, in, in->fd, CTDB_TCP_ALIGNMENT,
-				     ctdb_tcp_read_cb, in, "ctdbd-%s", ctdb_addr_to_str(&addr));
+	tnode->in_fd = fd;
 }
 
 
diff --git a/ctdb/tcp/tcp_init.c b/ctdb/tcp/tcp_init.c
index 6b1299f32b5..d4b42b0d0f2 100644
--- a/ctdb/tcp/tcp_init.c
+++ b/ctdb/tcp/tcp_init.c
@@ -43,6 +43,11 @@ static int tnode_destructor(struct ctdb_tcp_node *tnode)
 		tnode->out_fd = -1;
 	}
 
+	if (tnode->in_fd != -1) {
+		close(tnode->in_fd);
+		tnode->in_fd = -1;
+	}
+
 	return 0;
 }
 
@@ -56,6 +61,9 @@ static int ctdb_tcp_add_node(struct ctdb_node *node)
 	CTDB_NO_MEMORY(node->ctdb, tnode);
 
 	tnode->out_fd = -1;
+	tnode->in_fd = -1;
+	tnode->ctdb = node->ctdb;
+
 	node->private_data = tnode;
 	talloc_set_destructor(tnode, tnode_destructor);
 
diff --git a/ctdb/tcp/tcp_io.c b/ctdb/tcp/tcp_io.c
index 0eb8e25eea3..be4558b16ea 100644
--- a/ctdb/tcp/tcp_io.c
+++ b/ctdb/tcp/tcp_io.c
@@ -37,7 +37,8 @@
  */
 void ctdb_tcp_read_cb(uint8_t *data, size_t cnt, void *args)
 {
-	struct ctdb_incoming *in = talloc_get_type(args, struct ctdb_incoming);
+	struct ctdb_tcp_node *tnode = talloc_get_type_abort(
+		args, struct ctdb_tcp_node);
 	struct ctdb_req_header *hdr = (struct ctdb_req_header *)data;
 
 	if (data == NULL) {
@@ -69,11 +70,13 @@ void ctdb_tcp_read_cb(uint8_t *data, size_t cnt, void *args)
 	}
 
 	/* tell the ctdb layer above that we have a packet */
-	in->ctdb->upcalls->recv_pkt(in->ctdb, data, cnt);
+	tnode->ctdb->upcalls->recv_pkt(tnode->ctdb, data, cnt);
 	return;
 
 failed:
-	TALLOC_FREE(in);
+	TALLOC_FREE(tnode->in_queue);
+	close(tnode->in_fd);
+	tnode->in_fd = -1;
 	TALLOC_FREE(data);
 }
 
-- 
2.23.0.rc1


From 351be24739f1a552a647317e8137aa5487845bb8 Mon Sep 17 00:00:00 2001
From: Martin Schwenke <martin@meltin.net>
Date: Thu, 15 Aug 2019 15:45:16 +1000
Subject: [PATCH 4/7] ctdb-tcp: Use TALLOC_FREE()

Signed-off-by: Martin Schwenke <martin@meltin.net>
---
 ctdb/tcp/tcp_connect.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/ctdb/tcp/tcp_connect.c b/ctdb/tcp/tcp_connect.c
index 866454f3d29..16d75481050 100644
--- a/ctdb/tcp/tcp_connect.c
+++ b/ctdb/tcp/tcp_connect.c
@@ -46,10 +46,8 @@ void ctdb_tcp_stop_connection(struct ctdb_node *node)
 		node->private_data, struct ctdb_tcp_node);
 	
 	ctdb_queue_set_fd(tnode->out_queue, -1);
-	talloc_free(tnode->connect_te);
-	talloc_free(tnode->connect_fde);
-	tnode->connect_fde = NULL;
-	tnode->connect_te = NULL;
+	TALLOC_FREE(tnode->connect_te);
+	TALLOC_FREE(tnode->connect_fde);
 	if (tnode->out_fd != -1) {
 		close(tnode->out_fd);
 		tnode->out_fd = -1;
-- 
2.23.0.rc1


From fe239820dcad312ae9bfb186265bbdd96ea0db6b Mon Sep 17 00:00:00 2001
From: Martin Schwenke <martin@meltin.net>
Date: Thu, 15 Aug 2019 15:57:31 +1000
Subject: [PATCH 5/7] ctdb-tcp: Create outbound queue when the connection
 becomes writable

Since commit ddd97553f0a8bfaada178ec4a7460d76fa21f079
ctdb_queue_send() doesn't queue a packet if the connection isn't yet
established (i.e. when fd == -1).  So, don't bother creating the
outbound queue during initialisation but create it when the connection
becomes writable.

Now the presence of the queue indicates that the outbound connection
is up.

Signed-off-by: Martin Schwenke <martin@meltin.net>
---
 ctdb/tcp/tcp_connect.c | 23 ++++++++++++++++++++---
 ctdb/tcp/tcp_init.c    |  9 ---------
 ctdb/tcp/tcp_io.c      |  5 +++++
 3 files changed, 25 insertions(+), 12 deletions(-)

diff --git a/ctdb/tcp/tcp_connect.c b/ctdb/tcp/tcp_connect.c
index 16d75481050..4374242015c 100644
--- a/ctdb/tcp/tcp_connect.c
+++ b/ctdb/tcp/tcp_connect.c
@@ -44,8 +44,8 @@ void ctdb_tcp_stop_connection(struct ctdb_node *node)
 {
 	struct ctdb_tcp_node *tnode = talloc_get_type(
 		node->private_data, struct ctdb_tcp_node);
-	
-	ctdb_queue_set_fd(tnode->out_queue, -1);
+
+	TALLOC_FREE(tnode->out_queue);
 	TALLOC_FREE(tnode->connect_te);
 	TALLOC_FREE(tnode->connect_fde);
 	if (tnode->out_fd != -1) {
@@ -126,7 +126,24 @@ static void ctdb_node_connect_write(struct tevent_context *ev,
 			    strerror(errno));
 	}
 
-	ctdb_queue_set_fd(tnode->out_queue, tnode->out_fd);
+	tnode->out_queue = ctdb_queue_setup(node->ctdb,
+					    tnode,
+					    tnode->out_fd,
+					    CTDB_TCP_ALIGNMENT,
+					    ctdb_tcp_tnode_cb,
+					    node,
+					    "to-node-%s",
+					    node->name);
+	if (tnode->out_queue == NULL) {
+		DBG_ERR("Failed to set up outgoing queue\n");
+		ctdb_tcp_stop_connection(node);
+		tnode->connect_te = tevent_add_timer(ctdb->ev,
+						     tnode,
+						     timeval_current_ofs(1, 0),
+						     ctdb_tcp_node_connect,
+						     node);
+		return;
+	}
 
 	/* the queue subsystem now owns this fd */
 	tnode->out_fd = -1;
diff --git a/ctdb/tcp/tcp_init.c b/ctdb/tcp/tcp_init.c
index d4b42b0d0f2..a9cb9b36a01 100644
--- a/ctdb/tcp/tcp_init.c
+++ b/ctdb/tcp/tcp_init.c
@@ -67,15 +67,6 @@ static int ctdb_tcp_add_node(struct ctdb_node *node)
 	node->private_data = tnode;
 	talloc_set_destructor(tnode, tnode_destructor);
 
-	tnode->out_queue = ctdb_queue_setup(node->ctdb,
-					    node,
-					    tnode->out_fd,
-					    CTDB_TCP_ALIGNMENT,
-					    ctdb_tcp_tnode_cb,
-					    node,
-					    "to-node-%s",
-					    node->name);
-
 	return 0;
 }
 
diff --git a/ctdb/tcp/tcp_io.c b/ctdb/tcp/tcp_io.c
index be4558b16ea..e33ed44048e 100644
--- a/ctdb/tcp/tcp_io.c
+++ b/ctdb/tcp/tcp_io.c
@@ -87,5 +87,10 @@ int ctdb_tcp_queue_pkt(struct ctdb_node *node, uint8_t *data, uint32_t length)
 {
 	struct ctdb_tcp_node *tnode = talloc_get_type(node->private_data,
 						      struct ctdb_tcp_node);
+	if (tnode->out_queue == NULL) {
+		DBG_DEBUG("No outgoing connection, dropping packet\n");
+		return 0;
+	}
+
 	return ctdb_queue_send(tnode->out_queue, data, length);
 }
-- 
2.23.0.rc1


From dd301be99eac88a8924b4f2ccd5e953943b10ef3 Mon Sep 17 00:00:00 2001
From: Martin Schwenke <martin@meltin.net>
Date: Fri, 9 Aug 2019 15:33:05 +1000
Subject: [PATCH 6/7] ctdb-tcp: Only mark a node connected if both directions
 are up

Nodes are currently marked as up if the outgoing connection is
established.  However, if the incoming connection is not yet
established then this node could send a request where the replying
node can not queue its reply.  Wait until both directions are up
before marking a node as connected.

BUG: https://bugzilla.samba.org/show_bug.cgi?id=14084
Signed-off-by: Martin Schwenke <martin@meltin.net>
---
 ctdb/tcp/tcp_connect.c | 20 +++++++++++++++++---
 1 file changed, 17 insertions(+), 3 deletions(-)

diff --git a/ctdb/tcp/tcp_connect.c b/ctdb/tcp/tcp_connect.c
index 4374242015c..fd635b9abf2 100644
--- a/ctdb/tcp/tcp_connect.c
+++ b/ctdb/tcp/tcp_connect.c
@@ -148,8 +148,14 @@ static void ctdb_node_connect_write(struct tevent_context *ev,
 	/* the queue subsystem now owns this fd */
 	tnode->out_fd = -1;
 
-	/* tell the ctdb layer we are connected */
-	node->ctdb->upcalls->node_connected(node);
+	/*
+	 * Mark the node to which this connection has been established
+	 * as connected, but only if the corresponding listening
+	 * socket is also connected
+	 */
+	if (tnode->in_fd != -1) {
+		node->ctdb->upcalls->node_connected(node);
+	}
 }
 
 
@@ -343,7 +349,15 @@ static void ctdb_listen_event(struct tevent_context *ev, struct tevent_fd *fde,
 	}
 
 	tnode->in_fd = fd;
-}
+
+       /*
+	* Mark the connecting node as connected, but only if the
+	* corresponding outbound connected is also up
+	*/
+	if (tnode->out_queue != NULL) {
+		node->ctdb->upcalls->node_connected(node);
+	}
+ }
 
 
 /*
-- 
2.23.0.rc1


From 17800935fbe85a5a85620efe13eaeb9276f3a13e Mon Sep 17 00:00:00 2001
From: Martin Schwenke <martin@meltin.net>
Date: Tue, 13 Aug 2019 17:08:43 +1000
Subject: [PATCH 7/7] ctdb-tcp: Mark node as disconnected if incoming
 connection goes away

To make it easy to pass the node data to the upcall, the private data
for ctdb_tcp_read_cb() needs to be changed from tnode to node.

This could be squashed with the previous commit but may be kept
separate for clarity.

RN: Avoid marking a node as connected before it can receive packets
BUG: https://bugzilla.samba.org/show_bug.cgi?id=14084
Signed-off-by: Martin Schwenke <martin@meltin.net>
---
 ctdb/tcp/tcp_connect.c | 2 +-
 ctdb/tcp/tcp_io.c      | 5 ++++-
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/ctdb/tcp/tcp_connect.c b/ctdb/tcp/tcp_connect.c
index fd635b9abf2..6123380ca9f 100644
--- a/ctdb/tcp/tcp_connect.c
+++ b/ctdb/tcp/tcp_connect.c
@@ -339,7 +339,7 @@ static void ctdb_listen_event(struct tevent_context *ev, struct tevent_fd *fde,
 					   fd,
 					   CTDB_TCP_ALIGNMENT,
 					   ctdb_tcp_read_cb,
-					   tnode,
+					   node,
 					   "ctdbd-%s",
 					   ctdb_addr_to_str(&addr));
 	if (tnode->in_queue == NULL) {
diff --git a/ctdb/tcp/tcp_io.c b/ctdb/tcp/tcp_io.c
index e33ed44048e..e8ebff887e1 100644
--- a/ctdb/tcp/tcp_io.c
+++ b/ctdb/tcp/tcp_io.c
@@ -37,8 +37,9 @@
  */
 void ctdb_tcp_read_cb(uint8_t *data, size_t cnt, void *args)
 {
+	struct ctdb_node *node = talloc_get_type_abort(args, struct ctdb_node);
 	struct ctdb_tcp_node *tnode = talloc_get_type_abort(
-		args, struct ctdb_tcp_node);
+		node->private_data, struct ctdb_tcp_node);
 	struct ctdb_req_header *hdr = (struct ctdb_req_header *)data;
 
 	if (data == NULL) {
@@ -77,6 +78,8 @@ failed:
 	TALLOC_FREE(tnode->in_queue);
 	close(tnode->in_fd);
 	tnode->in_fd = -1;
+	node->ctdb->upcalls->node_dead(node);
+
 	TALLOC_FREE(data);
 }
 
-- 
2.23.0.rc1


--MP_/I46wBEmvMqpOt1u3mfIkrr4--

