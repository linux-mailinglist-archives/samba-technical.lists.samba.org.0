Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A2B99525EBA
	for <lists+samba-technical@lfdr.de>; Fri, 13 May 2022 11:36:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=UM6s+FVVOLFIlKRT6w1DXOZ9Ji6/DmBkHpE1W0SPHpw=; b=Nw7Ucp8ZFHsdI7vQrFqbyxc6vf
	oakLZwzKeHACfYcz7i2TA2N3p3J8CgUst1unMRFkFySYqKzpbCJoslkcnk1GZHQEnSiNljIIyTSnM
	MgCU42ep7OYbAdMSW/8ByY0i8IrRFWBkNpfpoFcXckUqhHk3tQgN6sAjpL4O7SeQRLh0yfdfElTVq
	nw5Rcx+D2326BK2IFYhvaZIecbRpz+RTKKpUTzH1d6OfnpqiXYraIexrxJbyCVziwTfhArKn51RBg
	/q9NS0v/BhBY6tdyzErZvB7Ue5ncX/Rac+BGkdrtkfMNVQxMH3KjBZE2Bg07yZfNJRG/AhNFvtGRv
	2T0L7GqA==;
Received: from ip6-localhost ([::1]:51944 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1npRhg-001CjK-Vn; Fri, 13 May 2022 09:35:21 +0000
Received: from isrv.corpit.ru ([86.62.121.231]:39851) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1npRhU-001CjB-WD
 for samba-technical@lists.samba.org; Fri, 13 May 2022 09:35:11 +0000
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 3F02F407E8
 for <samba-technical@lists.samba.org>; Fri, 13 May 2022 12:35:06 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id 9ABF112D
 for <samba-technical@lists.samba.org>; Fri, 13 May 2022 12:35:05 +0300 (MSK)
Message-ID: <528f0ed8-cd28-0e7c-f517-4cbf96eb0844@msgid.tls.msk.ru>
Date: Fri, 13 May 2022 12:35:05 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-US
To: samba-technical <samba-technical@lists.samba.org>
Subject: Q: RUNPATH missing in libsmbldap.so but not other
 executables/libraries?
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

In debian we've got a bugreport about one of the samba libraries missing RUNPATH
to the private library directory (where libreplace-sambae.so libsmbd-shim-samba4.so
etc are located.  This one is libsmbldap.so.2.1.0. And indeed, unlike all other
libs and executables, this one lacks RUNPATH section, while all other binaries
does have it.

$ ldd /usr/lib/x86_64-linux-gnu/libsmbldap.so.2.1.0 | grep found
	libsamba-debug-samba4.so.0 => not found
	libreplace-samba4.so.0 => not found
	libsamba-security-samba4.so.0 => not found
	libsmbd-shim-samba4.so.0 => not found


$ objdump -p /usr/lib/x86_64-linux-gnu/libsmbldap.so.2.1.0  | egrep 'RUNPATH|RPATH|NEEDED' | grep samba
   NEEDED               libsamba-util.so.0
   NEEDED               libsmbconf.so.0
   NEEDED               libsamba-debug-samba4.so.0
   NEEDED               libreplace-samba4.so.0
   NEEDED               libsamba-security-samba4.so.0
   NEEDED               libsmbd-shim-samba4.so.0

while other libraries and executables:

$ objdump -p /usr/lib/x86_64-linux-gnu/libsamba-passdb.so.0.28.0  | egrep 'RUNPATH|RPATH|NEEDED' | grep samba
   NEEDED               libsmbldaphelper-samba4.so.0
   NEEDED               libsamba-modules-samba4.so.0
   NEEDED               libldbsamba-samba4.so.0
   NEEDED               libsamba3-util-samba4.so.0
   NEEDED               libdbwrap-samba4.so.0
   NEEDED               libreplace-samba4.so.0
   NEEDED               libsamba-credentials.so.1
   NEEDED               libsecrets3-samba4.so.0
   NEEDED               libsamdb-common-samba4.so.0
   NEEDED               libsamba-util.so.0
   NEEDED               libcliauth-samba4.so.0
   NEEDED               libsamba-errors.so.1
   NEEDED               libsamba-security-samba4.so.0
   NEEDED               libndr-samba-samba4.so.0
   NEEDED               libsamba-hostconfig.so.0
   NEEDED               libsamba-debug-samba4.so.0
   NEEDED               libtdb-wrap-samba4.so.0
   NEEDED               libutil-tdb-samba4.so.0
   NEEDED               libevents-samba4.so.0
   NEEDED               libcli-ldap-common-samba4.so.0
   NEEDED               libgenrand-samba4.so.0
   NEEDED               libsmbd-shim-samba4.so.0
   RUNPATH              /usr/lib/x86_64-linux-gnu/samba


How come this single library (libsmbldap.so) does not have a RUNPATH specified
but all the other does?

Thanks!

/mjt

