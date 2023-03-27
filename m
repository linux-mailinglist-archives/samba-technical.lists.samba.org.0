Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 823826CA41D
	for <lists+samba-technical@lfdr.de>; Mon, 27 Mar 2023 14:30:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=0tdg9ixqUfG4EHu2VFVvUVRreygvw54m86h7D1b9nII=; b=KL2/zaXv2TTd6KzXsPXLsm+K/G
	208sJc1cACA1xwDgU2jeZnDKT8QCu0cvbRfhO6ty1wwQzd3gk4rR8A1LUI/PFeav+vO0QyR89i42O
	i797kk701rxPgspn4UZdMgfdiSJe1aWMQDydC++e82H+Hl1g64Es7DZhdFAdRBbrFWZkTFBUnqAht
	YyZv1a3lSM654wEbF4tgGdJQ6+sOAti0aMiL7G9yzXHw5t7k4ezGUN7spyB4v0drbkCPlwEbwVVLa
	ZZ+6p5R6n2EqImM4saMP1g1DvsCwjMzwcGHseqz7Zwa+YhzEXB0pyjRVx4VHZufkaFi1vS1skvvIU
	fmaXdvag==;
Received: from ip6-localhost ([::1]:65206 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pglz4-004cUS-IV; Mon, 27 Mar 2023 12:29:58 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:47506) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1pglyv-004cTu-J3; Mon, 27 Mar 2023 12:29:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=To:From:Date:Message-ID:CC;
 bh=0tdg9ixqUfG4EHu2VFVvUVRreygvw54m86h7D1b9nII=; b=BctLwfHh7Tfxc88J3cell8oAzr
 xsxnxuTXGuvu8rLw00ywI3AGTHY1kbIkrOf9ppbM/UFfTzeuNtinYFZHed5EZAFm3JULJKChqHax/
 pYPodJqnxOIlGd0GZBsvNf8t97XWnxdb4SkajixfbvyfPO0uPNsB27w5lQ2U52G9PyV8xqUV2nP9+
 eEhqEwlloOBsmntKSGN0oaas1uPXUMkbO8mxewFan54mJMqxWasctt1AVl+aWiWrGbT/RnskUH+ED
 cSD/UvNMP3qNsfQl6JYy9K70JdqUn00zvvM9MdonbikvHTnYLsqjmyZT//0L7J7ybwvEHKb9hizLQ
 t7hjFO91CsRWZzNv/omjRgmTM77P6oS/odS77tZqwZXwxs6ssoANnXZ66+Z8cFptcs798I4y6/SXO
 SFdJxqT3HEbGtF1MhBn5N/XNZfi6WE+NF8Q+x3BjUnwfyxx1NhfUvVpn2sNjxKw+88hQlAwImC2Cw
 7X2QEv2WTD0cALMac1fhqrPA;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1pglyr-005eMf-Jp; Mon, 27 Mar 2023 12:29:45 +0000
Message-ID: <049e77cb-5862-a8cc-0954-7eef43234bb0@samba.org>
Date: Mon, 27 Mar 2023 14:29:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Content-Language: en-US
To: sambalist <samba@lists.samba.org>,
 Ralph Boehme via samba-technical <samba-technical@lists.samba.org>
Subject: SambaXP '23
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------AImRdjJQCvwbX1KbODaCSR71"
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
--------------AImRdjJQCvwbX1KbODaCSR71
Content-Type: multipart/mixed; boundary="------------lRxafSlAlFpYyizKjNe5H2ji";
 protected-headers="v1"
From: Ralph Boehme <slow@samba.org>
To: sambalist <samba@lists.samba.org>,
 Ralph Boehme via samba-technical <samba-technical@lists.samba.org>
Message-ID: <049e77cb-5862-a8cc-0954-7eef43234bb0@samba.org>
Subject: SambaXP '23

--------------lRxafSlAlFpYyizKjNe5H2ji
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgYWxsIQ0KDQpUaGUgMjJuZCBJbnRlcm5hdGlvbmFsIFVzZXIgYW5kIERldmVsb3BlciBD
b25mZXJlbmNlIHNhbWJhWFAgd2lsbCB0YWtlIA0KcGxhY2UgZnJvbSA5dGggLSAxMXRoIG9m
IE1heSAyMDIwIGluIEfDtnR0aW5nZW4sIEdlcm1hbnkuDQoNCmh0dHBzOi8vc2FtYmF4cC5v
cmcvDQoNCk5ldyBmb3IgdGhpcyB5ZWFyJ3MgZXZlbnQ6IHRoZSBNaWNyb3NvZnQgSW50ZXJv
cGVyYWJpbGl0eSBUcmFjayBvbiBkYXkgMi4NCg0KTG9va2luZyBmb3J3YXJkIHRvIG1lZXQg
eW91IHRoZXJlIQ0KLXNsb3cNCg0KLS0gDQpSYWxwaCBCb2VobWUsIFNhbWJhIFRlYW0gICAg
ICAgICAgICAgICAgIGh0dHBzOi8vc2FtYmEub3JnLw0KU2VyTmV0IFNhbWJhIFRlYW0gTGVh
ZCAgICAgIGh0dHBzOi8vc2VybmV0LmRlL2VuL3RlYW0tc2FtYmENCg0K

--------------lRxafSlAlFpYyizKjNe5H2ji--

--------------AImRdjJQCvwbX1KbODaCSR71
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEE+uLGCIokJSBRxVnkqh6bcSY5nkYFAmQhjDkFAwAAAAAACgkQqh6bcSY5nkZI
tA//cdAuLAw64tSepzT3FHamJMPYbJjfi7Mis/3x1cGcoaymDVtN+kzaopSgAbLjDnalFuXPs0PE
unQlcwDPyYWzQY8DGBErvald0tQwLrx3R+qp8bgSMWZx2a5igg5jGyASjrguAe8hKC/GLCmiwzYw
pXJVNZm+vsR+2fwrMIfD9X3P1gzZXe9MT8yl1MM3PlWaupJoFEiKAkY44eCq04NVJ+2AoLAP49i5
kK1oY0O5PChE2TCP2WUjCRCPporw31WLI/9QUuVIh4FAZvId1hpcxyCfNvbz+sIP5xOMj4SePjEO
gDpi4FhLqsiuPtFxAkWz3l1Pv23eCq9QGf+3F4cRdm5E1imB0xyA55V8BBb2ygi4OsXbJJ2I8JMj
vuHWd9QwNRcJCm+/8g1sSQCpatzFxEl5Dq3vuUPS8jlkH8c3OqTA9EX6vmK90h5R6Mqu6xIXn4Uz
SBZK9syVYq2xipPfEIf3RVPJfFzMtLCl8hYsWEGRa9qN6mh2cx8V/Edg5rqXY5YzpVFG9fhLRGSt
pZoKcLwNiM3NCwvOhcwQU/D4vGVcvggkFxRoSsoivog2ingXsUis0/18qXW2TX6HfmQvmecP/os8
sQ/0Sw1gKMEzjGJhY1blpnjUrm1pqyQo+yDdI/TSVY1jaw5PP7My2ir1uYd5mCzAc6wCvuEKEKGD
9UI=
=cmQO
-----END PGP SIGNATURE-----

--------------AImRdjJQCvwbX1KbODaCSR71--

