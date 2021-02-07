Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 64E4C3127B2
	for <lists+samba-technical@lfdr.de>; Sun,  7 Feb 2021 22:52:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=Nr4B/8UBNiHGdrR/Vo9iPUfoI1jIMsYN9dy8NI6rCzM=; b=GVSOyqoyegFAv9pVz7Cr7z8g9O
	ROpJ0mcM/PXzXgBYeQwK1fkf09WdcFkbSijA34rvSHqoTDUA03my8ErlKN5NEEN1ZnCcUDWq7VO/F
	IDriV4QxstOwThZyEJNIrLXQyC/EXkRACxx+PpkqUnJhC3ju/xG485DcUb8ZfwZcP7XmkqrpUk7ew
	JHPHO4iVPa4MnrZV9IgO8RuYqNcGUOfA6sj+wcv1DxE/86KqLG6JnxG7ons8zY0t1CwfFfaHqJ8j4
	71lODk97ZQhhElersLBqMaiNfxGa3ILeOBTsGZ5KmNmBHJJw4qbYc6AiUw2n3nVu6mdBo8xLSMhPD
	LrNSYSBA==;
Received: from ip6-localhost ([::1]:19834 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1l8ryH-00BXxj-3k; Sun, 07 Feb 2021 21:51:57 +0000
Received: from valentin-vidic.from.hr ([2001:470:1f0b:3b7::1]:44339) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1l8ry2-00BXxH-09
 for samba-technical@lists.samba.org; Sun, 07 Feb 2021 21:51:46 +0000
Received: by valentin-vidic.from.hr (Postfix, from userid 1000)
 id 71E164F8C; Sun,  7 Feb 2021 22:51:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=valentin-vidic.from.hr; s=2020; t=1612734698;
 bh=Nr4B/8UBNiHGdrR/Vo9iPUfoI1jIMsYN9dy8NI6rCzM=;
 h=Resent-From:Resent-Date:Resent-To:From:To:Cc:Subject:Date:From;
 b=oMvOEjrgwxMpjLqo3Z7wHJwQpjc3HSArVv6KlaQnoYZ++8jmPrrKOl03rt6u6YORw
 aodJTXvxb7NMgfBi/4ZYzpzdbkaEPs/WhMN48TZ+RUN4l+RBYjQTt5NRttWk/vRmjA
 6AUvMAGQjwXru9faSO01/rmcE9mEwml351wulok6d6S5bb09/3AjtmKU1K8hCiNEip
 qEkDX9Wnboe23LLnZ1/rtFBegoIerjR48PBN1fAmjADOekbQw/IKNjN/FcecJtQCED
 PX7guD8nQCCMY4zWaoUyVbh9lDcAGV7A0JDEQZbcHrA0aTuGPJdYA+x6cn1vTHsZug
 f7xkxWwdD1vshvZeeEYiPaFhViLTloCxmdmwMXPVLoU+pzYDt3bWfQ6zYrA0hJAQoF
 LSYNMi5+MvfaiuYjsWXhx/LggwWGLreROgic7ryEVN04w5Wjywx676cp4pI0ZBD7p7
 4VB/byewG1zjWwg5pWl3mdxcOQ+cwEfREb3hCOeHjyRKlVzOAKuifgNMrK6ykMq3h/
 BYWKY+pkgbJnZIsjZZSRrlosqvSmqS5YzNSCGNn+beg57Bz90MBqG2gITq4r4Z1oy+
 +DtY0nBaKC2S6gAfaH6+HIOJwqDoeD/JjaYzpGeqUag6dv2A5QWmkPaJmZg30DtSmS
 JIuu97Mtd91YDPJYWcYXX1eI=
Resent-From: Valentin =?utf-8?B?VmlkacSH?= <vvidic@valentin-vidic.from.hr>
Resent-Date: Sun, 7 Feb 2021 22:51:38 +0100
Resent-Message-ID: <20210207215138.GX29617@valentin-vidic.from.hr>
Resent-To: samba-technical@lists.samba.org
Received: from valentin-vidic.from.hr ([unix socket])
 by valentin-vidic.from.hr with LMTPA; Sun, 07 Feb 2021 21:31:48 +0100
X-Cyrus-Session-Id: cyrus-3216-1612729908-2-17367820100158304117
X-Sieve: CMU Sieve 3.0
Received: by valentin-vidic.from.hr (Postfix, from userid 1000)
 id 7D2C14F83; Sun,  7 Feb 2021 21:31:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=valentin-vidic.from.hr; s=2020; t=1612729904;
 bh=Nr4B/8UBNiHGdrR/Vo9iPUfoI1jIMsYN9dy8NI6rCzM=;
 h=From:To:Cc:Subject:Date:From;
 b=0XVOneEqJpqPhs5N105SulY/IFqCq6h9AYrsPfFuVV8O4mcSiANUWYgw6DusKhqoR
 oAwPrydQBvnHPG3t1ZNsw97+NeGykn0KRc/v4LiPnz1SB4V7llYDVr2kKxSPyryiXv
 Z1JpPLUUm0a+F6ts150FSPlwDMrJtTRWt6dVMteK5p87u/HW+/uTDiE22dMAw4JRiA
 LgU8cHVfk7gglo5nfWnlnDTCOQkqVAdp0JnxVhfHilHyBE1NCupcRn9RFO9BO42Mn5
 2Z5jWF7h10Ve46BVkj6R1hcmionPJlQRp1/Nr766Qe+bSL+6TuEH+qRYUMdndhSMmP
 I4lCJZNmwoH06nkKEhSVsS2RS5+8H7z70vS7x6DeRafee5mion1e4CtlMVB06Gz4vw
 qqk43eLTpTDHkRvuti+LKEpLl+/zfeGP1Kq9QS9vBvrLbrFdU7VcmlYYkli2+Otdkr
 q44VKWp9zwNZYh3P+u8AXhEmRmi2JSz4NSSUAFUfANV4mBsJ/2pehMaSAHPr02hxTJ
 3rKE8NWWcng8OgAKwIHEHIqHSGqSkhEoL55DwzrH01BgffD43h0SftYkK+TA4ogYdB
 uRHcQdGwBjDlsjOCaPoc7QhB0/guCC/K7AOOUjqJoxAT1nayICHbcg9EtvQxVlKkWy
 Jszgop67KJLKO6ujHzbGxSkA=
To: samba-technical@lists.samba.org
Subject: [PATCH] libpamtest: include stddef.h in libpamtest.h
Date: Sun,  7 Feb 2021 21:31:31 +0100
Message-Id: <20210207203131.3130-1-vvidic@valentin-vidic.from.hr>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
From: Valentin Vidic via samba-technical <samba-technical@lists.samba.org>
Reply-To: Valentin Vidic <vvidic@valentin-vidic.from.hr>
Cc: Valentin Vidic <vvidic@valentin-vidic.from.hr>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

If libpamtest.h is the first include build fails with:

  /usr/include/libpamtest.h:265:11: error: unknown type name ‘size_t’

Signed-off-by: Valentin Vidic <vvidic@valentin-vidic.from.hr>
---
 include/libpamtest.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/libpamtest.h b/include/libpamtest.h
index 0307a26..98611f0 100644
--- a/include/libpamtest.h
+++ b/include/libpamtest.h
@@ -19,6 +19,7 @@
 #ifndef __LIBPAMTEST_H_
 #define __LIBPAMTEST_H_
 
+#include <stddef.h>
 #include <stdint.h>
 #include <security/pam_appl.h>
 
-- 
2.20.1


