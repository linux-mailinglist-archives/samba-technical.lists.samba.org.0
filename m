Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id CF0A132FDC
	for <lists+samba-technical@lfdr.de>; Mon,  3 Jun 2019 14:41:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=7s8VtmwvF8IzHctRyD302/Z0jhJK/pHUEGomiGrt3r8=; b=3S1i6nbW4Z1NnQ7eCNe44Nw1xG
	E9AvtWFVpdwPAHeCGW/EKdByCOzYTCOzmMy0Gy0Y8Qwk8YHfNabma2fO1dI3E3ZY+CVXOIcdHfQSk
	9oBybd81QOuBXDBesIszqtl7PdvLH8mcAX3IqO8dW6bAczinNadiP2+YTa8zjMBK7pHmsICwDgvtX
	ed5iCTLt2sdM1CtMYVjc+e9cRo8qa9nnSEa6+R6OGGr9KeQdSJdmEE91Xg1b0qSo+T+VWkUXX8O6C
	lTWTI177pOVFF9JwIe7vMj9p6vU9nwAcOYAhJAf/fcfZszBHpOahpE4ZAI5+ubHxecYnWwH97pZTG
	7dTOm5Cw==;
Received: from localhost ([::1]:56370 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hXmGG-004pjN-Ad; Mon, 03 Jun 2019 12:40:24 +0000
Received: from mail-qt1-f193.google.com ([209.85.160.193]:35987) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hXmGC-004pjG-FS
 for samba-technical@lists.samba.org; Mon, 03 Jun 2019 12:40:22 +0000
Received: by mail-qt1-f193.google.com with SMTP id u12so9121939qth.3
 for <samba-technical@lists.samba.org>; Mon, 03 Jun 2019 05:40:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7s8VtmwvF8IzHctRyD302/Z0jhJK/pHUEGomiGrt3r8=;
 b=qccG3BhWuRZk1ZbX2wH58Qg6BRsQHyltT+25OnqvvBfbDMLVPs+x7R9wq/k0gUaf0e
 B48r4O2x2rwz9VbINAZAHdJJpeyzmMSye2pKdt6HZe01H0tfB1uw14zXQyKgSrKG1lNU
 478EWlqo0nP2Kt2sO6QcQBNexlFy7ALwWpMRxKBxJoCQHLG7/c2S7GMG216xb6ht5bEd
 TYfMDc0jInZtpo3GAhHhq7+EReb+zh18U4M/3U/+7WvxsI1ILKhgKNh5JXv4L5MvF0d6
 ho5Pi+zsQpWJRUpmGXfrU4HzgnnbQvHgsBoJeBQl6IzLxqiZ7uwX5SXSf7g4MVEp1Lba
 LtEw==
X-Gm-Message-State: APjAAAXllV1RTMLRwhF0Ohi6r46oY2u1R2IlcIuGcUtm6tK2WZyfJ45j
 Xa8BzELCOOYCCJ7S4oywoA7sJlefysYA3l0r
X-Google-Smtp-Source: APXvYqwxNikQyzF/rORQU7pV2Zy6xspHTOjEjNDGgQvw3fkJCpBq50rYKCsYv4OPxFt8EwMzrtVViw==
X-Received: by 2002:a0c:88c3:: with SMTP id 3mr3088553qvo.21.1559565618503;
 Mon, 03 Jun 2019 05:40:18 -0700 (PDT)
Received: from workstation.celeiro.br. ([191.177.181.81])
 by smtp.gmail.com with ESMTPSA id t197sm2972177qke.2.2019.06.03.05.40.17
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 03 Jun 2019 05:40:18 -0700 (PDT)
To: samba-technical@lists.samba.org
Subject: [PATCH v2] ctdb-scripts: Fix tcp_tw_recycle existence check
Date: Mon,  3 Jun 2019 09:40:14 -0300
Message-Id: <20190603124014.21226-1-rafaeldtinoco@ubuntu.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <2ff36d47-49fb-30b3-f953-53b6364a5949@rsmas.miami.edu>
References: <2ff36d47-49fb-30b3-f953-53b6364a5949@rsmas.miami.edu>
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
 ctdb/config/nfs-linux-kernel-callout | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/ctdb/config/nfs-linux-kernel-callout b/ctdb/config/nfs-linux-kernel-callout
index def69a04649..5625eddf6e2 100755
--- a/ctdb/config/nfs-linux-kernel-callout
+++ b/ctdb/config/nfs-linux-kernel-callout
@@ -280,10 +280,12 @@ nfs_startup ()
 {
     basic_stop "nfs" || true
     basic_start "nfs"
+
+    [ "${PROCFS_PATH}" ] || return 0
+
     _f="${PROCFS_PATH}/sys/net/ipv4/tcp_tw_recycle"
-    if [ "$_f" ] ; then
-	echo 1 >"$_f"
-    fi
+
+    [ -f "$_f" ] && echo 1 > "$_f"
 }
 
 ##################################################
-- 
2.20.1


