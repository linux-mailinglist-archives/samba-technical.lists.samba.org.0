Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id BAD9F9BF146
	for <lists+samba-technical@lfdr.de>; Wed,  6 Nov 2024 16:11:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=97OjT2J3RYy071eJ6yAGglcn/ghpJm5FoLhb7WcMU2c=; b=Hx9MxfKyosVLV8l1125RJ5dhck
	bezCagFRnj/lyIXcDHpOlsUgOIwC69N2jMHcRypumpbNkc2d7BjPqPuV4mHhmbHmGpgGerVAok0S+
	ceXbbbsb/soV+MENvRji0Qgd6/yThdPwU3Y/iSx+M43mCQx2ur+LN/JgAJSAJTzBwK+yDo9lpUk1H
	ohShC8pvhEMnzsGsdEWEx7O55HIBmWW+siRNCnZlyYB/qZ4FOr4yapnHYZzo3btqmSq2Gy2RYoFNx
	xVqfb6WU+XGSFZ93klxVLzUshTc5l1RzAWlsFQOUFmLKxjWAxtTy1v03m0KJ6J4Ug9CYo1cHvgqA1
	oumGb/EQ==;
Received: from ip6-localhost ([::1]:23078 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1t8hfx-007zgX-Ku; Wed, 06 Nov 2024 15:10:29 +0000
Received: from plasma6.jpberlin.de ([80.241.56.68]:56107) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1t8hfr-007zgO-GA
 for samba-technical@lists.samba.org; Wed, 06 Nov 2024 15:10:27 +0000
Received: from spamfilter06.heinlein-hosting.de
 (spamfilter06.heinlein-hosting.de [80.241.56.125])
 by plasma.jpberlin.de (Postfix) with ESMTP id A9762A6C36;
 Wed,  6 Nov 2024 16:10:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kania-online.de;
 s=MBO0001; t=1730905818;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=97OjT2J3RYy071eJ6yAGglcn/ghpJm5FoLhb7WcMU2c=;
 b=y9yRVFygjCnOC5juuUEJ0WdV2VH6y+lSZLyG6AxGv8Jhs9pQmMunHGBvWg6U/eZaQEsLJy
 rZCgRAW5lg7CUkltDmInEditCLqsq75nyDoKvG5DBFENhoF0XYp8nqNwm/hqEMqZcPBqh1
 cu2K07JgIPRZjSrwNCe2TO0xV68zrvVww1zv8kWQLeT9mVFxcNyZQ0g4p9wohPCFLCtS5w
 TkfQXdu05/8dDh8TmrpaQrFHAPY4LHdH7K+ps3fgPiKqCH/aLpII1e7Cj67TRYW8dnkgfz
 RuwcJmxdZfFW+G/o8Bh/P0YHXuBb2Sx80iTN1JlHbaHOGzXQPnxEZ9HJqpxJzA==
Received: from plasma.jpberlin.de ([80.241.56.68])
 by spamfilter06.heinlein-hosting.de (spamfilter06.heinlein-hosting.de
 [80.241.56.125]) (amavisd-new, port 10030)
 with ESMTP id LXAuYlQ0g_Uu; Wed,  6 Nov 2024 16:10:09 +0100 (CET)
Received: from [192.168.123.203] (p5b240946.dip0.t-ipconnect.de [91.36.9.70])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 (Authenticated sender: stefan@kania-online.de)
 by plasma.jpberlin.de (Postfix) with ESMTPSA id A77DFAB73B;
 Wed,  6 Nov 2024 16:10:08 +0100 (CET)
Message-ID: <422547d8-1f23-4376-86ce-6a5f7145284b@kania-online.de>
Date: Wed, 6 Nov 2024 16:10:07 +0100
MIME-Version: 1.0
Subject: Re: authentication policies in Samba 4.21
To: Jennifer Sutton <jsutton@samba.org>, samba-technical@lists.samba.org
References: <df1213a5-5153-463b-bacd-5d93ff8d2f6b@kania-online.de>
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
 <32bc3d0e-212f-4c73-a758-014e913abaf6@kania-online.de>
 <5784a449-b6e9-4aa4-9198-5f176b7dd3ca@samba.org>
Content-Language: en-US, de-DE
Organization: Stefan Kania
In-Reply-To: <5784a449-b6e9-4aa4-9198-5f176b7dd3ca@samba.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------anSqDdzVdw2DeH0HLYrqUXJS"
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
--------------anSqDdzVdw2DeH0HLYrqUXJS
Content-Type: multipart/mixed; boundary="------------rHBvZ9qQQb65gtj09q8CI1nr";
 protected-headers="v1"
From: Stefan Kania <stefan@kania-online.de>
To: Jennifer Sutton <jsutton@samba.org>, samba-technical@lists.samba.org
Message-ID: <422547d8-1f23-4376-86ce-6a5f7145284b@kania-online.de>
Subject: Re: authentication policies in Samba 4.21
References: <df1213a5-5153-463b-bacd-5d93ff8d2f6b@kania-online.de>
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
 <32bc3d0e-212f-4c73-a758-014e913abaf6@kania-online.de>
 <5784a449-b6e9-4aa4-9198-5f176b7dd3ca@samba.org>
In-Reply-To: <5784a449-b6e9-4aa4-9198-5f176b7dd3ca@samba.org>

--------------rHBvZ9qQQb65gtj09q8CI1nr
Content-Type: multipart/mixed; boundary="------------qiuaVIXFlPnBAPe9lNXa06GW"

--------------qiuaVIXFlPnBAPe9lNXa06GW
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgSmVubmlmZXIsDQoNCg0KQW0gMDUuMTEuMjQgdW0gMjM6MjIgc2NocmllYiBKZW5uaWZl
ciBTdXR0b24gdmlhIHNhbWJhLXRlY2huaWNhbDoNCj4gT24gNi8xMS8yNCA1OjQzIGFtLCBT
dGVmYW4gS2FuaWEgdmlhIHNhbWJhLXRlY2huaWNhbCB3cm90ZToNCj4+DQo+Pg0KPj4gQW0g
MDUuMTEuMjQgdW0gMTE6MTMgc2NocmllYiBTdGVmYW4gS2FuaWEgdmlhIHNhbWJhLXRlY2hu
aWNhbDoNCj4+PiBIaSBKZW5uaWZlcg0KPj4+DQo+Pj4gQW0gMDQuMTEuMjQgdW0gMjE6MjIg
c2NocmllYiBKZW5uaWZlciBTdXR0b24gdmlhIHNhbWJhLXRlY2huaWNhbDoNCj4+Pj4gT24g
NS8xMS8yNCA3OjI3IGFtLCBTdGVmYW4gS2FuaWEgdmlhIHNhbWJhLXRlY2huaWNhbCB3cm90
ZToNCj4+Pj4+IEluc2lkZSB0aGUgcG9saWN5IChjb21wYXJpbmcgdG8gYSBXaW5kb3dzIEFE
KSBJIHN0aWxsIG1pc3Npbmc6DQo+Pj4+PiBtc0RTLVVzZXJBbGxvd2VkVG9BdXRoZW50aWNh
dGVGcm9tDQo+Pj4+PiBtc0RTLVNlcnZpY2VBbGxvd2VkVG9BdXRoZW50aWNhdGVGcm9tDQo+
Pj4+PiBJdCdzIG5vdCBwb3NzaWJsZSB0byBzZXQgdGhpcyB2YWx1ZXMgd2l0aCBzYW1iYS10
b29sDQo+Pj4+DQo+Pj4+IEhhdmUgeW91IHRyaWVkIC0tdXNlci1hbGxvd2VkLXRvLWF1dGhl
bnRpY2F0ZS1mcm9tPVNEREwgYW5kIC0tIA0KPj4+PiBzZXJ2aWNlLSBhbGxvd2VkLXRvLWF1
dGhlbnRpY2F0ZS1mcm9tPVNEREw/DQo+Pj4+DQo+Pj4gTm8sIG5vdCB1cCB0byBub3cuIEJ1
dCBub3cgSSBjaGFuZ2VkIHRoZSBzZXR0aW5ncy4gT24gYm90aCwgdGhlIA0KPj4+IHdpbmRv
d3MgQUQgYW5kIHRoZSBTYW1iYSBBRCBhbGwgdGhlIHNldHRpbmdzIGFyZSB0aGUgc2FtZSwg
YnV0IHN0aWxsIA0KPj4+IG5vdCB3b3JraW5nIHdpdGggU2FtYmEgQUQuDQo+Pj4gVGhlIHVz
ZXIgd2hvIGlzIGEgbWVtYmVyIG9mIHRoZSBzaWxvIGNhbid0IGxvZ2luIG9uIHRoZSBjb21w
dXRlciB3aG8gDQo+Pj4gaXMgbWVtYmVyIG9mIHRoZSBzaWxvIEJVVCBoZSBhbHNvIGNhbid0
IGxvZ2luIHRvIGFueSBvdGhlciBjb21wdXRlciANCj4+PiBpbiB0aGUgZG9tYWluLiBIZSBp
cyBnZXR0aW5nIHRoZSBzYW1lIG1lc3NhZ2UsIHRoYXQgaGUgaXMgbm90IGFsbG93ZWQgDQo+
Pj4gdG8gbG9naW4gb24gdGhpcyBjb21wdXRlciAod2hhdCBpcyByaWdodCBmb3IgdGhlIGNv
bXB1dGVyIHdobyBpcyANCj4+PiBtZW1iZXIgb2YgdGhlIHNpbG8pLiBCVFcgbm93IGl0J3Mg
dGhlIGZpcnN0IHRpbWUgSSdtIGdldHRpbmcgdGhlIA0KPj4+IGNvcnJlY3QgbWVzc2FnZS4N
Cj4+Pg0KPj4+IEFsbCBvdGhlciB1c2VycyBjYW4ndCBhbHNvIG5vdCBsb2dpbiB0byB0aGUg
Y29tcHV0ZXIgZnJvbSB0aGUgc2lsbywgDQo+Pj4gYnV0IG9uIGFueSBvdGhlciBjb21wdXRl
ci4gR2V0dGluZyBhIG1lc3NhZ2UgIlRoaXMgY29tcHV0ZXIgaXMgDQo+Pj4gcHJvdGVjdGVk
IHdpdGggYSBhdXRoZW50aWNhaW5maXJld2FsbCIuDQo+Pj4NCj4gDQo+IENhbiB5b3UgcG9z
dCB0aGUgU0RETCB5b3XigJl2ZSBzZXQgb24gdGhlIGF1dGhlbnRpY2F0aW9uIHBvbGljeT8N
ClllcywgaGVyZSB0aGV5IGFyZToNCi0tLS0tLS0tLS0tLS0tLS0tLS0tDQogICAibXNEUy1D
b21wdXRlckFsbG93ZWRUb0F1dGhlbnRpY2F0ZVRvIjogDQoiTzpTWUc6U1lEOihYQTtPSUNJ
O0NSOzs7V0Q7KEBVU0VSLmFkOi8vZXh0L0F1dGhlbnRpY2F0aW9uU2lsbyA9PSANClwid2lu
MTEtc2lsb1wiKSkiLA0KDQogICAibXNEUy1TZXJ2aWNlQWxsb3dlZFRvQXV0aGVudGljYXRl
RnJvbSI6IA0KIk86U1lHOlNZRDooWEE7T0lDSTtDUjs7O1dEOyhAVVNFUi5hZDovL2V4dC9B
dXRoZW50aWNhdGlvblNpbG8gPT0gDQpcIndpbjExLXNpbG9cIikpIiwNCg0KICAgIm1zRFMt
U2VydmljZUFsbG93ZWRUb0F1dGhlbnRpY2F0ZVRvIjogDQoiTzpTWUc6U1lEOihYQTtPSUNJ
O0NSOzs7V0Q7KEBVU0VSLmFkOi8vZXh0L0F1dGhlbnRpY2F0aW9uU2lsbyA9PSANClwid2lu
MTEtc2lsb1wiKSkiLA0KDQogICAibXNEUy1Vc2VyQWxsb3dlZFRvQXV0aGVudGljYXRlRnJv
bSI6IA0KIk86U1lHOlNZRDooWEE7T0lDSTtDUjs7O1dEOyhAVVNFUi5hZDovL2V4dC9BdXRo
ZW50aWNhdGlvblNpbG8gPT0gDQpcIndpbjExLXNpbG9cIikpIiwNCg0KICAgIm1zRFMtVXNl
ckFsbG93ZWRUb0F1dGhlbnRpY2F0ZVRvIjogDQoiTzpTWUc6U1lEOihYQTtPSUNJO0NSOzs7
V0Q7KEBVU0VSLmFkOi8vZXh0L0F1dGhlbnRpY2F0aW9uU2lsbyA9PSANClwid2luMTEtc2ls
b1wiKSkiLA0KDQotLS0tLS0tLS0tLS0tLS0tLS0tLQ0KRXhhY3RseSB0aGUgc2FtZSBhcyBp
biBteSBXaW5kb3dzIEFEDQoNCj4gDQo+Pj4NCj4+Pj4+DQo+Pj4+PiBJJ20gbWlzc2luZzoN
Cj4+Pj4+IG1zRFMtQXNzaWduZWRBdXRoTlBvbGljeVNpbG9CTCBmb3IgYWxsIG1lbWJlcnMN
Cj4+Pj4NCj4+Pj4gWW91IGRvbuKAmXQgc2V0IHRoaXMgb24gdGhlIHNpbG8uIFlvdSBhc3Np
Z24gdGhlIG1lbWJlcnMgdG8gdGhlIHNpbG8gDQo+Pj4+IHdpdGgg4oCYc2FtYmEtdG9vbCB1
c2VyIGF1dGggc2lsbyBhc3NpZ24gPHVzZXJuYW1lPiBbb3B0aW9uc13igJkuDQo+Pj4gSSBr
bm93LCBidXQgdGhpcyBpcyBzdGlsbCB0aGUgb25seSBhdHRyaWJ1dGUgdGhhdCBpcyBzZXQg
aW4gdGhlIA0KPj4+IHdpbmRvd3MgQUQgYnV0IG5vdCBpbiB0aGUgU2FtYmEgQUQuDQo+Pg0K
Pj4gRm91bmQgc29tZXRoaW5nIG1vcmU6IGlmIHlvdSB0YWtlIGEgbG9vayBhdCB0aGUgc2ls
byBmcm9tIG15IA0KPj4gTWljcm9zb2Z0LUFEIHlvdSBzZWU6DQo+PiBtc0RTLUFzc2lnbmVk
QXV0aE5Qb2xpY3lTaWxvQkw6IA0KPj4gQ049V0lOQ0xJRU5UMTEsT1U9ZmlybWEsREM9d2lu
ZXhhbXBsZSxEQz1uZXQNCj4+DQo+PiBtc0RTLUFzc2lnbmVkQXV0aE5Qb2xpY3lTaWxvQkw6
DQo+PiBDTj1zdGthLE9VPWZpcm1hLERDPXdpbmV4YW1wbGUsREM9bmV0DQo+Pg0KPj4gbXNE
Uy1Bc3NpZ25lZEF1dGhOUG9saWN5U2lsb0JMOg0KPj4gQ049V0lOMjAyMixPVT1Eb21haW4g
Q29udHJvbGxlcnMsREM9d2luZXhhbXBsZSAsREM9bmV0DQo+Pg0KPj4gLS0tLS0tLS0tLS0t
DQo+Pg0KPj4gbXNEUy1BdXRoTlBvbGljeVNpbG9NZW1iZXJzOg0KPj4gQ049V0lOQ0xJRU5U
MTEsT1U9ZmlybWEsREM9d2luZXhhbXBsZSxEQz1uZXQNCj4+DQo+PiBtc0RTLUF1dGhOUG9s
aWN5U2lsb01lbWJlcnM6DQo+PiBDTj1zdCBrYSxPVT1maXJtYSxEQz13aW5leGFtcGxlLERD
PW5ldA0KPj4NCj4+DQo+PiBUaGUgRG9tYWluY29udHJvbGxlciAoV0lOMjAyMikgaXMgbGlz
dGVkIHdpdGggdGhlIGF0dHJpYnV0ZSBtc0RTLSANCj4+IEFzc2lnbmVkQXV0aE5Qb2xpY3lT
aWxvQkwsIGJ1dCB0aGUgREMgaXMgTk9UIGEgbWVtYmVyIG9mIHRoZSBzaWxvLiANCj4+IE9u
bHkgdGhlIHVzZXIgYW5kIHRoZSBjb21wdXRlci4NCj4+DQo+PiBJIHRyaWVkIHRvIGFzc2ln
biB0aGUgREMgdG8gdGhlIHBvbGljeSBhbmQgbWFrZSBpdCBhIG1lbWJlciBvZiB0aGUgDQo+
PiBzaWxvLCBubyBjaGFuZ2VzLg0KPj4gU28gc3RpbGwgdGhlIG9ubHkgZGlmZmVyZW5jZSBi
ZXR3ZWVuIHdpbmRvd3MgYW5kIHNhbWJhIGlzIHRoZSBtaXNzaW5nIA0KPj4gYXR0cmlidXRl
wqAgbXNEUy1Bc3NpZ25lZEF1dGhOUG9saWN5U2lsb0JMIGZvciBhbGwgbWVtYmVycyBhbmQg
dGhlIERDLg0KPiANCj4gWW91IGNhbiBkaXNyZWdhcmQgdGhlIG1zRFMtQXNzaWduZWRBdXRo
TlBvbGljeVNpbG9CTCBhdHRyaWJ1dGU7IGl04oCZcyBub3QgDQo+IHVzZWQgZm9yIGFueXRo
aW5nLiBUaGUgaW1wb3J0YW50IG9uZSBpcyBtc0RTLUFzc2lnbmVkQXV0aE5Qb2xpY3lTaWxv
LCANCj4gd2hpY2ggc2hvdWxkIGJlIHNldCBvbiB0aGUgbWVtYmVycyBvZiB0aGUgc2lsby4N
Ck9rLCBpdCBhbHNvIGxvb2tzIHN0cmFuZ2UgZm9yIG1lLiBJdCBtYWtlcyBubyBzZW5zLCBi
dXQgYXMgSSBzYWlkIHRoYXQncyANCnRoZSBvbmx5IGRpZmZlcmVuY2UgdG8gdGhlIFNhbWJh
LUFEIEFORCB0aGUgb25seSBwbGFjZSB3ZXJlIHRoZSBEQyBpcyB1c2VkLg0KDQpTdGVmYW4N
Cg0KPiANCj4gQ2hlZXJzLA0KPiBKZW5uaWZlciAoc2hlL2hlcikNCj4gDQo+IA0KDQotLSAN
ClN0ZWZhbiBLYW5pYQ0KTGFuZHdlZyAxMw0KMjU2OTMgU3QuIE1pY2hhZWxpc2Rvbm4NCg0K
LS0tLS0tLS0tLS0tLS0tLS0tLS0tDQpFcyBnaWJ0IGtlaW5lIFdPTEtFLCBudXIgZGllIENv
bXB1dGVyIGZyZW1kZXIgTGV1dGUNCg0K
--------------qiuaVIXFlPnBAPe9lNXa06GW
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

--------------qiuaVIXFlPnBAPe9lNXa06GW--

--------------rHBvZ9qQQb65gtj09q8CI1nr--

--------------anSqDdzVdw2DeH0HLYrqUXJS
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnoEABYIACMWIQRsT9azWR5AolaZQIFS9tTdG7aKtQUCZyuGzwUDAAAAAAAKCRBS9tTdG7aKtVvD
AP4nlq6fHGFFZ5Fh34sl5xQEph42mzKe6B1qEVmG+qz7iwD1EHwWjSwGTeD58LHLC74GpwanI9pY
dXie95AZQ/YeBw==
=NZYj
-----END PGP SIGNATURE-----

--------------anSqDdzVdw2DeH0HLYrqUXJS--

