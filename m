Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 7194298CDFA
	for <lists+samba-technical@lfdr.de>; Wed,  2 Oct 2024 09:45:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=5LELXkW0C9Fmcl77BcJ1Ngqlc1VgztzkMxiP97f5cZg=; b=NbRD5d5K+Du7SaPxDXyGailf6e
	tTpXpAFVeMmovGZ2q6j0Vk/D3h3B7h4OjGidWF95tNkKeStd7KI9ISR7dPL/biNmwyaN3NBWqEptD
	XspS+Io4ESNo0gjv2nI0ZfzVdLdm4hbvBmYl66H3SaYy04fDOmdJIi9jK7s/1g4yQL/1+kqSk0jem
	gna3YzAOGtw5QAdBc7vLpeJzrFDHwh2HezOy/MQEqRE+dE8etrnMcVIlumbY+kVaQzOoTUwq47iy1
	MPPxLulp3YyrPpDfOMxArxz4Dw1U9NEY6ETnJ4pSoN3XBVespQE9efuxKyFIxQ6DyhZNsdTlv2zb1
	30t3++pQ==;
Received: from ip6-localhost ([::1]:60716 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1svu3Q-002pr8-GY; Wed, 02 Oct 2024 07:45:48 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:44648) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1svu3M-002pr1-6B
 for samba-technical@lists.samba.org; Wed, 02 Oct 2024 07:45:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:Cc:To:Date:Message-ID;
 bh=5LELXkW0C9Fmcl77BcJ1Ngqlc1VgztzkMxiP97f5cZg=; b=PDjz37ptrKlxmtmtU54bBJTHjn
 kN4EJnwnkzQ7Gj/pHWd6Les6Fvs+gIF+iP7D/7pGgfPSuVWM2ehe0LsAtxVUANBWzEMZ3RZxKHi8a
 /tv0GkdIuU7O1l+b5QiRe+WZv4IJIHcMDfpR983frSC+e8A3XjCnquz90ZhGeBu2ys28535u9wN7P
 Bw8dQ1Nlwh3QGIMMsWJKIwgJYvKSKrIMHugSsmGHqB8Q/CpkGc86p1XrOuZFor2EX2Un0TQDQTkpa
 ktGY7Io6QvrI3KFCQel83VXuH/x0bD4mms2aOk/5LTxAysypxqinF/nlTzDR7TxS0rWAfZZ6N6Whv
 4wrtkWISoyHLT1pwLBZCcQaWALmh7Ur6sTa8Mpxv+TSimoCpUtcOT5bj0FAGqpvsbitl6n/r9M6rM
 rcfT5Q0H/I5CAobUZ4fvN8yR4ybLmbHcVMFWj45BM2e1mavwFuzwjcLnrvoqJbZzPdnvBgk2+BMOW
 6Vhi4gcla7eorWQIrMUocFxN;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1svu3L-0032C2-2G; Wed, 02 Oct 2024 07:45:43 +0000
Message-ID: <682404ea-15d8-4b18-be2a-b2e50abbb932@samba.org>
Date: Wed, 2 Oct 2024 09:45:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Current Samba master incorrectly returns STATUS_INVALID_HANDLE on
 copy_chunk
To: Steve French <smfrench@gmail.com>
References: <CAH2r5mt7cE8Cc2K5K8nRM2RL=R-rwuAR9h6SSyEqtApuochtuQ@mail.gmail.com>
 <e12d7594-02df-4cbb-80fc-276d907afd90@samba.org>
 <CAH2r5mv0onp+Zx8yhKAsu4wXZ-D2XMmARgZhPDaJx4DWQ-We4Q@mail.gmail.com>
Content-Language: en-US, de-DE
In-Reply-To: <CAH2r5mv0onp+Zx8yhKAsu4wXZ-D2XMmARgZhPDaJx4DWQ-We4Q@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------lJZ9LjPFtr7N0CAkwQ8ZRKd9"
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
Cc: CIFS <linux-cifs@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------lJZ9LjPFtr7N0CAkwQ8ZRKd9
Content-Type: multipart/mixed; boundary="------------wGIZTKe02ZiDA7OOMKBRaOqw";
 protected-headers="v1"
From: Ralph Boehme <slow@samba.org>
To: Steve French <smfrench@gmail.com>
Cc: samba-technical <samba-technical@lists.samba.org>,
 CIFS <linux-cifs@vger.kernel.org>
Message-ID: <682404ea-15d8-4b18-be2a-b2e50abbb932@samba.org>
Subject: Re: Current Samba master incorrectly returns STATUS_INVALID_HANDLE on
 copy_chunk
References: <CAH2r5mt7cE8Cc2K5K8nRM2RL=R-rwuAR9h6SSyEqtApuochtuQ@mail.gmail.com>
 <e12d7594-02df-4cbb-80fc-276d907afd90@samba.org>
 <CAH2r5mv0onp+Zx8yhKAsu4wXZ-D2XMmARgZhPDaJx4DWQ-We4Q@mail.gmail.com>
In-Reply-To: <CAH2r5mv0onp+Zx8yhKAsu4wXZ-D2XMmARgZhPDaJx4DWQ-We4Q@mail.gmail.com>

--------------wGIZTKe02ZiDA7OOMKBRaOqw
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTAvMi8yNCA2OjExIEFNLCBTdGV2ZSBGcmVuY2ggd3JvdGU6DQo+IEhlcmUgaXMgYXQg
bGVhc3QgdGhlIGxvZy5zbWJkIG9mIHRoZToNCj4gICAgIC4vc3JjL2Nsb25lciAvbW50Mi90
ZXN0ZmlsZXNyYyAvbW50Mi9jbG9uZS1vZi10ZXN0ZmlsZXNyYzIgICh3aGljaA0KPiByZXR1
cm5lZCAiQmFkIGZpbGUgZGVzY3JpcHRvciIgb24gdGhlIGNsb25lIGlvY3RsKQ0KPiBTZWUg
bGluZSA0NzM5DQoNCnNhbWUgb24gdGhlIHNlcnZlciwgd2UncmUgZ2V0dGluZyBhbiBFQkFE
RiBmcm9tIHRoZSBmaWxlc3lzdGVtL2tlcm5lbDoNCg0KWzIwMjQvMTAvMDEgMjM6MDQ6MjAu
NDQ5MTM2LCAxMCwgcGlkPTMzMjE5LCBlZmZlY3RpdmUoMTAxNywgMTAxNyksIA0KcmVhbCgx
MDE3LCAwKSwgY2xhc3M9dmZzXSANCi4uLy4uL3NvdXJjZTMvbW9kdWxlcy92ZnNfZGVmYXVs
dC5jOjI0MTQodmZzd3JhcF9vZmZsb2FkX2Zhc3RfY29weSkNCiAgIHZmc3dyYXBfb2ZmbG9h
ZF9mYXN0X2NvcHk6IGNvcHlfZmlsZV9yYW5nZSBzcmMgW3Rlc3RmaWxlc3JjXTpbMF0gZHN0
IA0KW2Nsb25lLW9mLXRlc3RmaWxlc3JjMl06WzBdIG4gWzEwNDg1NzZdIGZhaWxlZDogQmFk
IGZpbGUgZGVzY3JpcHRvcg0KDQpJIGd1ZXNzIG9ubHkgYW4gc3RyYWNlIHdpbGwgdGVsbCB1
cyB3aGF0J3Mgd3Jvbmcgd2l0aCB0aGUgZmRzLg0KDQotc2xvdw0K

--------------wGIZTKe02ZiDA7OOMKBRaOqw--

--------------lJZ9LjPFtr7N0CAkwQ8ZRKd9
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEE+uLGCIokJSBRxVnkqh6bcSY5nkYFAmb8+icFAwAAAAAACgkQqh6bcSY5nkZt
+g/8DYT5Xkvo9yY9ZnYROht+MhZel7hrggcf8WHD6KmG2TRHZCS9AYa1x6NhNHiFOSyDetdkBkLv
WRP7KHhsJy6J4uEQLH9X03iHG1G+EcGmhRUoj5yQhlzawrNs4t8gYddLllCnNw0FK9cZMeGLuxcw
C/FVE8KUD8tB7fQomPZvFj/ng6xHDjG/2MsMJkb8y5U406/nU98mzPdGXoOXyAUQKP2INzWylFC8
PfeCkxOY7Jzr84tSI77I8p6KAPlfrwNpxa/VpuxMVnwNQNiz97pVpQmvWuo18d2+DdkmjaVVMaPb
+CyEMlQflIDgz/RG/bCIuGWAiuggSxcS8yQw7sfnm8Y5YMlam4ZnPJjB47kR2dJZlYHfNk+riZoS
wyo1BkKwC6jKfD0yumMxMWtqmccTYFbLKDBXbGr1KASXONW9GTPz01+DFYs5b4mktugnmuDZrE8R
jcVhdnXpTpHqAQ2ZpXWzy971xh52gUnBV4v2vvwqlA7Okm+E4HpkUZTyzmcP0qV/e+P5ia04w8nX
BJ+rfZkztdA/ZSFCNWAIX6xlYeZkxdaiXqo2qN1IPwV2VGW2j7HcNfuGZSC21jE2Us7wT0T9To3t
ZT5kUV9kEOcX2lCkdsjSL3FDrcWHJJ1htwJhDFz8vCxoZ0FHK1yLBOsJxLd6Jo6yMQJpBNaLgYKK
BKI=
=yiIu
-----END PGP SIGNATURE-----

--------------lJZ9LjPFtr7N0CAkwQ8ZRKd9--

