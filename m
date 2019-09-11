Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id AF494AF434
	for <lists+samba-technical@lfdr.de>; Wed, 11 Sep 2019 04:24:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Date:Subject;
	bh=afCLK5B/BB+XO0psS1jlze3MoE0xMsYffodrMVgoens=; b=3KTsppZT0rsiPSAxUl0CuaVqT3
	VfQwjNhJ5KSvCcw3unXZbq85UphvzRycWidE0xYJmUfgUJDPrYhz6f6BTiFZVSdIsCX4IyBEK8ZuD
	hNNZOEsPybVd7XZWuJpcfClVEcjWnOt4FRpt60vz9cuB07m2G76P+tO4L01BNYGNEJx1Szoxv/faK
	+I+Nca3x5+t4JaQEFJhwf57wXjFpqcLF2C9HnQpXakSKV3UBgHdKoQMTt9hhNptyuXhLCPjlJyoYh
	qLkXqEt68K35c+7v83c0nHGIyICchi1SZgLZPDAsDDES+rcHLd2uIyOV9CcTi83AvzG2dRQIhWFo2
	W+NgGFAg==;
Received: from localhost ([::1]:48234 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1i7sIV-004dXu-Rp; Wed, 11 Sep 2019 02:23:55 +0000
Received: from mx2.suse.de ([195.135.220.15]:55190 helo=mx1.suse.de) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1i7sIS-004dXn-HQ
 for samba-technical@lists.samba.org; Wed, 11 Sep 2019 02:23:54 +0000
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 2A048AE91;
 Wed, 11 Sep 2019 02:12:25 +0000 (UTC)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Subject: Re: Document GitLab as the only way to contribute to Samba?
In-Reply-To: <20190911113418.5475ad27@martins.ozlabs.org>
Date: Wed, 11 Sep 2019 12:12:17 +1000
Content-Transfer-Encoding: quoted-printable
Message-Id: <43ED5838-FC43-4A8B-9F3D-DB6EAB88D729@suse.de>
References: <1561079117.28284.21.camel@samba.org>
 <20190621111436.342f713e@martins.ozlabs.org>
 <1561082290.28284.28.camel@samba.org>
 <0278c810-0cd8-5ad8-3a39-ab1e7fc70b8f@samba.org>
 <41b3968e83cfbd74a060b7f51f4c719be4ddab58.camel@samba.org>
 <290c2679-895e-9be4-a7d4-03a5ab8bd265@samba.org>
 <c313657a3ccb56499bbae330bfd93690764cceea.camel@samba.org>
 <CAN05THS1tH7H2pMgUfsjo1QNY=zrYMgBqKLcoqP6MsAvxKRPpw@mail.gmail.com>
 <f1fb9b192f5b9e88244b84166106474f31f8ee88.camel@samba.org>
 <20190627223100.GB32415@samba.org> <1567745657.20732.13.camel@samba.org>
 <20190911113418.5475ad27@martins.ozlabs.org>
To: Martin Schwenke <martin@meltin.net>
X-Mailer: Apple Mail (2.3445.104.11)
X-Warn: EHLO/HELO not verified: Remote host 195.135.220.15 (mx2.suse.de)
 incorrectly presented itself as mx1.suse.de
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
From: William Brown via samba-technical <samba-technical@lists.samba.org>
Reply-To: William Brown <wbrown@suse.de>
Cc: samba-technical@lists.samba.org, Andrew Bartlett <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>



> On 11 Sep 2019, at 11:34, Martin Schwenke via samba-technical =
<samba-technical@lists.samba.org> wrote:
>=20
> On Fri, 06 Sep 2019 16:54:17 +1200, Andrew Bartlett via =
samba-technical
> <samba-technical@lists.samba.org> wrote:
>=20
>> On Fri, 2019-06-28 at 00:31 +0200, Michael Adam wrote:
>>>=20
>>> I personally think that mail list reviews do have some advantages
>>> but the gitlab system also has several advantages.
>>>=20
>>> So I would in general be fine with the change.
>>>=20
>>> Not sure if it would help to first declare the ML submissions
>>> deprecated and in a second step declare gitlab the only way to
>>> submit? =20
>>=20
>> So, after all that and some water under the bridge, can we please =
agree
>> to go ahead and make that change, for the sake of clarity and
>> consistency?
>>=20
>> I would document it as (roughly):
>>=20
>> - GitLab is the strongly perferred method to contribute to Samba.=20
>> - Patches mailed to the mailing list may still be considered, but
>> require additional work on the part of Samba Team members so are
>> discouraged.=20
>>=20
>> If you are interested in reviewing patches submitted to Samba, please
>> ensure you have a gitlab.com account and are watching our public =
gitlab
>> repository.=20
>=20
> Sorry, but NACK.
>=20
> Samba is a Free Software project.  While that is true we must not
> mandate a proprietary platform as the only way of contributing.  Nor
> should we discourage contributions that are not made via a proprietary
> platform.

I don't think that Andrew is saying "this is the only way to =
contribute", and maybe this is a miswording?

I would expect that this is the *default* method of contribution because =
it makes the new contributor experience easier and smoother. Which is =
really important if you want to bring in new people to a project, to =
have that process really easy and accessible. Lowering the barrier to =
entry is a good thing because you broaden your talent pool, and giving =
that talent a positive first contribution experience means they are more =
likely to stay around.=20

>=20
> There are many reasons why a new contributor may be unable to use
> GitLab, including:
>=20
> * They may not agree with the terms of service
>=20
> * They may not wish to take the time to setup an account and be added
>  to the required project
>=20
> * They may find the user interface unusable
>=20
> * They may not have (reliable) web access
>=20
> They may still be able to make very worthwhile contributions.
>=20
> Ironically, Git - and, therefore, GitLab - exists because the founder =
of
> the Samba project did not think it reasonable for a proprietary =
product
> to be mandated for development on another project.
>=20
> More pragmatically, GitLab may go away, so we should keep our options
> not only open but also active.
>=20
> We should continue to encourage this mailing list as an option for
> contributing to Samba.  If a reviewer prefers seeing a GitLab CI
> pipeline pass before they look at code then, if a mailing list
> contribution sounds interesting, they can save the patch, run "git am"
> and push the resulting branch to GitLab GI in less than a minute or 2.
> They can then reply to the contributor saying "looks interesting,
> waiting for GitLab CI pipeline <url> to complete".  This mailing list
> isn't so busy that hand-processing a few contributions will swamp any
> reviewer's time.

Every barrier that exists for a reviewer to provide "review feedback" =
means that it will create a mental block/energy block which some people =
won't overcome. It's hard enough to get people to review a patch, let =
alone expecting reviewers to do additional work which could be automated =
by a system like gitlab.=20

Just in my experience, from the 389 ds project, we went from patch files =
on mailing list, to patches on a ticket tracker (with inline comments), =
then to PR's. Since doing this our developer work load is lighter, and =
we are now seeing better community engagement and contribution, better =
quality reviews due to inline commenting, less git mistakes, better =
engagement with our CI, and more. At the time I was very against the PR =
workflow, but slowly I realised that there were technical benefits for =
other people - it wasn't just about what I wanted and what I was used =
to, but about helping other people be more productive in a project that =
I take so much pride in. To see that people are now actually doing =
once-off pull requests to 389 really makes me happy and excited for our =
future.=20

In other words, by shifting boring manual labor to a tool like gitlab, =
we were able to focus on what mattered - (re)building a community, and =
encouraging development and improvement.=20

I think that this is a really positive change for the samba project and =
is a really positive step to opening wider doors to the samba developers =
of the future.=20

>=20
> Sorry, mate!  This is a hill I'm willing to die on...
>=20
> peace & happiness,
> martin

=E2=80=94
Sincerely,

William Brown

Senior Software Engineer, 389 Directory Server
SUSE Labs


