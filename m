Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B37A62262B4
	for <lists+samba-technical@lfdr.de>; Mon, 20 Jul 2020 17:02:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=hfcYUjCX1BqhQa+IaAv567umt7uEuzhFGT6EG32uRSg=; b=VaeneQHfOR08EDWS8Lws6xyI2V
	062CSKi1BJWqov5S8RRg8JvEcwijUkQVDV6SHnTHeeiPtsQo/ah3q/iapeNOLIiqEJxQI3XkMuZJ/
	MBnbM57LSbTK2dyQoJwzz8Aot6u/Fd21YKrK9XoXEqVjXROTsn9PrBpmpFu31qTb1A+IDIDxC4Xl1
	rleK1EiPF1nDnaJhZFOR1l1DwhyZWGXa29bv6dCrsaPjrN60liZm7zMsWkI8IT0A1q6P674eXWzFA
	26xCWQ7h/Z/J/Vb9zrtq43yk6Wf/PrM7koUU+S7fNnoYZSwp20GuFNxmclIyqTWoVHaDTg2eJX+oG
	k6fmnbJQ==;
Received: from localhost ([::1]:30084 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jxXIf-008tk1-2H; Mon, 20 Jul 2020 15:01:53 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:35384) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jxXIY-008tju-KS
 for samba-technical@lists.samba.org; Mon, 20 Jul 2020 15:01:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=hfcYUjCX1BqhQa+IaAv567umt7uEuzhFGT6EG32uRSg=; b=tAK296wtD7hd25ik8jnYrL4S/y
 k/vRmd9VrIqfryxPFhZl7ezzfQklXIjDa4oGgd452eLQKUcSYmVIMzkX0IEE4wPLv08/ePud/DAyt
 5OFMdYYQoeJ+eDq2AAHXQyYkj2xkQ+HyHVotvhvNQ+7trrkIybO2s0it5ujlMaOaTiIQvuTm+YiRQ
 BILp4AW/rx5fa0XeUE4TRczHBjZjBqdJ/gINEztUIl/1o6tJDs+8W1CCoDBivTUalCRum2EuBAuqn
 /J5x31DCuMafarOwEo1TwVL16urDYnsFEfJaOdyYFO41lKTQfEOxcVlk3inrEWiO8FG7Am/hS4AX1
 yJeAXGwbJdj4yZAf31uaCKYpSXg67PHR5PEB1vz/A7tocAHgNaCiBmhcXtsRcyNmbmH7YNG/jsecc
 8UOGc4BoNRKKiSZWTKjZ2YkTm97KcMnIrCWBNHoPJelReLl9deka3ccf9asAjs77dww8pH8Dn7MIY
 X+JZLZYKWel00Af/IK+plNwY;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jxXIW-0003Sl-4i; Mon, 20 Jul 2020 15:01:44 +0000
Date: Mon, 20 Jul 2020 17:01:42 +0200
To: Ralph Boehme via samba-technical <samba-technical@lists.samba.org>
Subject: Re: PATCH: make disabling of vfs_snapper consistent with our
 configure/build system
Message-ID: <20200720170142.1583649f@samba.org>
In-Reply-To: <63044415-9473-1572-2cd5-fa1fa5e012e1@samba.org>
References: <20200710110737.GA1585556@sernet.de>
 <b4ea37e5-398d-c8d2-15e2-1a27f7655598@samba.org>
 <20200710114452.GB1572444@sernet.de>
 <54f90e98-9d7a-337e-defb-27fb756130fd@samba.org>
 <20200710194428.GA1596727@sernet.de>
 <63044415-9473-1572-2cd5-fa1fa5e012e1@samba.org>
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
From: David Disseldorp via samba-technical <samba-technical@lists.samba.org>
Reply-To: David Disseldorp <ddiss@samba.org>
Cc: =?UTF-8?B?QmrDtnJu?= Jacke <bjacke@samba.org>,
 Andrew Bartlett <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

[sorry about the late response. I just returned from vacation]

Hi Ralph and Bj=C3=B6rn,

On Mon, 13 Jul 2020 18:48:50 +0200, Ralph Boehme via samba-technical wrote:

> Hi all!
>=20
> Am 7/10/20 um 9:44 PM schrieb Bj=C3=B6rn JACKE:
> > On 2020-07-10 at 20:31 +0200 Stefan Metzmacher via samba-technical sent=
 off: =20
> >> I don't see why your change would be needed, I actually think it makes
> >> the situation worse, as --disable-snapper is no longer available =20
> >=20
> > I tried to descibe that in the bug report. Our correct way to disable s=
hared
> > modules is to use --with-shared-modules=3D'!module_name'.  That mechani=
sm gets
> > broken by 7ae03a19b3ca895ba5f97a6bd4f9539d8daa6e0a. So the new option
> > introduced by 7ae03a19b3ca895ba5f97a6bd4f9539d8daa6e0a is not needed an=
d it
> > makes our generic mechanism to disable the shared module stop working.
> >  =20
> >> and configure would just fail if dbus-1 is not available. =20
> >=20
> > that's what it currently also does. This is because in the discussion i=
t was
> > desired that this should be a forced enabled feature by default. Person=
ally I
> > would prefer forced-enabled features for developer builds if this is me=
ant to
> > detect failrures in autobuild. But that's another discussion. In any ca=
se
> > configure fails (intentionally) with 7ae03a19b3ca895ba5f97a6bd4f9539d8d=
aa6e0a
> > and without 7ae03a19b3ca895ba5f97a6bd4f9539d8daa6e0a by default if dbus=
-1 is
> > unavailable. =20
>=20
> of, what a mess! :)
>=20
> Currently the snapper configure check is the only one of the three
> (snapper, cephfs, glusterfs) VFS module configure options that implement
> --enable-NAME=3Dyes "correctly" (as per --enable-XXX configure semantics).
>=20
> The other ones (ceph, glusterfs) will just silently pass if a dependency
> is missing, effectively implementing default=3D"auto" behaviour.
>=20
> I don't think we want all of those modules to fail with a
> default=3D"true", that would result in too much configure churn while
> user's configure runs fail one after the other, forcing them to add
> --disable-XXX to the configure invocation.
>=20
> I guess we should just default to "auto" for all three modules.
>=20
> Here's a MR that implements this:
>=20
> https://gitlab.com/samba-team/samba/-/merge_requests/1461
>=20
> If we decide that we really want all three modules to use and enforce a
> default value of "true", this can be achieved by merely switching the
> defaults in the above MR.
>=20
> Thoughts?

When discussing 7ae03a19b3ca895ba5f97a6bd4f9539d8daa6e0a, Andrew and I
both agreed that "auto" behaviour is undesirable, as it leads to the
kinds of inconsistent build results carried in Matt's initial report
at https://bugs.gentoo.org/721320 .

I don't feel strongly as to whether or not vfs_snapper should be built
by default. https://gitlab.com/samba-team/samba/-/merge_requests/1335
eventually saw it enabled by default, with clear documentation on how
it can be disabled at configured time.

Given that Bj=C3=B6rn's initial complaint was with the inconsistent / broken
--with-shared-modules=3D'!module_name' behaviour, would it be okay if we
just fix --with-shared-modules=3D'!vfs_snapper' and drop
--enable/disable-snapper?

Either way, it'd be nice to wait for Andrew's input here too.

Cheers, David

