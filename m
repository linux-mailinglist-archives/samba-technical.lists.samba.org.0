Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 11FDFB1DD97
	for <lists+samba-technical@lfdr.de>; Thu,  7 Aug 2025 21:40:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=HkxY7xSOK7i+2SiLHuWaVpYaJMiL3q0SIUeU9LkQBy0=; b=acik9Ax1cFi2w4uF6kyYfdW2PZ
	C4l+QyOCxVmP57CLDomv4yIeaHApXT/ARbybpocuVni0cT/8olacW40MDJO4l3Nx1VQ6CCUNUkiKd
	oWBT+siCwBf6dyLPT4CnensIPvKp/X9enmDD+Tbl5274JPNwqeAEVuyAyTbjgbfnzxeaZsQ0BocgR
	VXJ4HFGFT/IaOHjleFVtZ24ZtB4hVSFXVLZydgrk8yLXFmdv9ANEObBJnwwdjnpPtp8Yi8ZUA/cZc
	WeZruJmhUvCmjMP7vyNLELHY+npLgcOckTVtpmgUi4fMOJQWJaTJonvhkKERv0tLU5vQR/2vxYMPw
	/FSM/TUg==;
Received: from ip6-localhost ([::1]:54608 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uk6Tg-00EcRO-F9; Thu, 07 Aug 2025 19:40:40 +0000
Received: from isrv.corpit.ru ([212.248.84.144]:57859) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uk6Ta-00EcRG-SB
 for samba-technical@lists.samba.org; Thu, 07 Aug 2025 19:40:38 +0000
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id EBAD213F346;
 Thu, 07 Aug 2025 22:40:05 +0300 (MSK)
Received: from [192.168.177.146] (mjtthink.wg.tls.msk.ru [192.168.177.146])
 by tsrv.corpit.ru (Postfix) with ESMTP id AAEAA259FC8;
 Thu,  7 Aug 2025 22:40:31 +0300 (MSK)
Message-ID: <0d31a90b-c86a-4d82-9241-159d90d3c6d9@tls.msk.ru>
Date: Thu, 7 Aug 2025 22:40:31 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: libreplace and deps (was: new deps for new ldb module (in 4.23))
To: Alexander Bokovoy <ab@samba.org>
References: <732bd60b-7df6-49bb-84da-cabd30e7ccaf@tls.msk.ru>
 <aJT8ai6VN_iLNoTS@toolbx>
Content-Language: en-US, ru-RU
In-Reply-To: <aJT8ai6VN_iLNoTS@toolbx>
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
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 07.08.2025 22:20, Alexander Bokovoy wrote:
> On Thu, 07 Aug 2025, Michael Tokarev via samba-technical wrote:

>> (*) in 4.22, I had to revert one commit for this to work, -
>> 542cf01bfe530 "ldb: User hexchars_upper from replace.h".
>> It would be great if this commit is reverted upstream too, --
>> if it is somehow desirable to keep libldb usable separately.
> 
> I did additional investigation and I don't see linking change for
> libreplace. Here is F42:
...
> $ ldd bin/default/lib/ldb/libldb-samba4.so
>          linux-vdso.so.1 (0x00007f13f84ad000)
>          libreplace-samba4.so => /path/to/src/samba/bin/shared/private/libreplace-samba4.so (0x00007f13f845e000)
>          libtalloc.so.2 => /lib64/libtalloc.so.2 (0x00007f13f8444000)
>          libtevent.so.0 => /lib64/libtevent.so.0 (0x00007f13f842d000)
>          libc.so.6 => /lib64/libc.so.6 (0x00007f13f823c000)
>          /lib64/ld-linux-x86-64.so.2 (0x00007f13f84af000)
> 
> Use of talloc and tevent is expected, libreplace linked from them as
> well but nothing else beyond libc.
> 
> Maybe you have some other issue in Debian's build?

Well, things are a bit more tricky here.

In debian we have a single large package named samba-libs, where
all "other" samba libraries are kept.  Most of them, actually.
Some select separately packaged ones are libsmbclient & libwbclient
(these depends on samba-libs), and libldb.

libreplace is a part of samba-libs.  Maybe this is the key point,
and I should stop fighting and just package libreplace separately.

Multiple times I tried to get rid of this dependency of various
separately-used samba libs on large and messy samba-libs package.
And so far, I was successful, but it took me quite some efforts.

For example, one of the very first things I had to address is the
usage of memset_s(), which is used everywhere in samba and is almost
always implemented in libreplace.  I used explicit_bzero() instead,
which don't need to be replaced by libreplace, - this gave me
ability to break the dependency of everything on libreplace (and
hence on samba-libs package), - in particular, this freed libtalloc/
libtevent/libtdb from this dependency.

Next, there's xpg_strerror(), expected by samba variant of which
actually exists in glibc but is named differently (and is aliased
at compile time with the right #defines).

I also had to remove 'replace' from ldb deps in lib/ldb/wscript,
or else wafsamba adds rpath to libldb (I don't remember why this is
not good).

This worked until 4.22 with commit 542cf01bfe530a83df, which started
to use samba-specific symbol from libreplace (as opposed to replacing
some system symbol).  I reverted this commit, and it works so far,
including the first RC of 4.23.

Overall, besides heimdal code, samba can be rather trivially switched
to using a more well-defined explicit_bzero (which I really recommend
to do), - because memset_s has a confusing interface (which is not
actually used anywhere in samba or heimdal), and at the same time has
an often-misunderstood return, - so we had a check for memset_s
returning success and aborted if it didn't, which is kind of absurd.

But this is a diffrent topic entirely.

The patches I use in debian which are relevant here:
https://salsa.debian.org/samba-team/samba/-/blob/master/debian/patches/use-bzero-instead-of-memset_s.diff
https://salsa.debian.org/samba-team/samba/-/blob/master/debian/patches/ldb-no-replace.diff
https://salsa.debian.org/samba-team/samba/-/blob/master/debian/patches/replace-xpg-strerror.patch
https://salsa.debian.org/samba-team/samba/-/blob/master/debian/patches/revert-ldb-use-hexchars_upper-from-replace.h.patch
https://salsa.debian.org/samba-team/samba/-/blob/master/debian/patches/talloc-standalone.diff
https://salsa.debian.org/samba-team/samba/-/blob/master/debian/patches/tdb-standalone.diff
https://salsa.debian.org/samba-team/samba/-/blob/master/debian/patches/tevent-standalone.diff

Thanks,

/mjt

> Apologies to Volker for jumping the gun so fast!


