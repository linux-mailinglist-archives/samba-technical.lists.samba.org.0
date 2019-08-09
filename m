Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 12D7C889C7
	for <lists+samba-technical@lfdr.de>; Sat, 10 Aug 2019 10:07:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=2ICimdqOhhhjgFIL8stZPK1H59AxwtDjlTZJP3+SMzw=; b=K67BAvCm4q5R4yj6/bL2Yg+eh/
	TzN2eKducNTO0hoLfXUng1OcsulZEJkdO0b9Rd+8hvJlhb1pew6JMj2OWUeofiEswT7DN3XJ76XzA
	c3ZI3FQ2W6vTAKgt0LNt6yxVHBZfj2kkxjyNQsiYyT9qmnW+gf/tcwkbdMiIQ8iwZ6WhubyrVLGRb
	oDQuja45LiYN/va6cyrsaLjoMF2KEYivuUY5T/oIUjP+UQMq9gIB3lqxkx76cY4edri719qN2qmoI
	Gqubx2DpRUAo1pVjUYOjrRdP1u5XKGlF6hxIyJgvM++zrRdHTWogEFWYv9dZEUPu3m3JDjyvqmdEs
	w9tEqM7A==;
Received: from localhost ([::1]:45482 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hwMPH-005ZGk-Sh; Sat, 10 Aug 2019 08:07:19 +0000
Received: from smtp-fw-6001.amazon.com ([52.95.48.154]:33897) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hw7o9-005QlW-1h
 for samba-technical@lists.samba.org; Fri, 09 Aug 2019 16:32:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1565368321; x=1596904321;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=2ICimdqOhhhjgFIL8stZPK1H59AxwtDjlTZJP3+SMzw=;
 b=S9rvsPIomhutE5hoqf8S2ZaOG7Lav/WGmvOXynio/U3MXP3GbgW+DR/h
 1tHB+/+2fyHSZmFcwkHBF0RLgu8Ww5yuv76t7Vt6znLzwxQlG7oU4oNa0
 j7zZbQNr/Tnoy1PBuBpOSc8arcQfDhSrdbKrE/e4hcGaSUu6/6d0jFAn8 E=;
X-Amazon-filename: signature.asc
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-1d-5dd976cd.us-east-1.amazon.com) ([10.124.125.6])
 by smtp-border-fw-out-6001.iad6.amazon.com with ESMTP;
 09 Aug 2019 16:15:59 +0000
Received: from EX13MTAUWA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1d-5dd976cd.us-east-1.amazon.com (Postfix) with ESMTPS
 id 33710A2729; Fri,  9 Aug 2019 16:15:57 +0000 (UTC)
Received: from EX13D27UWA002.ant.amazon.com (10.43.160.30) by
 EX13MTAUWA001.ant.amazon.com (10.43.160.58) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Fri, 9 Aug 2019 16:15:57 +0000
Received: from u33b4e6d89a065e.ant.amazon.com (10.43.161.88) by
 EX13D27UWA002.ant.amazon.com (10.43.160.30) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Fri, 9 Aug 2019 16:15:56 +0000
To: Richard Sharpe <realrichardsharpe@gmail.com>
Subject: Re: net ads join seems to restrict itself to the first 5 DCs of those
 it finds
Date: Fri, 9 Aug 2019 09:15:50 -0700
Message-ID: <2843453.bmcaEzXCRd@u33b4e6d89a065e.ant.amazon.com>
Organization: WorkSpaces Linux Desktop
In-Reply-To: <CACyXjPyq1qTW3dHmzUcUv+DOH+UkJfkzShb9cvTyDGthDqoesQ@mail.gmail.com>
References: <CACyXjPyxsrrTkD7dBtLuQiwrTh=o+8k9vJPKYfrMtrAe592hwA@mail.gmail.com>
 <1803836.RimPDrGzcC@u33b4e6d89a065e.ant.amazon.com>
 <CACyXjPyq1qTW3dHmzUcUv+DOH+UkJfkzShb9cvTyDGthDqoesQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart92082928.7p9mBM2VMl";
 micalg=pgp-sha512; protocol="application/pgp-signature"
X-Originating-IP: [10.43.161.88]
Precedence: Bulk
X-Mailman-Approved-At: Sat, 10 Aug 2019 08:07:14 +0000
X-BeenThere: samba-technical@lists.samba.org
X-Mailman-Version: 2.1.29
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
From: Alexey A Nikitin via samba-technical <samba-technical@lists.samba.org>
Reply-To: Alexey A Nikitin <nikitin@amazon.com>
Cc: samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

--nextPart92082928.7p9mBM2VMl
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="UTF-8"

On Friday, 9 August 2019 09:07:21 PDT Richard Sharpe wrote:
> On Fri, Aug 9, 2019 at 8:33 AM Alexey A Nikitin <nikitin@amazon.com> wrote:
> >
> > On Thursday, 8 August 2019 15:26:43 PDT Richard Sharpe via samba-technical wrote:
> > > Hi folks,
> > >
> > > We are finding that net ads join is unable to join because it only
> > > issues cldap requests for the first five DCs it finds when looking up
> > > _ldap._tcp.realm ...
> > >
> > > Is this correct?
> > >
> > > The problem seems to be that sites and services is not correctly
> > > configured to return the closest DC first in the list and the one they
> > > should be contacting is around 16 out of 29 returned.
> > >
> > >
> >
> > I cannot confirm (yet) seeing this issue in `net ads join`, but I have seen something similar in `adcli info`, where the code selects only the first five entries among the SRV RR for _ldap._tcp, leading to domain discovery failure in some setups where DNS is configured to return non-site-specific DCs yet firewalls block communications from clients to those DCs. One could rightfully say that the setup itself is broken, yet Windows is robust enough to handle that, but adcli wasn't.
> >
> > I wrote a patch that fixes that behavior in adcli, it got accepted upstream some time ago. If someone can confirm this behavior with `net ads join` (or with Winbind in general - I have seen plenty cases where it fails to locate DCs, just haven't yet had time to pinpoint the root cause) then I imagine the patch for `net ads join` shouldn't be too difficult to write either.
> 
> Thanks for the hint. Yes, Windows is robust in this situation.
> 
> I will have an opportunity to determine if it is 'net ads join' doing
> this or 'realm join' issuing weird instructions to net ads join, but
> it looks like net ads join.
> 
> I will also get a level 10 log.
> 
> 

My experience with `realm join` is that it is a bit of a simpleton. For example, it stumbles and falls flat on its face when you try to join a machine to a resource domain using service account from a user domain, I was unable to coax it into doing so. No matter the way I tried to court it it would demand an admin user from the resource domain. When I bypassed realmd and did `net ads join` directly it joined just fine right away, I just had to manually perform all the configurations beforehand that realmd automates.

--nextPart92082928.7p9mBM2VMl
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEpRZyqYrXfmxeMjWyd71YSxgxbEgFAl1NnDYACgkQd71YSxgx
bEjYSw/9HA9w7ai8BRfcFZUKhff6Sx1z3DW7nm63+gZ8css+c5tP9fep0kY2zwPm
IpepYmclLiQ06QuL2WIF3i5/1YJDezFUnvVvaGyloogJu9lUn36PeOnHD9Z8mIks
zqgh0bx2g37AVh3/ksYOoG2FYyQvQ9v/Fy35vriFsPaQQoHCc/kul3sysahxkloB
zIjzu+DYFyEIHG4RKd6keNVGyabXtM9gO+GfiW70482PwodBo7hDJPwWTjYeteWf
9iMaNOe9JG0HBjt4UWPtJtfl3V+vuMDhckkiAaohMu0b1F/UYYRjYL+q7nsjkEvZ
fAFhpJzPCmLF2CrIuvDG/g9bzqYqYtetgGL1qTiRJ0/cg6M5SCmHAys55u8DSt/T
4YFYskoak/ijL7llYp8zzDs2idZEbaF/N0gpL+Kvarqb+zB94FPMUI0pmbH/Leid
HZVKfsfJ3lDKFmqn9q3buL9OXcW8CVSx0z4M2cQpZfkVXC5zywcKPcRlpc/eoXcf
HGYDvaxkK0SUNq4MoyBH8E/A+e4j0qG61ev3YhrzPEOJdKzgPo2+nQdbw/yrRIbQ
R1xCgLfw/Cgk3e06aDjAZCWgV4hxQn9za/oQ2gByhle+jKcjOwChJpMv1Q6KgRh/
gtvPkQ7OqdlSY43+OdeIyAaunWKUDMwKeUQY2q4DyguoEr/d60A=
=qeNz
-----END PGP SIGNATURE-----

--nextPart92082928.7p9mBM2VMl--

