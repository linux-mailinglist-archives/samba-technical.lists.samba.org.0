Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id F095D765C1A
	for <lists+samba-technical@lfdr.de>; Thu, 27 Jul 2023 21:29:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=Ps59T+5C66KvHpwDygAHJ2YKC0wnmGBE7Jf6Knbo1Bs=; b=fLY8E2wsc10F+MNcJtm7SvaDq9
	0ErqXoSUz49Ro0U1UvpFK18C6yoA8uhgLP76xkpNNLod1o9As9fxsF9BTZabclONdcQDq/jy9JRqI
	DMzR1wamQv7IQJfoX4XMEhQYj7alzZJMdctqA6X1oLVoR4h8d7PCYr0Ijo4Xr9vee4UtC7VQwt4GE
	9S2flodtC6SatXDPVFkpzBMjJWhn3HsAkFOrKGMtPFZoUYnu9/44abSVdfYtNRtebwiorCwPvbSnc
	ZqVn/2IyjslkCdDZKrRHfSIKc+f1fvBvPqWL4qkfPtr/gI64w1TqCG+qHT1OMWJiIyT9jCM9Coxh6
	5N4lAe5Q==;
Received: from ip6-localhost ([::1]:41202 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1qP6fM-005gR9-J6; Thu, 27 Jul 2023 19:28:52 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:56746) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1qP6fE-005gR0-Hn
 for samba-technical@lists.samba.org; Thu, 27 Jul 2023 19:28:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=Ps59T+5C66KvHpwDygAHJ2YKC0wnmGBE7Jf6Knbo1Bs=; b=o46KETrP4AN75wK1liFrbJNxYa
 XI9qqYeZtF5xTZZSMwkvyULH/HbwuGbU6iBok3JzX/+qg8UDjSYhU50F8fMHSJmwaE7WH3ZYNTNBl
 kxyYcnCvCiMYZt+YjGXX2bAo6TLC92rHxXzhgSkNsj24UwC4e0XFi+eA4mzuAeXEd3lvDudwfUeWR
 b8ijOZhzQHOT3wOXXnBONBCjFpkTeP/X81hKSpBttSdAPj8g1nX4h1V7dbJbo5X/DKUVTLQgAG+tK
 4I9mGJLqabrUA1zfqRATCUWo5a7+sRbcPXB8owamlH1Vnuvt5MrMXsFp6DGAJPgZupBmoCDWp+i2F
 lMFzhyoqhU3Ahp+QfvmdloFuH1Bg3H3R4bxp4bTQX7ETXLwaoVmHV53UqNSLXVfq25z5i+cUxsjqf
 Pk55fC31mTVrkEM3lyeSz3oIWbuYzNfZkUjYpU9lguTMGs4ypkV2C8AFyRM/Z0pa4ZmFTOugOWagJ
 WlyCX0nZTe4cT37MWFMbJObi;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1qP6fB-004VD4-1Z; Thu, 27 Jul 2023 19:28:42 +0000
Message-ID: <cdd2a4e8f840624395cce796312eeae4500ba4a5.camel@samba.org>
Subject: Re: What is the status of KDC resource group compression support in
 Samba?
To: Pavel Kalugin <PKalugin@inno.tech>, samba-technical@lists.samba.org
Date: Fri, 28 Jul 2023 07:28:38 +1200
In-Reply-To: <9a11b657-c387-ebe1-389a-3d91c677e8aa@inno.tech>
References: <9a11b657-c387-ebe1-389a-3d91c677e8aa@inno.tech>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
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
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thu, 2023-07-27 at 16:16 +0300, Pavel Kalugin via samba-technical
wrote:
> Hello all.
>=20
> Recently, some support for KDC resource group compression was added to=
=20
> Samba by commit e3fdb2d=20
> (https://gitlab.com/samba-team/samba/-/commit/e3fdb2d00152d86558a2ba29b92=
fd36440055461).=20
> The commit message explicitly mentioned "domain-local groups" only,=20
> while the Microsoft description of the feature=20
> (https://learn.microsoft.com/en-us/previous-versions/windows/it-pro/windo=
ws-server-2012-r2-and-2012/hh831747(v=3Dws.11)#kdc-resource-group-compressi=
on)=20
> also mentions "universal groups, and groups associated with security=20
> identifier history".
> Also, there were some relevant commits which enable a bunch of=20
> previously disabled group tests, but several tests are still disabled=20
> for Heimdal, and even more for MIT Kerberos.
>=20
> Q1: What is the status of KDC resource group compression in Samba? Are=
=20
> there any plans to include it in any upcoming release?

This will ship in Samba 4.19, of which RC1 is due today. =C2=A0

The developers involved in this feature targeted Heimdal Kerberos, the
MIT support tends to come later when the developers involved in that
port use the tests to devise the upstream changes required to MIT and
get them into a release, whereas we have more freedom to change our
fork of Heimdal (and upstream our changes where possible).=C2=A0

It is always awesome to see new folks interested in Samba development.

I would warn that, particularly at the quality standard Samba has come
to expect, that new features and the associated battery of tests are
harder to develop than you might have assumed. =20

Realising that your time will be driven by what you or your customers
need, I would still encourage your first efforts to be on a less-core
feature if possible, so you can get comfortable with the process.=20

Anyway, welcome to Samba development.  If you can it would be good to
understand your goals further, given that thankfully this particular
task is already complete, to see if we can find a good 'first
submission' task for you to start on.

Andrew Bartlett

--=20
Andrew Bartlett (he/him)        https://samba.org/~abartlet/
Samba Team Member (since 2001)  https://samba.org
Samba Developer, Catalyst IT    https://catalyst.net.nz/services/samba


