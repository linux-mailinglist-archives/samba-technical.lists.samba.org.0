Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D6DF79744E
	for <lists+samba-technical@lfdr.de>; Wed, 21 Aug 2019 10:01:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=UWHVy/mg5xfUVkLoPZuy1E6GgbdtHIh/S08DOhDu154=; b=IR1Ap06ODsg0Zp2FgmGj6NPEDW
	z+EOyvtAdeI2qRAAeVsM7AoJY79omd2p0w4n3aVZyAHZS2Q3c85xN+O6yETwSWTi60J2wDYlAdR9x
	flXxRyktKNhMEcfAVLoyEqjxCJQ/523a1kuT1IfBKuoVK3G4+EuM/JRaohbSL9IUMW7/VunPJhEXm
	SxzsBq3DVexaac++3ZhAxYal+E9aApBZgOqBzU+CT9mA7Zxfn8S/csDn/razIa4+dOI2vbzNTZY0x
	MINAP6p8c5XGiUZvQBGJTR+6zwEPu6ayChKqxHBG9Bro/Ur8DH2IgSiTnibXIfX38pSE5GBO1Rr2v
	VwtvOZXw==;
Received: from localhost ([::1]:48288 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1i0LXq-007L6X-4B; Wed, 21 Aug 2019 08:00:38 +0000
Received: from ozlabs.org ([203.11.71.1]:50893) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1i0LXh-007L6Q-1i
 for samba-technical@lists.samba.org; Wed, 21 Aug 2019 08:00:33 +0000
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 46D0Sz5GT4z9sN6;
 Wed, 21 Aug 2019 18:00:19 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=meltin.net; s=201810;
 t=1566374419; bh=V9k1dSYAgIPjMiWeSE3TM0RkxsBymBGlCHaZJCYIzYk=;
 h=Date:From:To:Subject:From;
 b=BFNd+WNPEAYVNuJUdcwj5ECtvWAOXsWniqhWKp9QRkVu3K4dt/LKWka249wxe5raN
 mSfhlyrFzAu1M+qTMThAYJJ8xlxRb+fo1jV19HW9brxH34hH40LUtqRA/datZml6VU
 n3O3qcydnghTpOxcOO3E8a9nMhJ9ySbkufT5qoI/Z84B2v9bIhpo+CSCbSMkaqcxuG
 Z9LNiOPVDrkin/aAo72ufvaiz8y4LSJantSdrnkUSNnDF8vN/xd5ydW8qXn1A1Fwrl
 YitQ0qmBXV0UVqh625fLSh1dqoFOf2dh/6ocyJ9caoaHIv03UbE87i8q532QH8KWae
 RFyt+xWi30bdQ==
Date: Wed, 21 Aug 2019 17:59:56 +1000
To: Samba Technical <samba-technical@lists.samba.org>
Subject: [PATCH] Fix CTDB flapping tests
Message-ID: <20190821175956.32cd4776@martins.ozlabs.org>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="MP_/zC3Y01pTRJLUPJGpR=EYWEi"
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

--MP_/zC3Y01pTRJLUPJGpR=EYWEi
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

The attached patch set fixes nearly all of the flapping CTDB tests.

A variant passed pipeline:

  https://gitlab.com/samba-team/devel/samba/pipelines/77082113

Please review and maybe push...

peace & happiness,
martin

--MP_/zC3Y01pTRJLUPJGpR=EYWEi
Content-Type: text/x-patch
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=ctdb-tests.patch

From 640ec8bd003baeb2d646acbede155164cb0c82ba Mon Sep 17 00:00:00 2001
From: Martin Schwenke <martin@meltin.net>
Date: Mon, 29 Jul 2019 15:31:55 +1000
Subject: [PATCH 1/9] ctdb-tests: Reformat node_has_status()

Re-indent and drop non-POSIX left-parenthesis from case labels.

BUG: https://bugzilla.samba.org/show_bug.cgi?id=14085

Signed-off-by: Martin Schwenke <martin@meltin.net>
---
 ctdb/tests/scripts/integration.bash | 94 +++++++++++++++--------------
 1 file changed, 48 insertions(+), 46 deletions(-)

diff --git a/ctdb/tests/scripts/integration.bash b/ctdb/tests/scripts/integration.bash
index 011aeadee40..489cc3b5cdb 100644
--- a/ctdb/tests/scripts/integration.bash
+++ b/ctdb/tests/scripts/integration.bash
@@ -319,53 +319,55 @@ wait_until_ready ()
 # This function is becoming nicely overloaded.  Soon it will collapse!  :-)
 node_has_status ()
 {
-    local pnn="$1"
-    local status="$2"
-
-    local bits fpat mpat rpat
-    case "$status" in
-	(unhealthy)    bits="?|?|?|1|*" ;;
-	(healthy)      bits="?|?|?|0|*" ;;
-	(disconnected) bits="1|*" ;;
-	(connected)    bits="0|*" ;;
-	(banned)       bits="?|1|*" ;;
-	(unbanned)     bits="?|0|*" ;;
-	(disabled)     bits="?|?|1|*" ;;
-	(enabled)      bits="?|?|0|*" ;;
-	(stopped)      bits="?|?|?|?|1|*" ;;
-	(notstopped)   bits="?|?|?|?|0|*" ;;
-	(frozen)       fpat='^[[:space:]]+frozen[[:space:]]+1$' ;;
-	(unfrozen)     fpat='^[[:space:]]+frozen[[:space:]]+0$' ;;
-	(recovered)    rpat='^Recovery mode:RECOVERY \(1\)$' ;;
-	(notlmaster)   rpat="^hash:.* lmaster:${pnn}\$" ;;
+	local pnn="$1"
+	local status="$2"
+
+	local bits fpat mpat rpat
+	case "$status" in
+	unhealthy)    bits="?|?|?|1|*" ;;
+	healthy)      bits="?|?|?|0|*" ;;
+	disconnected) bits="1|*" ;;
+	connected)    bits="0|*" ;;
+	banned)       bits="?|1|*" ;;
+	unbanned)     bits="?|0|*" ;;
+	disabled)     bits="?|?|1|*" ;;
+	enabled)      bits="?|?|0|*" ;;
+	stopped)      bits="?|?|?|?|1|*" ;;
+	notstopped)   bits="?|?|?|?|0|*" ;;
+	frozen)       fpat='^[[:space:]]+frozen[[:space:]]+1$' ;;
+	unfrozen)     fpat='^[[:space:]]+frozen[[:space:]]+0$' ;;
+	recovered)    rpat='^Recovery mode:RECOVERY \(1\)$' ;;
+	notlmaster)   rpat="^hash:.* lmaster:${pnn}\$" ;;
 	*)
-	    echo "node_has_status: unknown status \"$status\""
-	    return 1
-    esac
-
-    if [ -n "$bits" ] ; then
-	local out x line
-
-	out=$($CTDB -X status 2>&1) || return 1
-
-	{
-            read x
-            while read line ; do
-		# This needs to be done in 2 steps to avoid false matches.
-		local line_bits="${line#|${pnn}|*|}"
-		[ "$line_bits" = "$line" ] && continue
-		[ "${line_bits#${bits}}" != "$line_bits" ] && return 0
-            done
-	    return 1
-	} <<<"$out" # Yay bash!
-    elif [ -n "$fpat" ] ; then
-	$CTDB statistics -n "$pnn" | egrep -q "$fpat"
-    elif [ -n "$rpat" ] ; then
-        ! $CTDB status -n "$pnn" | egrep -q "$rpat"
-    else
-	echo 'node_has_status: unknown mode, neither $bits nor $fpat is set'
-	return 1
-    fi
+		echo "node_has_status: unknown status \"$status\""
+		return 1
+	esac
+
+	if [ -n "$bits" ] ; then
+		local out x line
+
+		out=$($CTDB -X status 2>&1) || return 1
+
+		{
+			read x
+			while read line ; do
+				# This needs to be done in 2 steps to
+				# avoid false matches.
+				local line_bits="${line#|${pnn}|*|}"
+				[ "$line_bits" = "$line" ] && continue
+				[ "${line_bits#${bits}}" != "$line_bits" ] && \
+					return 0
+			done
+			return 1
+		} <<<"$out" # Yay bash!
+	elif [ -n "$fpat" ] ; then
+		$CTDB statistics -n "$pnn" | egrep -q "$fpat"
+	elif [ -n "$rpat" ] ; then
+		! $CTDB status -n "$pnn" | egrep -q "$rpat"
+	else
+		echo 'node_has_status: unknown mode, neither $bits nor $fpat is set'
+		return 1
+	fi
 }
 
 wait_until_node_has_status ()
-- 
2.23.0.rc1


From e5be59bd44b3d3eee7b1d4aa36510dcf768a22d5 Mon Sep 17 00:00:00 2001
From: Martin Schwenke <martin@meltin.net>
Date: Mon, 29 Jul 2019 15:40:16 +1000
Subject: [PATCH 2/9] ctdb-tests: Drop unused node statuses frozen/unfrozen

Silently drop unused local variable mpat.

BUG: https://bugzilla.samba.org/show_bug.cgi?id=14085

Signed-off-by: Martin Schwenke <martin@meltin.net>
---
 ctdb/tests/scripts/integration.bash | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/ctdb/tests/scripts/integration.bash b/ctdb/tests/scripts/integration.bash
index 489cc3b5cdb..c4d5179d902 100644
--- a/ctdb/tests/scripts/integration.bash
+++ b/ctdb/tests/scripts/integration.bash
@@ -322,7 +322,7 @@ node_has_status ()
 	local pnn="$1"
 	local status="$2"
 
-	local bits fpat mpat rpat
+	local bits rpat
 	case "$status" in
 	unhealthy)    bits="?|?|?|1|*" ;;
 	healthy)      bits="?|?|?|0|*" ;;
@@ -334,8 +334,6 @@ node_has_status ()
 	enabled)      bits="?|?|0|*" ;;
 	stopped)      bits="?|?|?|?|1|*" ;;
 	notstopped)   bits="?|?|?|?|0|*" ;;
-	frozen)       fpat='^[[:space:]]+frozen[[:space:]]+1$' ;;
-	unfrozen)     fpat='^[[:space:]]+frozen[[:space:]]+0$' ;;
 	recovered)    rpat='^Recovery mode:RECOVERY \(1\)$' ;;
 	notlmaster)   rpat="^hash:.* lmaster:${pnn}\$" ;;
 	*)
@@ -360,12 +358,10 @@ node_has_status ()
 			done
 			return 1
 		} <<<"$out" # Yay bash!
-	elif [ -n "$fpat" ] ; then
-		$CTDB statistics -n "$pnn" | egrep -q "$fpat"
 	elif [ -n "$rpat" ] ; then
 		! $CTDB status -n "$pnn" | egrep -q "$rpat"
 	else
-		echo 'node_has_status: unknown mode, neither $bits nor $fpat is set'
+		echo 'node_has_status: unknown mode, neither $bits nor $rpat is set'
 		return 1
 	fi
 }
-- 
2.23.0.rc1


From a36317a812c882077be128a8c4fa76185977a260 Mon Sep 17 00:00:00 2001
From: Martin Schwenke <martin@meltin.net>
Date: Mon, 29 Jul 2019 15:45:41 +1000
Subject: [PATCH 3/9] ctdb-tests: Inline handling of recovered and notlmaster
 statuses

BUG: https://bugzilla.samba.org/show_bug.cgi?id=14085

Signed-off-by: Martin Schwenke <martin@meltin.net>
---
 ctdb/tests/scripts/integration.bash | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/ctdb/tests/scripts/integration.bash b/ctdb/tests/scripts/integration.bash
index c4d5179d902..a81f2a022eb 100644
--- a/ctdb/tests/scripts/integration.bash
+++ b/ctdb/tests/scripts/integration.bash
@@ -322,7 +322,7 @@ node_has_status ()
 	local pnn="$1"
 	local status="$2"
 
-	local bits rpat
+	local bits
 	case "$status" in
 	unhealthy)    bits="?|?|?|1|*" ;;
 	healthy)      bits="?|?|?|0|*" ;;
@@ -334,8 +334,16 @@ node_has_status ()
 	enabled)      bits="?|?|0|*" ;;
 	stopped)      bits="?|?|?|?|1|*" ;;
 	notstopped)   bits="?|?|?|?|0|*" ;;
-	recovered)    rpat='^Recovery mode:RECOVERY \(1\)$' ;;
-	notlmaster)   rpat="^hash:.* lmaster:${pnn}\$" ;;
+	recovered)
+		! $CTDB status -n "$pnn" | \
+			grep -Eq '^Recovery mode:RECOVERY \(1\)$'
+		return
+		;;
+	notlmaster)
+		! $CTDB status -n "$pnn" | \
+			grep -Eq "^hash:.* lmaster:${pnn}\$"
+		return
+		;;
 	*)
 		echo "node_has_status: unknown status \"$status\""
 		return 1
@@ -358,10 +366,8 @@ node_has_status ()
 			done
 			return 1
 		} <<<"$out" # Yay bash!
-	elif [ -n "$rpat" ] ; then
-		! $CTDB status -n "$pnn" | egrep -q "$rpat"
 	else
-		echo 'node_has_status: unknown mode, neither $bits nor $rpat is set'
+		echo 'node_has_status: unknown mode, $bits not set'
 		return 1
 	fi
 }
-- 
2.23.0.rc1


From 06a3187dac337671e26f0a5bbd8a83ed93dd6115 Mon Sep 17 00:00:00 2001
From: Martin Schwenke <martin@meltin.net>
Date: Mon, 29 Jul 2019 16:43:09 +1000
Subject: [PATCH 4/9] ctdb-tests: Handle special cases first and return

All the other cases involve matching bits.

BUG: https://bugzilla.samba.org/show_bug.cgi?id=14085

Signed-off-by: Martin Schwenke <martin@meltin.net>
---
 ctdb/tests/scripts/integration.bash | 59 ++++++++++++++---------------
 1 file changed, 28 insertions(+), 31 deletions(-)

diff --git a/ctdb/tests/scripts/integration.bash b/ctdb/tests/scripts/integration.bash
index a81f2a022eb..36ee09c563b 100644
--- a/ctdb/tests/scripts/integration.bash
+++ b/ctdb/tests/scripts/integration.bash
@@ -322,6 +322,19 @@ node_has_status ()
 	local pnn="$1"
 	local status="$2"
 
+	case "$status" in
+	recovered)
+		! $CTDB status -n "$pnn" | \
+			grep -Eq '^Recovery mode:RECOVERY \(1\)$'
+		return
+		;;
+	notlmaster)
+		! $CTDB status -n "$pnn" | \
+			grep -Eq "^hash:.* lmaster:${pnn}\$"
+		return
+		;;
+	esac
+
 	local bits
 	case "$status" in
 	unhealthy)    bits="?|?|?|1|*" ;;
@@ -334,42 +347,26 @@ node_has_status ()
 	enabled)      bits="?|?|0|*" ;;
 	stopped)      bits="?|?|?|?|1|*" ;;
 	notstopped)   bits="?|?|?|?|0|*" ;;
-	recovered)
-		! $CTDB status -n "$pnn" | \
-			grep -Eq '^Recovery mode:RECOVERY \(1\)$'
-		return
-		;;
-	notlmaster)
-		! $CTDB status -n "$pnn" | \
-			grep -Eq "^hash:.* lmaster:${pnn}\$"
-		return
-		;;
 	*)
 		echo "node_has_status: unknown status \"$status\""
 		return 1
 	esac
-
-	if [ -n "$bits" ] ; then
-		local out x line
-
-		out=$($CTDB -X status 2>&1) || return 1
-
-		{
-			read x
-			while read line ; do
-				# This needs to be done in 2 steps to
-				# avoid false matches.
-				local line_bits="${line#|${pnn}|*|}"
-				[ "$line_bits" = "$line" ] && continue
-				[ "${line_bits#${bits}}" != "$line_bits" ] && \
-					return 0
-			done
-			return 1
-		} <<<"$out" # Yay bash!
-	else
-		echo 'node_has_status: unknown mode, $bits not set'
+	local out x line
+
+	out=$($CTDB -X status 2>&1) || return 1
+
+	{
+		read x
+		while read line ; do
+			# This needs to be done in 2 steps to
+			# avoid false matches.
+			local line_bits="${line#|${pnn}|*|}"
+			[ "$line_bits" = "$line" ] && continue
+			[ "${line_bits#${bits}}" != "$line_bits" ] && \
+				return 0
+		done
 		return 1
-	fi
+	} <<<"$out" # Yay bash!
 }
 
 wait_until_node_has_status ()
-- 
2.23.0.rc1


From 317907a66b7079a4fd0cb44bc7be7888f70ec267 Mon Sep 17 00:00:00 2001
From: Martin Schwenke <martin@meltin.net>
Date: Mon, 29 Jul 2019 16:45:07 +1000
Subject: [PATCH 5/9] ctdb-tests: Don't retrieve the VNN map from target node
 for notlmaster

Use the VNN map from the node running node_has_status().

This means that

  wait_until_node_has_status 1 notlmaster 10 0

will run "ctdb status" on node 0 and check (for up to 10 seconds) if
node 1 is in the VNN map.

If the LMASTER capability has been dropped on node 1 then the above
will wait for the VNN map to be updated on node 0.  This will happen
as part of the recovery that is triggered by the change of LMASTER
capability.  The next command will then only be able to attach to
$TESTDB after the recovery is complete thus guaranteeing a sane state
for the test to continue.

This stops simple/79_volatile_db_traverse.sh from going into recovery
during the traverse or at some other inconvenient time.

BUG: https://bugzilla.samba.org/show_bug.cgi?id=14085

Signed-off-by: Martin Schwenke <martin@meltin.net>
---
 ctdb/tests/scripts/integration.bash | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/ctdb/tests/scripts/integration.bash b/ctdb/tests/scripts/integration.bash
index 36ee09c563b..284449d4503 100644
--- a/ctdb/tests/scripts/integration.bash
+++ b/ctdb/tests/scripts/integration.bash
@@ -329,8 +329,7 @@ node_has_status ()
 		return
 		;;
 	notlmaster)
-		! $CTDB status -n "$pnn" | \
-			grep -Eq "^hash:.* lmaster:${pnn}\$"
+		! $CTDB status | grep -Eq "^hash:.* lmaster:${pnn}\$"
 		return
 		;;
 	esac
-- 
2.23.0.rc1


From ac71e2482d09713f39fe7732cfbe36e552efb464 Mon Sep 17 00:00:00 2001
From: Martin Schwenke <martin@meltin.net>
Date: Wed, 21 Aug 2019 14:35:09 +1000
Subject: [PATCH 6/9] ctdb-recoverd: Only check for LMASTER nodes in the VNN
 map

BUG: https://bugzilla.samba.org/show_bug.cgi?id=14085

Signed-off-by: Martin Schwenke <martin@meltin.net>
---
 ctdb/server/ctdb_recoverd.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/ctdb/server/ctdb_recoverd.c b/ctdb/server/ctdb_recoverd.c
index 2633c755752..c1c2a88b12c 100644
--- a/ctdb/server/ctdb_recoverd.c
+++ b/ctdb/server/ctdb_recoverd.c
@@ -2989,13 +2989,19 @@ static void main_loop(struct ctdb_context *ctdb, struct ctdb_recoverd *rec,
 		return;
 	}
 
-	/* verify that all active nodes in the nodemap also exist in 
-	   the vnnmap.
+	/*
+	 * Verify that all active lmaster nodes in the nodemap also
+	 * exist in the vnnmap
 	 */
 	for (j=0; j<nodemap->num; j++) {
 		if (nodemap->nodes[j].flags & NODE_FLAGS_INACTIVE) {
 			continue;
 		}
+		if (! ctdb_node_has_capabilities(rec->caps,
+						 ctdb->nodes[j]->pnn,
+						 CTDB_CAP_LMASTER)) {
+			continue;
+		}
 		if (nodemap->nodes[j].pnn == pnn) {
 			continue;
 		}
@@ -3006,8 +3012,8 @@ static void main_loop(struct ctdb_context *ctdb, struct ctdb_recoverd *rec,
 			}
 		}
 		if (i == vnnmap->size) {
-			DEBUG(DEBUG_ERR, (__location__ " Node %u is active in the nodemap but did not exist in the vnnmap\n", 
-				  nodemap->nodes[j].pnn));
+			D_ERR("Active LMASTER node %u is not in the vnnmap\n",
+			      nodemap->nodes[j].pnn);
 			ctdb_set_culprit(rec, nodemap->nodes[j].pnn);
 			do_recovery(rec, mem_ctx, pnn, nodemap, vnnmap);
 			return;
-- 
2.23.0.rc1


From b11fe5d0d6c7f7202be617c7eec38ed4fe862f88 Mon Sep 17 00:00:00 2001
From: Martin Schwenke <martin@meltin.net>
Date: Mon, 29 Jul 2019 17:22:50 +1000
Subject: [PATCH 7/9] ctdb-tests: Strengthen volatile DB traverse test

Check the record count more often, from multiple nodes.  Add a case
with multiple records.

BUG: https://bugzilla.samba.org/show_bug.cgi?id=14085

Signed-off-by: Martin Schwenke <martin@meltin.net>
---
 ctdb/tests/simple/79_volatile_db_traverse.sh | 67 +++++++++++++++-----
 1 file changed, 52 insertions(+), 15 deletions(-)

diff --git a/ctdb/tests/simple/79_volatile_db_traverse.sh b/ctdb/tests/simple/79_volatile_db_traverse.sh
index af7e962f579..7f3007d5105 100755
--- a/ctdb/tests/simple/79_volatile_db_traverse.sh
+++ b/ctdb/tests/simple/79_volatile_db_traverse.sh
@@ -42,11 +42,56 @@ try_command_on_node 0 $CTDB writekey "$TESTDB" "foo" "bar0"
 echo "write foo=bar1 on node 1"
 try_command_on_node 1 $CTDB writekey "$TESTDB" "foo" "bar1"
 
-echo "do traverse on node 0"
-try_command_on_node -v 0 $CTDB catdb "$TESTDB"
+echo
 
-echo "do traverse on node 1"
-try_command_on_node -v 1 $CTDB catdb "$TESTDB"
+check_db_num_records ()
+{
+	local node="$1"
+	local db="$2"
+	local n="$3"
+
+	echo "Checking on node ${node} to ensure ${db} has ${n} records..."
+	try_command_on_node "$node" "${CTDB} catdb ${db}"
+
+	num=$(sed -n -e 's|^Dumped \(.*\) records$|\1|p' "$outfile")
+	if [ "$num" = "$n" ] ; then
+		echo "OK: Number of records=${num}"
+		echo
+	else
+		echo "BAD: There were ${num} (!= ${n}) records"
+		cat "$outfile"
+		exit 1
+	fi
+}
+
+check_db_num_records 0 "$TESTDB" 1
+check_db_num_records 1 "$TESTDB" 1
+
+cat <<EOF
+
+Again, this time with 10 records, rewriting 5 of them on the 2nd node
+
+EOF
+
+echo "wipe test database $TESTDB"
+try_command_on_node 0 $CTDB wipedb "$TESTDB"
+
+for i in $(seq 0 9) ; do
+	k="foo${i}"
+	v="bar${i}@0"
+	echo "write ${k}=${v} on node 0"
+	try_command_on_node 0 "${CTDB} writekey ${TESTDB} ${k} ${v}"
+done
+
+for i in $(seq 1 5) ; do
+	k="foo${i}"
+	v="bar${i}@1"
+	echo "write ${k}=${v} on node 1"
+	try_command_on_node 1 "${CTDB} writekey ${TESTDB} ${k} ${v}"
+done
+
+check_db_num_records 0 "$TESTDB" 10
+check_db_num_records 1 "$TESTDB" 10
 
 cat <<EOF
 
@@ -63,8 +108,6 @@ try_command_on_node 1 $CTDB setlmasterrole off
 try_command_on_node -v 1 $CTDB getcapabilities
 
 wait_until_node_has_status 1 notlmaster 10 0
-# Wait for recovery and new VNN map to be pushed
-#sleep_for 10
 
 echo "write foo=bar0 on node 0"
 try_command_on_node 0 $CTDB writekey "$TESTDB" "foo" "bar0"
@@ -72,16 +115,10 @@ try_command_on_node 0 $CTDB writekey "$TESTDB" "foo" "bar0"
 echo "write foo=bar1 on node 1"
 try_command_on_node 1 $CTDB writekey "$TESTDB" "foo" "bar1"
 
-echo "do traverse on node 0"
-try_command_on_node -v 0 $CTDB catdb "$TESTDB"
+echo
 
-num=$(sed -n -e 's|^Dumped \(.*\) records$|\1|p' "$outfile")
-if [ "$num" = 1 ] ; then
-	echo "OK: There was 1 record"
-else
-	echo "BAD: There were ${num} (!= 1) records"
-	exit 1
-fi
+check_db_num_records 0 "$TESTDB" 1
+check_db_num_records 1 "$TESTDB" 1
 
 if grep -q "^data(4) = \"bar1\"\$" "$outfile" ; then
 	echo "OK: Data from node 1 was returned"
-- 
2.23.0.rc1


From 3be125288f4a925170716697d35a9c82a9593c04 Mon Sep 17 00:00:00 2001
From: Martin Schwenke <martin@meltin.net>
Date: Wed, 7 Aug 2019 16:58:37 +1000
Subject: [PATCH 8/9] ctdb-tests: Wait for child process when killing cluster
 mutex helper

The following test sometimes fails:

==================================================
Running "cluster_mutex_test lock-unlock-lock-unlock ./tests/var/cluster_mutex.lockfile"
--------------------------------------------------
Output (Exit status: 134):
--------------------------------------------------
LOCK
UNLOCK
CONTENTION
NOLOCK
cluster_mutex_test: ../../tests/src/cluster_mutex_test.c:307: test_lock_unlock_lock_unlock: Assertion `dl2->mh != NULL' failed.
--------------------------------------------------
Required output (Exit status: 0):
--------------------------------------------------
LOCK
UNLOCK
LOCK
UNLOCK

FAILED
==========================================================================
TEST FAILED: tests/cunit/cluster_mutex_001.sh (status 1) (duration: 0s)
==========================================================================

This is due to a race in the test.  For the first UNLOCK a signal is
sent to the cluster mutex handler but the test tries to retake the
lock before that process is scheduled and the signal is processed.
Therefore, the fcntl() lock is still held and contention is seen.

After unlocking, tests need to wait until the child has gone, so build
this into ctdb_kill().  This is one of the only places where the PID
is accessible.

Outside of testing, on a real system, nothing will never try
to (re)take the lock so quickly.

BUG: https://bugzilla.samba.org/show_bug.cgi?id=14085

Signed-off-by: Martin Schwenke <martin@meltin.net>
---
 ctdb/tests/src/cluster_mutex_test.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/ctdb/tests/src/cluster_mutex_test.c b/ctdb/tests/src/cluster_mutex_test.c
index 3bf653a3b00..34398a98ea9 100644
--- a/ctdb/tests/src/cluster_mutex_test.c
+++ b/ctdb/tests/src/cluster_mutex_test.c
@@ -53,7 +53,23 @@ static pid_t ctdb_fork(struct ctdb_context *ctdb)
 
 static int ctdb_kill(struct ctdb_context *ctdb, pid_t pid, int signum)
 {
-	return kill(pid, signum);
+	/*
+	 * Tests need to wait for the child to exit to ensure that the
+	 * lock really has been released.  The PID is only accessible
+	 * in ctdb_cluster_mutex.c, so make a best attempt to ensure
+	 * that the child process is waited for after it is killed.
+	 * Avoid waiting if the process is already gone.
+	 */
+	int ret;
+
+	if (signum == 0) {
+		return kill(pid, signum);
+	}
+
+	ret = kill(pid, signum);
+	waitpid(pid, NULL, 0);
+
+	return ret;
 }
 
 #include "server/ctdb_cluster_mutex.c"
-- 
2.23.0.rc1


From 0e796b08c4a21f3217495e65dd50e83a93e4116d Mon Sep 17 00:00:00 2001
From: Martin Schwenke <martin@meltin.net>
Date: Tue, 13 Aug 2019 14:45:33 +1000
Subject: [PATCH 9/9] ctdb-tests: Clear deleted record via recovery instead of
 vacuuming

This test has been flapping because sometimes the record is not
vacuumed within the expected time period, perhaps even because the
check for the record can interfere with vacuuming.  However, instead
of waiting for vacuuming the record can be cleared by doing a
recovery.  This should be much more reliable.

BUG: https://bugzilla.samba.org/show_bug.cgi?id=14085
RN: Fix flapping CTDB tests

Signed-off-by: Martin Schwenke <martin@meltin.net>
---
 .../simple/69_recovery_resurrect_deleted.sh     | 17 +++++------------
 1 file changed, 5 insertions(+), 12 deletions(-)

diff --git a/ctdb/tests/simple/69_recovery_resurrect_deleted.sh b/ctdb/tests/simple/69_recovery_resurrect_deleted.sh
index 8126c49b83c..f6c72c59f2a 100755
--- a/ctdb/tests/simple/69_recovery_resurrect_deleted.sh
+++ b/ctdb/tests/simple/69_recovery_resurrect_deleted.sh
@@ -54,18 +54,11 @@ database_has_zero_records ()
 	return 0
 }
 
-echo "Get vacuum interval"
-try_command_on_node -v $second $CTDB getvar VacuumInterval
-vacuum_interval="${out#* = }"
-
-echo "Wait until vacuuming deletes the record on active nodes"
-# Why 4?  Steps are:
-# 1. Original node processes delete queue, asks lmaster to fetch
-# 2. lmaster recoverd fetches
-# 3. lmaster processes delete queue
-# If vacuuming is just missed then need an extra interval
-t=$((vacuum_interval * 4))
-wait_until "${t}/10" database_has_zero_records
+echo "Trigger a recovery"
+try_command_on_node "$second" $CTDB recover
+
+echo "Checking that database has 0 records"
+database_has_zero_records
 
 echo "Continue node ${first}"
 try_command_on_node $first $CTDB continue
-- 
2.23.0.rc1


--MP_/zC3Y01pTRJLUPJGpR=EYWEi--

