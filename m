Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 2162A6E4F2C
	for <lists+samba-technical@lfdr.de>; Mon, 17 Apr 2023 19:24:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=dGHkRGV2by1rQM2PiDsAIVBivG/3YAO10kM+csU/EJo=; b=wg4c3F9qBQ2ifNt8fNXQvGqueG
	+WiEc6fb7m2eJIyAS6VFxz1yVditALuE8G9HX/4iaunfkf2PF91wPcQwlt+Pe9wZXsjZy3OCNBgfY
	onhj3weZyMvx9LCFTDdkAacAIxxEXb9iwONUcNgSnOkw6avKaz/8zulQxRAG0G+w0piKcN5aszvaE
	iHqUdy4744yVR1r72+U+URnFpbXOzdaRMBK2B9kvb3TypwHuHZ2hwYdHIomhwiagyrO7bUF8dNZry
	e7sLv7a3c9COXH0p/7eeB1irKa6VYAKqRA3nMyb1cdjd+5q/8FPrvlyAqSVTsH+8LiVGy50Xn9PCf
	/Y4MJJ6Q==;
Received: from ip6-localhost ([::1]:61500 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1poSaE-002LcM-5W; Mon, 17 Apr 2023 17:24:06 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:10390) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1poSa9-002LcD-PA
 for samba-technical@lists.samba.org; Mon, 17 Apr 2023 17:24:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=dGHkRGV2by1rQM2PiDsAIVBivG/3YAO10kM+csU/EJo=; b=heiDD+pNeLYnl6D0NAVu2TLZtM
 4yxrzPhOT0Qa24Z4/PDJfUcL6wlctRm60e5LWxKx/MhkvX7gL9VIRTwdGZ2GuVWHztP4ikTkYoOwa
 BaAb78zV0UuWWbFQZiX988Qoh6qeY746WLbmQ5yQcyJlOEc90Sfql1TyltLsHx35aX04p0OLGzj8f
 +0T7nJZrr1WemK9P1UE31mFUfL2PqpxiJAb6dVGgHdm9dzy98sAxh/TmnVZpOnZxL6Ja8KCyswirz
 vbegVMd/Uq9buKe1lo2O+RhsDaPBUZsPXtLGtwwffvXrqiumgoCyOCtzq8RKzcqpgvOLcjPkrPKRL
 N0IrXNmvrgcGgjMCM0R7yrSpDqbFLr8rwcwH6XtqKmLDq1zMynhulXhX0DvJJ+PTF3X1iDj+K9Fnq
 JOkTTDk5i8zcJ4sY5f6HqC9kvnyAsSfQBIU38e2w/cori9YK2rl68OpRGgNXhHY93x6ISIMcAYRjd
 kF13vwVtIjruJhHYutQLaP5t;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1poSa9-001gHV-DW; Mon, 17 Apr 2023 17:24:01 +0000
To: samba-technical@lists.samba.org
Subject: Re: talloc vs malloc speed
Date: Mon, 17 Apr 2023 19:24:00 +0200
Message-ID: <3238550.44csPzL39Z@magrathea>
In-Reply-To: <CAB5c7xqj=X77E6roZhfnaRewLtfdzwPx2SE4rodRFvKB75MfBg@mail.gmail.com>
References: <3161922.5fSG56mABF@magrathea>
 <CAB5c7xqj=X77E6roZhfnaRewLtfdzwPx2SE4rodRFvKB75MfBg@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
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
From: Andreas Schneider via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andreas Schneider <asn@samba.org>
Cc: fweimer@redhat.com, Andrew Walker <awalker@ixsystems.com>,
 samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Friday, 14 April 2023 20:32:33 CEST Andrew Walker via samba-technical=20
wrote:
> I was playing around with building talloc with jemalloc not too long
> ago
> https://github.com/truenas/samba/pull/241/commits/2476bfd3012a95e8015e2b6=
1d
> 3475d6f8cf11476 Some thoughts:
> 1) there was some benefit to removing the memlimit API. Might be worth
> a shot retesting with it ripped out at different optimizations levels.

I wonder if this is used by someone.

> 2) there was also some benefit for case of talloc_zero() if we called
> directly into calloc() rather than doing malloc() followed by
> memset().

Replacing the malloc() call in __talloc_with_prefix() with calloc in case o=
f=20
talloc_zero doesn't show much benefit in my testing.

>=20
> Andrew
>=20
> On Fri, Apr 14, 2023 at 1:12=E2=80=AFPM Andreas Schneider via samba-techn=
ical
>=20
> <samba-technical@lists.samba.org> wrote:
> > Hi,
> >=20
> > Florian Weimer implemented hwcaps support in glibc. This allows you to
> > drop
> > optimized libraries.
> >=20
> > The support for this is enabled in openSUSE Tumbleweed right now [1]. I=
've
> > enabled it for libtalloc as you want to to be as fast as possible.
> >=20
> >=20
> > Here are the results from my AMD Ryzen 9 3900X 12-Core processor.
> >=20
> > talloc x86_64_v1 (testsuite compiled with -O0)
> >=20
> > test: speed
> > # TALLOC VS MALLOC SPEED
> > talloc:       46623469 ops/sec
> > talloc_pool:  74121933 ops/sec
> > malloc:       66443400 ops/sec
> > success: speed
> >=20
> > =3D> talloc is 30% slower
> >=20
> >=20
> >=20
> > talloc x86_64_v3 (testsuite compiled with -O0)
> >=20
> > test: speed
> > # TALLOC VS MALLOC SPEED
> > talloc:       47783809 ops/sec
> > talloc_pool:  75068595 ops/sec
> > malloc:       68073710 ops/sec
> > success: speed
> >=20
> > =3D> talloc is 30% slower
> >=20
> >=20
> >=20
> > talloc x86_64_v3 (testsuite compiled with -O2)
> > test: speed
> > # TALLOC VS MALLOC SPEED
> > talloc:       50633005 ops/sec
> > talloc_pool:  74245533 ops/sec
> > malloc:      219259200 ops/sec
> > success: speed
> >=20
> > =3D> talloc is 77% slower
> >=20
> >=20
> > It looks like the optimizer is able to optimize the code a lot more if
> > malloc is used.
> >=20
> > I wonder if it would be possible to give the optimizer more hints. Maybe
> > Florian has some ideas :-)
> >=20
> >=20
> > Best regards
> >=20
> >         Andreas
> >=20
> > P.S. The talloc website states it is 4% slower than malloc. This was
> > probably a long long time ago ;-)
> >=20
> >=20
> > [1] https://www.phoronix.com/news/glibc-hwcaps-RFC
> > [2] https://news.opensuse.org/2023/03/02/tw-gains-optional-optimization=
s/
> >=20
> > --
> > Andreas Schneider                      asn@samba.org
> > Samba Team                             www.samba.org
> > GPG-ID:     8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D


=2D-=20
Andreas Schneider                      asn@samba.org
Samba Team                             www.samba.org
GPG-ID:     8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D



