Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id EA73E59960
	for <lists+samba-technical@lfdr.de>; Fri, 28 Jun 2019 13:47:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=SZAFz19gididPOnGoHzzJcq1MxiYzHYORxr0g9vZ5xg=; b=HdlI8YMVAAoC9CZO+diu49CtBR
	urPbKSYYdd5DIiWnzr3ndFgWarLZelain7ywtOEA8/zu5cgXYofn71AKD/Ec5B3su+WtNts0iLWuV
	eiYuwQXwYhjIER4CzWCxyDMT21oDXLJuKcbxbgRsJoDXc/qyfVur8YKpafAr0UjltQABUCV+quMa9
	nVSh5Gq7jnO90fWhyyNyQZj344K9VYCVF1Y1ZhBqkEXkdpoKgLYnDIB68LfnfsFWdenbh8/SpFJEF
	L3jUXghbJDuY6+9xkzLUiY3EDhuyRBvVxxwXC7SpP76oIy/Ifbgf39rQ+Abe4BuRgY9Vn69hshURM
	q4ziOHzg==;
Received: from localhost ([::1]:40344 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hgpLG-002Kp5-30; Fri, 28 Jun 2019 11:46:58 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:64376) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hgpLB-002Koy-RD
 for samba-technical@lists.samba.org; Fri, 28 Jun 2019 11:46:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Message-ID:Cc:To:From:Date;
 bh=SZAFz19gididPOnGoHzzJcq1MxiYzHYORxr0g9vZ5xg=; b=nAUma58Pf5mTUmWEv8whRECiI1
 fGqVO1RpB/iM7yyVWUpeVfSEA5+wP/H2E7B8Wxx1ibnx8IK4JGqXeYrkY6t1LTdc7/R52kNmRHKhp
 f55TJf+/XTe4yd2i98wWW3o+dDPiq5/xpUONDzsDK3utj3NFaBffPMtcQlOy1/f5Xc6I=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hgpLB-0000Qy-6f; Fri, 28 Jun 2019 11:46:53 +0000
Date: Fri, 28 Jun 2019 13:46:52 +0200
To: Andrew Bartlett <abartlet@samba.org>
Subject: Re: Document GitLab as the only way to contribute to Samba?
Message-ID: <20190628114651.GB5892@samba.org>
References: <1561079117.28284.21.camel@samba.org>
 <20190628104624.GF32415@samba.org>
 <62bc808700dca7a08f3a61c6d7e676119c301843.camel@samba.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="3lcZGd9BuhuYXNfi"
Content-Disposition: inline
In-Reply-To: <62bc808700dca7a08f3a61c6d7e676119c301843.camel@samba.org>
User-Agent: Mutt/1.11.4 (2019-03-13)
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
From: Michael Adam via samba-technical <samba-technical@lists.samba.org>
Reply-To: Michael Adam <obnox@samba.org>
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>


--3lcZGd9BuhuYXNfi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2019-06-28 at 22:52 +1200, Andrew Bartlett via samba-technical wrote:
> On Fri, 2019-06-28 at 12:46 +0200, Michael Adam wrote:
> > On 2019-06-21 at 13:05 +1200, Andrew Bartlett via samba-technical wrote:
> > > [...]
> > > So, I would like to propose this.  That given the practice of the Sam=
ba
> > > Team and almost all contributors is to contribute via a merge request
> > > against https://gitlab.com/samba-team/samba that we document this, and
> > > only this, as how to contribute to new patches to Samba.
> > >=20
> > > [...]
> > >=20
> > > Essentially it would mean a better version of this being prominently
> > > placed:
> > >=20
> > > https://wiki.samba.org/index.php/Samba_CI_on_gitlab#Creating_a_merge_=
request
> >=20
> > There is one thing I find confusing about the above page and that
> > needs to be cleared: It creates the impression that the only way
> > to file a merge request for samba via gitlab is to get access to
> > the CI repository https://gitlab.com/samba-team/devel/samba
> > and push to a personal subdir+branch there and create a MR from there.
> >=20
> > In contrast, if I get it right, I think the *normal* way to file a MR,
> > would be to create your own personal fork of https://gitlab.com/samba-t=
eam/samba
> > on gitlab, push your branch there, and create a MR from there.
> > Upon filing the MR, the CI is triggered on the proposed patchset.
> >=20
> > My understanding is that the CI repo is intended to give access
> > to the CI with*out* requiring to file a MR to the main repo.
>=20
> Sadly no.  Any repo can do the CI, and a personal fork can file a merge
> request.  That is the normal way to use GitLab.
>=20
> Unfortunately Samba is special, and some of our tests need larger
> runners while others need ext4 file systems.  Both of these force us to
> maintain our own runners.
>=20
> However CI runners are attached to the *source* of the merge request,
> not the target, so need to come from (this specific) samba-team repo.

Ugh. That's really strange. Is this a gitlab design choice?
Because if it is, it's finally a thing (and quite a major one),
where gitlab is way worse than github. ;-)

Over the past few years, I've been working a lot on projects that
are using github, and there, the repository that you file a PR
(pull request) against defines what CIs and what test suites are
run against the PR. (And each project can define extra, custom
CIs to run via web-hooks, etc.) Honestly, having the source of the
MR define what CI to use and what tests to run doesn't seem to
make any sense to me at all.. :-(

I hope I misunderstood.
Maybe you can elaborate a bit more.

> Some magic ensures we still do a lot of CI on user private
> repositories, so eg a docs fix or new debug message is pretty safe from
> a personal fork, but a full check requires that repo.=20
>=20
> I bit of a wrinkle I know, but the best we can mange so far.=20
>=20
> I hope this clarifies, or at least provides some amusement!

Both. ;-)

Cheers - Michael

> Andrew Bartlett=20
> --=20
> Andrew Bartlett                       http://samba.org/~abartlet/
> Authentication Developer, Samba Team  http://samba.org
> Samba Developer, Catalyst IT          http://catalyst.net.nz/services/sam=
ba
>=20
>=20
>=20

--3lcZGd9BuhuYXNfi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQQ4hxRJ4GXWNWIKYh7JT0k4GE+QNAUCXRX+KwAKCRDJT0k4GE+Q
NHXIAKCDG31PTH9/8xcWbWPViC4shnRbhwCfZ98xftz0kmpSb9wCQqAfu2uytv0=
=Xitj
-----END PGP SIGNATURE-----

--3lcZGd9BuhuYXNfi--

