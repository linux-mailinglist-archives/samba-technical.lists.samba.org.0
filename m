Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 867B6899F3E
	for <lists+samba-technical@lfdr.de>; Fri,  5 Apr 2024 16:15:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=XVQwkJE+265C5SurUQtJmakEMPHdaRhT9dD6OmAzesA=; b=LUk17l/vpExIguHDqUBAFybuuv
	7Aokw6ZXsvw4Of7Ye9s8HlSnFC8F0LV7qe9VFA1ezhB/YL98P2pRxbL974LhFkQX6onCU7aPHi8a7
	k8wl/GidZhq5TgSkw2d+tdOX1x1UFS7ioYihWwF/ztaU/5tEFxU/D/rAn/XP6B3ZELCDjNFqXivGJ
	WxCb5zkAvyCziuj1kr8I8R15CH2De57mFdKR/hXXdaSzIOBTNFqkRZl/a35u2b7jFjFy++R4aQIKq
	jy5r9609Lgqge/5jGL4CnTAqEaKD2N6bIdpxB+I56wEsAVdl8bzjfNSknwpMXLUAMNutTM98w3K7l
	y12/5Acw==;
Received: from ip6-localhost ([::1]:52322 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1rskLm-0040rx-NL; Fri, 05 Apr 2024 14:15:26 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:55922) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rskLi-0040rq-5d
 for samba-technical@lists.samba.org; Fri, 05 Apr 2024 14:15:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:Cc:To:Date:Message-ID;
 bh=XVQwkJE+265C5SurUQtJmakEMPHdaRhT9dD6OmAzesA=; b=RJ8eEiXvW5b4hsi5bdCEeYXnYK
 tKJF3rq3riKZE0zeApvKwj6Z8F7Ekqv9X6IKjPMdCitACVwUnvs2WXOhQtHUXj3zRG4Zo9Cbvmx1i
 tvCWM/C6HtRhOP+zhaXlDWHYOGM+kbWAh5tJ8ydEs3OzR6cbSizVnDDUBsCKo+xuW7WFMTjq3n+Jt
 6lxgWTiPw0+NnpmmlCThILGtC9xl2wW8gk0H6kEJ5YKwZSUlKgEfTiYtshi10vSVGKoJxZA3S60UZ
 +FtzynJglDpKMZxGi6hAqhQ1Wn/f31kLiHfgq2Hw7Zi/5obsQs1ykSN1NZ3kMVGLREqzSpdEY/qmK
 wMKrmKT4K4GY0Nnw0xSx2lYgc6I/qjxYQj8siuXGppRXZdlAy0dHqIbQnPH7SQnUTMiQT4IjoWZx0
 bTBo7hcmwRFhjRxXfXidnIdSAuCNuJNUf7k9LbSsFUCL6w1rwu8ugjC/nUJNO2rktRWwXiQgY/6ex
 jT/9+J4/DIiB1ZvOyLK80W3d;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rskLh-004vSl-0p; Fri, 05 Apr 2024 14:15:21 +0000
Message-ID: <3afc2c32-4a00-4632-87d3-787e8b667b74@samba.org>
Date: Fri, 5 Apr 2024 16:15:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Simplify copy-reflink code
To: David Disseldorp <ddiss@samba.org>
References: <2c5e4e5d-4115-49b5-9af5-a488cfc601a8@samba.org>
 <20240402202621.2c234f13@echidna>
 <e5c49135-4fa4-40ec-bdbd-6446e1d156cb@samba.org>
 <20240404125840.230c5d67@echidna>
 <b5f914db-41b9-4e76-89a8-fb5dc45e28f8@samba.org>
 <20240405162145.40ac3bc4@echidna>
 <b0967fbb-0805-4021-96cf-0735c3c1b5c1@samba.org>
 <20240405215455.1099794a@echidna>
Content-Language: en-US, de-DE
In-Reply-To: <20240405215455.1099794a@echidna>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------O23mYtApOIfezOihdD54SVUL"
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
Cc: Ralph Boehme via samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------O23mYtApOIfezOihdD54SVUL
Content-Type: multipart/mixed; boundary="------------XHfML9HB5UuT0SEdihCqemK3";
 protected-headers="v1"
From: Ralph Boehme <slow@samba.org>
To: David Disseldorp <ddiss@samba.org>
Cc: Ralph Boehme via samba-technical <samba-technical@lists.samba.org>
Message-ID: <3afc2c32-4a00-4632-87d3-787e8b667b74@samba.org>
Subject: Re: Simplify copy-reflink code
References: <2c5e4e5d-4115-49b5-9af5-a488cfc601a8@samba.org>
 <20240402202621.2c234f13@echidna>
 <e5c49135-4fa4-40ec-bdbd-6446e1d156cb@samba.org>
 <20240404125840.230c5d67@echidna>
 <b5f914db-41b9-4e76-89a8-fb5dc45e28f8@samba.org>
 <20240405162145.40ac3bc4@echidna>
 <b0967fbb-0805-4021-96cf-0735c3c1b5c1@samba.org>
 <20240405215455.1099794a@echidna>
In-Reply-To: <20240405215455.1099794a@echidna>

--------------XHfML9HB5UuT0SEdihCqemK3
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gNC81LzI0IDEyOjU0LCBEYXZpZCBEaXNzZWxkb3JwIHdyb3RlOg0KPiBJbnRlcmVzdGlu
ZywgdGhhbmtzISBXaGF0IGFib3V0IHVuYWxpZ25lZCBsZW5ndGhzIHdoZW4gaXQgY292ZXJz
IHRoZSBlbmQNCj4gb2YgYSBmaWxlPw0KDQpJbiBteSB0ZXN0aW5nIHdpdGggYnRyZnMgaXQg
c2VlbXMgYnRyZnMgYWxsb3dzIHRoaXMgaWYgaXQgY292ZXJzIHRoZSANCipjb21wbGV0ZSog
bGFzdCBjaHVuayBvZiB0aGUgZmlsZSwgZWcgZnJvbSBhbiBzdHJhY2Ugb2YgYSBjb3B5IGEg
ZmlsZSBvZiANCjQxNjAgYnl0ZXM6DQoNCmlvY3RsKDMzLCBGSUNMT05FUkFOR0UsIHtzcmNf
ZmQ9MzIsIHNyY19vZmZzZXQ9NDA5Niwgc3JjX2xlbmd0aD02NCwgDQpkZXN0X29mZnNldD00
MDk2fSkgPSAwDQoNCkJvdGggb2Zmc2V0cyBhcmUgYWxpZ25lZCBhbmQgc3JjX29mZnNldCAr
IHNyY19sZW5ndGggaXMgdGhlIGZpbGUgc2l6ZSwgDQpzbyBpdCB3b3Jrcy4NCg0KQnV0IGFj
Y29yZGluZyB0byB0aGUgY3VzdG9tZXIgdGhpcyBtYXkgbm90IGJlIHRoZSBjYXNlIHdpdGgg
WkZTLCBzdGlsbCANCmRpZ2dpbmcuLi4NCg0KVGhhbmtzIQ0KLXNsb3cNCg==

--------------XHfML9HB5UuT0SEdihCqemK3--

--------------O23mYtApOIfezOihdD54SVUL
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF4BAABCAAjFiEE+uLGCIokJSBRxVnkqh6bcSY5nkYFAmYQB3gFAwAAAAAACgkQqh6bcSY5nkaK
7A/4jGOKFzG3LNryYDekFOcBm3a2sT01279KwzIHd/klJKJXmYd1M8BKA5XZhTDfMrfakeGh07Ei
IsErYWnAFlejh7i3cXlCDb1aEYubD1G8TIMLfwPopvXHroDl+okNkVxdemOHCLd3hJxR/ND8Cg+j
RDsrhx+RbbY6DLdg6vfPbB5JcL69qTYwHPwftKlKYmuI3q5PaXwsPUrTQSlT7z6yEFhKztvObdOr
Kxk3QYsfTBUV+lcy1KQmr5wXGuycVK+kQy6nSwF3EJazVw8wphkMHH781O/AkPsgJF7TKce5FsmX
pqzBOdgZA7jRF72RjFQYtbVR1H8UsBQTS+5J8a3OjbcqHJBSPmlsbTFGtwLo+dGhbE6h563QjX0T
sgEfySzJ6tcFnNU3+DtGvJW5ExFSH8zKW2FIhaeUrXtsYnNYdYW/e3jvkl1b7Mo/YfmuIY3xoiNX
ypCa0i6g4gZ0OPGy3v+bWz9Rqfea/TQ99GCeYADnwvjbpHnLZQZHch0W8Hs35bHexFLVA8z6rqb9
S8cmzA1Q3FBXWhyTUzGDxsWDA248+0J4PbAHQEX5ydzPg2nZgC2u0bVFo4FL1qX9oUoWkJvTMMOQ
BBsHIsVQG0twzJwsDvsOny9QBxkg2aRFK8xhaFOTFFB7iSo0qxyBSwGRhWq8TsmHTf4RSut4r85m
Iw==
=8UTr
-----END PGP SIGNATURE-----

--------------O23mYtApOIfezOihdD54SVUL--

