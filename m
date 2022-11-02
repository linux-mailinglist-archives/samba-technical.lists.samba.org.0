Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id BC027616876
	for <lists+samba-technical@lfdr.de>; Wed,  2 Nov 2022 17:22:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=t+i7TTCdIaybad+gLaQoDjwuknptaCT/aeH7Tsd7nG8=; b=sqE1TAwFAdT1/J8T4rhoxRcDfY
	JDsLUTT0nftxEJ4ZAMOYBu+bb1UCSQgsq3t3FqZqCqtqVBQndTZAIp0IPIISDopuhnd8GCD5fjY07
	yJ8g2xvftvl5Sfd9qMBVcimCJ9IaigMvQ3sOuiFsMMx70a1AAl2iYjqtzMPoFG9ftYVLVh9H7ZV9l
	QUKALlAHksxhyOrSc4Z6e7kN01NC2cm9yn5DXuw2x1EiiJ2wpIePqxhjaI4G2ptzhmj5JM6ON5Me+
	ifQS5YpfxAKbwCwwlxa3kfBn+BKfWXHxL5KIqfSiUMQQ7AhzJyGy6VKrCh+8kOJ1YAdAw1zYhFo9D
	bduNCnZw==;
Received: from ip6-localhost ([::1]:31326 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1oqGUx-00A4Pl-G2; Wed, 02 Nov 2022 16:21:51 +0000
Received: from isrv.corpit.ru ([86.62.121.231]:48705) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1oqGUs-00A4Pc-RL
 for samba-technical@lists.samba.org; Wed, 02 Nov 2022 16:21:49 +0000
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id A784A4049A;
 Wed,  2 Nov 2022 19:21:44 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id 6E5163D3;
 Wed,  2 Nov 2022 19:21:48 +0300 (MSK)
Message-ID: <1533a6b5-1795-919a-4fa5-14636e0dcebe@msgid.tls.msk.ru>
Date: Wed, 2 Nov 2022 19:21:43 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: omitting SONAMEs for plugins?
Content-Language: en-US
To: Stefan Metzmacher <metze@samba.org>, samba-technical@lists.samba.org
References: <13f38497-ad24-254f-68d8-0a3c66da04c0@msgid.tls.msk.ru>
 <825cbe37-9d71-85aa-b0d0-2518e452e31a@samba.org>
In-Reply-To: <825cbe37-9d71-85aa-b0d0-2518e452e31a@samba.org>
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

02.11.2022 18:37, Stefan Metzmacher via samba-technical wrote:
> Am 31.10.22 um 10:22 schrieb Michael Tokarev via samba-technical:
>> Hi!
>>
>> What's different between a shared library and a plugin is that
>> a plugin does not have a SONAME, while a library should have
>> one.
>>
>> When samba is built, SONAME is added to all shared objects, be
>> it a library or a plugin.
>>
>> I'm not familiar with waf (and with python) enough to understand
>> how the final link command is constructed, the thing is quite
>> a bit complicated there, with multiple layers and multiple
>> operating systems and linkers support.
>>
>> Is there a way to omit the SONAME field for plugins?
> 
> We have SAMBA_PLUGIN() instead of SAMBA_LIBRARY() and SAMBA_MODULE()

Yes, I've seen SAMBA_PLUGIN(). It is not used for stuff like /usr/lib/samba/vfs/*.so,
/usr/lib/samba/ldb/*.so, /usr/lib/samba/idmap/*.so and so on, which are
plugins. It's used for pam and nss stuff only.

But it is not what I asked. SAMBA_PLUGIN does provide SONAME at the link
time, for example here's how pam_winbind is being linked:

'/usr/lib/ccache/gcc', '-Wl,--as-needed', '-Wl,-h,pam_winbind.so', \
    '-shared',... '-o/<<PKGBUILDDIR>>/bin/default/nsswitch/lib_plugin_pamwinbind.inst.so'...

Note -Wl,-h,pam_winbind.so : this is the SONAME in the shared library.

What I asked was whenever it is possible to _omit_ this -Wl,-h for all
samba plugins.  So far I haven't found a way to omit this -Wl,-h for
certain dynamically linked objects.

Why.

Well, the thing is somewhat interesting.

Debian has a tool, dpkg-shlibdeps, which tries to find packages where
each referenced-by-an-executable symbol is located. For that it checks
for all UNDEFINED symbols in all libraries this executable is linked
with.

For many samba internal libraries it dumps quite a lot of warnings -
"symbol SYM used by libsamba-LIB.so found in none of its libraries".
For example:

  symbol find_domain_from_name used by \
    debian/winbind/usr/lib/x86_64-linux-gnu/samba/libidmap-samba4.so.0 \
    found in none of the libraries

This is actually a build system bug, a missing dependency information
between internal samba libraries.  I guess this can and should be
fixed, but keeping this info in wscripts up to date is rather
difficult (maybe some automatic tool can be used for this).  This is
not a problem in practice because all executables linked with that
library are *also* linked with their dependencies already, so at ld.so
is able to resolve all symbols. But it works just by a chance, because
it so *happens* all the executable loads all the required libraries
already.

But there are many plugns too. Which *might* have unresolved symbols,
which are provided by the executable which load them.  And it is
interesting whenever samba have such plugins to begin with, - I guess
most of them should *not* use any application-provided symbols, except
maybe the vfs modules (which are loaded by smbd only, hopefully anyway).

So it looks like my question is moot. A better question would be what
to do with such libraries which lack dependencies. There are many of
them.  Omitting some -Wl,-no-undefined reveals them nicely, but it
is, again, difficult to distinguish where this should be used and where
it shouldn't.

Why the plugin context popped up is because this same Debian tool,
dpkg-shlibdeps, omits these warnings for shared objects with no
SONAME field, which is the only sane way to distinguish a plugin
from a regular shared library.

Thanks!

/mjt

