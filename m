Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F67B99446D
	for <lists+samba-technical@lfdr.de>; Tue,  8 Oct 2024 11:35:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=H+2thn8Qa0/kERp/SGnXihj91qwwvRvZOlWlpdbb5/4=; b=58bYFKyvINohbpB0xYUzi1VBZH
	ikKDQop4dAd1aKX3C77fchEQgbPybsoA6eyrgJGXmiuBlJh6taVQkJbIN9Ng2NEnSqOQwWUVP0Mnv
	+V+Nk13vaH3rjxfxj60052YThbipwuISpYWdKS7PqqonLsXxACJxh133R7TCvqOist55M49HUqpXa
	1G7j/+kJY8KlLtRuSwkI6TNziL0S5YSyp/PhKeN1istnzGVk9EqJ9BJsFyFrQQMBtW7I7nsOpj1fy
	+BTJBD44zIpRBvoC99vUKE1ws5kZFNp7PE/PlyXDfJPlRpTtm1c4uw7U6ENe0jkQ/zQhOwmrqr8bd
	u4mX0bSg==;
Received: from ip6-localhost ([::1]:27992 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1sy6cm-003Gqg-31; Tue, 08 Oct 2024 09:35:24 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:21424) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1sy6ch-003GqY-Do
 for samba-technical@lists.samba.org; Tue, 08 Oct 2024 09:35:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Cc:To:From:Date:Message-ID;
 bh=H+2thn8Qa0/kERp/SGnXihj91qwwvRvZOlWlpdbb5/4=; b=yN+GWnptPr9fWl85qVlf/edgu1
 a/1TxJVh136eZCqdhVeXOLZsNSEKvVSgFDa49DhA9bZHvfhxY3pCOBTuKfr7VxuAiuPcjKd8AwpE0
 YQq9ntWukQIPR1T84mCniSYW4OyrCuxghu9kEsQ0DNg8oSZ71g6ree/vjIEVDnCOxtZ93pJtCVHr/
 ex9CnswwyjS0oyfvSZjWDPqPx79MKLvAlTkNQfXWFbw+uDYGkGGXmC7gzw604O0mB1wk2THcrLXTJ
 3ZxDIeBmjJhW+2Sx2BswGfZmD4SHN9LjD0DhwYZQHK4r6xpcVaHab8ibVCY/fcmEyBRDENnuO3l90
 HO2TGno8SuhUnwO0RyI5BnjKIhrR3qu/YRzb1Ky/Zs9aMW8JdR6jEOiubCnShQacCCN0EV4OoTH8Y
 hqDJjgNOwFbUj9zveENOWLA/MlLzH3PopgP4DqfDkg32QFglkQAnNs/uSZi8yKJ8Cc6BiRf2E4rDV
 r2J36lNek1E8Sn++VP7zFOL7;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1sy6cg-003tmr-0W; Tue, 08 Oct 2024 09:35:18 +0000
Message-ID: <990b4f16-2f5a-49ab-8a14-8b1f3cee94dc@samba.org>
Date: Tue, 8 Oct 2024 11:35:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Current Samba master incorrectly returns STATUS_INVALID_HANDLE on
 copy_chunk
To: Steve French <smfrench@gmail.com>
References: <CAH2r5mt7cE8Cc2K5K8nRM2RL=R-rwuAR9h6SSyEqtApuochtuQ@mail.gmail.com>
 <e12d7594-02df-4cbb-80fc-276d907afd90@samba.org>
 <CAH2r5muqSmNy+3SViFKNJ=5Sm61u8r9ej9Wy8JLUDeC2XHwccA@mail.gmail.com>
 <77aff6ef-291d-4840-82e2-b02646949541@samba.org>
 <d84732db-dea1-4fbd-9fc9-105c115c9ca0@samba.org>
Content-Language: en-US, de-DE
In-Reply-To: <d84732db-dea1-4fbd-9fc9-105c115c9ca0@samba.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------U0l1VdpmMJBkJnrDL04knix1"
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
--------------U0l1VdpmMJBkJnrDL04knix1
Content-Type: multipart/mixed; boundary="------------FXWN0tib6Tl0CirrI1D5qxvO";
 protected-headers="v1"
From: Ralph Boehme <slow@samba.org>
To: Steve French <smfrench@gmail.com>
Cc: CIFS <linux-cifs@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>
Message-ID: <990b4f16-2f5a-49ab-8a14-8b1f3cee94dc@samba.org>
Subject: Re: Current Samba master incorrectly returns STATUS_INVALID_HANDLE on
 copy_chunk
References: <CAH2r5mt7cE8Cc2K5K8nRM2RL=R-rwuAR9h6SSyEqtApuochtuQ@mail.gmail.com>
 <e12d7594-02df-4cbb-80fc-276d907afd90@samba.org>
 <CAH2r5muqSmNy+3SViFKNJ=5Sm61u8r9ej9Wy8JLUDeC2XHwccA@mail.gmail.com>
 <77aff6ef-291d-4840-82e2-b02646949541@samba.org>
 <d84732db-dea1-4fbd-9fc9-105c115c9ca0@samba.org>
In-Reply-To: <d84732db-dea1-4fbd-9fc9-105c115c9ca0@samba.org>

--------------FXWN0tib6Tl0CirrI1D5qxvO
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTAvOC8yNCAxMDo0NSBBTSwgUmFscGggQm9laG1lIHdyb3RlOg0KPiBPbiAxMC84LzI0
IDEwOjQxIEFNLCBSYWxwaCBCb2VobWUgdmlhIHNhbWJhLXRlY2huaWNhbCB3cm90ZToNCj4+
IFRoZSBwcm9ibGVtIGlzIHRoZSBPX0FQUEVORCBvbiB0aGUgZGVzdGluYXRpb24gZmlsZSBo
YW5kbGUuDQo+Pg0KPj4gV2UgcGFzcyB0aGF0IGZsYWcgaWYNCj4+DQo+PiDCoMKgwqDCoMKg
wqDCoMKgIGlmIChwb3NpeF9vcGVuICYmIChhY2Nlc3NfbWFzayAmIEZJTEVfQVBQRU5EX0RB
VEEpKSB7DQo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBmbGFncyB8PSBP
X0FQUEVORDsNCj4+IMKgwqDCoMKgwqDCoMKgwqAgfQ0KPj4NCj4+IElzIHRoaXMgb24gYSBw
b3NpeCBtb3VudD8gT3RoZXJ3aXNlIGl0IHNlZW1zIHRvIGJlIHRoZSBjbGllbnRzIGZhdWx0
IA0KPj4gcGFzc2luZyBGSUxFX0FQUEVORF9EQVRBLg0KPiANCj4gZ2FoLCBpdCdzIGFuICIm
JiIsIG5vdCBhbiAifHwiLCBzbyBpdCdzIHlvdXIgY2xpZW50IEkgd291bGQgc2F5Lg0KDQp0
aGlua2luZyBhYm91dCBpdCwgSSB3b25kZXIgd2hldGhlciB0aGF0IGNvbmRpdGlvbiBpcyBh
Y3R1YWxseSB1c2VmdWwgb3IgDQppZiB3ZSBzaG91bGQgcmVtb3ZlIGl0Lg0KDQpASmVyZW15
IChvciBvdGhlcnMpOiBtYXBwaW5nIGZyb20gRklMRV9BUFBFTkRfREFUQSBhY2Nlc3MgbWFz
ayB0byBvcGVuIA0KZmxhZyBPX0FQUEVORCBzZWVtcyB3cm9uZyBpbWhvLiBEbyB5b3UgcmVt
ZW1iZXIgd2h5IHlvdSBhZGRlZCBpdD8gT3IgDQphbnlvbmUgZWxzZT8NCg0KLXNsb3cNCg==


--------------FXWN0tib6Tl0CirrI1D5qxvO--

--------------U0l1VdpmMJBkJnrDL04knix1
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEE+uLGCIokJSBRxVnkqh6bcSY5nkYFAmcE/NUFAwAAAAAACgkQqh6bcSY5nkYn
LA//cSR1+6tniebT5gGBrxdIkQDf24gtyA3CrVY3r+WcnZh7xvri4uT20L0VifC+5A9tE2Bg89H7
Dc6h51/Hbz0yNlhzow1Rm4J7lw0/ycAEEUp/4WenaLrrAs4WBlTg5/5JSu3lLnUVZi5H8lgH2Fj6
wwxU5CCTgNqoxWPTQTbenmFm26vhT5McxDHiVN3fephHWMVEW5xCDc2u32iE7NmSg8iJS2XfFWiW
wdY0q5+ckDQsF/NFtNb/UsRW5W+MSx+GM4y9N7eGBw4KRngVohIScE1IjukoMY36Me1+zhPTPW0P
XK6ShdYys6Hw3o2TqAsQi17mD4m0Y2F38FoNF4Z3hIDU+xCYIOKW7AGFap8YgTr5UsFu/PtUAjVZ
ftKyHR+lq6nDpffldi7GmZxHjkiTz5jTVl3zIe3oQDPwJB3/3oGfiHVfLpGejN6u49Ruz5En5xQA
uYq8jHYgEusenlnk6pBAmcd87rTg8yEMyvVMHGFpqtOr4t6FUoNQhMLesODsJcc/SxiEqn4IvLvG
4+w9jrJTOPKJwyl9ucUZt/54mSupm5jEJ5lDq3+ZhC2lruae0VoJUIHh6rfmWIaIHC1MRbbOtfEC
Yrvt5Ubp5P5IDPdiRoLutQEP/lrT0XnN9QUcABOkqM3+3oJavAd9p8YR1uXzjSRW914WGv9KqZbT
Spk=
=1OG3
-----END PGP SIGNATURE-----

--------------U0l1VdpmMJBkJnrDL04knix1--

