Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 864BB6BA8E
	for <lists+samba-technical@lfdr.de>; Wed, 17 Jul 2019 12:50:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=Yb9xirhfyof3C95jVAcQacv9Oitw2dk/RxLB1yW4iNQ=; b=uni/yffyroMNvFIuG1JApy9O+Z
	0LW4IWOXvgdpdDVpca+Fg6NhZ+M9blkjaHSR+hsRVEiZgTd7Zk7ECqDcchIkfFl4XKcO0Vm0Me4zM
	ZPmpkb0n7+WwvrCDpVUDtosGyjch6dRpDGHo+Z6CsSOilaGhuVb25ctYjrBQ4/g4KNWkrYkYS29Xb
	WbVweIFc5LZ3sSOIGQn1ZLzWfMOLAmXjsoSrIkFvsV8dZkO7fKJ+yZo6GUQIZaTeIgVccBnamyIyf
	98iNmmsmyrRWRU+XaLUekL2Z/HrBnbJEbf1d7iZhIWkApNFmPoUYHBLSzsIVPywqsli2Gl2UbGbmc
	IRyfbElg==;
Received: from localhost ([::1]:40692 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hnhVx-000SBP-Ay; Wed, 17 Jul 2019 10:50:25 +0000
Received: from mailhopper2.bazuin.nl ([195.134.173.123]:34446) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hnhVs-000SBD-Bd
 for samba-technical@lists.samba.org; Wed, 17 Jul 2019 10:50:22 +0000
X-Bazuin-en-Partners-MailScanner-Watermark: 1563965417.02861@9f28DsP//s2ax1IXwNMjDQ
X-Bazuin-en-Partners-MailScanner-From: belle@bazuin.nl
X-Bazuin-en-Partners-MailScanner: Found to be clean
X-Bazuin-en-Partners-MailScanner-ID: C6A3A11EF19.A6B00
X-Bazuin-en-Partners-MailScanner-Information: Please contact Bazuin en
 Partners for more information
Received: from ms249-lin-003.rotterdam.bazuin.nl
 (ms249-lin-003.rotterdam.bazuin.nl [192.168.249.243])
 by mailhopper2.bazuin.nl (Postfix) with ESMTP id C6A3A11EF19
 for <samba-technical@lists.samba.org>; Wed, 17 Jul 2019 12:50:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=bazuin.nl;
 s=mail20180308; t=1563360616;
 bh=Yb9xirhfyof3C95jVAcQacv9Oitw2dk/RxLB1yW4iNQ=;
 h=Subject:From:To:Date:In-Reply-To:References:From;
 b=OGBRmdgbqAXUzcLQKzaf5PNqvBY17zB0p+BpkTlu9Ygv/6OCuZgFH0SdvDMvRfB0u
 Ybqvd60TQMbjSnPC74DB0XJ5ffWBhseQ5m32/iV0loefiZlhWzNGwuSgsKW1GHaR91
 q5ugi3BJDW+8G1mTsL3W/AmRMu9KJC+i14R7D+G+Ib/gh0Xa7Lvbq8KlR44Y32v2r2
 fyECpr1pzuJcVLw2z2Js3IoVWHkbMk4MaYqOeKAw2GTiviPukoQyebGEQEP1yU3EXg
 l0WA14WE1qUFfag8188ojDmUQA7bRSDRmWvqTxSo8gMIFa+BwNR8o06j4c1uJ5irof
 6t4qNdqBh1L1Q==
Received: from ms249-lin-003.rotterdam.bazuin.nl (localhost [127.0.0.1])
 by ms249-lin-003.rotterdam.bazuin.nl (Postfix) with SMTP id B68803AF8C
 for <samba-technical@lists.samba.org>; Wed, 17 Jul 2019 12:50:14 +0200 (CEST)
Subject: RE: Samba 4.11rc1 and tdb packaging.
To: =?windows-1252?Q?samba-technical=40lists.samba.org?=
 <samba-technical@lists.samba.org>
Date: Wed, 17 Jul 2019 12:50:14 +0200
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <84eca39f-6552-0394-3e69-2a0a2a95113d@samba.org>
References: <vmime.5d2ef100.310f.4ee297007e278100@ms249-lin-003.rotterdam.bazuin.nl>
X-Priority: 3 (Normal)
X-Mailer: Zarafa 6.30.19-25148
Thread-Index: AdU8jWnQVdekgwL0SM615ts+wHDa1A==
Message-Id: <vmime.5d2efd66.2122.5c7209ca42e0acc6@ms249-lin-003.rotterdam.bazuin.nl>
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

Thank you Metze for the quick reply.=20

I'll wait for RC2 then.=20


Greetz,=20

Louis
=20

> -----Oorspronkelijk bericht-----
> Van: samba-technical=20
> [mailto:samba-technical-bounces@lists.samba.org] Namens=20
> Stefan Metzmacher via samba-technical
> Verzonden: woensdag 17 juli 2019 12:19
> Aan: L.P.H. van Belle; samba-technical@lists.samba.org
> Onderwerp: Re: Samba 4.11rc1 and tdb packaging.
>=20
> Am 17.07.19 um 11:57 schrieb L.P.H. van Belle via samba-technical:
> > Hai,=20
> > =A0
> > Im having a quick look for a test build on samba 4.11 rc1=20
> > =A0
> > im stopped at:=A0=20
> > Checking for system tdb (>=3D1.4.1)=A0=A0
> > Latest here:=A0=A0 https://ftp.samba.org/pub/tdb/=3FC=3DM;O=3DD=A0=20
> > Shows only 1.4.0.tar.gz=20
> > =A0
> > Can someone update this to 1.4.1 is available also.=20
>=20
> The same applies to ldb, I hope we can sort this out
> for rc2. See https://gitlab.com/samba-team/samba/merge_requests/374
>=20
> metze
>=20
>=20
>=20


