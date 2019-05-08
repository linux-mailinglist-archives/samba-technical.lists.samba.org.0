Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::443:1])
	by mail.lfdr.de (Postfix) with ESMTPS id 511E416EA6
	for <lists+samba-technical@lfdr.de>; Wed,  8 May 2019 03:33:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=sMpRhwgXAPsVWlrsljx1t3fRvT8A8F1RXGcoo2CAeE8=; b=F2AVP+BXFYQRgGFTLLBwP4W7fI
	seOmRGvxJnTOiJR/nyhXWtcI+H37AMbNro9fn976EsuH+k2PqvbtQzcHIQOLZnLwYAK20xDrzzYlw
	LzIFF9Y1lyDK4X9UpNMULAwBQG0HLZaOgga4fM7i7nW94gLrHmu32geL1XSIQuFY7kUIefjV/nBGP
	oOF/VN1n/te31JQjTD5GSCOYPUqHvAKgXrbKIpxZtCunvRB/OfBtxzKEuOYKoHcHW/CEvaNiEVVre
	jc4jNgyuOYwL1mUXRqe7emSzty7K07xpt15dR9J54RJgF7kKhWxoaw2xykPayY2fSIro8tZkGh2lQ
	Yw1aNHnA==;
Received: from localhost ([::1]:52838 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hOBSH-002xQo-Q9; Wed, 08 May 2019 01:33:09 +0000
Received: from ozlabs.org ([2401:3900:2:1::2]:49141) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hOBSC-002xQX-VU
 for samba-technical@lists.samba.org; Wed, 08 May 2019 01:33:08 +0000
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 44zJrV2SPRz9s3q;
 Wed,  8 May 2019 11:32:58 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=meltin.net; s=201810;
 t=1557279178; bh=EDQGcTwudEwuUYn9ICnuNqka+aLWKJigpwIHjpffSUI=;
 h=Date:From:To:Subject:From;
 b=VV5RORXzYiGbbJcaraxu+OJscrH/FbXkvWWq0AHgZPCrZ/kYY4+rW5kfH++7gXSaM
 YE1KKhpom+1h8Q0i9rxVwpP2TEz83QZO/PdZhWQCimmBjliPhlnZLqO6RUFlz9Onv3
 8BoZmJB7VGdrAvl8mijKgnuW4zEnR3crOuF/rJinUiNpCMynuJNpbnMtUlF4MxnYhC
 siokrNTzFeEGrolGiUhUGxHwr9Ef0mMupCp6zrL0fhYmeR7yA/yBSam6VmG267NQAe
 0uN4+pZgHPYJVyoe8gINS5ql97GBPb55i+nwfkf2QGzPVSsDM5gYjILjRHNburJIJ5
 iG5eH0rEhrNuQ==
Date: Wed, 8 May 2019 11:32:57 +1000
To: Samba Technical <samba-technical@lists.samba.org>
Subject: [PATCH] ctdb-daemon: Never use 0 as a client ID (bug #13930)
Message-ID: <20190508113257.5990023c@martins.ozlabs.org>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="MP_/6co4sYjjicCeJEYX464FQ=X"
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

--MP_/6co4sYjjicCeJEYX464FQ=X
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

ctdb_control_db_attach() and ctdb_control_db_detach() assume that any
control with client ID 0 comes from another daemon and treat it
specially.

Pipeline: https://gitlab.com/samba-team/devel/samba/pipelines/60261138
(just started)

Please review and maybe push...

peace & happiness,
martin

--MP_/6co4sYjjicCeJEYX464FQ=X
Content-Type: text/x-patch
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename=0001-ctdb-daemon-Never-use-0-as-a-client-ID.patch

From 020d2b8c9e2a843b1b970aa9a9f86a325fd66289 Mon Sep 17 00:00:00 2001
From: Martin Schwenke <martin@meltin.net>
Date: Mon, 6 May 2019 15:22:49 +1000
Subject: [PATCH] ctdb-daemon: Never use 0 as a client ID

ctdb_control_db_attach() and ctdb_control_db_detach() assume that any
control with client ID 0 comes from another daemon and treat it
specially.

BUG: https://bugzilla.samba.org/show_bug.cgi?id=13930

Signed-off-by: Martin Schwenke <martin@meltin.net>
---
 ctdb/server/ctdb_daemon.c | 48 ++++++++++++++++++++++++++++++++++++++-
 1 file changed, 47 insertions(+), 1 deletion(-)

diff --git a/ctdb/server/ctdb_daemon.c b/ctdb/server/ctdb_daemon.c
index de885c75f76..33e9c2c9c0d 100644
--- a/ctdb/server/ctdb_daemon.c
+++ b/ctdb/server/ctdb_daemon.c
@@ -1051,6 +1051,44 @@ static int ctdb_clientpid_destructor(struct ctdb_client_pid_list *client_pid)
 	return 0;
 }
 
+static int get_new_client_id(struct reqid_context *idr,
+			     struct ctdb_client *client,
+			     uint32_t *out)
+{
+	uint32_t client_id;
+
+	client_id = reqid_new(idr, client);
+	/*
+	 * Some places in the code (e.g. ctdb_control_db_attach(),
+	 * ctdb_control_db_detach()) assign a special meaning to
+	 * client_id 0.  The assumption is that if client_id is 0 then
+	 * the control has come from another daemon.  Therefore, we
+	 * should never return client_id == 0.
+	 */
+	if (client_id == 0) {
+		/*
+		 * Don't leak ID 0.  This is safe because the ID keeps
+		 * increasing.  A test will be added to ensure that
+		 * this doesn't change.
+		 */
+		reqid_remove(idr, 0);
+
+		client_id = reqid_new(idr, client);
+	}
+
+	if (client_id == REQID_INVALID) {
+		return EINVAL;
+	}
+
+	if (client_id == 0) {
+		/* Every other ID must have been used and we can't use 0 */
+		reqid_remove(idr, 0);
+		return EINVAL;
+	}
+
+	*out = client_id;
+	return 0;
+}
 
 static void ctdb_accept_client(struct tevent_context *ev,
 			       struct tevent_fd *fde, uint16_t flags,
@@ -1094,7 +1132,15 @@ static void ctdb_accept_client(struct tevent_context *ev,
 
 	client->ctdb = ctdb;
 	client->fd = fd;
-	client->client_id = reqid_new(ctdb->idr, client);
+
+	ret = get_new_client_id(ctdb->idr, client, &client->client_id);
+	if (ret != 0) {
+		DBG_ERR("Unable to get client ID (%d)\n", ret);
+		close(fd);
+		talloc_free(client);
+		return;
+	}
+
 	client->pid = peer_pid;
 
 	client_pid = talloc(client, struct ctdb_client_pid_list);
-- 
2.20.1


--MP_/6co4sYjjicCeJEYX464FQ=X--

