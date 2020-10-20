Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A86202933E2
	for <lists+samba-technical@lfdr.de>; Tue, 20 Oct 2020 06:18:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Date:Subject;
	bh=jVIUL0lsT2ASzd1Up9R4Zweu2pB26PLbPVjUmb/VXv8=; b=gMLIWPlDhghUvl5RoWW1iDrbS2
	qLYOrD5CmKh+Ypdb1VKQDdjWVRIA0BrjzW8yud8bMTpBpraG30+Pd39SKC2DdWfQqjQ7PqZJ2k9Z8
	2E+Ha19OeO1u8uuCU36RyazPRE97MvHoMtPOzmWl0SDHy9g4r9WAsPLbwJyjE2IGmrGMnmjUJ/POS
	cjnRkGCN2x81LT1I0gjNWkHbL0KXKHeO6VUBSX8loPkt8ht8Tkg5K9OBKf3auaTu0HMUllZXJAVd0
	HtzimWA2R1YINyBUOhFC9AC/O/F5H8NEhYiu1x9QoQlKNm5Q6S3/ApEsEkApdbYCy4L0KnsYx1dut
	qDNNTXsA==;
Received: from ip6-localhost ([::1]:23350 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kUj5j-00CnCo-6x; Tue, 20 Oct 2020 04:17:43 +0000
Received: from mail.networkradius.com ([62.210.147.122]:58291) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kUj5d-00CnCh-2u
 for samba-technical@lists.samba.org; Tue, 20 Oct 2020 04:17:40 +0000
Received: from [192.168.1.100] (unknown [200.68.138.36])
 by mail.networkradius.com (Postfix) with ESMTPSA id 6C67010D;
 Tue, 20 Oct 2020 04:17:32 +0000 (UTC)
Authentication-Results: NetworkRADIUS; dmarc=none (p=none dis=none)
 header.from=freeradius.org
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.4\))
Subject: Re: talloc: talloc_set_memlimit causes all reallocs to fail when used
 on pools.   talloc_set_memlimit not enforced correctly on pools.
In-Reply-To: <20201020035308.GA601524@jeremy-acer>
Date: Mon, 19 Oct 2020 23:17:29 -0500
Content-Transfer-Encoding: quoted-printable
Message-Id: <2F0B2708-7AC6-4FF5-99FA-8D4B8F1BAB2E@freeradius.org>
References: <DA0D6B87-BA18-41EA-8ACE-E431841902FE@freeradius.org>
 <20201016194436.GD67086@jeremy-acer>
 <2B2DBDAF-26F4-4FF4-A2A6-A194F507A352@freeradius.org>
 <E2A6FEEF-3C46-43A6-818C-D226924EB9F7@freeradius.org>
 <20201016202528.GF67086@jeremy-acer>
 <E75C5FB4-2800-498A-868B-7F3A3CB4E802@freeradius.org>
 <20201020020246.GB564927@jeremy-acer> <20201020035308.GA601524@jeremy-acer>
To: Jeremy Allison <jra@samba.org>
X-Mailer: Apple Mail (2.3608.120.23.2.4)
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
From: Arran Cudbard-Bell via samba-technical <samba-technical@lists.samba.org>
Reply-To: Arran Cudbard-Bell <a.cudbardb@freeradius.org>
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>



> On Oct 19, 2020, at 10:53 PM, Jeremy Allison <jra@samba.org> wrote:
>=20
> On Mon, Oct 19, 2020 at 07:02:46PM -0700, Jeremy Allison via =
samba-technical wrote:
>> On Fri, Oct 16, 2020 at 07:52:48PM -0500, Arran Cudbard-Bell via =
samba-technical wrote:
>>>=20
>>>>> An alternative that'd still satisfy our immediate need would be to =
have talloc_set_memlimit simply fail when someone tried to apply it to a =
pool (as you suggested), and add an optional flag that'd prevent =
allocations from occurring outside of the pool.
>>>>=20
>>>> Please wrap your responses to 80 columns :-). Makes
>>>> quoting your replies really hard :-).
>>>=20
>>> Will do :)
>>>=20
>>>>=20
>>>> What you're asking for is more complexity in an
>>>> already overly complex part of the code (which
>>>> to be honest I wasn't even sure people were
>>>> using :-).
>>>>=20
>>>> I think you can do what you need by allocating
>>>> a pool as a talloc child of a context, and setting
>>>> the memlimit on the that context.
>>>=20
>>> I just tried this and it didn't work, the reallocs still fail.
>>>=20
>>> This is likely because the limit needs to be the size of the pool =
plus=20
>>> headers.  I don't believe there's any way for the caller to know the =
size
>>> of these headers, but maybe you know better :)
>>>=20
>>> talloc_get_size() returns 0 when called on the ctx or the pool as =
the
>>> docs suggest it should.
>>>=20
>>> Do you have any idea how I could determine the correct value to
>>> pass to talloc_set_memlimit?
>>>=20
>>> -Arran
>>=20
>> I think it's a bug. If you can rebuild talloc can you
>> check with this (not well tested yet :-) patch ?
>>=20
>> I'm planning to add regression tests around this.
>>=20
>> With this patch talloc_memlimits on pools should
>> work.
>=20
> Slightly better version that does the size accounting
> correctly in the 'can't allocate from existing pool'
> case.

Much appreciated!  I'll try this out tomorrow.

Just so I'm clear on the expected behaviour, could
you verify that these assumptions are correct:

1. If there's a 1024 byte pool, with a 2048 byte memlimit,
the amount of memory allocated outside of the pool would=20
be limited to 1024 bytes.

2. If there's a 1024 byte pool, with a 1024 byte memlimit,
any alloc or realloc up to the pool size would succeed,
but any alloc or realloc which'd result in a chunk being
allocated outside of pool memory would fail.

3. If there's a 1024 byte pool, with a 512 byte memlimit,
the memlimit would cause all reallocs and allocs to
fail, because the pool size is already greater than the
memlimit.

Additionally, if the third assumption is correct, do you=20
see any value in instead having talloc_set_memlimit=20
fail if a caller specifies a memlimit smaller than the pool?

Many Thanks,
-Arran=

