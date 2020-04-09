Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 8876C1A37B7
	for <lists+samba-technical@lfdr.de>; Thu,  9 Apr 2020 18:06:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=CKQN/9hAov1+m3illzHFaU0bQP6l0e8lPgaEfoyoCzc=; b=nJICp70DqTdn18oKIF2ZVvicL1
	FB3j7JD2ZUno7BV/7VUujyHNMakxXo1hfju+pGGMPbRsPuRFOYzKH/rWdmVDD031L73NKU1wB7jdw
	gbg14t+pFevCxdYVxPU8NPPH31/UY+CbqKBxGxTLrIpUg4v7FD3D3qvzgvJBCfTUq5gUe0iiSXAvN
	GKjm7/n/5vhBB3X1bdsRLb7L/Infal335tHrkH2EjaFarNGtp2tylYW78S3OwTBpP+ixIlFqDGms/
	ODODdqEjcGHvKClp5AKL5aAj/Lhnxyb/bLb2P43XFZN95QeJjH3RfKT7rs6/yTHQgcW6Xt9kfqyhe
	M6j6fSqg==;
Received: from localhost ([::1]:61538 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jMZgW-000KJH-7J; Thu, 09 Apr 2020 16:05:44 +0000
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:21734) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1jMZgQ-000KJ8-Vk
 for samba-technical@lists.samba.org; Thu, 09 Apr 2020 16:05:41 +0000
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 039G3MsT089856
 for <samba-technical@lists.samba.org>; Thu, 9 Apr 2020 12:05:35 -0400
Received: from e06smtp04.uk.ibm.com (e06smtp04.uk.ibm.com [195.75.94.100])
 by mx0a-001b2d01.pphosted.com with ESMTP id 309206n2qa-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <samba-technical@lists.samba.org>; Thu, 09 Apr 2020 12:05:34 -0400
Received: from localhost
 by e06smtp04.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <samba-technical@lists.samba.org> from <swen@linux.ibm.com>;
 Thu, 9 Apr 2020 17:04:52 +0100
Received: from b06cxnps4075.portsmouth.uk.ibm.com (9.149.109.197)
 by e06smtp04.uk.ibm.com (192.168.101.134) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 9 Apr 2020 17:04:48 +0100
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 039G5EEY59900130
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 9 Apr 2020 16:05:14 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 29FBFA4057;
 Thu,  9 Apr 2020 16:05:14 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D2C32A4055;
 Thu,  9 Apr 2020 16:05:13 +0000 (GMT)
Received: from sig-9-145-88-164.uk.ibm.com (unknown [9.145.88.164])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu,  9 Apr 2020 16:05:13 +0000 (GMT)
Subject: Re: tldap search paged
To: Jeremy Allison <jra@samba.org>
Date: Thu, 09 Apr 2020 18:05:06 +0200
In-Reply-To: <20200408171948.GA13874@jeremy-acer>
References: <9ee1108dab93f774bb1be3eef0dceb711d2f1221.camel@linux.ibm.com>
 <20200408160707.GA8347@jeremy-acer>
 <697ec73e9ff11f54648f4e2519c3316031b53027.camel@linux.ibm.com>
 <20200408171948.GA13874@jeremy-acer>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-5yPpy7XTQuo9PdaEdDV4"
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
x-cbid: 20040916-0016-0000-0000-0000030186DD
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20040916-0017-0000-0000-000033656D23
Message-Id: <45c482f7a6047743ba129bbbc585066d01899aaf.camel@linux.ibm.com>
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
From: swen via samba-technical <samba-technical@lists.samba.org>
Reply-To: swen@linux.ibm.com
Cc: samba-technical <samba-technical@lists.samba.org>, metze@samba.org,
 Simo <simo@samba.org>, Volker Lendecke <vl@samba.org>, uri@samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>


--=-5yPpy7XTQuo9PdaEdDV4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2020-04-08 at 10:19 -0700, Jeremy Allison wrote:
> On Wed, Apr 08, 2020 at 07:07:57PM +0200, swen wrote:
> > On Wed, 2020-04-08 at 09:07 -0700, Jeremy Allison wrote:
> > > You haven't explained *why* you need this code.
> > Hmm sorry, I thought I did say that I'm in the process of creating
> > a
> > winbindd_ldap which is supposed to replace winbindd_ads.
>=20
> Can you start with explaining your overall design
> for this, rather than diving into low-level coding.
>=20
The base goal is to lay the foundation for a series
of winbind improvements.
The replacement of the ADS-API in winbindd by the tldap library
is just
the first step.

Further goals in this area are:

- Improve the failover times for disappeared DC

- optimize the kerberos ticket handling in such a way that=20
  existing
tickets are used instead of triggering a new auth request

- centralize the DC connection management to support a reliable and=20
=20
fast detection of connection loss and reconnection process

- integrate and condense the required code and functionality to
  a minimum number of layers and remove APIs and layers not required.

As a first step we decided to align the ldap libraries and
move the
functionality, included in winbindd_ads.c,
to use the tldap library.

Since we didn't want to reinvent the wheel we started using the=20
functio
nality offered by the tldap-/tldap_util-library which does offer
already a few of the required features.

As a starting point of this first step, we replace each externally=20
trig
gered function (callbacks) from the winbindd_ads.c=20
by pure-ldap
versions.
Not only that this is the least invasive approach but it eases the=20
test
ing as the results and timings are easy to compare.

I hope this explains things and motivates you all to support the small
modifications suggested by my patch-set.

Cheers Swen

--=-5yPpy7XTQuo9PdaEdDV4
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEErGbWt5PHCTgy2J0tug2knLYPYasFAl6PR7IACgkQug2knLYP
YavreQ//YWnCKSYLT3TaNGcJdAWZp2kqPPjQEzNyUpr4OZubx5r4Natzv3+ZhtUR
krlcEhhs0RfpNob3RSjDSUoMiAZ+15FNw7lEn8+PGNCSgDXJL+8McYehgiCmQqJ2
HTw/6IL5QegVyiqKZpslogia8zM0zSIB290C5Daq6AqiCLDaUhs1VmgKp/5z6HJj
IRMRF6EwtW0m9gzJVuLL3l/4evhVq2FTY9zQIKvQzIc7g/Cn9EAKhNAx6WAjTmIh
ygTG2bgdJz1J/thUdvyf7BVaiBrAxk9NWKr6sAaWyOwXGXFCq+i82YQMv4fblldM
y/kdplPzsLGVj3KMKtug8ZWLDY/KFAGhjs9ciQgsjdBTpX4zHs3593MsbZEvyRJI
N2PfNkzJZRb/wYjN3uAKUNXPTATsooQek7GKRWul7DOo/WdMPYwUD68Bb6AAAFi4
7rBV1vxq/oOODlkJuSXsGt9SfWFL0gY/8tbubKdHx6uxPsj0AELt0YxwWh1oqzT5
DDweNX4uTEP59BEDgmQwWPd3gjkEcBjvx0p4twhkcR7Sem0mJJY5/rI4RpCAkwOK
ktCqodsrsUlS5HeQdiX/04qzc59+Kc8B+GVnxPrgv2EFAi3PwIFeyehDNKKaQmSo
8uy4qoJ4MYPHT8KFAZFGbkDy8SOwFm+VCaz4y0gKDYzjtA98XAY=
=TeSi
-----END PGP SIGNATURE-----

--=-5yPpy7XTQuo9PdaEdDV4--


