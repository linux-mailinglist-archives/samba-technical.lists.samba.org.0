Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E1A3B74A9
	for <lists+samba-technical@lfdr.de>; Thu, 19 Sep 2019 10:02:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=aHmIAp+HjeKh0nDlboZaEwdPjSjLDQ2RVUXnXzcnWSM=; b=IFTThVYHrBIu8jMkztmmdO2in2
	zbdRAIfmBdhdjPPG8jzrnQzGd2YxCU1bODtfFbeayzN6Q7mdHOq1ExIorjILS6vYDCkIRLNznmIYD
	c/QVApnUbfHTGbZ1kqmQW2CF5mye3OJAdZyQvirI8X6yrNeoMYummpuCyioFohPaYQDub/hLbxgK+
	ob0J5nYIVjB2pwb+8TKkwPpG7gThxB3ughNKlGO5aOU/E3F72TCrMd4crydzGBQU9YZLozgAm6ppz
	2YRXNE/Yquydo/u6ZbnrEcntVYfdtFLz/Wa3Vc7K+Qo7vuJtSe46LqbFgl1jCbulkaQgRfrrUbQEa
	giGRVWPg==;
Received: from localhost ([::1]:20260 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iArOQ-006oo1-49; Thu, 19 Sep 2019 08:02:22 +0000
Received: from smtp-fw-6002.amazon.com ([52.95.49.90]:25269) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1iAhI5-006hYJ-7P
 for samba-technical@lists.samba.org; Wed, 18 Sep 2019 21:15:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1568841309; x=1600377309;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version; bh=aHmIAp+HjeKh0nDlboZaEwdPjSjLDQ2RVUXnXzcnWSM=;
 b=gSQPA5s0uPT+5o075PRyBOisQhnA5SaHlWJ+Abak8WcG0yhHa5DxX4lR
 7TBq5lPMCwg8xOvqYvHwcp+s9gIPg464LT17zJ96MV8HwxmQVEKzVpWsF
 YYCYIMt0QRt98w7UMZpPiJqhL9PRWqw7HFgnrAqt3+MG67wGN6F8cCq7z A=;
X-Amazon-filename: signature.asc
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-1a-7d76a15f.us-east-1.amazon.com) ([10.124.125.6])
 by smtp-border-fw-out-6002.iad6.amazon.com with ESMTP;
 18 Sep 2019 20:59:02 +0000
Received: from EX13MTAUWA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan2.iad.amazon.com [10.40.159.162])
 by email-inbound-relay-1a-7d76a15f.us-east-1.amazon.com (Postfix) with ESMTPS
 id 78F86A2381; Wed, 18 Sep 2019 20:59:01 +0000 (UTC)
Received: from EX13D27UWA002.ant.amazon.com (10.43.160.30) by
 EX13MTAUWA001.ant.amazon.com (10.43.160.58) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 18 Sep 2019 20:59:00 +0000
Received: from u33b4e6d89a065e.ant.amazon.com (10.43.162.189) by
 EX13D27UWA002.ant.amazon.com (10.43.160.30) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 18 Sep 2019 20:59:00 +0000
To: <samba-technical@lists.samba.org>, Richard Sharpe
 <realrichardsharpe@gmail.com>
Subject: Re: Sites and services and queries for SRV records ...
Date: Wed, 18 Sep 2019 13:58:52 -0700
Message-ID: <1687967.4MLVLAP09i@u33b4e6d89a065e.ant.amazon.com>
Organization: WorkSpaces Linux Desktop
In-Reply-To: <CACyXjPwy0yR5KZeh2JpS2ZwPHNmqo36WkuN9JPH9FmzKdUPNkA@mail.gmail.com>
References: <CACyXjPxh=feYNk3o=DWxQN5xc4s8T5NNffoi_boTck1N39Rx8w@mail.gmail.com>
 <44826820.fKAd0jnEr8@u33b4e6d89a065e.ant.amazon.com>
 <CACyXjPwy0yR5KZeh2JpS2ZwPHNmqo36WkuN9JPH9FmzKdUPNkA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart3278094.J6kXmkrJxQ";
 micalg=pgp-sha512; protocol="application/pgp-signature"
X-Originating-IP: [10.43.162.189]
Precedence: Bulk
X-Mailman-Approved-At: Thu, 19 Sep 2019 08:02:19 +0000
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
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

--nextPart3278094.J6kXmkrJxQ
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"

On Wednesday, 18 September 2019 13:45:57 PDT Richard Sharpe via samba-techn=
ical wrote:
> On Wed, Sep 18, 2019 at 1:34 PM Alexey A Nikitin <nikitin@amazon.com> wro=
te:
> >
> > On Wednesday, 18 September 2019 12:22:44 PDT Richard Sharpe via samba-t=
echnical wrote:
> > > Hi folks,
> > >
> > > I thought, perhaps naively, that if an organization is using sites and
> > > services, and you do a query for SRV records from Site A for
> > > _ldap._tcp.<realm> that the Windows DNS servers would return the SRV
> > > records ordered with those for Site A first.
> > >
> > > Is there more that you have to do to ensure that? What I am seeing
> > > looks like standard random round-robin order.
> > >
> > >
> >
> > The behavior of SRV RRs is specified in https://tools.ietf.org/html/rfc=
2782
> > To summarize the related to your question info:
> >
> > The order for the servers in SRV RRs is not guaranteed, instead the cli=
ents should attempt to query those servers in the order that depends on the=
 weight and priority of the corresponding SRV RRs. In case of MS AD DS, for=
 example, order of the SRV RRs may depend on the order in which DCs came on=
line and registered themselves with DNS. The weight and priority ideally sh=
ould depend on the domain topology, and IIRC there is a way to have each DN=
S server in the domain return the same server with different weight/priorit=
y, or even limit the domain-global SRV RR set to just the site-specific SRV=
 RRs. But in a simple multi-site setup with all links between the sites equ=
ivalent and all DNS servers providing the same SRV RR sets whether client w=
ill first pick a DC in it's local site is up to the dumb luck. What client =
then should do is described in the DC Location mechanism specification (see=
  [MS-ADTS], [MS-NRPC], ash [MS-DISO] - some of these are deprecated, but e=
mpirically still hold true), though to simplify it sends the NetLogon ping =
to the first server it picks, and then reads the response to figure out whi=
ch site the client is in and whether that server is from the client's site =
or some other site; if the first server is not the closest to the client th=
en client should make another SRV RR query, this time using the closest to =
the client site it obtained with the first NetLogon ping response.
>=20
> Thanks for that. Clearly, I didn't understand sites-and-services.
>=20
> In my case the problem was a domain joining problem where we don't
> know what site we are in at that point anyway.
>=20
>=20

Normally Winbind (or other client software) should figure out the site auto=
matically, given the directory is not misconfigured. What is the exact prob=
lem you're running into?
--nextPart3278094.J6kXmkrJxQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEpRZyqYrXfmxeMjWyd71YSxgxbEgFAl2CmowACgkQd71YSxgx
bEjwOw//UKRvIcvg9hx7bdkIedlR/ESbmFtWENrTFuhkqfPNDsWxpTA2UPjes6SX
2SXok8Hvex3GBs69a9xYyN8l/wlmkykVVmThzLGiSBw/5/OCZImd42Lu0tiN5a7L
P3E+nUcME4VNSpKpL7fmDiiqkTZLauCYsQP/isy6JK+yjnwyVmpFRQwoI9Z0Wk1O
s7UZvS5e5HcAYZSNM+gj4+ZPPdbBrsDZ5lapxTQgeks5UyI8+mphImzkHRMYgB7O
0PmfsAjr8a2iHUPKsAlIpGH/VF3xkf0FJS8oGszfxBchG3NNkaKu0AKTVouxN8xc
FFJQo81AQN/uGGM73mgITJkkluMbEAF7g9MtlTRZ4HOsSdbIV72WbsIKhsZeYdXm
3FxLB+ZIWqodZbIgLhshedpdh5+lcZmeim2AJM5jG7Apt/ch6BLZRMwe75qP9u6y
oSy/yGhVjs2M028NQfG5EnxkaFLAwUvKDh3v1ZAFECf4fJlyDZx+GvnH8smRQTxk
I8ymwdejLxqobWv+m10Z0xqoy0dagFvmWXkAIJl4w/9tIL9ROlCJWP8xw9iVdQP6
U8hglJUBBLz57g3YRt/R6yuuZWLxlaTAKDj8778J69S2q4KdBCKcb8VOcGqzKi0G
UyV9jQYV5O7gQMhepPiCgNpy26bXwyfkzgXeXKAxVj7nmaX9SNQ=
=ewxD
-----END PGP SIGNATURE-----

--nextPart3278094.J6kXmkrJxQ--

