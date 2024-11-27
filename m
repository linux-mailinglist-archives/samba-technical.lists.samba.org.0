Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id F08479DAA00
	for <lists+samba-technical@lfdr.de>; Wed, 27 Nov 2024 15:41:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=6+pgELesjfMlKbinVnF/IxIFBUYXFVsGgZwzA8JA39U=; b=O9IJYMQgDgQggpJpOuB5r8phk5
	eI6xS+1QVbOpgojnyYHHbhtdsRkibC0N2jLb+gd4T+91gAsAFh4GDxxszM4zqIg+ihf75MdYRjpe1
	xdgo01TGZ/1WETqZRj+ggsY7j/AKAPivtIvIJyHvcP04y0xq1XftUhd+VxH9TwNwwMs7K0pAg3FcY
	VbLs03pkfG5ZAspnj4j2llSRVGsoUg9d3eZ4a+cAQK8bLbYNxkqaQeONi1hN9sjBHGEZ+6+Fv2C0f
	OBE8dxjqzQy9mak1hYIahfwwspXf4QASQ/GcBWOZuBl1YxfPHFBL75Y56u1sSO/mUuanzvvv9i5vm
	QJ7q9+4A==;
Received: from ip6-localhost ([::1]:46352 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1tGJEW-000zJN-OR; Wed, 27 Nov 2024 14:41:36 +0000
Received: from isrv.corpit.ru ([86.62.121.231]:41117) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1tGJER-000zJG-Hu
 for samba-technical@lists.samba.org; Wed, 27 Nov 2024 14:41:34 +0000
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 0BC7DB593D;
 Wed, 27 Nov 2024 17:41:11 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id 8060517B88F;
 Wed, 27 Nov 2024 17:41:28 +0300 (MSK)
Message-ID: <0bfa6d1e-9f7a-4861-9d8a-92474b515029@tls.msk.ru>
Date: Wed, 27 Nov 2024 17:41:28 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [debian] building bundled talloc/tevent/tdb libs out of main
 samba sources
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
> wrote:
>> 26.11.2024 23:49, Andrew Bartlett via samba-technical wrote:
>>> On Tue, 2024-11-26 at 21:39 +0300, Michael Tokarev via samba-
>>> technical
>>> wrote:
>>>> Hi!
>>>> After a few times dealing with incompatibilities of older
>>>> talloc/tevent/tdblibs with new samba and shipping stuff for
>>>> debian
>>>> backports and other olderdistributions, I decided to give it a
>>>> try:
>>>> to build these 3 bundled libs outof samba source, without using
>>>> separate tarballs (which also lacks githistory).
>>>> The result is rather simple, speaking for the packaging it's
>>>> available at
>>>> https://salsa.debian.org/samba-team/samba/-/merge_requests/64
>>>>   - 3
>>>> commitsimporting packaging for tdb, tevent and talloc libs, one
>>>> by
>>>> one.
>>>
>>> I support this idea.
>>>
>>> Rather than needing to patch the wscript files, have you tried:
>>>
>>> --private-library=!tdb
>>> My intention (but I didn't do any testing with the other libraries)
>>> was
>>> to try and have this as generic as possible, pulling any library in
>>> or
>>> out if needed, with only the default position being encoded in the
>>> source, to help with this kind of thing.
>>
>> Unfortunately this option does nothing for this kind of libraries.
>> This is exactly why we had to patch ldb in debian before (when
>> switched to building ldb from samba sources), in exactly the same
>> way as I'm patching tdb/etc now.  And this is exactly what you
>> did with ldb too, in de1ab855ee2 "lib/ldb: Always build standalone".
>>
>> Without patching lib/tdb/wscript, it is always built as libsamba-
>> private-tdb.so,
>> with no headers installed.
>>
>> Please note that currently, --private-libraries=!ldb does exactly
>> nothing to the result - ldb is built as a regular public samba
>> library,
>> by default already. --private-libraries=ldb however, disables this
>> "publicity", and builds ldb as libprivate-samba-ldb.so (with no ldb.h
>> installed), - it looks like 4.21.0 WHATSNEWS.txt entry about !ldb is
>> wrong.

And here it is me who's wrong.  I did just a lot of rebuilds of the
things trying to figure out the missing rpath thing, and mixed things
up.  No, --private-libraries=!ldb is required to produce separate
libldb instead of building it as samba-private-ldb - exactly as stated
in WHATSNEW.txt.  I stand corrected, please excuse me for the noise.


> That's how far back the suggestions to do this went.  I was involved in
> suggesting this, and encouraged the effort.  It took some years to gain
> consensus within the Samba Team on the approach, and then time to implement it in a way I was happy to propose upstream.  And yet it seems from the above that for ldb it still has edge cases.  Sorry about that.

No, it was an (interpretation) error on my part, -
things seems to be ok wrt libldb.


> That is why I'm suggesting looking at what I did for ldb, and trying to
> make that more general, because we worked on some of those details.
> 
> Perhaps try what I suggested and your patch?  If you mark the library
> public, it should start to do the right things.  I hope.

Take a look at lib/talloc/wscript or other two.
It has direct assignment:

   conf.env.standalone_talloc = conf.IN_LAUNCH_DIR()

(which becomes true only if we're not in a subdir like lib/talloc but
in the root dir of the source).

And later, omitting details:

     if bld.env.standalone_talloc:
         private_library = False
     else:
         private_library = True

         bld.SAMBA_LIBRARY('talloc',
                           'talloc.c',
                           deps='replace',
                           provide_builtin_linking=True,
                           abi_directory='ABI',
                           abi_match='talloc* _talloc*',
                           hide_symbols=True,
                           vnum=VERSION,
                           public_headers=('' if private_library else 'talloc.h'),
                           pc_files='talloc.pc',
                           public_headers_install=not private_library,
                           private_library=private_library,
                           manpages='man/talloc.3')

In short: the code only adds properties for the library
(headers, linking, etc) if the library is being built in
the root of the source tree.  At least this is how I read
it.  And no amount of tweaking list of private libs down
the road will help without the missing properties.

/mjt


