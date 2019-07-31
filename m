Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E3DF77BDD2
	for <lists+samba-technical@lfdr.de>; Wed, 31 Jul 2019 11:59:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=51ae1xT5XS6P78JXkdaQOHz95zxhyE82ztIV78ZIM6k=; b=k+3CLvoH7HhcDav4qeotZlwbYn
	QK70Sz+51O+A9nCdDVpDCnn6tGqWzhpHu6zgZZ7xmgZ+gLU7/JDmNDZHI6H6wC5Co4tZxrc/oatai
	FDvOd5DrvZWou5lP3uUc/nHR4E/zv1BNPKnV0aWw+NbsJjGC83+3jSq3/lefTBWQrGbK/GQimUZWy
	k6j7RBb2DlQjEZy1slIk+lZm9qAQrUQumh/MBbO9x8sAm4ms03facZdzkBsdbuV2jSla6WbgIi+aK
	bpDjmaBO0Bhnh2SfqU9IZCnfH06AchLEMog0kOE2kWY79P8rwfG4XomcqlxM1ZbxkRkcQXeSa42R6
	bZJi4zRw==;
Received: from localhost ([::1]:53544 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hslNq-001Daf-0P; Wed, 31 Jul 2019 09:58:58 +0000
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:22786) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hslNl-001DYv-FU
 for samba-technical@lists.samba.org; Wed, 31 Jul 2019 09:58:56 +0000
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6V9wFWG141412
 for <samba-technical@lists.samba.org>; Wed, 31 Jul 2019 05:58:47 -0400
Received: from e06smtp07.uk.ibm.com (e06smtp07.uk.ibm.com [195.75.94.103])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2u37r6b7c0-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <samba-technical@lists.samba.org>; Wed, 31 Jul 2019 05:58:47 -0400
Received: from localhost
 by e06smtp07.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <samba-technical@lists.samba.org> from <swen@linux.ibm.com>;
 Wed, 31 Jul 2019 10:58:45 +0100
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
 by e06smtp07.uk.ibm.com (192.168.101.137) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 31 Jul 2019 10:58:42 +0100
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x6V9wfhA59965472
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <samba-technical@lists.samba.org>; Wed, 31 Jul 2019 09:58:42 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DB8B0A405F
 for <samba-technical@lists.samba.org>; Wed, 31 Jul 2019 09:58:41 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C07DAA405C
 for <samba-technical@lists.samba.org>; Wed, 31 Jul 2019 09:58:41 +0000 (GMT)
Received: from sig-9-145-21-34.uk.ibm.com (unknown [9.145.21.34])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP
 for <samba-technical@lists.samba.org>; Wed, 31 Jul 2019 09:58:41 +0000 (GMT)
Subject: [PATCH] Update samba internal test to pass with ASAN sanitizer enabled
To: samba-technical <samba-technical@lists.samba.org>
Date: Wed, 31 Jul 2019 11:58:36 +0200
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-tK79F5sBdsr8CAS85Ngv"
User-Agent: Evolution 3.30.5 (3.30.5-1.fc29) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
x-cbid: 19073109-0028-0000-0000-00000389967A
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19073109-0029-0000-0000-00002449E6B9
Message-Id: <63aac41699e3c14c946a270e28eb7ea8180294e1.camel@linux.ibm.com>
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
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>


--=-tK79F5sBdsr8CAS85Ngv
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

SAMBA is "prepared" to be build with the ASAN address sanitizer
enabled.
The best way to verify that SAMBA complies is to run SAMBAs own=20
test-suite.

However, if compiled with the ASAN sanitizer enabled the SAMBA internal
tests need some modifications to not trigger a finding themselves.=20

This small patch-set is performing the required changes for the
"local.*" tests.

The updates passed the gitlab-ci tests and a merge request is created
at
https://gitlab.com/samba-team/samba/merge_requests/677

Please review and push if happy.

Thanks for your support in advance.

Cheers Swen

--=-tK79F5sBdsr8CAS85Ngv
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEErGbWt5PHCTgy2J0tug2knLYPYasFAl1BZkwACgkQug2knLYP
YasEHA//aR8lG1oiocK7FH+Ed5jr4+5NkAF8irR7KeN9m44DlP0tHAz2FUGEzy6x
bw1t2Hjpkvgv2bkPyel05DlF60vGHlrbp/XrHQG+5yrRToxBWiIhcRN/xiG9PRhX
agw6Kqw9fOq5oXOir5jAAhqfs1wL8MEILbql/cvHFQ+/GadfGXxJTRKzdm5TS6P8
fM4SHkWIBejQ44HqJ/P5pNhKHwEr8irefHiygu67DDVyofpV3D3cKUmx2X+72R8J
94EdBONd5qQ6xKwoZEJxONNdYpfOWDL8EwBLK4dB7mhFGWf9JnsAOZFwU4Dn8U6K
vJBuxx7F+vxpizIR3njOo6chzoQXb7ftmYY2FD/L7bOAPGisusHdfaNeEYg2iZOD
/zR3U2xjwQpKdwlb7uk8qVPIyb0rERA8D2u3QySnCe/kKyNFq7T30RX8hsBTXhUs
hGum7LbS4YPDp1aSxcMFR/iV9CKeKvVowUv2QcyVCYNicWXNcPew15QphPIiD341
BO4Buo92gwr2U5rjrlI7noySS4E8Sbu56ccIl4QdGJO2AZyIZUd5FMS37C7r+GZb
mTK+r8EPZRVo6kWSBSpKxUgkoixinyA1WNFKiNmLTPtuixoZTcevDTkaB4zd/lnh
CZDQ3uQT1r+hZZWYUAB2ebK4oa9Wh5EQaxMHIDh71ZNYBJCa7WA=
=pgMz
-----END PGP SIGNATURE-----

--=-tK79F5sBdsr8CAS85Ngv--


