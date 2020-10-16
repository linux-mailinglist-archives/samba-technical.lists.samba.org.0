Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 23D0F290C71
	for <lists+samba-technical@lfdr.de>; Fri, 16 Oct 2020 21:51:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Date:Subject:cc;
	bh=kLnFQiRt9t32v1EffrmVdjWX89NglKK2jfydbi0iFgI=; b=X0meq1bYa9PGXsd19kW2L5x1XP
	Y1GmRMZ+Wjpe68G9ENaeQEglKjAFo23xtaEwtWEQ0Z3Qxf4+8EYm9qdMxUaUDiLAIULvKQQzPE4dF
	apps682Uit2lH118IY16c02OaxcGwkmxRt/1a/PdL4VwOibs/Pw9F9nsYhcQ/Nm7/TARACJz+V4zc
	aMv+6QEKiOH+mUS93hJUHNzob8HBsGdkYphPH81tgmgyHXbv0XFVEH0oAbSGblpmf26QzyQbKanOA
	Ln/GKx6f2eB6y7Xxf/4rguCznqlWdwVM+EOP2POV/Kh5BpobOi0Rt1BzmhNpWUozswgz755lfjWDH
	Rn3k5AJw==;
Received: from ip6-localhost ([::1]:59166 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kTVlV-00CRgR-MZ; Fri, 16 Oct 2020 19:51:49 +0000
Received: from mail.networkradius.com ([62.210.147.122]:58361) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kTVlQ-00CRgJ-Lv
 for samba-technical@lists.samba.org; Fri, 16 Oct 2020 19:51:46 +0000
Received: from [10.0.105.81] (unknown [189.195.128.226])
 by mail.networkradius.com (Postfix) with ESMTPSA id 6868B4A2
 for <samba-technical@lists.samba.org>; Fri, 16 Oct 2020 19:51:41 +0000 (UTC)
Authentication-Results: NetworkRADIUS; dmarc=none (p=none dis=none)
 header.from=freeradius.org
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.4\))
Subject: Re: talloc: talloc_set_memlimit causes all reallocs to fail when used
 on pools.   talloc_set_memlimit not enforced correctly on pools.
Date: Fri, 16 Oct 2020 14:51:39 -0500
References: <DA0D6B87-BA18-41EA-8ACE-E431841902FE@freeradius.org>
 <20201016194436.GD67086@jeremy-acer>
To: samba-technical@lists.samba.org
In-Reply-To: <20201016194436.GD67086@jeremy-acer>
Message-Id: <2B2DBDAF-26F4-4FF4-A2A6-A194F507A352@freeradius.org>
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



> On Oct 16, 2020, at 2:44 PM, Jeremy Allison <jra@samba.org> wrote:
>=20
> On Fri, Oct 16, 2020 at 01:59:11PM -0500, Arran Cudbard-Bell via =
samba-technical wrote:
>> Reviewing the talloc code shows provisions (and test cases) for =
applying memlimits to pools, unfortunately in practice, memlimit =
functionality on pools seems fairly broken.
>>=20
>> #include <talloc.h>
>> #include <stdio.h>
>>=20
>> int main(int argc, char **argv)
>> {
>>       TALLOC_CTX *pool =3D talloc_pool(NULL, 1024);
>>       TALLOC_CTX *chunk, *fail_chunk;
>>=20
>>       if (pool) {
>>               printf("Pool allocated\n");
>>       } else {
>>               printf("Pool allocation failed\n");
>>       }
>>=20
>>       if (talloc_set_memlimit(pool, 512) < 0) {
>>               printf("talloc_set_memlimit failed\n");
>>       } else {
>>              printf("talloc_set_memlimit success\n");
>>       }
>=20
> OK, looking at this more closely, I think this is
> a fundemental misunderstanding of what a talloc_pool
> is.
>=20
> A talloc_pool() is pre-allocated memory, that can
> then be further divided without having to call
> into malloc.

Yes, we use them for slab allocation and for creating read only regions =
of memory with mprotect.  We have a special wrapper that ensures the =
first child allocated in the pool is page aligned.

When we do this, we don't want to allow allocations to occur outside of =
the pool so set a memlimit on the pool.  I know this is a really weird =
use case, but it's ended up being quite a useful debugging tool.

> It's ALREADY allocated memory, so setting a memlimit size
> smaller than the pool size makes no sense - once you've
> done that all allocations should fail.

In addition to preventing allocations outside of the pool, It would =
still be useful to be able to apply limits to pools so that a pool =
passed into a function cannot be entirely consumed by allocations by =
that function. i.e. if you want to reserve some space in the pool.

-Arran


