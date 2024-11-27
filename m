Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id AE61B9DA1F7
	for <lists+samba-technical@lfdr.de>; Wed, 27 Nov 2024 07:05:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=apBW39xsLKZWkTSu5q07v5FVZD3bxyPSgRjCMKylQpE=; b=3cUn2teYa4yBp6+Zgx6l0udOPz
	gSa1C4BHvuMbla+jxo5vGYBQJ+w8TABq5lqwDdlQZEzoD6q3hLmVML/f+wbSNiKvxWOpTnTY2yttm
	o8a6+BHxE9lwxgYznAXC3RFEstKL32gnPD7YKT+2mGccGOQKMO6yp5yeADz2yl5JpqyRwZ+35+FI9
	QztpFXCYFlkktNjQG4NmFJa3L9zDwKsQLcvtpDNfnRYzoYf3M63f4+mY/aBsvkIsGoT2KEm3Bfkwv
	3t7pKcoEk6KI8M0ZtDOT1/zZ8+p2Iw7W4Z2/fCVbbApA6JbrcuRwSUYSJRZEs/8LSRmmF8+avetKe
	+eehaJcQ==;
Received: from ip6-localhost ([::1]:26486 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1tGBAZ-000wtB-Pl; Wed, 27 Nov 2024 06:04:59 +0000
Received: from isrv.corpit.ru ([86.62.121.231]:46629) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1tGBAV-000wt4-Ma
 for samba-technical@lists.samba.org; Wed, 27 Nov 2024 06:04:58 +0000
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id AF957B5283;
 Wed, 27 Nov 2024 09:04:35 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id 84B0017AFD7;
 Wed, 27 Nov 2024 09:04:52 +0300 (MSK)
Message-ID: <01fd1b4b-41f0-4248-b3a2-e3842bc22a78@tls.msk.ru>
Date: Wed, 27 Nov 2024 09:04:52 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: missing rpath [was: building bundled talloc/tevent/tdb libs out of
 main samba sources]
To: Andrew Bartlett <abartlet@samba.org>, samba-technical@lists.samba.org
References: <d033ddfb-9e93-4bdf-8cbb-ec8d0ace7702@tls.msk.ru>
 <f6a0c35c4b22bfc273b812fabdaa65e80991c3b5.camel@samba.org>
 <548706c7-22f9-4715-8fb9-90aed04b8c54@tls.msk.ru>
 <71cfea1803e9e86dad4734dc28ea992e4d74db80.camel@samba.org>
Content-Language: en-US, ru-RU
In-Reply-To: <71cfea1803e9e86dad4734dc28ea992e4d74db80.camel@samba.org>
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

27.11.2024 08:26, Andrew Bartlett via samba-technical wrote:
> On Wed, 2024-11-27 at 08:12 +0300, Michael Tokarev via samba-technical
...>> But my attempt were unsuccessful so far, as it turned out.
>>
>> Once I arrange to build all 3 libs out of samba, the build system
>> suddenly stops embedding rpath-private into all binaries, so the
>> resulting thing, while having the same set of files, actually does
>> not work, - not finding samba private libraries in libdir/samba.
>> I'm investigating it now, - but again, the build system is just too
>> complex and very difficult to debug, so it might take some time.
>> It's something I didn't expect at all, as all other changes are
>> rather simple.
> 
> That is why I'm suggesting looking at what I did for ldb, and trying to
> make that more general, because we worked on some of those details.

This issue at hand has nothing to do with the actual way to build
libtdb &Co.  It's just a consequence of too complex build system.

Here's what I've found, using param.cpython as a starting point:

$ fgrep param.cpython build.* | grep rpath
build.bad:runner [..samba/samba3/param.cpython-312-x86_64-linux-gnu.so..
build.good:runner [..samba/param.cpython-312-x86_64-linux-gnu.so..
build.good:runner [..samba/samba3/param.cpython-312-x86_64-linux-gnu.so..

as we can see, param.cpython-312.. is missing in the 'bad' case, -
it is built without private rpath.

Looking at the definition of param.cpython, in source3/samba/wscript_build:

bld.SAMBA3_SUBSYSTEM(pyparam_util,
                 source='pyparam_util.c',
                 deps='%s samba-hostconfig %s' % (libpython, pytalloc_util),
                 pyext=True,
                 enabled=bld.PYTHON_BUILD_IS_ENABLED()
                 )

so only samba-hostconfig is referenced as a dependency from the list
of samba libs.  However:

$ patchelf --print-needed python3-samba/usr/lib/python3/dist-packages/samba/param.cpython-312-x86_64-linux-gnu.so
libsamba-hostconfig.so.0
libserver-role-private-samba.so.0
libsamba-util.so.0
libsamba-debug-private-samba.so.0
libtalloc.so.2
libpytalloc-util.cpython-312-x86-64-linux-gnu.so.2
libc.so.6

so besides samba-hostconfig, it also needs stuff - DIRECTLY - from
a lot of other samba libraries, including some private ones.  But
none of these are specified as deps.

And in wafsamba code which decides when to embed rpath, we see it
looks for deps and if none are in private, skips adding it.

Now,

$ fgrep -c Wl,-rpath,/usr/lib/x86_64-linux-gnu/samba build.*
build.bad:466
build.good:491

so there are 25 such libs with missing deps JUST IN THIS CASE.

I guess all of them were receiving one or more private libs
indirectly - probably though pytalloc-util or something.

Finding and patching all 25 cases is not realistic.  But I'll
try to see what's the root of the tree here.

FWIW, I already submitted another similar fix for a missing
dependency, - it's in my (largeish) MR which is stalled due
to another issue somewhere in wafsamba/wscripts which I'm
having hard time to debug - probably I should drop that one
change from the MR and keep it debian-only for now.

Thanks,

/mjt

