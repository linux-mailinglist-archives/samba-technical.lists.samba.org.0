Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 283B55B48D6
	for <lists+samba-technical@lfdr.de>; Sat, 10 Sep 2022 22:44:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=J2O9Y3QUMDYqizbSamaQxUq9Ay8kNGz2ACrEoVQWe6w=; b=MYXitxovwdQ5EnWIPcnVLZ+Tob
	1lrrr5S2rS/4Sqe0n/CF1wjfYz6O18QMi2q/JhhOg3kNe9/UCXvU2890ml7I2tSAcMtlOGfZWEBnR
	06Y5k+SJtBodfVFtzRBTtopPVCS5G/fmTZfAN/xRSI6Ro6LTde2wi2LJchX+3FB+fODAGZilumQLM
	O5Qj46Lqflwf6ltXrsuXfE320qa6Eo5SB6aiqp0XgHTDH0ysIIQCMe03oSpl6Lfe1Ktct8BP70cxr
	XpDW5XEk2NNyExtvlWUnuVA4QhP/opwmPJZ+ks+ouI3yk8pHg8pyR0hCex3yz3VhKaxnt/px5tQdJ
	SWwV2U3g==;
Received: from ip6-localhost ([::1]:28268 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1oX7K8-000jVr-Vk; Sat, 10 Sep 2022 20:43:33 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:58944) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1oX7K3-000jVi-FW
 for samba-technical@lists.samba.org; Sat, 10 Sep 2022 20:43:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Cc:To:From:Message-ID;
 bh=J2O9Y3QUMDYqizbSamaQxUq9Ay8kNGz2ACrEoVQWe6w=; b=rZCHqg0UIi1eKI+uMWrH4f1kLG
 LV3QcBs8fvoKcWwqIC/QeNHr6cTgxTiTUiiz/ts80kFllAgokzUJidgf8VweOSiTHHYDPboCoVDsV
 rUgRAIVkF/IAfja+Bootc02SVWYPPL+iWrh6NtGATcq4EfxT3GVwz0gHZ8l6+xOhDwGDgWFf2a/W1
 Mly+hkGwE6v14hTenvl0kmhYMhgSlu5RQJc7C4VTPi+bJhvHkSvJEumQS9SLysq5OyRlHcQCKoKEl
 c3Wl7PB3hVDVmm8zubSl+P+5dNiQ726OM5Rl1rn3mFHAZNQdIkJukuG+xyTOJUUf4IaHQBYSI1Nml
 w3vanZHIhqFy6VmcVJbw/jUK7IsCNipEQFwEFxhklZhBTQapPnIvz3wDg2BeHbtW4velyu1l9J4vl
 eJAdjY9xCWj6ImGaQv/9M0Xzl75f3CUrb7E1uDVpceuKTILwb0dEuoJd810yjZ0td80+gO4I4XG8m
 NAiirrEz27g6RqYwZC6bJn9c;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1oX7Jt-000Gjv-OD; Sat, 10 Sep 2022 20:43:18 +0000
Message-ID: <3c7839ce9907bd9954a4b8dd4f4b427e71c51efe.camel@samba.org>
Subject: Re: ldb ABI versions in 4.17: should it include 2.5.1 & 2.5.2
 versions too?
To: Andreas Schneider <asn@samba.org>, samba-technical
 <samba-technical@lists.samba.org>
Date: Sun, 11 Sep 2022 08:43:14 +1200
In-Reply-To: <4428715.LvFx2qVVIh@magrathea>
References: <cc05692a-2a75-a9d8-6f33-88ffb91a9588@msgid.tls.msk.ru>
 <7e33db4d2504d4458ddc67aa5fac47a22592dce5.camel@samba.org>
 <84f22458-d5cc-f74c-9a35-596e22929f59@msgid.tls.msk.ru>
 <4428715.LvFx2qVVIh@magrathea>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4 (3.44.4-1.fc36) 
MIME-Version: 1.0
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
Cc: Michael Tokarev <mjt@tls.msk.ru>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Sat, 2022-09-10 at 14:29 +0200, Andreas Schneider via samba-
technical wrote:
> On Saturday, 10 September 2022 12:20:06 CEST Michael Tokarev via samba-
> technical wrote:
> > 09.09.2022 23:20, Andrew Bartlett via samba-technical wrote:
> > > On Fri, 2022-09-09 at 14:19 +0300, Michael Tokarev via samba-technica=
l
> > >=20
> > > wrote:
> > > > I'm not sure if this matter or not (since ldb is tied with samba), =
but
> > > > ldb in 4.17.0rc5 lacks versions 2.5.1 and 2.5.2 released within sam=
ba
> > > > 4.16.x series, while previous minor ldb releases are listed there.
> > >=20
> > > No, we don't normally include the branched history of ldb there.
> >=20
> > Maybe this is something which can be reviewed?
> >=20
> > The thing is.  Giving this ldb-2.5.2 version as an example.
> >=20
> > Let's imagine there's a program using ldb (linking with ldb).  And it
> > has been compiled with ldb-2.5.2.  And it uses, say,
> > ldb_msg_add_string_flags symbol.  When compiled/linked against ldb-2.5.=
2,
> > the executable is marked with NEEDS: ldb_msg_add_string_flags@LDB_2.5.2=
,
> > and generally needs LDB_2.5.2 version in libldb.
> >=20
> > Now we upgrade libldb from 2.5.2 to 2.6.1. But there, the same
> > ldb_msg_add_string_flags is versioned as LDB_2.6.1. But it is the
> > same symbol, doing exactly the same thing.
> >=20
> > So this program which were linked with ldb-2.5.2, will not run after
> > upgrade. - runtime linker will complain it can't find LDB_2.5.2 version
> > (and this symbol) in just-upgraded ldb-2.6.1.  So we'll have to
> > recompile the program just to fix the ldb versioning references.

Urgh.  That is awkward. =C2=A0

The challenge is that, as you know, this came in during a security
release, where we are normally trying not to bring in other unrelated
changes (so don't just backport the 'future' changes from master).=20
This is why we branched out the version numbers in the first place.=20

> > Maybe for ldb this is more theoretical, since main its user is samba,
> > and as far as I can tell, samba should use exactly the same version of
> > ldb at runtime as it were compiled with.  In debian we do have this
> > requirement now, - maybe someday it can be lifted, I dunno.  But for
> > other libraries this might be more interesting.
>=20
> I argued with this many times, but libldb is simply not a stable API and =
it=20
> should have never been released as a public library.

I tend to agree. =C2=A0

If I find some time at least I'm keen to try yet again (as I've had
some discussions to suggest an emerging consensus)=C2=A0to at least make ld=
b
an output of the Samba build (like libwbclient).   That doesn't solve
the full problem at all, but starts the walk backwards as far as we can
right now. =C2=A0

> The problem is that as it has been released and others started to use it =
(e.g.=20
> sssd). So whenever you update ldb you always have to recompile all projec=
ts=20
> depending on it.

I think that matches the actual promises Samba has the resources to
offer in this area. =20

> In RHEL we have marked libldb as ACG level 4
> https://access.redhat.com/articles/rhel8-abi-compatibility

Very wise.

Andrew,

--=20
Andrew Bartlett (he/him)        https://samba.org/~abartlet/
Samba Team Member (since 2001)  https://samba.org
Samba Developer, Catalyst IT    https://catalyst.net.nz/services/samba


