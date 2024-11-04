Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id DD5A19BBD45
	for <lists+samba-technical@lfdr.de>; Mon,  4 Nov 2024 19:28:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=uvkzEXNXHZaIvDAEU4dzWjwoJXz/Bgjf3bdFXkOHyPg=; b=hzPMIu4ThBYXv6AKn3N0XUPpPz
	CYx11p612jjsRhCa7XVtZGtXoidMfQNsDZSAlftQ3Rtdbh9VCzE1yJq8iiQXeTADgKAxY59OJCEx0
	Gq6scKT2e/xkGc7wniWCDOy9OnXTTnr3o5R2hY1AgE+R6ZEyOfm4F+537O00JSc+PHP9RwqEFR9Ki
	F5a64127AkQ43PqeaLv7IyDcd92mY3OD0S6a+AeVNAKZNanyi3mfhQMmdxACmwO3FevVauWdgqPkR
	QIXBf4WP+bbsKZ8ZYnzSvR0j5tiCorppPOI+9PYH91WyxncElU4f5GlcW6jN06nlhjYI+xk4uNlar
	7x58mJpw==;
Received: from ip6-localhost ([::1]:43424 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1t81nt-007mLk-2N; Mon, 04 Nov 2024 18:27:53 +0000
Received: from plasma31.jpberlin.de ([80.241.56.82]:54955) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1t81nm-007mLd-Ev
 for samba-technical@lists.samba.org; Mon, 04 Nov 2024 18:27:49 +0000
Received: from spamfilter04.heinlein-hosting.de
 (spamfilter04.heinlein-hosting.de [80.241.56.122])
 by plasma.jpberlin.de (Postfix) with ESMTP id 66D0B9F366;
 Mon,  4 Nov 2024 19:27:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kania-online.de;
 s=MBO0001; t=1730744860;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=uvkzEXNXHZaIvDAEU4dzWjwoJXz/Bgjf3bdFXkOHyPg=;
 b=DsPplBPIM+1XwVeS6nZeKeBvy0cP+/6O7WJC7SsSiTHYarCL6/Fwwxyv9YNU7Xb0DuGUxd
 m7EsBnBQ1AW0kA3cA9++sJaAw0vLUXXgjGGTGE1FsYgDk0eIvfFPj51SEUbSdgriY7g3rc
 WNdCX+FRpY9dSPrr6Yph0EsX55yI0k4Ns8Vz08QLtRXjmiPETIvZqpDu5wXE/0Zz4mhaI6
 TTX2DhtCNq0SrbvwcZ8BafMNqBLDsfzhiCoeSBGTLWkmb/y8NadTmDpkkMyzCG6GS1Q5iX
 D3sGlWIDI5w02WA1CoJ042AB/qbfHNwW03dVrpmdozssC+d9g24R5kZ8GhGM4w==
Received: from plasma.jpberlin.de ([80.241.56.76])
 by spamfilter04.heinlein-hosting.de (spamfilter04.heinlein-hosting.de
 [80.241.56.122]) (amavisd-new, port 10030)
 with ESMTP id RoPjG3Sw4_mu; Mon,  4 Nov 2024 19:27:32 +0100 (CET)
Received: from [192.168.123.203] (p5b240946.dip0.t-ipconnect.de [91.36.9.70])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 (Authenticated sender: stefan@kania-online.de)
 by plasma.jpberlin.de (Postfix) with ESMTPSA id 37014A2798;
 Mon,  4 Nov 2024 19:27:30 +0100 (CET)
Message-ID: <eb80a2b2-2ab5-4ce3-8734-7c4d41fccb43@kania-online.de>
Date: Mon, 4 Nov 2024 19:27:30 +0100
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
 boundary="------------L0r6EPalHFwhZbo4GGYX4HUq"
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
--------------L0r6EPalHFwhZbo4GGYX4HUq
Content-Type: multipart/mixed; boundary="------------T0v1Sy0yhxSrXqm4JRj0JL0U";
 protected-headers="v1"
From: Stefan Kania <stefan@kania-online.de>
To: Douglas Bagnall <douglas.bagnall@catalyst.net.nz>,
 samba-technical <samba-technical@lists.samba.org>,
 Andrew Bartlett <abartlet@samba.org>
Message-ID: <eb80a2b2-2ab5-4ce3-8734-7c4d41fccb43@kania-online.de>
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

--------------T0v1Sy0yhxSrXqm4JRj0JL0U
Content-Type: multipart/mixed; boundary="------------ExrxPq34dwDSLfY4TegBnOE0"

--------------ExrxPq34dwDSLfY4TegBnOE0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SSB0cmllZCB0byB0byBnZXQgdGhlIHNhbWUgc2V0dGluZ3MgaW4gU2FtYmEgYXMgaW4gV2lu
ZG93cw0KDQpBbSAzMC4xMC4yNCB1bSAyMzozMCBzY2hyaWViIERvdWdsYXMgQmFnbmFsbCB2
aWEgc2FtYmEtdGVjaG5pY2FsOg0KPiBPbiAzMS8xMC8yNCAwNTo1NywgU3RlZmFuIEthbmlh
IHdyb3RlOg0KPj4gdGhlIGFzc2lnbm1lbnQgaXMgZGlmZmVyZW50IHRvIHRoZSBvbmUgd2Ug
aGF2ZSBpbiBTYW1iYQ0KPiANCj4gSnVzdCBzbyB0aGlzIHBhcnQgZG9lc24ndCBnZXQgbG9z
dCwgdGhlc2UgYXJlIHRoZSBkaWZmZXJlbmNlcyB3ZSdyZSANCj4gbG9va2luZyBhdC4NCj4g
DQo+IHBvbGljeSwgd2luZG93czoNCj4gDQo+PiBtc0RTLVVzZXJBdXRoTlBvbGljeUJMOiBD
Tj13aW4xMS1zaWxvLENOPUF1dGhOIFNpbG9zLENOPUF1dGhOIFBvbGljeSANCj4+IENvbmZp
Z3VyYQ0KPj4gwqB0aW9uLENOPVNlcnZpY2VzLENOPUNvbmZpZ3VyYXRpb24sREM9d2luZXhh
bXBsZSxEQz1uZXQNCj4+IG1zRFMtQ29tcHV0ZXJBdXRoTlBvbGljeUJMOiBDTj13aW4xMS1z
aWxvLENOPUF1dGhOIFNpbG9zLENOPUF1dGhOIA0KPj4gUG9saWN5IENvbmZpDQo+PiDCoGd1
cmF0aW9uLENOPVNlcnZpY2VzLENOPUNvbmZpZ3VyYXRpb24sREM9d2luZXhhbXBsZSxEQz1u
ZXQNCj4+IG1zRFMtU2VydmljZUF1dGhOUG9saWN5Qkw6IENOPXdpbjExLXNpbG8sQ049QXV0
aE4gU2lsb3MsQ049QXV0aE4gDQo+PiBQb2xpY3kgQ29uZmlnDQo+PiDCoHVyYXRpb24sQ049
U2VydmljZXMsQ049Q29uZmlndXJhdGlvbixEQz13aW5leGFtcGxlLERDPW5ldCANCj4gDQo+
IHBvbGljeSwgc2FtYmE6DQo+IA0KPj4+IG1zRFMtQXNzaWduZWRBdXRoTlBvbGljeUJMOiBD
Tj1zdGthLE9VPWZpcm1hLERDPWV4YW1wbGUsREM9bmV0DQo+Pj4gbXNEUy1Bc3NpZ25lZEF1
dGhOUG9saWN5Qkw6IENOPVdJTkNMSUVOVDExLE9VPWZpcm1hLERDPWV4YW1wbGUsREM9bmV0
DQoNCnBvbGljeSBzYW1iYSBuZXc6DQptc0RTLUNvbXB1dGVyQXV0aE5Qb2xpY3lCTDogQ049
d2luMTEtc2lsbyxDTj1BdXRoTiBTaWxvcyxDTj1BdXRoTiBQb2xpY3kgDQpDb25maWd1cmF0
aW9uLENOPVNlcnZpY2VzLENOPUNvbmZpZ3VyYXRpb24sREM9ZXhhbXBsZSxEQz1uZXQNCm1z
RFMtU2VydmljZUF1dGhOUG9saWN5Qkw6IENOPXdpbjExLXNpbG8sQ049QXV0aE4gU2lsb3Ms
Q049QXV0aE4gUG9saWN5IA0KQ29uZmlndXJhdGlvbixDTj1TZXJ2aWNlcyxDTj1Db25maWd1
cmF0aW9uLERDPWV4YW1wbGUsREM9bmV0DQptc0RTLVVzZXJBdXRoTlBvbGljeUJMOiBDTj13
aW4xMS1zaWxvLENOPUF1dGhOIFNpbG9zLENOPUF1dGhOIFBvbGljeSANCkNvbmZpZ3VyYXRp
b24sQ049U2VydmljZXMsQ049Q29uZmlndXJhdGlvbixEQz1leGFtcGxlLERDPW5ldA0KDQpJ
bnNpZGUgdGhlIHBvbGljeSAoY29tcGFyaW5nIHRvIGEgV2luZG93cyBBRCkgSSBzdGlsbCBt
aXNzaW5nOg0KbXNEUy1Vc2VyQWxsb3dlZFRvQXV0aGVudGljYXRlRnJvbQ0KbXNEUy1TZXJ2
aWNlQWxsb3dlZFRvQXV0aGVudGljYXRlRnJvbQ0KSXQncyBub3QgcG9zc2libGUgdG8gc2V0
IHRoaXMgdmFsdWVzIHdpdGggc2FtYmEtdG9vbA0KDQo+IA0KPiANCj4gc2lsbywgd2luZG93
czoNCj4gDQo+PiBtc0RTLUFzc2lnbmVkQXV0aE5Qb2xpY3lTaWxvQkw6IA0KPj4gQ049V0lO
Q0xJRU5UMTEsT1U9ZmlybWEsREM9d2luZXhhbXBsZSxEQz1uZXQ+IG1zRFMtIA0KPj4gQXNz
aWduZWRBdXRoTlBvbGljeVNpbG9CTDogQ049c3Qga2EsT1U9ZmlybWEsREM9d2luZXhhbXBs
ZSxEQz1uZXQNCj4+IG1zRFMtQXNzaWduZWRBdXRoTlBvbGljeVNpbG9CTDogQ049V0lOMjAy
MixPVT1Eb21haW4gDQo+PiBDb250cm9sbGVycyxEQz13aW5leGFtcGxlIG1zRFMtVXNlckF1
dGhOUG9saWN5OiBDTj13aW4xMS0gDQo+PiBwb2xpY3ksQ049QXV0aE4gUG9saWNpZXMsQ049
QXV0aE4gUG9saWN5IENvbmZpZz4gIA0KPj4gdXJhdGlvbixDTj1TZXJ2aWNlcyxDTj1Db25m
aWd1cmF0aW9uLERDPXdpbmV4YW1wbGUsREM9bmV0DQo+PiBtc0RTLUNvbXB1dGVyQXV0aE5Q
b2xpY3k6IENOPXdpbjExLXBvbGljeSxDTj1BdXRoTiBQb2xpY2llcyxDTj1BdXRoTiANCj4+
IFBvbGljeSBDbw0KPj4gwqBuZmlndXJhdGlvbixDTj1TZXJ2aWNlcyxDTj1Db25maWd1cmF0
aW9uLERDPXdpbmV4YW1wbGUsREM9bmV0DQo+PiBtc0RTLVNlcnZpY2VBdXRoTlBvbGljeTog
Q049d2luMTEtcG9saWN5LENOPUF1dGhOIFBvbGljaWVzLENOPUF1dGhOIA0KPj4gUG9saWN5
IENvbg0KPj4gwqBmaWd1cmF0aW9uLENOPVNlcnZpY2VzLENOPUNvbmZpZ3VyYXRpb24sREM9
d2luZXhhbXBsZSxEQz1uZXQgDQo+IA0KPiBzaWxvLCBzYW1iYToNCj4gDQo+Pj4gbXNEUy1B
dXRoTlBvbGljeVNpbG9NZW1iZXJzOiBDTj1zdGthLE9VPWZpcm1hLERDPWV4YW1wbGUsREM9
bmV0DQo+Pj4gbXNEUy1BdXRoTlBvbGljeVNpbG9NZW1iZXJzOiBDTj1XSU5DTElFTlQxMSxP
VT1maXJtYSxEQz1leGFtcGxlLERDPW5ldA0KDQpTYW1iYSBzaWxvIG5ldzoNCm1zRFMtQ29t
cHV0ZXJBdXRoTlBvbGljeTogQ049d2luMTEtcG9saWN5LENOPUF1dGhOIFBvbGljaWVzLENO
PUF1dGhOIA0KUG9saWN5IENvbmZpZ3VyYXRpb24sQ049U2VydmljZXMsQ049Q29uZmlndXJh
dGlvbixEQz1leGFtcGxlLERDPW5ldA0KbXNEUy1TZXJ2aWNlQXV0aE5Qb2xpY3k6IENOPXdp
bjExLXBvbGljeSxDTj1BdXRoTiBQb2xpY2llcyxDTj1BdXRoTiANClBvbGljeSBDb25maWd1
cmF0aW9uLENOPVNlcnZpY2VzLENOPUNvbmZpZ3VyYXRpb24sREM9ZXhhbXBsZSxEQz1uZXQN
Cm1zRFMtVXNlckF1dGhOUG9saWN5OiBDTj13aW4xMS1wb2xpY3ksQ049QXV0aE4gUG9saWNp
ZXMsQ049QXV0aE4gUG9saWN5IA0KQ29uZmlndXJhdGlvbixDTj1TZXJ2aWNlcyxDTj1Db25m
aWd1cmF0aW9uLERDPWV4YW1wbGUsREM9bmV0DQoNCkknbSBtaXNzaW5nOg0KbXNEUy1Bc3Np
Z25lZEF1dGhOUG9saWN5U2lsb0JMIGZvciBhbGwgbWVtYmVycw0KSSBzZWUgaW4gdGhlIHNh
bWJhIHNpbG86DQptc0RTLUF1dGhOUG9saWN5U2lsb01lbWJlcnMgZm9yIGFsbCBtZW1iZXJz
DQo+IA0KPiANCj4gdXNlciwgd2luZG93czoNCj4gDQo+PiBtc0RTLUFzc2lnbmVkQXV0aE5Q
b2xpY3lTaWxvOiBDTj13aW4xMS1zaWxvLENOPUF1dGhOIFNpbG9zLENOPUF1dGhOIA0KPj4g
UG9saWN5IENvbg0KPj4gwqBmaWd1cmF0aW9uLENOPVNlcnZpY2VzLENOPUNvbmZpZ3VyYXRp
b24sREM9d2luZXhhbXBsZSxEQz1uZXQNCj4+IG1zRFMtQXV0aE5Qb2xpY3lTaWxvTWVtYmVy
c0JMOiBDTj13aW4xMS1zaWxvLENOPUF1dGhOIFNpbG9zLENOPUF1dGhOIA0KPj4gUG9saWN5
IENvDQo+PiDCoG5maWd1cmF0aW9uLENOPVNlcnZpY2VzLENOPUNvbmZpZ3VyYXRpb24sREM9
d2luZXhhbXBsZSxEQz1uZXQgDQo+IA0KPiB1c2VyLCBzYW1iYToNCj4gDQo+Pj4gbXNEUy1B
dXRoTlBvbGljeVNpbG9NZW1iZXJzQkw6IENOPXdpbjExLXNpbG8sQ049QXV0aE4gU2lsb3Ms
Q049QXV0aE4gDQo+Pj4gUG9saWN5IENvDQo+Pj4gwqBuZmlndXJhdGlvbixDTj1TZXJ2aWNl
cyxDTj1Db25maWd1cmF0aW9uLERDPWV4YW1wbGUsREM9bmV0DQo+Pj4gbXNEUy1Bc3NpZ25l
ZEF1dGhOUG9saWN5OiBDTj13aW4xMS1wb2xpY3ksQ049QXV0aE4gUG9saWNpZXMsQ049QXV0
aE4gDQo+Pj4gUG9saWN5IENvDQo+Pj4gwqBuZmlndXJhdGlvbixDTj1TZXJ2aWNlcyxDTj1D
b25maWd1cmF0aW9uLERDPWV4YW1wbGUsREM9bmV0DQo+IA0KPiANCj4gY29tcHV0ZXIsIHdp
bmRvd3M6DQo+IA0KPj4gbXNEUy1Bc3NpZ25lZEF1dGhOUG9saWN5U2lsbzogQ049d2luMTEt
c2lsbyxDTj1BdXRoTiBTaWxvcyxDTj1BdXRoTiANCj4+IFBvbGljeSBDb24NCj4+IMKgZmln
dXJhdGlvbixDTj1TZXJ2aWNlcyxDTj1Db25maWd1cmF0aW9uLERDPXdpbmV4YW1wbGUsREM9
bmV0DQo+PiBtc0RTLUF1dGhOUG9saWN5U2lsb01lbWJlcnNCTDogQ049d2luMTEtc2lsbyxD
Tj1BdXRoTiBTaWxvcyxDTj1BdXRoTiANCj4+IFBvbGljeSBDbw0KPj4gwqBuZmlndXJhdGlv
bixDTj1TZXJ2aWNlcyxDTj1Db25maWd1cmF0aW9uLERDPXdpbmV4YW1wbGUsREM9bmV0IA0K
PiANCj4gY29tcHV0ZXIsIHNhbWJhOg0KPiANCj4+PiBtc0RTLUF1dGhOUG9saWN5U2lsb01l
bWJlcnNCTDogQ049d2luMTEtc2lsbyxDTj1BdXRoTiBTaWxvcyxDTj1BdXRoTiANCj4+PiBQ
b2xpY3kgQ28NCj4+PiDCoG5maWd1cmF0aW9uLENOPVNlcnZpY2VzLENOPUNvbmZpZ3VyYXRp
b24sREM9ZXhhbXBsZSxEQz1uZXQNCj4+PiBtc0RTLUFzc2lnbmVkQXV0aE5Qb2xpY3k6IENO
PXdpbjExLXBvbGljeSxDTj1BdXRoTiBQb2xpY2llcyxDTj1BdXRoTiANCj4+PiBQb2xpY3kg
Q28NCj4+PiDCoG5maWd1cmF0aW9uLENOPVNlcnZpY2VzLENOPUNvbmZpZ3VyYXRpb24sREM9
ZXhhbXBsZSxEQz1uZXQgDQo+IA0KPiANCj4gRG91Z2xhcw0KPiANClNvIHN0aWxsIG5vdCB3
b3JraW5nDQoNClN0ZWZhbg0K
--------------ExrxPq34dwDSLfY4TegBnOE0
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

--------------ExrxPq34dwDSLfY4TegBnOE0--

--------------T0v1Sy0yhxSrXqm4JRj0JL0U--

--------------L0r6EPalHFwhZbo4GGYX4HUq
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQRsT9azWR5AolaZQIFS9tTdG7aKtQUCZykSEgUDAAAAAAAKCRBS9tTdG7aKtavE
AP49xSolQ9Bmsn/FeqSkm//CKls0xWVcqgcCghJWYaZouAD9GzD5SFFOUtwvpy4jVWnToeROTS4z
Sg5D3KEYHzAF0AE=
=Berz
-----END PGP SIGNATURE-----

--------------L0r6EPalHFwhZbo4GGYX4HUq--

