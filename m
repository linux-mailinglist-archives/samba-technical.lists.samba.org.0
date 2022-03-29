Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 567354EA708
	for <lists+samba-technical@lfdr.de>; Tue, 29 Mar 2022 07:19:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=vubK8Nkefj55Inx9JQ9DxnNUfBs/xPBDp5nMMdI75bw=; b=LOmUqiXdoCsOTIIUAnH3J0GLD+
	XMPNVTf7cAsTsvUCyHssr0nZ5SQCFQKWd7pqbT0A9LI1nfrdmENa6iZZsdExbF4CeH3Rvh9SroMlq
	S1S3Efs7iUyE6gzgW/kUxDVRabRzscKOSjy2VUrFcudGvrCqfmhyrKEfEugxoc0oVFShb8JmvMjlx
	cG3H1ZhRn9e5uxhVyddAwQcrLG0BUPb0mRL5XEaRWaPzTg0DDiw7HSZgiqZKKIA0xwekhCFjSr5Zz
	D1hxN5PzYJuCVgl1jvFavWk/pwFnR3ODO4S/sGtvRiFXZmMCryZdoEEBkJJkDJZ5XSONHIK8TxxoC
	wWQlTS5A==;
Received: from ip6-localhost ([::1]:31222 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nZ4Fp-006EtE-VF; Tue, 29 Mar 2022 05:18:54 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:37986) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nZ4Fl-006Et5-2f
 for samba-technical@lists.samba.org; Tue, 29 Mar 2022 05:18:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=vubK8Nkefj55Inx9JQ9DxnNUfBs/xPBDp5nMMdI75bw=; b=fx9JbPuUuSWaCw7oc1cFDMix1V
 az9Gqv317AVmL25R+O7WcFFvu6ZHGBIHUCu3shmIQJxh4unhKT70+P5O/UMCVaNBTE9ty6Www1Uqb
 OGSBVU1RjyXtJuJSjTmkdrQ73pzFhL435k+SXfqVYrx+8xaFd96OCPYgL8+nJSQA5UqfEsGQiGWfi
 DDae7vlYQXC+uyAuSC0esYtMNcawOGW90+7udhT0Vrbiy3FTIkZz0kX5KiwOHXYn4TxRsk0LdZDyD
 hSwW24QiXLrxGH2CdclBMSUI5oGRzQR8OvL+B+30PqPJW3let5BhT4c0+Ayhs69ek4MKKmjsUngap
 1JiceAXIB3bJn+CrqebyxMOfdi/QPq+oPmLZO2ouH2Qgd6EGtBAnoe3QJAnaNQXz1Bp1+UHGk17Fl
 H4OfVWUPLZK3OM8kGiNDPsRQoBB0AngSHEhh6T1YnWu8LZXFGhKTgR2Hl6yaG9/SnS425VLaGYSdS
 S8/AwGMIcL4plQmO/gkn9i9p;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1nZ4Fi-0047pw-8H; Tue, 29 Mar 2022 05:18:46 +0000
Message-ID: <07fccb86-3895-5ad7-a332-4ad84bb58ab4@samba.org>
Date: Tue, 29 Mar 2022 07:18:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: Are there Python3 libraries for the net commands and etc?
Content-Language: en-US
To: Richard Sharpe <realrichardsharpe@gmail.com>,
 Ralph Boehme via samba-technical <samba-technical@lists.samba.org>
References: <CACyXjPw0iqTm=HE9Neb=J99wZ0+=GRdQ0+13+BAuDvvLvQeWaA@mail.gmail.com>
In-Reply-To: <CACyXjPw0iqTm=HE9Neb=J99wZ0+=GRdQ0+13+BAuDvvLvQeWaA@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------vGxI7auHgzFCBWcB9bCOQiWy"
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
--------------vGxI7auHgzFCBWcB9bCOQiWy
Content-Type: multipart/mixed; boundary="------------1iniGSvwm0Zl02OKPNWdSJvP";
 protected-headers="v1"
From: Ralph Boehme <slow@samba.org>
To: Richard Sharpe <realrichardsharpe@gmail.com>,
 Ralph Boehme via samba-technical <samba-technical@lists.samba.org>
Message-ID: <07fccb86-3895-5ad7-a332-4ad84bb58ab4@samba.org>
Subject: Re: Are there Python3 libraries for the net commands and etc?
References: <CACyXjPw0iqTm=HE9Neb=J99wZ0+=GRdQ0+13+BAuDvvLvQeWaA@mail.gmail.com>
In-Reply-To: <CACyXjPw0iqTm=HE9Neb=J99wZ0+=GRdQ0+13+BAuDvvLvQeWaA@mail.gmail.com>

--------------1iniGSvwm0Zl02OKPNWdSJvP
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgUmljaGFyZA0KDQpPbiAzLzI3LzIyIDE4OjIxLCBSaWNoYXJkIFNoYXJwZSB2aWEgc2Ft
YmEtdGVjaG5pY2FsIHdyb3RlOg0KPiBBIGxvdCBvZiBzeXN0ZW0gbWFuYWdlbWVudCBzY3Jp
cHRzIHRoZXNlIGRheXMgYXJlIGltcGxlbWVudGVkIGluDQo+IFB5dGhvbiBhbmQgSSBhbSBz
aWNrIG9mIHVzaW5nIHBvcGVuIGFuZCBzeXN0ZW0gaW4gcHl0aG9uIHRvIHJ1biBTYW1iYQ0K
PiBjb21tYW5kcyBhbmQgdGhlbiBncnViIHRocm91Z2ggdGhlIG91dHB1dCB0byBmaWd1cmUg
b3V0IHdoYXQgSSBuZWVkLg0KPiANCj4gQXJlIHRoZXJlIGFueSBQeXRob24zIGxpYnJhcmll
cyB0aGF0IHByb3ZpZGUgdGhlIGZ1bmN0aW9uYWxpdHkgb2YgdGhlDQo+IG5ldCBjb21tYW5k
cz8NCg0KaXQgd291bGQgYmUgZ3JlYXQgdG8gaGF2ZSBzdWNoIGJpbmRpbmdzIQ0KDQpBcyBw
b2ludGVkIG91dCBieSBvdGhlcnMsIEp1bGUgaXMgY3VycmVudGx5IHdvcmtpbmcgb24gSlNP
TiBvdXRwdXQgZm9yIA0Kc21ic3RhdHVzLg0KDQpBZGRpbmcgUHl0aG9uIGJpbmRpbmdzIGZv
ciB0aGUgZGVzaXJlZCBmdW5jdGlvbmFsaXR5IHNob3VsZG4ndCBiZSB0aGF0IA0KZGlmZmlj
dWx0LCBsZXQgbWUga25vdyBpZiB5b3UgaGF2ZSBhbnkgcXVlc3Rpb25zIGhvdyB0byB0YWNr
bGUgdGhpcy4NCg0KQ2hlZXJzIQ0KLXNsb3cNCg0KLS0gDQpSYWxwaCBCb2VobWUsIFNhbWJh
IFRlYW0gICAgICAgICAgICAgICAgIGh0dHBzOi8vc2FtYmEub3JnLw0KU2VyTmV0IFNhbWJh
IFRlYW0gTGVhZCAgICAgIGh0dHBzOi8vc2VybmV0LmRlL2VuL3RlYW0tc2FtYmENCg==

--------------1iniGSvwm0Zl02OKPNWdSJvP--

--------------vGxI7auHgzFCBWcB9bCOQiWy
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEE+uLGCIokJSBRxVnkqh6bcSY5nkYFAmJClrQFAwAAAAAACgkQqh6bcSY5nkZR
qQ/9GzgBIxElRlwGtXb3uTiBQXWoYyMkwtvyP9w71JvY5tv9uOI7kfR/SGcINi11r1a4RHbIDPSH
Y2TfchQEVeV06egwGqYhaAWNBBbIBsZ6Kw1c1TotEuaMOfhVyO78HLbXigR7e+EOTW28jJ1P95RH
AwO+yGPB62CmrAzUKOdSlqIXYo0eijXP60q4UNBT280S5gZNNW0nsd6QTuc5w8EITRDbDiN3kGmS
SEoxpeKIvUmq1uZgy5qUuR/MeStlPRjww/4Uw3YnXvZhRLi4Avs+z6CnIJ/sHq+JbiTkMKhXiyqH
vN7uDc1/AwwmIhGTFN2c9Ay640bDApiqBwDS/0A8p8VzUUJ9hm2ehizTzC1PvOvc5wpZhMUan6Yi
VJCZatLBoJOzy1XYVvqmgy8ZRB8WfN1nbwXiPPrGyMjwXHRrNxB7RpHae4vg9423JmeoNM+Nb27p
6HdjQ425wP33NekggH5sxKmVkTGTUv1wvJqaC+XcUXok+4xNkLKn/ppP57Hrb3Hl1iCY3hKFsZJr
xse7I9xkt1eWz6MfgUtTKocZ0YLNqr4ni9uzJqU8uZZIF2Un8PMZ7KrIMC3zN3dHTpq8gy2VVonM
Qdys08i9bEoUvc/Q4XKqee3KSMOpYruLVcZb5sgL2zh3D95XzDnH8tzf6uSadTplQlKKozCm/KjJ
Veg=
=hGjI
-----END PGP SIGNATURE-----

--------------vGxI7auHgzFCBWcB9bCOQiWy--

