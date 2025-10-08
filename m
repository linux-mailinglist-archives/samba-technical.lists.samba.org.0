Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A23CBC6A6B
	for <lists+samba-technical@lfdr.de>; Wed, 08 Oct 2025 23:12:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=c1zwuKXDRN03fpPivBseovANqBDd/bmcEz/rdg8SJ5o=; b=yNcggBl9UqYVUHaqsJuEX9PX7x
	wPJZWTCvmuyxo6/dGXKpA9m2YMcm3VG3BvolVnrzif59F/9kF4Irh6VNpYpWMaCQq3RwiDaVncP7K
	8/fQOaR0BF0BPgSTHkezoSIIaxMFc9DnFYx2mLveUBtuBh524kMt2+4NIU3BmLjjVNKFED9590bcy
	Md1O3cCNImAg3eRNrQUMWO/28ceG9STzyr1g60cWWknWNjGlGVORAM2xQ0cutLlW1s64QSIxKtCsO
	4zSK3IKXZa2r/+a48UNpmWSXPzK+cHr4P+5LzoVTsicuo9fqjKdknjipSIBLk7YLUvJKldl45VfMB
	UHWZHLGg==;
Received: from ip6-localhost ([::1]:43190 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1v6bSO-007KDp-IK; Wed, 08 Oct 2025 21:12:20 +0000
Received: from shadowdrake.eu ([94.130.51.37]:33132) 
 by hr1.samba.org with esmtp (Exim) id 1v6bSK-007KDh-Qn
 for samba-technical@lists.samba.org; Wed, 08 Oct 2025 21:12:19 +0000
Received: from Temeraire (unknown [IPv6:fd80:b1f4:7504:20::29a])
 by shadowdrake.eu (Postfix) with ESMTP id D87F9CF98
 for <samba-technical@lists.samba.org>; Wed, 08 Oct 2025 20:56:10 +0000 (UTC)
Date: Wed, 8 Oct 2025 20:56:10 +0000
To: samba-technical@lists.samba.org
Subject: [PATCH] rsync: IPv6 configure test fails on Illumos
Message-ID: <20251008205610.71bc1ce5@Temeraire>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.50; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
From: Dark Ayron via samba-technical <samba-technical@lists.samba.org>
Reply-To: Dark Ayron <ayron@shadowdrake.eu>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

The test program, which checks for AF_INET6 fails to build on Illumos
because socket() requires -lsocket. We need to do this test after
checking whether we need -lsocket.

diff --git a/configure.ac b/configure.ac
index d2bcb471..9758d125 100644
--- a/configure.ac
+++ b/configure.ac
@@ -376,36 +376,6 @@ if test x"$rsync_cv_HAVE_BROKEN_LARGEFILE" != x"yes"; then
    AC_SYS_LARGEFILE
 fi
 
-AC_MSG_CHECKING([whether to enable ipv6])
-AC_ARG_ENABLE(ipv6,
-AS_HELP_STRING([--disable-ipv6],[disable to omit ipv6 support]),
-[ case "$enableval" in
-  no)
-	AC_MSG_RESULT(no)
-	;;
-  *)	AC_MSG_RESULT(yes)
-	AC_DEFINE(INET6, 1, [true if you have IPv6])
-	;;
-  esac ],
-
-  AC_RUN_IFELSE([AC_LANG_SOURCE([[ /* AF_INET6 availability check */
-#include <stdlib.h>
-#include <sys/types.h>
-#include <sys/socket.h>
-int main()
-{
-   if (socket(AF_INET6, SOCK_STREAM, 0) < 0)
-     exit(1);
-   else
-     exit(0);
-}
-]])],
-  [AC_MSG_RESULT(yes)
-  AC_DEFINE(INET6, 1, true if you have IPv6)],
-  [AC_MSG_RESULT(no)],
-  [AC_MSG_RESULT(no)]
-))
-
 dnl Do you want to disable use of locale functions
 AC_ARG_ENABLE([locale],
 	AS_HELP_STRING([--disable-locale],[disable to omit locale features]))
@@ -716,6 +686,36 @@ if test x"$ac_cv_func_connect" = x"no"; then
     fi
 fi
 
+AC_MSG_CHECKING([whether to enable ipv6])
+AC_ARG_ENABLE(ipv6,
+AS_HELP_STRING([--disable-ipv6],[disable to omit ipv6 support]),
+[ case "$enableval" in
+  no)
+	AC_MSG_RESULT(no)
+	;;
+  *)	AC_MSG_RESULT(yes)
+	AC_DEFINE(INET6, 1, [true if you have IPv6])
+	;;
+  esac ],
+
+  AC_RUN_IFELSE([AC_LANG_SOURCE([[ /* AF_INET6 availability check */
+#include <stdlib.h>
+#include <sys/types.h>
+#include <sys/socket.h>
+int main()
+{
+   if (socket(AF_INET6, SOCK_STREAM, 0) < 0)
+     exit(1);
+   else
+     exit(0);
+}
+]])],
+  [AC_MSG_RESULT(yes)
+  AC_DEFINE(INET6, 1, true if you have IPv6)],
+  [AC_MSG_RESULT(no)],
+  [AC_MSG_RESULT(no)]
+))
+
 AC_SEARCH_LIBS(inet_ntop, resolv)
 
 # For OS X, Solaris, HP-UX, etc.: figure out if -liconv is needed.  We'll

