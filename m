Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 47898B74A6
	for <lists+samba-technical@lfdr.de>; Thu, 19 Sep 2019 10:02:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=QRjvtsjY8y+F4hLyEzo3epPpLJJchsTSANr6eyMuqXs=; b=m7oQvXejVdNeDDSuEOhE8/PYhI
	bkzw6Y95oq1WNG0eN+HWwDUxJMLummUdgkNo/4bCyNHAaaUnoxtwjcBk1EtHlRD+k300lYlSMv0ny
	WhKzhu9JC9lOuy0uYxuA1GSy6WrbUUGttiW3NTv6C7tBNUNPyGfDJAmud+soKHWl3WZ8N+mnJ76hB
	dCLNCFB3Uyl9nzMgU3CKd9RzNEvnDN9D+DZNrhZOJ4VVV94FdwbuWhozImvXzYx9bSM1ksMR5gJFC
	JkPl6GFwTUEgoCsWDWoqBYDdh4nfeEvAN/VDBlamO154nZKg46kUJlP8qSigPYj1sUeVGCxiNCpGY
	5XmM3n8g==;
Received: from localhost ([::1]:19508 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iArNw-006ohx-QT; Thu, 19 Sep 2019 08:01:52 +0000
Received: from smtp-fw-9102.amazon.com ([207.171.184.29]:21223) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1iAgtw-006hEK-76
 for samba-technical@lists.samba.org; Wed, 18 Sep 2019 20:50:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1568839812; x=1600375812;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version; bh=QRjvtsjY8y+F4hLyEzo3epPpLJJchsTSANr6eyMuqXs=;
 b=eQbVJTtoJIDUcQ5eHpNCRouKhpT2r/I/+9FPeF8n5RlQXWUINpJStBbZ
 yY3atH3fQMR4fpz2kpOXEAx6NVrA8PHQP4GhX9fBjVGuLZCvXFQu1vk6w
 iAytUyQbu1kieJ///yRejy8imW5tWUzsKRk05lpjDsPA9eykizbqx+zR1 g=;
X-Amazon-filename: signature.asc
Received: from sea3-co-svc-lb6-vlan3.sea.amazon.com (HELO
 email-inbound-relay-2a-6e2fc477.us-west-2.amazon.com) ([10.47.22.38])
 by smtp-border-fw-out-9102.sea19.amazon.com with ESMTP;
 18 Sep 2019 20:33:53 +0000
Received: from EX13MTAUWA001.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2a-6e2fc477.us-west-2.amazon.com (Postfix) with ESMTPS
 id 3046AA1E39; Wed, 18 Sep 2019 20:33:52 +0000 (UTC)
Received: from EX13D27UWA002.ant.amazon.com (10.43.160.30) by
 EX13MTAUWA001.ant.amazon.com (10.43.160.58) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 18 Sep 2019 20:33:52 +0000
Received: from u33b4e6d89a065e.ant.amazon.com (10.43.161.217) by
 EX13D27UWA002.ant.amazon.com (10.43.160.30) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 18 Sep 2019 20:33:51 +0000
To: <samba-technical@lists.samba.org>, Richard Sharpe
 <realrichardsharpe@gmail.com>
Subject: Re: Sites and services and queries for SRV records ...
Date: Wed, 18 Sep 2019 13:33:42 -0700
Message-ID: <44826820.fKAd0jnEr8@u33b4e6d89a065e.ant.amazon.com>
Organization: WorkSpaces Linux Desktop
In-Reply-To: <CACyXjPxh=feYNk3o=DWxQN5xc4s8T5NNffoi_boTck1N39Rx8w@mail.gmail.com>
References: <CACyXjPxh=feYNk3o=DWxQN5xc4s8T5NNffoi_boTck1N39Rx8w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart5923000.5bUUWkjyxf";
 micalg=pgp-sha512; protocol="application/pgp-signature"
X-Originating-IP: [10.43.161.217]
Precedence: Bulk
X-Mailman-Approved-At: Thu, 19 Sep 2019 08:01:50 +0000
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

--nextPart5923000.5bUUWkjyxf
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"

On Wednesday, 18 September 2019 12:22:44 PDT Richard Sharpe via samba-techn=
ical wrote:
> Hi folks,
>=20
> I thought, perhaps naively, that if an organization is using sites and
> services, and you do a query for SRV records from Site A for
> _ldap._tcp.<realm> that the Windows DNS servers would return the SRV
> records ordered with those for Site A first.
>=20
> Is there more that you have to do to ensure that? What I am seeing
> looks like standard random round-robin order.
>=20
>=20

The behavior of SRV RRs is specified in https://tools.ietf.org/html/rfc2782
To summarize the related to your question info:

The order for the servers in SRV RRs is not guaranteed, instead the clients=
 should attempt to query those servers in the order that depends on the wei=
ght and priority of the corresponding SRV RRs. In case of MS AD DS, for exa=
mple, order of the SRV RRs may depend on the order in which DCs came online=
 and registered themselves with DNS. The weight and priority ideally should=
 depend on the domain topology, and IIRC there is a way to have each DNS se=
rver in the domain return the same server with different weight/priority, o=
r even limit the domain-global SRV RR set to just the site-specific SRV RRs=
=2E But in a simple multi-site setup with all links between the sites equiv=
alent and all DNS servers providing the same SRV RR sets whether client wil=
l first pick a DC in it's local site is up to the dumb luck. What client th=
en should do is described in the DC Location mechanism specification (see  =
[MS-ADTS], [MS-NRPC], ash [MS-DISO] - some of these are deprecated, but emp=
irically still hold true), though to simplify it sends the NetLogon ping to=
 the first server it picks, and then reads the response to figure out which=
 site the client is in and whether that server is from the client's site or=
 some other site; if the first server is not the closest to the client then=
 client should make another SRV RR query, this time using the closest to th=
e client site it obtained with the first NetLogon ping response.
--nextPart5923000.5bUUWkjyxf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEpRZyqYrXfmxeMjWyd71YSxgxbEgFAl2ClKYACgkQd71YSxgx
bEiwYw/+LzTz58ftU5cVQwdIeZSrTkNTcQeBuxk+tfdAdeg8s3yRfwnXx8jlCw5R
CvTc+GgYUV2PiqyqBOySrXVZ1lBC8iQG/N0FnpG+jNuf0GkxHRNrFXiWi0mEUB+7
bXmMgwGBe+8BZizjxcGSFSIZJd3MhF7jZXl87HbXUWWhK6Ljoav+Y+tT9qmuNdQZ
eIl7Mrna5rCihLXgOpbMDKVRIdUHKjcD3/zoVRiKiFmxuAVy0/VNdo2bbRAi2tPH
GkIhIiJ7bdNrnOsZYNNQTV51vHHA8szl8f7gvVL+p4HdOKBxbUvFJ9R68L7htHVC
87O1uTJKUKPLHE+yG+fjTdsKYF2X9mDzV8IzCdUeini1SMpJFGdSZY/KySeMhe9h
D3PL7TtAAAu/UbbXwJSt2GVIy5kXecx7pLOlOpRQ1JLq82ibr8PbieggEE0EE5wu
V088LlYP+avIWnEXaiA2MDCvCEgHoLiNHhETlij4WZeCD0jADspbcExqJ5UFlFzi
Lxqxy/37g8pe/WBosGFE2tq2zZ7aVp/VUwgVtTLqFNNfJQJnY5mFt8AE+2eIbW0y
XmEPcwt9c792jzCi2m0urfiX0npcRO57BrOcdYUyLgfSKTUnHoKsg+83TORDdSEU
t95ZPv/cdVVb1DbCCQY6vHbZKI2pDPAlqniGxJOMXVOfuFwIG40=
=bj4s
-----END PGP SIGNATURE-----

--nextPart5923000.5bUUWkjyxf--

