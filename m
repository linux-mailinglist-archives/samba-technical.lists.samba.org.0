Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 707309B50E2
	for <lists+samba-technical@lfdr.de>; Tue, 29 Oct 2024 18:34:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=d7NajAroTgRXG0tZA1FiVbg/IxZcDHkK+gMAvHKTK1E=; b=MIXhvNupZc7xvnKMa5tARX7wn1
	9foP0GGEFjjZTfJ/6urkhDsZ9rMYuzto+8f0xMADQuibYYUybxLkp6DbBm35kOAhasCTrG/hBDTrL
	l8uq4DaGu5tn1noyMWRVkZw29G7ITr+lKLVtDu/CGEEujg5TfRnezPPGRZDT6yQ6RkhSNHPfazr7E
	O9IKSD1RjIktdP0tfJwH0YQcaEsM0xim4OU/E7JdJtqmkXAgMP3Q20xs0tu/x6+JYcNOK+0HanJOv
	bVt5kirQ7cT7IFYBsCjedvZm1F/RlGEzrMc8AcXz0cnZUCAWK7WFFEdoAxzdA1VjIH/hRKBFL7TJk
	ykzjGFRw==;
Received: from ip6-localhost ([::1]:37650 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1t5q6e-005VIH-Fv; Tue, 29 Oct 2024 17:34:12 +0000
Received: from plasma6.jpberlin.de ([80.241.56.68]:56539) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1t5q6Y-005VIA-I3
 for samba-technical@lists.samba.org; Tue, 29 Oct 2024 17:34:09 +0000
Received: from spamfilter06.heinlein-hosting.de
 (spamfilter06.heinlein-hosting.de [80.241.56.125])
 by plasma.jpberlin.de (Postfix) with ESMTP id 08F56ABF2E;
 Tue, 29 Oct 2024 18:34:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kania-online.de;
 s=MBO0001; t=1730223241;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=d7NajAroTgRXG0tZA1FiVbg/IxZcDHkK+gMAvHKTK1E=;
 b=cjiVCGGwB2H36EDp+f6i3n45QEd3KhQ6JONu4QVCTWqZxEMgrQZlbkQcSIWmWSwcTOhHcW
 xnKmYeOYU55UFw56QZ96TepIoR6HDEZ41r+nye5GceRaXOwkYc0zvAug5DgN8O4NoLeeej
 zKcnPOVWE419qB35rhgjY3X8bg/g2+n5WiqjbeXcsy+Caw7J1I49HSXesjFWSGJV15xXMc
 0zR13Ump/i0haaX+evd0vNt3UU7lUf/sUBf1HrXxMN7P97MrQorB5Koq9Laz9A7NiQjT1X
 0j/DuI7/N4DGqxqKyPdrc1MmzdDX0zzh5FtH0I5BCnOzX7l9r/i6T7nbxU2nMw==
Received: from plasma.jpberlin.de ([80.241.56.68])
 by spamfilter06.heinlein-hosting.de (spamfilter06.heinlein-hosting.de
 [80.241.56.125]) (amavisd-new, port 10030)
 with ESMTP id vFlsk1vTJnYr; Tue, 29 Oct 2024 18:33:52 +0100 (CET)
Received: from [192.168.123.203] (p5b240946.dip0.t-ipconnect.de [91.36.9.70])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 (Authenticated sender: stefan@kania-online.de)
 by plasma.jpberlin.de (Postfix) with ESMTPSA id A76C5AB502;
 Tue, 29 Oct 2024 18:33:51 +0100 (CET)
Message-ID: <898167c5-b7d7-4bb2-9f3e-979f41608bb4@kania-online.de>
Date: Tue, 29 Oct 2024 18:33:50 +0100
MIME-Version: 1.0
To: Douglas Bagnall <douglas.bagnall@catalyst.net.nz>,
 samba-technical <samba-technical@lists.samba.org>,
 Andrew Bartlett <abartlet@samba.org>
References: <df1213a5-5153-463b-bacd-5d93ff8d2f6b@kania-online.de>
 <297faa9c-6788-436b-bfb3-8d2107b8596d@catalyst.net.nz>
 <48c2847c-7d05-4e1a-9e85-52b1ba5d0b30@catalyst.net.nz>
 <ef60d0ef-25df-4081-9764-5dbc05bfc655@kania-online.de>
 <1eb80efc-4bb2-4b7c-b339-5b92277e782e@samba.org>
 <49b4b9af-033a-4534-90e3-ac633ff8bfd8@kania-online.de>
 <7bf96a40-7472-47ca-b81c-7e9121c598b4@samba.org>
 <68fe1182-281f-42ea-ac18-b0a2bf49961d@samba.org>
 <afa75a49-2ae4-4e14-9363-d5c31d7ef2a9@kania-online.de>
 <b5f3c39b-43c8-4b43-943d-cd851128173c@kania-online.de>
 <5d10619f-c4ed-4190-a4d1-1cec480ee108@catalyst.net.nz>
 <c420e24b-562d-4592-a9df-d0dddd069e22@kania-online.de>
 <ab589c2f-f13b-4560-bd18-7a1e88634a0d@catalyst.net.nz>
 <1a14a7d4-3d56-4212-9420-0affed9ffd18@kania-online.de>
 <0f4e2d3b-12b2-4dfc-88ef-0b52c12bf6db@catalyst.net.nz>
 <70db5ba2-8cfc-42f4-a493-0228954debdb@kania-online.de>
 <84bb05ba-823e-40a7-ba6b-d3c7ec6f2af1@catalyst.net.nz>
 <664df4a2-5133-4094-a233-5c6838413072@kania-online.de>
Content-Language: en-US, de-DE
Organization: Stefan Kania
Subject: Re: authentication policies in Samba 4.21
In-Reply-To: <664df4a2-5133-4094-a233-5c6838413072@kania-online.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------jN0BxPN03BUUHJzIYmomHupZ"
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
From: Stefan Kania via samba-technical <samba-technical@lists.samba.org>
Reply-To: Stefan Kania <stefan@kania-online.de>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------jN0BxPN03BUUHJzIYmomHupZ
Content-Type: multipart/mixed; boundary="------------IDWMsyiRlu5FXp1oAoEy23JZ";
 protected-headers="v1"
From: Stefan Kania <stefan@kania-online.de>
To: Douglas Bagnall <douglas.bagnall@catalyst.net.nz>,
 samba-technical <samba-technical@lists.samba.org>,
 Andrew Bartlett <abartlet@samba.org>
Message-ID: <898167c5-b7d7-4bb2-9f3e-979f41608bb4@kania-online.de>
Subject: Re: authentication policies in Samba 4.21
References: <df1213a5-5153-463b-bacd-5d93ff8d2f6b@kania-online.de>
 <297faa9c-6788-436b-bfb3-8d2107b8596d@catalyst.net.nz>
 <48c2847c-7d05-4e1a-9e85-52b1ba5d0b30@catalyst.net.nz>
 <ef60d0ef-25df-4081-9764-5dbc05bfc655@kania-online.de>
 <1eb80efc-4bb2-4b7c-b339-5b92277e782e@samba.org>
 <49b4b9af-033a-4534-90e3-ac633ff8bfd8@kania-online.de>
 <7bf96a40-7472-47ca-b81c-7e9121c598b4@samba.org>
 <68fe1182-281f-42ea-ac18-b0a2bf49961d@samba.org>
 <afa75a49-2ae4-4e14-9363-d5c31d7ef2a9@kania-online.de>
 <b5f3c39b-43c8-4b43-943d-cd851128173c@kania-online.de>
 <5d10619f-c4ed-4190-a4d1-1cec480ee108@catalyst.net.nz>
 <c420e24b-562d-4592-a9df-d0dddd069e22@kania-online.de>
 <ab589c2f-f13b-4560-bd18-7a1e88634a0d@catalyst.net.nz>
 <1a14a7d4-3d56-4212-9420-0affed9ffd18@kania-online.de>
 <0f4e2d3b-12b2-4dfc-88ef-0b52c12bf6db@catalyst.net.nz>
 <70db5ba2-8cfc-42f4-a493-0228954debdb@kania-online.de>
 <84bb05ba-823e-40a7-ba6b-d3c7ec6f2af1@catalyst.net.nz>
 <664df4a2-5133-4094-a233-5c6838413072@kania-online.de>
In-Reply-To: <664df4a2-5133-4094-a233-5c6838413072@kania-online.de>

--------------IDWMsyiRlu5FXp1oAoEy23JZ
Content-Type: multipart/mixed; boundary="------------Io2zUdv62XTNandGqURXlJaT"

--------------Io2zUdv62XTNandGqURXlJaT
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGksDQoNCkkgc3RpbGwgbm90IGdldHRpbmcgaXQgd29ya2luZyBsaWtlIGV4cGVjdGVkLiBJ
IG5vdyBzZXQgdXAgYSBXaW5kb3dzIEFEIA0KKFNlcnZlciAyMDIyKXRvIHRlc3QgaXQgYW5k
IGdldCB0aGUgbGRhcCBvdXRwdXQgZm9yIHRoZSB1c2VyLCB0aGUgDQpjb21wdXRlciwgdGhl
IHBvbGljeSBhbmQgdGhlIHNpbG8uIEkgd2lsbCBwb3N0IGl0IGhlcmUgYXMgc29vbiBhcyBJ
J20gDQpmaW5pc2hlZCB0byBjb21wYXJlIHRoZSByZXN1bHRzLg0KQnV0IHRoZSB0aWNrZXQt
bGlmdGltZSBpcyBidWcsIEkgdGhpbmsuDQoNClN0ZWZhbg0KDQoNCg0KDQoNCg0KQW0gMjku
MTAuMjQgdW0gMTE6NDkgc2NocmllYiBTdGVmYW4gS2FuaWEgdmlhIHNhbWJhLXRlY2huaWNh
bDoNCj4gDQo+IA0KPiBBbSAyOS4xMC4yNCB1bSAxMToyNyBzY2hyaWViIERvdWdsYXMgQmFn
bmFsbDoNCj4+IFdlIG5lZWQgdGhpcyB0byBiZSJtc0RTLUNvbXB1dGVyQWxsb3dlZFRvQXV0
aGVudGljYXRlVG86OiIuDQo+Pg0KPj4gQmVjYXVzZSB0aGUgdGhpbmcgeW91IHdhbnQgdG8g
Y29udHJvbCBhdXRoZW50aWNhdGlvbiB0byBpcyBhIGNvbXB1dGVyLg0KPiBJIHdpbGwgbG9v
ayBpdCB1cCBpbiBhIE1pY3Jvc29mdCBlbnZpcm9ubWV0IGlmIGl0J3MgdGhlIHNhbWUgdGhl
cmUuIA0KPiBCZWNhdXNlIEkgdGhpbmsgaXQgc2hvdWxkIGJlICJVc2Vyc0FsbG93ZWRUb0F1
dGhlbnRpY2F0ZVRvIi4gQnV0IGV2ZW4gaW4gDQo+IHRoZSBtb3N0IE1pY3Jvc29mdCBtYW51
YWxzIHRoZSBwb2xpY3kgc3R1ZmYgaXMgbm90IHZlcnkgZ29vZCBkb2N1bWVudGVkLg0KPiAN
Cj4gQnV0IHRoYXQgZGlkIGl0IDotKSBOb3cgSSBjYW4gb25seSBsb2dpbiBvbiBjb21wdXRl
cnMgbm90IGEgbWVtYmVyIG9mIA0KPiB0aGUgc2lsbyAoQW5kIGdldHRpbmcgdGhlIHJpZ2h0
IG1lc3NhZ2UpIC4gSSB3aWxsIHRyeSBpdCBsYXRlciBvbiB0byBkbyANCj4gaXQgd2l0ICE9
IHRvIGNoYW5nZSB0aGUgYmVoYXZpb3Igc28gdGhhdCB1c2VycyBjYW4gb25seSBsb2dpbiB0
byANCj4gY29tcHV0ZXIgd2hpY2ggYXJlIG1lbWJlciBvZiB0aGUgc2lsbw0KPiBidXQgdGhl
IHByb2JsZW0gd2l0aCB0aGUgdGlja2V0LWxpdmV0aW1lIHN0aWxsIGV4aXN0cy4NCj4gDQo+
IEkgd2lsbCB3cml0ZSBhIGxpdHRsZSBob3d0byBpZiBldmVyeXRoaW5nIGlzIHRlc3RlZCBh
Z2Fpbi4NCj4gDQo+IFRoYW5rJ3Mgc28gZmFyDQo+IA0KPiBTdGVmYW4NCj4gDQoNCi0tIA0K
U3RlZmFuIEthbmlhDQpMYW5kd2VnIDEzDQoyNTY5MyBTdC4gTWljaGFlbGlzZG9ubg0KDQoN
Cg==
--------------Io2zUdv62XTNandGqURXlJaT
Content-Type: application/pgp-keys; name="OpenPGP_0x52F6D4DD1BB68AB5.asc"
Content-Disposition: attachment; filename="OpenPGP_0x52F6D4DD1BB68AB5.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

xjMEZD5zHxYJKwYBBAHaRw8BAQdAMVmXn59f0nkYv5WMsQq+KrcYCsNfaUj/WZtg
zdF72yDNJVN0ZWZhbiBLYW5pYSA8c3RlZmFuQGthbmlhLW9ubGluZS5kZT7CiQQT
FggAMRYhBGxP1rNZHkCiVplAgVL21N0btoq1BQJkPnNQAhsDBAsJCAcFFQgJCgsF
FgIDAQAACgkQUvbU3Ru2irXx0QEAtwVwH3XaKI4V5K8xNBFjLCvNHZsOBiF1zXRe
V3+ocvcA/i+HTEj2s+Xw0AdOCzTKpUetOkifYMHmRdzoRdjItaUIzjgEZD5zHxIK
KwYBBAGXVQEFAQEHQLCpLYCfOAWfcF2Za/K3FymUQPfyIZ/eupKMlQrGRJUhAwEI
B8J4BBgWCAAgFiEEbE/Ws1keQKJWmUCBUvbU3Ru2irUFAmQ+c1ACGwwACgkQUvbU
3Ru2irV69QEAxwzfX/shQahBfmica2GbWv7hytmlnu/QFNP2WNDb/9MA/133+PWv
q8PePaEGS4s2tRUd8ktDKmVYz7EnJwaCyqcH
=3Dxppn
-----END PGP PUBLIC KEY BLOCK-----

--------------Io2zUdv62XTNandGqURXlJaT--

--------------IDWMsyiRlu5FXp1oAoEy23JZ--

--------------jN0BxPN03BUUHJzIYmomHupZ
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQRsT9azWR5AolaZQIFS9tTdG7aKtQUCZyEcfgUDAAAAAAAKCRBS9tTdG7aKtatf
AP9hcqfUQOgYaCUG0V0J+fsZ8+Nokq5Z1R3r5nPtUPTxZAD/XKrGje7P7LGeKSNswMmyBKLb9cL/
Ckt9lsOmNFToig0=
=7dB9
-----END PGP SIGNATURE-----

--------------jN0BxPN03BUUHJzIYmomHupZ--

