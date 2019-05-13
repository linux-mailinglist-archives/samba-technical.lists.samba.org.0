Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::443:1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C4871AE93
	for <lists+samba-technical@lfdr.de>; Mon, 13 May 2019 02:27:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=cLZqJt+6QYsoSQ46Ho87V9wZYG6VrMuRlfRpsLY629Y=; b=leEKBGlocB8Yu2Hx86SzOMop3b
	2ZqFS4MfEiohgboajrhs1hEaWVnQQTvfXSJmyUFOs4emvJtFJFKMoAFIF0qzj38PHNkFJZ/hp0rOX
	uFKD021d5cYNOlNlMkRoBfs8fEXTUPWCLKKP3HfzI06nbwTciJhu4+857lJoZ9WTnfre2sWjOj4Xm
	PDDywvePvlIDiVmzpPkYKZSvf2el9kG9UFq6CV+dRd+xPKRmI5WFMzbjICLrKwtQ12e2+uoOsIWnn
	7D2RiSeszsjs7TGY+GVwEDe1/GDIPInAlqY7bzAGpLeoGuAZLk+0VuawMKur71Z837QWdDPHOXjYj
	Vp5WRvcA==;
Received: from localhost ([::1]:45376 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hPynm-003GIS-7O; Mon, 13 May 2019 00:26:46 +0000
Received: from ozlabs.org ([203.11.71.1]:35073) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hPynh-003GIL-G0
 for samba-technical@lists.samba.org; Mon, 13 May 2019 00:26:44 +0000
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 452M7S4Sr4z9s3q;
 Mon, 13 May 2019 10:26:28 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=meltin.net; s=201810;
 t=1557707189; bh=NP9oy1Inw6NNLPhuVy+NDCporLAX7do2yYAsW2BIrKo=;
 h=Date:From:To:Subject:From;
 b=TGfkIh/xfIqUK3a2oIprILHchcTvrcl5ZlKM4FNFa2RYB0NXFbBfjz8BkX+achaYw
 zVlwG3d/vLFxCBA64lUcX2sLoLSTc8eHGoEsIjc5dYyuiju1mkWdBHlaSo3qvLgwL2
 0VLmWoOc+zH27W8LkvYa1es/S3VC+lSUNCNZIkXIOxBpOgjHddlEe4/96PY8CHs1Sz
 0wy/h578aP6M9oVcP8uEb1X2VU3loycSVRPOo5yimtFuLKK3jg9JL4BpQdgiXwibRK
 8NJvhAn2qHyLJ1TBiVqyf/d/HYv+5oSLdQ7i1G/CgYgGLbT8t365xRXvdq38uJKLGl
 IRqxmhi//3jjA==
Date: Mon, 13 May 2019 10:26:27 +1000
To: Samba Technical <samba-technical@lists.samba.org>
Subject: PATCH: More CTDB test fixes (bug #13924)
Message-ID: <20190513102627.299b1c0e@martins.ozlabs.org>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="MP_/tnMSBkZnpFZQyDd5nKRAWm5"
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

--MP_/tnMSBkZnpFZQyDd5nKRAWm5
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

A couple more CTDB test fixes.

Please review and maybe push...

peace & happiness,
martin

--MP_/tnMSBkZnpFZQyDd5nKRAWm5
Content-Type: text/x-patch
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=BZ13924-even-more.patch

From f5ee663b153ee84dc50b7bc7592cad98cfd96414 Mon Sep 17 00:00:00 2001
From: Martin Schwenke <martin@meltin.net>
Date: Fri, 10 May 2019 19:22:16 +1000
Subject: [PATCH 1/2] ctdb-tests: Actually restart if cluster doesn't become
 healthy

BUG: https://bugzilla.samba.org/show_bug.cgi?id=13924

Signed-off-by: Martin Schwenke <martin@meltin.net>
---
 ctdb/tests/scripts/integration.bash | 1 +
 1 file changed, 1 insertion(+)

diff --git a/ctdb/tests/scripts/integration.bash b/ctdb/tests/scripts/integration.bash
index ce5bd576b24..32a729d0249 100644
--- a/ctdb/tests/scripts/integration.bash
+++ b/ctdb/tests/scripts/integration.bash
@@ -520,6 +520,7 @@ ctdb_init ()
 {
     local i
     for i in $(seq 1 5) ; do
+	ctdb_stop_all >/dev/null 2>&1 || :
 	ctdb_start_all || {
 	    echo "Start failed.  Trying again in a few seconds..."
 	    sleep_for 5
-- 
2.20.1


From c6026535cefbbc185a2f32f38a2af389b8b1eef1 Mon Sep 17 00:00:00 2001
From: Martin Schwenke <martin@meltin.net>
Date: Sun, 12 May 2019 07:52:13 +1000
Subject: [PATCH 2/2] ctdb-tests: Remove old socket wrapper state directory
 during setup

Otherwise, when looping tests for a long time, nodes are unable to
connect to each other.

BUG: https://bugzilla.samba.org/show_bug.cgi?id=13924

Signed-off-by: Martin Schwenke <martin@meltin.net>
---
 ctdb/tests/local_daemons.sh | 1 +
 1 file changed, 1 insertion(+)

diff --git a/ctdb/tests/local_daemons.sh b/ctdb/tests/local_daemons.sh
index 8fbef1922b9..58a762b426d 100755
--- a/ctdb/tests/local_daemons.sh
+++ b/ctdb/tests/local_daemons.sh
@@ -119,6 +119,7 @@ setup_socket_wrapper ()
 	ln -s "$_socket_wrapper_so" "$_so"
 
 	_d="${directory}/sw"
+	rm -rf "$_d"
 	mkdir -p "$_d"
 }
 
-- 
2.20.1


--MP_/tnMSBkZnpFZQyDd5nKRAWm5--

