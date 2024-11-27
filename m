Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id C5CC09DA9D5
	for <lists+samba-technical@lfdr.de>; Wed, 27 Nov 2024 15:24:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=pTv6D/Hzg1QTUl6sHG7/Kh0GGucIe4jFK++Fz76+Jmc=; b=Y+hO6cA0zIF6C+MiFP+Hnpn0pu
	yADG/gFoC6xDdPUVuzPlSzO4BBDhzMgro3OKARG45Gj3ptvaPFLP+0TRl8lTtI7iipSktQImtU71a
	lLnIVC2e/461MH/sHc5WeYw4khFhrWLBZjMeoAhUpPSVwvU+WOn+YwKMJkL+636CX0tuDC59Pnmem
	7bUb3CMY8144q+5ibNHBxwiP0T8QFha+FiVwgn61ouRkJBATMsMWooTizpfZ7K/W2iOhidbKKc1xk
	SU9EcloGiS6jeY8FyFjNxn+INe1mwGbtZpcW7epZKjQRYSbmngkdkukPkUbJc5I4HPAqwS1Z547ZL
	lt2dIGFA==;
Received: from ip6-localhost ([::1]:43428 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1tGIxd-000yvy-D9; Wed, 27 Nov 2024 14:24:09 +0000
Received: from isrv.corpit.ru ([86.62.121.231]:46753) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1tGIxY-000yvr-O3
 for samba-technical@lists.samba.org; Wed, 27 Nov 2024 14:24:07 +0000
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id DBC2FB5926;
 Wed, 27 Nov 2024 17:23:43 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id 58A3C17B85F;
 Wed, 27 Nov 2024 17:24:01 +0300 (MSK)
Message-ID: <1c6c0b7f-0620-4e19-ab5b-c4b3e80ef4ff@tls.msk.ru>
Date: Wed, 27 Nov 2024 17:24:01 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: missing rpath [was: building bundled talloc/tevent/tdb libs out
 of main samba sources]
To: Andrew Bartlett <abartlet@samba.org>, samba-technical@lists.samba.org
References: <d033ddfb-9e93-4bdf-8cbb-ec8d0ace7702@tls.msk.ru>
 <f6a0c35c4b22bfc273b812fabdaa65e80991c3b5.camel@samba.org>
 <548706c7-22f9-4715-8fb9-90aed04b8c54@tls.msk.ru>
 <71cfea1803e9e86dad4734dc28ea992e4d74db80.camel@samba.org>
 <01fd1b4b-41f0-4248-b3a2-e3842bc22a78@tls.msk.ru>
Content-Language: en-US, ru-RU
In-Reply-To: <01fd1b4b-41f0-4248-b3a2-e3842bc22a78@tls.msk.ru>
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

27.11.2024 09:04, Michael Tokarev via samba-technical wrote:
> 27.11.2024 08:26, Andrew Bartlett via samba-technical wrote:
>> On Wed, 2024-11-27 at 08:12 +0300, Michael Tokarev via samba-technical
> ...>> But my attempt were unsuccessful so far, as it turned out.
>>>
>>> Once I arrange to build all 3 libs out of samba, the build system
>>> suddenly stops embedding rpath-private into all binaries, so the
>>> resulting thing, while having the same set of files, actually does
>>> not work, - not finding samba private libraries in libdir/samba.
>>> I'm investigating it now, - but again, the build system is just too
>>> complex and very difficult to debug, so it might take some time.
>>> It's something I didn't expect at all, as all other changes are
>>> rather simple.
>>
>> That is why I'm suggesting looking at what I did for ldb, and trying to
>> make that more general, because we worked on some of those details.
> 
> This issue at hand has nothing to do with the actual way to build
> libtdb &Co.  It's just a consequence of too complex build system.
> 
> Here's what I've found, using param.cpython as a starting point:
> 
> $ fgrep param.cpython build.* | grep rpath
> build.bad:runner [..samba/samba3/param.cpython-312-x86_64-linux-gnu.so..
> build.good:runner [..samba/param.cpython-312-x86_64-linux-gnu.so..
> build.good:runner [..samba/samba3/param.cpython-312-x86_64-linux-gnu.so..
> 
> as we can see, param.cpython-312.. is missing in the 'bad' case, -
> it is built without private rpath.
> 
> Looking at the definition of param.cpython, in source3/samba/wscript_build:
> 
> bld.SAMBA3_SUBSYSTEM(pyparam_util,
>                  source='pyparam_util.c',
>                  deps='%s samba-hostconfig %s' % (libpython, pytalloc_util),
>                  pyext=True,
>                  enabled=bld.PYTHON_BUILD_IS_ENABLED()
>                  )

That should've been source4/param/wscript_build ofc.

I found my issue with missing rpath.

It was --disable-rpath --disable-rpath-install configure option which were
here for a very long time, since this commit:

commit 28093211cd7d03eed70958d188ad4aac7d75d30b
Author: Andrew Bartlett <abartlet@samba.org>
Date:   Fri May 3 20:48:41 2013 +1200

     The remainder of the patch to merge with the samba4 package

which, I guess, just copied these options from samba3 packaging.

As the result, only binaries (shared objects and executables) which
are especially built for installing (for `make install`) received
the extra rpath.  While binaries which were built just once - for
either installing or using directly, when they're the same - did
not receive rpath.  And by turning off last 'external' library into
bundled one, many internal libs has become the same be it for use
locally or for install.  And had lost the rpath thing.

It needed all 3 - tdb, tevent, and talloc - to be built from source
to trigger this one.  In my case, talloc happen to be last so it was
talloc which triggered it.

I removed --disable-rpath --disable-rpath-install and now everything
is in order.

It took me quite some time to figure this out.

Again, the build system is just too complex, I think.  Usually there's
no need to build two versions of binaries, one set for local use and
another for installing, - I think no other build system does this.

/mjt

