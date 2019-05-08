Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::443:1])
	by mail.lfdr.de (Postfix) with ESMTPS id 135BC16EA8
	for <lists+samba-technical@lfdr.de>; Wed,  8 May 2019 03:35:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=v+uwbUQ2bCvinT9OjtMqXMFX8MjugAru4Cey18hLHsE=; b=Fr0ycRX6ZSGfS4NYiH+h4kH7L2
	E4xnVmuaiN8PyOO4hzifA27lEvhaoElweUb+Z4g2yAfmPmI2JkuJ4tJ3WPwIt+wd10MpMtqxd0w1e
	hrycX7QsMTgr1LPT00m2oaYAxvUhJBIQlyt/UsD4wN8bzdSmUFMGk25FGS/qz1CMTTn3Y/pJ3SsSO
	CdGxpNZVbiYmcgbok/295BT1yQqnCo7d+/9jCGtNHCCY6lbOmpUSG/mBV//dDkgA7S96y/BAnQ98c
	BJzUnvnm0X7/ofqGPjwP4CQ84DtopJ7sdj8Ef9kR2Hdaah7q7zGNcfPNGCwN4zb97luzJQ1wFZFV3
	P4YbgQPA==;
Received: from localhost ([::1]:54908 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hOBUT-002xiB-Rz; Wed, 08 May 2019 01:35:26 +0000
Received: from ozlabs.org ([203.11.71.1]:59051) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hOBU9-002xd0-AO
 for samba-technical@lists.samba.org; Wed, 08 May 2019 01:35:09 +0000
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 44zJtp2PD5z9s3l;
 Wed,  8 May 2019 11:34:58 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=meltin.net; s=201810;
 t=1557279298; bh=lWM3v41k5s8ohMbuKUZTkwOq9wjAMCxKlhpCDdPbFQI=;
 h=Date:From:To:Subject:From;
 b=a8y2hkCoGmtB5azLSW3jEZ3NOT9tAUEufytfSHIyKlMWSZEANMMaQ8j/PelxP5WYT
 WJWUiPx1OSpJKeWTHNxt5/Yju+LbxcPfhgqOsAC8IF1nQBuQJduvd9YruSwTtxTzy3
 JbP0G5O1bJiOqHo5SDrMDYkeLSMZPu5B+fMXs+/PD0krFVXMY1ZChhbzhxC2Lvu8E0
 pphCfbvyd2olE7nHAU2AzjlasIxC3f7p8TGmMvwkp+ibjtqrydZHyS+pM6iGGWIt1/
 kzwkSFbnqUFdnAl0Gus77DVwiTMsd0o8s3i2tqJDsAbmf8f650iADFrfBmZbVbSOIM
 ZPvp35OgcIs0g==
Date: Wed, 8 May 2019 11:34:56 +1000
To: Samba Technical <samba-technical@lists.samba.org>
Subject: [PATCH] ctdb-tests: Add dump-logs command for local daemons
Message-ID: <20190508113456.2540f112@martins.ozlabs.org>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="MP_/8nTLGqiZwOqo/h8kr6Mr/YO"
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

--MP_/8nTLGqiZwOqo/h8kr6Mr/YO
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Dump a single merged log to stdout.

Very useful for helping to debug local daemons test failures.  rsync
ctdb/tests/var/simple from sn-devel, run this against it to see what
was happening on all nodes.  :-)

Pipeline: https://gitlab.com/samba-team/devel/samba/pipelines/60261138
(just started)

Please review and maybe push...

peace & happiness,
martin

--MP_/8nTLGqiZwOqo/h8kr6Mr/YO
Content-Type: text/x-patch
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename=0001-ctdb-tests-Add-dump-logs-command-for-local-daemons.patch

From f8a4b9cfe7156f3b6edca5c351aebd38481ac75a Mon Sep 17 00:00:00 2001
From: Martin Schwenke <martin@meltin.net>
Date: Sun, 5 May 2019 12:31:41 +1000
Subject: [PATCH] ctdb-tests: Add dump-logs command for local daemons

Dump a single merged log to stdout.

Signed-off-by: Martin Schwenke <martin@meltin.net>
---
 ctdb/tests/local_daemons.sh | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/ctdb/tests/local_daemons.sh b/ctdb/tests/local_daemons.sh
index 3c3897feb50..8fbef1922b9 100755
--- a/ctdb/tests/local_daemons.sh
+++ b/ctdb/tests/local_daemons.sh
@@ -399,6 +399,31 @@ local_daemons_print_socket ()
 	onnode -q "$_nodes" "${VALGRIND:-} ${_path} socket ctdbd"
 }
 
+local_daemons_dump_logs ()
+{
+	if [ $# -ne 1 ] || [ "$1" = "-h" ] ; then
+		local_daemons_generic_usage "dump-logs"
+	fi
+
+	_nodes="$1"
+	shift
+
+	onnode_common
+
+	# shellcheck disable=SC2016
+	# $CTDB_BASE must only be expanded under onnode, not in top-level shell
+	onnode -q "$_nodes" 'echo ${CTDB_BASE}/log.ctdb' |
+	while IFS='' read -r _l ; do
+		_dir=$(dirname "$_l")
+		_node=$(basename "$_dir")
+		# Add fake hostname after date and time, which are the
+		# first 2 words on each line
+		sed -e "s|^\\([^ ][^ ]* [^ ][^ ]*\\)|\\1 ${_node}|" "$_l"
+	done |
+	sort
+
+}
+
 usage ()
 {
 	cat <<EOF
@@ -410,6 +435,7 @@ Commands:
   stop           Stop specified daemon(s)
   onnode         Run a command in the environment of specified daemon(s)
   print-socket   Print the Unix domain socket used by specified daemon(s)
+  dump-logs      Dump logs for specified daemon(s) to stdout
 
 All commands use <directory> for daemon configuration
 
@@ -434,5 +460,6 @@ start) local_daemons_start "$@" ;;
 stop) local_daemons_stop "$@" ;;
 onnode) local_daemons_onnode "$@" ;;
 print-socket) local_daemons_print_socket "$@" ;;
+dump-logs) local_daemons_dump_logs "$@" ;;
 *) usage ;;
 esac
-- 
2.20.1


--MP_/8nTLGqiZwOqo/h8kr6Mr/YO--

