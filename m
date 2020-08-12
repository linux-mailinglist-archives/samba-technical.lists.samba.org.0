Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 646522428F5
	for <lists+samba-technical@lfdr.de>; Wed, 12 Aug 2020 13:59:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=W5FXw+xUCwPhPbSOrqLSEt/Xe8IKZMu0gklhwnhNNEM=; b=JU93rCKO3kIYwn1lro2ouUej7f
	pgeXoNRSEWjqhN+6zMdhqXL5dBd+A5XIF0Pcu3mkP18GLczZ+rzU2rHOWtJbFsuVWUV4RtL6W3Nwa
	4irBQ8hgdvHTPyDCsQ2CeLIFSXN4SroHZkra3DiC0IIUs5c5c6zZAfMKowJ3RRKNUtI8ZfR2W+JLN
	fbk96mCkuoCvRYEVJlEJ0AS5GKCjU9xoA82G28jIpzbmXJ/MsSeIOessqek6wJSxO/JLh/Om4wnHj
	uz9dMGpOJcB2aOir6WTBeMONYi03YhHVDck1O8CaHImB/7ogWriHwFL2GU7DpuhkrBz/fs2hV9DHR
	MId/1Elg==;
Received: from localhost ([::1]:39562 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1k5pP7-00DLrq-H0; Wed, 12 Aug 2020 11:58:49 +0000
Received: from mail.sernet.de ([2a0a:a3c0:0:25::217:2]:45337) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1k5pOz-00DLrj-Pq
 for samba-technical@lists.samba.org; Wed, 12 Aug 2020 11:58:44 +0000
Received: from intern.sernet.de by mail.sernet.de with esmtps (Exim 4.92 #3)
 id 1k5pOz-0003Tr-CS; Wed, 12 Aug 2020 13:58:41 +0200
Received: by intern.sernet.de
 id 1k5pOz-0000eD-85; Wed, 12 Aug 2020 13:58:41 +0200
Received: from bjacke by pell.sernet.de with local (Exim 4.93)
 (envelope-from <bjacke@sernet.de>)
 id 1k5pOz-001B8W-36; Wed, 12 Aug 2020 13:58:41 +0200
Date: Wed, 12 Aug 2020 13:58:41 +0200
To: Andrew Bartlett <abartlet@samba.org>, samba-technical@lists.samba.org
Subject: Re: PATCH: make disabling of vfs_snapper consistent with our
 configure/build system
Message-ID: <20200812115841.GD272474@sernet.de>
Mail-Followup-To: Andrew Bartlett <abartlet@samba.org>,
 samba-technical@lists.samba.org, David Disseldorp <ddiss@samba.org>,
 =?iso-8859-1?Q?Bj=F6rn?= Jacke <bjacke@samba.org>
References: <20200710110737.GA1585556@sernet.de>
 <b4ea37e5-398d-c8d2-15e2-1a27f7655598@samba.org>
 <20200710114452.GB1572444@sernet.de>
 <54f90e98-9d7a-337e-defb-27fb756130fd@samba.org>
 <20200710194428.GA1596727@sernet.de>
 <63044415-9473-1572-2cd5-fa1fa5e012e1@samba.org>
 <20200720170142.1583649f@samba.org>
 <15eadeabe4d9fc23e9a311a51a007fa020781ccc.camel@samba.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="wac7ysb48OaltWcw"
Content-Disposition: inline
In-Reply-To: <15eadeabe4d9fc23e9a311a51a007fa020781ccc.camel@samba.org>
X-Q: Die Schriftsteller koennen nicht so schnell schreiben, wie die
 Regierungen Kriege machen; denn das Schreiben verlangt Denkarbeit. - Brecht
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
From: =?utf-8?q?Bj=C3=B6rn_JACKE_via_samba-technical?=
 <samba-technical@lists.samba.org>
Reply-To: =?iso-8859-1?Q?Bj=F6rn?= JACKE <bj@SerNet.DE>
Cc: =?iso-8859-1?Q?Bj=F6rn?= Jacke <bjacke@samba.org>,
 David Disseldorp <ddiss@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>


--wac7ysb48OaltWcw
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On 2020-07-21 at 11:24 +1200 Andrew Bartlett via samba-technical sent off:
> As to 'auto' options, my position, and one that I thought we had agreed
> (it was written into BUILD_SYSTEMS.txt before that was removed, now in
> the wscript and source3/wscript) is that Samba should require all
> 'optional' libraries by default.

I'm not sure if I understand exactly what you mean here but for my
understanding we should not require optional libraries by default: If a fea=
ture
is enabled that requires a certain library it should be required of course.

The default values of configure feature flags has been a discussion with
different opinions since a while. When we had the autotools build system we
actually had almost(?) all feature configure options set to auto and we had
a really great portability also on all the different unix flavours. Looking=
 at
portability, we're still suffering these days from the move to waf. I just
mention this because the move to waf also was the point I think, where more=
 and
more features became not auto-enabled but enabled-by-default - no matter if
those features exists or makes sense on the platform that we build on or no=
t.
Also the move away from the buildfarm to the autobuild made us focused on L=
inux
only, which was probably another reason, why more features became
enabled-by-default. We never had a consent on this though, it just happened
silently.


> The reason, as seen here, is that auto behaviour creates a difficult
> issue for packagers.  Because packaging is a particular skill set, and
> there are a lot of small distributions most of our packagers (with
> exceptions of course) are not Samba experts.  The lack of a build
> output (eg a .so) may be the only indication they get that a feature
> has vanished when they package a new version of Samba. =20

configure --help gives a list and packagers should (and usually do) use the
--enable-foo configure flags to make sure that a wanted feature is actually
enabled.


> This is why auto-magic dependencies are a problem, even for non-
> developer builds.
>=20
> This appears to be a broad concern, these reasons apply beyond just
> Gentoo:
> https://wiki.gentoo.org/wiki/Project:Quality_Assurance/Automagic_dependen=
cies

that site makes a distinction between automatic and automagic. The bad
buildsystem thing that they call automagic, is when eatures cannot be
explicitly enabled or disabled. But our "auto" is automatic and not automag=
ic.


> Furthermore, in the real world my recollection is that it has really
> happened that the first this is noticed is when an end user finds their
> package is using a workaround (eg lp* based printing vs CUPS) or is
> missing a feature altogether.

I think if people compile their own samba version they are usually experien=
ced
enough to know what features they need to enable. Unexperienced users having
compile issues with Samba are not really a good argument to enable all feat=
ures
by default. Did I say all features? Of course we do *not* enable all featur=
es
by default only some, which is again an inconsistency.

> I realise that it is annoying for a individual systems administrator
> who is building Samba, particularly on a non-linux platform, to have to
> turn off many of our optional features first. =20

indeed, it is. And the list of --disable-feature options that needs to be u=
sed
there is continously growing. This is why I want to object to introduce mor=
e of
those.


> This is the reason we agreed that we would spit out an error as early
> in the build, not just a late compile failure. =20

as mentioned before, I don't think that we ever had a consent about the auto
vs. enabled-by-default feature.


> Thankfully the person in this situation is likely to understand what
> they are disabling and know if it matters for their particular install.
> Also, we know the vast bulk of Samba users get Samba via a distributor,
> so anything to make this more fail-safe is, in my view, worth the
> trade-off against the inconvenience of our manual builders.

I think auto need to be the default, package maintainers use the
--enable-feature configure options.

If you really strongly think that something like this is needed, you might
introduce a
--enabled-all-supported-features-available-on-this-platform-by-default opti=
on.
There is probably a nicer and shorter name for that but I wanted it to be
descriptive here.


> So, in this case, we certainly should make the behaviour consistent.  I
> don't mind if it is --enable/--disable or otherwise, as long as it is
> never 'auto', and the correct option to disable is listed in the error
> text.

hm, setting them all to disable by default doesn't look like a nice idea
either. I see really no problem with auto-enabling features. We did this all
the years before and most software packages do it that way. For deveoper bu=
ilds
or autobuild runs we use already have hooks to set different defaults, for
those builds we can also enable some more features by default that we want =
to
test in any case.

Bj=F6rn

--wac7ysb48OaltWcw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRTh3WYB8ykhrzLAI8xQwafzsNCPwUCXzPZbgAKCRAxQwafzsNC
P9faAQCB9WOBOG0buQvDd6nnVMEw8zfdJJUc0euNGAbJn/esXgD+IWjMkEil7Jc7
0RUN0hI6h+HxHZWxvb+8yeTraazdgg8=
=U2MK
-----END PGP SIGNATURE-----

--wac7ysb48OaltWcw--

