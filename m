Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 08BAA93471C
	for <lists+samba-technical@lfdr.de>; Thu, 18 Jul 2024 06:20:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=Z8WRIOf1odei1zTGIIrDwq1ac+z9wZS5llWAi2heemI=; b=Xt9mvg5ZrD9dOfd78nAWHK4A8u
	q6E+aFkpg735ugaJTlucZ/zErWQTnbyKqg9dWySJxo0wMy3m7c8zomjpKQfA6hNwVr8HmpHnrLTuM
	+m6xq/o2XyGGWfzTPNXDW5UeGmSupnQAsPvxelOy4O9E6aMGzUmxdHT37oTn7GIXHFH/8l7OVAbEj
	1nqu7fmyVkX1JGJtIR6ta+1Vqt9vYECCNYk0/LV5E5owPkuS6NBPo5cnO6fUZ7gxA9S7pQhmilc1j
	u/GCCuI8qMfdcN/iXZPrle8nWX6HLBPpUJmaaIv4mVkDOaL6YGAOYLXiCChlTjKNtq/uOrQIlG1lh
	+YLEFRVw==;
Received: from ip6-localhost ([::1]:56880 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1sUIcb-000yJe-13; Thu, 18 Jul 2024 04:20:01 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:55010) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1sUIcW-000yJX-SF
 for samba-technical@lists.samba.org; Thu, 18 Jul 2024 04:19:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=ZFCykO6/VhunkLV12f4oBFCwX41qU1bUeyn8Jo9tna4=; b=soEI7txbEfZxjmbhAJdYfwl9SQ
 32p88v0MJ6HtN5Jy5JTysEpg1mTc0RaDb9EDqLWQhBLT3a757Yjp2JSIQpdSC8p5ucdvPjw2PMCHI
 3DDA0Pt2GyhQP8T0W5e6xB2T6COmHMefCtxOlOvk/bcIkFEczG/EmQzLWjndA24hTxs9/Xx5KlfuF
 pKwTMWln4CnSvUwQWi+010w0wapSNN4cd4W31PAEY5LN2e6Qhi2e5c+4krglZeQLtxu8mr42XJviL
 ylbCprKVUP5rXGyTceA0sGR7TOMhRbib5evRufpomWnYkZ+5lxXfXue1wXxknVeVRwWZqJ7zjWWrT
 jl0Ku8PDI85+88KRJtxxZpOBRqepJG54TRm8OPuItUSEgCx/1cIBYsWPctyWFumsLy9NLVVMYlU+e
 PTzc+GSw3h7DoMugfXgQIo/r+G9gQ0sPHd6Vm8dK4julBGckeJGG5YJLG1jcE8zsr/N7yQvARH9oU
 ZKyNw7VfaIzrWnc6vVi24WqL;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1sUIcV-001yUK-0S; Thu, 18 Jul 2024 04:19:55 +0000
Message-ID: <505d6de687655e43387c66a3d2460a82fc4d0844.camel@samba.org>
Subject: Re: Helping to improve FreeBSD support
To: John Hixson <jhixson@freebsd.org>, samba-technical@lists.samba.org
Date: Thu, 18 Jul 2024 16:19:50 +1200
In-Reply-To: <tc6xfz3it47oxa224ert4fs2u36h3qefm2elc64kugofrujk4t@vh2wevz6y6qc>
References: <tc6xfz3it47oxa224ert4fs2u36h3qefm2elc64kugofrujk4t@vh2wevz6y6qc>
User-Agent: Evolution 3.52.3 (3.52.3-1.fc40) 
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

On Wed, 2024-07-17 at 20:54 -0700, John Hixson via samba-technical
wrote:
> Howdy!
>=20
> Would Samba be interested in better FreeBSD support? I am reaching out
> on behalf of the FreeBSD Foundation. We would like to help improve
> support in whatever way we can. What needs to happen?=20
>=20
> For starters, I would like to help get as many of our port patches
> upstreamed as possible. I would also be interested in helping out in
> areas that are specific to FreeBSD. It would also be nice to have some
> CI setup.

Yes, getting all port patches upstreamed is the first place to start.
=C2=A0It also helps vet them, which is useful for all.

For Other tasks:
=C2=A0- I did wonder if one useful task could be to have a non-glibc libc
container on Linux in our GitLab CI, to show we have no assumptions
about using glibc.

=C2=A0- Have a container in the GitLab CI cross-compile to FreeBSD. =C2=A0T=
his
might help better test our cross-compile infrastructure and check we
can compile for FreeBSD

But the really hard but really valuable goal would be to have that
cross-compilation get run on a FreeBSD Kernel, but still in our GitLab
CI on Linux hosts. =C2=A0

A bit insane but what if the cross-compiled results were injected into
FreeBSD running on qemu (x86_64 on x86_64 without kvm) in the Docker
container?

> Interested? Where to go from here?=20

I would say we are. =C2=A0I'll leave it for others to follow up with you
more, but I did want to say that we always want better collaboration
with those that package and port Samba.

The main constraints on the CI is that we use GitLab for our CI, and we
use Linux hosts for the GitLab CI runners. =C2=A0

We avoid needing to assume our users in the shared dev repo need to be
fully trusted, so our runners that we provide are single-use VMs, or
the same that GitLab graciously provides.=C2=A0

Andrew Bartlett

> Cheers!
>=20
> - John

--=20
Andrew Bartlett (he/him) https://samba.org/~abartlet/
Samba Team Member (since 2001) https://samba.org
Samba Developer, Catalyst IT https://catalyst.net.nz/services/samba

