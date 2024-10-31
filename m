Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E6AD89B7854
	for <lists+samba-technical@lfdr.de>; Thu, 31 Oct 2024 11:05:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=nRBVXt6Ny+eVmXQ2E9RJuQW1iDeh1Um25hobmcBmACw=; b=lIDymTR0YsnLhenQe//StZL9qu
	nLyBIcXKsObuxQu9pO4Bbs/6oT7/rJgzqLyY4Qrg6zu0xnfzAQqEJcibhJQ2c3UOn9G4w4MMbGUIK
	ctHp7USWUupO1lk+omdCacUKXtDJ4YtbrH3WNW0a0bisZHBq5n5gFSZZISa+gTgipY9NcIg/TByn+
	ruLumam4wvlmAYIzDJn6ABiP6As7xY3lFFOny/q+vinTB6UbmZvuZDBEk19D6HPDyddbKEPcSkgR7
	/tPVQK4JGrN8Ax/mzjjvnCb71nP8H4IAAu3Yl9oZRcJtUOpQZg/jYjudYeYhVLns4N5dOtXodksbD
	E//NtFig==;
Received: from ip6-localhost ([::1]:55968 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1t6S2m-005gR2-TK; Thu, 31 Oct 2024 10:04:44 +0000
Received: from plasma31.jpberlin.de ([80.241.56.82]:44953) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1t6S2g-005gQv-Ua
 for samba-technical@lists.samba.org; Thu, 31 Oct 2024 10:04:42 +0000
Received: from spamfilter05.heinlein-hosting.de
 (spamfilter05.heinlein-hosting.de [80.241.56.123])
 by plasma.jpberlin.de (Postfix) with ESMTP id BEE0AA2CAE;
 Thu, 31 Oct 2024 11:04:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kania-online.de;
 s=MBO0001; t=1730369072;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=nRBVXt6Ny+eVmXQ2E9RJuQW1iDeh1Um25hobmcBmACw=;
 b=OjRjdrNJSqyGhriegyb/RdLH0XtgNqHmMg+cAr24L8geFVrpdLb5DHb92GIN9VzSUkKecT
 O5g9X6nJQXJlxwcSqEoSWT2DlI5LSUF8ZhN7XGAwmr4gO5wbhTAl1FOOKYVaBY8aXSLC66
 UzdP8cGkAvtPKwf4C756GW2WQcUYiASnp388AZdfmEY32ILDZmZP880sbv7wVLaYsgyXIf
 vmZVWySh0BbUbXSqb+1VkAzRd/N0Q1sM9M5jJh5CjAzJS64XKLwM0/9DbBLlAUjgD0BBF1
 LRKKlCCMv97jJKf7JPXH4HQClFJCTByNjzVHrQ1UOSTejx63QLwKmwOotnYKAA==
Received: from plasma.jpberlin.de ([80.241.56.76])
 by spamfilter05.heinlein-hosting.de (spamfilter05.heinlein-hosting.de
 [80.241.56.123]) (amavisd-new, port 10030)
 with ESMTP id Sb0NhBItf_-n; Thu, 31 Oct 2024 11:04:24 +0100 (CET)
Received: from [192.168.123.203] (p5b240946.dip0.t-ipconnect.de [91.36.9.70])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 (Authenticated sender: stefan@kania-online.de)
 by plasma.jpberlin.de (Postfix) with ESMTPSA id D6774A3423;
 Thu, 31 Oct 2024 11:04:23 +0100 (CET)
Message-ID: <8c89eab2-e466-4efe-94c4-4528964f50b3@kania-online.de>
Date: Thu, 31 Oct 2024 11:04:22 +0100
MIME-Version: 1.0
To: Douglas Bagnall <douglas.bagnall@catalyst.net.nz>,
 samba-technical <samba-technical@lists.samba.org>,
 Andrew Bartlett <abartlet@samba.org>
References: <df1213a5-5153-463b-bacd-5d93ff8d2f6b@kania-online.de>
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
 <898167c5-b7d7-4bb2-9f3e-979f41608bb4@kania-online.de>
 <489883dd-1318-4172-b0b0-0f379714f927@catalyst.net.nz>
 <cc717f18-2a82-4d46-959c-27da326a047f@kania-online.de>
 <9076ae93-ffed-4f04-89f4-f482c218f858@catalyst.net.nz>
Content-Language: en-US, de-DE
Organization: Stefan Kania
Subject: Re: authentication policies in Samba 4.21
In-Reply-To: <9076ae93-ffed-4f04-89f4-f482c218f858@catalyst.net.nz>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------HuIfZK2p9Bs0m1N0qYXxJR6O"
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
--------------HuIfZK2p9Bs0m1N0qYXxJR6O
Content-Type: multipart/mixed; boundary="------------wthmOmPOOKRZ8oAaEhcO50V1";
 protected-headers="v1"
From: Stefan Kania <stefan@kania-online.de>
To: Douglas Bagnall <douglas.bagnall@catalyst.net.nz>,
 samba-technical <samba-technical@lists.samba.org>,
 Andrew Bartlett <abartlet@samba.org>
Message-ID: <8c89eab2-e466-4efe-94c4-4528964f50b3@kania-online.de>
Subject: Re: authentication policies in Samba 4.21
References: <df1213a5-5153-463b-bacd-5d93ff8d2f6b@kania-online.de>
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
 <898167c5-b7d7-4bb2-9f3e-979f41608bb4@kania-online.de>
 <489883dd-1318-4172-b0b0-0f379714f927@catalyst.net.nz>
 <cc717f18-2a82-4d46-959c-27da326a047f@kania-online.de>
 <9076ae93-ffed-4f04-89f4-f482c218f858@catalyst.net.nz>
In-Reply-To: <9076ae93-ffed-4f04-89f4-f482c218f858@catalyst.net.nz>

--------------wthmOmPOOKRZ8oAaEhcO50V1
Content-Type: multipart/mixed; boundary="------------HM71hjePxLx52JJwTnqURYyZ"

--------------HM71hjePxLx52JJwTnqURYyZ
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgRG91Z2xhcywNCg0KdGhhbmsncyBmb3Igc2VwYXJhdGluZyB0aGUgYXR0cmlidXRzIGFu
ZCB0aGFuayB5b3UgZm9yIHRoZSB0aXAgaG93IHRvIA0KbWFrZSB0aGUgYXR0cmlidXRlIGZv
ciB0aGUgU0RETCByZWFkYWJsZSA6LSkNCg0KVGhlcmUgYXJlIGEgbG90IG9mIGRpZmZlcmVu
dCBhdHRyaWJ1dC4gQlRXIHRoYXQncyB0aGUgdmlkZW8gSSBmb2xsb3dkIHRvIA0KZ2V0IHRo
ZSBwb2xpY3kgd29ya2luZyB3aXRoIFdpbmRvd3MNCmh0dHBzOi8vd3d3LnlvdXR1YmUuY29t
L3dhdGNoP3Y9NmNsSmZIVG1pMlENCg0KSWYgeW91IHdhdGNoIHRoZSB2aWRlbyB5b3UgY2Fu
IHNlZSwgdGhhdCB5b3UgY2FuIHNlbGVjdCBkaWZmZXJlbnQgDQpwb2xpY2llcyBmb3IgY29t
cHV0ZXIsIHVzZXJzIG9yIHNlcnZpY2VzIGluIHRoZSBzYW1lIHNpbG8uIFdoYXQgSSBkaWQg
DQoodGhlIHNhbWUgaXMgbWFkZSBpbiB0aGUgdmlkZW8pIEkgY2hvb3NlIHRoZSBzYW1lIFBv
bGljeSBmb3IgYWxsIHRocmVlLiANCkJ1dCBJIHRoaW5rIE1pY3Jvc29mdCBpbiB0aGUgYmFj
a2dyb3VuZCwgaXMgc2V0dGluZyBlYWNoIHBvbGljeSBvbiBpdCdzIG93bi4NCg0KU28gbWF5
YmUgdGhhdCdzIHRoZSByZWFzb24gd2h5IHRoZXkgaGF2ZSB0aHJlZSBkaWZmZXJlbnQgZW50
cmllcyBpbiB0aGUgDQpzaWxvLg0KQXQgdGhlIG1vbWVudCBpIGRvbid0IGtub3cgaG93IHRv
IHNldCB0aGUgc2FtZSBhdHRyaWJ1dGUgd2l0aCBTYW1iYSBhcyANCnRoZXkgYXJlIGluIFdp
bmRvd3MsIG90aGVyIHRoZW4gdXNpbmcgYSBsZGlmLWZpbGUuDQoNClN0ZWZhbg0KDQpBbSAz
MC4xMC4yNCB1bSAyMzozMCBzY2hyaWViIERvdWdsYXMgQmFnbmFsbDoNCj4gT24gMzEvMTAv
MjQgMDU6NTcsIFN0ZWZhbiBLYW5pYSB3cm90ZToNCj4+IHRoZSBhc3NpZ25tZW50IGlzIGRp
ZmZlcmVudCB0byB0aGUgb25lIHdlIGhhdmUgaW4gU2FtYmENCj4gDQo+IEp1c3Qgc28gdGhp
cyBwYXJ0IGRvZXNuJ3QgZ2V0IGxvc3QsIHRoZXNlIGFyZSB0aGUgZGlmZmVyZW5jZXMgd2Un
cmUgDQo+IGxvb2tpbmcgYXQuDQo+IA0KPiBwb2xpY3ksIHdpbmRvd3M6DQo+IA0KPj4gbXNE
Uy1Vc2VyQXV0aE5Qb2xpY3lCTDogQ049d2luMTEtc2lsbyxDTj1BdXRoTiBTaWxvcyxDTj1B
dXRoTiBQb2xpY3kgDQo+PiBDb25maWd1cmENCj4+IMKgdGlvbixDTj1TZXJ2aWNlcyxDTj1D
b25maWd1cmF0aW9uLERDPXdpbmV4YW1wbGUsREM9bmV0DQo+PiBtc0RTLUNvbXB1dGVyQXV0
aE5Qb2xpY3lCTDogQ049d2luMTEtc2lsbyxDTj1BdXRoTiBTaWxvcyxDTj1BdXRoTiANCj4+
IFBvbGljeSBDb25maQ0KPj4gwqBndXJhdGlvbixDTj1TZXJ2aWNlcyxDTj1Db25maWd1cmF0
aW9uLERDPXdpbmV4YW1wbGUsREM9bmV0DQo+PiBtc0RTLVNlcnZpY2VBdXRoTlBvbGljeUJM
OiBDTj13aW4xMS1zaWxvLENOPUF1dGhOIFNpbG9zLENOPUF1dGhOIA0KPj4gUG9saWN5IENv
bmZpZw0KPj4gwqB1cmF0aW9uLENOPVNlcnZpY2VzLENOPUNvbmZpZ3VyYXRpb24sREM9d2lu
ZXhhbXBsZSxEQz1uZXQgDQo+IA0KPiBwb2xpY3ksIHNhbWJhOg0KPiANCj4+PiBtc0RTLUFz
c2lnbmVkQXV0aE5Qb2xpY3lCTDogQ049c3RrYSxPVT1maXJtYSxEQz1leGFtcGxlLERDPW5l
dA0KPj4+IG1zRFMtQXNzaWduZWRBdXRoTlBvbGljeUJMOiBDTj1XSU5DTElFTlQxMSxPVT1m
aXJtYSxEQz1leGFtcGxlLERDPW5ldA0KPiANCj4gDQo+IHNpbG8sIHdpbmRvd3M6DQo+IA0K
Pj4gbXNEUy1Bc3NpZ25lZEF1dGhOUG9saWN5U2lsb0JMOiANCj4+IENOPVdJTkNMSUVOVDEx
LE9VPWZpcm1hLERDPXdpbmV4YW1wbGUsREM9bmV0PiBtc0RTLSANCj4+IEFzc2lnbmVkQXV0
aE5Qb2xpY3lTaWxvQkw6IENOPXN0IGthLE9VPWZpcm1hLERDPXdpbmV4YW1wbGUsREM9bmV0
DQo+PiBtc0RTLUFzc2lnbmVkQXV0aE5Qb2xpY3lTaWxvQkw6IENOPVdJTjIwMjIsT1U9RG9t
YWluIA0KPj4gQ29udHJvbGxlcnMsREM9d2luZXhhbXBsZSBtc0RTLVVzZXJBdXRoTlBvbGlj
eTogQ049d2luMTEtIA0KPj4gcG9saWN5LENOPUF1dGhOIFBvbGljaWVzLENOPUF1dGhOIFBv
bGljeSBDb25maWc+ICANCj4+IHVyYXRpb24sQ049U2VydmljZXMsQ049Q29uZmlndXJhdGlv
bixEQz13aW5leGFtcGxlLERDPW5ldA0KPj4gbXNEUy1Db21wdXRlckF1dGhOUG9saWN5OiBD
Tj13aW4xMS1wb2xpY3ksQ049QXV0aE4gUG9saWNpZXMsQ049QXV0aE4gDQo+PiBQb2xpY3kg
Q28NCj4+IMKgbmZpZ3VyYXRpb24sQ049U2VydmljZXMsQ049Q29uZmlndXJhdGlvbixEQz13
aW5leGFtcGxlLERDPW5ldA0KPj4gbXNEUy1TZXJ2aWNlQXV0aE5Qb2xpY3k6IENOPXdpbjEx
LXBvbGljeSxDTj1BdXRoTiBQb2xpY2llcyxDTj1BdXRoTiANCj4+IFBvbGljeSBDb24NCj4+
IMKgZmlndXJhdGlvbixDTj1TZXJ2aWNlcyxDTj1Db25maWd1cmF0aW9uLERDPXdpbmV4YW1w
bGUsREM9bmV0IA0KPiANCj4gc2lsbywgc2FtYmE6DQo+IA0KPj4+IG1zRFMtQXV0aE5Qb2xp
Y3lTaWxvTWVtYmVyczogQ049c3RrYSxPVT1maXJtYSxEQz1leGFtcGxlLERDPW5ldA0KPj4+
IG1zRFMtQXV0aE5Qb2xpY3lTaWxvTWVtYmVyczogQ049V0lOQ0xJRU5UMTEsT1U9ZmlybWEs
REM9ZXhhbXBsZSxEQz1uZXQNCj4gDQo+IA0KPiB1c2VyLCB3aW5kb3dzOg0KPiANCj4+IG1z
RFMtQXNzaWduZWRBdXRoTlBvbGljeVNpbG86IENOPXdpbjExLXNpbG8sQ049QXV0aE4gU2ls
b3MsQ049QXV0aE4gDQo+PiBQb2xpY3kgQ29uDQo+PiDCoGZpZ3VyYXRpb24sQ049U2Vydmlj
ZXMsQ049Q29uZmlndXJhdGlvbixEQz13aW5leGFtcGxlLERDPW5ldA0KPj4gbXNEUy1BdXRo
TlBvbGljeVNpbG9NZW1iZXJzQkw6IENOPXdpbjExLXNpbG8sQ049QXV0aE4gU2lsb3MsQ049
QXV0aE4gDQo+PiBQb2xpY3kgQ28NCj4+IMKgbmZpZ3VyYXRpb24sQ049U2VydmljZXMsQ049
Q29uZmlndXJhdGlvbixEQz13aW5leGFtcGxlLERDPW5ldCANCj4gDQo+IHVzZXIsIHNhbWJh
Og0KPiANCj4+PiBtc0RTLUF1dGhOUG9saWN5U2lsb01lbWJlcnNCTDogQ049d2luMTEtc2ls
byxDTj1BdXRoTiBTaWxvcyxDTj1BdXRoTiANCj4+PiBQb2xpY3kgQ28NCj4+PiDCoG5maWd1
cmF0aW9uLENOPVNlcnZpY2VzLENOPUNvbmZpZ3VyYXRpb24sREM9ZXhhbXBsZSxEQz1uZXQN
Cj4+PiBtc0RTLUFzc2lnbmVkQXV0aE5Qb2xpY3k6IENOPXdpbjExLXBvbGljeSxDTj1BdXRo
TiBQb2xpY2llcyxDTj1BdXRoTiANCj4+PiBQb2xpY3kgQ28NCj4+PiDCoG5maWd1cmF0aW9u
LENOPVNlcnZpY2VzLENOPUNvbmZpZ3VyYXRpb24sREM9ZXhhbXBsZSxEQz1uZXQNCj4gDQo+
IA0KPiBjb21wdXRlciwgd2luZG93czoNCj4gDQo+PiBtc0RTLUFzc2lnbmVkQXV0aE5Qb2xp
Y3lTaWxvOiBDTj13aW4xMS1zaWxvLENOPUF1dGhOIFNpbG9zLENOPUF1dGhOIA0KPj4gUG9s
aWN5IENvbg0KPj4gwqBmaWd1cmF0aW9uLENOPVNlcnZpY2VzLENOPUNvbmZpZ3VyYXRpb24s
REM9d2luZXhhbXBsZSxEQz1uZXQNCj4+IG1zRFMtQXV0aE5Qb2xpY3lTaWxvTWVtYmVyc0JM
OiBDTj13aW4xMS1zaWxvLENOPUF1dGhOIFNpbG9zLENOPUF1dGhOIA0KPj4gUG9saWN5IENv
DQo+PiDCoG5maWd1cmF0aW9uLENOPVNlcnZpY2VzLENOPUNvbmZpZ3VyYXRpb24sREM9d2lu
ZXhhbXBsZSxEQz1uZXQgDQo+IA0KPiBjb21wdXRlciwgc2FtYmE6DQo+IA0KPj4+IG1zRFMt
QXV0aE5Qb2xpY3lTaWxvTWVtYmVyc0JMOiBDTj13aW4xMS1zaWxvLENOPUF1dGhOIFNpbG9z
LENOPUF1dGhOIA0KPj4+IFBvbGljeSBDbw0KPj4+IMKgbmZpZ3VyYXRpb24sQ049U2Vydmlj
ZXMsQ049Q29uZmlndXJhdGlvbixEQz1leGFtcGxlLERDPW5ldA0KPj4+IG1zRFMtQXNzaWdu
ZWRBdXRoTlBvbGljeTogQ049d2luMTEtcG9saWN5LENOPUF1dGhOIFBvbGljaWVzLENOPUF1
dGhOIA0KPj4+IFBvbGljeSBDbw0KPj4+IMKgbmZpZ3VyYXRpb24sQ049U2VydmljZXMsQ049
Q29uZmlndXJhdGlvbixEQz1leGFtcGxlLERDPW5ldCANCj4gDQo+IA0KPiBEb3VnbGFzDQoN
Cg0KDQoNCg==
--------------HM71hjePxLx52JJwTnqURYyZ
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

--------------HM71hjePxLx52JJwTnqURYyZ--

--------------wthmOmPOOKRZ8oAaEhcO50V1--

--------------HuIfZK2p9Bs0m1N0qYXxJR6O
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQRsT9azWR5AolaZQIFS9tTdG7aKtQUCZyNWJgUDAAAAAAAKCRBS9tTdG7aKtcjA
AQCNxco11YaWFJ0JGgkGRddaqgKs0QXLwWCVMQXv7QCQswEA/5plYpm5sDBB28ArgZCQHGb/MRXo
G2+k4siy4BozoAA=
=+OF1
-----END PGP SIGNATURE-----

--------------HuIfZK2p9Bs0m1N0qYXxJR6O--

