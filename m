Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A072336922D
	for <lists+samba-technical@lfdr.de>; Fri, 23 Apr 2021 14:33:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=tsHOIY/sCwtngUu5ppOc+ua9SKBJZX3wgX6EBzdL7l4=; b=j/OJCmVFTWSdfexb8ES/gzxS6I
	EK4tbHo+sUKTfGn80k32RCFkaQAs++KKxG3HBuF053bcz/P88C/5FyD2ObVz6yPSdSmZxLonSdiDz
	Re1d6gAUmsuK5fqEzbFpNHTv5Ru2xSpyrhgBuDUjn3zHkPSTUh3Xn0bCWP2uYy8+JZBRAnip5EfPs
	TzI9r46IT9jwIc+luIWjSajBfb4TfTDmU+/X8vGn79OkEfLtSw66On8q4kt+lVi1vW3rdiTXpOGSl
	R6MkRODVF/xB8pRHKYBpag2xdysizCPf0iGUoqeXzLdXciLfRxXoXVSE5N4ncCYAlLsRbffQfs0v+
	6WYRacTw==;
Received: from ip6-localhost ([::1]:55394 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lZuz1-00CDgG-VS; Fri, 23 Apr 2021 12:32:32 +0000
Received: from mailhopper2.bazuin.nl ([195.134.173.123]:41218) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lZuyt-00CDg9-4F
 for samba-technical@lists.samba.org; Fri, 23 Apr 2021 12:32:29 +0000
X-Bazuin-en-Partners-MailScanner-Watermark: 1619785928.73835@jGO+ojwd0NRFXMIh4mO0DA
X-Bazuin-en-Partners-MailScanner-From: belle@bazuin.nl
X-Bazuin-en-Partners-MailScanner: Found to be clean
X-Bazuin-en-Partners-MailScanner-ID: 089F511F36E.A4E23
X-Bazuin-en-Partners-MailScanner-Information: Please contact Bazuin en
 Partners for more information
Received: from ms249-lin-003.rotterdam.bazuin.nl
 (ms249-lin-003.rotterdam.bazuin.nl [192.168.249.243])
 by mailhopper2.bazuin.nl (Postfix) with ESMTP id 089F511F36E;
 Fri, 23 Apr 2021 14:32:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=bazuin.nl;
 s=mail20180308; t=1619181128;
 bh=aPq6Za8fNPZXZE2w3FJLg3X90eNI20djw9PdvqmnPmE=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=bZ1MMslP7tYhzXrvfIM9NFCfArGaGJq+/DL1wIGVLXJgZPfW686d1N87SltDe1iPl
 7vK1667gXRvhN6W2vyUv2DtyBwg5r82JaP8odma+txgG6yF3WRBEsCoToXmNPd5THA
 Oo13BKxRRBtGQmVYSeb2faOLyEffbNdNEZVBUcUVKxMBb79ZCFEPt54rKyTtC77wlP
 XqLmPN5SuOJeCNzpjnBwBb87WNN3LbRzAE+XCQmaQpsq3JkXBrPZ0lp0aqj8DHLzN0
 SoDKpj+pGst6SUXlFIzXmwnEGdtDKvx4pqfTF+5uuMpJ+2yl6zZ86T3X0K/LwFY9VI
 6FhUOWF53PvZA==
Received: from ms249-lin-003.rotterdam.bazuin.nl (localhost [127.0.0.1])
 by ms249-lin-003.rotterdam.bazuin.nl (Postfix) with SMTP id 2C89118C247A;
 Fri, 23 Apr 2021 14:32:12 +0200 (CEST)
Subject: RE: ctdb/utils/etcd/ctdb_etcd_lock python => python3
To: =?windows-1252?Q?samba-technical=40lists.samba.org?=
 <samba-technical@lists.samba.org>
Date: Fri, 23 Apr 2021 14:32:12 +0200
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210423205958.369ab466@martins.ozlabs.org>
References: <vmime.60816792.20dc.4140e8fec807bb2@ms249-lin-003.rotterdam.bazuin.nl>
X-Priority: 3 (Normal)
X-Mailer: Zarafa 6.30.19-25148
Thread-Index: Adc4PK7lTlFWNEQMQ7eoSQtioQmF0A==
Message-Id: <vmime.6082be4c.4114.8306c142307950c@ms249-lin-003.rotterdam.bazuin.nl>
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

=20
Hai Martin,=20


> How exactly does the build fail=3F
Well, i use cowbuild/pbuilder in Debian 10 and in the end lintian checks the packages and errors with.

E: ctdb: python-script-but-no-python-dep usr/lib/x86_64-linux-gnu/ctdb/ctdb_etcd_lock #!python3=20
Even after i added in debian/control
${python3:Depends} for CTDB package


>=20
> > I dont know if its really needed but all python references are used
> > with /usr/bin/env python3.=20
> >=20
> > Just to besure im not breaking something in ctdb here.=20
> > Can someone confirm this=3F=20
> >=20
> > My fix.
> >=20
> > --- a/ctdb/utils/etcd/ctdb_etcd_lock
> > +++ b/ctdb/utils/etcd/ctdb_etcd_lock
> > @@ -1,4 +1,4 @@
> > -#!/usr/bin/python
> > +#!/usr/bin/env python3
>=20
> I'd like to be able to give a better answer but I'm not entirely sure
> that the script works with python3 without any other changes.=20
>  It looks
> like it should but I don't have a trivial way of testing it=20
> (or time to setup a test environment).
>=20
> Given that /usr/bin/python isn't supported anymore, we might as well
> change it as above see what bug reports get generated.
>=20
> If you're keen to improve the script then you could try to clean it up
> and get rid of warnings from pylint and flake8.  getting rid of the
> obvious whitespace issues might make any python3 issues more obvious.
> Perhaps yapf3 would be useful=3F

I really wished i had these skills todo that, i would then..=20
:-(=20

>=20
> peace & happiness,
> martin
>=20

Thanks for the reply so far.=20

Greetz,=20

Louis


