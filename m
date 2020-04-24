Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 571D31B7367
	for <lists+samba-technical@lfdr.de>; Fri, 24 Apr 2020 13:44:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=Dd8twgegKPL7AO6+7QvSP0l2qUmbu8DKUOljZTHXP1E=; b=YBWDsNCyme8iN8eFUphotCxnXz
	GrRlr/aifbxfuedWSUvPml+MHiRjzOiG5FyaYZeZ7puW74NOjjnYqkUvv+m61/fuPmmk93I/1jYrP
	HLUOtFovyJurtgDQJNrspw6nNCkABlo4KWDXvEpfzAoMFU+7B61pijY6stimtWKODXlGDDn5A1xBg
	fRPQRP1bYXiXXsU+I9ggTFcG3mfIFzIJfZaRlTSEpVp5Ep7FKo752r/f3AWz3Fmg0yrCM0EvsF04e
	NsHk4WrcgK8E53AF/yh800scTseo+xq6kPgxE5o+AdHxtTMZJL4VGsBGBvgf44igHSUMz7l3QuOqy
	aY9mTTLA==;
Received: from localhost ([::1]:55844 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jRwkS-001sgf-Hw; Fri, 24 Apr 2020 11:44:00 +0000
Received: from mailhopper2.bazuin.nl ([195.134.173.123]:53088) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jRwkM-001sgX-Bl
 for samba-technical@lists.samba.org; Fri, 24 Apr 2020 11:43:57 +0000
X-Bazuin-en-Partners-MailScanner-Watermark: 1588333428.45558@bxxG31zp1nRn6J1Xr+NAZA
X-Bazuin-en-Partners-MailScanner-From: belle@bazuin.nl
X-Bazuin-en-Partners-MailScanner: Found to be clean
X-Bazuin-en-Partners-MailScanner-ID: 671B211F366.A5418
X-Bazuin-en-Partners-MailScanner-Information: Please contact Bazuin en
 Partners for more information
Received: from ms249-lin-003.rotterdam.bazuin.nl
 (ms249-lin-003.rotterdam.bazuin.nl [192.168.249.243])
 by mailhopper2.bazuin.nl (Postfix) with ESMTP id 671B211F366
 for <samba-technical@lists.samba.org>; Fri, 24 Apr 2020 13:43:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=bazuin.nl;
 s=mail20180308; t=1587728625;
 bh=Dd8twgegKPL7AO6+7QvSP0l2qUmbu8DKUOljZTHXP1E=;
 h=Subject:From:To:Date:In-Reply-To:References:From;
 b=K1DVScEVWX7SJIBAL6KRlkjr+ty6Hb7AEqVOLNzP2JOsgfkAg1lyKOJvoKRhA86e/
 XHsEqaZ/Fe7bo46INVy0EXrLTtQzE/0YT5P4Y5hUzzK0M+Lqsz93Paenax2GURZ+JA
 WJDVsIHcOONqJk1yW3TaOkPboW1MAVY9g/PYjL/ezwL4H4gNpUiZqTSndiRLCqcfir
 oxgU3SnCf5YHTuLU36tiiKQzcTd3CmYhXOCe5fY2hk6EJmvVU+gmBRj1sxuTghOF2L
 ygvy+8ZcFgNKB+sYkl4GeiFXUZ4guX8HAshuE5ih/uuZr3O3CLVthNT1TZ0PMPL/VH
 e7XH3Y09lNU5Q==
Received: from ms249-lin-003.rotterdam.bazuin.nl (localhost [127.0.0.1])
 by ms249-lin-003.rotterdam.bazuin.nl (Postfix) with SMTP id 7C4D93AF8C
 for <samba-technical@lists.samba.org>; Fri, 24 Apr 2020 13:43:45 +0200 (CEST)
Subject: RE: build - ldb depends on missing system library/libraries
To: =?windows-1252?Q?samba-technical=40lists.samba.org?=
 <samba-technical@lists.samba.org>
Date: Fri, 24 Apr 2020 13:43:45 +0200
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <74f63ccb-e78f-3cbc-be77-d2aa889852f1@samba.org>
References: <0c073dad-8924-3bf6-fad2-12c5323d628f@yahoo.co.uk>
X-Priority: 3 (Normal)
X-Mailer: Zarafa 6.30.19-25148
Thread-Index: AdYaLZwWTUfIqcfXQLONSYS7cFjTiw==
Message-Id: <vmime.5ea2d0f1.2b2.cea50976b50e981@ms249-lin-003.rotterdam.bazuin.nl>
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

Or..=20

Try get get these sources and rebuild them agains Centos 8

https://pkgs.org/download/samba4
But again, you also need all other depends as shown.

The minimal versions you need for 4.12.1=20

lib/talloc/wscript:VERSION =3D '2.3.1'
lib/tdb/wscript:VERSION =3D '1.4.3'
lib/tevent/wscript:VERSION =3D '0.10.2'
lib/ldb/wscript:VERSION =3D '2.1.1'
'cmocka', minversion=3D'1.1.3')
'socket_wrapper', minversion=3D'1.2.3')
'nss_wrapper', minversion=3D'1.1.7')
'resolv_wrapper', minversion=3D'1.1.4')
'uid_wrapper', minversion=3D'1.2.7')
'pam_wrapper', minversion=3D'1.0.7')

Good luck.=20

Greetz,=20

Louis


> -----Oorspronkelijk bericht-----
> Van: samba-technical=20
> [mailto:samba-technical-bounces@lists.samba.org] Namens=20
> Rowland penny via samba-technical
> Verzonden: vrijdag 24 april 2020 12:44
> Aan: samba-technical@lists.samba.org
> Onderwerp: Re: build - ldb depends on missing system library/libraries
>=20
> On 24/04/2020 11:11, lejeczek via samba-technical wrote:
> >
> > On 24/04/2020 10:28, Rowland penny wrote:
> >> On 24/04/2020 10:04, lejeczek via samba-technical wrote:
> >>> On 23/04/2020 19:31, lejeczek via samba-technical wrote:
> >>>> hi guys..
> >>>>
> >>>> I'm trying to rpm build Samba on Centos8 but process fails
> >>>> as below.
> >> Have you run this:
> >>
> >>=20
> https://git.samba.org/=3Fp=3Dsamba.git;a=3Dblob_plain;f=3Dbootstrap/ge
nerated-dists/centos8/bootstrap.sh;hb=3Dv4-12-test
> >>
> >>
> >> Rowland
> >>
> >>
> > bootstrap.sh does not fix/help my setup.
> >
> > ..
> > Checking for system pyldb-util.cpython-36m-x86_64-linux-gnu
> > (>=3D2.0.7 <=3D2.0.999)=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 : not found
> > ERROR: Use of system library ldb depends on missing system
> > library/libraries ['pyldb-util.cpython-36m-x86_64-linux-gnu']
> >
> > On Centos8 (which still is very messy in some places -
> > reason I try to re/build is because with freeIPA + Samba
> > integration these services fail to start)
> > I have these os-wide available on the box:
> >
> > ldb-tools-2.0.7-3.el8.x86_64
> > libldb-2.0.7-3.el8.x86_64
> > libldb-devel-2.0.7-3.el8.x86_64
> > lldb-9.0.0-2.module_el8.1.0+288+74592915.x86_64
> > python3-ldb-2.0.7-3.el8.x86_64
> > python3-lldb-9.0.0-2.module_el8.1.0+288+74592915.x86_64
> >
> > So what I'm doing is I use "official" Centos way to get
> > sources and I follow Centos devel's "howto".
> >
> > many thanks, L.
>=20
> The distro ldb packages are probably not new enough, Louis=20
> builds 4.12=20
> for debian and that uses libldb2 2:2.1.1-0.1buster1
>=20
> It looks like you are going to have to build all the support packages=20
> before you build Samba, see Louis earlier post, either that or build=20
> everything into /usr/local/samba
>=20
> Rowland
>=20
>=20
>=20


