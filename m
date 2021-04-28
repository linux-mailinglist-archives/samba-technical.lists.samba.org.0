Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D0EC36D63F
	for <lists+samba-technical@lfdr.de>; Wed, 28 Apr 2021 13:14:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=rLwsARg+iw3zS+01RXMrxCpG6fbKw5nl1ZABfXGJ+h8=; b=NwU6eGE1IuF4wXlxPvbgdRcIwv
	XbHRG/KMkoEE1jzhWQXbkLLPkgavCmhrjlqZrPiqRv6obkJzVklqPg2lAQF/So62Q8P+7ddFIYeC9
	a+AI06OUWhwn0DjYPjf0rfNkblqWLY/dokaif5PX7yCFKmu1VYjIBwjbZzY/35DmE0N/s0IrPNIaO
	e5fDlgQesyIt1EVSUtUyeiuFhuC9JVQBPoMS+ETMjrLNwluEzujhqZMuG4ng++gWXtAiD6vZVTD8s
	Dz670TyWWsXhKkfqa+vYfL87+VPMmWsArmtv3zSl1i3s+hpOcwrEKjZyX+jybP+y2liUbC+006fnn
	nNmH4jQA==;
Received: from ip6-localhost ([::1]:31164 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lbi8Y-00CrSV-7L; Wed, 28 Apr 2021 11:13:46 +0000
Received: from mailhopper2.bazuin.nl ([195.134.173.123]:59874) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lbi8S-00CrSO-UT
 for samba-technical@lists.samba.org; Wed, 28 Apr 2021 11:13:43 +0000
X-Bazuin-en-Partners-MailScanner-Watermark: 1620213207.77739@1UVGAx4YO0RXzDYQJlQWYA
X-Bazuin-en-Partners-MailScanner-From: belle@bazuin.nl
X-Bazuin-en-Partners-MailScanner: Found to be clean
X-Bazuin-en-Partners-MailScanner-ID: A049211F01A.A670D
X-Bazuin-en-Partners-MailScanner-Information: Please contact Bazuin en
 Partners for more information
Received: from ms249-lin-003.rotterdam.bazuin.nl
 (ms249-lin-003.rotterdam.bazuin.nl [192.168.249.243])
 by mailhopper2.bazuin.nl (Postfix) with ESMTP id A049211F01A
 for <samba-technical@lists.samba.org>; Wed, 28 Apr 2021 13:13:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=bazuin.nl;
 s=mail20180308; t=1619608406;
 bh=jEs10UAFc9xwblqMIeQ2Cb5EC8BynWzz27cmH9MVqrI=;
 h=Subject:From:To:Date:In-Reply-To:References:From;
 b=Eyvx8593QIUbq8x+Twg4PrzpbmOc7hV9lbuLkLR0zfDxTOPna4fXj9erUS8bPUQFm
 ouedvX56E96nB4y8aMc9SPdIrISkF5hL4XqgjmegSUogDYsNSXvAU7kDbMpYh5xXgi
 vbJzrt9gYq9rswH2hMdPD4+Ru3LRcCeVyvOAKPmG52rJR/exwkgf+sedQvIDqHq+ER
 yI9s5TkTgZOYE/tW88RKFpdCQablSOG2zeok809HYebhXsKyVwEKrRnjOhOnHyWeR+
 oc/Wa1c0WHL2ZCUiU0j7FHyC06w3MFn2/FpweCkdZLcG/5PCjtY7JlMYmoMf7jeZb4
 VovM/rypG5MiQ==
Received: from ms249-lin-003.rotterdam.bazuin.nl (localhost [127.0.0.1])
 by ms249-lin-003.rotterdam.bazuin.nl (Postfix) with SMTP id 8922018C249A
 for <samba-technical@lists.samba.org>; Wed, 28 Apr 2021 13:13:32 +0200 (CEST)
Subject: RE: ctdb/utils/etcd/ctdb_etcd_lock python => python3
To: =?windows-1252?Q?samba-technical=40lists.samba.org?=
 <samba-technical@lists.samba.org>
Date: Wed, 28 Apr 2021 13:13:32 +0200
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210428205009.6670d5ca@martins.ozlabs.org>
References: <vmime.6082be4c.4114.8306c142307950c@ms249-lin-003.rotterdam.bazuin.nl>
X-Priority: 3 (Normal)
X-Mailer: Zarafa 6.30.19-25148
Thread-Index: Adc8H4XdXjEQ2XrJSSaOTIikXhiq8A==
Message-Id: <vmime.6089435c.6458.7483af847178031c@ms249-lin-003.rotterdam.bazuin.nl>
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

Hai Martin,=20

=20

> -----Oorspronkelijk bericht-----
> Van: Martin Schwenke [mailto:martin@meltin.net]=20
> Verzonden: woensdag 28 april 2021 12:50
> Aan: L.P.H. van Belle
> CC: samba-technical@lists.samba.org=20
> Onderwerp: Re: ctdb/utils/etcd/ctdb_etcd_lock python =3D> python3
>=20
> Hi Louis,
>=20
> On Fri, 23 Apr 2021 14:32:12 +0200, L.P.H. van Belle <belle@bazuin.nl>
> wrote:
>=20
> > > How exactly does the build fail=3F =20
>=20
> > Well, i use cowbuild/pbuilder in Debian 10 and in the end lintian
> > checks the packages and errors with.
> >=20
> > E: ctdb: python-script-but-no-python-dep=20
> usr/lib/x86_64-linux-gnu/ctdb/ctdb_etcd_lock #!python3=20
> > Even after i added in debian/control
> > ${python3:Depends} for CTDB package
>=20
> OK, Debian build fails.  Now I understand...  :-)
:-) yeah, i only do Debian and Ubuntu..=20

>=20
> > > > I dont know if its really needed but all python=20
> references are used
> > > > with /usr/bin/env python3.=20
> > > >=20
> > > > Just to besure im not breaking something in ctdb here.=20
> > > > Can someone confirm this=3F=20
> > > >=20
> > > > My fix.
> > > >=20
> > > > --- a/ctdb/utils/etcd/ctdb_etcd_lock
> > > > +++ b/ctdb/utils/etcd/ctdb_etcd_lock
> > > > @@ -1,4 +1,4 @@
> > > > -#!/usr/bin/python
> > > > +#!/usr/bin/env python3 =20
> > >=20
> > > I'd like to be able to give a better answer but I'm not=20
> entirely sure
> > > that the script works with python3 without any other changes.=20
> > >  It looks
> > > like it should but I don't have a trivial way of testing it=20
> > > (or time to setup a test environment).
> > >=20
> > > Given that /usr/bin/python isn't supported anymore, we=20
> might as well
> > > change it as above see what bug reports get generated.
> > >=20
> > > If you're keen to improve the script then you could try=20
> to clean it up
> > > and get rid of warnings from pylint and flake8.  getting=20
> rid of the
> > > obvious whitespace issues might make any python3 issues=20
> more obvious.
> > > Perhaps yapf3 would be useful=3F =20
> >=20
> > I really wished i had these skills todo that, i would then..=20
> > :-(=20
>=20
> Let's just make the obvious change that you suggested.   If we only
> support Python 3 then we can't leave this script at Python 2.  If it
> breaks then someone can report a bug and hopefully send a patch.
>=20
> Can you post a git version of the patch with your=20
> Signed-off-by: line or
> should I do that and just push it with my Reviewed-by:=3F

Yes please do, im atm not setup for git and before i push things into git
I need to be better with my git skills, its to easy for me to mess things
up in the samba git.  :-/=20

>=20
> Does the fix need to be backported to released versions or is master
> enough=3F

I think master is ok.=20

>=20
> We don't have any tests for that script and I don't have time to write
> one - I'm guessing that to limit the dependencies we'd need to fake up
> a simple etcd or something... seems like a lot of work.
Well, the current fix in the end for the debian packaging was the=20
 ${python3:Depends} in the ctdb package so that ok now.=20

We could add python2 also but didn't we move to python3 because python2 is predicated=3F=20

>=20
> I've done some hacking using autopep8 (rather than yapf3) and then
> fixing a bunch of things reported by flake8.  I'll look at=20
> pushing some of them some time later...
>=20
> Thanks...

Well, Thank you Martin for the replies.=20
Have a great day.=20


Greetz,=20

Louis




