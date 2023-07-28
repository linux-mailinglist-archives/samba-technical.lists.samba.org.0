Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AA0E767765
	for <lists+samba-technical@lfdr.de>; Fri, 28 Jul 2023 23:05:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=opxebUu753R1nU8XzFpGgBMp4YnMidFfMSapEYgobTE=; b=AMl/SrMY0ke2hb0kmjqD0Hfhau
	vAtu1zgM+9aPhCKfrwNQOWAME/maf6vRMIVqpBsRXGkxMpgqIPbvUmXvi7bTLX6UX8Q4hGAv8XgMa
	FUVuBMHhZAJQhYtB/l/l5QNnvlYfwPJbzlhpUFakqiriIIUsOr3pMzO6uw5mDIhqL3rDYFhIBT2gK
	qql9DDfTYwlX8c4ms7YTupLdHIp6YP/0caYO4LKbu72p+YYLS5S0EGnojjtIb7t90kz/9CLcfm5S9
	ugFsznx7XGgFQSwJ9FTkp9+xhZiAXVQw3LTU0EwMBaQVQx8qb4GNwj5SGn/iiV6zjpdJxMGgqQJLl
	0ge1uBUQ==;
Received: from ip6-localhost ([::1]:41174 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1qPUde-005zWS-HW; Fri, 28 Jul 2023 21:04:42 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:44066) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1qPUdU-005zVW-T2
 for samba-technical@lists.samba.org; Fri, 28 Jul 2023 21:04:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=ioBbhRf2S3anGO9xBfKrbpy1SypuAZ7ME/Ec1L22Ji0=; b=wKQ0LPBfpEZhQr3zxXPgp/2IDV
 1zyJNCklAK4Qnc2Wbvq4H7gO17n+ij9wZu6F3AINGaEotg03Lp29ccLkcDLRXXhfIsZN0/21D7Vyx
 Nxtriv8RKuuy1hwCCSLxs1d3dp56uEyRcepDpLVHAa/r2IrdsxCB5VaQ0Lr5+RUwiYQ7dX9fFP3CS
 tTQDNKFxgxOPo3fmUcztu06faGGiLbCLYbsRWJ5AHuuZAF/GihjggZGFmDKOL4qZOn4GxtgCJ0Auj
 xKu5XJYe83ig77fjGCo4uTyNemf3IZO/N+gmZEcN7est5s4mVf1A4dBFjA4YqlqDleSjp/mzxN/jL
 4IdHLv2h7Hv3OIa7AvDdRqahfTC2dBEvUZ4n0UXn0oj0I+z1AOYyLFpEhgkYqhx6krmypMIOpWfnS
 LRhgHBU0DXhdnsDu4I8Si7Lbf/zrcqp7RpaaHXz2Lju+QreorTVBN1vdR9zdpJbDNAMxd0ummZKIo
 Pph9XX/FC3M9IBfZvC0ODbwN;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1qPUdT-004lF9-2i; Fri, 28 Jul 2023 21:04:32 +0000
Message-ID: <2e1d86d0855016945c28d921793c434eb078dd35.camel@samba.org>
Subject: Re: What is the status of KDC resource group compression support in
 Samba?
To: Pavel Kalugin <PKalugin@inno.tech>, samba-technical@lists.samba.org
Date: Sat, 29 Jul 2023 09:04:28 +1200
In-Reply-To: <d6fa0a4a-ea12-059a-416a-a254e245b277@inno.tech>
References: <9a11b657-c387-ebe1-389a-3d91c677e8aa@inno.tech>
 <cdd2a4e8f840624395cce796312eeae4500ba4a5.camel@samba.org>
 <d6fa0a4a-ea12-059a-416a-a254e245b277@inno.tech>
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
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

On Fri, 2023-07-28 at 01:07 +0300, Pavel Kalugin via samba-technical
wrote:
> On 7/27/23 22:28, Andrew Bartlett wrote:
> > On Thu, 2023-07-27 at 16:16 +0300, Pavel Kalugin via samba-technical
> > wrote:
> > > Q1: What is the status of KDC resource group compression in Samba? Ar=
e
> > > there any plans to include it in any upcoming release?
> >=20
> > This will ship in Samba 4.19, of which RC1 is due today.
>=20
> Great!
>=20
> > It is always awesome to see new folks interested in Samba development.
> >=20
> > I would warn that, particularly at the quality standard Samba has come
> > to expect, that new features and the associated battery of tests are
> > harder to develop than you might have assumed.
>=20
> I see. To be honest, I'm a bit overwhelmed with the complexity of Samba=
=20
> but, the more interesting it will be to understand all of this.
>=20
> > Realising that your time will be driven by what you or your customers
> > need, I would still encourage your first efforts to be on a less-core
> > feature if possible, so you can get comfortable with the process.
> >=20
> > Anyway, welcome to Samba development.  If you can it would be good to
> > understand your goals further, given that thankfully this particular
> > task is already complete, to see if we can find a good 'first
> > submission' task for you to start on.
>=20
> In general, there is much of an interest around me to move away from=20
> Windows to Linux-only environment, keeping all the AD-based=20
> infrastructure in the "just working" state. This is perfectly doable=20
> with Samba, except that support for 2012R2 level is required by the=20
> customer. One of the features missed was "KDC resource groups=20
> compression". Now, version 4.19 will hopefully fix it, but the status of=
=20
> SID history compression is still unclear to me, so let me ask again:=20
> will this feature (SID history compression) be supported?

SID history is not supported in Samba, and so hasn't been specifically
taken into account in the compression implementation.=C2=A0

When such support is added, it would seem sensible to ensure they are
'compressed' (really just a prefix header + list of RIDs) the same way
as windows does.=C2=A0

Andrew Bartlett

--=20
Andrew Bartlett (he/him) https://samba.org/~abartlet/
Samba Team Member (since 2001) https://samba.org
Samba Developer, Catalyst IT https://catalyst.net.nz/services/samba

