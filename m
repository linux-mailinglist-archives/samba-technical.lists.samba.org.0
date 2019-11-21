Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id BD85910535F
	for <lists+samba-technical@lfdr.de>; Thu, 21 Nov 2019 14:42:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=6x9cArf43HPtlZZJeJeRlc5fPcOYdqHy39mK7T1ant8=; b=J685e/R1vN46Fm0LE+8euaRZxY
	4tmVGI25dWFenSuInOvVv+fvLHid+5Vmxd4DEXJtMWNsllMxoNBJmGZZVw9e1oJ398Cjp/rsXl3AU
	n0SuLsR02Udp9R9Pzaq/yY7pkBkGakHP9b8OH0gj8S/Zc/D4XtlD6DYF2Lpxd1TdeCi7de7iSVvGu
	vw5KZz+W5YpMhnmJQlWFgHPvLdCaI0EORyRBUlHt5v/6haFIpSwuXYCSSKwD0BW8p9Cu/FFKpP8HR
	+iJqyhxTuXbyyElmsZKdf7dhYG/JpwDSLBU7no+yPY+tpDhIpEc8af7Zgu9QVa13+rN+OtGgRdJju
	BUQe5cIw==;
Received: from localhost ([::1]:33980 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iXmiU-001qI9-5Q; Thu, 21 Nov 2019 13:41:50 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:50526) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iXmiP-001qI2-HY
 for samba-technical@lists.samba.org; Thu, 21 Nov 2019 13:41:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:To:From:CC;
 bh=6x9cArf43HPtlZZJeJeRlc5fPcOYdqHy39mK7T1ant8=; b=odm8NM8v7yQxrGRQFOzaTmOfhU
 WYEL8oE4DqTeQarH730O369ZWFKPGvQqVnWjszFS6dDYXzmzMforTb2CnXXAMxsd/KiAKMrJRzScR
 Hp6VwdMIfXLYiHFQr4C0Gt0tt1INh0CSuT7uf54slVpoWKpFvvo9ehEGu+znsXqduNMTyzYft4Jou
 kYzDHr/2hDlx6KYog1dClP+IqNMZGH4brnI2Le5spSJ3K1fzhPk0M3hmZadqJTe5UDMEg/90u5w5u
 JF4hLxZkTBIaxABbrI8f39n9DiwNoGn+92e5HWP5dzpsbJQzZm/WLXCzPQfUwy1VfUHUw5xgPJH48
 UJTG/jAOK1J3UCvvI+97JOwMWGmEX9dTcbOcxcEl8rkvWY1lXJRLa8d7rBZYoMo30iOkppMVhxemu
 kz+LnrRJNcxBlbXbb73kH/7XzRAJA+fyR/BcmpbJGiIb2F/RZNg6ozbS+pgApF8PSD6toi6GihabT
 /TiQhWoz4Ipj4pAbbEVuRw+w;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iXmiP-0002ud-5I
 for samba-technical@lists.samba.org; Thu, 21 Nov 2019 13:41:45 +0000
To: samba-technical@lists.samba.org
Subject: libpytalloc-util 2.2.0 broke the ABI
Date: Thu, 21 Nov 2019 14:41:44 +0100
Message-ID: <1647506.J1yn77AgSA@magrathea>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
From: Andreas Schneider via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andreas Schneider <asn@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hello,

we tried to package libtalloc 2.2.0 and our internal testing tools revealed an 
ABI breakage in libpytalloc-util.


nothing provides libpytalloc-util.cpython-36m-ppc64le-linux-gnu.so.
2(PYTALLOC_UTIL.PY3_2.1.5)(64bit) needed by python3-samba-4.10.4-101


Checking the PRM Provides libpytalloc-utils show the ABI is:

libpytalloc-util.cpython-36m-ppc64le-linux-gnu.so.2()(64bit)
libpytalloc-util.cpython-36m-ppc64le-linux-gnu.so.
2(PYTALLOC_UTIL.CPYTHON_36M_PPC64LE_LINUX_GNU_2.2.0)(64bit)
libpytalloc-util.cpython-36m-ppc64le-linux-gnu.so.2(PYTALLOC_UTIL_2.0.6)
(64bit)
libpytalloc-util.cpython-36m-ppc64le-linux-gnu.so.2(PYTALLOC_UTIL_2.0.7)
(64bit)
libpytalloc-util.cpython-36m-ppc64le-linux-gnu.so.2(PYTALLOC_UTIL_2.0.8)
(64bit)
libpytalloc-util.cpython-36m-ppc64le-linux-gnu.so.2(PYTALLOC_UTIL_2.1.0)
(64bit)
libpytalloc-util.cpython-36m-ppc64le-linux-gnu.so.2(PYTALLOC_UTIL_2.1.1)
(64bit)
libpytalloc-util.cpython-36m-ppc64le-linux-gnu.so.2(PYTALLOC_UTIL_2.1.10)
(64bit)
libpytalloc-util.cpython-36m-ppc64le-linux-gnu.so.2(PYTALLOC_UTIL_2.1.11)
(64bit)
libpytalloc-util.cpython-36m-ppc64le-linux-gnu.so.2(PYTALLOC_UTIL_2.1.12)
(64bit)
libpytalloc-util.cpython-36m-ppc64le-linux-gnu.so.2(PYTALLOC_UTIL_2.1.13)
(64bit)
libpytalloc-util.cpython-36m-ppc64le-linux-gnu.so.2(PYTALLOC_UTIL_2.1.14)
(64bit)
libpytalloc-util.cpython-36m-ppc64le-linux-gnu.so.2(PYTALLOC_UTIL_2.1.15)
(64bit)
libpytalloc-util.cpython-36m-ppc64le-linux-gnu.so.2(PYTALLOC_UTIL_2.1.16)
(64bit)
libpytalloc-util.cpython-36m-ppc64le-linux-gnu.so.2(PYTALLOC_UTIL_2.1.2)
(64bit)
libpytalloc-util.cpython-36m-ppc64le-linux-gnu.so.2(PYTALLOC_UTIL_2.1.3)
(64bit)
libpytalloc-util.cpython-36m-ppc64le-linux-gnu.so.2(PYTALLOC_UTIL_2.1.4)
(64bit)
libpytalloc-util.cpython-36m-ppc64le-linux-gnu.so.2(PYTALLOC_UTIL_2.1.5)
(64bit)
libpytalloc-util.cpython-36m-ppc64le-linux-gnu.so.2(PYTALLOC_UTIL_2.1.6)
(64bit)
libpytalloc-util.cpython-36m-ppc64le-linux-gnu.so.2(PYTALLOC_UTIL_2.1.7)
(64bit)
libpytalloc-util.cpython-36m-ppc64le-linux-gnu.so.2(PYTALLOC_UTIL_2.1.8)
(64bit)
libpytalloc-util.cpython-36m-ppc64le-linux-gnu.so.2(PYTALLOC_UTIL_2.1.9)
(64bit)
libpytalloc-util.cpython-36m-ppc64le-linux-gnu.so.2(PYTALLOC_UTIL_2.2.0)
(64bit)

as you can see the PYTALLOC_UTIL.PY3_2.1.5 (note the .PY3) symbols are gone. 
This means we have an ABI break in libpytalloc-util. You can't update the 
library without breaking existing applications!


However the SO version has not been bumped to indicate such a breakage, we 
still claim it is compatible. The SO version should be 3 in such a case and 
not 2.

This has been introduced by commit 24127acae0f05f0011c4008e75f1a1de31584199

    ABI: Remove unused .py3*.sigs files
    
    These are no longer used by the build system so avoid
    confusion by removing them from the tree.

I'm investigating how we are fixing this in RHEL now. Maybe we have to add the 
symbols back in our package.

For Samba I guess we should bump the SO version of libpytalloc-util to 3 asap.


In addition I think we need a CI job which runs the abi-compliance-checker for 
all public libraries.

Fedora provides packages for abi-dumper and abi-compliance-checker. So we 
could keep an ABI dump from the current released version in the source tree 
and compare against that one if we break anything.


Cheers,

	Andreas

-- 
Andreas Schneider                      asn@samba.org
Samba Team                             www.samba.org
GPG-ID:     8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D



