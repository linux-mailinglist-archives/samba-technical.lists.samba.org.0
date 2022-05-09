Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A8685209B6
	for <lists+samba-technical@lfdr.de>; Tue, 10 May 2022 01:54:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=8og8gmpLDfWpTnsGg43Y4qru759orsP9nywoqYtuaiE=; b=hVcxC4vcMRFYsxhXRktZpfzCOn
	5c/23DdHv19A49Wc71js8suzcKOUXmV/trfsWHvqut8t+D/r490+b6lCMNDyDjFupn1hS0PGJ2Wt8
	97RUyQfO9jUm9QjEafyrspmuTY1h/ZLDVyf624S0XiHLGTKwjx2yR1vrwVMwMv9a3sPnEh59e1Ud8
	v23VEpRWsN2qCzr3w/+XgKHKGBftcbktAmtuxDLAtkIaWBRsZOc+HxZGjZsUiIw1btruUzLUQOoPU
	n2cA6JIkvN6rVYu0cNlx8/vdY+0rEFn5wgoxbCq67LEOF4DJQhWvMWlv7KLXALT4qwLUp4QtG3Q56
	DsHE9SKQ==;
Received: from ip6-localhost ([::1]:19860 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1noDBj-0007Sr-N4; Mon, 09 May 2022 23:53:15 +0000
Received: from mailtransmit04.runbox.com ([2a0c:5a00:149::25]:42108) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1noDBe-0007Si-4w
 for samba-technical@lists.samba.org; Mon, 09 May 2022 23:53:13 +0000
Received: from mailtransmit03.runbox ([10.9.9.163] helo=aibo.runbox.com)
 by mailtransmit04.runbox.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <tnagy@waf.io>) id 1noCjW-00AD2w-TJ
 for samba-technical@lists.samba.org; Tue, 10 May 2022 01:24:06 +0200
Received: from [10.9.9.127] (helo=rmmprod05.runbox)
 by mailtransmit03.runbox with esmtp (Exim 4.86_2)
 (envelope-from <tnagy@waf.io>) id 1noCjW-0007MC-HC
 for samba-technical@lists.samba.org; Tue, 10 May 2022 01:24:06 +0200
Received: from mail by rmmprod05.runbox with local (Exim 4.86_2)
 (envelope-from <tnagy@waf.io>) id 1noCjW-0005xO-Fz
 for samba-technical@lists.samba.org; Tue, 10 May 2022 01:24:06 +0200
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Received: from [Authenticated alias (664370)] by runbox.com with http
 (RMM6); for <samba-technical@lists.samba.org>; Mon, 09 May 2022 23:24:06
 GMT
To: "samba-technical" <samba-technical@lists.samba.org>
Subject: Re: waf, PYTHONHASHSEED & -I order on other architectures
Date: Tue, 10 May 2022 01:24:06 +0200 (CEST)
X-RMM-Aliasid: 664370
X-Mailer: RMM6
In-Reply-To: <61faf7be6359dfb8a87445041b2b1ccac23d147e.camel@samba.org>
Message-Id: <E1noCjW-0005xO-Fz@rmmprod05.runbox>
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
From: Thomas Nagy via samba-technical <samba-technical@lists.samba.org>
Reply-To: Thomas Nagy <tnagy@waf.io>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Mon, 09 May 2022 08:53:12 +1200, Andrew Bartlett via samba-technical <sa=
mba-technical@lists.samba.org> wrote:

> On Sat, 2022-04-09 at 09:41 +0300, Michael Tokarev via samba-technical
> wrote:
> > Hi!
> >=20
> > I'm having a build failure of samba on sparc64.  It fails due to
> > finding
> > wrong include for <gssapi/gssapi.h>, as it has already seen before
> > due to
> > PYTHONHASHSEED not being set, having python hashes in random order so
> > -I
> > includes were unpredictable.
> >=20
> > The good -I order is this:
> >=20
> >   -Ithird_party/heimdal/lib/gssapi
> >   -Ithird_party/heimdal/lib
> >=20
> > the bad is:
> >=20
> >   -Ithird_party/heimdal/lib
> >   -Ithird_party/heimdal/lib/gssapi
> >=20
> > (I picked up only the -I options for dirs where <gssapi/gssapi.h>
> > exists).
> >=20
> > This is stable on sparc64, all builds of samba-4.16 are failing due
> > to
> > this very issue.
> >=20
> > How to work around this?
>=20
> I agree that at this point there is a bug, but nobody has had the time
> to work out the missing dependencies or get into the guts of waf to get
> a more proper solution.=20

About the guts of waf:

When changing the PYTHONHASHSEED value in the Makefile and adding traces (-=
-zones=3Ddeps):
"""
WAF_BINARY=3D$(PYTHON) ./buildtools/bin/waf --zones=3Ddeps
WAF=3DPYTHONHASHSEED=3D20 WAF_MAKE=3D1 $(WAF_BINARY)
"""

A full rebuild is observed here. The library link order changes as reflecte=
d by the traces below:

with PYTHONHASHSEED=3D10: deps computed dependencies for target ldb_ildap: =
uselib=3D[] uselib_local=3D['talloc', 'ldb', 'tevent', 'samdb', 'cli-ldap',=
 'samba-security', 'samba-credentials'] add_objects=3D['ldb_ildap.objlist']

with PYTHONHASHSEED=3D20: deps computed dependencies for target ldb_ildap: =
uselib=3D[] uselib_local=3D['tevent', 'samba-security', 'cli-ldap', 'samba-=
credentials', 'talloc', 'ldb', 'samdb'] add_objects=3D['ldb_ildap.objlist']

They take their origin in the file buildtools/wafsamba/samba_deps.py before=
 reaching the Waf parts. That file contains a significant amount of non-tri=
vial set() operations.

Even if a hash seed is provided, the link order may change with a new Pytho=
n version or on a different operating system.

Thomas


