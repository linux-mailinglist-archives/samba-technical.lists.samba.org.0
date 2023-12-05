Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id AE3A5804FAE
	for <lists+samba-technical@lfdr.de>; Tue,  5 Dec 2023 11:02:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=2Jn15/k5vJP8pi0QTnlKuZQ4xKsocWVvfj3sw3t0KbY=; b=N2Wyyc9v+wtjMeb0CfkyjsdHY2
	wAbEQlLuMeT40WF3KGkwsWpXWmnUuD6hJiV4kxViW7FOPJq2yO5vTrYi+WD3UnyGUsezJXjXZIYfN
	rA8C9lp9YbpZA+Ujrnry8xPap7rE3NaleqfTq3G3zcXsjVfiz7b30wTi3yOKGlCXPXzxaCQxTL6Fg
	ZRdUYeWuIzRIfJ3g+2Nhajcy7zYZYp8sf28fVxNi0zBFh2yVsGkchmKQ2ZAh8bOTc9vkFBpaT2GLL
	0Xymey1QarqD90QCQqcgT4LDArTltMkxyBKNNUHESYQhQedY959btkXZJAgNWYAvSpv5kpb/20yjt
	ocwRrJ3w==;
Received: from ip6-localhost ([::1]:56206 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1rASEz-004H6m-C0; Tue, 05 Dec 2023 10:01:21 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:57342) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1rASEu-004H6W-7N
 for samba-technical@lists.samba.org; Tue, 05 Dec 2023 10:01:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=2Jn15/k5vJP8pi0QTnlKuZQ4xKsocWVvfj3sw3t0KbY=; b=1nDj4GCC0pmA7hg9rzWW8WHRAX
 kQWLaoA0rUx/5lqWhjZuHslqTGNeIFSKTWXWeodZvI7tIHecggHBxIVoJ99y182yJyhjPzl0IkC2f
 +alcGxQRGa9qt4M2vAY374GOvO1PlYNhjpKZC6l5tCXqYvBFtK86yirmcgDmk6vQ/HfhnDc9vNHGw
 IApypVwzmtwLHjFoQxb3evblerUcx8FwTfFoHzpbYyjIgO4GQ04Z/UWlfppsU0IQqlMwIuT+5KUpL
 suTTqlpNvRRsaB1W18m4QVcq/tngHVBM38DJK865dzdSjIWTfUUlH/19sbUrfd9oXFC2FMXXhIiyN
 5rf75de1Ih5VtHvxwvcfelWb886vOUx5KUt+1wNU6fBt1YfDxWsVMqMusKwN3YpZb+Ts9g7DXe3IO
 gijcCnAMr4S6MfnHpprE4pUUmysZt24iRzAWChL9HD+z8FPMV3Z4DTLAE+vcYj/GTzWlCpsAnLeav
 cs+G5ATyTULotmZhdXHPpdpD;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rASEp-0020K0-2h; Tue, 05 Dec 2023 10:01:12 +0000
Message-ID: <e20433c2-82e8-41e0-aa29-279dd64996fc@samba.org>
Date: Tue, 5 Dec 2023 11:01:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Name string of SMB2_CREATE_ALLOCATION_SIZE is AlSi or AISi ?
Content-Language: en-US, de-DE
To: Namjae Jeon <linkinjeon@kernel.org>, CIFS <linux-cifs@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>,
 Interoperability Documentation Help <dochelp@microsoft.com>
References: <CAKYAXd9-61f1cjXMrovSEdio8fuTSbegfde4FZ9m1DAAS+CxRg@mail.gmail.com>
In-Reply-To: <CAKYAXd9-61f1cjXMrovSEdio8fuTSbegfde4FZ9m1DAAS+CxRg@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------0Tcmi1keqLPVSI8orUTJCmbG"
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
--------------0Tcmi1keqLPVSI8orUTJCmbG
Content-Type: multipart/mixed; boundary="------------YViavzEWVlXIsEGAMA5oh6wH";
 protected-headers="v1"
From: Ralph Boehme <slow@samba.org>
To: Namjae Jeon <linkinjeon@kernel.org>, CIFS <linux-cifs@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>,
 Interoperability Documentation Help <dochelp@microsoft.com>
Message-ID: <e20433c2-82e8-41e0-aa29-279dd64996fc@samba.org>
Subject: Re: Name string of SMB2_CREATE_ALLOCATION_SIZE is AlSi or AISi ?
References: <CAKYAXd9-61f1cjXMrovSEdio8fuTSbegfde4FZ9m1DAAS+CxRg@mail.gmail.com>
In-Reply-To: <CAKYAXd9-61f1cjXMrovSEdio8fuTSbegfde4FZ9m1DAAS+CxRg@mail.gmail.com>

--------------YViavzEWVlXIsEGAMA5oh6wH
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTIvNS8yMyAwODo0OCwgTmFtamFlIEplb24gdmlhIHNhbWJhLXRlY2huaWNhbCB3cm90
ZToNCj4gSSBmb3VuZCB0aGF0IG5hbWUgc3RyaW5ncyBvZiBTTUIyX0NSRUFURV9BTExPQ0FU
SU9OX1NJWkUgYXJlIGRpZmZlcmVudA0KPiBiZXR3ZWVuIHNhbWJhIGFuZCBjaWZzL2tzbWJk
IGxpa2UgdGhlIGZvbGxvd2luZy4gSW4gdGhlIE1TLVNNQjINCj4gc3BlY2lmaWNhdGlvbiwg
dGhlIG5hbWUgb2YgU01CMl9DUkVBVEVfQUxMT0NBVElPTl9TSVpFIGlzIGRlZmluZWQgYXMN
Cj4gQUlTaS4NCj4gSXMgaXQgYSB0eXBvIGluIHRoZSBzcGVjaWZpY2F0aW9uIG9yIGlzIHNh
bWJhIGRlZmluaW5nIGl0IGluY29ycmVjdGx5Pw0KPiANCj4gc2FtYmEtNC4xOS4yL2xpYmNs
aS9zbWIvc21iMl9jb25zdGFudHMuaCA6DQo+ICNkZWZpbmUgU01CMl9DUkVBVEVfVEFHX0FM
U0kgIkFsU2kiDQo+IA0KPiAvZnMvc21iL2NvbW1vbi9zbWIycGR1LmggOg0KPiAjZGVmaW5l
IFNNQjJfQ1JFQVRFX0FMTE9DQVRJT05fU0laRSAgICAgICAgICAgICAiQUlTaSINCg0KbG9v
a3MgbGlrZSBhIGJ1ZyBpbiBNUy1TTUIyOiB0aGV5IGhhdmUgdGhlIHZhbHVlIGFzIDB4NDE2
YzUzNjksIHdoaWNoIGlzIA0KIkFsU2kiLCB3aXRoIGFuICJsIiBsaWtlIGluICJsImFrZS4N
Cg0KQWRkaW5nIGRvY2hlbHAgdG8gY2MuDQoNCkBkb2NoZWxwOiBsb29rcyBsaWtlIHlvdSBo
YXZlIGEgc21hbGwgYnVnIGluIE1TLVNNQjIuIDopDQoNCi1zbG93DQo=

--------------YViavzEWVlXIsEGAMA5oh6wH--

--------------0Tcmi1keqLPVSI8orUTJCmbG
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEE+uLGCIokJSBRxVnkqh6bcSY5nkYFAmVu9OcFAwAAAAAACgkQqh6bcSY5nkaZ
Tg/8Ds0JqAU0mHbt+Ad3o6axSBHX8zIzOav48aTvwzviwIsn4qcjWRZ9Rb6cLBjaHBQzphzjrN+g
geEmJ7LruDi3L3crIlrV6f5jlKikvePih0W8Q+JW/7hjcQLc+fk0Xw/lmjk1OP6ifmq1NJNuByLh
4e0/rsxjhvjl/jqOeFop5Ap+DLqh7Dxjf8EP7JYvVOq7/T3g6Hkg5ZTi9GAFEGzUd/Op3GAlsnwG
Dg5hD92tkXGH+WVDghd0vrZxNe5TG3fpf434WsoffustKAjUj2Gi4uSWX3tLQcEuxh93hYgpslj7
H3BLzniMXx0tJrD0sTdaE70249+hPkZnaKNzrG7oVRItFR/9ZByTHRfrtij2zAgzhSZewj9PfetR
J4GpR8NOa04CtcTI+rPlOaCbc7QQYNfU0vPFornd48z8DdQR87Q6dAmeUxlOjKZv/rrR+7c+w0dF
BF+jKe0JicBBglNZl2jKdZqg0kOrL6MdxscmaxKLoDV/ZHgUmfN/Kn5lSxruIBxypmVKeiOvrwvp
zyZO4rOe+wpLIhn4/tTBCD5KyinCCx6XFuXeGUyiCaAvVxs/scbSatUfVhjnWdFxyeh47a2XUtEI
XojzbMttoYmjWn0RgsixaVxkIH7Kyy3tud0zWSJDnRYHInTQRT4TxOxDr+F9RHrTw12Akm/heRD9
/dY=
=zTcv
-----END PGP SIGNATURE-----

--------------0Tcmi1keqLPVSI8orUTJCmbG--

