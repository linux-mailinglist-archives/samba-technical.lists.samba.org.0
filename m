Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E16D994250
	for <lists+samba-technical@lfdr.de>; Tue,  8 Oct 2024 10:42:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=1cJpLOZtXceCzY67/Sjfj7XQRWHy7K7X/qXClynkKlg=; b=du352/G/aHm9tsAcCq1Psrjn1D
	Tl+Be4P4fHhY4uWm9081L4xKg34X0Oox4XBs6dADP16AV41F5kd5yePnJ4+cdF1kpU6OYLoldt7+v
	//BvG0MYOAtZ2Hi5135VOAHnLdpl1IpBz7iF1CtDiX+3q3LZCvFGhwJUmOa/fXSYFHKcwOg2+5g6O
	8r2caxjdYgFYhhdHyEYbAXe2zFZBZXOiS0KJw7a7PVMsaheubNfFobpfVheZcH5O0VHNSM4LtkaLy
	zbV37gAoJJGjwjw3DZYa0tTm7nr5LQoxhZ5U5ypwj7EVgKrag2WJBtIUn2hNl7OsEEgfV2Fypno9E
	6157/T2Q==;
Received: from ip6-localhost ([::1]:59198 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1sy5n3-003G9L-J7; Tue, 08 Oct 2024 08:41:57 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:40602) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1sy5mz-003G9E-E3
 for samba-technical@lists.samba.org; Tue, 08 Oct 2024 08:41:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:Cc:To:Date:Message-ID;
 bh=1cJpLOZtXceCzY67/Sjfj7XQRWHy7K7X/qXClynkKlg=; b=K4d9EFPOG8SSl3F6pyoOp3nA7N
 xKakiM50kRFJMYxvMBR+PT1NNueSgvzUOtOk76SpVBP4ayFx0nLwReaN98mT/48mqMvXlwXgxdG3R
 tiMSZ53di+AEt1TilQZHYU5mN0QvGTD2NkjlrIzsqcUKBS97vVPNG3AvH6qgsiIPBHM/wIhyMn3sF
 cY7bVIo8I+N8Avv5tvDAzzxgjlOCUvmzS95m2yRzf8/Dyft0STk3WRKNzTansKWNjiUpiI4Lkp7RP
 BHNmg4CCmPpE64B5BWuSUnA+p3xH74WDhIwB5mI/wpEr4aOPo7X7NVM9l6XQCAOPWj4heDdX1knLG
 3Z21R6vErml3Y4JNFGFq4s+JWLnqxv1zeQpZdjcBgKOTktS7aIIZ+84Q59D+GcPgZ+a6IHWnJbno3
 nA98+ficbkosjNgvhFKiAT0PC9+R7wz1NK5mkGeUgzN/DqyX7ssDDEBUBrdSKPnaipJWm5GWOK51u
 /ONtIa4i+k6akve51SbRE+N8;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1sy5my-003tBq-2E; Tue, 08 Oct 2024 08:41:52 +0000
Message-ID: <77aff6ef-291d-4840-82e2-b02646949541@samba.org>
Date: Tue, 8 Oct 2024 10:41:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Current Samba master incorrectly returns STATUS_INVALID_HANDLE on
 copy_chunk
To: Steve French <smfrench@gmail.com>
References: <CAH2r5mt7cE8Cc2K5K8nRM2RL=R-rwuAR9h6SSyEqtApuochtuQ@mail.gmail.com>
 <e12d7594-02df-4cbb-80fc-276d907afd90@samba.org>
 <CAH2r5muqSmNy+3SViFKNJ=5Sm61u8r9ej9Wy8JLUDeC2XHwccA@mail.gmail.com>
Content-Language: en-US, de-DE
In-Reply-To: <CAH2r5muqSmNy+3SViFKNJ=5Sm61u8r9ej9Wy8JLUDeC2XHwccA@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------AAewAaz9WoQ05Gu2dUoMs4LY"
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
--------------AAewAaz9WoQ05Gu2dUoMs4LY
Content-Type: multipart/mixed; boundary="------------MiKPVQzyrkFujj1P9MCxv0zG";
 protected-headers="v1"
From: Ralph Boehme <slow@samba.org>
To: Steve French <smfrench@gmail.com>
Cc: samba-technical <samba-technical@lists.samba.org>,
 CIFS <linux-cifs@vger.kernel.org>
Message-ID: <77aff6ef-291d-4840-82e2-b02646949541@samba.org>
Subject: Re: Current Samba master incorrectly returns STATUS_INVALID_HANDLE on
 copy_chunk
References: <CAH2r5mt7cE8Cc2K5K8nRM2RL=R-rwuAR9h6SSyEqtApuochtuQ@mail.gmail.com>
 <e12d7594-02df-4cbb-80fc-276d907afd90@samba.org>
 <CAH2r5muqSmNy+3SViFKNJ=5Sm61u8r9ej9Wy8JLUDeC2XHwccA@mail.gmail.com>
In-Reply-To: <CAH2r5muqSmNy+3SViFKNJ=5Sm61u8r9ej9Wy8JLUDeC2XHwccA@mail.gmail.com>

--------------MiKPVQzyrkFujj1P9MCxv0zG
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTAvOC8yNCA2OjU1IEFNLCBTdGV2ZSBGcmVuY2ggd3JvdGU6DQo+IEhlcmUgYXJlIHRo
ZSBsb2dzIGZyb20gc2ltcGxlIGV4cGVyaW1lbnQgKG1vdW50ZWQgd2l0aCAibGludXgiKSB0
bw0KPiBjdXJyZW50IFNhbWJhIG1hc3Rlci4gSXQgZ2V0cyBOVF9TVEFUVVNfSU5WQUxJRF9I
QU5ETEUgKGJ1dCB3b3JrcyB3aXRoDQo+IGRlZmF1bHQgbW91bnQgLSBpZSBub3QgbW91bnRp
bmcgd2l0aCAibGludXgiIChvciBlcXVpdmFsZW50ICJwb3NpeCIpDQo+IA0KPiByZXBybyBp
cyBzaW1wbGU6DQo+IA0KPiB4ZnN0ZXN0cy1kZXYvc3JjIyAuL2Nsb25lciAvbW50Mi90ZXN0
ZmlsZXNyYw0KPiAvbW50Mi9jbG9uZS1vZi10ZXN0ZmlsZXNyYy1tb3VudGVkLXdpdGgtbGlu
dXgNCg0KLi4uDQoyMzo0OTo1NC44MTcxNDMgb3BlbmF0KDEzLCAiY2xvbmUtb2YtdGVzdGZp
bGVzcmNtbnRwb3NpeCIsIA0KT19SRFdSfE9fQ1JFQVR8T19FWENMfE9fQVBQRU5EfE9fTk9O
QkxPQ0t8T19OT0ZPTExPVywgMDc3NykgPSAyNw0KLi4uDQoyMzo0OTo1NC44Mzc3ODYgY29w
eV9maWxlX3JhbmdlKDI4LCBbMF0sIDI3LCBbMF0sIDEwNDg1NzYsIDApID0gLTEgRUJBREYg
DQooQmFkIGZpbGUgZGVzY3JpcHRvcikNCg0KVGhlIHByb2JsZW0gaXMgdGhlIE9fQVBQRU5E
IG9uIHRoZSBkZXN0aW5hdGlvbiBmaWxlIGhhbmRsZS4NCg0KV2UgcGFzcyB0aGF0IGZsYWcg
aWYNCg0KICAgICAgICAgaWYgKHBvc2l4X29wZW4gJiYgKGFjY2Vzc19tYXNrICYgRklMRV9B
UFBFTkRfREFUQSkpIHsNCiAgICAgICAgICAgICAgICAgZmxhZ3MgfD0gT19BUFBFTkQ7DQog
ICAgICAgICB9DQoNCklzIHRoaXMgb24gYSBwb3NpeCBtb3VudD8gT3RoZXJ3aXNlIGl0IHNl
ZW1zIHRvIGJlIHRoZSBjbGllbnRzIGZhdWx0IA0KcGFzc2luZyBGSUxFX0FQUEVORF9EQVRB
Lg0KDQotc2xvdw0K

--------------MiKPVQzyrkFujj1P9MCxv0zG--

--------------AAewAaz9WoQ05Gu2dUoMs4LY
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEE+uLGCIokJSBRxVnkqh6bcSY5nkYFAmcE8E8FAwAAAAAACgkQqh6bcSY5nkas
yxAAkxeoS2BwbkUN7F3WWelRWbcXkMoma/W1NN+N++T4OIF6P7Z0sMSvNej12LZIKWc++evOWB9u
RnXJBErWRG3DrfV8LR3PdBVhlDgy1OzHV/BalcDvG6qxiSshOCQAHrqxzx1Ms60yXnq3mXSA1F3/
pZ10qCtHFUvij+V0hdEkhAa2zNPWonaBpTLuJt7FaBGPLmtb+gzUN1s0M3E7Zbc+hHQlbu9h/Lru
96jANG/Gb2W1qpBa/2+2iG1/3PB/oTcsbw9afT3Efo7KPCe7XtlYymVDOZtsy00k5mJf3Ru2gPmY
8dfnwHxlVlFAe/V3siEDLTs3CGHryAIjyjdsE9sQQBFtXNVGINBEF4H7HmFwXsmpP62bmNxGglhL
wSy3yNQD3cIx95sLdK6m7sJaodkMTi4JyfuM+Wy4KXwGcXvW1GwXDzRkwG4HmzuBLJocaOpPVrER
VQrStD+ldTa1+gn++WSshLF8vMaB5SML8M9ThN4ehHVnZKwyTI6SlZRp5cXHnPNc0vWVUVIlWUwV
KPIo9VIkXmkTcF0entHfr4zdtUDOrczHabhRv8VXyUQqV3yQjnF8OrXt681bhhm/8lpLPLfWGHH4
S5TMI3rCnA28Fwfxa17h7q0x5zhY2grKyRnc+9DDHxQy+6EwFd41GY3A88YwWsSdbUVtGzYFD86Q
DHI=
=w5f2
-----END PGP SIGNATURE-----

--------------AAewAaz9WoQ05Gu2dUoMs4LY--

