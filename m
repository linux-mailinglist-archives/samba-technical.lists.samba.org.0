Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 61B18AF50B
	for <lists+samba-technical@lfdr.de>; Wed, 11 Sep 2019 06:25:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=dgVM2TP+4AcPt0vkWflts8Du7E8RdEOJRnKRvp/88Wk=; b=DaJc7F8fL8pfZRIDWKPIsXhkTm
	CoCIQNJgpwTa+EdgnygkeFZsCaCan9DynQeETN1aL7UoHt4FjNMsVuvPAnr28dS+U81v5APUWSCda
	c0RXOSqUwYGZsLzt741y8cKv9m4tB9lQHqxUDImIaJKe0zszf/LBA8FxREV/Sm0dqAmkHMFnEDHf2
	1DWmTrqDk+Cd9bu8NYOuJ/vfSdwkLs7G4jJMnYPs+DOcXBWmYogKkwYXTvaS07zspvzF4OyWSoa4r
	AXr7+AYG7SVP5fmy8fPCDfdHj3qWursTndjRvF+/wROPI9NbYXM0yF8I/d2MO/jRmNgvDpvaJG3cr
	VOP2dNnQ==;
Received: from localhost ([::1]:50798 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1i7uB8-004eMU-By; Wed, 11 Sep 2019 04:24:26 +0000
Received: from ozlabs.org ([203.11.71.1]:41577) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1i7uB3-004eMN-3r
 for samba-technical@lists.samba.org; Wed, 11 Sep 2019 04:24:24 +0000
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 46Spgv4CKCz9sCJ;
 Wed, 11 Sep 2019 14:24:11 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=meltin.net; s=201810;
 t=1568175851; bh=uUeRPqWhFA3+Kmqw4kv8y9P3v1C7HCHaiHf0hwRcwio=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=RsbKJ0cTpFzL+ckc033JrmFTPkXRPLTPFPyfDl/LShHpkeWGqL1wqYYgcXK2FGSbD
 fiOitCEGAI/MoZapwZywD297xqoUfYzptGiolokD4mVlLqkn60Ql1S9lNAN77wb7eN
 /I1865ZmTyHHJ9bZq+gr9H2S8Lmh2a5aI8Z9jxoKCSss/OIvl95YBYHKMikfMXqawH
 7lcqr5hrHdoKmz2w2tfasgpFERziocON1oJBSueoWShqD24Crzd86FzFZsyrBTXGgQ
 /yo0ynxgu6Xe/hMDKm2/HWzDCVSIivIp/a0Zwytnsi8DQZj/Tb0xe7cXC48PBbTWnb
 PodQkk+w05X7g==
Date: Wed, 11 Sep 2019 14:24:09 +1000
To: Jeremy Allison <jra@samba.org>
Subject: Re: Document GitLab as the only way to contribute to Samba?
Message-ID: <20190911142409.6bc6b7cf@martins.ozlabs.org>
In-Reply-To: <20190911031728.GA31067@jeremy-acer>
References: <1561082290.28284.28.camel@samba.org>
 <0278c810-0cd8-5ad8-3a39-ab1e7fc70b8f@samba.org>
 <41b3968e83cfbd74a060b7f51f4c719be4ddab58.camel@samba.org>
 <290c2679-895e-9be4-a7d4-03a5ab8bd265@samba.org>
 <c313657a3ccb56499bbae330bfd93690764cceea.camel@samba.org>
 <CAN05THS1tH7H2pMgUfsjo1QNY=zrYMgBqKLcoqP6MsAvxKRPpw@mail.gmail.com>
 <f1fb9b192f5b9e88244b84166106474f31f8ee88.camel@samba.org>
 <20190627223100.GB32415@samba.org>
 <1567745657.20732.13.camel@samba.org>
 <20190911113418.5475ad27@martins.ozlabs.org>
 <20190911031728.GA31067@jeremy-acer>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
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
From: Martin Schwenke via samba-technical <samba-technical@lists.samba.org>
Reply-To: Martin Schwenke <martin@meltin.net>
Cc: samba-technical@lists.samba.org, Andrew Bartlett <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tue, 10 Sep 2019 20:17:28 -0700, Jeremy Allison <jra@samba.org>
wrote:

> On Wed, Sep 11, 2019 at 11:34:18AM +1000, Martin Schwenke via samba-techn=
ical wrote:
> > On Fri, 06 Sep 2019 16:54:17 +1200, Andrew Bartlett via samba-technical=
 =20
> > > I would document it as (roughly):
> > >=20
> > > - GitLab is the strongly perferred method to contribute to Samba.=C2=
=A0
> > > - Patches mailed to the mailing list may still be considered, but
> > > require additional work on the part of Samba Team members so are
> > > discouraged.=20
> > >=20
> > > If you are interested in reviewing patches submitted to Samba, please
> > > ensure you have a gitlab.com account and are watching our public gitl=
ab
> > > repository.  =20
> >=20
> > Sorry, but NACK.
> >=20
> > Samba is a Free Software project.  While that is true we must not
> > mandate a proprietary platform as the only way of contributing.  Nor
> > should we discourage contributions that are not made via a proprietary
> > platform.
> >=20
> > There are many reasons why a new contributor may be unable to use
> > GitLab, including:
> >=20
> > * They may not agree with the terms of service
> >=20
> > * They may not wish to take the time to setup an account and be added
> >   to the required project
> >=20
> > * They may find the user interface unusable
> >=20
> > * They may not have (reliable) web access
> >=20
> > They may still be able to make very worthwhile contributions.
> >=20
> > Ironically, Git - and, therefore, GitLab - exists because the founder of
> > the Samba project did not think it reasonable for a proprietary product
> > to be mandated for development on another project.
> >=20
> > More pragmatically, GitLab may go away, so we should keep our options
> > not only open but also active.
> >=20
> > We should continue to encourage this mailing list as an option for
> > contributing to Samba.  If a reviewer prefers seeing a GitLab CI
> > pipeline pass before they look at code then, if a mailing list
> > contribution sounds interesting, they can save the patch, run "git am"
> > and push the resulting branch to GitLab GI in less than a minute or 2.
> > They can then reply to the contributor saying "looks interesting,
> > waiting for GitLab CI pipeline <url> to complete".  This mailing list
> > isn't so busy that hand-processing a few contributions will swamp any
> > reviewer's time.
> >=20
> > Sorry, mate!  This is a hill I'm willing to die on... =20
>=20
> So if you feel so strongly about this (and I'm sympathetic
> to the web UI being just "someone else's computer" issues :-),
> is it the wording of:
>=20
> "Patches mailed to the mailing list may still be considered, but
> require additional work on the part of Samba Team members so are
> discouraged."
>=20
> you really object to ?

Yes.  That wording says that if you post to the mailing list then you
might be wasting your time.

The subject line is the original attempt to make GitLab "the only way
to contribute to Samba" and I also object to that.

> The mailing list isn't going anywhere, as it's the primary technical
> discussion list.

OK.

> How about we re-word this such that we encourage contributors
> to use gitlab if they prefer or are used to this interface (as
> many new developers are), but still encourage patches on
> any medium - including the mailing list ?

Sounds like a plan.  Thanks for suggesting it!

> We're not so developer-rich that we can afford to turn away
> help given by any means :-).
>=20
> I think the "require(s) additional work on the part of Samba
> Team members so is discouraged." is a statement of fact on
> Andrew's behalf. It may not be the case for all Team developers
> of course.

Very true.  I like GitLab's automatic CI pipelines but I find that
everything else takes more time using GitLab.  I do not poll the web
interface for merge requests but depend on notifications that come into
the same mail folder as samba-technical.

> Can you suggest alternative wording that would work for you ?
>=20
> We do want people who are used to gitlab to feel comfortable
> using it to contribute, semi-proprietary though it is:
>=20
> https://akr.am/blog/posts/gitlab-isnt-really-open-source
>=20
> But we obviously still want to encourage pure Free Software methods
> of collaboration.
>=20
> Would that work for you Martin ?

Definitely.  How about the following?

There are 2 main ways of contributing to Samba:

* GitLab

  GitLab is an integrated web site for collaborating on code.  This
  includes continuous integration testing, merge requests and tracking
  of versions of patch sets.  The GitLab workflow is preferred by some
  [many? is it time for a poll?] Samba team members.

  See Samba's GitLab process <url> for more details.

* samba-technical mailing list

  This mailing list requires minimal up-front investment from drive-by
  contributors.

  See the samba-technical process <url> for more details.

I really think we should not push mailing list contributors to GitLab.
I cringe when I see this done.  As I have said, we can reply saying
that we're running a pipeline and point them to it.  We can then even
open a merge and point them at that too.  If they like what they see
then they might look at the GitLab process and make their next
contribution that way.  The only problem is if they don't have a GitLab
account then we do need to follow up on the list because they won't see
notifications.  It would be awesome if GitLab allowed you to add email
addresses of additional people to notify of updates.

Thanks...

peace & happiness,
martin

