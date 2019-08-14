Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id EB0628CA02
	for <lists+samba-technical@lfdr.de>; Wed, 14 Aug 2019 06:02:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=s44G0w99hfEh9eHVwhxvyYtGBsBumEkZGmI9SJO3cbE=; b=AgN2s0qsllOtPpEvX18tHnb6xe
	aveguRzwrluLlA/kcAeZXpzto53RYZjAvUs2kvYwVuBmM/4Tef9YXTWb/TnYiv/cCj9f2yQooeEv4
	lzEnyoWWi+97Rapq5QCklh0ROQvz5T0JWyfUa8fzDdeeXDpR/yHi5JssdLRBYUZXzfy8bMiSefe1M
	PoBKGjHL2qnUWBGEHAQW8WkZwuhPrSa4zLoH3CmEVp7B1kiOItqHJtCveShrRcoKXHnNNhhy/tLEk
	E1VCaq54sRDkOHqEYfkoQXQenJau+5Th9bMjlEa0kw7E7SgdAnMxskQjERKDhj/70q3SuYaipzVIR
	de/gvPlA==;
Received: from localhost ([::1]:39818 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hxkUM-006E6V-H1; Wed, 14 Aug 2019 04:02:18 +0000
Received: from ozlabs.org ([2401:3900:2:1::2]:42403) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hxkUH-006E6O-IR
 for samba-technical@lists.samba.org; Wed, 14 Aug 2019 04:02:16 +0000
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 467bWL67wTz9sML;
 Wed, 14 Aug 2019 14:02:06 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=meltin.net; s=201810;
 t=1565755327; bh=OKzxWEtqSgDkeiG46JUTBHWFWp824zkvR5KVx23zuA4=;
 h=Date:From:To:Subject:From;
 b=VLSPFgcK2a88nRLCwNsoy/XL7k1kT5fn7AwZ+FbXJ5QwpxxJgdblVNXW74hPumQGq
 DMpPVDzCh/ytz+xXh53zY6ssH8JL3RqmyCc8fRexA1xrt7YEPOUYbPv2pj648t1W4w
 iyX1xSHw2lSetwaCEg93tht2r/mS5JzLL08Ukyn93PjHpU2EZ6ehsEy4CNpHC7qOkE
 rMOSB9qLItQBs1cxhAEnKUL1M2l3gF3YELm1qq5qpMrhqedQa43F5X4JKymQQS9CrN
 FYQ4OuQfAOi4lpc4mzfTMkDSAzhZY4oBzDHV7HY58nAseHHfxe7pGKJlWmPoJpaCcT
 f92Aw9N815RnQ==
Date: Wed, 14 Aug 2019 14:02:05 +1000
To: Samba Technical <samba-technical@lists.samba.org>
Subject: [PATCH] Minor CTDB test improvement
Message-ID: <20190814140205.0cae47a5@martins.ozlabs.org>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="MP_/ALACMZlZ5/qh_+vHr9M8NLA"
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

--MP_/ALACMZlZ5/qh_+vHr9M8NLA
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Included in this pipeline:

  https://gitlab.com/samba-team/devel/samba/pipelines/76265339

Please review and maybe push...

peace & happiness,
martin

--MP_/ALACMZlZ5/qh_+vHr9M8NLA
Content-Type: text/x-patch
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=ctdb-select-test-node.patch

From fd5c40d96681c1792b1ed2ebde61e77c3b1d4061 Mon Sep 17 00:00:00 2001
From: Martin Schwenke <martin@meltin.net>
Date: Fri, 26 Jul 2019 11:15:05 +1000
Subject: [PATCH 1/2] ctdb-tests: Add function select_test_node()

Should be used when public IP addresses are not assigned.

Signed-off-by: Martin Schwenke <martin@meltin.net>
---
 ctdb/tests/scripts/integration.bash | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/ctdb/tests/scripts/integration.bash b/ctdb/tests/scripts/integration.bash
index 30725c48e53..011aeadee40 100644
--- a/ctdb/tests/scripts/integration.bash
+++ b/ctdb/tests/scripts/integration.bash
@@ -150,6 +150,14 @@ sanity_check_output ()
     return $ret
 }
 
+select_test_node ()
+{
+	try_command_on_node any ctdb pnn || return 1
+
+	test_node="$out"
+	echo "Selected node ${test_node}"
+}
+
 # This returns a list of "ip node" lines in $outfile
 all_ips_on_node()
 {
-- 
2.20.1


From afe4d6c459308d21f011eaf827f7cd31c1cd3a80 Mon Sep 17 00:00:00 2001
From: Martin Schwenke <martin@meltin.net>
Date: Fri, 26 Jul 2019 11:15:50 +1000
Subject: [PATCH 2/2] ctdb-tests: Use select_test_node() in ctdb setdebug
 simple test

There is no requirement for IP addresses here.

Signed-off-by: Martin Schwenke <martin@meltin.net>
---
 ctdb/tests/simple/13_ctdb_setdebug.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/ctdb/tests/simple/13_ctdb_setdebug.sh b/ctdb/tests/simple/13_ctdb_setdebug.sh
index 50c435b624d..3e04ca33733 100755
--- a/ctdb/tests/simple/13_ctdb_setdebug.sh
+++ b/ctdb/tests/simple/13_ctdb_setdebug.sh
@@ -19,7 +19,7 @@ set -e
 
 cluster_is_healthy
 
-select_test_node_and_ips
+select_test_node
 
 get_debug ()
 {
-- 
2.20.1


--MP_/ALACMZlZ5/qh_+vHr9M8NLA--

