Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B124971A05
	for <lists+samba-technical@lfdr.de>; Tue, 23 Jul 2019 16:14:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=ftNQ2Q0voE2DXZOrxNntOJ8kd70IUzuIrpMRleni4k8=; b=o/5Zr2QMZRoKs3LCXVelt69VQv
	x6g0Zx+YrwYRFuvhICF1HG9BMcwo7M4BX7LfCrMNbI9djmsGVoSGxUNLcuN1nD3PArHk1Z9Cke8bl
	7sHiXUPDcd68m37DksSy/5XBiWAcDrWf0AVhiVEIzaOxK6H75L/TaCMGS22jbEhXxgJEsrNVVlvSt
	hlU1Fgtw06XwSCywiQFi/tYdLKbtdLrkVYs3iWbveFZbdk+BynZWUn3/ww6TTtFqhiu03VipgFSPW
	jppYhLsO+JhqaM9oWGryPW4xfdAaBY2TkOQhBzCpb9up31xt/iEhd4Kwu10OaU2J7RYDWhUlW4B8+
	zEPtUgaw==;
Received: from localhost ([::1]:22846 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hpvXp-0020xI-JV; Tue, 23 Jul 2019 14:13:33 +0000
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:40406) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hpvXk-0020x9-NS
 for samba-technical@lists.samba.org; Tue, 23 Jul 2019 14:13:31 +0000
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6NDlv6V140659
 for <samba-technical@lists.samba.org>; Tue, 23 Jul 2019 09:51:44 -0400
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2tx2u9t6hh-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <samba-technical@lists.samba.org>; Tue, 23 Jul 2019 09:51:43 -0400
Received: from localhost
 by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <samba-technical@lists.samba.org> from <swen@linux.ibm.com>;
 Tue, 23 Jul 2019 14:51:41 +0100
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
 by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 23 Jul 2019 14:51:39 +0100
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x6NDpcAi52756650
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 23 Jul 2019 13:51:38 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 87CB0A4051;
 Tue, 23 Jul 2019 13:51:38 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 65288A404D;
 Tue, 23 Jul 2019 13:51:38 +0000 (GMT)
Received: from sig-9-145-173-239.de.ibm.com (unknown [9.145.173.239])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 23 Jul 2019 13:51:38 +0000 (GMT)
Subject: Re: [PATCH] resolv_wrapper: prevent RTLD_DEEPBIND if run with libasan
To: Andreas Schneider <asn@samba.org>
Date: Tue, 23 Jul 2019 15:51:34 +0200
In-Reply-To: <2630461.v4r0AqFQku@magrathea.fritz.box>
References: <754eb6da79776c66d8df834a0b0f287ab9e09aa1.camel@linux.ibm.com>
 <2630461.v4r0AqFQku@magrathea.fritz.box>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-slxDZJH3ACqxoxO71nxj"
User-Agent: Evolution 3.30.5 (3.30.5-1.fc29) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
x-cbid: 19072313-4275-0000-0000-0000034FDA82
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19072313-4276-0000-0000-0000385FFFB3
Message-Id: <2246bd2b4d9ee2a881ce027a867c36e5cf9023f1.camel@linux.ibm.com>
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
Cc: samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>


--=-slxDZJH3ACqxoxO71nxj
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andreas

thanks for your quick response.

I was trying to run some basic (samba) tests with the 2 sanitizers
enabled but was stopped right away with the DEEPBIND error.

After applying your updates and my 2 small additions that worked.
But now this even runs without the resolv_wrapper patch :-)

Not sure what went wrong on my system, but anyway.

So my intention was not to run resolv-wrapper code with the sanitizers
but more the main samba code.

Anyway, sorry for the noise !

Cheers Swen
On Tue, 2019-07-23 at 15:11 +0200, Andreas Schneider wrote:
> On Monday, July 22, 2019 3:09:38 PM CEST swen wrote:
> > The only one missing afer Andreas' update.
> >=20
> > Please review and push if happy.
>=20
> Hi Swen,
>=20
> this should normally be tested, so implementing this involves a bit
> more than=20
> just that single patch :-)
>=20
> See for example how I did it with uid_wrapper:
> https://gitlab.com/cwrap/uid_wrapper/merge_requests/1/commits
>=20
>=20
> This runs the tests with Address Sanitizer, so it also makes sure
> that this=20
> works correctly.
>=20
>=20
> Cheers,
>=20
>=20
> 	Andreas
>=20
>=20
>=20

--=-slxDZJH3ACqxoxO71nxj
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEErGbWt5PHCTgy2J0tug2knLYPYasFAl03EOYACgkQug2knLYP
YavIUA/+IEqM8PFyzB7eRNFTt9HeqGnCHJsrGJY+J5NPXeM5vRt7mSIWwcUUtAx6
NRgDqVYTNQYPeDz24yXv0FiqoqipNiNzpO7A5XLz3pw41GzCtmvmiyt+ZyfgXtnr
YSl+acdd6VqqYIWxVRhDAVTnXQ6spuArOQ0TAH4X1a2m4vzxEWEbhtxI+fEnyyyb
8glzbojcmThR/eX4rWqTGvI6WtSvVne1rcq8ws9rXHZNt1FEh3X0XDwX6Gl5h5Lw
uRWe3YuM3CoO2cGPgEnMymbTFXYvb/d+wZZvxH/zG4uXM6HzvP7kq4Ub8sjG4SaD
uu8wnml7q9ID92JiaRzEbzneQ50c3gExl3K5i6XPbzQO4140U9XArrXq15ylY5BD
Af5EBh08cAfo5s3p3KwMGA6DmLNnt5PK3vAPnCXqhwu707BYqvNPZw3k+CE4IHjt
OuKwd0nMn3BOWV5RG0XwOE51uv01UK7VgYRr79FRnGc1sobPnFkvdn3quezIz+jQ
FszRV5N/DBztu2Lo/BIfQorqtL8CZOkOpVxWUIQ9C/sSYQRUOlBVw72ux0fo06B8
bW65aOtIGKSy3xt051p+ucsN8VjtnBGOkmwmwTm+V0ciuw/2lnpYA5inbmYv8sJw
4Tgky23kQ5KhDrnc6Rwlr30f25pBGGjYQOYgoo+nqa45Q/IJHbM=
=ZCLa
-----END PGP SIGNATURE-----

--=-slxDZJH3ACqxoxO71nxj--


