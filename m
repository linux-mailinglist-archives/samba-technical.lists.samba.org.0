Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B3CC290E65
	for <lists+samba-technical@lfdr.de>; Sat, 17 Oct 2020 02:53:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Date:Subject:cc;
	bh=QGEADu2e0uKbPufFy+VRwpvqDOLZCrITl3iZR5O/0A8=; b=fFeelN2UvkJeaiWeSHxIbMHqli
	1kj/pT0TPhgihgeUlESAF9xeeDm8AOxN4mU8nGDtx9jSeVD68bbTEK2pGjeRVO9mco8UfRKrn4Fww
	nOx2KK/K9uPksnd/QXm8fDLlVYjrE0GJteAs3RFl6YHcgulAepHOoq9BHNxVhFIOf0Ng0aZLr+iKd
	6zL8kocnXF/BmBBv/mjx+85prLHh2TKSmjmc6yNxPD8Nx0UBcHR9uAZbx+VNyj/1MdatTilWYHe3I
	yfSJq4vyLf7y1klmMQYtjdr+L3rJtOhKKhN2KbbCUhleMcJPFS9lkyfs9prZPmQkZrB2aZHGcjQu2
	kfkf2eTQ==;
Received: from ip6-localhost ([::1]:24432 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kTaSz-00CTsW-SR; Sat, 17 Oct 2020 00:53:01 +0000
Received: from mail.networkradius.com ([62.210.147.122]:50706) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kTaSt-00CTsM-JI
 for samba-technical@lists.samba.org; Sat, 17 Oct 2020 00:52:58 +0000
Received: from [10.0.105.81] (unknown [189.195.128.226])
 by mail.networkradius.com (Postfix) with ESMTPSA id 576C14A2
 for <samba-technical@lists.samba.org>; Sat, 17 Oct 2020 00:52:50 +0000 (UTC)
Authentication-Results: NetworkRADIUS; dmarc=none (p=none dis=none)
 header.from=freeradius.org
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.4\))
Subject: Re: talloc: talloc_set_memlimit causes all reallocs to fail when used
 on pools.   talloc_set_memlimit not enforced correctly on pools.
Date: Fri, 16 Oct 2020 19:52:48 -0500
References: <DA0D6B87-BA18-41EA-8ACE-E431841902FE@freeradius.org>
 <20201016194436.GD67086@jeremy-acer>
 <2B2DBDAF-26F4-4FF4-A2A6-A194F507A352@freeradius.org>
 <E2A6FEEF-3C46-43A6-818C-D226924EB9F7@freeradius.org>
 <20201016202528.GF67086@jeremy-acer>
To: samba-technical@lists.samba.org
In-Reply-To: <20201016202528.GF67086@jeremy-acer>
Message-Id: <E75C5FB4-2800-498A-868B-7F3A3CB4E802@freeradius.org>
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


>> An alternative that'd still satisfy our immediate need would be to =
have talloc_set_memlimit simply fail when someone tried to apply it to a =
pool (as you suggested), and add an optional flag that'd prevent =
allocations from occurring outside of the pool.
>=20
> Please wrap your responses to 80 columns :-). Makes
> quoting your replies really hard :-).

Will do :)

>=20
> What you're asking for is more complexity in an
> already overly complex part of the code (which
> to be honest I wasn't even sure people were
> using :-).
>=20
> I think you can do what you need by allocating
> a pool as a talloc child of a context, and setting
> the memlimit on the that context.

I just tried this and it didn't work, the reallocs still fail.

This is likely because the limit needs to be the size of the pool plus=20=

headers.  I don't believe there's any way for the caller to know the =
size
of these headers, but maybe you know better :)

talloc_get_size() returns 0 when called on the ctx or the pool as the
docs suggest it should.

Do you have any idea how I could determine the correct value to
pass to talloc_set_memlimit?

-Arran

#include <talloc.h>
#include <stdio.h>

int main(int argc, char **argv)
{
        TALLOC_CTX *outer =3D talloc_init("test");
        TALLOC_CTX *pool =3D talloc_pool(outer, 1024);
        TALLOC_CTX *chunk;

        if (pool) {
                printf("Pool allocated\n");
        } else {
                printf("Pool allocation failed\n");
        }

        if (talloc_set_memlimit(outer, 1024) < 0) {
                printf("talloc_set_memlimit failed\n");
        } else {
               printf("talloc_set_memlimit success\n");
        }

        chunk =3D talloc_size(pool, 1);
        if (chunk) {
                printf("Chunk allocated\n");
        } else {
                printf("Chunk allocation failed\n");
        }

        chunk =3D talloc_realloc_size(pool, chunk, 2);
        if (chunk) {
                printf("Chunk realloced\n");
        } else {
                printf("Chunk realloc failed\n");
        }
}


