Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F51EB1DD6B
	for <lists+samba-technical@lfdr.de>; Thu,  7 Aug 2025 21:16:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=20DzHvfTMT5TO6mq7mI/ZLTwmuSLSKexI+bVCDhFl0c=; b=1Nz6pvbJeYNQMxvnaHFOJR44/p
	cFbYDzSrZJHoBKNW3Y/30dqTi8wQLPmTo6+FuLC+972kO0x95GUYj4MSk+iECTA7OR0rzJJEOeLk9
	+9yRYhNm1in5Ki0L/j4XitJXuf4PBvTcDV+57v0d2nKryGM69tb12X8626tzFaogJTD8vH7VqTXib
	FbvRvG981zpYTwQQ8c/1yjWXwBxH7xBY5ayKITelXvv0Z7iZaDKNL/KtHHs7Fva9O5/MzlUK8WUqO
	uS6qsT43/HWXdPrTeVDBWA1VNBju/lPo4qXoHCAA8K8oOaj5vjVTK8CRwenWGmruqtlGN8IBR0ClG
	w+ydZd+w==;
Received: from ip6-localhost ([::1]:56624 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uk65u-00EcKb-OW; Thu, 07 Aug 2025 19:16:06 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:23878) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uk65r-00EcKU-0V
 for samba-technical@lists.samba.org; Thu, 07 Aug 2025 19:16:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=20DzHvfTMT5TO6mq7mI/ZLTwmuSLSKexI+bVCDhFl0c=; b=GRZFAsv+O3F1zJjR51SusRarTi
 bWXm4rnlz4Zz21Yr8I3NCJFpxfET50GHLzn22NtQ0XDm6cX9im4/+KK1FGLXuYt1yTkZnIKa84jQF
 VnsV3JOsUPtGLDmgSVAOOq8M5SU63kWd6gF9SZNmw26Wob25VhfVwJtiAsQMHHglf5lfvXzJ62PB7
 UUZFw/67WMDghNp4ln9b/xSOYiG/HF7g2e7SsnEY4O/3RWxCE/KfrhQk6eKFZ4R3tHmSUPy2t4Pmi
 T/EGNJyU7i4yQyplBFZLSEBBfGl5d0GO9dp34227lvu5cmC1851yPCnHlu0FyDgPlqeKL2b0jyL7w
 ol5Jt0FSCYTSGTQwDpf92TLxsoFX41prx0VlQO+mtlryy2yVaE5+b72mNMJPWp/Qty6zG53Sz5Pak
 eb6U9VwMQATO+DRi7thjVVbEn8s6odW9sTJqcnnQ1FOUgZJgZBTqJ1XixIBeoefJnjR7Ce/eZwUmI
 cGkQOXCKKTpEN/jic9y6M9p0;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uk65q-001ekK-1X; Thu, 07 Aug 2025 19:16:02 +0000
Date: Thu, 7 Aug 2025 22:20:10 +0300
To: Michael Tokarev <mjt@tls.msk.ru>
Subject: Re: new deps for new ldb module (in 4.23)
Message-ID: <aJT8ai6VN_iLNoTS@toolbx>
References: <732bd60b-7df6-49bb-84da-cabd30e7ccaf@tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <732bd60b-7df6-49bb-84da-cabd30e7ccaf@tls.msk.ru>
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
From: Alexander Bokovoy via samba-technical <samba-technical@lists.samba.org>
Reply-To: Alexander Bokovoy <ab@samba.org>
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thu, 07 Aug 2025, Michael Tokarev via samba-technical wrote:
> Hi!
> 
> In debian, we package libldb separately from other samba libraries,
> because libldb is used by other software (sssd).  Up until 4.22
> version, this was possible (*)
> 
> Now, 4.23 introduces a new ldb module - trust_notify.so.  And this
> module depends on numerous other samba libraries:
> 
>   NEEDED               libMESSAGING-private-samba.so.0
>   NEEDED               libMESSAGING-SEND-private-samba.so.0
>   NEEDED               libsamba-hostconfig.so.0
>   NEEDED               libsamba-util.so.0
>   NEEDED               libtevent-util.so.0
>   NEEDED               libdcerpc-binding.so.0
> 
> what this new module is for?  Should it be part of libldb?
> 
> This is a more broad question - should libldb be usable by
> its own, without the rest of samba?  It's been a semi-private
> API of samba for quite a while (together with libndr), but
> sssd uses it anyway, and it's been a constant pain to work
> with.
> 
> (*) in 4.22, I had to revert one commit for this to work, -
> 542cf01bfe530 "ldb: User hexchars_upper from replace.h".
> It would be great if this commit is reverted upstream too, --
> if it is somehow desirable to keep libldb usable separately.

I did additional investigation and I don't see linking change for
libreplace. Here is F42:

$ ldd /usr/lib64/samba/libreplace-private-samba.so
        linux-vdso.so.1 (0x00007f726d61f000)
        libc.so.6 => /lib64/libc.so.6 (0x00007f726d411000)
        /lib64/ld-linux-x86-64.so.2 (0x00007f726d621000)
$ strings /usr/lib64/samba/libreplace-private-samba.so|grep chars
hexchars_upper
hexchars_lower

This is with 4.21. In the library definition libreplace would only link
against bsd, rt, socket, nsl, dl, and attr depending on the found
libraries. So it should not be linking directly to other libraries:

$ grep extra_libs lib/replace/wscript
    extra_libs = ''
    if bld.CONFIG_SET('HAVE_LIBBSD'): extra_libs += ' bsd'
    if bld.CONFIG_SET('HAVE_LIBRT'): extra_libs += ' rt'
    if bld.CONFIG_SET('REPLACE_REQUIRES_LIBSOCKET_LIBNSL'): extra_libs += ' socket nsl'
        deps = extra_libs
                      deps='dl attr' + extra_libs)

I also checked the git master's build on Fedora 42:

$ ldd bin/default/lib/replace/libreplace-*.so
bin/default/lib/replace/libreplace-private-samba.so:
        linux-vdso.so.1 (0x00007f2f4291f000)
        libc.so.6 => /lib64/libc.so.6 (0x00007f2f42716000)
        /lib64/ld-linux-x86-64.so.2 (0x00007f2f42921000)
bin/default/lib/replace/libreplace-samba4.so:
        linux-vdso.so.1 (0x00007fc02314c000)
        libc.so.6 => /lib64/libc.so.6 (0x00007fc022f42000)
        /lib64/ld-linux-x86-64.so.2 (0x00007fc02314e000)
$ ldd bin/default/lib/ldb/libldb-samba4.so
        linux-vdso.so.1 (0x00007f13f84ad000)
        libreplace-samba4.so => /path/to/src/samba/bin/shared/private/libreplace-samba4.so (0x00007f13f845e000)
        libtalloc.so.2 => /lib64/libtalloc.so.2 (0x00007f13f8444000)
        libtevent.so.0 => /lib64/libtevent.so.0 (0x00007f13f842d000)
        libc.so.6 => /lib64/libc.so.6 (0x00007f13f823c000)
        /lib64/ld-linux-x86-64.so.2 (0x00007f13f84af000)


Use of talloc and tevent is expected, libreplace linked from them as
well but nothing else beyond libc.

Maybe you have some other issue in Debian's build?

Apologies to Volker for jumping the gun so fast!

> 
> Thanks,
> 
> /mjt
> 

-- 
/ Alexander Bokovoy

