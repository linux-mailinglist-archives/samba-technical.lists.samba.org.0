Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 72143178C9D
	for <lists+samba-technical@lfdr.de>; Wed,  4 Mar 2020 09:37:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=/fL6P6jBU5XxWMten2rHfDZIrQBz0dpxQ4h8oPwqoD4=; b=GJf9hmLWjVH2v4g87GfArdjXq5
	9MJUYIclqS/l+nVkYI3QSy6DLC/XGLcq90IsF+aD1lBGo/t1ybOgG9ICNS5rpPGgoA4QsBmraY2Ny
	OzzNHw8jcwdoJSPhyt98325KwG3OY/wATaCWksCsOQkix58kUU7rdsGKNUD25g4Tfw/sHR+RvS5s+
	2nLmMEksU9MRAbm7FI4jqhxsy1zJAAnh/jofRTtl7CtY+GDB5fOazQC8Lnn/Tzo2HEod5+Ce/+pae
	6qHFwZYCTi1Mj4d1bWYJ2qww2FZ+rNkPldhJ/M7Z0lgZsOuPwfqK2hlszPrF19b4eQPh358BlbpI7
	HNjhTSeA==;
Received: from localhost ([::1]:27840 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1j9PWO-00EtNY-Mg; Wed, 04 Mar 2020 08:36:52 +0000
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:19738) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1j9PWK-00EtNR-4M
 for samba-technical@lists.samba.org; Wed, 04 Mar 2020 08:36:50 +0000
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0248FEuK014247
 for <samba-technical@lists.samba.org>; Wed, 4 Mar 2020 03:17:17 -0500
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2yj4q0qx6k-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <samba-technical@lists.samba.org>; Wed, 04 Mar 2020 03:17:17 -0500
Received: from localhost
 by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <samba-technical@lists.samba.org> from <swen@linux.ibm.com>;
 Wed, 4 Mar 2020 08:17:15 -0000
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
 by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 4 Mar 2020 08:17:11 -0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0248HAdc53149896
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 4 Mar 2020 08:17:10 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BD251AE056;
 Wed,  4 Mar 2020 08:17:10 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 94A0CAE04D;
 Wed,  4 Mar 2020 08:17:10 +0000 (GMT)
Received: from sig-9-145-42-220.uk.ibm.com (unknown [9.145.42.220])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed,  4 Mar 2020 08:17:10 +0000 (GMT)
Subject: Push of [s4] possible memleak in torture vfs-fruit
To: samba-technical <samba-technical@lists.samba.org>
Date: Wed, 04 Mar 2020 09:17:00 +0100
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-gTLsyYmX5SzbOm7owBNf"
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
x-cbid: 20030408-4275-0000-0000-000003A83441
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20030408-4276-0000-0000-000038BD3EF0
Message-Id: <cc40aab5b1c862d2a67a6b9ee0e15fad9c8332e1.camel@linux.ibm.com>
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
Cc: ddiss@samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>


--=-gTLsyYmX5SzbOm7owBNf
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Ralph, David

Coudl one of you please push MR 1081
https://gitlab.com/samba-team/samba/-/merge_requests/1081?commit_id=3D83db4=
d6f773060c7b95131846a84cdb2fefc333f

It received the "go" from both of you but somehow didn't get pushed.

Thanks for your support in advance.

Cheers Swen

--=-gTLsyYmX5SzbOm7owBNf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEErGbWt5PHCTgy2J0tug2knLYPYasFAl5fY/wACgkQug2knLYP
Yas6kw/+J7VnsMRIs2X8fC4fhqpodqERJrsbbnyRWfdbkyMHpOV6Ue/r3YCPFYad
POZg/cz7TSSW7gMXaWwR5rVAbtE7vvSzC+5Beb4E9+lwJnrP6W6P8FAw5sUmQl30
XYWYcoh9gOBlOX4Ndhs1L3kYWJALL+Vr9U7mnUuZ6emnn6lmJKKo0/ewVDzUtl7x
F828scSNIJ3+B7Y4KWJRbKbjnN0sPPjcl0R5d3I3TAKHN05uItQYlYwoo0c3Ln8e
wHDLEDBsc8tzhLzxyJIHDuv7l4RsnG4FC+Yi8bF/Cyb/poFXsmf7en1dCsV74vc+
1LfdZtZ5GEShDdlSruFEUy2spwijQWn+T6DF2EpZT3caS5zj88mV9VDAJroNSfxG
ka7qUSA8Z16XuX5ely36S1NXWe3zzkxd1U9Tpf/de/b11HVuwV8/bmuhyXL3DSqH
TQglMxyK8RMhwmOn/4qP+Gta3OGLhPklaN3p97ILYvltYFBIIx7dp0N9YUYun+zg
AUB1r8ZXyV0gLJ4f6rTdGthzU3sY21Y5UMveFJB9mm9G9jBBtUN7hrDC1QKD3X/Z
TiSSCFIiC4dh9+ggPkMTOHle0sgvkXrtUdRNHgEq8HPM/RFu2OZZWpAY5aE0S0Xc
wiU4MLIgwLCwcKQEj7u6qDapZwa0XI1BaSeVDMOMDD0Ikpt6LaM=
=NLDR
-----END PGP SIGNATURE-----

--=-gTLsyYmX5SzbOm7owBNf--


