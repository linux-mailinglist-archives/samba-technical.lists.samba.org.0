Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id BBE3D33CD2
	for <lists+samba-technical@lfdr.de>; Tue,  4 Jun 2019 03:45:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=tJ/c7Uc5QAtD9Fs6zCBIRXhkyutiDmTmgfHgCGGMhI4=; b=NWHNHL24sN5tv6KE2iCXA1hrCA
	aOLmP60oytsXqczx/pez8WojBBd3TZGk3PBu/OnMVUkamuVE39AQh4EnPlofYZxs7mZA9lQmBT4tx
	jfCqdiSiN72hfH+NvwnNhYTR1VvmyYGMsCetO4Y086KnZi+K28OppVcki72lk+TqmLuyqUE1c7Cs0
	bCmQxc8q0NlCWEqC6VO3LAUPo5t6UJqliXItqz/aHBMaR/Gzc6XNSKsDJMQ7cnS+vymHhaLFn+i5U
	68xa3reIYPw1BSRPUJ65VONTGc6pSV5zn8zRL4NbrHB0z+3K4J5ITAh4GATfc1coT6wPd5mjtxHHl
	gt2+JVUg==;
Received: from localhost ([::1]:61790 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hXyUq-004yNL-7i; Tue, 04 Jun 2019 01:44:16 +0000
Received: from mail-qt1-f193.google.com ([209.85.160.193]:35173) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hXyUg-004yNE-Ra
 for samba-technical@lists.samba.org; Tue, 04 Jun 2019 01:44:09 +0000
Received: by mail-qt1-f193.google.com with SMTP id d23so11950042qto.2
 for <samba-technical@lists.samba.org>; Mon, 03 Jun 2019 18:44:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tJ/c7Uc5QAtD9Fs6zCBIRXhkyutiDmTmgfHgCGGMhI4=;
 b=tDsPeyTJ6c61GkE5YQvS/CVF1RUnqiiZDtglFCKIs3nVeNDbDuOUnx4dXzF0t6n0vI
 G3fdFva0vi2WFiiIMMS4K1+g9iyYBgsU6TGLwxKXMUKKtfZv9mMEBWvFTdd5oUprdMYq
 MSX80xSDtb1PtiqW9MUCipIvj3/bd4LgSfyeMmzCB6+m526/3Ev3OAuopOY3WXLeiGNL
 UiZhN32dDvGEHHXdc3ZkX1iWvZgNsYCM+899jMGfNVA5q8EzXXE/t6r4uAfOPSU+tEt1
 H57mKGJoyyBIDSdYvqtFBrKgADSNhySh8DNla3JxoFr/Iw7KteE7FWBj/MLpoUkuC2Fo
 +6ug==
X-Gm-Message-State: APjAAAWXorcl5KjRhdTLpn4PST0J0ogqEEyu/umh917jGTb6gqBZL5KQ
 aNGn9QO8KlFW2554tWmlIi9u/ob+flUyNBda
X-Google-Smtp-Source: APXvYqzFvGF/SxzMGcOz6/pnCrofVBSUDdkwNoo0FHYUj3b5AODQCnF8nj4WR564A7RlyCjOPGYKjg==
X-Received: by 2002:a0c:f6cc:: with SMTP id d12mr25271173qvo.73.1559612644608; 
 Mon, 03 Jun 2019 18:44:04 -0700 (PDT)
Received: from workstation.celeiro.br. ([191.177.181.81])
 by smtp.gmail.com with ESMTPSA id m40sm13626264qtm.2.2019.06.03.18.44.03
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 03 Jun 2019 18:44:04 -0700 (PDT)
To: samba-technical@lists.samba.org
Subject: [PATCH] ctdb-scripts: Fix ss syntax in update_tickles()
Date: Mon,  3 Jun 2019 22:44:00 -0300
Message-Id: <20190604014400.16289-1-rafaeldtinoco@ubuntu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
From: Rafael David Tinoco via samba-technical <samba-technical@lists.samba.org>
Reply-To: Rafael David Tinoco <rafaeldtinoco@ubuntu.com>
Cc: rafaeldtinoco@ubuntu.com
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

BUG: https://bugzilla.samba.org/show_bug.cgi?id=13985

During CTDB execution I got the following error:

ctdbd[1000]: Starting traverse on DB ctdb.tdb (id 806)
ctdbd[1000]: Ending traverse on DB ctdb.tdb (id 806), records 0
ctdb-eventd[1002]: 60.nfq: ss: bison bellows (while parsing filter): "syntax error!" Sorry.
ctdb-eventd[1002]: 60.nfs: Usage: ss [ OPTIONS ]
ctdb-eventd[1002]: 60.nfs:        ss [ OPTIONS ] [ FILTER ]
ctdb-eventd[1002]: 60.nfs:    -V, --version       output version information

Debug in /etc/ctdb/functions showed:

60.nfs: + _port=2049
60.nfs: + tickledir=/var/lib/ctdb/scripts/tickles
60.nfs: + mkdir -p /var/lib/ctdb/scripts/tickles
60.nfs: + ctdb_get_pnn
60.nfs: + _pnn_file=/var/lib/ctdb/scripts/my-pnn
60.nfs: + [ ! -f /var/lib/ctdb/scripts/my-pnn ]
60.nfs: + cat /var/lib/ctdb/scripts/my-pnn
60.nfs: + _pnn=0
60.nfs: + /usr/bin/ctdb -X ip
60.nfs: + awk -F| -v pnn=0 $3 == pnn {print $2}it
60.nfs: + _ips=172.16.17.3
60.nfs: + _ip_filter=
60.nfs: + _ip_filter=src [172.16.17.3]
60.nfs: + _port_filter=sport == :2049
60.nfs: + _my_connections=/var/lib/ctdb/scripts/tickles/2049.connections.12623
60.nfs: + ss -tn state established ( src [172.16.17.3] ) ( sport == :2049 )

ss syntax is wrong in update_tickles().

Instead of:

ss -tn state established ( src [172.16.17.3] ) ( sport == :2049 )

Obtained in debug mode, we should have something like:

ss -tn state established '( src [172.16.17.3] ) && sport == :2049'

or

ss -tn state established '( src [172.16.17.2] || src [172.16.17.3] ) \
    && sport == :2049'

depending on the number of _ips obtained from "ctdb -X ip command".

This script fixes the issue.

Signed-off-by: Rafael David Tinoco <rafaeldtinoco@ubuntu.com>
---
 ctdb/config/functions | 27 ++++++++++++++++-----------
 1 file changed, 16 insertions(+), 11 deletions(-)

diff --git a/ctdb/config/functions b/ctdb/config/functions
index 1dc16532890..8c4dae6097d 100755
--- a/ctdb/config/functions
+++ b/ctdb/config/functions
@@ -956,6 +956,10 @@ update_tickles ()
 {
 	_port="$1"
 
+	if [ "$_port" = "" ]; then
+		return 0;
+	fi
+
 	tickledir="${CTDB_SCRIPT_VARDIR}/tickles"
 	mkdir -p "$tickledir"
 
@@ -964,24 +968,25 @@ update_tickles ()
 	_ips=$($CTDB -X ip | awk -F'|' -v pnn="$_pnn" '$3 == pnn {print $2}')
 
 	# IPs and port as ss filters
-	_ip_filter=""
-	for _ip in $_ips ; do
-	    _ip_filter="${_ip_filter}${_ip_filter:+ || }src [${_ip}]"
-	done
+
+	_ip_filter=$(for _ip in $_ips; do echo " src [$_ip] |" ; done | xargs)
+	_ip_filter=$(echo $_ip_filter | sed 's: |$::g')
+
+	if [ "$_ip_filter" = "" ]; then
+		return 0;
+	fi
+
 	_port_filter="sport == :${_port}"
 
 	# Record connections to our public IPs in a temporary file.
 	# This temporary file is in CTDB's private state directory and
 	# $$ is used to avoid a very rare race involving CTDB's script
 	# debugging.  No security issue, nothing to see here...
+
 	_my_connections="${tickledir}/${_port}.connections.$$"
-	# Parentheses are needed around the filters for precedence but
-	# the parentheses can't be empty!
-	ss -tn state established \
-	   "${_ip_filter:+( ${_ip_filter} )}" \
-	   "${_port_filter:+( ${_port_filter} )}" |
-	awk 'NR > 1 {print $4, $3}' |
-	sort >"$_my_connections"
+
+	ss -tn state established "( $_ip_filter ) && $_port_filter" | \
+		awk 'NR > 1 {print $4, $3}' | sort >"$_my_connections"
 
 	# Record our current tickles in a temporary file
 	_my_tickles="${tickledir}/${_port}.tickles.$$"
-- 
2.20.1


