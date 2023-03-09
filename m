Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E3C2F6B2062
	for <lists+samba-technical@lfdr.de>; Thu,  9 Mar 2023 10:43:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=VatjR15OQ4OMrXAV0ph4HhtaRBm7BYSVHAK2zJUi4Ps=; b=xKqyZKL595gf2IIr76wIpFhmrZ
	LRNbmR6vt0bjVT1DPjA+3YtvKcP2e46z5DhqRNB23UP8f1g2OY3ACcTIHakWtCUKQ3UINbiNc5Aq/
	9HAAUBhZ8ffMcIvs1i15BquiFZWteu4xhd6AWpOw2nR3mfyy/s3yYkATCxSraUyqwfbGITMW6DA9x
	YIMm8mLFh35kud6ZajEJUhrJw/r1Umb2N7fLtphCIxAcp6dVQHO9xNINmh5EOmqsGj5lT+JOK4LI2
	SV2pCHV1/gXB2G88iwgBvMxTP60x2tA7bRuYf7eIJYczinCnFgaR2/ZPiPiwiocHQ9vwW4gni/CF4
	0nXnUImg==;
Received: from ip6-localhost ([::1]:61890 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1paCnw-000eC2-A0; Thu, 09 Mar 2023 09:43:20 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:14872) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1paCnr-000eBt-B6
 for samba-technical@lists.samba.org; Thu, 09 Mar 2023 09:43:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=VatjR15OQ4OMrXAV0ph4HhtaRBm7BYSVHAK2zJUi4Ps=; b=NM/cREU1znINh7qOfa/4o8i0CC
 uZTg5BVJPZ+2Zu1lmzWu+i0XLtNmwV2LohdR1W70gihpB3hECIwXcVkboGd3e1dF21EtQEZkoqtXd
 +tn5A8t9X7ZVsrdO6UcMnHWZSQ2eKcO/IVDe80ghkwqgYNVuAsxae1iJ6aXWbDA9kwm1DuKCuZTi+
 d3JL+uu3IRvqoY+4H8M5G778TSqy7CIgURpkOK9now8Gsn5tOwGCTBb0b3inRIxn31wk0+mOhOKUS
 YL2GJBboc1nWx24BbA+sw1uMy3IsCH66HludpTt268t+Fqe6SFk02dKx+c5SA+uCaJMbNDI4b6QLH
 ffnhaCDjOUrRvMbBeVo1xwrLil+oiIoDoNhQqXHLtZZKqrBba1j/ulYrReaT9Oc3AoA5ca5B63POM
 GtcvHmnaHIN2JaotDYwemBky+97Hja5MnDH/WDrmqWGmXtK/0vABEtKZfm8RQEu/O1/bu6UVW1+8+
 fuVdI2BcYYgMWKgI0pKoh5ua;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1paCnq-001ilH-FX; Thu, 09 Mar 2023 09:43:14 +0000
Message-ID: <8ec91f82-d52c-99ed-7a12-40f168c1c8a9@samba.org>
Date: Thu, 9 Mar 2023 10:43:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: Ceph RADOS linearizable?
Content-Language: en-US
To: David Disseldorp <ddiss@samba.org>,
 Ralph Boehme via samba-technical <samba-technical@lists.samba.org>
References: <7bc0c282-e9e6-ab70-6dca-227bb9802ef3@samba.org>
 <20230308184741.4e9f2b2b@echidna.fritz.box>
 <2aac41be-f84b-9595-231a-6c3536e4cbf5@samba.org>
 <20230308213830.4a349610@echidna.fritz.box>
In-Reply-To: <20230308213830.4a349610@echidna.fritz.box>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------0VAfd8aBTTUZySSwbjEPh3VV"
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
--------------0VAfd8aBTTUZySSwbjEPh3VV
Content-Type: multipart/mixed; boundary="------------9KoPmZ8HSt0l5WecgNifvxSt";
 protected-headers="v1"
From: Ralph Boehme <slow@samba.org>
To: David Disseldorp <ddiss@samba.org>,
 Ralph Boehme via samba-technical <samba-technical@lists.samba.org>
Message-ID: <8ec91f82-d52c-99ed-7a12-40f168c1c8a9@samba.org>
Subject: Re: Ceph RADOS linearizable?
References: <7bc0c282-e9e6-ab70-6dca-227bb9802ef3@samba.org>
 <20230308184741.4e9f2b2b@echidna.fritz.box>
 <2aac41be-f84b-9595-231a-6c3536e4cbf5@samba.org>
 <20230308213830.4a349610@echidna.fritz.box>
In-Reply-To: <20230308213830.4a349610@echidna.fritz.box>

--------------9KoPmZ8HSt0l5WecgNifvxSt
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgRGF2aWQsDQoNCk9uIDMvOC8yMyAyMTozOCwgRGF2aWQgRGlzc2VsZG9ycCB3cm90ZToN
Cj4gSSB0aGluayBpdCdzIGVhc2llciB0byBleHByZXNzIHRoaXMgYXMgYSBwcm90b2NvbCBz
ZXF1ZW5jZSBkaWFncmFtLiBBcyBJDQo+IHVuZGVyc3RhbmQgdGhpbmdzLCBDZXBoIG9tYXAg
d2lsbCBwcm92aWRlIHN1Y2ggZ3VhcmFudGVlcyBmb3IgT1NEDQo+IGFja25vd2xlZGdlZCBy
ZXF1ZXN0cywgYXNzdW1pbmcgcGVyZmVjdCB0aW1lIHN5bmNocm9uaXNhdGlvbiBiZXR3ZWVu
DQo+IGNsaWVudCBjbG9ja3MgZS5nLg0KPiANCj4gdCAgQ2xpZW50ICAgICAgICAgQ2xpZW50
ICAgICAgICAgICAgICAgcHJpbWFyeSAgICAgICAgICAgICByZXBsaWNhDQo+IC4gICAgMSAg
ICAgICAgICAgICAgIDIgICAgICAgICAgICAgICAgICAgT1NEICAgICAgICAgICAgICAgIE9T
RHMNCj4gLiAgICB8ICAgICAgICAgICAgICAgfCAgICAgICAgICAgICAgICAgICAgfCAgICAg
ICAgICAgICAgICAgIHwNCj4gMSAgICB8PnNldF9vbWFwKEE9WCktLS0tLT4tLS0tLS0tLS0t
LS0tLS0+fCAgICAgICAgICAgICAgICAgIHwNCj4gLiAgICB8ICAgICAgICAgICAgICAgfCAg
ICAgICAgICAgICAgICAgICAgfCAgIHNldF9vbWFwKEE9WCkgIHwNCj4gLiAgICB8ICAgICAg
ICAgICAgICAgfCAgICAgICAgICAgICAgICAgICAgfD4tLS0tLS0tLT4tLS0tLS0tPnwNCj4g
LiAgICB8ICAgICAgICAgICAgICAgfCAgICAgICAgICAgICAgICAgICAgfCAgICAgICAgICAg
ICAgICAgIHwNCj4gLiAgICB8ICAgICAgICAgICAgICAgfCAgICAgICAgICAgICAgICAgICAg
fDwtLS1hY2stLTwtLS0tLS0tPHwNCj4gLiAgICB8ICAgICAgICAgICAgICAgfCAgICAgICAg
ICAgICAgICAgICAgfCAgICAgICAgICAgICAgICAgIHwNCj4gLiAgICB8PC0tLWFjay0tLS0t
LS0tLS0tLTwtLS0tLS0tLS0tLS0tLS08fCAgICAgICAgICAgICAgICAgIHwNCj4gLiAgICB8
ICAgICAgICAgICAgICAgfCAgICAgICAgICAgICAgICAgICAgfCAgICAgICAgICAgICAgICAg
IHwNCj4gMiAgICB8ICAgICAgICAgICAgICAgfD5nZXRfb21hcChBKS0tLS0tLS0+fCAgICAg
ICAgICAgICAgICAgIHwNCj4gLiAgICB8ICAgICAgICAgICAgICAgfCAgICAgICAgICAgICAg
ICAgICAgfCAgICAgICAgICAgICAgICAgIHwNCj4gLiAgICB8ICAgICAgICAgICAgICAgfDwt
YWNrKEE9WCktLS0tLS0tLS08fCAgICAgICAgICAgICAgICAgIHwNCj4gLiAgICB8ICAgICAg
ICAgICAgICAgfCAgICAgICAgICAgICAgICAgICAgfCAgICAgICAgICAgICAgICAgIHwNCj4g
DQo+IElJVUMsIGlmIENsaWVudCAyIGFib3ZlIHdlcmUgdG8gc2VuZCBpdHMgcmVxdWVzdCBi
ZWZvcmUgQ2xpZW50IDENCj4gcmVjZWl2ZWQgdGhlIHNldF9vbWFwIGFja25vd2xlZGdlbWVu
dCwgdGhlbiB0aGUgZ2V0X29tYXAgcmVzcG9uc2Ugd291bGQNCj4gZWl0aGVyIGJlIEE9WCAq
b3IqIHRoZSBlYXJsaWVyIHZhbHVlIG9mIEEsIGFsdGhvdWdoIG5vdGhpbmcgaW4gYmV0d2Vl
bi4NCg0KdGhhbmtzISBZZXMsIHRoaXMgaXMgaG93IHJlcGxpY2F0aW9uIGxvb2tzIGxpa2Ug
aW4gc3lzdGVtcyB0aGF0IHVzZXMgDQpyZXBsaWNhdGlvbiBzeXN0ZW0gd2l0aCBhIHN0cm9u
ZyBsZWFkZXIuIDopDQoNClRoZSBwcm9ibGVtIGlzIG5vdCB0aGF0IEkgd291bGRuJ3QgdW5k
ZXJzdGFuZCBob3cgZGlzdHJpYnV0ZWQgZGF0YWJhc2VzIA0KYW5kIHJlbGF0ZWQgZGlzdHJp
YnV0ZWQgY29uc2Vuc3VzIGFsZ29yaXRobXMgd29yaywgSSB3YXMgYmFzaWNhbGx5IGp1c3Qg
DQp3b25kZXJpbmcgd2h5IGl0J3Mgbm90IGRvY3VtZW50ZWQgd2hpY2ggY29uc2lzdGVuY3kg
aXMgcHJvdmlkZWQgdXNpbmcgDQpsaWJyYWRvcyBhcyBrL3Ygc3RvcmUuIEdpdmVuIHRoZSBw
cm9saWZlcmF0aW9uIG9mIGRpc3RyaWJ1dGVkIGRhdGFiYXNlcyANCnRoZXNlIGRheXMgd2hp
Y2ggcHJvdmlkZWQgZGlmZmVyZW50IGNvbnNpc3RlbmN5IGxldmVscywgSSdkIGxvdmUgdG8g
c2VlIA0KcHJvZHVjdHMgY2xlYXJseSBkb2N1bWVudCB3aGF0IHlvdSBjYW4gZXhwZWN0LiBT
byBJIGd1ZXNzIEkgc2hvdWxkIGhhdmUgDQpyZWFsbHkgYnJvdWdodCB0aGlzIHVwIG9uIGNl
cGgtZGV2ZWwgYW5kIG5vdCBoZXJlLCBhcyBJJ20gYmFya2luZyB1cCB0aGUgDQp3cm9uZyB0
cmVlLiA6KSkpDQoNCkRpZ2dpbmcgc29tZSBtb3JlIEkgZm91bmQgDQpodHRwczovL3JlcG9z
aXRvcmlvLWFiZXJ0by51cC5wdC9iaXRzdHJlYW0vMTAyMTYvMTM5NTYzLzIvNTI5MTgxLnBk
ZiANCndoaWNoIHN0YXRlcyB0aGF0IFJBRE9TIHVzZXMgTXVsdGkgUGF4b3MsIHdoaWNoIGlt
cGxpZXMgTGluZWFyaXphYmlsaXR5Lg0KDQpCdXQgdGhpcyBvbmUgaGVyZSBzdGlsbCBtYWtl
cyBtZSBuZXJ2b3VzIA0KaHR0cHM6Ly90cmFja2VyLmNlcGguY29tL2lzc3Vlcy81MDcxOS4g
SGVyZSB0aGUgY2xpZW50IHN1ZGRlbmx5IHNlZXMgYW4gDQpvbGQgdmFsdWUsIHNvbWV0aGlu
ZyB5b3UnZCBleHBlY3QgZnJvbSBhIER5bmFtbyBzdHlsZSBFdmVudHVhbCANCkNvbnNpc3Rl
bmN5IGRhdGFiYXNlIChDYXNzYW5kcmEsIFNjeWxsYSwgWXVnYWJ5dGUsIC4uLiksIGJ1dCBu
b3QgZnJvbSBhIA0KbGluZWFyaXphYmxlIG9uZS4NCg0KVGhhbmtzIQ0KLXNsb3cNCg0KLS0g
DQpSYWxwaCBCb2VobWUsIFNhbWJhIFRlYW0gICAgICAgICAgICAgICAgIGh0dHBzOi8vc2Ft
YmEub3JnLw0KU2VyTmV0IFNhbWJhIFRlYW0gTGVhZCAgICAgIGh0dHBzOi8vc2VybmV0LmRl
L2VuL3RlYW0tc2FtYmENCg==

--------------9KoPmZ8HSt0l5WecgNifvxSt--

--------------0VAfd8aBTTUZySSwbjEPh3VV
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEE+uLGCIokJSBRxVnkqh6bcSY5nkYFAmQJqjEFAwAAAAAACgkQqh6bcSY5nkYD
Lg//acWDpfvWkGxKtlsCiP3xvAAk2XB2cwOPYiGrRm4vOmAyRFM7Jw4CStMjHZCVEWuKzBkBtGZ+
36kAxL8hW1xnNAY8nGRtMwKt7QsPesnyGVsN002FTGeW+m4BxuaOoOmA6QDUHMmqKIgOjISFuwVs
uA6Je9L7yTWCj7FPeYtE+IMgZ+imk0hxI76QVoBwl8t96WaN3lpiH/oFS8oEIKbWOyc1LlPdRMhH
sNm9igkmdFwT++ty26iu5HZLtAiN1mTE6sEESv/ug6wdqorVWO6BnVAcB5lzB88DQLAv7w9c3JMS
4o0JAcQ6OkGU7zBTEZmb8GHtEId8DKWvHtRl7WAa8wrfVqNXd3j6tKzU6WeT85GkD+4YJhC4K9rJ
4DuZjKwhOMnzc3nrt6Ha1p3bdGuV9mcMPtCcL8iDcdt9Vx2lGr74h7+S3ifL9ZFDtwqPiFGJ3jFX
gT65OKWMEPQrP/KLx+8gzhecOrolqHlILS0DrHh9Qh5XqX3gkE4RubFBBk6eoQTmMTkJljUiPl/D
tB/hrR2m/dchyCkkFsPrL22Oj9TDEgcCT30/FFIbhjEX8llSzLLCqWkMOPR9sIGDjhs9WDNQkRqf
11G5J2lfdE+25JY/wVq9/8tQatxBQ1PBvgvWkQdVwdDRlQanZb4UipFm+4/HNQyi0zkogGSFHsjV
Eb0=
=SFUT
-----END PGP SIGNATURE-----

--------------0VAfd8aBTTUZySSwbjEPh3VV--

