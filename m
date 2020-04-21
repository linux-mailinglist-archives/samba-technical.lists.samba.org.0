Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id EFD201B248B
	for <lists+samba-technical@lfdr.de>; Tue, 21 Apr 2020 13:05:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=WLn3Ih6ounVFB8IjlKNHABCrPjmWZ0tLnGfAEEbQWq0=; b=0IVNwD0HHK59eq9lfVbdd08uAd
	t9gtFOwRFppzGJdSflAgurwLZnhMEnN4RaEFakQkPSKTc6ZnFYE81fGudpj0cE05Oxnu/3TEtXM0K
	7Rg5Jn2RLOKYef3JRAeKFTruNj3zFdXW7QSwk+nzTDI1VaM92fTy2ndPvjYPs7zP7sBpoM3f45yis
	CMCaKKh71lMRDp4c8I7+aB1B5r8Kv7uabMYfUpkFss9j0o8SgK8T+bjfQf919NhorvWa72BbQ/e3c
	yBp9fPZud6MYI3HoGH16XmrEOsBvpyoREldIYE+xnQjRb1Q6k41N7GRkwxd5ePPX5qCs9f+TEaocB
	PxXekQbg==;
Received: from localhost ([::1]:22796 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jQqhx-001NGS-Lk; Tue, 21 Apr 2020 11:04:53 +0000
Received: from mailhopper2.bazuin.nl ([195.134.173.123]:36618) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jQqhr-001NGL-Jm
 for samba-technical@lists.samba.org; Tue, 21 Apr 2020 11:04:50 +0000
X-Bazuin-en-Partners-MailScanner-Watermark: 1588071898.13389@tDwDXnt72t7wGxrYrmge/Q
X-Bazuin-en-Partners-MailScanner-From: belle@bazuin.nl
X-Bazuin-en-Partners-MailScanner: Found to be clean
X-Bazuin-en-Partners-MailScanner-ID: 045D811F0B5.A74FA
X-Bazuin-en-Partners-MailScanner-Information: Please contact Bazuin en
 Partners for more information
Received: from ms249-lin-003.rotterdam.bazuin.nl
 (ms249-lin-003.rotterdam.bazuin.nl [192.168.249.243])
 by mailhopper2.bazuin.nl (Postfix) with ESMTP id 045D811F0B5
 for <samba-technical@lists.samba.org>; Tue, 21 Apr 2020 13:04:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=bazuin.nl;
 s=mail20180308; t=1587467096;
 bh=cCItEameLk1tkGLKS6nqmRS1Ajq+GGU36+nIDn/0wjk=;
 h=Subject:From:To:Date:In-Reply-To:References:From;
 b=lXfJYFuK1lFw1nlAkguT59CGbJaxt3nH0HOcPmQg+y6+FF2LbIF5Zv9SHdP0b7Hbg
 FIeObPaXgKJMYO8bBLDjLIdkivzXgs653M3qHlRFGKwg0LVX/kT1A1ezZWEK0f19sw
 jJGMGPOQ9HvXsFYWYv2tPrDCac/46BNtjc1uMCKxsTJ29AudrFmMlOrT5YJbpGqnIw
 mTubvJ7rzb3qJ8HyS6vn15chmzmFJ0VOtiq4svX4il9do9M3vQXSpCZC3BVTt6VOut
 hHuPGxJD3GYCPeh4p12QsdpUBWrhVOWtmO92bH0PaPhc+k3s/+jajr1+nZAIf3DGh4
 F1Q1oPDwHz9Nw==
Received: from ms249-lin-003.rotterdam.bazuin.nl (localhost [127.0.0.1])
 by ms249-lin-003.rotterdam.bazuin.nl (Postfix) with SMTP id 8B05E3AF8C
 for <samba-technical@lists.samba.org>; Tue, 21 Apr 2020 13:04:38 +0200 (CEST)
Subject: RE: question on testing 4.12.1 on Ubuntu 20.04 Focal..
To: =?windows-1252?Q?samba-technical=40lists.samba.org?=
 <samba-technical@lists.samba.org>
Date: Tue, 21 Apr 2020 13:04:38 +0200
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200421123008.285c64b0@samba.org>
References: <vmime.5e9ec3fd.695.3f5eadeb60ec1f4d@ms249-lin-003.rotterdam.bazuin.nl>
X-Priority: 3 (Normal)
X-Mailer: Zarafa 6.30.19-25148
Thread-Index: AdYXzKXmEg3qmMxRR0W5UU0WaBWg3A==
Message-Id: <vmime.5e9ed346.9b0.58f5a2ea669ab0a6@ms249-lin-003.rotterdam.bazuin.nl>
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
From: "L.P.H. van Belle via samba-technical" <samba-technical@lists.samba.org>
Reply-To: "=?windows-1252?Q?L.P.H._van_Belle?=" <belle@bazuin.nl>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Thank you David for you quick reply. :-))=20

I'll add that to my 4.12.1 packages.=20
Most welkom :-)=20

Greetz,=20

Louis
=20

> -----Oorspronkelijk bericht-----
> Van: samba-technical=20
> [mailto:samba-technical-bounces@lists.samba.org] Namens David=20
> Disseldorp via samba-technical
> Verzonden: dinsdag 21 april 2020 12:30
> Aan: L.P.H. van Belle via samba-technical
> CC: L.P.H. van Belle
> Onderwerp: Re: question on testing 4.12.1 on Ubuntu 20.04 Focal..
>=20
> Hi Louis,
>=20
> On Tue, 21 Apr 2020 11:59:25 +0200, L.P.H. van Belle via=20
> samba-technical wrote:
>=20
> > Hai guys,=20
> > =A0
> > I noticed the following with the first packages on Ubuntu 20.04..=20
> > So far i seen it installs nicely but i noticed the message below.=20
> > Can we ignore it, i suspect this is a python 3.8 thingy ..=20
> but as im not a coder ...=20
> > Well, anyone suggestions=3F=A0 :-)=20
> > =A0
> > =A0
> > Setting up python3-samba (2:4.12.1+dfsg-0.1focal1) ...
> >=20
> /usr/lib/python3/dist-packages/samba/emulate/traffic_packets.p
> y:339: SyntaxWarning: "is" with a literal. Did you mean "=3D=3D"=3F
> > =A0 if (filter is None or filter is '') and scope !=3D SCOPE_BASE:
>=20
> See https://bugs.python.org/issue34850
>   the "is" and "is not" operator sometimes is used with string and
>   numerical literals. This code "works" on CPython by=20
> accident, because
>   of caching on different levels (small integers and strings caches,
>   interned strings, deduplicating constants at compile time). But it
>   shouldn't work on other implementations, and can not work even on
>   early or future CPython versions.
>=20
> It can be ignored, but we should probably fix all such cases=20
> in future.
> This specific case can be fixed with:
>=20
> --- a/python/samba/emulate/traffic_packets.py
> +++ b/python/samba/emulate/traffic_packets.py
> @@ -336,7 +336,7 @@ def packet_ldap_3(packet, conversation, context):
> =20
>      # try to guess the search expression (don't bother for=20
> base searches, as
>      # they're only looking up a single object)
> -    if (filter is None or filter is '') and scope !=3D SCOPE_BASE:
> +    if (filter is None or filter =3D=3D '') and scope !=3D SCOPE_BASE:
>          filter =3D context.guess_search_filter(attrs, dn_sig, dn)
> =20
> Cheers, David
>=20
>=20


