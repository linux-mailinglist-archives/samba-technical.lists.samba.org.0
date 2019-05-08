Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::443:1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C3CC16EA5
	for <lists+samba-technical@lfdr.de>; Wed,  8 May 2019 03:32:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=Cq+jbh0koku+S9jUxM/l2UBKWjescDuiSZMDsHQNx6U=; b=PDdTyLHAZ1P2X9kKfAFIYTq4dp
	bZTAqxnf9l2MpyqfgRj3mn0eahTBmA3BQvJynO/CBmnAo36R7pw2aQgTL6K/t/uY6caYEurkS6FAD
	C+ChFvl0sM9fmGcYFlV2ployYZKnrPU9PkU6L6mIxdUIHf1xUkQVYTnX9t2sph+EKARk+WIMaMGys
	jHDBMx9cK2TyHV+OM8VSA0m7TH8iIC74dSGYBbm1HJzk6EaxkFhTek6J1ensCNPagayp2sJHNuPZJ
	jzxDJgUebCz1oOPGW68/6zbyTpnR7wObBWzttYIdeEEMPjx+NojWLxJOsrYHE2lvC3TzoMrC17ZcQ
	+Glu0z4A==;
Received: from localhost ([::1]:52090 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hOBR0-002xKa-HO; Wed, 08 May 2019 01:31:50 +0000
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:60817 helo=ozlabs.org) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hOBQf-002xKT-4a
 for samba-technical@lists.samba.org; Wed, 08 May 2019 01:31:38 +0000
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 44zJpY3NFLz9s3l;
 Wed,  8 May 2019 11:31:17 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=meltin.net; s=201810;
 t=1557279077; bh=oYYhwFeXNlOODYa1fqcDMUG4ubLKoov4i6EiN2PHM6s=;
 h=Date:From:To:Subject:From;
 b=q9PZBqIQ0wY9TH4HAyQKfgkW32LyKckrsa1LMYuz6dON1WrRzoXjk3LUmpBKb058y
 HzV85DBQMp+zdZ0Us4vMdHTSoo7VVYKQuH95qgb6vBtQETqznQh79X8sAPbBRIi4Qs
 UZhI01ayR+SODMQXJgMKx07B7XqBsepPacNR2G5evwN0/IcoSSUoKNHjGuCCfz2YUg
 eEbSoAU5x7AtH9J/UqcquKnTaRHa9i+IbMXKM66mdet8pM6ytYJjzCXVJxIVDSFIw8
 tPYOdCWzX8qIsmXUwTDVsVqtw5s6j9dk+yRe5Bx45hRCoq1WIaLFBCpwePmu7bkru9
 BAeKoQ7+z/JPA==
Date: Wed, 8 May 2019 11:31:14 +1000
To: Samba Technical <samba-technical@lists.samba.org>
Subject: [PATCH] ctdb-tests: Make reloadips tests more reliable (bug #13924)
Message-ID: <20190508113114.2f6ff9f8@martins.ozlabs.org>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="MP_/hmaw_IB=iHBUtMLecP=97oJ"
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

--MP_/hmaw_IB=iHBUtMLecP=97oJ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

The "ctdb reloadips" can fail for a few reasons, including
colliding with a takeover run already in progress.  This was a
simplifying design decision.

The tests try to be careful, but there's a startup edge case where an
unexpected takeover run can be triggered, though it has been delayed
for a quite a while after startup.

Fixing the edge case in the tool or daemon code is stupidly
complicated, so just work around the issue in the test.  While there,
additional patch fixes a possible logic error in one of the tests.

Pipeline: https://gitlab.com/samba-team/devel/samba/pipelines/60261138
(just started)

Please review and maybe push...

peace & happiness,
martin

--MP_/hmaw_IB=iHBUtMLecP=97oJ
Content-Type: text/x-patch
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=BZ13924-additional.patch

From 689b3f5a2c1eefc667f45d054d73792bd378a945 Mon Sep 17 00:00:00 2001
From: Martin Schwenke <martin@meltin.net>
Date: Tue, 7 May 2019 15:29:19 +1000
Subject: [PATCH 1/2] ctdb-tests:  Make ctdb reloadips tests more reliable

ctdb reloadips will fail if it can't disable takover runs.  The most
likely reason for this is that there is already a takeover run in
progress.  We can't predict when this will happen, so retry if this
occurs.

BUG: https://bugzilla.samba.org/show_bug.cgi?id=13924

Signed-off-by: Martin Schwenke <martin@meltin.net>
---
 ctdb/tests/complex/18_ctdb_reloadips.sh | 35 ++++++++++++++++++++++---
 ctdb/tests/simple/18_ctdb_reloadips.sh  | 33 ++++++++++++++++++++---
 2 files changed, 61 insertions(+), 7 deletions(-)

diff --git a/ctdb/tests/complex/18_ctdb_reloadips.sh b/ctdb/tests/complex/18_ctdb_reloadips.sh
index 4ba1b26a8e8..26782130430 100755
--- a/ctdb/tests/complex/18_ctdb_reloadips.sh
+++ b/ctdb/tests/complex/18_ctdb_reloadips.sh
@@ -184,6 +184,33 @@ check_ips ()
     fi
 }
 
+# ctdb reloadips will fail if it can't disable takover runs.  The most
+# likely reason for this is that there is already a takeover run in
+# progress.  We can't predict when this will happen, so retry if this
+# occurs.
+do_ctdb_reloadips ()
+{
+	local retry_max=10
+	local retry_count=0
+	while : ; do
+		if try_command_on_node "$test_node" "$CTDB reloadips" ; then
+			return 0
+		fi
+
+		if [ "$out" != "Failed to disable takeover runs" ] ; then
+			return 1
+		fi
+
+		if [ $retry_count -ge $retry_max ] ; then
+			return 1
+		fi
+
+		retry_count=$((retry_count + 1))
+		echo "Retrying..."
+		sleep_for 1
+	done
+}
+
 ####################
 
 new_ip_max=100
@@ -193,7 +220,7 @@ new_ip_max=100
 add_ips_to_original_config \
     $test_node "$addresses" "$iface" "$prefix" 1 $new_ip_max
 
-try_command_on_node $test_node "$CTDB reloadips"
+do_ctdb_reloadips
 
 check_ips $test_node "$iface" "$prefix" 1 $new_ip_max
 
@@ -207,7 +234,7 @@ echo "Using 'ctdb reloadips' to remove the 1st address just added..."
 add_ips_to_original_config \
     $test_node "$addresses" "$iface" "$prefix" 2 $new_ip_max
 
-try_command_on_node $test_node "$CTDB reloadips"
+do_ctdb_reloadips
 
 check_ips $test_node "$iface" "$prefix" 2 $new_ip_max
 
@@ -222,7 +249,7 @@ echo "Updating to include only about 1/2 of the new IPs..."
 add_ips_to_original_config \
     $test_node "$addresses" "$iface" "$prefix" $start $new_ip_max
 
-try_command_on_node $test_node "$CTDB reloadips"
+do_ctdb_reloadips
 
 check_ips $test_node "$iface" "$prefix" $start $new_ip_max
 
@@ -234,6 +261,6 @@ try_command_on_node any $CTDB sync
 echo "Restoring original IP configuration..."
 restore_public_addresses
 
-try_command_on_node $test_node "$CTDB reloadips"
+do_ctdb_reloadips
 
 check_ips $test_node "$iface" "$prefix" 0
diff --git a/ctdb/tests/simple/18_ctdb_reloadips.sh b/ctdb/tests/simple/18_ctdb_reloadips.sh
index 9c60a14a93e..61c3a561da9 100755
--- a/ctdb/tests/simple/18_ctdb_reloadips.sh
+++ b/ctdb/tests/simple/18_ctdb_reloadips.sh
@@ -42,9 +42,36 @@ restore_public_addresses ()
 }
 ctdb_test_exit_hook_add restore_public_addresses
 
+# ctdb reloadips will fail if it can't disable takover runs.  The most
+# likely reason for this is that there is already a takeover run in
+# progress.  We can't predict when this will happen, so retry if this
+# occurs.
+do_ctdb_reloadips ()
+{
+	local retry_max=10
+	local retry_count=0
+	while : ; do
+		if try_command_on_node any "$CTDB reloadips all" ; then
+			return 0
+		fi
+
+		if [ "$out" != "Failed to disable takeover runs" ] ; then
+			return 1
+		fi
+
+		if [ $retry_count -ge $retry_max ] ; then
+			return 1
+		fi
+
+		retry_count=$((retry_count + 1))
+		echo "Retrying..."
+		sleep_for 1
+	done
+}
+
 try_command_on_node $test_node "mv $addresses $backup && touch $addresses"
 
-try_command_on_node any $CTDB reloadips all
+do_ctdb_reloadips
 
 echo "Getting list of public IPs on node $test_node"
 try_command_on_node $test_node "$CTDB ip | tail -n +2"
@@ -64,7 +91,7 @@ try_command_on_node any $CTDB sync
 echo "Restoring addresses"
 restore_public_addresses
 
-try_command_on_node any $CTDB reloadips all
+do_ctdb_reloadips
 
 echo "Getting list of public IPs on node $test_node"
 try_command_on_node $test_node "$CTDB ip | tail -n +2"
@@ -85,7 +112,7 @@ echo "Removing IP $test_ip from node $test_node"
 
 try_command_on_node $test_node "mv $addresses $backup && grep -v '^${test_ip}/' $backup >$addresses"
 
-try_command_on_node any $CTDB reloadips all
+do_ctdb_reloadips
 
 try_command_on_node $test_node $CTDB ip
 
-- 
2.20.1


From 64957e545c90ab115d8946ad781efc9f145a1a6d Mon Sep 17 00:00:00 2001
From: Martin Schwenke <martin@meltin.net>
Date: Tue, 7 May 2019 15:42:49 +1000
Subject: [PATCH 2/2] ctdb-tests: Fix logic error in simple ctdb reloadips test

There is a chance that restoring IP addresses to the test node will
result in different IP addresses being assigned to that node.
Removing a single IP address may then fail (or be a no-op) if it is
done after the restore.

So, swap the single IP address removal to happen first, then restore,
then remove all IP addresses.

BUG: https://bugzilla.samba.org/show_bug.cgi?id=13924

Signed-off-by: Martin Schwenke <martin@meltin.net>
---
 ctdb/tests/simple/18_ctdb_reloadips.sh | 37 ++++++++++++++------------
 1 file changed, 20 insertions(+), 17 deletions(-)

diff --git a/ctdb/tests/simple/18_ctdb_reloadips.sh b/ctdb/tests/simple/18_ctdb_reloadips.sh
index 61c3a561da9..451fca3a866 100755
--- a/ctdb/tests/simple/18_ctdb_reloadips.sh
+++ b/ctdb/tests/simple/18_ctdb_reloadips.sh
@@ -29,8 +29,6 @@ cluster_is_healthy
 
 select_test_node_and_ips
 
-echo "Emptying public addresses file on $test_node"
-
 try_command_on_node $test_node $CTDB_TEST_WRAPPER ctdb_base_show
 addresses="${out}/public_addresses"
 echo "Public addresses file on node $test_node is \"$addresses\""
@@ -69,25 +67,31 @@ do_ctdb_reloadips ()
 	done
 }
 
-try_command_on_node $test_node "mv $addresses $backup && touch $addresses"
+
+echo "Removing IP $test_ip from node $test_node"
+
+try_command_on_node $test_node "mv $addresses $backup && grep -v '^${test_ip}/' $backup >$addresses"
 
 do_ctdb_reloadips
 
-echo "Getting list of public IPs on node $test_node"
-try_command_on_node $test_node "$CTDB ip | tail -n +2"
+try_command_on_node $test_node $CTDB ip
 
-if [ -n "$out" ] ; then
+if grep "^${test_ip} " <<<"$out" ; then
     cat <<EOF
-BAD: node $test_node still has ips:
+BAD: node $test_node can still host IP $test_ip:
 $out
 EOF
     exit 1
 fi
 
-echo "GOOD: no IPs left on node $test_node"
+cat <<EOF
+GOOD: node $test_node is no longer hosting IP $test_ip:
+$out
+EOF
 
 try_command_on_node any $CTDB sync
 
+
 echo "Restoring addresses"
 restore_public_addresses
 
@@ -108,23 +112,22 @@ EOF
 
 try_command_on_node any $CTDB sync
 
-echo "Removing IP $test_ip from node $test_node"
 
-try_command_on_node $test_node "mv $addresses $backup && grep -v '^${test_ip}/' $backup >$addresses"
+echo "Emptying public addresses file on $test_node"
+
+try_command_on_node $test_node "mv $addresses $backup && touch $addresses"
 
 do_ctdb_reloadips
 
-try_command_on_node $test_node $CTDB ip
+echo "Getting list of public IPs on node $test_node"
+try_command_on_node $test_node "$CTDB ip | tail -n +2"
 
-if grep "^${test_ip} " <<<"$out" ; then
+if [ -n "$out" ] ; then
     cat <<EOF
-BAD: node $test_node can still host IP $test_ip:
+BAD: node $test_node still has ips:
 $out
 EOF
     exit 1
 fi
 
-cat <<EOF
-GOOD: node $test_node is no longer hosting IP $test_ip:
-$out
-EOF
+echo "GOOD: no IPs left on node $test_node"
-- 
2.20.1


--MP_/hmaw_IB=iHBUtMLecP=97oJ--

