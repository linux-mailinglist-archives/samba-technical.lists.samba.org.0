Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 714C49BCA15
	for <lists+samba-technical@lfdr.de>; Tue,  5 Nov 2024 11:14:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=MuxLFYoUMS7GQuI7hbGuluXd45PNDfKScNGEtH/FSzQ=; b=wtF/yXSBqs5qydHW5ojcWB2pG8
	bnjMOD4jm+k+BSVXi5emR7coK+0CM2Yvs2Dt3xq1CZdq7bOsKWEKnpcRdXhyJ7afivEE8i+PQGnlz
	GbjZsqEkI/6qwS4h1+dBlAms36qm0LrUvnjoGfTlvPyBF+SfU1+LjSCBPYD3uVffnbRQ1TDBgIco7
	sDbhUhXfWgxg0t2C3kvvGmIsNB+8oleiarxaJj0LW43aZS6teG3eWZJY5NNNYAaywxVHGpWXReOQ1
	RYkg0SnCLsJRCBW6CS2glBRE6PfSqe36yrPpa8VxEXP5fcUy+RYDHu8vZFVDeoBFHy3Ps5EOiYKw4
	FFxtqDzA==;
Received: from ip6-localhost ([::1]:21460 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1t8GZW-007opF-UM; Tue, 05 Nov 2024 10:14:03 +0000
Received: from plasma31.jpberlin.de ([80.241.56.82]:58721) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1t8GZR-007ooR-F9
 for samba-technical@lists.samba.org; Tue, 05 Nov 2024 10:14:01 +0000
Received: from spamfilter02.heinlein-hosting.de
 (spamfilter02.heinlein-hosting.de [80.241.56.116])
 by plasma.jpberlin.de (Postfix) with ESMTP id 021D1A25C2;
 Tue,  5 Nov 2024 11:13:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kania-online.de;
 s=MBO0001; t=1730801632;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=MuxLFYoUMS7GQuI7hbGuluXd45PNDfKScNGEtH/FSzQ=;
 b=kC+FChRlEaEdaGxGmYFaN31dB6XVLabdqy8GkwTsu6b8Bic2KmqYnVXKQeHplOeZfcwb7w
 3dgU2Kcl4380/QW1omfkvXSrHC+VMutcnRk8AAuhOKJ656iHD5i589jbWNCwUBi41aJBbj
 bElwtqsfcAvxDEgXnt9dqGs1k+WZYfgvwXYNCvwRCKQA81wqvrvxaO2ZYye+w5ywpz7Sit
 ZMoZTFczBdOR/48aBHI/oWKYayPMQrHKyRHJeH10ciDWrSScBs20MlKDqaDoR258btHlc/
 y3XJTpFF9yLTmcsSgJdoz/bWTRj0SOrWCuXBDlbdFt7H8wtnz++86CaMBxY7Eg==
Received: from plasma.jpberlin.de ([80.241.56.76])
 by spamfilter02.heinlein-hosting.de (spamfilter02.heinlein-hosting.de
 [80.241.56.116]) (amavisd-new, port 10030)
 with ESMTP id e9dxHkQjROWd; Tue,  5 Nov 2024 11:13:43 +0100 (CET)
Received: from [192.168.123.203] (p5b240946.dip0.t-ipconnect.de [91.36.9.70])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 (Authenticated sender: stefan@kania-online.de)
 by plasma.jpberlin.de (Postfix) with ESMTPSA id 4A601A091A;
 Tue,  5 Nov 2024 11:13:43 +0100 (CET)
Message-ID: <d442b972-9bd6-400a-ba81-9aee20fe1ef8@kania-online.de>
Date: Tue, 5 Nov 2024 11:13:42 +0100
MIME-Version: 1.0
To: Jennifer Sutton <jsutton@samba.org>, samba-technical@lists.samba.org
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
Content-Language: en-US, de-DE
Organization: Stefan Kania
Subject: Re: authentication policies in Samba 4.21
In-Reply-To: <4e9d2eec-6d2a-492f-8c4c-bab7d66ae90b@samba.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------hRbMKgH2FjRznkwMscHLgjMv"
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
--------------hRbMKgH2FjRznkwMscHLgjMv
Content-Type: multipart/mixed; boundary="------------MAmDE6Ydsv6pX8VLGUSQraAk";
 protected-headers="v1"
From: Stefan Kania <stefan@kania-online.de>
To: Jennifer Sutton <jsutton@samba.org>, samba-technical@lists.samba.org
Message-ID: <d442b972-9bd6-400a-ba81-9aee20fe1ef8@kania-online.de>
Subject: Re: authentication policies in Samba 4.21
References: <df1213a5-5153-463b-bacd-5d93ff8d2f6b@kania-online.de>
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
 <898167c5-b7d7-4bb2-9f3e-979f41608bb4@kania-online.de>
 <489883dd-1318-4172-b0b0-0f379714f927@catalyst.net.nz>
 <cc717f18-2a82-4d46-959c-27da326a047f@kania-online.de>
 <9076ae93-ffed-4f04-89f4-f482c218f858@catalyst.net.nz>
 <eb80a2b2-2ab5-4ce3-8734-7c4d41fccb43@kania-online.de>
 <4e9d2eec-6d2a-492f-8c4c-bab7d66ae90b@samba.org>
In-Reply-To: <4e9d2eec-6d2a-492f-8c4c-bab7d66ae90b@samba.org>

--------------MAmDE6Ydsv6pX8VLGUSQraAk
Content-Type: multipart/mixed; boundary="------------SFN8ELJ6Ghyzc5dDprVbsyXm"

--------------SFN8ELJ6Ghyzc5dDprVbsyXm
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgSmVubmlmZXINCg0KQW0gMDQuMTEuMjQgdW0gMjE6MjIgc2NocmllYiBKZW5uaWZlciBT
dXR0b24gdmlhIHNhbWJhLXRlY2huaWNhbDoNCj4gT24gNS8xMS8yNCA3OjI3IGFtLCBTdGVm
YW4gS2FuaWEgdmlhIHNhbWJhLXRlY2huaWNhbCB3cm90ZToNCj4+IEluc2lkZSB0aGUgcG9s
aWN5IChjb21wYXJpbmcgdG8gYSBXaW5kb3dzIEFEKSBJIHN0aWxsIG1pc3Npbmc6DQo+PiBt
c0RTLVVzZXJBbGxvd2VkVG9BdXRoZW50aWNhdGVGcm9tDQo+PiBtc0RTLVNlcnZpY2VBbGxv
d2VkVG9BdXRoZW50aWNhdGVGcm9tDQo+PiBJdCdzIG5vdCBwb3NzaWJsZSB0byBzZXQgdGhp
cyB2YWx1ZXMgd2l0aCBzYW1iYS10b29sDQo+IA0KPiBIYXZlIHlvdSB0cmllZCAtLXVzZXIt
YWxsb3dlZC10by1hdXRoZW50aWNhdGUtZnJvbT1TRERMIGFuZCAtLXNlcnZpY2UtIA0KPiBh
bGxvd2VkLXRvLWF1dGhlbnRpY2F0ZS1mcm9tPVNEREw/DQo+IA0KTm8sIG5vdCB1cCB0byBu
b3cuIEJ1dCBub3cgSSBjaGFuZ2VkIHRoZSBzZXR0aW5ncy4gT24gYm90aCwgdGhlIHdpbmRv
d3MgDQpBRCBhbmQgdGhlIFNhbWJhIEFEIGFsbCB0aGUgc2V0dGluZ3MgYXJlIHRoZSBzYW1l
LCBidXQgc3RpbGwgbm90IHdvcmtpbmcgDQp3aXRoIFNhbWJhIEFELg0KVGhlIHVzZXIgd2hv
IGlzIGEgbWVtYmVyIG9mIHRoZSBzaWxvIGNhbid0IGxvZ2luIG9uIHRoZSBjb21wdXRlciB3
aG8gaXMgDQptZW1iZXIgb2YgdGhlIHNpbG8gQlVUIGhlIGFsc28gY2FuJ3QgbG9naW4gdG8g
YW55IG90aGVyIGNvbXB1dGVyIGluIHRoZSANCmRvbWFpbi4gSGUgaXMgZ2V0dGluZyB0aGUg
c2FtZSBtZXNzYWdlLCB0aGF0IGhlIGlzIG5vdCBhbGxvd2VkIHRvIGxvZ2luIA0Kb24gdGhp
cyBjb21wdXRlciAod2hhdCBpcyByaWdodCBmb3IgdGhlIGNvbXB1dGVyIHdobyBpcyBtZW1i
ZXIgb2YgdGhlIA0Kc2lsbykuIEJUVyBub3cgaXQncyB0aGUgZmlyc3QgdGltZSBJJ20gZ2V0
dGluZyB0aGUgY29ycmVjdCBtZXNzYWdlLg0KDQpBbGwgb3RoZXIgdXNlcnMgY2FuJ3QgYWxz
byBub3QgbG9naW4gdG8gdGhlIGNvbXB1dGVyIGZyb20gdGhlIHNpbG8sIGJ1dCANCm9uIGFu
eSBvdGhlciBjb21wdXRlci4gR2V0dGluZyBhIG1lc3NhZ2UgIlRoaXMgY29tcHV0ZXIgaXMg
cHJvdGVjdGVkIA0Kd2l0aCBhIGF1dGhlbnRpY2FpbmZpcmV3YWxsIi4NCg0KDQo+Pg0KPj4g
SSdtIG1pc3Npbmc6DQo+PiBtc0RTLUFzc2lnbmVkQXV0aE5Qb2xpY3lTaWxvQkwgZm9yIGFs
bCBtZW1iZXJzDQo+IA0KPiBZb3UgZG9u4oCZdCBzZXQgdGhpcyBvbiB0aGUgc2lsby4gWW91
IGFzc2lnbiB0aGUgbWVtYmVycyB0byB0aGUgc2lsbyB3aXRoIA0KPiDigJhzYW1iYS10b29s
IHVzZXIgYXV0aCBzaWxvIGFzc2lnbiA8dXNlcm5hbWU+IFtvcHRpb25zXeKAmS4NCkkga25v
dywgYnV0IHRoaXMgaXMgc3RpbGwgdGhlIG9ubHkgYXR0cmlidXRlIHRoYXQgaXMgc2V0IGlu
IHRoZSB3aW5kb3dzIA0KQUQgYnV0IG5vdCBpbiB0aGUgU2FtYmEgQUQuDQoNCj4gQ2hlZXJz
LA0KPiBKZW5uaWZlciAoc2hlL2hlcikNCj4gDQpTdGVmYW4NCg==
--------------SFN8ELJ6Ghyzc5dDprVbsyXm
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

--------------SFN8ELJ6Ghyzc5dDprVbsyXm--

--------------MAmDE6Ydsv6pX8VLGUSQraAk--

--------------hRbMKgH2FjRznkwMscHLgjMv
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQRsT9azWR5AolaZQIFS9tTdG7aKtQUCZynv1gUDAAAAAAAKCRBS9tTdG7aKtfy5
AQDtVpzBlT9cwHNoaZL34Qm0JBQrRrQwDJWaqSiY4J10swEAh6vd/bxuLmt/rOAWdaMx2aEawyny
79Q44XbiXpaK0g4=
=WeV7
-----END PGP SIGNATURE-----

--------------hRbMKgH2FjRznkwMscHLgjMv--

