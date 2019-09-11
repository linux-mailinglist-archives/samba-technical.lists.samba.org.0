Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EAD3AF40D
	for <lists+samba-technical@lfdr.de>; Wed, 11 Sep 2019 03:35:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=1+48LmvY199GltJY28WLtO3tmhTHeD8F5/KKTOMYSss=; b=DR8723CIOK4b6IN7Qm55A6cxLp
	sesinoU8eew/YtuDmozDx9c2u9z0moDFg2OVf22Hj9OMH4EUhbT/gnZHvxVNOOcPrqwkkAtwcDMdX
	5VAiVDyAYAr+N6/ftVfl/Yh/KubhqIyAvGK6QaO/YcaA5uwZdiCFsbHZPlZXYU4wGeb8xgdZ+nt81
	lSA6QT0gvPe92GJvA0JvZttXT3NealY78cZLnvsxRmXO19p6vhX67xlXmt6neRFXTeleOZhXWr9zq
	CWN8M+abbA/D2fv6vdrKnnaEDaR6yEMRzBTK81vbKW7Ms9DtqGqy/GWrYxiauFmTOojdB5LjHmKIn
	0/16YfmA==;
Received: from localhost ([::1]:44352 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1i7rWq-004cqg-SJ; Wed, 11 Sep 2019 01:34:41 +0000
Received: from ozlabs.org ([203.11.71.1]:36195) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1i7rWf-004cqY-0G
 for samba-technical@lists.samba.org; Wed, 11 Sep 2019 01:34:33 +0000
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 46Skvv3pYRz9s00;
 Wed, 11 Sep 2019 11:34:19 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=meltin.net; s=201810;
 t=1568165659; bh=O7B2nVLNzd4HKWbYidJcIMIHfeuDHMhXU23ToWQpRQo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=faKvkUkZ+DQO68EyIkxhEKmFJ2n86eFdlHfavCTXeMgFGPuJA/F+4pUPDdh8pI6eH
 v36fS1BHbibZhmnSxKCbcZtZGYWIXmlRrTv+v3MzCPDobnRsBdigo0QAVH8rvhRtGv
 O5aYGdFvI193lAOZY7oKrqtS4CPr9MxO9O6tjRCO24VX77SESa3OvSFazQQ++3mPcp
 srl7kC/H9Nx3EsFe+roWIuQkyadSEvH6ldCoHzXVrd7r+uJX6JcV4xrs87cPRK5aEW
 uyagJeOW6biHP+jvwLvWG/Tc1J8str1FMZBdZmp+iVCzt85a2U+3PeMCujcsfhFkjO
 BwS6Jcgt+Q4Ng==
Date: Wed, 11 Sep 2019 11:34:18 +1000
To: Andrew Bartlett <abartlet@samba.org>
Subject: Re: Document GitLab as the only way to contribute to Samba?
Message-ID: <20190911113418.5475ad27@martins.ozlabs.org>
In-Reply-To: <1567745657.20732.13.camel@samba.org>
References: <1561079117.28284.21.camel@samba.org>
 <20190621111436.342f713e@martins.ozlabs.org>
 <1561082290.28284.28.camel@samba.org>
 <0278c810-0cd8-5ad8-3a39-ab1e7fc70b8f@samba.org>
 <41b3968e83cfbd74a060b7f51f4c719be4ddab58.camel@samba.org>
 <290c2679-895e-9be4-a7d4-03a5ab8bd265@samba.org>
 <c313657a3ccb56499bbae330bfd93690764cceea.camel@samba.org>
 <CAN05THS1tH7H2pMgUfsjo1QNY=zrYMgBqKLcoqP6MsAvxKRPpw@mail.gmail.com>
 <f1fb9b192f5b9e88244b84166106474f31f8ee88.camel@samba.org>
 <20190627223100.GB32415@samba.org>
 <1567745657.20732.13.camel@samba.org>
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
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, 06 Sep 2019 16:54:17 +1200, Andrew Bartlett via samba-technical
<samba-technical@lists.samba.org> wrote:

> On Fri, 2019-06-28 at 00:31 +0200, Michael Adam wrote:
> >=20
> > I personally think that mail list reviews do have some advantages
> > but the gitlab system also has several advantages.
> >=20
> > So I would in general be fine with the change.
> >=20
> > Not sure if it would help to first declare the ML submissions
> > deprecated and in a second step declare gitlab the only way to
> > submit? =20
>=20
> So, after all that and some water under the bridge, can we please agree
> to go ahead and make that change, for the sake of clarity and
> consistency?
>=20
> I would document it as (roughly):
>=20
> - GitLab is the strongly perferred method to contribute to Samba.=C2=A0
> - Patches mailed to the mailing list may still be considered, but
> require additional work on the part of Samba Team members so are
> discouraged.=20
>=20
> If you are interested in reviewing patches submitted to Samba, please
> ensure you have a gitlab.com account and are watching our public gitlab
> repository.=20

Sorry, but NACK.

Samba is a Free Software project.  While that is true we must not
mandate a proprietary platform as the only way of contributing.  Nor
should we discourage contributions that are not made via a proprietary
platform.

There are many reasons why a new contributor may be unable to use
GitLab, including:

* They may not agree with the terms of service

* They may not wish to take the time to setup an account and be added
  to the required project

* They may find the user interface unusable

* They may not have (reliable) web access

They may still be able to make very worthwhile contributions.

Ironically, Git - and, therefore, GitLab - exists because the founder of
the Samba project did not think it reasonable for a proprietary product
to be mandated for development on another project.

More pragmatically, GitLab may go away, so we should keep our options
not only open but also active.

We should continue to encourage this mailing list as an option for
contributing to Samba.  If a reviewer prefers seeing a GitLab CI
pipeline pass before they look at code then, if a mailing list
contribution sounds interesting, they can save the patch, run "git am"
and push the resulting branch to GitLab GI in less than a minute or 2.
They can then reply to the contributor saying "looks interesting,
waiting for GitLab CI pipeline <url> to complete".  This mailing list
isn't so busy that hand-processing a few contributions will swamp any
reviewer's time.

Sorry, mate!  This is a hill I'm willing to die on...

peace & happiness,
martin

