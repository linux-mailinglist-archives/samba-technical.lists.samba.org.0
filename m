Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D4B515A61E
	for <lists+samba-technical@lfdr.de>; Fri, 28 Jun 2019 23:03:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=3TB85ZsAV7LTFogWhuP+lvPZvISLMBiYkSYXy5M0r3c=; b=vZ7PcjaonLDR8YvHKV5Y8j1rGM
	V1B7JXyRQZ7DECGd8IApdxQaaYBqGGdJUmwpFs6xLyW8of6bpIne3u1FpDa1Nlu+yWYaqObxT5Ogp
	qNSTkxTyWW3WsbQZdYiHzfsAI0JYlQcUimQg+8fWUgpQvI+3iWOHPoc0Y5A/hvX9hu3cQTsqy9DfD
	qUWNOeN510JuKsytJ6EHcjsmrW5JvaPbQzXtdEaE9h4DEQ3Z+Wmo9/CDyMIUeYCf9XynrlceNA9Wd
	6el1rX+6QJNG272xW0hpvK97Wbz7rLiSSWSumm3wGSXvgsYY56lK5HY/U08HyNjJw2mmAoim9mVbR
	qxc6DKLQ==;
Received: from localhost ([::1]:19836 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hgy0y-002PAA-9L; Fri, 28 Jun 2019 21:02:36 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:15622) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hgy0t-002PA3-6j
 for samba-technical@lists.samba.org; Fri, 28 Jun 2019 21:02:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Message-ID:Cc:To:From:Date;
 bh=3TB85ZsAV7LTFogWhuP+lvPZvISLMBiYkSYXy5M0r3c=; b=lXYWoLm4XC40PoWF1L+pCxAcMq
 o0lF17Dexu0CGOnd66LnNnXEL+Wpy2femtFrym0a8S2Y0Zn8Jk7VAPSFNf6oSMr99qigrQkvgRpoY
 ZTnSR27T1TdiI1QGxSKjH+whuhRFZlWz/R2+O9MJLyate/rI3YWFu67vxCy6INj1p11Y=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hgy0r-0006BG-Ve; Fri, 28 Jun 2019 21:02:30 +0000
Date: Fri, 28 Jun 2019 23:02:27 +0200
To: Andrew Bartlett <abartlet@samba.org>
Subject: Re: An even better GitLab CI (was: Re: Document GitLab as the only
 way to contribute to Samba?)
Message-ID: <20190628210226.GD5892@samba.org>
References: <1561079117.28284.21.camel@samba.org>
 <20190628104624.GF32415@samba.org>
 <62bc808700dca7a08f3a61c6d7e676119c301843.camel@samba.org>
 <20190628114651.GB5892@samba.org>
 <d2f00126-4507-23de-df51-d41ee28b639a@samba.org>
 <20190628124010.GC5892@samba.org>
 <2bf77950a3762982c3f8b2666f906656a1a64e42.camel@samba.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="PHCdUe6m4AxPMzOu"
Content-Disposition: inline
In-Reply-To: <2bf77950a3762982c3f8b2666f906656a1a64e42.camel@samba.org>
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
Cc: Uri Simchoni <uri@samba.org>, samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>


--PHCdUe6m4AxPMzOu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2019-06-29 at 08:29 +1200, Andrew Bartlett wrote:
> On Fri, 2019-06-28 at 14:40 +0200, Michael Adam wrote:
> > On 2019-06-28 at 15:08 +0300, Uri Simchoni via samba-technical wrote:
> > > On 6/28/19 2:46 PM, Michael Adam via samba-technical wrote:
> > > > Ugh. That's really strange. Is this a gitlab design choice?
> > > > Because if it is, it's finally a thing (and quite a major one),
> > > > where gitlab is way worse than github. ;-)
> > > >=20
> > >=20
> > > To be fair, I don't know if GitHub even has CI. What I've seen in  FL=
OSS
> > > projects is that they have their Jenkins/Travis instance or something=
 of
> > > that sort (and who knows how many runners), and each PR would trigger=
 a
> > > run there, and success/failure would annotate the PR. GitHub just
> > > provides the webhook.
> >=20
> > That is true. CI is always external.
> > But you typically configure the repo to require those CIs passing
> > for a PR to become merge-able.
> >=20
> > > I do agree with the bottom line though...
> >=20
> > And don't get me wrong: I'm not advocating for github here.
> > I was just comparing with something I know better.
> > And if we could somehow tie the beefier CI with the core repo
> > and run it on every MR, that would be great.
> > But I probably need to read up on gitlab and it's ci etc.
>=20
> When we used Travis CI on GitHub we did the same thing, except we never
> had the full set of tests, it was always a cut down set.
>=20
> It started as just a compile and very few tests, but enough to catch
> the typical python whitespace errors and mixups between docs and
> loadparm.  Just before we killed it we got it similar to the 'shared'
> set on GitLab (I had to tweak it hard to get the run under an hour
> total).=20

Sure, Travis CI is too weak for full tests.
One project I have been working on is

https://github.com/heketi/heketi

(Just as background and for context: This is some kind of high
level service interface on top of gluster we use with it's
restful API for volume self-service in kubernetes.)

Here you can see that we are running Travis CI jobs automatically
for each PR. And it's mandatory for them to pass for being able
to merge. But the interesting bit is "centos-ci". This is a set
of resources donated (in this case, to the gluster project) by
the centos project with jenkins and all where we can run full
integration tests with a couple of VMs etc. So we have integrated
this centos-ci for the heketi project to set up a 4-node libvirt
cluster with vagrant to run functional/integration tests.
But (here it gets interesting): we don't run them unconditionally
for each PR, but a team member has to do a magic incantation in
a comment in the PR to trigger this run. This works quite well,
and you can make these tests optional or mandatory for being able
to merge. We have the full control over what we run and how long
it may run.

> I'm also kind of glad the CI is attached to the repo in one sense only:
> The private runners are (after credits) at the Samba Team's cost.=20
> Abuse of free CI runners is a real thing, and so I'm more comfortable
> with the risk when we can manually vet/ban users.

Understood. This is a very valid argument, too!

> The fix is to:
>  - Reduce the time spent in each job by:
>   - use the pipeline feature in GitLab more to split the compile into a
> different job
>   - passing the compiled output (or primed ccache cache) to the 'test'
> runners. =20
>=20
>  - Remove the dependency on an ext4 file system in our SMB tests or
> find a way to get to ext4 on the shared runners (and not unionfs)
>=20
>  - Reduce further the resource use of our tests
>   - shut down smbd/samba processes when we are done with them in
> selftest.pl
>   - optimise the memory use of smbd/samba even more
>=20
> All very much practical tasks, we just need help.  I'm always available
> to consult, but I can't take on this much myself.  It would suit a
> (new?) enthusiastic developer who is keen to make a mark and is willing
> to streach the boundaries and try the 'impossible' to prove it isn't
> really.

Just (thinking out of the current gitlab-ci) box (but inside my
area of experience): Is it possible to add some other CI runs in
gitlabl that would trigger via some web-hooks? Those could be
used for real cluster tests with multiple VMs, or tests that have
other special requirements that the free CI runners can not
satisfy (like ext4 ...). Alternatively, could we integrate other
external runners with the existing CI?
Just checking the conceptual possibilities.
(Maybe we need to have a video call and you can walk me thorough
how it is working in the backend, Andrew, so I can understand
better...)

Cheers - Michael


> Thanks,
>=20
> Andrew Bartlett
> --=20
> Andrew Bartlett                       http://samba.org/~abartlet/
> Authentication Developer, Samba Team  http://samba.org
> Samba Developer, Catalyst IT          http://catalyst.net.nz/services/sam=
ba
>=20
>=20

--PHCdUe6m4AxPMzOu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQQ4hxRJ4GXWNWIKYh7JT0k4GE+QNAUCXRaAYAAKCRDJT0k4GE+Q
NBi+AJ92BsTaKJtmI0L9jxOP003DuH3KOwCaAuAPsG+uJ1Lpr/nxV+9RD74W/rA=
=7RO3
-----END PGP SIGNATURE-----

--PHCdUe6m4AxPMzOu--

