Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CE055FFF6
	for <lists+samba-technical@lfdr.de>; Fri,  5 Jul 2019 06:14:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=iv1cNkYaHoUBYuQihRVDySZDdo/13p3PhTkc2diMe+c=; b=HYqFfGdFwdrzLvEzVKqJ+HIeDR
	vwl/46bY4HolFA+ZCv2jXu3s3pVqTwg+fDCQoDoir58rK4D9BJgK8w4S8GVcXwqfWx6F4KeawMhr8
	Mz2GN6koQgFF02cWN9KO9tp5VEx7G7TYt+5iEWJdoxvWN1AO8wS9ZrdRwq4bFUTKxh9jiV8leaFSS
	W1T9VDoI80+JJbDKg7kqPMPS36ZY0as0v7mApFJR1rLwBux2KBWip1Rich6xFYmlGDQT6Ec52c2zF
	2MtXxd7Gs37a/7a2HKMY2/HgkNEfJduUQBKKZHmBPLKJCDW5cBUhq5gyT+ChX1CHICxaHT5pWDt+4
	A1LMDLRA==;
Received: from localhost ([::1]:22174 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hjFcX-005HPm-9Q; Fri, 05 Jul 2019 04:14:49 +0000
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:43987 helo=ozlabs.org) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hjFcR-005HPf-QN
 for samba-technical@lists.samba.org; Fri, 05 Jul 2019 04:14:46 +0000
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 45g1hF30Sqz9sNs;
 Fri,  5 Jul 2019 14:14:37 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=meltin.net; s=201810;
 t=1562300077; bh=DpQhRIprmgMBIJWDHtBSSe8dP2snbIvvoUm3UHfLxb0=;
 h=Date:From:To:Subject:From;
 b=evKeJWjNxAdfaHKFldxox0DoHuRbYZHoQHA4utjFGIb7n7y/5IkEAnfsl3BGhb//a
 Vf1qRrPArZJgQvKn+p1TWH+G7ZAmrUKZzAEW9PvnFfH7GNf+ehq3w8D/oX5efSy1r1
 ytesriRDx386LV7q0mygZbA+p93u+7mf+kjoOcfYeXmgdYyIcMhPJENuHXORKKZuhQ
 +y44DiAnLfbZJ19MIZ7mHXBaWyCo4u8ZJSEEo6JXWVfkmxY6f7bUhtWeWVw+C/qvSD
 8lO1TkNA2EPLi8Z2nC1uas0V/mqw3b9/fTcwZ1qOky5qdKvhw3VWRee5AUpBQ4ITjG
 ZWdSYBm/49eQg==
Date: Fri, 5 Jul 2019 14:14:36 +1000
To: Samba Technical <samba-technical@lists.samba.org>
Subject: [PATCH] WHATSNEW: Add CTDB updates for 4.11
Message-ID: <20190705141436.6dada72f@martins.ozlabs.org>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="MP_/8yoRg0RiyEyNXM97b/gba34"
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

--MP_/8yoRg0RiyEyNXM97b/gba34
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Please review and maybe push...

peace & happiness,
martin

--MP_/8yoRg0RiyEyNXM97b/gba34
Content-Type: text/x-patch
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename=0001-WHATSNEW-Add-CTDB-updates-for-4.11.patch

From 024820d4489f034500acff8ecfe40e073d6f56bf Mon Sep 17 00:00:00 2001
From: Martin Schwenke <martin@meltin.net>
Date: Thu, 27 Jun 2019 20:41:57 +1000
Subject: [PATCH] WHATSNEW: Add CTDB updates for 4.11

Signed-off-by: Martin Schwenke <martin@meltin.net>
---
 WHATSNEW.txt | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/WHATSNEW.txt b/WHATSNEW.txt
index 286798cc289..0e74db7f12b 100644
--- a/WHATSNEW.txt
+++ b/WHATSNEW.txt
@@ -198,6 +198,30 @@ Improvements have been made to Samba's handling of subtree renames,
 for example of containers and organisational units, however large
 renames are still not recommended.
 
+CTDB changes
+------------
+
+* nfs-linux-kernel-callout now defaults to using systemd service names
+
+  The Red Hat service names continue to be the default.
+
+  Other distributions should patch this file when packaging it.
+
+* The onnode -o option has been removed
+
+* ctdbd logs when it is using more than 90% of a CPU thread
+
+  ctdbd is single threaded, so can become saturated if it uses the
+  full capacity of a CPU thread.  To help detect this situation, ctdbd
+  now logs messages when CPU utilisation exceeds 90%.  Each change in
+  CPU utilisation over 90% is logged.  A message is also logged when
+  CPU utilisation drops below the 90% threshold.
+
+* Script configuration variable CTDB_MONITOR_SWAP_USAGE has been removed
+
+  05.system.script now monitors total memory (i.e. physical memory +
+  swap) utilisation using the existing CTDB_MONITOR_MEMORY_USAGE
+  script configuration variable.
 
 
 REMOVED FEATURES
-- 
2.20.1


--MP_/8yoRg0RiyEyNXM97b/gba34--

