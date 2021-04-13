Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 877E435DFF7
	for <lists+samba-technical@lfdr.de>; Tue, 13 Apr 2021 15:24:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=zrV/rrREJmursReCleYdxbo82Sj7ZVllfi0vL5D8w/4=; b=4npLUFBZYuQI2osRbVtFwwwGua
	xFmPxBtvpiDSqoc3YJThCYltnFIScl9HXmN+wRgwL1oXRkf5WSYQ6BB+QzPNuz+0aoJH0WB5gW7h9
	NOAGamymy2W2lx1DVqejbF6FbRrpNU+kXJPUevAhJVRFYVEwWal0dOmnt9qujocbqobfuHqRz5E06
	+Rj/WBHDff/G6FnByfqXKy/RMVRfegI9qV3RSEGa6Gj/OIEfiwA0SFfWD/AyN6EaoKeCfJ/McoJH8
	omT1z8oZV0ODhXm7y9/98cHebx3W2IXsk+1oWcVzS7V17SeQOvWwxzi6jGizUaydMYXPbnBuXcgom
	CII+YqvQ==;
Received: from ip6-localhost ([::1]:28180 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lWJ1G-00B7hL-3P; Tue, 13 Apr 2021 13:23:54 +0000
Received: from milliways.cryptomilk.org ([2a01:4f8:201:2294::2]:58070) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lWJ1B-00B7hE-2x
 for samba-technical@lists.samba.org; Tue, 13 Apr 2021 13:23:51 +0000
Received: from milliways.cryptomilk.org (localhost [127.0.0.1])
 by milliways.cryptomilk.org (Postfix) with ESMTPS id B57BF41812B7;
 Tue, 13 Apr 2021 15:23:37 +0200 (CEST)
Received: from magrathea.localnet (unknown
 [IPv6:2001:a62:1505:a01:a15d:3456:3a76:1288])
 by milliways.cryptomilk.org (Postfix) with ESMTPSA id 5CA9941812B6;
 Tue, 13 Apr 2021 15:23:37 +0200 (CEST)
To: Douglas Bagnall <douglas.bagnall@catalyst.net.nz>,
 samba-technical@lists.samba.org
Subject: Re: CI failure on account of C99
Date: Tue, 13 Apr 2021 15:23:37 +0200
Message-ID: <1832543.L1TFtgyh1A@magrathea>
In-Reply-To: <YHWTScggnmWQ9ZDq@crust.home.phg>
References: <YHVls6bU63Xhd32H@crust.home.phg>
 <380b9ca0-3322-b8cd-36da-8ba84b017b1a@catalyst.net.nz>
 <YHWTScggnmWQ9ZDq@crust.home.phg>
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
Reply-To: Andreas Schneider <asn@cryptomilk.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tuesday, 13 April 2021 14:49:13 CEST Philipp Gesang via samba-technical=
=20
wrote:
> On Tuesday, 2021-04-13 22:20:31 +1200 Douglas Bagnall
> <douglas.bagnall@catalyst.net.nz> wrote
> > On 13/04/21 9:34 pm, Philipp Gesang via samba-technical wrote:
> > >     ../../lib/util/tests/time.c:119:2: error: =E2=80=98for=E2=80=99 l=
oop initial
> > >     declarations are only allowed in C99 mode> >    =20
> > >       for (int i =3D 0; i < sizeof(data) / sizeof(data[0]); ++i) {
> > >       ^
> > >    =20
> > >     ../../lib/util/tests/time.c:119:2: note: use option -std=3Dc99 or
> > >     -std=3Dgnu99 to compile your code> >=20
> > > AFAICS there=E2=80=99s numerous C99 constructs all over the source and
> > > README.Coding explicitly mentions it. Is there a special
> > > precaution that must be taken for this test target to work?
> >=20
> > The Samba style is to declare all the things first.
>=20
> Ok, centos7 is happy now. Thanks for the explanation.

In case we want to fix that correctly on gcc and maybe other compilers:

https://gitlab.com/samba-team/samba/-/merge_requests/1899



=2D-=20
Andreas Schneider                 asn@cryptomilk.org
GPG-ID:     8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D



