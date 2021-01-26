Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 7689030472F
	for <lists+samba-technical@lfdr.de>; Tue, 26 Jan 2021 19:56:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=oosl0vm7RvhK+S520CgL2UBBXee3QOltK3b2cLb7F9Y=; b=TTHyG5q5BLmIdj55yW8vnbELpa
	VrLBeZ2LYa2BhS1hSJhh/AYq3PUWN4vhoKZmeLHxqRdSwqDsH/rej2pTu+x7f6uI71vbA/QBZAgG2
	tjCn+9jCx0s9h6d3v2CrFhiYRRpyAGl5XunvVXVUorLfMOnDEVe7K0K85dzEeo/XWgS3Vyes29FLS
	REGY30Ulap26CROvhYGMROmHzRltF90bMKddFTC9mzPJ/dKfDwMCOv97uv5KXq4TC0RrQWiLzXWgp
	R1Ow3YXSisqA9McRautF5j4hK9cJ++TUx0yUE0AG1/wlu/KSK21WWa/ApypzM8Z6t6zlqQNC/Vqx+
	9heVtQoQ==;
Received: from ip6-localhost ([::1]:45934 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1l4TUv-007HO0-EV; Tue, 26 Jan 2021 18:55:29 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:41988) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1l4TUq-007HNt-G2
 for samba-technical@lists.samba.org; Tue, 26 Jan 2021 18:55:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=oosl0vm7RvhK+S520CgL2UBBXee3QOltK3b2cLb7F9Y=; b=jJh5CPBGJbmgZ8ZSAEFRDITD0r
 NAtmXh7tVuqje99EHX3GrcDAjbSd7E9qVWHpIYBO+Dfnujf2FRXkSRcR7j01mfdIHHkJcv4Kfw+DD
 GP4DnhKY84hVIUjy0hLtDeEgh83Bdxw0nTKu7fzVd97Jyggp3sf6L1Chs233g1+JFeId/fi3HCwsw
 vOjUFjcyvmC2XuD2w5KH+YbT9srJZJWpDo7vpgsEI6BzQysEZ4ifrPxZO/NHFAaWX9JbrGP8aXxEE
 qHGrLxBudRkMZDgfWxj/j+qzIMfn22sGyvgpTAGy7sWChYasH9NYRJ6KpJqxZ4EJA012lSSBugso5
 gvHoxrAN3NrPKbImd6BKdcqE7qO2mQalo0qvJH7c/l6ugRSTOVIjhtNNFAkN88KvjXZXm6vmUVBV9
 0qtvFaN7GnFyrnthICV2WG0lBcsWDf306lhfMPARtmwVk1COw7CZt+afuX3C61ICADfK7ZxPBL+VM
 u9CWl4ZFEZHKYZCA2NcIMUBC;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1l4TUp-0006Tw-Hh; Tue, 26 Jan 2021 18:55:23 +0000
Subject: Re: Not sure how this slipped through
To: "Christopher O Cowan - Christopher.O.Cowan@ibm.com"
 <Christopher.O.Cowan@ibm.com>,
 "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
References: <B93A6FFE-2D85-4503-BB15-D2AFC270028C@ibm.com>
Message-ID: <33ae935b-06a9-302f-9d4f-cf12e0837fe0@samba.org>
Date: Tue, 26 Jan 2021 19:55:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <B93A6FFE-2D85-4503-BB15-D2AFC270028C@ibm.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="ayxswo6g5tePlo3X1bRQZXe3PuJWipF3v"
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
From: Ralph Boehme via samba-technical <samba-technical@lists.samba.org>
Reply-To: Ralph Boehme <slow@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--ayxswo6g5tePlo3X1bRQZXe3PuJWipF3v
Content-Type: multipart/mixed; boundary="AiOgh38VfALlOTP2Xp95FtUOfJrCck6Zq";
 protected-headers="v1"
From: Ralph Boehme <slow@samba.org>
To: "Christopher O Cowan - Christopher.O.Cowan@ibm.com"
 <Christopher.O.Cowan@ibm.com>,
 "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
Message-ID: <33ae935b-06a9-302f-9d4f-cf12e0837fe0@samba.org>
Subject: Re: Not sure how this slipped through
References: <B93A6FFE-2D85-4503-BB15-D2AFC270028C@ibm.com>
In-Reply-To: <B93A6FFE-2D85-4503-BB15-D2AFC270028C@ibm.com>

--AiOgh38VfALlOTP2Xp95FtUOfJrCck6Zq
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Am 1/26/21 um 7:15 PM schrieb Christopher O Cowan -=20
Christopher.O.Cowan--- via samba-technical:
> My builds on AIX have been failing because of this obvious error.  Can =
someone please apply it?

we also noticed this today. I'm currently adding this and another AIX=20
build problem.

> Just wondering, are AIX builds still part of the CI/CD system?

no. Not for ages.

Sorry!
-slow

--=20
Ralph Boehme, Samba Team                https://samba.org/
Samba Developer, SerNet GmbH   https://sernet.de/en/samba/
GPG-Fingerprint   FAE2C6088A24252051C559E4AA1E9B7126399E46


--AiOgh38VfALlOTP2Xp95FtUOfJrCck6Zq--

--ayxswo6g5tePlo3X1bRQZXe3PuJWipF3v
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEE+uLGCIokJSBRxVnkqh6bcSY5nkYFAmAQZZgFAwAAAAAACgkQqh6bcSY5nkYk
Mw//QwoG5UE7prX4EElvGJ468tNjB1MKr4CKrjmzagQMfNNVtxTR26aWO2YcD2ZaqWh12BHJ3nfZ
5oSdDfk49tiW9Dz7Y5EcWz75IyWWwydWZAK+VrlGaHIEb99Db1/1zZAr0OBCJ5pW8N/dSrn8DG7N
MUfuaTbqiKb/KAhrcKH3BAotkxSTd7j9E6WbAFJvnyHXoPFUsNeGaNC5P5Wkcb0RGiHjyz5umv8s
t5f3Ol458Tn0Cf6uKamC/wj3zx1e830CB1suADywOPOhWQkuCnaKKGtMYmPfWACqAyUroLX2BBNC
O+Ay7mO8GgAtTllZ4NAkKLEB2RIYhiZOMXf9Db5Nujpfqmit5Vq2pMYqn19p6Fgnln+LwOqe1Bni
3PuLUqAPuiIkneDTuSIGRm6lcNTAZI1a+zpwixsBDsos3OAqdMkKX/n6G94aJGKZN0s7Z3obUtar
18WfNRc/MRrxuXmNv+L62zvatLeN3qD6RPl5GEqKoyJSN2zYrx8QC04IWbaQvYem3BU7Jvk2ftjG
44t0d+E+WDfs9QCKaGNriMjHgqC64RFCCdlhDuho1qzaMrqZJmdKViBSFOubISaOV81ATb2fAfd0
puU29BBxsnrD9r8c2bmhiHPO0IABZem+Y17r01iBTXcOSsPtw82tLryO43dWjK51dIcWdmGLsMi8
IxY=
=WNEN
-----END PGP SIGNATURE-----

--ayxswo6g5tePlo3X1bRQZXe3PuJWipF3v--

