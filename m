Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 82EFE290C92
	for <lists+samba-technical@lfdr.de>; Fri, 16 Oct 2020 22:05:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Date:Subject:cc;
	bh=96yPuOZpDh32vkTICgVF3X7elfrbjFeox46Ht6stctg=; b=B/PH/GdWWGDt5RyL513POADfvy
	EOP3KKFWiRR4VXbKQX3T6Eb9jZ/LASclMFcASQi7z0/1VjhWW6PDq3H6qSH/ZknwpfoycFTzWoQJg
	z9iBHPRjxvMXXukYLnes1Xn0SAj6R4CE9pTks7VRVk6TH5NWh1Jd0+3ZFBboDzZR7GpZZpiogBOdf
	tfue8YL6SARvMa10HhppXNu01qZk7GVPo6dFkPufuWmoSU7nq668LhnflLSSh+30LQ25HB15TpkMn
	UlzJYGIYiR6ejg7gvJCO50WWf6yHjhmyfx24FFceUz5VlgDmsDWG1jaOjMvvOimPVKzC5hs23EAGH
	ytVP3OKg==;
Received: from ip6-localhost ([::1]:60612 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kTVy4-00CRv4-Dm; Fri, 16 Oct 2020 20:04:48 +0000
Received: from mail.networkradius.com ([62.210.147.122]:51052) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kTVxz-00CRux-PA
 for samba-technical@lists.samba.org; Fri, 16 Oct 2020 20:04:45 +0000
Received: from [10.0.105.81] (unknown [189.195.128.226])
 by mail.networkradius.com (Postfix) with ESMTPSA id 95E5F192
 for <samba-technical@lists.samba.org>; Fri, 16 Oct 2020 20:04:38 +0000 (UTC)
Authentication-Results: NetworkRADIUS; dmarc=none (p=none dis=none)
 header.from=freeradius.org
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.4\))
Subject: Re: talloc: talloc_set_memlimit causes all reallocs to fail when used
 on pools.   talloc_set_memlimit not enforced correctly on pools.
Date: Fri, 16 Oct 2020 15:04:36 -0500
References: <DA0D6B87-BA18-41EA-8ACE-E431841902FE@freeradius.org>
 <20201016194436.GD67086@jeremy-acer>
 <2B2DBDAF-26F4-4FF4-A2A6-A194F507A352@freeradius.org>
To: samba-technical@lists.samba.org
In-Reply-To: <2B2DBDAF-26F4-4FF4-A2A6-A194F507A352@freeradius.org>
Message-Id: <E2A6FEEF-3C46-43A6-818C-D226924EB9F7@freeradius.org>
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
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>



> On Oct 16, 2020, at 2:51 PM, Arran Cudbard-Bell via samba-technical =
<samba-technical@lists.samba.org> wrote:
>=20
>=20
>=20
>> On Oct 16, 2020, at 2:44 PM, Jeremy Allison <jra@samba.org> wrote:
>>=20
>> On Fri, Oct 16, 2020 at 01:59:11PM -0500, Arran Cudbard-Bell via =
samba-technical wrote:
>>> Reviewing the talloc code shows provisions (and test cases) for =
applying memlimits to pools, unfortunately in practice, memlimit =
functionality on pools seems fairly broken.
>>>=20
>>> #include <talloc.h>
>>> #include <stdio.h>
>>>=20
>>> int main(int argc, char **argv)
>>> {
>>>      TALLOC_CTX *pool =3D talloc_pool(NULL, 1024);
>>>      TALLOC_CTX *chunk, *fail_chunk;
>>>=20
>>>      if (pool) {
>>>              printf("Pool allocated\n");
>>>      } else {
>>>              printf("Pool allocation failed\n");
>>>      }
>>>=20
>>>      if (talloc_set_memlimit(pool, 512) < 0) {
>>>              printf("talloc_set_memlimit failed\n");
>>>      } else {
>>>             printf("talloc_set_memlimit success\n");
>>>      }
>>=20
>> OK, looking at this more closely, I think this is
>> a fundemental misunderstanding of what a talloc_pool
>> is.
>>=20
>> A talloc_pool() is pre-allocated memory, that can
>> then be further divided without having to call
>> into malloc.
>=20
> Yes, we use them for slab allocation and for creating read only =
regions of memory with mprotect.  We have a special wrapper that ensures =
the first child allocated in the pool is page aligned.
>=20
> When we do this, we don't want to allow allocations to occur outside =
of the pool so set a memlimit on the pool.  I know this is a really =
weird use case, but it's ended up being quite a useful debugging tool.
>=20
>> It's ALREADY allocated memory, so setting a memlimit size
>> smaller than the pool size makes no sense - once you've
>> done that all allocations should fail.
>=20
> In addition to preventing allocations outside of the pool, It would =
still be useful to be able to apply limits to pools so that a pool =
passed into a function cannot be entirely consumed by allocations by =
that function. i.e. if you want to reserve some space in the pool.

As for what the semantics should be, I was thinking that, yes, a pool in =
its entirety should be included in the memlimit calculation of its =
parent chunk, but if a memlimit is set on a pool directly, only the =
memory used by the children should be included in the memlimit check.  I =
didn't get far enough into the code to see how many assumptions would be =
broken by this.

An alternative that'd still satisfy our immediate need would be to have =
talloc_set_memlimit simply fail when someone tried to apply it to a pool =
(as you suggested), and add an optional flag that'd prevent allocations =
from occurring outside of the pool.

-Arran



