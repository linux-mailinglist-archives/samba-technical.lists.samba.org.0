Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 388F9326B7
	for <lists+samba-technical@lfdr.de>; Mon,  3 Jun 2019 04:45:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=kDBnDfyI5WIHnQUqmCH8AHuiBCqbB5E3y7zjiQd3Ylw=; b=USgiEONWyDuWh66AbJRrJf1pYC
	pILUQL+JVNxRcgX/yN9LCAlLG/En2//nNW1lq/pDnfIrt2DC0TZ2LT0fAsT1MR5Ve3Wa0tx40Zyis
	Zm5FxsG+VB2I62QY17bv6KSMggn67QxNLmk36vBUKRg9lCTHjgYpGBH5QvZidd2rtvVBo/G8Wgj9P
	8/pnGoZ7hkn2mkd4IrcEhXOrkN1qKBMadJxHu9joRCDV5gpU4PKYJW89/RU/hdichMhkSaBbifswM
	EKfCYfd1t9a/VJ8Jr/3YNjQGOxutHXLNMDL5PDJ3NQo83VBOFjAno5n8fWp4fXlHajDB1ZHop1r/8
	8vit/48Q==;
Received: from localhost ([::1]:58404 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hXcxU-004iOL-Hd; Mon, 03 Jun 2019 02:44:24 +0000
Received: from mail-qt1-f194.google.com ([209.85.160.194]:33298) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hXcxQ-004iOE-8t
 for samba-technical@lists.samba.org; Mon, 03 Jun 2019 02:44:22 +0000
Received: by mail-qt1-f194.google.com with SMTP id 14so7770036qtf.0
 for <samba-technical@lists.samba.org>; Sun, 02 Jun 2019 19:44:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kDBnDfyI5WIHnQUqmCH8AHuiBCqbB5E3y7zjiQd3Ylw=;
 b=dNe/z6LaoZuy1iOzxwbACa6NEPPcdXprVLnI8WKdCOqKO0R4Mn46pFIYZFk9dzVaEA
 0SY92XxYp2pzcZSAjV4A+ZPBLGnIZRutLUSgB7KcotKxw69f67jlQ5c8XHpd8Ixl6NF0
 0OL6jOXZ3F6ZOBxcx50ViKrBgJRJFCHOSIAWrJ13lgcd7iGKy5ZXctSw489QoabFFNwJ
 ptJWnH6ZOqpM6Gjr6GUaD/G0cwsuJftpvBSN8uCamb04GzGN3KU2iwLiTVkBfCvH6mYN
 EnZQRW1daw19JZCoNg7Ih1H3zYSY1t68+ghy3GDsliNcroLbXUZQ1NCGaQ6cy0mluZ5c
 azXw==
X-Gm-Message-State: APjAAAWIWnPC6nEiFdiyQVHBkXz98Lff+kPhmLkMzcjCqY+hXGF9RCZi
 xuFYJv/98b5cK8f0btzcKmc6IUriUAqYjgLb
X-Google-Smtp-Source: APXvYqzbWSnjn77i9C3t1x6vC5ydCrTA0GwocN3q+OSUkrxDsfyDXd9fjyru8iYltnKhyQqQ0fWnSA==
X-Received: by 2002:ac8:2bbb:: with SMTP id m56mr20923071qtm.298.1559529858648; 
 Sun, 02 Jun 2019 19:44:18 -0700 (PDT)
Received: from workstation.celeiro.br. ([191.177.181.81])
 by smtp.gmail.com with ESMTPSA id c192sm102894qkg.33.2019.06.02.19.44.17
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sun, 02 Jun 2019 19:44:18 -0700 (PDT)
To: samba-technical@lists.samba.org
Subject: [PATCH] ctdb-scripts: Fix tcp_tw_recycle existence check
Date: Sun,  2 Jun 2019 23:44:15 -0300
Message-Id: <20190603024415.9581-1-rafaeldtinoco@ubuntu.com>
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

net.ipv4.tcp_tw_recycle has been removed from Linux 4.12 but, still,
makes sense to check its existence. Unfortunately, current check does
not test for the procfs file existence. This commit fixes the issue.

Signed-off-by: Rafael David Tinoco <rafaeldtinoco@ubuntu.com>
---
 ctdb/config/nfs-linux-kernel-callout | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/ctdb/config/nfs-linux-kernel-callout b/ctdb/config/nfs-linux-kernel-callout
index def69a04649..71d8ecf8074 100755
--- a/ctdb/config/nfs-linux-kernel-callout
+++ b/ctdb/config/nfs-linux-kernel-callout
@@ -281,8 +281,8 @@ nfs_startup ()
     basic_stop "nfs" || true
     basic_start "nfs"
     _f="${PROCFS_PATH}/sys/net/ipv4/tcp_tw_recycle"
-    if [ "$_f" ] ; then
-	echo 1 >"$_f"
+    if [ -f "$_f" ] ; then
+	    echo 1 >"$_f"
     fi
 }
 
-- 
2.20.1


