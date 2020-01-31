Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E3BE914F35A
	for <lists+samba-technical@lfdr.de>; Fri, 31 Jan 2020 21:50:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=ntPtn5eseBUhbmRB+3EW23i8kGGOgfDTich5/nx6QLs=; b=NZ7Kl1o0W30DhJFwb/v23kcgNf
	xeFuATzw0xPj/gu7FJo68ByGtmgF3DJYxGaMsUiuIUMtHtsxsfOYX7LM7gqtfUagRzuV6UY8zApt/
	JaclgSmV+QEOQ0T2zcFKwKG01GkhXPqNrLIPMJjBmhEM/4GCxcYgjKtowtVmtXRuoz8OcZyW7w/G7
	3J5B88d95mon7sfajsrRcHy3tT7jj3DuJmnQ8LT4rzDmIg9rR8t/W+urwhtTmfZGF1l2SKN2YP+qW
	r/kpdwIMF4CVVX0RTwpkWjyz6OZsEeO9tMuZzu1q6VqoeSysy/suL9bgavxQEDz2humDQWzUDpZf/
	c1O8Abdg==;
Received: from localhost ([::1]:59166 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ixdEM-005sJ7-Bn; Fri, 31 Jan 2020 20:49:34 +0000
Received: from smtp-fw-9101.amazon.com ([207.171.184.25]:37050) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1ixdEH-005sJ0-MM
 for samba-technical@lists.samba.org; Fri, 31 Jan 2020 20:49:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1580503770; x=1612039770;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version; bh=ntPtn5eseBUhbmRB+3EW23i8kGGOgfDTich5/nx6QLs=;
 b=W8VCoZeM48OIjxbv6kw9naKmdb7+KdOXD5ffYeaW7Qc9L57Q8MU4B7VP
 iFfnpkf++MHf39Gp/B9qktM9p2CQ61krzA+gplXW6CKw6n1WhjAgW5X1l
 7cGk/pKZYGFTZDBXoeiQe047xOH+QcnwIG4bojlvZDaZfAGv3B4NCgFhL Y=;
IronPort-SDR: ovFeOcsrUQowdtGQl/lvxCJCIKMkTTNEh1+x9wJl/YI3JO5NN9Y34G4TjHhixOIYkpuD8mlF2H
 Xuo54XU+oUbA==
X-Amazon-filename: signature.asc
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-1d-98acfc19.us-east-1.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9101.sea19.amazon.com with ESMTP;
 31 Jan 2020 20:33:53 +0000
Received: from EX13MTAUWA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1d-98acfc19.us-east-1.amazon.com (Postfix) with ESMTPS
 id 35800A24F8; Fri, 31 Jan 2020 20:33:51 +0000 (UTC)
Received: from EX13D27UWA002.ant.amazon.com (10.43.160.30) by
 EX13MTAUWA001.ant.amazon.com (10.43.160.58) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Fri, 31 Jan 2020 20:33:51 +0000
Received: from u33b4e6d89a065e.ant.amazon.com (10.43.162.69) by
 EX13D27UWA002.ant.amazon.com (10.43.160.30) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Fri, 31 Jan 2020 20:33:51 +0000
To: Andrew Bartlett <abartlet@samba.org>, Alexey A Nikitin
 <nikitin@amazon.com>, <samba-technical@lists.samba.org>
Subject: Re: [Samba] LDAP signing and channel binding
Date: Fri, 31 Jan 2020 12:33:40 -0800
Message-ID: <1805163.6tgchFWduM@u33b4e6d89a065e.ant.amazon.com>
Organization: WorkSpaces Linux Desktop
In-Reply-To: <20200131193507.GF12961@sernet.de>
References: <1761956.tdWV9SEqCh@u33b4e6d89a065e.ant.amazon.com>
 <7f97655db06e40a7d1d6afa7d7d10329a92eceec.camel@samba.org>
 <20200131193507.GF12961@sernet.de>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart1714089.8hzESeGDPO";
 micalg=pgp-sha512; protocol="application/pgp-signature"
X-Originating-IP: [10.43.162.69]
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
From: Alexey A Nikitin via samba-technical <samba-technical@lists.samba.org>
Reply-To: Alexey A Nikitin <nikitin@amazon.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

--nextPart1714089.8hzESeGDPO
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"

Thank you for the RFC reference, that actually helps me a great deal to und=
erstand what's going on there.


On Friday, 31 January 2020 11:35:42 PST Bj=C3=B6rn JACKE via samba-technica=
l wrote:
> On 2020-01-29 at 14:01 +1300 Andrew Bartlett via samba sent off:
> > On Tue, 2020-01-28 at 16:38 -0800, Alexey A Nikitin wrote:
> > > On Tuesday, 28 January 2020 15:57:47 PST Andrew Bartlett wrote:
> > > > On Tue, 2020-01-28 at 15:24 -0800, Alexey A Nikitin via samba
> > > > wrote:
> > > > > I'm having hard time finding any definitive information on
> > > > > whether
> > > > > Winbind supports LDAP signing (I assume 'yes') and channel
> > > > > binding.
> > > > > I read=20
> > > > >=20
> > https://wiki.samba.org/index.php/Samba_Security_Documentation#Special_d=
angers_of_NTLMSSP_and_Kerberos_over_TLS
> > > > > to mean 'no' for channel binding, unless that documentation is
> > > > > outdated or I misunderstand it.
> > > >=20
> > > > Correct.  We don't support channel binding in our client or
> > > > server.=20
> > > > While we avoid this combination where possible, we would gladly
> > > > accept
> > > > funding to add it client and server (DC) side for the the cases
> > > > where
> > > > (per below) it is forced.
> > > >=20
> > >=20
> > > So considering Microsoft is planning to release a patch in March 2020
> > > (
> > > https://portal.msrc.microsoft.com/en-US/security-guidance/advisory/AD=
V190023
> > > ) that would force signing and channel binding for LDAP,
> > > Samba/Winbind developers seem to be rather calm about it. I admit I'm
> > > still learning about AD DS (as well as Winbind), so please correct me
> > > if my understanding is wrong - the above mentioned upcoming patch is
> > > generally not a concern because channel binding applies only to LDAP
> > > authentication over TLS, and there is usually still an option of
> > > authentication using Kerberos and SPNEGO instead of LDAPS. Is my
> > > understanding correct?
> >=20
> > In short, we hope so.  It would still be great if this could be
> > developed, we know that some sites do enforce the use of TLS for
> > various reasons.
> >=20
> > Also, even with the warnings, the Samba development community is small
> > and is funded significantly by customer needs/priorities.  So it can
> > happen that even with warnings such as these it needs a customer to
> > jump up and down before someone is able to put in the time.
> >=20
> > A fix for this in Samba (for the winbind side) won't be trivial, we
> > would need to read the SSL session ID from inside OpenLDAP's use of
> > OpenSSL.  The Samba AD DC may be easier to patch, as we control the
> > stack down to GnuTLS is that case.
>=20
> the LdapEnforceChannelBinding from ADV190023 is obviously for enforcing t=
he
> standarized TLS extension for Channel Bindings, see RFC5929. And I
> just saw that GnuTLS supports that since 2.11.4 already.
>=20
> For our client site it looks like it's time to move away from openldap to=
 tldap
> finally to get control over the TLS layer. Has someone already started to=
 work
> out getting tldap for our client side?
>=20
> Bj=C3=B6rn
>=20
>=20


--nextPart1714089.8hzESeGDPO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEpRZyqYrXfmxeMjWyd71YSxgxbEgFAl40jyQACgkQd71YSxgx
bEgVPg/+Jjhjyb5xAIvSoVSsQCHWbwJp52RsUcuF3d9/XjbH2u+NVh7Nc03lusqS
vLaR8QXEcD4pIBL74qKgSFwlGZWIxNA/S+GPHP380PuFDDksFNMtu5b2fbq9OBwL
pxCVlL1NtY6O9CuNgwU0zObCc/bska6rnOXcvXZCTkwOb11Rvg2fyLfEQfCPqau2
ZuaEU9VS/83zVwk0FIGTCl9zPHml3bgumECI9/XN2uQ/+HAn/AM8apKbt1ivGdaj
jpKOfpYk1uVIlZ74jov5rw86Qgd6G1sW+NI8SFZ2FysOZH6L6dRl87iJxAe4CwsS
IAnCUaHHL6Ot2Q7cAIPhEZ6mvarORLuDpgBT2a1GJAmtHVTxz51PrWl3YBV6ckpl
4TaVuDYuZ3L3f/0tXNroBqGfHJQ7dM74KmAupkLmqskgkQxjoKS8pF4U70oUGvtm
5gc0kM/Y5b+YEHZj1Qu4ZlJSNYh7e5zsMsSavoB2rj7Xnf08L1o0H6kBCCfvGaNm
AbjMNvcwadpj7Hudoo649xniz2JQNHMrsuOpQW2FaJrL95thvaoYspgyv9VkveiY
MQWETHfyiIWAEHwYTQFN4TcsFLTXGj/nWudo0ubte4Xey9IpZJIrTjdz3mOc6NhQ
q8uSKphSKMORBaVq0RwR5MBIIthP69VlJsjaV5CV/UQjxV/W5+4=
=qXXy
-----END PGP SIGNATURE-----

--nextPart1714089.8hzESeGDPO--

