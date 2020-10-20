Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E3B24294272
	for <lists+samba-technical@lfdr.de>; Tue, 20 Oct 2020 20:50:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=bHn4nfthfdZ8qI9hF7oUAYa7H0tqDzjCmRNHXSI/h7g=; b=tw+rkpiD/m5t8TZcFx6+4cvn8u
	2bGbT9YCBh3MorUVdm9EjUZ7+t41yXSVZ8lwY0DvQdv9NCgfj/YyoXkWKUrj7905GJ7W0fg0UAM5/
	+FV5scaXnTbZnS+h/QzsGZ1V1Pwg0hYSO/jCFhFPWV6037jm2WD65jlocrdigr1OhjWi7jWsyVwnG
	779WOdZ9bMcTVOm5LiZaZBjAQqKLfAqWv/wWcgpGoyqv5ORvSE2BsYwEyuB/Gc8dqu51s8SHWP4J/
	6lD8H6xR7GhO2egdwFUeapX0+/Mos/Spc4EzF1LcUZRtbETEF+1UHA3bwgnvLTy43VbeulaP88KTJ
	X5Q9iezA==;
Received: from ip6-localhost ([::1]:21388 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kUwiQ-00Cw0r-Qk; Tue, 20 Oct 2020 18:50:34 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:25324) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kUwiM-00Cw0k-Ao
 for samba-technical@lists.samba.org; Tue, 20 Oct 2020 18:50:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:To:From:Date:CC;
 bh=bHn4nfthfdZ8qI9hF7oUAYa7H0tqDzjCmRNHXSI/h7g=; b=kFnMzsmZKGoXK1NTLiZeyAqTXk
 FlAcWvj1F5AxHrdVmZYBtWJMXuQ+czZtzJq7SvJQLLdgWv9oYL5g6lzIs0DdHVjOCFtBZ9Qvq5klD
 uOJIlvVGXbYFemLgY2JaBw1nQqzuac3DKpBbvo7mcKSh3r69sHuh7LHfa4S9nGfUcV9dt3NzznjrB
 OnQxiPDmHbuXqzc2dDXJDyJKBn9Qk80ggb72872Px44DluPRn4H60kt7MpxHDoc1rQKqbbUliiq41
 t5PKN3uC8Rj4MMebsgr9lsL9516PjcrBZzi8h+lU5/I3HGTOVGFv+mDJKkbM4eW2jT73QXuT/eDOB
 q/KyBtNnw+VX+4De0R/Hrijigx82bOj7EgL3xQL0mwSOEImZg3uA36v5kQ7JvC8wApk9jgPXVABuv
 6J5hTW7oQqeuK3BeeDdt9cA9mF3yxKDOG5a+p3ywt1h7uWk0J9ZSc8fvDd98LxT0i3yVD+ZRHwqbT
 ypY76cRptKxVr9D/9MscE/CJ;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kUwiL-0003Vi-L8; Tue, 20 Oct 2020 18:50:30 +0000
Date: Tue, 20 Oct 2020 11:50:27 -0700
To: Arran Cudbard-Bell <a.cudbardb@freeradius.org>,
 samba-technical@lists.samba.org
Subject: Re: talloc: talloc_set_memlimit causes all reallocs to fail when
 used on pools.   talloc_set_memlimit not enforced correctly on pools.
Message-ID: <20201020185027.GD642265@jeremy-acer>
References: <E2A6FEEF-3C46-43A6-818C-D226924EB9F7@freeradius.org>
 <20201016202528.GF67086@jeremy-acer>
 <E75C5FB4-2800-498A-868B-7F3A3CB4E802@freeradius.org>
 <20201020020246.GB564927@jeremy-acer>
 <20201020035308.GA601524@jeremy-acer>
 <2F0B2708-7AC6-4FF5-99FA-8D4B8F1BAB2E@freeradius.org>
 <20201020055023.GA606244@jeremy-acer>
 <D37CFB0F-61FE-43C4-A161-DB949FF9F175@freeradius.org>
 <20201020183336.GB642265@jeremy-acer>
 <20201020184150.GC642265@jeremy-acer>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20201020184150.GC642265@jeremy-acer>
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
From: Jeremy Allison via samba-technical <samba-technical@lists.samba.org>
Reply-To: Jeremy Allison <jra@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tue, Oct 20, 2020 at 11:41:50AM -0700, Jeremy Allison via samba-technica=
l wrote:
>=20
> Ah no, it's not that (although that is a bug
> in the ALWAYS_REALLOC=3D=3D1 case).
>=20
> The problem is in this section:
>=20
> 1951         if (pool_hdr) {
> 1952                 struct talloc_chunk *pool_tc;
> 1953                 void *next_tc =3D tc_next_chunk(tc);
> 1954                 size_t old_chunk_size =3D TC_ALIGN16(TC_HDR_SIZE + t=
c->size);
> 1955                 size_t new_chunk_size =3D TC_ALIGN16(TC_HDR_SIZE + s=
ize);
> 1956                 size_t space_needed;
> 1957                 size_t space_left;
> 1958                 unsigned int chunk_count =3D pool_hdr->object_count;
> 1959=20
> 1960                 pool_tc =3D talloc_chunk_from_pool(pool_hdr);
> 1961                 if (!(pool_tc->flags & TALLOC_FLAG_FREE)) {
> 1962                         chunk_count -=3D 1;
> 1963                 }
>=20
> we don't put chunk_count back into pool_hdr->object_count
> after decrementing it. Still investigating...

Oh, never mind. As we're re-allocting here we need
to leave the pool_hdr->object_count alone if we
can grow/shrink the area from the existing object,
so not updating chunk_count is correct.

All the other code paths (allocate new object
=66rom pool and memcpy/malloc new object outside
pool and memcpy) take care of updating pool_hdr->object_count
correctly.

So I think the bug was only in your test code :-).

