Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 0287B5CD8F
	for <lists+samba-technical@lfdr.de>; Tue,  2 Jul 2019 12:28:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=0Dhv4CLLd+W8c6Djie1Nz3l7ERd4uKg6BKjpFGNHiFM=; b=DpTxYjxV29TsK7gCcTzBlCZKTh
	II7Kbv1FYzoY6GKRWbwWT7X1HhojREsPXV2WRltagfTL9XY9YBC7HR8yUypTXlCLySWvpi2N652+q
	MkQ/C875RusTxqy2UuCuREw010Mrukhaz84RKBZdtJVmhbQ17HATch9PvMGGtCquIbmHm+FdprUqJ
	CFxF6pj2LX21d6bpw5CwqDc6lYq25nIqP10FwjG/ThgIUJigt9sXjPG/S3QYgAfa6evOmz+F854Z6
	JCDSKbtnYjouz4wzIkmD3JYrR+MyeEzUCkddsPSf2SlqVZoq70uVIkmLWmIsXxD3a1C1ojMT/nDz8
	OnyuGvvw==;
Received: from localhost ([::1]:37508 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hiG1e-004Spd-P7; Tue, 02 Jul 2019 10:28:38 +0000
Received: from ozlabs.org ([2401:3900:2:1::2]:42623) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hiG1Z-004SmO-EU
 for samba-technical@lists.samba.org; Tue, 02 Jul 2019 10:28:35 +0000
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 45dL6x2ZPBz9s4Y;
 Tue,  2 Jul 2019 20:28:25 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=meltin.net; s=201810;
 t=1562063305; bh=QIdaWjHL3tr6oRhstO+vUIOAKrW0hMCgSl0jOx9WzcI=;
 h=Date:From:To:Subject:From;
 b=SUR2MCtk9XU0nyY+4V9x1IDtmyQBo/k6+ISStyYDQDt0cMQpvE6QTgsKJmNQl0Ius
 4iknZ/8YzbB/C1Los60lVYEs3GokCdtX4F5COe+S/BsDnqUJa86629GaT/s/m5ql3/
 XNG8IVaaJrU/KvZkNbGFNgmqR36SJ6OmhhiqFWiTbtfhQ0T+hMwEAS4JDxZTekUf0o
 McHC2VQr9kI8b5zUA3lUQ0HECtIIWKjgoGP2gjFPGWPULNjVwyLfJZJXozRifWAOY2
 Zs5pCEVkpGoJosc7QSF1Wls/EzAKTA2vDA75eEBxZzRTndskAM9rceLNAvPxnoIWIU
 gCm3dn3h/K2bA==
Date: Tue, 2 Jul 2019 20:28:23 +1000
To: Samba Technical <samba-technical@lists.samba.org>
Subject: [PATCH] ctdb-tests: Rename local-daemon.sh dump-logs to print-log
Message-ID: <20190702202823.2135cbb4@martins.ozlabs.org>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="MP_/CA_JCJnJUFjBYgGSx0GTNgY"
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

--MP_/CA_JCJnJUFjBYgGSx0GTNgY
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

This makes it consistent with print-socket.

Please review and maybe push...

peace & happiness,
martin

--MP_/CA_JCJnJUFjBYgGSx0GTNgY
Content-Type: text/x-patch
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename=0001-ctdb-tests-Rename-local-daemon.sh-dump-logs-to-print.patch

From 2ff2af5d25b81371c84a46966d41f4d7cec73d09 Mon Sep 17 00:00:00 2001
From: Martin Schwenke <martin@meltin.net>
Date: Mon, 1 Jul 2019 07:04:19 +1000
Subject: [PATCH] ctdb-tests: Rename local-daemon.sh dump-logs to print-log

This makes it consistent with print-socket.

Signed-off-by: Martin Schwenke <martin@meltin.net>
---
 ctdb/tests/local_daemons.sh | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/ctdb/tests/local_daemons.sh b/ctdb/tests/local_daemons.sh
index 58a762b426d..d9bbc5dfbea 100755
--- a/ctdb/tests/local_daemons.sh
+++ b/ctdb/tests/local_daemons.sh
@@ -400,10 +400,10 @@ local_daemons_print_socket ()
 	onnode -q "$_nodes" "${VALGRIND:-} ${_path} socket ctdbd"
 }
 
-local_daemons_dump_logs ()
+local_daemons_print_log ()
 {
 	if [ $# -ne 1 ] || [ "$1" = "-h" ] ; then
-		local_daemons_generic_usage "dump-logs"
+		local_daemons_generic_usage "print-log"
 	fi
 
 	_nodes="$1"
@@ -436,7 +436,7 @@ Commands:
   stop           Stop specified daemon(s)
   onnode         Run a command in the environment of specified daemon(s)
   print-socket   Print the Unix domain socket used by specified daemon(s)
-  dump-logs      Dump logs for specified daemon(s) to stdout
+  print-log      Print logs for specified daemon(s) to stdout
 
 All commands use <directory> for daemon configuration
 
@@ -461,6 +461,6 @@ start) local_daemons_start "$@" ;;
 stop) local_daemons_stop "$@" ;;
 onnode) local_daemons_onnode "$@" ;;
 print-socket) local_daemons_print_socket "$@" ;;
-dump-logs) local_daemons_dump_logs "$@" ;;
+print-log) local_daemons_print_log "$@" ;;
 *) usage ;;
 esac
-- 
2.20.1


--MP_/CA_JCJnJUFjBYgGSx0GTNgY--

