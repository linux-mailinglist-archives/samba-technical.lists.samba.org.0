Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FBE058DFA
	for <lists+samba-technical@lfdr.de>; Fri, 28 Jun 2019 00:31:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=O2b4BsPOVULWe8/W/mljN86QmEP/UOUsSt3I34ku0QI=; b=bssuri9VLwdfbaghdaQ72WB2ig
	s52VEtFEHXXJUPTA0Ei+TIqelNS7g0cx1qxnxDdnXrqxezJVnrcmOV/0VWOjXW7aQB9E2C9O2qRmk
	cjV+MUDpzqF1iklXh0VAUtI7uGMejvBtGruzfg05hjni+m7LHvULLXOW+fCZvj/HGGqYyLBU2jym5
	XUxXD+5gjxi3jCYIIrcFDRW4yoKMFS64RNwtMmEgEB9lEgQlt9zSKMV3h40+X6uHDpsNVkn8YopQd
	4P0ayyTMJOmAUy8xAqfBzMSxP1g6+vjPpEmdCMlv20xMSh1k+rK0ol20Gf7A/yCeNouSccMnmSehw
	pGj+3jCA==;
Received: from localhost ([::1]:53916 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hgcv5-002F3l-HI; Thu, 27 Jun 2019 22:31:07 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:41446) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hgcv1-002F3e-00
 for samba-technical@lists.samba.org; Thu, 27 Jun 2019 22:31:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Message-ID:Cc:To:From:Date;
 bh=O2b4BsPOVULWe8/W/mljN86QmEP/UOUsSt3I34ku0QI=; b=Ze/sWcfVlEvp211ePp3R8E3xIU
 RpPU4hPThxfBWCo+sALt9hY0FBFnlxwBI0il/W8mWmU+7z8XfykbGh610TJ/sJo/gwpHYIdXaLMCy
 oeuFNI5enYvKeeYJsfjhv0xvmOHxMnZeVqKS61jZVs3/BfvmfrEm2fjORIC71zdkfVPw=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hgcv0-0002DD-63; Thu, 27 Jun 2019 22:31:02 +0000
Date: Fri, 28 Jun 2019 00:31:00 +0200
To: Andrew Bartlett <abartlet@samba.org>
Subject: Re: Document GitLab as the only way to contribute to Samba?
Message-ID: <20190627223100.GB32415@samba.org>
References: <1561079117.28284.21.camel@samba.org>
 <20190621111436.342f713e@martins.ozlabs.org>
 <1561082290.28284.28.camel@samba.org>
 <0278c810-0cd8-5ad8-3a39-ab1e7fc70b8f@samba.org>
 <41b3968e83cfbd74a060b7f51f4c719be4ddab58.camel@samba.org>
 <290c2679-895e-9be4-a7d4-03a5ab8bd265@samba.org>
 <c313657a3ccb56499bbae330bfd93690764cceea.camel@samba.org>
 <CAN05THS1tH7H2pMgUfsjo1QNY=zrYMgBqKLcoqP6MsAvxKRPpw@mail.gmail.com>
 <f1fb9b192f5b9e88244b84166106474f31f8ee88.camel@samba.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="PmA2V3Z32TCmWXqI"
Content-Disposition: inline
In-Reply-To: <f1fb9b192f5b9e88244b84166106474f31f8ee88.camel@samba.org>
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
Cc: "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>


--PmA2V3Z32TCmWXqI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2019-06-21 at 21:28 +1200, Andrew Bartlett via samba-technical wrote:
> On Fri, 2019-06-21 at 19:05 +1000, ronnie sahlberg wrote:
> > I think something like this needs a lot more discussion than "need
> > new
> > process because I don't want to read patches."

This or similar statements have been made a few times in this
thread. I would like to emphasize that this is not at all true!
Thorough patch reading and review has to happen with any tool
and process. But with a tool like gitlab, the reviewer can
chose (and usually choses) to review the patches after the
CI has passed on them. That's what's meant by "known-good".

That alone helps a lot and avoids unnecessary review roundtrips.
(This more automatic part of the review is taken up by the tool.)

But only the human reviewer can approve the patch in the merge
request. And both in gitlab and on the mailing list people can
do thorough or sloppy reviews. This has nothing whatsoever to do
with the tool or process used.

> G'Day Ronnie,
>=20
> I do wish to be very clear, this is not a discussion about a new
> process, this is a discussion about formalising our current practice. =20

I agree that the state to have two processes in parallel is good
to test a new process, but it is not a sustainable situation over
an extended period of time. So I think it is only fair to propose
deprecation of the original process if the new one is already
the de-facto standard.

> Over the past few months, only Martin and to a lessor extent Christof
> has sent a significant number of patches via the list, the rest go via
> GitLab. =20
>=20
> I'm sorry you haven't noticed, perhaps you thought we just went quiet!
>=20
> > Now, samba is a very active project, and like the linux kernel, a
> > very
> > unusual project in that almost all main contributors are
> > paid to work part or full time on samba,
> > That is not the norm for the average open source projects.
> >=20
> > Anytime you add special hoops and gatekeepers to contribute patches
> > you will turn away new contributors.
> > That is fine if you don't see it as an issue if it might turn
> > occasional contributors away.
> > The norm for most open source project IS to send patches to the list
> > and get feedback on them.
> > Even the linux kernel works that way, although it is split into
> > several subsystem specific mailinglists.
>=20
> I would dispute that it is the norm, but I guess it depends how you
> measure the norm.  Very many projects only accept contributions by
> GitHub pull requests.=20

I agree. It surely depends on what kinds of projects you are
usually working on, but my perception is that the vast majority
of projects nowadays use github, gitlab, gerrit, or a similar gui-driven
platform. It seems to me that it generally also lowers the entry
bar for new contributors. (Whether we'd get new contributors because
of switching to gitlab is not guaranteed of course.)

I personally think that mail list reviews do have some advantages
but the gitlab system also has several advantages.

So I would in general be fine with the change.

Not sure if it would help to first declare the ML submissions
deprecated and in a second step declare gitlab the only way to
submit?

Cheers - Michael


> > I think from what you are saying is that the real problem is that
> > contributors send patches to the list but the core
> > developers do not care/ do not want to do patch review, and that is
> > why the patches are ignored and forgotten.
>=20
> > If that is the problem, then just changing to a much much harder and
> > different process to  contribute patches
> > is not going to address the problem. I mean, if people can not care
> > to
> > review patches that are sent to the list, why
> > would you think people would review the same patches if they were
> > contributed via a different mechanism?
>=20
> As someone who has the great pleasure of reviewing a significant number
> the patches submitted to Samba, I find that GitLab merge requests are
> significantly easier to review because:
>  - The patch, CI results and discussion are all in one place
>  - The original submitter gets the CI feedback automatically, so I
> don't have to tell them it failed
>  - The outstanding patches are in an ordered list that I can work
> though.
>  - I can pull them to my local system, on a branch, rebased on master,
> with simple aliases around wget.
>=20
> I do this day in, day out and find it has greatly boosted my
> productivity, and so improved Samba because I'm able to do even more
> code review!  I got 1700 patches reviewed last year, I used to only
> manage 1000.
>=20
> Even our contributors praise the use of GitLab, because they too love
> knowing that their patches pass CI, and so are not a embarrassment
> (while not a problem you suffer, first time contributors tend not to be
> very confident).=20
>=20
> > If the problem is that core contributors do not want to or have time
> > to review patches then the correct solution would
> > probably be to have everyone set aside one day a week to work on
> > project hygiene, and spend that whole day ONLY on working on
> > patch review rather than invent a new system that might stop these
> > patches from being submitted in the first place.
>=20
> While I'm incredibly grateful to be in a position to do code review
> actively, on the Samba Team we have not found that berating other
> developers has worked well for, well, anything (frankly). =20
>=20
> But we now work smarter, rather than harder, and I'm just trying to get
> consensus to update our docs to match our new, better, reality.
>=20
> > You even say in a post that you don't care and wont review any
> > patches
> > that are sent to the mailing list.
> > If that is how most core developers think of patch review, maybe that
> > is the actual problem.
>=20
> I think you totally miss the point here. =20
>=20
> Andrew Bartlett
>=20
> --=20
> Andrew Bartlett                       https://samba.org/~abartlet/
> Authentication Developer, Samba Team  https://samba.org
> Samba Developer, Catalyst IT         =20
> https://catalyst.net.nz/services/samba
>=20
>=20
>=20
>=20

--PmA2V3Z32TCmWXqI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQQ4hxRJ4GXWNWIKYh7JT0k4GE+QNAUCXRVDogAKCRDJT0k4GE+Q
NPmqAJ0cPM04BRb/3G8nWyOjc+mYTHOdiQCeMOLKYYi5z75QD4SyoE077DOt9cg=
=UDlE
-----END PGP SIGNATURE-----

--PmA2V3Z32TCmWXqI--

