Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E7D81621CE9
	for <lists+samba-technical@lfdr.de>; Tue,  8 Nov 2022 20:19:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=kOU35lD7rw/HPvrMSZ/qy1zgUygfOLoCDsc7iMeDTNA=; b=FlLlGXeKCltu4FSWrnxc4IQfg8
	eCzq2nV5jMgW7/TKH6AqvKdDrmlGpLVN5AehJOT+/9W81Mipi9d/kdaDHYcXyNKNlz44XSgHcKUsc
	OvKcOHAtRkinJt4DB7EERombeLXSaY6q3k85htwzPDkuZRgBdR1kIbd78mEcT/Qcv0JcTXOvR1Gmz
	zzRHBchj8+a4Oay7okbDdq8nItZ6t0uFOBYectB0E5LgPbQa3funN4IFasFCRKvyel4+ZmWZrHnvK
	UJZiOi/dikx0O421ILZGrKXCmbSQQIZQOT8CBvTYsxUkjykCus4b2P/ssMh8isfdcnqk1rm8uAGMJ
	lUGsJJrQ==;
Received: from ip6-localhost ([::1]:26350 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1osU7b-00BcLJ-Hi; Tue, 08 Nov 2022 19:18:55 +0000
Received: from isrv.corpit.ru ([86.62.121.231]:41927) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1osU7W-00BcLA-SM
 for samba-technical@lists.samba.org; Tue, 08 Nov 2022 19:18:53 +0000
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id C8C1940142;
 Tue,  8 Nov 2022 22:18:48 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id 2534330C;
 Tue,  8 Nov 2022 22:18:53 +0300 (MSK)
Message-ID: <82a3df48-69ce-fe1d-1c7b-4deabc323eae@msgid.tls.msk.ru>
Date: Tue, 8 Nov 2022 22:18:47 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: samba does not work with liburing 2.3
Content-Language: en-US
To: Ammar Faizi <ammarfaizi2@gnuweeb.org>, Stefan Metzmacher <metze@samba.org>
References: <5a3d3b11-0858-e85f-e381-943263a92202@msgid.tls.msk.ru>
 <df789124-d596-cec3-1ca0-cdebf7b823da@msgid.tls.msk.ru>
 <6dde692a-145f-63bd-95bd-1eb1c1b108ce@samba.org>
 <6360ecfb-8f71-72c5-d903-f7d1531a1f6d@gnuweeb.org>
In-Reply-To: <6360ecfb-8f71-72c5-d903-f7d1531a1f6d@gnuweeb.org>
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
Cc: Samba Technical Mailing List <samba-technical@lists.samba.org>,
 io-uring Mailing List <io-uring@vger.kernel.org>,
 Caleb Sander <csander@purestorage.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

08.11.2022 16:43, Ammar Faizi wrote:
> 
> + Adding Caleb Sander <csander@purestorage.com> to the CC list.
> 
> On 11/8/22 8:26 PM, Stefan Metzmacher wrote:
>> Am 08.11.22 um 13:56 schrieb Michael Tokarev via samba-technical:
>>> 08.11.2022 13:25, Michael Tokarev via samba-technical wrote:
>>>> FWIW, samba built against the relatively new liburing-2.3 does not
>>>> work right, io_uring-enabled samba just times out in various i/o
>>>> operations (eg from smbclient) when liburing used at compile time
>>>> was 2.3. It works fine with liburing 2.2.
>>>
>>> This turned out to be debian packaging issue, but it might affect
>>> others too. liburing 2.3 breaks ABI by changing layout of the main
>>> struct io_uring object in a significant way.
>>>
>>> http://bugs.debian.org/1023654
>>
>> I don't see where this changes the struct size:
>>
>> -       unsigned pad[4];
>> +       unsigned ring_mask;
>> +       unsigned ring_entries;
>> +
>> +       unsigned pad[2];
>>
>> But I see a problem when you compile against 2.3 and run against 2.2
>> as the new values are not filled.
>>
>> The problem is the mixture of inline and non-inline functions...
>>
>> The packaging should make sure it requires the version is build against...

As has been pointed out before, this is an issue with debian packaging of
liburing.

2.3 actually appears to be backwards-compatible with previous 2.2, in other
words, programs compiled with 2.2 will continue to work after liburing is
upgraded to 2.3  - at least it *seems* to be the case, which is might be not
what I initially wrote.

The problem happens when you compile a program against liburing 2.3, and
try to run it against the previous liburing-2.2, in other words, going
backwards at runtime.

In order to ensure we have "sufficiently new" library at runtime, there
are package dependencies, - all package managers have them in one way
or another.  Usually it is done by having a table with symbol names
and library versions where/when each symbol appeared, so if a program
uses symbol foo which first appeared in version 1.2 of library lib,
this program is marked as Depends: lib >= 1.2.

But in this case, the symbols are all the same (not counting really new
symbols which actually appeared in 2.3 for the first time).  Yet, the
interface changed somehow for the *newly* compiled programs. In other
words, once a program is compiled against liburing 2.3, it will need
a >=2.3 version of liburing, even if the same symbol it uses first
appeared in earlier version.

This is not something which happens often.  To remedy (assuming the
new lib is really binary compatible with programs compiled with the
old version), Debian needs to change the symbol-version table to list
2.3 version for all symbols, not just for the newly-appeared symbols, -
this way, even if the symbols itself isn't really new, but the newly
compiled program require a more recent version of the interface and
wont work with older symbols of the same name.

This is because of the inline wrappers which gets compiled into the
program, who expects the new struct layout, while the old lib only
provides old layout.

While the new lib works with either layout, so will - hopefully -
work with the now-deprecated structure members too, the same way
it was worked before.

The situation here is rather unusual, and I guess it's rare enough
so that all involved parties were prepared for it. It's easy to
solve at the downstream packaging step, but this has to be done.

It has nothing to do with samba, but with proper packaging of
liburing which - in this case - needs a bit of extra care.

Thanks,

/mjt

