Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BFC89BD2B4
	for <lists+samba-technical@lfdr.de>; Tue,  5 Nov 2024 17:44:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=7uRvq7AvBG6GUY4gggfHpV+wU280eVjaDiRSx13TGrA=; b=XwqzyiO9ZGHEIa7A8yuRWud3WT
	jPRclWHTlzc5C4Lcb98j+SpPSsmSOVobprnECv6486LkpfYvbBKiGS7nZz2eaDIESHdXQ78ZH/R09
	MmsJV3NUdBJbanW7VRHKrmwNtF9KaaeBo6dTIWaqll61EMCOIWnHNWZkmDIhHK8gJr83RwdWysH69
	NLIJQdak9HwIBWroQ/vW6F41m8QvSFMQpjdAMG0YWqP+48EI218ngjd6qBJdHqlmKxXunnS/4DqMO
	g18sGgpmfAVbEW2B+Hh/aaPlzjJuVZylrtbU5Qc4t3MQkA3ISOtRnwCzDombIxMXHAuFksh7iv8J4
	hkGIpxIg==;
Received: from ip6-localhost ([::1]:45666 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1t8Mf8-007rNf-Ap; Tue, 05 Nov 2024 16:44:14 +0000
Received: from plasma6.jpberlin.de ([80.241.56.68]:60257) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1t8Mf3-007rNY-Ja
 for samba-technical@lists.samba.org; Tue, 05 Nov 2024 16:44:12 +0000
Received: from spamfilter02.heinlein-hosting.de
 (spamfilter02.heinlein-hosting.de [80.241.56.116])
 by plasma.jpberlin.de (Postfix) with ESMTP id 72544AAC62;
 Tue,  5 Nov 2024 17:44:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kania-online.de;
 s=MBO0001; t=1730825043;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=7uRvq7AvBG6GUY4gggfHpV+wU280eVjaDiRSx13TGrA=;
 b=UGvTH9yBjqfAtALN6iPEzSAebnks9Qe4jMXv6O7Tj994xvQnV8Yq4yAgQBZfZaYVvUn9bG
 qrhF4DX6XJbSx+Mr/WLjrXWFyNYaCYqv0Fm43g66Iy41VKnqrvia0nLdmnEqLCo/PejrEJ
 nscRTqkOgSQJyWCe0wFe1nAUJXpUMqUarLQDiUI5OAZcbBZTOXUX1bSUWkXsTd4l4vypBY
 0liHUGw6IuxSEm3G9wNMASDp4vs0kWxBSCxBp78kYRz5uL9tRsuZ0nGRNU2LCR7DHLpzSv
 BzcY3ml02tNRyuTw2ldWLahxcIQ2SJNVTRZVG3x79VCWmJXYQBv09mIEBs7Imw==
Received: from plasma.jpberlin.de ([80.241.56.68])
 by spamfilter02.heinlein-hosting.de (spamfilter02.heinlein-hosting.de
 [80.241.56.116]) (amavisd-new, port 10030)
 with ESMTP id nFTyj0x3_yCZ; Tue,  5 Nov 2024 17:43:55 +0100 (CET)
Received: from [192.168.123.203] (p5b240946.dip0.t-ipconnect.de [91.36.9.70])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 (Authenticated sender: stefan@kania-online.de)
 by plasma.jpberlin.de (Postfix) with ESMTPSA id 9D1FDA6575;
 Tue,  5 Nov 2024 17:43:54 +0100 (CET)
Message-ID: <32bc3d0e-212f-4c73-a758-014e913abaf6@kania-online.de>
Date: Tue, 5 Nov 2024 17:43:53 +0100
MIME-Version: 1.0
To: Jennifer Sutton <jsutton@samba.org>, samba-technical@lists.samba.org
References: <df1213a5-5153-463b-bacd-5d93ff8d2f6b@kania-online.de>
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
 <898167c5-b7d7-4bb2-9f3e-979f41608bb4@kania-online.de>
 <489883dd-1318-4172-b0b0-0f379714f927@catalyst.net.nz>
 <cc717f18-2a82-4d46-959c-27da326a047f@kania-online.de>
 <9076ae93-ffed-4f04-89f4-f482c218f858@catalyst.net.nz>
 <eb80a2b2-2ab5-4ce3-8734-7c4d41fccb43@kania-online.de>
 <4e9d2eec-6d2a-492f-8c4c-bab7d66ae90b@samba.org>
 <d442b972-9bd6-400a-ba81-9aee20fe1ef8@kania-online.de>
Content-Language: en-US, de-DE
Organization: Stefan Kania
Subject: Re: authentication policies in Samba 4.21
In-Reply-To: <d442b972-9bd6-400a-ba81-9aee20fe1ef8@kania-online.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------02UD26g1cqYzpSJnmGlEg0yq"
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
--------------02UD26g1cqYzpSJnmGlEg0yq
Content-Type: multipart/mixed; boundary="------------5wVY1zKEmIIjDFgc16UEgsMY";
 protected-headers="v1"
From: Stefan Kania <stefan@kania-online.de>
To: Jennifer Sutton <jsutton@samba.org>, samba-technical@lists.samba.org
Message-ID: <32bc3d0e-212f-4c73-a758-014e913abaf6@kania-online.de>
Subject: Re: authentication policies in Samba 4.21
References: <df1213a5-5153-463b-bacd-5d93ff8d2f6b@kania-online.de>
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
 <898167c5-b7d7-4bb2-9f3e-979f41608bb4@kania-online.de>
 <489883dd-1318-4172-b0b0-0f379714f927@catalyst.net.nz>
 <cc717f18-2a82-4d46-959c-27da326a047f@kania-online.de>
 <9076ae93-ffed-4f04-89f4-f482c218f858@catalyst.net.nz>
 <eb80a2b2-2ab5-4ce3-8734-7c4d41fccb43@kania-online.de>
 <4e9d2eec-6d2a-492f-8c4c-bab7d66ae90b@samba.org>
 <d442b972-9bd6-400a-ba81-9aee20fe1ef8@kania-online.de>
In-Reply-To: <d442b972-9bd6-400a-ba81-9aee20fe1ef8@kania-online.de>

--------------5wVY1zKEmIIjDFgc16UEgsMY
Content-Type: multipart/mixed; boundary="------------mV031NAurTn9wywrvYW5WYym"

--------------mV031NAurTn9wywrvYW5WYym
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

DQoNCkFtIDA1LjExLjI0IHVtIDExOjEzIHNjaHJpZWIgU3RlZmFuIEthbmlhIHZpYSBzYW1i
YS10ZWNobmljYWw6DQo+IEhpIEplbm5pZmVyDQo+IA0KPiBBbSAwNC4xMS4yNCB1bSAyMToy
MiBzY2hyaWViIEplbm5pZmVyIFN1dHRvbiB2aWEgc2FtYmEtdGVjaG5pY2FsOg0KPj4gT24g
NS8xMS8yNCA3OjI3IGFtLCBTdGVmYW4gS2FuaWEgdmlhIHNhbWJhLXRlY2huaWNhbCB3cm90
ZToNCj4+PiBJbnNpZGUgdGhlIHBvbGljeSAoY29tcGFyaW5nIHRvIGEgV2luZG93cyBBRCkg
SSBzdGlsbCBtaXNzaW5nOg0KPj4+IG1zRFMtVXNlckFsbG93ZWRUb0F1dGhlbnRpY2F0ZUZy
b20NCj4+PiBtc0RTLVNlcnZpY2VBbGxvd2VkVG9BdXRoZW50aWNhdGVGcm9tDQo+Pj4gSXQn
cyBub3QgcG9zc2libGUgdG8gc2V0IHRoaXMgdmFsdWVzIHdpdGggc2FtYmEtdG9vbA0KPj4N
Cj4+IEhhdmUgeW91IHRyaWVkIC0tdXNlci1hbGxvd2VkLXRvLWF1dGhlbnRpY2F0ZS1mcm9t
PVNEREwgYW5kIC0tc2VydmljZS0gDQo+PiBhbGxvd2VkLXRvLWF1dGhlbnRpY2F0ZS1mcm9t
PVNEREw/DQo+Pg0KPiBObywgbm90IHVwIHRvIG5vdy4gQnV0IG5vdyBJIGNoYW5nZWQgdGhl
IHNldHRpbmdzLiBPbiBib3RoLCB0aGUgd2luZG93cyANCj4gQUQgYW5kIHRoZSBTYW1iYSBB
RCBhbGwgdGhlIHNldHRpbmdzIGFyZSB0aGUgc2FtZSwgYnV0IHN0aWxsIG5vdCB3b3JraW5n
IA0KPiB3aXRoIFNhbWJhIEFELg0KPiBUaGUgdXNlciB3aG8gaXMgYSBtZW1iZXIgb2YgdGhl
IHNpbG8gY2FuJ3QgbG9naW4gb24gdGhlIGNvbXB1dGVyIHdobyBpcyANCj4gbWVtYmVyIG9m
IHRoZSBzaWxvIEJVVCBoZSBhbHNvIGNhbid0IGxvZ2luIHRvIGFueSBvdGhlciBjb21wdXRl
ciBpbiB0aGUgDQo+IGRvbWFpbi4gSGUgaXMgZ2V0dGluZyB0aGUgc2FtZSBtZXNzYWdlLCB0
aGF0IGhlIGlzIG5vdCBhbGxvd2VkIHRvIGxvZ2luIA0KPiBvbiB0aGlzIGNvbXB1dGVyICh3
aGF0IGlzIHJpZ2h0IGZvciB0aGUgY29tcHV0ZXIgd2hvIGlzIG1lbWJlciBvZiB0aGUgDQo+
IHNpbG8pLiBCVFcgbm93IGl0J3MgdGhlIGZpcnN0IHRpbWUgSSdtIGdldHRpbmcgdGhlIGNv
cnJlY3QgbWVzc2FnZS4NCj4gDQo+IEFsbCBvdGhlciB1c2VycyBjYW4ndCBhbHNvIG5vdCBs
b2dpbiB0byB0aGUgY29tcHV0ZXIgZnJvbSB0aGUgc2lsbywgYnV0IA0KPiBvbiBhbnkgb3Ro
ZXIgY29tcHV0ZXIuIEdldHRpbmcgYSBtZXNzYWdlICJUaGlzIGNvbXB1dGVyIGlzIHByb3Rl
Y3RlZCANCj4gd2l0aCBhIGF1dGhlbnRpY2FpbmZpcmV3YWxsIi4NCj4gDQo+IA0KPj4+DQo+
Pj4gSSdtIG1pc3Npbmc6DQo+Pj4gbXNEUy1Bc3NpZ25lZEF1dGhOUG9saWN5U2lsb0JMIGZv
ciBhbGwgbWVtYmVycw0KPj4NCj4+IFlvdSBkb27igJl0IHNldCB0aGlzIG9uIHRoZSBzaWxv
LiBZb3UgYXNzaWduIHRoZSBtZW1iZXJzIHRvIHRoZSBzaWxvIA0KPj4gd2l0aCDigJhzYW1i
YS10b29sIHVzZXIgYXV0aCBzaWxvIGFzc2lnbiA8dXNlcm5hbWU+IFtvcHRpb25zXeKAmS4N
Cj4gSSBrbm93LCBidXQgdGhpcyBpcyBzdGlsbCB0aGUgb25seSBhdHRyaWJ1dGUgdGhhdCBp
cyBzZXQgaW4gdGhlIHdpbmRvd3MgDQo+IEFEIGJ1dCBub3QgaW4gdGhlIFNhbWJhIEFELg0K
DQpGb3VuZCBzb21ldGhpbmcgbW9yZTogaWYgeW91IHRha2UgYSBsb29rIGF0IHRoZSBzaWxv
IGZyb20gbXkgDQpNaWNyb3NvZnQtQUQgeW91IHNlZToNCm1zRFMtQXNzaWduZWRBdXRoTlBv
bGljeVNpbG9CTDogQ049V0lOQ0xJRU5UMTEsT1U9ZmlybWEsREM9d2luZXhhbXBsZSxEQz1u
ZXQNCg0KbXNEUy1Bc3NpZ25lZEF1dGhOUG9saWN5U2lsb0JMOg0KQ049c3RrYSxPVT1maXJt
YSxEQz13aW5leGFtcGxlLERDPW5ldA0KDQptc0RTLUFzc2lnbmVkQXV0aE5Qb2xpY3lTaWxv
Qkw6DQpDTj1XSU4yMDIyLE9VPURvbWFpbiBDb250cm9sbGVycyxEQz13aW5leGFtcGxlICxE
Qz1uZXQNCg0KLS0tLS0tLS0tLS0tDQoNCm1zRFMtQXV0aE5Qb2xpY3lTaWxvTWVtYmVyczoN
CkNOPVdJTkNMSUVOVDExLE9VPWZpcm1hLERDPXdpbmV4YW1wbGUsREM9bmV0DQoNCm1zRFMt
QXV0aE5Qb2xpY3lTaWxvTWVtYmVyczoNCkNOPXN0IGthLE9VPWZpcm1hLERDPXdpbmV4YW1w
bGUsREM9bmV0DQoNCg0KVGhlIERvbWFpbmNvbnRyb2xsZXIgKFdJTjIwMjIpIGlzIGxpc3Rl
ZCB3aXRoIHRoZSBhdHRyaWJ1dGUgDQptc0RTLUFzc2lnbmVkQXV0aE5Qb2xpY3lTaWxvQkws
IGJ1dCB0aGUgREMgaXMgTk9UIGEgbWVtYmVyIG9mIHRoZSBzaWxvLiANCk9ubHkgdGhlIHVz
ZXIgYW5kIHRoZSBjb21wdXRlci4NCg0KSSB0cmllZCB0byBhc3NpZ24gdGhlIERDIHRvIHRo
ZSBwb2xpY3kgYW5kIG1ha2UgaXQgYSBtZW1iZXIgb2YgdGhlIHNpbG8sIA0Kbm8gY2hhbmdl
cy4NClNvIHN0aWxsIHRoZSBvbmx5IGRpZmZlcmVuY2UgYmV0d2VlbiB3aW5kb3dzIGFuZCBz
YW1iYSBpcyB0aGUgbWlzc2luZyANCmF0dHJpYnV0ZSAgbXNEUy1Bc3NpZ25lZEF1dGhOUG9s
aWN5U2lsb0JMIGZvciBhbGwgbWVtYmVycyBhbmQgdGhlIERDLg0KDQoNClN0ZWZhbg0KDQo+
IA0KPj4gQ2hlZXJzLA0KPj4gSmVubmlmZXIgKHNoZS9oZXIpDQo+Pg0KPiBTdGVmYW4NCg0K
LS0gDQpTdGVmYW4gS2FuaWENCkxhbmR3ZWcgMTMNCjI1NjkzIFN0LiBNaWNoYWVsaXNkb25u
DQoNCi0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KRXMgZ2lidCBrZWluZSBXT0xLRSwgbnVyIGRp
ZSBDb21wdXRlciBmcmVtZGVyIExldXRlDQoNCg==
--------------mV031NAurTn9wywrvYW5WYym
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

--------------mV031NAurTn9wywrvYW5WYym--

--------------5wVY1zKEmIIjDFgc16UEgsMY--

--------------02UD26g1cqYzpSJnmGlEg0yq
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQRsT9azWR5AolaZQIFS9tTdG7aKtQUCZypLSQUDAAAAAAAKCRBS9tTdG7aKtWYn
AP9pCSYk6jIioK7JBaZhEmfUn1dYtpC4SoCiJChQLHP8gwD/Xy6nHGFPaZrRGPoICW+NH9Ho/253
aAW9wOJXf8oLDwU=
=g3lf
-----END PGP SIGNATURE-----

--------------02UD26g1cqYzpSJnmGlEg0yq--

