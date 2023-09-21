Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 869927A94F6
	for <lists+samba-technical@lfdr.de>; Thu, 21 Sep 2023 15:54:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=07QoHWNZ+GG6BCfZtTSqy3vx9krLWT7X8lR293HyntQ=; b=jkVT9ETibFcUR/RUphq7F0nYHO
	bSh7k6VLR+tTZ2zlP1UQG+T05NJ8vbP6tAiGk4r+o3j/LqfsAkbDZ49jWwF+EkBuKuJIM6OS4Cwlt
	GOz5NWRJ3i1iNrNJsHLVds8cpz46yLWh3InARpcvNZkSb4cNEwXQjaydOE7T+ZlSgsQWhu4M8A+gB
	2KxxlQytrOe6LqjoqgcLCUcyzNB0HAOzj4PR+3F8cIcFuorpbGDJqJSN+ZBLFYNwl8a/r+3jzdkZM
	2Z3DjDaj0BsqfjM51IZlf7WRd7PcGxurEnASOQP2OMlgj7r1IKC81lk0Np2gdWqhp3fbvzsN1ECf1
	0uyaXEgA==;
Received: from ip6-localhost ([::1]:64322 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1qjK80-005cf3-4y; Thu, 21 Sep 2023 13:54:00 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:31228) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1qjK7t-005cet-31
 for samba-technical@lists.samba.org; Thu, 21 Sep 2023 13:53:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=07QoHWNZ+GG6BCfZtTSqy3vx9krLWT7X8lR293HyntQ=; b=2qm26rcX/2KBCrpaEyRqNSl750
 PMYs1/cco9rY0mk20rdvnFTNuKpdqYcHXtpPujXcH7EL4rzLLDL8CNhC2pELYBfiGDYGpCgnblX14
 Vx8Rh2+Np8gwlvw1rcLNIHTpg6RdtnCDuIBNkBAtlzKDqxCrT/EdKBRA7tblihPDHEokhub5cl8wk
 NToBh9ioGIHEizM/t3GEdjSu0EvTFITo+HfoHhnWLQf8pm/LQJZ8xfakfFIdPOCypg/RAJq2otbgG
 rs95GigPtiTs7igtczI079ToWqN92Jzu1EKYPCp/vIgIc9Vu2ctUMqoBE9V+JT0XAZ75t8hia9BJL
 GhoC8fJXPXg7TSjczMa70EKtzARtKVYnyd6yAU1jos00BFXaB7qrr1P76qPeRx5HH0G9pMy7UHLUq
 Q78VYw3JxDn4KgRAInLFE1oV2z+cNmL/o5VWQ32WSW43wERzEtzRw5NO7iIoaG21HJAibmXalJCkg
 OmCxUcJvOU855969n+xEl/+9;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1qjK7n-00EgtW-37; Thu, 21 Sep 2023 13:53:48 +0000
To: Alexander Bokovoy <ab@samba.org>, samba-technical@lists.samba.org
Subject: Re: [External] : Re: How modern Samba handle krb5?
Date: Thu, 21 Sep 2023 15:53:46 +0200
Message-ID: <3013265.mvXUDI8C0e@krikkit>
In-Reply-To: <582f39dd-6963-70ad-98c8-d4b2ab8e0812@oracle.com>
References: <85be042b-f13e-2280-e0aa-5d074fd3e4c6@oracle.com>
 <ZQwEgdmLKEadm6f5@toolbox>
 <582f39dd-6963-70ad-98c8-d4b2ab8e0812@oracle.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
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
From: Andreas Schneider via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andreas Schneider <asn@samba.org>
Cc: =?utf-8?B?SmnFmcOtIMWgYcWhZWs=?= - Solaris Prague <jiri.sasek@oracle.com>,
 samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thursday, 21 September 2023 10:57:51 CEST Ji=C5=99=C3=AD =C5=A0a=C5=A1ek=
 - Solaris Prague via=20
samba-technical wrote:
> Many thanks for railing me back, Jiri

man krb5.conf -> dns_uri_lookup

It can be set to false ... ;-)


	Andreas

> On 9/21/23 10:53, Alexander Bokovoy wrote:
> > On =D0=A7=D1=86=D0=B2, 21 =D0=B2=D0=B5=D1=80 2023, Ji=C5=99=C3=AD =C5=
=A0a=C5=A1ek - Solaris Prague via samba-technical=20
wrote:
> >> Hi Experts,
> >> While sniffing packets I have found "net ads join" and "winbindd" hand=
les
> >> krb5 by such strange way:
> >>=20
> >> No.	Time	Source	Destination	Protocol	Info
> >> 47	38.477244	10.163.87.117	10.163.87.58	KRB5	AS-REQ
> >> 48	38.478496	10.163.87.58	10.163.87.117	KRB5	KRB Error:
> >> KRB5KDC_ERR_PREAUTH_REQUIRED
> >> 49	38.479156	10.163.87.117	10.163.87.58	DNS	Standard=20
query 0x439f URI
> >> _kerberos.SMBSETUP.CZECH.SUN.COM
> >> 50	38.479597	10.163.87.58	10.163.87.117	DNS	Standard=20
query response
> >> 0x439f
> >> No such name URI _kerberos.SMBSETUP.CZECH.SUN.COM SOA
> >> win-lqmsb4eue0v.smbsetup.czech.sun.com
> >> 51	38.479833	10.163.87.117	10.163.87.58	DNS	Standard=20
query 0x0e56 SRV
> >> _kerberos-master._udp.SMBSETUP.CZECH.SUN.COM
> >> 52	38.480165	10.163.87.58	10.163.87.117	DNS	Standard=20
query response
> >> 0x0e56
> >> No such name SRV _kerberos-master._udp.SMBSETUP.CZECH.SUN.COM SOA
> >> win-lqmsb4eue0v.smbsetup.czech.sun.com
> >> 53	38.480366	10.163.87.117	10.163.87.58	DNS	Standard=20
query 0x50be SRV
> >> _kerberos-master._tcp.SMBSETUP.CZECH.SUN.COM
> >> 54	38.480658	10.163.87.58	10.163.87.117	DNS	Standard=20
query response
> >> 0x50be
> >> No such name SRV _kerberos-master._tcp.SMBSETUP.CZECH.SUN.COM SOA
> >> win-lqmsb4eue0v.smbsetup.czech.sun.com
> >>=20
> >> ...where Add-DnsServerResourceRecord do not support URI RR-type and al=
so
> >> the _kerberos-master is not commonly supported in DC. Can Samba still
> >> work with Windows/based DC?
> >>=20
> >> Older Samba releases were able to respond on err: preauth.required by
> >> preauthentication so I am curious why the modern Samba will fall into
> >> such
> >> madness in such case. Is there an option to rail even the modern Samba
> >> back?
> >>=20
> >> Note: on Solaris I am pushed to use MIT krb5 API where my attempts to
> >> build
> >> Samba with Heimdal to check if it will not work breaks on conflicts wi=
th
> >> system headers.
> >=20
> > URI-based discovery is part of MIT Kerberos handling of realm and KDC
> > discovery. Added in MIT Kerberos 1.15 or so, in 2016, to implement what
> > was later transformed into
> > https://urldefense.com/v3/__https://datatracker.ietf.org/doc/html/draft=
=2Di
> > etf-kitten-krb-service-discovery__;!!ACWV5N9M2RV99hQ!JvbS6_IjJ09-nGc1XU=
uY4
> > c0iwfiGYV79OB_gjoMan2IRb2ov-cFNsdc0nJvXtsxPko2rWYKUhQ$
> >=20
> > It has nothing to do with Samba and in general Active
> > Directory implementations do not support URI-based discovery, though
> > they probably should, for MS-KKDCP implementations be better
> > discoverable.
> >=20
> > We use it actively in FreeIPA.




