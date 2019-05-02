Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::443:1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4623F11787
	for <lists+samba-technical@lfdr.de>; Thu,  2 May 2019 12:46:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=Wb9GIokrF9c58pR99E2rzaEd9vnjGRHxpUtjWHoXb88=; b=iSA/bQblnHNddFbJnE3ryt4sbX
	SL0imqfd0md+asyE+3KtdOWAOGNBXjyYy1BscUBAmGYTazO+dbdFbfVECEHqHUyGlfBSxAelnaKni
	T0S+iuDR+zFV2+IlDT3JBBpLSa5JzVX8nKbrf3vL6S/XH294vHpSq8eYwghDDy/3YpazDH8ogd39P
	sJTPU9TIMjN5QTejEs1BwwiqosZjZjvD3aO/dW9OMZwaxMho9uy/Uu6UxwaIvt2mMeiKdIJIpLIaV
	YQ1qNO0/Mqw6nJxmw3k7ENp5nzi5lit6q89Y+MhlNSYH1giLVuOSJe1tS7qD6CkokxjkBULlYbIlu
	fWhBAiEA==;
Received: from localhost ([::1]:47696 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hM9EE-0020iP-JZ; Thu, 02 May 2019 10:46:14 +0000
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:32823 helo=ozlabs.org) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hM9E8-0020iI-NC
 for samba-technical@lists.samba.org; Thu, 02 May 2019 10:46:11 +0000
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 44vsPP6FkQz9s7T;
 Thu,  2 May 2019 20:46:01 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=meltin.net; s=201810;
 t=1556793962; bh=e1DbMhHZ/r7aaVMAkAyuLKO5bOf8WoevrmbThIrvtPw=;
 h=Date:From:To:Subject:From;
 b=l7hYBjbtNpKTGWtxYyWLRwUp+DycqkwsEKCPurPRJPum5Hy6c8P1Q0D036ZZ00aOc
 l72ovy4q3SozeqcI/wpVPRhFhmXPwaBtj6fETOJEbHts2tSjMVyuuJh2piLjiEFYix
 69dArV9YxqBGvB/dsmO9GzuXo7/tySKsqRBJI+bVgghzBqp6ljvsVt5neFRXEsrVgr
 CxFkpEB2J5jeQjCG/tW/SpTfVYWNHa1he/AHmRVw3ExpVnFq1o8b7Hb2vWmqPQAYuJ
 cyUq59Bl13sYvtTuYVL9JBprCWkCYLyPKCrW4WWGdWRGL0/UwGNEITMpPdx7CbzIiA
 lc8YoaqZlPFdA==
Date: Thu, 2 May 2019 20:46:00 +1000
To: Samba Technical <samba-technical@lists.samba.org>
Subject: [PATCH] ctdb-tools: Fix ctdb dumpmemory to avoid printing trailing
 NUL (BZ 13923)
Message-ID: <20190502204600.089e54b9@martins.ozlabs.org>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="MP_/9=sLKg0DscrQ_ovXbt7DQAx"
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

--MP_/9=sLKg0DscrQ_ovXbt7DQAx
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

This also fixes ctdb rdumpmemory.  A 2nd patch extends a test to also
test ctdb rdumpmemory.

The next patch set depends on this one - the updates to the tests there
expose the problem fixed here.

Pipeline: https://gitlab.com/samba-team/devel/samba/pipelines/59394125

Please review and maybe push...

peace & happiness,
martin

--MP_/9=sLKg0DscrQ_ovXbt7DQAx
Content-Type: text/x-patch
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=BZ13923.patch

From 158ab11618bb1ad8ed7525bfcda1a796c3e037c6 Mon Sep 17 00:00:00 2001
From: Martin Schwenke <martin@meltin.net>
Date: Thu, 11 Apr 2019 16:56:32 +1000
Subject: [PATCH 1/2] ctdb-tools: Fix ctdb dumpmemory to avoid printing
 trailing NUL

Fix ctdb rddumpmemory too.

BUG: https://bugzilla.samba.org/show_bug.cgi?id=13923

Signed-off-by: Martin Schwenke <martin@meltin.net>
---
 ctdb/tools/ctdb.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/ctdb/tools/ctdb.c b/ctdb/tools/ctdb.c
index 8db0ec8e766..3c61c542ec4 100644
--- a/ctdb/tools/ctdb.c
+++ b/ctdb/tools/ctdb.c
@@ -2450,8 +2450,8 @@ static int control_dumpmemory(TALLOC_CTX *mem_ctx, struct ctdb_context *ctdb,
 		return ret;
 	}
 
-	n = write(1, mem_str, strlen(mem_str)+1);
-	if (n < 0 || n != strlen(mem_str)+1) {
+	n = write(1, mem_str, strlen(mem_str));
+	if (n < 0 || n != strlen(mem_str)) {
 		fprintf(stderr, "Failed to write talloc summary\n");
 		return 1;
 	}
@@ -2462,10 +2462,12 @@ static int control_dumpmemory(TALLOC_CTX *mem_ctx, struct ctdb_context *ctdb,
 static void dump_memory(uint64_t srvid, TDB_DATA data, void *private_data)
 {
 	bool *done = (bool *)private_data;
+	size_t len;
 	ssize_t n;
 
-	n = write(1, data.dptr, data.dsize);
-	if (n < 0 || n != data.dsize) {
+	len = strnlen((const char *)data.dptr, data.dsize);
+	n = write(1, data.dptr, len);
+	if (n < 0 || n != len) {
 		fprintf(stderr, "Failed to write talloc summary\n");
 	}
 
-- 
2.20.1


From 353f1e62538edcb5adae58393618b94f5cccd522 Mon Sep 17 00:00:00 2001
From: Martin Schwenke <martin@meltin.net>
Date: Thu, 11 Apr 2019 16:58:10 +1000
Subject: [PATCH 2/2] ctdb-tests: Extend test to cover ctdb rddumpmemory

BUG: https://bugzilla.samba.org/show_bug.cgi?id=13923

Signed-off-by: Martin Schwenke <martin@meltin.net>
---
 ctdb/tests/simple/25_dumpmemory.sh | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/ctdb/tests/simple/25_dumpmemory.sh b/ctdb/tests/simple/25_dumpmemory.sh
index eec55b71c58..4f998bf8f3b 100755
--- a/ctdb/tests/simple/25_dumpmemory.sh
+++ b/ctdb/tests/simple/25_dumpmemory.sh
@@ -28,8 +28,11 @@ set -e
 
 cluster_is_healthy
 
-try_command_on_node -v 0 "$CTDB dumpmemory"
-
 pat='^([[:space:]].+[[:space:]]+contains[[:space:]]+[[:digit:]]+ bytes in[[:space:]]+[[:digit:]]+ blocks \(ref [[:digit:]]+\)[[:space:]]+0x[[:xdigit:]]+|[[:space:]]+reference to: .+|full talloc report on .+ \(total[[:space:]]+[[:digit:]]+ bytes in [[:digit:]]+ blocks\))$'
 
+try_command_on_node -v 0 "$CTDB dumpmemory"
+sanity_check_output 10 "$pat" "$out"
+
+echo
+try_command_on_node -v 0 "$CTDB rddumpmemory"
 sanity_check_output 10 "$pat" "$out"
-- 
2.20.1


--MP_/9=sLKg0DscrQ_ovXbt7DQAx--

