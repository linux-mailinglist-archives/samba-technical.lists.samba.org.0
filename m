Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 423058C9F9
	for <lists+samba-technical@lfdr.de>; Wed, 14 Aug 2019 05:55:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=/9PSe5lUv0P1ao2fw2Ob/5iKB+gdIg5a7kQNflVyV6M=; b=3DgL67KNmhhxTJAXIHqgegC2p8
	EsATOegM0SmmjDnps7xUlGGB80GuJNkH6FEyftcMC1zcQiekYzlBk1ebUtSYYaY2VgAlmyAX71hwg
	iBRAp2pN7H87cgGvHZ7FNttITdZytLpdyyeB0UcD1lGepBOEPFNiZSwwLYG306I1guxUbo7tGGnS5
	/FZdz6+dFrpasyDi766uvGZvT0xs+Ga52DV+K8uZHXY6yyPgwD4Nc6tJgEBsTSFCpoMGRzW0y0O8f
	RhM/kn+6jeUyTk0eXVuIAepDoaeWfJiTxC+jqFpKrdEAM8OiWTOpGurdQLTXTYDWuO9O13+BrpoM5
	lb1Vecqg==;
Received: from localhost ([::1]:37480 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hxkNj-006Dn8-Fm; Wed, 14 Aug 2019 03:55:27 +0000
Received: from bilbo.ozlabs.org ([203.11.71.1]:48909 helo=ozlabs.org) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hxkNe-006Dmx-91
 for samba-technical@lists.samba.org; Wed, 14 Aug 2019 03:55:24 +0000
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 467bMR735wz9sML;
 Wed, 14 Aug 2019 13:55:15 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=meltin.net; s=201810;
 t=1565754916; bh=4qzblhWlX8Y2dH6+rSKhrMOTe75fFYMzKpN5RN+u4Zk=;
 h=Date:From:To:Subject:From;
 b=M/Ur72dWsPYPNYpH2h81MbbnDKZw184jv7N6R1dCkpBek7VFiZuLRfk6TJJVCHxop
 JvJpZLjFHEq5XYK5IUhgpcBfVjv0tUwR+7FWEHB3PjwZZES30jSL53M2BdyZmu17je
 4ppT/C8JPB4fxXACO2PtVioRF1VkpoI7gXvGgBdzFX++3KloYZxzW/sLzb8FhwSVfo
 kCrh/SQw9Io0Q4NLNuW4jXIx4pUx9p2ImZ6AbphJY/Mbe+1PtXoJ1j/pPvLEzIM/Tv
 Wiu6Nauf8tu0JvsUcJDxXnFN2EfNDHWiZbTa73p1w2xMf8+t55HEorGzLpPatIjTa+
 mt0+03kL/lE7g==
Date: Wed, 14 Aug 2019 13:55:14 +1000
To: Samba Technical <samba-technical@lists.samba.org>
Subject: [PATCH] ctdb-tools: Drop 'o' option from getopts command (bug 14086)
Message-ID: <20190814135514.2fa64996@martins.ozlabs.org>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="MP_/CoXz8d2qGPeg+qwgbC8vU0i"
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

--MP_/CoXz8d2qGPeg+qwgbC8vU0i
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Fix for:

  https://bugzilla.samba.org/show_bug.cgi?id=14086

Included in pipeline:

  https://gitlab.com/samba-team/devel/samba/pipelines/76265339

Please review and maybe push...

peace & happiness,
martin

--MP_/CoXz8d2qGPeg+qwgbC8vU0i
Content-Type: text/x-patch
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename=0001-ctdb-tools-Drop-o-option-from-getopts-command.patch

From 2b56fcfb55577e81305f94deac884200c9e80758 Mon Sep 17 00:00:00 2001
From: Martin Schwenke <martin@meltin.net>
Date: Mon, 12 Aug 2019 16:11:13 +1000
Subject: [PATCH] ctdb-tools: Drop 'o' option from getopts command

Commit 90de5e0594b9180226b9a13293afe31f18576b3d remove the processing
for this option but forgot to remove it from the getopts command.

Versions of ShellCheck >= 0.4.7 warn on this, so it is worth fixing.

BUG: https://bugzilla.samba.org/show_bug.cgi?id=14086
RN: Fix onnode test failure with ShellCheck >= 0.4.7
Signed-off-by: Martin Schwenke <martin@meltin.net>
---
 ctdb/tools/onnode | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/ctdb/tools/onnode b/ctdb/tools/onnode
index e143ba2d4d4..d6595fff4aa 100755
--- a/ctdb/tools/onnode
+++ b/ctdb/tools/onnode
@@ -72,7 +72,7 @@ parse_options ()
 {
 	local opt
 
-	while getopts "cf:hno:pqvPi?" opt ; do
+	while getopts "cf:hnpqvPi?" opt ; do
 		case "$opt" in
 		c) current=true ;;
 		f) ctdb_nodes_file="$OPTARG" ;;
-- 
2.20.1


--MP_/CoXz8d2qGPeg+qwgbC8vU0i--

