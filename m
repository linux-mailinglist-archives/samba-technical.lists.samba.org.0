Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id C6A5367A08B
	for <lists+samba-technical@lfdr.de>; Tue, 24 Jan 2023 18:53:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=48/AagDDe4p5oDbnMwjlpGxpbiNqY4UOdBcclNMHcWU=; b=dw6Qly+OF7ITCC38pprdkInLvd
	DKZ+Vepblzj4lLrr7Mo6leP3XKT0UvL1GAmW6HWRUvAe8N6cF5tHT+NoAW7/9ktd+gJaItlwIYzW4
	kVemFoEkZwOO6qMKDEVUr2nvLLatNoQybMYeqhnGegR8TyectX+V2CcTFGO8M5hx8WKfgdMO3ImXr
	Q7MohWK3TRnCRf0ocTE6fu0IOkQcPzyV2wpkX+tt4rorfixEFD4PrabFr4RADYKYkSNIR3S1RZRX5
	mQ9axJziGFofU6GEPom8QVoV8XbCcFy+vDY16D+w5IXHVoDlC/Mym3e5NTOkLgdKj6GJJJTpE60cx
	sEaLJ0OA==;
Received: from ip6-localhost ([::1]:21298 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pKNTt-002FHx-U7; Tue, 24 Jan 2023 17:53:14 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:37206) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1pKNTo-002FHo-7e
 for samba-technical@lists.samba.org; Tue, 24 Jan 2023 17:53:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=bJa9Tgx3FUkjBj6WV6F/IKWue9IEObAvsHtBn1Wl64I=; b=s8u/rWljbGtWRaV7tJgxrfsBZY
 3BHBHyKnlI0P6NlggZNQHSqRegpfGwFVe0C/WugAEloqvO5Au+fvAauCGP+Wsoejz7y88/nuxc5pd
 m8xtWM/6g9D+0HaGlWXqejvj99jj7dqDhA7nv0/QssB3mPcKyzk1sfxyxQSrrEkFKfXVWgSLuKJ2M
 qa+s9ne+LMXcdDd7xvR5Ohp04EQ8H0Hj8RNJEGUScWBKvuFQ1miOxgefBAezP+AWgsU/pyoZ7Kyiw
 oR7g8WbB8CJpBym5Ef4f/OtB49qiUvTO6ORLiC/PdheNBdoyR3IkxELwfxXGtJVngf1rGG7jOdNo5
 CP4hh23DInrwcZQfs+Yw+DHjUgFNfZv0KnuC5p4r5d5LlDuMX6H+f7ZdqAoRsMSo97k4dy7rihYg+
 DHkmzW8OccpbH5nLgOnet0L1Ecx9+TvacnfK3KPf1NXntkC5HAk4jrFsrYw+dwAeVqmjoZpLwaBLw
 blDefrhgtuvKlQb2eUgBvel6;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1pKNTl-00A7T5-W6; Tue, 24 Jan 2023 17:53:06 +0000
Message-ID: <60a3db9e7b48cfe6ac5ab3148839a6922889aa1f.camel@samba.org>
Subject: standard samba git commands
To: Andreas Schneider <asn@samba.org>, samba-technical@lists.samba.org, 
 Stefan Metzmacher <metze@samba.org>
Date: Wed, 25 Jan 2023 06:52:59 +1300
In-Reply-To: <3744464.kQq0lBPeGt@magrathea>
References: <E1pKFPN-006HUv-Jj@hrx0.samba.org>
 <c08b0b3f-8ef5-1063-5412-18e96a1809e9@samba.org>
 <1869592.tdWV9SEqCh@magrathea> <3744464.kQq0lBPeGt@magrathea>
User-Agent: Evolution 3.46.3 (3.46.3-1.fc37) 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
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
From: Andrew Bartlett via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andrew Bartlett <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tue, 2023-01-24 at 17:54 +0100, Andreas Schneider via samba-
technical wrote:
> On Tuesday, 24 January 2023 14:50:37 CET Andreas Schneider via samba-tech=
nical=20
> wrote:
> > > > commit 35a32171b5067d5b80acffc99f8d43cdc7f5f9a7
> > > > Author: Volker Lendecke <vl@samba.org>
> > > > Date:   Wed Jan 11 08:18:35 2023 +0100
> > > >=20
> > > >      smbd: Fix a typo
> > > >     =20
> > > >      Signed-off-by: Volker Lendecke <vl@samba.org>
> > > >      Reviewed-by: Stefan Metzmacher <metze@samba.org>
> > >=20
> > > These were all reviewd by me...
> > >=20
> > > metze
> >=20
> > I suggest to use my `git review+` tool :-)
> >=20
> > https://git.cryptomilk.org/users/asn/dotfiles.git/tree/git/bin/git-revi=
ew+
> >=20
> > same for signoff:
> > https://git.cryptomilk.org/users/asn/dotfiles.git/tree/git/bin/git-sign=
off+
>=20
> Oh and I have a review check in for my 'autobuild' command.
>=20
> https://git.cryptomilk.org/users/asn/dotfiles.git/tree/git/.gitconfig#n11=
3
>=20
> line 113-119
>=20
> This will warn you if there are unreviewed patches.
>=20

For a long time I've been keen to see us have team-standard tooling in
this area. =C2=A0It would be great if a ./configure (perhaps only with --
enable-developer) would set up an agreed set of standard git aliases
for the current repo, alongside the pre-commit hook. =C2=A0This would help
new and old users alike, and allow us to document these things in our
wiki and pass around updated tools consistently.=C2=A0

Andrew Bartlett

--=20
Andrew Bartlett (he/him) https://samba.org/~abartlet/
Samba Team Member (since 2001) https://samba.org
Samba Developer, Catalyst IT https://catalyst.net.nz/services/samba

