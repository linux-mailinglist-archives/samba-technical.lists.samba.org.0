Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A3E215E041
	for <lists+samba-technical@lfdr.de>; Wed,  3 Jul 2019 10:53:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=QiIBWFHYUta+5a1EVqNMauYcKLTNkZ1kBbcLB/KufNI=; b=328WtWy4MwB7yjyS1UjQZObH4T
	RQm8vchnz6MYV7USclKW0uqPNJdHQfFNL8c8RLfU61hDuk+LUN9IDnUHVZPTcpyFdm0JNMFdramyG
	6J8sGwPMyfbIfLUODIqnK6NcwZCfH4B0sBQ78PQUhVDYPTZTgJWbDHdJUdx4YdzpQTaUCRjy3SJO/
	V2HzqMzjat5N52r+tBEc7s53i12/cH8HSJQIoXMMtAUfWTdS1bw159P/zGFK4GNqrgU9gLKGTWy0x
	pVPZWAo/YCh895AGuQ+QCKPxXOS4lsoPEMspm/QwpqOp7ZRWLuLwVW+DXCsXLYOzICV0K5SEg0GRY
	DlfjCW8w==;
Received: from localhost ([::1]:43810 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hib0t-004pna-6q; Wed, 03 Jul 2019 08:53:15 +0000
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:55771 helo=ozlabs.org) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hib0o-004pnT-JD
 for samba-technical@lists.samba.org; Wed, 03 Jul 2019 08:53:13 +0000
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 45dvyS0Vk2z9s3Z;
 Wed,  3 Jul 2019 18:53:04 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=meltin.net; s=201810;
 t=1562143984; bh=tRPk1/DjcgmPEmN9QMyBNhOA4N9IaMGPfgAI2DPLOr4=;
 h=Date:From:To:Subject:In-Reply-To:References:From;
 b=jgXvXuX6vi1fBExku1t1unJZxohKREdWrXvLMa/9veQoJJJ6ktYTs4bCbAO46BHe1
 ATmae1tKGClosNoPXuYDBYm+Aim7r9yBE5RAKz++393BciGNICzcN3rF+wzluEhKAw
 lMKPv/nEuirRuwzP89HJbK4gUxdFJo94fnlyvoO0V62MqK+Bz/jbEE6hsI6Yrqsoq5
 FMyw8hp1UROg0z7I4nLfkdbNIYZki+gNDwALZGBIUgaCibYWZ6oReeMBBYTz8SXm/V
 yX3vfPZIEA4Szq7o8IZK225mfWLlh6zdBF/5Zt0y+RJ0qTmDAGb3Ryi7S9GvC0cdnX
 g0n8hawGD+JdA==
Date: Wed, 3 Jul 2019 18:53:02 +1000
To: Samba Technical <samba-technical@lists.samba.org>
Subject: Re: [PATCH] CTDB onnode simplifications
Message-ID: <20190703185302.00e2b627@martins.ozlabs.org>
In-Reply-To: <20190703184701.4f93d776@martins.ozlabs.org>
References: <20190703184701.4f93d776@martins.ozlabs.org>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="MP_/iskdQpZSXneg_fC2ad6kl3q"
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

--MP_/iskdQpZSXneg_fC2ad6kl3q
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Wed, 3 Jul 2019 18:47:01 +1000, Martin Schwenke <martin@meltin.net>
wrote:

> Simplify and drop output filtering in onnode.  This avoids onnode
> hanging in many circumstances when a backgrounded process has stdout
> open.
> 
> https://gitlab.com/samba-team/samba/merge_requests/606
> 
> Please review and maybe push...

New patch attached that also removed the documentation for the onnode
-o option.

peace & happiness,
martin

--MP_/iskdQpZSXneg_fC2ad6kl3q
Content-Type: text/x-patch
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=ctdb-onnode.patch

From e8498dbf7e98d1183205192c8f0b78c2a60a5290 Mon Sep 17 00:00:00 2001
From: Martin Schwenke <martin@meltin.net>
Date: Fri, 28 Jun 2019 15:43:27 +1000
Subject: [PATCH 1/3] ctdb-tools: Drop onnode -o option

I don't think anyone uses this and it causes complications.

Signed-off-by: Martin Schwenke <martin@meltin.net>
---
 ctdb/doc/onnode.1.xml | 9 ---------
 ctdb/tools/onnode     | 7 +------
 2 files changed, 1 insertion(+), 15 deletions(-)

diff --git a/ctdb/doc/onnode.1.xml b/ctdb/doc/onnode.1.xml
index c9d56a97dd5..f7da04aedbe 100644
--- a/ctdb/doc/onnode.1.xml
+++ b/ctdb/doc/onnode.1.xml
@@ -90,15 +90,6 @@
         </listitem>
       </varlistentry>
 
-      <varlistentry><term>-o <parameter>PREFIX</parameter></term>
-        <listitem>
-          <para>
-	    Causes standard output from each node to be saved into a
-	    file with name PREFIX.<replaceable>IP</replaceable>.
-	  </para>
-        </listitem>
-      </varlistentry>
-
       <varlistentry><term>-p</term>
         <listitem>
           <para>
diff --git a/ctdb/tools/onnode b/ctdb/tools/onnode
index 13b0d19b3ee..76cd2217a0d 100755
--- a/ctdb/tools/onnode
+++ b/ctdb/tools/onnode
@@ -34,7 +34,6 @@ Usage: onnode [OPTION] ... <NODES> <COMMAND> ...
     -f          Specify nodes file, overriding default.
     -i          Keep standard input open - the default is to close it.
     -n          Allow nodes to be specified by name.
-    -o <prefix> Save standard output from each node to file <prefix>.<ip>
     -p          Run command in parallel on specified nodes.
     -P          Push given files to nodes instead of running commands.
     -q          Do not print node addresses (overrides -v).
@@ -61,7 +60,6 @@ ctdb_nodes_file=""
 parallel=false
 verbose=false
 quiet=false
-prefix=""
 names_ok=false
 push=false
 stdin=false
@@ -79,7 +77,6 @@ parse_options ()
 		c) current=true ;;
 		f) ctdb_nodes_file="$OPTARG" ;;
 		n) names_ok=true ;;
-		o) prefix="$OPTARG" ;;
 		p) parallel=true ;;
 		q) quiet=true ;;
 		v) verbose=true ;;
@@ -274,9 +271,7 @@ push()
 
 stdout_filter ()
 {
-    if [ -n "$prefix" ] ; then
-	cat >"${prefix}.${n//\//_}"
-    elif $verbose && $parallel ; then
+    if $verbose && $parallel ; then
 	sed -e "s@^@[$n] @"
     else
 	cat
-- 
2.20.1


From 4bc47436d77aaf1e2e346d8b07899a9e035a8156 Mon Sep 17 00:00:00 2001
From: Martin Schwenke <martin@meltin.net>
Date: Fri, 28 Jun 2019 15:44:59 +1000
Subject: [PATCH 2/3] ctdb-tools: Drop no-op stdout-filter from non-parallel
 case

This filter no longer does anything useful in this context.  By
default it adds a pipeline with trailing cat process.  In many
contexts, stdout of the process being run is still open so the cat
process will stay around and will stop onnode from exiting.

The filters should all go away because they are simply an example of
code that is trying to be too clever while causing unfortunate corner
cases.

Signed-off-by: Martin Schwenke <martin@meltin.net>
---
 ctdb/tools/onnode | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/ctdb/tools/onnode b/ctdb/tools/onnode
index 76cd2217a0d..863b8b393c5 100755
--- a/ctdb/tools/onnode
+++ b/ctdb/tools/onnode
@@ -352,7 +352,7 @@ for n in $nodes ; do
 			echo >&2 ; echo ">> NODE: $n <<" >&2
 		fi
 		{
-			$ssh_cmd "$n" "$command" | stdout_filter
+			$ssh_cmd "$n" "$command"
 		} || retcode=$?
 	fi
 done
-- 
2.20.1


From 520b7d9a7bae3643179116e4a8bb9895a03a3fdf Mon Sep 17 00:00:00 2001
From: Martin Schwenke <martin@meltin.net>
Date: Fri, 28 Jun 2019 15:46:57 +1000
Subject: [PATCH 3/3] ctdb-tools: Drop separate parallel+verbose stdout/stderr
 filtering

This has been broken for 10 years since commit
9616959bd6938e4c5c3713fe986c1e17cbdc574c, which introduced the
separate filtering.  This commit was missing a redirect of the output
of stderr_filter() to stderr.

Since nobody depends on the separate filtering (i.e. nobody reported a
bug), just return to combining stdout and stderr, and filtering them
together.

Signed-off-by: Martin Schwenke <martin@meltin.net>
---
 ctdb/tools/onnode | 36 +++++-------------------------------
 1 file changed, 5 insertions(+), 31 deletions(-)

diff --git a/ctdb/tools/onnode b/ctdb/tools/onnode
index 863b8b393c5..e143ba2d4d4 100755
--- a/ctdb/tools/onnode
+++ b/ctdb/tools/onnode
@@ -269,24 +269,6 @@ push()
     done
 }
 
-stdout_filter ()
-{
-    if $verbose && $parallel ; then
-	sed -e "s@^@[$n] @"
-    else
-	cat
-    fi
-}
-
-stderr_filter ()
-{
-    if $verbose && $parallel ; then
-	sed -e "s@^@[$n] @"
-    else
-	cat
-    fi
-}
-
 ######################################################################
 
 parse_options "$@"
@@ -331,21 +313,13 @@ retcode=0
 for n in $nodes ; do
 	set -o pipefail 2>/dev/null
 
-	# The following code applies stdout_filter and stderr_filter to
-	# the relevant streams.  Both filters are at the end of pipes so
-	# they read from stdin and (by default) write to stdout.  To allow
-	# the filters to operate independently, the output of
-	# stdout_filter is sent to a temporary file descriptor (3), which
-	# is redirected back to stdout at the outermost level.
 	ssh_cmd="$ONNODE_SSH $ssh_opts $ONNODE_SSH_OPTS"
 	if $parallel ; then
-		{
-			exec 3>&1
-			{
-				$ssh_cmd "$n" "$command" 3>&- |
-					stdout_filter >&3
-			} 2>&1 | stderr_filter
-		} &
+		if $verbose ; then
+			$ssh_cmd "$n" "$command" 2>&1 | sed -e "s@^@[$n] @"
+		else
+			$ssh_cmd "$n" "$command"
+		fi &
 		pids="${pids} $!"
 	else
 		if $verbose ; then
-- 
2.20.1


--MP_/iskdQpZSXneg_fC2ad6kl3q--

