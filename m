Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id DFBB47F52EA
	for <lists+samba-technical@lfdr.de>; Wed, 22 Nov 2023 23:01:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=Gt5zi8dsn52eO7zK0UDcs8OfPgqQyRgqPKC56BUWSTY=; b=oZUzDRTn5QrwlGD+Apa6rEn1BB
	S9TiVKfUGqurLXFRpxG+UHba3/FVuXgpxjuLZ2uGHmj4Y6BwAe6BihmatxFYocj9RpInUH5Dv0Nh5
	7/v7bCqzAyOY/iVbGycUmtARmzpKHiB+D8TaldBvixbUKGBG2lA2RcFuYOBXAoK4LS3s1ukXaIvEG
	48caqHxGxPW4qU3Q2XYM97kRv1mH06zOzLyCvwIY0ZM32NkYU8dzspLq2AxMGqWOVSDAkhff+ronj
	Wlsysw1aUeG0auijYNY/oRv2iEsTLsGOI+ljxJMc53iIfPl6+Bo1OZIlYrXcrnMboFw5l1RYCZHaW
	+7ZXcX+A==;
Received: from ip6-localhost ([::1]:60152 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1r5vHA-000FZY-Ba; Wed, 22 Nov 2023 22:00:52 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:11320) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1r5vH5-000FZI-9Y
 for samba-technical@lists.samba.org; Wed, 22 Nov 2023 22:00:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=Gt5zi8dsn52eO7zK0UDcs8OfPgqQyRgqPKC56BUWSTY=; b=KHaimACHpvkwAUy1FEGoj5ZChg
 qCWeZpNrfJWMJMQiFEPe0VbGV1xcSIvxLI7Z7rg1QuUZTEiW68OGiJUwBXAPS5USr5bc7gSTnM1oa
 w6meG02DIXfImpkIh9wzCqhFBNEINCoUYTEC3N8uBAEwStq3LjXD/4ovMwY7FX9UB3hp0fWHF9FKw
 AE3o7Rm7nCQXEG8xgBIhPgNM1B+OSJCcxVhm0jfxPl6so+kn+DgMDUgEOAgH1TYuRIcdLhxpUfDmO
 GtcY5URg4/ZuLrwMHSepu1LJlfQK9L7izt33EKIoZk2zkvMYxub32lxdtqW0R1I6rcNxkqV+2gKGG
 rlQlC+NSRuPCR4VCilOVopt9bj7TX0DdwzIPsGlbdrLdP5m1zcO7lItOXeNtuGrQTdtFRYJOq21eI
 d29F82segwGRFVJELbfh5bHlz0DXBmcjOSOkxjQmFfFOpWlgUEh+xmXuyDCQIGNY+wctBBJ1dEpv7
 x2cqdGlQz+jXDouVhhM5gxuA;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1r5vH3-00058p-24 for samba-technical@lists.samba.org;
 Wed, 22 Nov 2023 22:00:46 +0000
Message-ID: <9d3d112d951f294316c6690c9820e5cd9a4fc013.camel@samba.org>
Subject: Re: Suggested crypto libs for Diffie-Hellman and Eliptic Curve
 Diffie-Hellman
To: samba-technical@lists.samba.org
Date: Wed, 22 Nov 2023 17:00:42 -0500
In-Reply-To: <107f4011e2de161a39d88a8c9698917b0e9dd75d.camel@samba.org>
References: <81c7b2c93303aa93bc3b6747c7935e040afff238.camel@samba.org>
 <2320390.ElGaqSPkdT@magrathea>
 <107f4011e2de161a39d88a8c9698917b0e9dd75d.camel@samba.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0
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
From: Simo Sorce via samba-technical <samba-technical@lists.samba.org>
Reply-To: Simo Sorce <idra@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thu, 2023-11-23 at 09:26 +1300, Andrew Bartlett via samba-technical
wrote:
> On Wed, 2023-11-22 at 12:07 +0100, Andreas Schneider wrote:
> > On Thursday, 16 November 2023 07:08:59 CET Andrew Bartlett via
> > samba-
> > technical=20
> > wrote:
> > > For Group Managed service accounts, which we are working on, for
> > > reasons around RODCs and a few other things, Microsoft has
> > > decided
> > > to
> > > internally use a key-agreement between a 'root key' and a
> > > 'service
> > > key', both held in AD.
> > >=20
> > > The password comes, as I understand it, from the key agreement
> > > derived
> > > out of a Diffie-Hellman or Eliptic Curve Diffie-Hellman
> > > exchanges.
> > >=20
> > > This is all in MS-GKDI, referenced from
> > > https://learn.microsoft.com/en-us/openspecs/windows_protocols/ms-adts=
/9cd2fc
> > >=20
> > > 5e-7305-4fb8-b233-2a60bc3eec68
> > >=20
> > > I just wanted to check if there are particularly cryptographic
> > > libraries we should consider for this work.
> > >=20
> > > In the past we have looked to libnettle when gnutls didn't
> > > provide
> > > the
> > > functions we wanted, but that was backed out fairly fast as
> > > another
> > > method was found (
> > > https://bugzilla.samba.org/show_bug.cgi?id=3D13276
> > > =C2=A00784
> > > 4a9a13506b4ca9181cfde05d9e4170208f88).
> > >=20
> > > Even so, for this case is libnettle still the best first place to
> > > look?
> >=20
> > If something is missing in GnuTLS you need, open tickets at GnuTLS.
> > They are=20
> > fairly quick implementing the stuff we need.
>=20
> The main issue is the time to get the changes into the distributions
> so
> we can get them into master, but yes, it has been an awesome
> collaboration.=20

You can always have a git submodule pointing at the gnutls tree to
fallback to if that is really such an important function that you can't
simply disable it until available.

> > They implemented all the features we needed for Samba so far.
> > Example:
> >=20
> > https://gitlab.com/gnutls/gnutls/-/merge_requests/1611/
> >=20
> >=20
> > Also AES-GMAC, AES-CCM, AES-CBF8 ...
> >=20
> > They also fixed performance issues we discovered ...
>=20
> Thanks.=C2=A0 It looks like we won't need the DH stuff, thankfully, but w=
e
> might need an alternate key derivation function: SP800-108.
>=20
> Andrew Bartlett


