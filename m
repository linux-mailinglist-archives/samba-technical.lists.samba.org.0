Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E45E6CA639
	for <lists+samba-technical@lfdr.de>; Mon, 27 Mar 2023 15:45:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=zLSMQk0bgs3xtX2yWBbih6I/lLbhS9TU9K6gK9nhS9E=; b=WoozWzLAwd3W5f2Ugg+ySxoYQN
	dJO8DoGbVmPLl1ybULQq2dQjpaTmuZyMJQBwc/pdTYefTxFN5xEB7N+RDW6w0RwhyqPq4R6YGbVc6
	rOxpD9CPK3XMz4HxttZdOSnyFUpHDiTcMi6C7oH6bYvVAEo9umae9tvggAbeEYrpOh1GozJWBo04t
	m7qzHEsjn6ox7w+LHR5h9Lmkb2okrqieT3wG0bt2vDYGWiuzzHUe0cWeBj0zd2kFfVD5S6x/PtTwE
	ybrVuGMRwyRsoVxi7y+6/sN2UuhygbTkfXruIjfxSZw+t7ewP0JH0YuSdXUekGdZPDgMDKTIerxgy
	QXS7kFBQ==;
Received: from ip6-localhost ([::1]:46234 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pgn9s-004dj1-Iz; Mon, 27 Mar 2023 13:45:12 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:60174) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1pgn9m-004dir-0T
 for samba-technical@lists.samba.org; Mon, 27 Mar 2023 13:45:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:Cc:To:Date:Message-ID;
 bh=zLSMQk0bgs3xtX2yWBbih6I/lLbhS9TU9K6gK9nhS9E=; b=GOX4KxlzAJbGOJLpF5pm1IxGYe
 +YCQ9W83L8TNvAV6fssqj8Szb+cDEytDFPwgvmMrLT7Lw2ZkT/AKY0/Gx3++QuRK8zc87asksbIdy
 XYgXPrC5T6mgLlr0WjjnnNLrg8MWAjJsU7zUlPmOxiDluD5c1H9eDNXdHrHG34XIS8jS0X2l241yf
 PTIg8sWv+6AgHRTC6Pzk7bKaXf2OJHf9GpVL4jkmyofW4vB84de9BrrkRct69lcH8aAk3WUKlpDH/
 KCB3VwzeGwM2GAcWqn1WdY83WzFDaXTObsRMpQ9lf9ga09Y2TiXNhfxzJw68bl6IWC+AWEAzob2MB
 jnW/UxEYQ3RhGykYDQk4Ddpa0/esEJeG1lOe5Cq/atNCss4mI5jSfwVhUOlrPf04/9Wl37S+kZ5MU
 UQxFGFFTEboSUEr2XXIEJOQ1glCyB6rBU8xtziLPUIoxoQfkDTD4Gay19ZeeSnvAzp8pxaZUUEM00
 A+h+E6XFNEYFvgdq38EYy2zs;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1pgn9h-005f0q-4C; Mon, 27 Mar 2023 13:45:01 +0000
Message-ID: <83053097-3abf-8fae-58e3-25c233049053@samba.org>
Date: Mon, 27 Mar 2023 15:45:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Content-Language: en-US
To: Andrew Bartlett <abartlet@samba.org>, Stefan Metzmacher <metze@samba.org>
Subject: Joining a Windows DC to a Samba AD Domain
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------NfsHWfc3F5cwLUwyUMADNIuf"
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
Cc: Ralph Boehme via samba-technical <samba-technical@lists.samba.org>,
 =?UTF-8?Q?Bj=c3=b6rn_Jacke?= <bjacke@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------NfsHWfc3F5cwLUwyUMADNIuf
Content-Type: multipart/mixed; boundary="------------M0ly2c6TooYKlrB7Nk0dirKk";
 protected-headers="v1"
From: Ralph Boehme <slow@samba.org>
To: Andrew Bartlett <abartlet@samba.org>, Stefan Metzmacher <metze@samba.org>
Cc: Ralph Boehme via samba-technical <samba-technical@lists.samba.org>,
 =?UTF-8?Q?Bj=c3=b6rn_Jacke?= <bjacke@samba.org>
Message-ID: <83053097-3abf-8fae-58e3-25c233049053@samba.org>
Subject: Joining a Windows DC to a Samba AD Domain

--------------M0ly2c6TooYKlrB7Nk0dirKk
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgZm9sa3MhDQoNCiBGcm9tIGFsbCBJIGtub3cgaXQgaXMgZ2VuZXJhbGx5IG5vdCByZWNv
bW1lbmRlZCB0byBqb2luIFdpbmRvd3MgRENzIHRvIA0KdG8gYSBTYW1iYSBBRCBkb21haW4s
IGlzIGl0Pw0KDQpJJ3ZlIGp1c3QgY2FtZSBhY3Jvc3MgdGhlIGZvbGxvd2luZyB0d28gcGFn
ZXMgb24gb3VyIHdpa2k6DQoNCjxodHRwczovL3dpa2kuc2FtYmEub3JnL2luZGV4LnBocC9K
b2luaW5nX2FfV2luZG93c19TZXJ2ZXJfMjAwOF8vXzIwMDhfUjJfRENfdG9fYV9TYW1iYV9B
RD4NCjxodHRwczovL3dpa2kuc2FtYmEub3JnL2luZGV4LnBocC9Kb2luaW5nX2FfV2luZG93
c19TZXJ2ZXJfMjAxMl8vXzIwMTJfUjJfRENfdG9fYV9TYW1iYV9BRD4NCg0KVG8gYXZvaWQg
Z2l2aW5nIGJhZCBndWlkYW5jZSBJJ3ZlIGFkZGVkIHR3byBwcm9taW5lbnQgd2FybmluZ3Mg
YXQgdGhlIA0KdG9wIG9mIHRoZSBwYWdlcy4gSXMgdGhpcyBzZW5zaWJsZT8gSXMgdGhpcyBj
b3JyZWN0PyBUaG91Z2h0cz8NCg0KVGhhbmtzIQ0KLXNsb3cNCg0KLS0gDQpSYWxwaCBCb2Vo
bWUsIFNhbWJhIFRlYW0gICAgICAgICAgICAgICAgIGh0dHBzOi8vc2FtYmEub3JnLw0KU2Vy
TmV0IFNhbWJhIFRlYW0gTGVhZCAgICAgIGh0dHBzOi8vc2VybmV0LmRlL2VuL3RlYW0tc2Ft
YmENCg==

--------------M0ly2c6TooYKlrB7Nk0dirKk--

--------------NfsHWfc3F5cwLUwyUMADNIuf
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEE+uLGCIokJSBRxVnkqh6bcSY5nkYFAmQhndwFAwAAAAAACgkQqh6bcSY5nkYn
vA//dR5G+xfHT2MHxEeWRBA358RvcAYLywzC5nGWsc85aPQjxH+APWWSKAiD9M9PUQbA899RVSjM
R//i69Z4B4sCNA90l3CzxWrx1qo5A8O8DtU2qEmyjnNCU89N/rqu4P4r04P1nPNIr0S8o7tA7Mo6
dsMd0HOCn1s76fk9fzOhUQJSFynvsD9ZtlN9iXEkXMwqQwC3ldDBHMxathfGbztxea3GyAFO+XLj
4oKvmrPe4uW0rX0xH7SfSKrk2nz+gJMLeJFfjxdV3g7HNev9goS2Vn1B8Ded7GWZy9F5GpEY9Xep
e0BnXTK/4eFgVuUxxYXTI2nkkDk0Ucx9YHiPIf9Jzkvr/hKVwBI46oDj0TtKWeEMtCpKKwSbcm2h
BgmSxnJvn/Dv/z7x+ISyRtlJBWMapfuYAT+RxjwfTjZTxRnb02iSzRkEte8InzX42WRuMK0SaPN0
Pb/qhm8wxBvodvdmQPHCnUXZ3uPZWOt3CfB0kPCVgox0FS6fr6BZXSZd6eaEFSB5J/CW4GJYZq+h
3pOllZ2YOWck/n5jq/hbDCfnK3dSD/JFlj9AHiH3y6N3gxV2FdsLZfYgP0HcKqWTszKCnlRwNC1F
Gs+YqPZ3KX3H1WTkgR18JtF8On5wH7E4utS/GNVAdcl7GBVeKHl/rcxupWDnWj63ww6fpBFvUlzE
9IA=
=s5zZ
-----END PGP SIGNATURE-----

--------------NfsHWfc3F5cwLUwyUMADNIuf--

