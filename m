Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 14BBD262B55
	for <lists+samba-technical@lfdr.de>; Wed,  9 Sep 2020 11:09:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=s0x7sVL/R0GPdzuCxZJ5+KW+bkUeA0jBNW7esTQW4SY=; b=GLNxEcx1Ooil9d04pzmZCHjOWS
	8l8/XeQNHe0Sz0WEAq4hAKaB6yNuF40E3lfWh/lXnMMLe5Gcqz2LRr1wdxFuJ9/ZKc8fygD3nU7vM
	XCpnfcN1iSILPcwSubzvZpVru4wr1XEiCpFofF4cWfDVGbmxOEdRzArxvM0GRv1GmWBgA/3wqA/c3
	w3jlU2272jH0YNEN4Q1/bjKXcP8oJNWkvkKZSurtwyCYjZAsLp8gBqMft0uADj5HpxhjCqLQWJtEX
	CxeRTKKQmeCQU3q2VJMnB4NupK0rg8I5HbBJ1S/7PbuTQXwDCIw/ALM0u5NTI6fc6CL2xktXwItHO
	vJ/ESkLA==;
Received: from localhost ([::1]:21754 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kFw5o-004kvL-8U; Wed, 09 Sep 2020 09:08:40 +0000
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:14730) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1kFw5j-004kvE-2H
 for samba-technical@lists.samba.org; Wed, 09 Sep 2020 09:08:37 +0000
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0897WtcQ061476; Wed, 9 Sep 2020 04:31:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : reply-to : to : cc : date : content-type : mime-version; s=pp1;
 bh=s0x7sVL/R0GPdzuCxZJ5+KW+bkUeA0jBNW7esTQW4SY=;
 b=P1+RK4Wh+KeL4ukCmhFEDFci8MmWdVEOdUie18QwKzd0VGEUGGg0P081z+C5wQ2CrCFy
 IxB5b3l9ROYKXE8MxwHDN2uoKOKiq9QW513SA3UcRe1LN+dW0V+yxnvscgkFjqtk/5+y
 4Fy8dT4O2zHk4yGPbgXJd3WEcPasczqMb7aliRYzWlrDq9IXZE9zSm12KC/yS2LMaHyO
 MHicDOwubt6h6ltHTF7i4gMXmefIb0sxNTKMpQS1SWnSCFygc7gd6aEfSbbDpUfH/G8g
 ejhukA2LCmvk0H6uorwjfF08eUPKMj2gn0Ea3F+zLwCyJIP6F7TP+vrDfsZKTfMor8bh gw== 
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 33es8svss4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 09 Sep 2020 04:31:08 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0898RixG021015;
 Wed, 9 Sep 2020 08:31:06 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma03ams.nl.ibm.com with ESMTP id 33c2a849gc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 09 Sep 2020 08:31:06 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 0898V4bD62325030
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 9 Sep 2020 08:31:04 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 37AE2A4053;
 Wed,  9 Sep 2020 08:31:04 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 12472A404D;
 Wed,  9 Sep 2020 08:31:04 +0000 (GMT)
Received: from swen-L2 (unknown [9.171.92.223])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed,  9 Sep 2020 08:31:04 +0000 (GMT)
Message-ID: <743e565210335844200b618c1c2bad4c9c0c09a9.camel@linux.ibm.com>
Subject: ... winbindd_ldap
To: Jeremy Allison <jra@samba.org>
Date: Wed, 09 Sep 2020 10:30:59 +0200
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-5yIqbw1Fsxr0tDG6mtjo"
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
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


--=-5yIqbw1Fsxr0tDG6mtjo
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jeremy,

seeing that you're back from vacation, I was wondering if you can still
remember MR 1351. :-)

Are there any news on that one ?

Cheers Swen

--=-5yIqbw1Fsxr0tDG6mtjo
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEErGbWt5PHCTgy2J0tug2knLYPYasFAl9YksMACgkQug2knLYP
YauAYQ//Xq9/AF6PQAyIPFr67DcYxgs52cPX8tibW9HwN4tHJYfW+PGZ3K1HIN5N
o/JTdJzV7PEJqJSJFMuudWjgGBplcw9A5IyT8G6PY4FY0jXxOJOjJwehaxZx8PKo
V3wm23QMj6ye7FsQ5GOC84NP4IhMaciK/WktN00fHTFhafWRJvUuwkTI/K70h4ei
L6f1sM/Y+LDf5kPz8kdKwZ5ofhhLONKCOxoQg4w2ktNsAdDyJ8W7leLz7l6VhHDI
iD3I6c1za4SyFYxP3p032oHefk+BKOV9j31TqamMzM8sDsOlREdJp9PYuaqgdtzP
2T6p6s4xpL8eOxs0yOHIlLFb6eyw+hKyTTd8oxfdlR50k65nM3KuQaVYDDBFS9IS
jKMrlLfMggU8iEwvjWusaoPFG2auLg7huT9PA4nnv9lVV5CdDw7tMqWkD0hfa9Ld
rs40oapWwKUaZYutP/JCc4Ae7qA8wYtI5wKJefGJR5r2Z5Eqd0QhjzQpcPo43aAd
1sDbTAT3BjgWDbEWnLh69CUPbrPXfyKOw7D+RR34NrWRyktKKJ0/7skfde1CaJy/
K4HHT9qLrYzZS8MRPDuo3XUXM0C3G4RAPAVmZ9cf912JPQaV1E2MFje7QgI/MYfT
Ai3ri5hMWuhRK+oPmtJ2R5ME/SCPfvIv5IYKv15RtFqjAQlgnCw=
=F2b7
-----END PGP SIGNATURE-----

--=-5yIqbw1Fsxr0tDG6mtjo--


