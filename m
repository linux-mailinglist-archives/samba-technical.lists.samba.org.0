Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 33DE95F7924
	for <lists+samba-technical@lfdr.de>; Fri,  7 Oct 2022 15:41:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=MXGzmY471GeLbEPPyJTNzlt4U1moywYjNiIFAQNaWQg=; b=Ydw5z8P+qIqeTgqTND3OlDNwZo
	aXTB65oAvaKTwKDSHTLUZ+IGkXDtNmqH7fE7szJtJT3R3+X1NfnMpYRn2N4cIh0KCtaQTi3uu1exC
	3DYX7egE7803KTTtMqWgzehNMwD4AotU3iEu06IZ2EGFzg+i+j5HPeDZv+G8mbbhH+UOKOB+/rT4C
	ev2dqGorm/Vd1IY45fSB3rKbgbKGT+uYrZcSax33YugvmThZ7lwqYqZRUz0WYvCoc2zDC63ZWXRDq
	qZqpkAxfKxnvLgdyk6Ozeb9ELyLybVGO9PERkvKQn2DygYwrNlxglFrKnq9TmnlOmrXsUD0OMPZKb
	0j83Dmew==;
Received: from ip6-localhost ([::1]:22888 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ognbf-000XwB-Tn; Fri, 07 Oct 2022 13:41:39 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:26408) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ognbb-000Xw2-2h
 for samba-technical@lists.samba.org; Fri, 07 Oct 2022 13:41:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:Cc:To:Date:Message-ID;
 bh=MXGzmY471GeLbEPPyJTNzlt4U1moywYjNiIFAQNaWQg=; b=h//j0QLTqAFnQZ8wSx5fYOBTJN
 SZEVX85vOJemHHjgUFsQPaBIskgjHCKXqRnUgFvpWSOAysQk6f5zG4LXxyYIW4jejt8G8rMiDzR0D
 PnhANwzRnieKxrI2BRNhG3oYPQI+AKWjYHIDlblW5M1EgEAbSk+qFU477nCWAAXd2aNg9R2lI/3LA
 MYzebVfVRufkwRhBnJAyCp0tRDzyTqFgeoANDf1V11S0M1AJM0BETUQIQYF8STz3UCFYDF0lJtu/C
 3olps56XU+X7my4TfZu5LF/mX9m7QEiou+PLBg5rcLr1HiLiEE9XsRJey30naiw/Mbyia/gZYbA2S
 xoe7StNSe+tMBkinkRcfgpvCTdjW+yUHSKBht/vDCZmbzo+aKvcuBN0fpmhyVv+/0w3RWdVor7l9o
 jT+RCKV/iZFuNbsqTig/nKciM3fCJvZPnUEKTAZ+PPf0u8s9kwabMKenaPnsH1Aktowa4qYuTo8Mc
 037bGj0J9yoV4JhgXN2cyTXl;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1ognbZ-003OII-Vf; Fri, 07 Oct 2022 13:41:34 +0000
Message-ID: <5f314f80-e29a-323b-b349-ed806d5f3bb7@samba.org>
Date: Fri, 7 Oct 2022 15:41:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: vfs_crossrename not working in samba-4.15.*
Content-Language: en-US
To: =?UTF-8?Q?Pavel_Filipensk=c3=bd?= <pfilipensky@samba.org>
References: <8fbdc4c2-09db-3032-38c4-1608aae5e7f9@samba.org>
 <CAB5c7xrru41LZs76Qy9wdT6gXbWkWsEi9oyzKMY_Ux_eqw+LgQ@mail.gmail.com>
 <Yz8WfqhSldLLC7RX@jeremy-acer>
 <a27d14e4-ba5d-901a-60b9-2e2b7c7350ca@samba.org>
In-Reply-To: <a27d14e4-ba5d-901a-60b9-2e2b7c7350ca@samba.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------UtRRx0tpsrlnWvkMCZMA0NRv"
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
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------UtRRx0tpsrlnWvkMCZMA0NRv
Content-Type: multipart/mixed; boundary="------------9HBsFG641AAECs4CDRmy7SYk";
 protected-headers="v1"
From: Ralph Boehme <slow@samba.org>
To: =?UTF-8?Q?Pavel_Filipensk=c3=bd?= <pfilipensky@samba.org>
Cc: samba-technical@lists.samba.org
Message-ID: <5f314f80-e29a-323b-b349-ed806d5f3bb7@samba.org>
Subject: Re: vfs_crossrename not working in samba-4.15.*
References: <8fbdc4c2-09db-3032-38c4-1608aae5e7f9@samba.org>
 <CAB5c7xrru41LZs76Qy9wdT6gXbWkWsEi9oyzKMY_Ux_eqw+LgQ@mail.gmail.com>
 <Yz8WfqhSldLLC7RX@jeremy-acer>
 <a27d14e4-ba5d-901a-60b9-2e2b7c7350ca@samba.org>
In-Reply-To: <a27d14e4-ba5d-901a-60b9-2e2b7c7350ca@samba.org>

--------------9HBsFG641AAECs4CDRmy7SYk
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

X3NoYXJlX21vZGVfZW50cnlfcHJlcGFyZV9sb2NrKCkgaXMgb25seSBpbiBtYXN0ZXIsIHNv
IGhvdyBjb21lcyB5b3UgDQpoYXZlIHRoaXMgaW4gYSBTQlQgZnJvbSA0LjE1Pw0KDQotc2xv
dw0K

--------------9HBsFG641AAECs4CDRmy7SYk--

--------------UtRRx0tpsrlnWvkMCZMA0NRv
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEE+uLGCIokJSBRxVnkqh6bcSY5nkYFAmNALI0FAwAAAAAACgkQqh6bcSY5nkb+
TA//QCN0+G1cJliNsbiU+qq7P/lAeV9OF36AKtjdu5gYlBLQ4QI0/mrUUHxZmPV5mzxKaFrS5O2m
CObmcalxY2PmYEy1tr4clXT2vfY6x3dAu+NHnEOsZh0A63lf6LARPf0fEjD+pUONji+ST69BKAK0
73dv6/ct/V5SyCK8B35wWY0aVcwQUJr8SMBvCVjXKk700qrnm96eR3DBOA648szvQwi/wtLqe0Sw
6ueqtWeShN3TH6GWw05iTDXbv0G3Cyii8BcRXb2c3p8sSGUhHR2Gr7gIx0fKAx/Wp1YZKP2Aqvjq
5H1KF6yXQjiIQ67sjgvcD2vyJcFfcYtlXKPwh7S2ennzm6F5SlhCMPoD5oR1c1zHcP91oTVOSwj6
GGBAyZH8K4lcDEjtH2Ce1nAHopLZRKkWuZ/2AOg8jQxezKMDtnekKYvpvtNLXlYkxGxv3OKXzB2y
1mm6Gn/kc9D/9dPBPJuKeSsm+VSk3lCuKHWD5EX0tC2qODVykI93RbLX/EbmGeRjchgCoc+M/egn
S2tLV9RLl/5VDeAE7meYKWSari778EBXAs5u9+rqqHsl2745h/9Urn0S3DwOn/ccyW3pxZpBjYWk
ET8PVM1y7gE5b/cXV6cqkg5bwnXh/Zm41kgHhmZwakLQS6n9fr6mxd2JwOta7C42fX3vcU/6dgCk
ALw=
=Iyyl
-----END PGP SIGNATURE-----

--------------UtRRx0tpsrlnWvkMCZMA0NRv--

