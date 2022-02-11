Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E25364B1FE3
	for <lists+samba-technical@lfdr.de>; Fri, 11 Feb 2022 09:07:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=Qu1q3CRMko/HnAG88F0jlZh5ZsAV7Db7cXY62FSkYcY=; b=MjHBUCTQhW43IYvcQ/On/0io7W
	bxpONtnr5ZdH7kmREhBTkJFsIYkvj2oEaCRjWCUBuj1XE5iYSVoVnjPbjxPtmhsSlAL4b7gjaMZUA
	VWSJ4aoa7sLD3LuHXU9cBlHitupO89QJHXcZhdJ2ase+pSacTkUTe3gl6isYLXct64PiUOQ7OKIu7
	iJ7JlCQpIbQ2GdCRR73PV8thjk7bh60G34QFnJ4i8bQWZ+4AVl8+sJVDyIyocv+dSR0RP3xfIDUGE
	G070v57UnPPUVwfLSiC2jkRy0fD1MZR6+kJPNdcNRV7Bb+4/I97XdreYwrGdi7B8KT/DMPSnPkfvS
	eM9sA0LQ==;
Received: from ip6-localhost ([::1]:28890 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nIQwV-006VQz-13; Fri, 11 Feb 2022 08:06:11 +0000
Received: from mailhopper2.bazuin.nl ([92.66.229.69]:53238) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nIQwM-006VQp-HO
 for samba-technical@lists.samba.org; Fri, 11 Feb 2022 08:06:07 +0000
X-Bazuin-en-Partners-MailScanner-Watermark: 1645171526.46301@wuKRuUybPeDlMlnnWxYFGQ
X-Bazuin-en-Partners-MailScanner-From: belle@bazuin.nl
X-Bazuin-en-Partners-MailScanner: Found to be clean
X-Bazuin-en-Partners-MailScanner-ID: 85C931220FA.A74D7
X-Bazuin-en-Partners-MailScanner-Information: Please contact Bazuin en
 Partners for more information
Received: from ms249-lin-003.rotterdam.bazuin.nl
 (ms249-lin-003.rotterdam.bazuin.nl [192.168.249.243])
 by mailhopper2.bazuin.nl (Postfix) with ESMTP id 85C931220FA
 for <samba-technical@lists.samba.org>; Fri, 11 Feb 2022 09:05:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=bazuin.nl;
 s=mail20220103; t=1644566721;
 bh=yd0GY//5ER8laDvs9VxqgJLOqN7EtB+ISDSzxlMnFJk=;
 h=Subject:From:To:Date:In-Reply-To:References:From;
 b=Z8yPHsjYoslMilASSbyP6PFvKINcLDYo1g5YXzZloBBA2Glh+feBMuFQ0gE3lLXc+
 z6UIlBlmypMxwTzUxhquRS4J1nBLCaOLvrf+aXvQ9gbWgRPYippk5WmRvGeYVnMCgS
 w2Na4Jn3c9f7eb7pizJErglIfjiv4WCSizFqD2+1wJAB4eHreBVd4r+NvkpVN9TQjj
 0F42S3coLGYqlgxowF5v2pnIGGhGZhp9Zz2U7ndSuXaxVGm+4k0WOs/p/z7svQtXnv
 CKysp8/wV9/G1qeKAZ0lQav9DGhDgyb2IvsRSolbc1Pxq4j9SYmkar9zcIUvO/gS6e
 XclOGN4uv2Rmg==
Received: from ms249-lin-003.rotterdam.bazuin.nl (localhost [127.0.0.1])
 by ms249-lin-003.rotterdam.bazuin.nl (Postfix) with SMTP id D9A3118C239D
 for <samba-technical@lists.samba.org>; Fri, 11 Feb 2022 09:05:46 +0100 (CET)
Subject: RE: Shell script indentation
To: =?windows-1252?Q?samba-technical=40lists.samba.org?=
 <samba-technical@lists.samba.org>
Date: Fri, 11 Feb 2022 09:05:46 +0100
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220211095459.5693329d@martins.ozlabs.org>
References: <5431405.rdbgypaU67@krikkit>
X-Priority: 3 (Normal)
X-Mailer: Zarafa 6.30.19-25148
Thread-Index: AdgfHitudoWBm5IbQaiQC1rKLkaqtA==
Message-Id: <vmime.620618da.4cbf.6d0c11f6336f2d7a@ms249-lin-003.rotterdam.bazuin.nl>
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

I dont code in samba (yet) ;-) but reading this, im with Martin..=20
ShellCheck and tabs


> -----Oorspronkelijk bericht-----
> Van: samba-technical=20
> [mailto:samba-technical-bounces@lists.samba.org] Namens=20
> Martin Schwenke via samba-technical
> Verzonden: donderdag 10 februari 2022 23:55
> Aan: samba-technical@lists.samba.org
> CC: Andreas Schneider
> Onderwerp: Re: Shell script indentation
>=20
> Hi Andreas,
>=20
> On Thu, 10 Feb 2022 20:27:30 +0100, Andreas Schneider via
> samba-technical <samba-technical@lists.samba.org> wrote:
>=20
> > our shell scripts are a mess and we should try to fix this.=20
> So the first=20
> > questions is what do we want to use for indentation.
> >=20
> > Most of the Samba scripts use 4 spaces.
> > CTDB uses tabs (tabwidth: 8).
> >=20
> > We need to settle on one. Should we first collect arguments=20
> or directly start=20
> > a vote=3F
> >=20
> > 4 spaces or tabs (tw: 8)
>=20
> A prominent statement near the top of README.Coding.md says:
>=20
> * Use 8 Space Tabs to Indent
>=20
> This is in the context of C coding style.  However, I'd suggest that
> we attempt to be consistent for languages that have no official coding
> style.
>=20
> When Amitay and I started trying to ensure that CTDB's C code met
> Samba's coding guidelines, we also changed the default for shell
> scripts... to be consistent.  We have spent a lot of time moving
> scripts from 4 spaces to tabs.
>=20
> Although a small percentage of overall Samba code is shell scripts:
>=20
>   sh:           65132 (1.72%)
>=20
> a much more significant percentage of CTDB is shell scripts:
>=20
>   sh:           28004 (21.72%)
>=20
> Most of that is test code:
>=20
>   sh:           23160 (51.79%)
>=20
> [Above data generated using David A. Wheeler's 'SLOCCount'.]
>=20
> More than 40% of the shell script in Samba is in CTDB... and, yes, 1/2
> of our test code is shell scripts.
>=20
> Rather than focusing on style, I suggest that we attempt to use
> ShellCheck to improve shell scripts.  I realise this is much harder
> because it requires functional code changes rather than just=20
> formatting
> changes.
>=20
> Currently about 1/3 of CTDB's non-test scripts and a much smaller
> percentage of test scripts are checked using ShellCheck (with some
> exclusions to avoid churn on some trivial and too-hard things).
>=20
> A few years ago I added the -S option to ShellCheck to filter the
> minimum "error" level (e.g. error, warning, info, style) with the hope
> of using ShellCheck in Samba CI testing, starting by switching this on
> at error level.
>=20
> CTDB does quite amazingly on errors:
>=20
>   $ find -name "*.sh" | xargs shellcheck -s sh -S error
>   $ find -name "*.bash" | xargs shellcheck -S error
>   $ shellcheck -s sh -S error config/functions=20
>   $ shellcheck -s sh -S error tools/onnode=20
>   $=20
>=20
> Not quite so well on warnings, but fixing most of those=20
> should only be a
> few hours of work.  I say "most" because the scripts use a lot of
> include files, with functions that set globals, so there are a lot
> of SC2154 (var is referenced but not assigned) because=20
> ShellCheck can't
> follow the "non-constant includes".
>=20
> Sadly, I don't have time to fix the other warnings right now...  :-(
>=20
> So, I'll vote for tabs and ShellCheck filtering at error level.  :-D
>=20
> peace & happiness,
> martin
>=20
>=20


