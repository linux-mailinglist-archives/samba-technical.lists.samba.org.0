Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id F3A6552DB5A
	for <lists+samba-technical@lfdr.de>; Thu, 19 May 2022 19:33:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=eGGaAJh19M7U9bF0uoeod2OsgWnqCqbpaT0CSgN9L5o=; b=uZJ46zwCAtKxfCi7eM7WTBO5Ac
	PSBrWUaMAZ4CHIEXvg8u20YIbnTWY/Jsg0vsKwTP40jtKKXP+bcrcEvj3tR52hCLky52Yjru734vO
	g62bLcmg/c7e8nNmPIz6yTCsxgnsfi1vkZon2BtyB4PFJQfGyh3hJUNSbKAQIWVQyj7EopKniMhSL
	Fbqev9sPkTOGMI1KK7HVHwAMPIIU8buf8zrsCd5D+w9X1yPO96OOwZi0i466llL7ypvdZCHgO179s
	6i0zULdF9bJHyeOBXAPDk05GiexLp56EU50qR2rwJcgGl3/XkffHiY3J+hdCOJvGgQ9nKZNs3FMx0
	UuUU3cxg==;
Received: from ip6-localhost ([::1]:50412 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nrk0s-0024Fe-Hu; Thu, 19 May 2022 17:32:38 +0000
Received: from isrv.corpit.ru ([86.62.121.231]:57867) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nrk0o-0024FV-5W
 for samba-technical@lists.samba.org; Thu, 19 May 2022 17:32:36 +0000
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id B6F7040A62
 for <samba-technical@lists.samba.org>; Thu, 19 May 2022 20:32:23 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id 6AD5B11B
 for <samba-technical@lists.samba.org>; Thu, 19 May 2022 20:32:22 +0300 (MSK)
Message-ID: <c5500558-829f-c737-278e-45f4da2b5ab1@msgid.tls.msk.ru>
Date: Thu, 19 May 2022 20:32:22 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: Q: RUNPATH missing in libsmbldap.so but not other
 executables/libraries?
Content-Language: en-US
To: samba-technical <samba-technical@lists.samba.org>
References: <528f0ed8-cd28-0e7c-f517-4cbf96eb0844@msgid.tls.msk.ru>
In-Reply-To: <528f0ed8-cd28-0e7c-f517-4cbf96eb0844@msgid.tls.msk.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
From: Michael Tokarev via samba-technical <samba-technical@lists.samba.org>
Reply-To: Michael Tokarev <mjt@tls.msk.ru>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

13.05.2022 12:35, Michael Tokarev via samba-technical wrote:
> Hi!
> 
> In debian we've got a bugreport about one of the samba libraries missing RUNPATH
> to the private library directory (where libreplace-sambae.so libsmbd-shim-samba4.so
> etc are located.  This one is libsmbldap.so.2.1.0. And indeed, unlike all other
> libs and executables, this one lacks RUNPATH section, while all other binaries
> does have it.
> 
> $ ldd /usr/lib/x86_64-linux-gnu/libsmbldap.so.2.1.0 | grep found
>      libsamba-debug-samba4.so.0 => not found
>      libreplace-samba4.so.0 => not found
>      libsamba-security-samba4.so.0 => not found
>      libsmbd-shim-samba4.so.0 => not found

source3/wscript_build:

bld.SAMBA3_LIBRARY('smbldap',
                     source='lib/smbldap.c',
                     deps='ldap lber samba-util smbconf',

All 4 of these are not marked as "private".

buildtools/wafsamba/samba_utils.py:install_rpath() only list private
libdir if at least one of the dependencies is marked as private.

but since libsmbldap is actually uses symbols from other libraries,
as determined by the linker (all these are listed in NEEDED section),
it seems logical to include these in the dependencies. So after this:

  bld.SAMBA3_LIBRARY('smbldap',
                      source='lib/smbldap.c',
-                    deps='ldap lber samba-util smbconf',
+                    deps='ldap lber samba-util smbconf replace samba-debug samba-security',

it builds fine *and* includes the private library path in the resulting
library, so that ldd etc is actually able to find the above 4 deps
too.

I don't know (yet) about smbd-shim which is also needed by libsmbldap
but which is not a usual library.  But this is enough already to fix
the underlying issue (of binaries being unable to find their dependencies).

The same is true for other libs which are also missing private libs
directory in their RUNPATH:

File: /usr/lib/x86_64-linux-gnu/samba/libads-samba4.so.0
File: /usr/lib/x86_64-linux-gnu/samba/libnet-keytab-samba4.so.0
File: /usr/lib/x86_64-linux-gnu/samba/libsamba-modules-samba4.so.0
File: /usr/lib/x86_64-linux-gnu/samba/libsmbldaphelper-samba4.so.0

adding their corresponding dependencies in wscripts fixes the issue.

Looking at the whole picture, it seems like the dependency problem
in samba is *huge*, there's just a few libs which gets their deps
correctly, vast majority of them are wrong. I don't know if it is
worth fixing this mess, -- at least it should be done by someone
who knows the thing just a bit.

I'm fixing this in debian, but I'm not submitting a patch to samba,
since it's just a waste of my time.

Thanks,

/mjt

