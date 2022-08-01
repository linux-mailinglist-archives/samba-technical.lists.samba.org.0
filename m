Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A588E586CF0
	for <lists+samba-technical@lfdr.de>; Mon,  1 Aug 2022 16:36:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=8ZwtMT9b1SYAvg8Uj+k4bpYF1g+CfLk7vfky96vRCQ4=; b=oMXkNbURLFJ4oEo1V4c8BAmXck
	P6COXaU3LF5BTM3MHwrOnstmRgnu3C79X0j/j9onttgBqPwsTczxYCFDDp4q+mtKHgAHagFAyiLR+
	fUp62C8siuGxWYPGWFaE6z8jpaiVSty9vXrZoxFBLvw86KwWUBLYawv6+97glvwVs7uF9Fi8FBzmv
	mjJA3hzGM1U/MjFW9YYWw5pJOqOOJtL9sC0zs0ozgkK1tR2lKetRMy2pBC1ZlHMFsQVJSP8u1OW90
	dAARarIWsgSH+SrbM5l+BciDDWkKrQkrKbJD2or6UMGGX/Fll13P3o9BASrTTXfJoWqmGvfTnBWYw
	nJeAjv5A==;
Received: from ip6-localhost ([::1]:25438 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1oIWVy-004onQ-Mz; Mon, 01 Aug 2022 14:35:26 +0000
Received: from isrv.corpit.ru ([86.62.121.231]:49963) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1oIWVr-004onG-LG
 for samba-technical@lists.samba.org; Mon, 01 Aug 2022 14:35:22 +0000
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id E9020401E6
 for <samba-technical@lists.samba.org>; Mon,  1 Aug 2022 17:35:16 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id DE5CA2A
 for <samba-technical@lists.samba.org>; Mon,  1 Aug 2022 17:35:15 +0300 (MSK)
Message-ID: <587ebe9d-3f91-7389-5ad1-c6d96e435b99@msgid.tls.msk.ru>
Date: Mon, 1 Aug 2022 17:35:15 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-US
To: samba-technical <samba-technical@lists.samba.org>
Subject: running only selected tests in samba sources
Content-Type: text/plain; charset=UTF-8; format=flowed
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
From: Michael Tokarev via samba-technical <samba-technical@lists.samba.org>
Reply-To: Michael Tokarev <mjt@tls.msk.ru>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi!

Is there a way, after successful build of samba source, to run just selected tests
without running whole testsuite, *and* without (re)building everything with the
--enable-selftest option?

Many tests do not require this option to be enabled. For a very simple example,
consider lib/ldb/ tests - when ldb is built from its own separate source
tarball, it's easy to run its tests. But when it is built as part of whole samba
source, an attempt to run ldb tests - even by providing the right test selection -
still fails due to main samba wscript checking if --enable-selftest has been enabled.

In Debian we used to build libldb from its own source, and running a testsuite there
has been useful. But now we build it from main samba source tree and we can't run
the testsuite anymore.

Many more other tests can be useful without --enable-selftest too.

I'm about to patch wscript to omit checks for --enable-selftest options in wscripts..

Thanks,

/mjt

