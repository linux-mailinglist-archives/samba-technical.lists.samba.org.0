Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 473DB85ADC7
	for <lists+samba-technical@lfdr.de>; Mon, 19 Feb 2024 22:35:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=uCNfPtxl/35/9Hu4dRVVSHwfcOGYb1H6FG4/FK5h8O0=; b=JxiLVfH6HpO+qRxZgordVEdK8+
	nx+9OONaERro6ekHVqpf52dS2oYu0uVlOy6Zfwx9GesBdPvvRiqxM7tmAo04Y0QirZa0em76Uj6N4
	mukUa0eFifIyjNfIzjdZL7MPVV1lR3/qZI3mGbRTTxf+Jv6c7x5j+//f0SR/CT6o3096TTUatgHWE
	x9DHV8vHY2mKWqPcWQzmPjGEaz32U1J9unXi9nGRCYZ/I3YZhKA5RPlhJkHf/I47HBKfaI3S++sAS
	Mup0Jx9pdeUIFGr5+O8830T1NuT79iKO0ZKfqfpLpJYPd7qqMMIBatcAQm0zrBxrDZpdv2uQgp7H3
	o5r4MJ4w==;
Received: from ip6-localhost ([::1]:40486 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1rcBHj-008wnH-JR; Mon, 19 Feb 2024 21:34:47 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:36594) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rcBHg-008wnA-3T
 for samba-technical@lists.samba.org; Mon, 19 Feb 2024 21:34:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:To:From:Date:CC;
 bh=uCNfPtxl/35/9Hu4dRVVSHwfcOGYb1H6FG4/FK5h8O0=; b=CEDgMjJMBNh+mUma9WeqkWJYKm
 0F217S2au3ECN5cSQ2onedmPuGhyrSIoeQXL+YMEwDS3PAEmdmRyp5FA/pftOIEY0KpFBAGeQUWNQ
 jLFIey8NKI+nWn2YhN/dpOXmbaXvEcnc8sjcwf2ZwzEdXlTy1c6U6AOFu6INSkkk3Uq73VYHARW4O
 emueR3NomWgjFVQvYrakfyq8ml7LJJvJbK9qfWsp503MLLVU6sz7lDpP/fF+kRckwUNImAuDCRlks
 FU2BJyoFUAtBuRsal04F3WI6CShrxer5kW+JfyXlm4DNw0COdYGXn7Uo3Vu5Ye3TZe/UOWLWwfmn7
 DQU7h5f5SKghPFXOwVdSY3Qa5xj+tiEAtjSABoXmd5NpKVI3zpZ96u24UnmrerHX/+pUOgAfKK4H8
 yG7tWpOLCC01JWs0FBY4kSJ28505DghQ9lBQrsAmWfRsMbC0XZI9dVmaIFByZCw5rhjCjv+PuSSBt
 y4y0EpzLCPah6/RbH1vJN8mB;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rcBHf-00DqVX-1M for samba-technical@lists.samba.org;
 Mon, 19 Feb 2024 21:34:43 +0000
Date: Mon, 19 Feb 2024 21:34:41 +0000
To: "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
Subject: Re: setting up authentication policies in 4.20rc2
Message-ID: <20240219213441.61e401c3@devstation.samdom.example.com>
In-Reply-To: <017aeac7f3da70b70c14d5f8fbdf9abe20dfc5ab.camel@samba.org>
References: <e8210ddc-4506-4255-bcbe-f24ff86b2f0a@kania-online.de>
 <d7e23578-1526-4835-9438-306da6a95ac1@samba.org>
 <20240219164507.6a37e945@devstation.samdom.example.com>
 <017aeac7f3da70b70c14d5f8fbdf9abe20dfc5ab.camel@samba.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
From: Rowland Penny via samba-technical <samba-technical@lists.samba.org>
Reply-To: "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
Cc: Rowland Penny <rpenny@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tue, 20 Feb 2024 09:38:35 +1300
Andrew Bartlett <abartlet@samba.org> wrote:

> On Mon, 2024-02-19 at 16:45 +0000, Rowland Penny via samba-technical
> wrote:
> > On Mon, 19 Feb 2024 14:48:06 +1300
> > Jo Sutton via samba-technical <
> > samba-technical@lists.samba.org
> > > wrote:
> >=20
> > > On 18/02/24 6:11 am, Stefan Kania via samba-technical wrote:
> > > > Hi to all,
> > > >=20
> > > > I just tried to setup authentication policies and authentication
> > > > silos in 4.20rc2.
> > > > Following these steps:
> > > > 1. create a policy
> > > > samba-tool domain auth policy create --enforce --name winclient-
> > > > pol
> > > >=20
> > > > 2. create a silo
> > > > samba-tool domain auth silo create --enforce --name=3Dwinclient-
> > > > silo
> > > >=20
> > > > 3. adding a at least one user and one host to the silo
> > > > samba-tool domain auth silo member grant --name=3Dwinclient-silo=20
> > > > --member=3Dwinclient\$
> > > > samba-tool domain auth silo member grant --name=3Dwinclient-silo=20
> > > > --member=3Dpadmin
> > > >=20
> > > > BTW: In 4.19 it was "silo member add"
> > > >=20
> > > > 4. Set single policy for all principals in this silo. with 4.19
> > > > that was possible and that's by the way also possible with a
> > > > windows DC. That's on a windows DC called "Use a single policy
> > > > for
> > > > all principals that belog to this authentication silo"
> > > >=20
> > > > In 4.20 the option --policy is missing, you have only the option
> > > > to
> > > > add: --user-authentication-policy=3D
> > > > --service-authentication-policy=3D
> > > > --computer-authentication-policy=3D
> > > > So it would be nice if the option --policy will be back
> > > >=20
> > >=20
> > > We removed this option in commit=20
> > > c22400fd8ef961e472ce2803cf4a2ec58b778795. I don=E2=80=99t remember our
> > > exact=20
> > > reasoning, but we must have thought that it didn=E2=80=99t make much =
sense
> > > for a user and a computer to share the same authentication policy.
> > >=20
> >=20
> > Can I what was the reasoning about this ? Seeing as a computer in AD
> > is
> > just a user with an extra objectclass.
> >=20
> > I am trying to get my head around all this, but I am struggling at
> > the
> > moment.
>=20
> The difference is that user's log on to computers, but computers don't
> have anything else to log on to, so policies that say 'you must log on
> to from these computers' make no sense.
>=20
> Computers can also authenticate users (check their password over
> NETLOGON) and are servers that can both accept NTLM and Kerberos, but
> yes, the introduction of authentication policies is the first point at
> which users and computers started to have a real difference in how
> they are treated when acting as a client.
>=20
> This is also why the options were split, because in development we
> realised it was really easy to set a policy that made no sense, we
> even went to the point of banning some in the UI. =20
>=20
> But yes, we would like feedback on the real world application of these
> tools and while our work here is done (I can't promise that we have
> massive amounts of time to come back here and rework) if we do, every
> detail from the real world helps us rework once, not multiple times.
>=20
> Andrew Bartlett

It makes sense when you describe it in that way, but how will it affect
the use of a machines ticket in an ldbsearch ?

Rowland



