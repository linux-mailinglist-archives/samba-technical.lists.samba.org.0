Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id BA12318278D
	for <lists+samba-technical@lfdr.de>; Thu, 12 Mar 2020 04:54:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Date:Subject;
	bh=kfnphghRFvCtUXEK7juO8WhE05BBbllYbop9uaBsCYY=; b=WiBhc5o4+EaD5xLU2zNZSyA0zJ
	GRL/7p4w50LF84FVE/7L9ztDv/9u4KFouavtQvyeJw96OC1RP1xdx2zjAMFdsEHHOshM7sZ1r1NdD
	5JWaT+oCewJihUq40AZvUw8lpY0QW5DlT39Ez5Ien4SDEqOvNs69kZ0SHUnw8bHlradaoyS0w7D1S
	M5gZ7tqTK49Ydd2Dk3m5JRaFhVrsCnyOsgSiaWSTNy0MJ2tOVyC+fVNfBoAQ1x75vZwjBGldYo+Jr
	psJ2b509EVseGVoOIeVkdrl+aDissMrF3Ygw1MxhXUm+cBQJmzPa5hyEyjhr/ygwR3oFPMYX6wv1Z
	IEXP70bg==;
Received: from ip6-localhost ([::1]:34824 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jCEuw-00Ft1P-QL; Thu, 12 Mar 2020 03:53:54 +0000
Received: from mx2.suse.de ([195.135.220.15]:48628) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1jCEur-00Ft1I-P2
 for samba-technical@lists.samba.org; Thu, 12 Mar 2020 03:53:52 +0000
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id CD95BB2D8;
 Thu, 12 Mar 2020 03:40:52 +0000 (UTC)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3608.60.0.2.5\))
Subject: Re: Retire Fedora 29 / OpenSUSE 15.0 from CI?
In-Reply-To: <7999f917f76d922dfd725d185903fdf47e1a7e9b.camel@samba.org>
Date: Thu, 12 Mar 2020 13:40:47 +1000
Content-Transfer-Encoding: quoted-printable
Message-Id: <E8F6741C-BEC9-43A6-B683-E21BD9F61372@suse.de>
References: <7999f917f76d922dfd725d185903fdf47e1a7e9b.camel@samba.org>
To: Andrew Bartlett <abartlet@samba.org>
X-Mailer: Apple Mail (2.3608.60.0.2.5)
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
Cc: asn@samba.org,
 Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>



> On 12 Mar 2020, at 13:17, Andrew Bartlett via samba-technical =
<samba-technical@lists.samba.org> wrote:
>=20
> G'Day Andreas and the list,
>=20
> It bothers me a little that for every Samba change we make we spin up
> 37 builds on 37 VMs.  It feels a little excessive, and while CI is
> awesome when it saves us all time we should also use the earth and
> Samba Team's resources carefully.  (Even jobs aimed at the 'free' CI
> can be run on our servers if GitLab.com's servers are busy, and the
> planet pays either way).=20
>=20
> Therefore I wondered if we should also stop running CI on Fedora 29 =
and
> OpenSUSE 15.0, both of which are now it is EOL upstream?
>=20
> Both went EOL in Nov/Dec 2019.
>=20
> In the future I think we should set policy to only CI on (some, =
subject
> to other constraints) supported distributions.=20
>=20
> What do folks think?

This sounds like a 100% reasonable policy to only run CI on =
active/supported distributions. :)=20

>=20
> Andrew Bartlett
> --=20
> Andrew Bartlett
> https://samba.org/~abartlet/
> Authentication Developer, Samba Team         https://samba.org
> Samba Development and Support, Catalyst IT - Expert Open Source
> Solutions
> https://catalyst.net.nz/services/samba
>=20

=E2=80=94
Sincerely,

William Brown

Senior Software Engineer, 389 Directory Server
SUSE Labs


