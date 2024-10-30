Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B238B9B6C57
	for <lists+samba-technical@lfdr.de>; Wed, 30 Oct 2024 19:56:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=Rotg9g8j3OkGzHiopMhgJQfvsnHKfFTUd72GBHI4K/k=; b=OoYjq7im0Cy1ff8m6IPYKBAbht
	54ZyS5M88JF4S/36jVgWVCWagR03hR+GOoEJNNw2EY2OEum0qzrUrg+dYoLVidLM3Sb/tCj/5I7Nk
	SGknoEc89lRQNPvKWlHjQr6WJUnh8FXmN1PAeG7gfv7FEHIAEYRpHYAZbdK+/lktQvJNnYqShGcJo
	KZZSxd/2mXhegPo1Ullpww3lSEG7DKFZK94WoGn7O2IrU0G4v1Mrwu/1xUOfS14bCuyY9OfEVYzf1
	Q23QjWbhIqCg+IAG+5HSsiNkQiAe4GA9jUIM/P0P/iGkFvih1bMu/ftRYdt2vNjXkBckADryhLXB1
	bvlgJdAg==;
Received: from ip6-localhost ([::1]:41958 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1t6Drm-005bh7-3P; Wed, 30 Oct 2024 18:56:26 +0000
Received: from plasma6.jpberlin.de ([80.241.56.68]:47173) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1t6Drh-005bh0-S1
 for samba-technical@lists.samba.org; Wed, 30 Oct 2024 18:56:24 +0000
Received: from spamfilter02.heinlein-hosting.de
 (spamfilter02.heinlein-hosting.de [80.241.56.116])
 by plasma.jpberlin.de (Postfix) with ESMTP id 5370FAB640;
 Wed, 30 Oct 2024 19:56:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kania-online.de;
 s=MBO0001; t=1730314577;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=Rotg9g8j3OkGzHiopMhgJQfvsnHKfFTUd72GBHI4K/k=;
 b=CUBNvQaD5VJEHjKhFFKk0Fa+2voPunuax/U6d19CcnQKd+hsRvnhT9tHNE8836ApjymjgG
 8A2yG3xWu2Zds+p9TE61Kg2ODFNgujIn+CQ3psS7D6pyuAe14QtcT3mTzCJC+k7b8iZgK3
 qNjIo5YxIlF8LQ5lhrmJ8pNpnHTOYcrfUUmaHu3h9Gm+4F92K15RHPZwhal/ijpUyUK9Yf
 vU+q3PzfYCWMP0vHXKBe7z8nIsPKj0y7Aev1bzrgOg06++6NIEICxIRfI5LO4R+FdktwnF
 wl2hq5PA07yPYuicmucly9pmewCZyP6n3LrOSE9tXWPjcirdGFplq7fFxKOW7w==
Received: from plasma.jpberlin.de ([80.241.56.68])
 by spamfilter02.heinlein-hosting.de (spamfilter02.heinlein-hosting.de
 [80.241.56.116]) (amavisd-new, port 10030)
 with ESMTP id kAVe34nrrBpK; Wed, 30 Oct 2024 19:56:09 +0100 (CET)
Received: from [192.168.123.203] (p5b240946.dip0.t-ipconnect.de [91.36.9.70])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 (Authenticated sender: stefan@kania-online.de)
 by plasma.jpberlin.de (Postfix) with ESMTPSA id 5C603AC4F8
 for <samba-technical@lists.samba.org>; Wed, 30 Oct 2024 19:56:09 +0100 (CET)
Message-ID: <5b45562a-4bc5-4adb-9f75-d3c91a08d719@kania-online.de>
Date: Wed, 30 Oct 2024 19:56:08 +0100
MIME-Version: 1.0
To: samba-technical@lists.samba.org
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
 <20241030171507.5d092646@devstation.samdom.example.com>
 <920d8e6f-2215-427c-a6f6-e515bbb6cad8@kania-online.de>
 <20241030183355.6de5092a@devstation.samdom.example.com>
Content-Language: en-US, de-DE
Organization: Stefan Kania
Subject: Re: authentication policies in Samba 4.21
In-Reply-To: <20241030183355.6de5092a@devstation.samdom.example.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------NJV84FrwX6VUJOpG0YMfv9XL"
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
--------------NJV84FrwX6VUJOpG0YMfv9XL
Content-Type: multipart/mixed; boundary="------------cVh0xngBc5sqGfZTnVb9p0te";
 protected-headers="v1"
From: Stefan Kania <stefan@kania-online.de>
To: samba-technical@lists.samba.org
Message-ID: <5b45562a-4bc5-4adb-9f75-d3c91a08d719@kania-online.de>
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
 <20241030171507.5d092646@devstation.samdom.example.com>
 <920d8e6f-2215-427c-a6f6-e515bbb6cad8@kania-online.de>
 <20241030183355.6de5092a@devstation.samdom.example.com>
In-Reply-To: <20241030183355.6de5092a@devstation.samdom.example.com>

--------------cVh0xngBc5sqGfZTnVb9p0te
Content-Type: multipart/mixed; boundary="------------1W3mELEGSklgbD0B6sp0CykM"

--------------1W3mELEGSklgbD0B6sp0CykM
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

DQoNCkFtIDMwLjEwLjI0IHVtIDE5OjMzIHNjaHJpZWIgUm93bGFuZCBQZW5ueSB2aWEgc2Ft
YmEtdGVjaG5pY2FsOg0KPiBPbiBXZWQsIDMwIE9jdCAyMDI0IDE5OjE2OjUzICswMTAwDQo+
IFN0ZWZhbiBLYW5pYSB2aWEgc2FtYmEtdGVjaG5pY2FsIDxzYW1iYS10ZWNobmljYWxAbGlz
dHMuc2FtYmEub3JnPg0KPiB3cm90ZToNCj4gDQo+Pg0KPj4gQW0gMzAuMTAuMjQgdW0gMTg6
MTUgc2NocmllYiBSb3dsYW5kIFBlbm55IHZpYSBzYW1iYS10ZWNobmljYWw6DQo+Pj4gVHJ5
IGFkZGluZyAnLS1zaG93LWJpbmFyeScgdG8gdGhlIGxkYnNlYXJjaCBjb21tYW5kDQo+Pg0K
Pj4gTm8sIEkgb25seSBnZXQgYW4gZW1wdHkgc3RyaW5nLiBJIHRoaW5rIHRoZSBwcm9ibGVt
IGlzLCB0aGF0IHRoZQ0KPj4gYmluYXJ5IGlzIGNvbnZlcnRlZCB0byBiYXNlNjQgaWYgbGlz
dGVkIHdpdGggbGRic2VhcmNoLg0KPj4NCj4+IHJvb3RAZGViY2xpZW50On4jIGxkYnNlYXJj
aCAtSCBsZGFwOi8vd2luMjAyMi53aW5leGFtcGxlLm5ldA0KPj4gJ0NOPXdpbjExLXBvbGlj
eScgLS1jcm9zcy1uY3MgIG1zRFMtVXNlckFsbG93ZWRUb0F1dGhlbnRpY2F0ZVRvICAtVQ0K
Pj4gYWRtaW5pc3RyYXRvciAtLXNob3ctYmluYXJ5DQo+PiBQYXNzd29yZCBmb3IgW1dJTkVY
QU1QTEVcYWRtaW5pc3RyYXRvcl06DQo+PiAjIHJlY29yZCAxDQo+PiBkbjogQ049d2luMTEt
cG9saWN5LENOPUF1dGhOIFBvbGljaWVzLENOPUF1dGhOIFBvbGljeQ0KPj4gQ29uZmlndXJh
dGlvbixDTj1TZXJ2aWNlcyxDTj1Db25maWd1cmF0aW9uLERDPXdpbmV4YW1wbGUsREM9bmV0
DQo+PiBtc0RTLVVzZXJBbGxvd2VkVG9BdXRoZW50aWNhdGVUbzoNCj4+ICAgIA0KPj4NCj4+
DQo+PiAjIHJldHVybmVkIDEgcmVjb3Jkcw0KPj4gIyAxIGVudHJpZXMNCj4+ICMgMCByZWZl
cnJhbHMNCj4+DQo+PiBTdGVmYW4NCj4+DQo+Pg0KPj4NCj4gDQo+IFN0cmFuZ2UsIGl0IHdv
cmtzIGZvciBteXNlbGYsIGV4YW1wbGU6DQo+IA0KPiBzdWRvIGxkYnNlYXJjaCAtSCAvdmFy
L2xpYi9zYW1iYS9wcml2YXRlL3NhbS5sZGIgLWINCj4gIkRDPUZvcmVzdERuc1pvbmVzLGRj
PXNhbWRvbSxkYz1leGFtcGxlLGRjPWNvbSIgLXMgc3ViICcob2JqZWN0Y2xhc3M9KiknDQo+
IA0KPiBQcm9kdWNlcw0KPiANCj4gLi4uLi4uLi4uLi4uLi4uDQo+ICMgcmVjb3JkIDE5DQo+
IGRuOiBEQz1fa2VyYmVyb3MuX3RjcC5kYyxEQz1fbXNkY3Muc2FtZG9tLmV4YW1wbGUuY29t
LENOPU1pY3Jvc29mdEROUyxEQz1Gb3Jlc3REbnNab25lcyxEQz1zYW1kb20sREM9ZXhhbXBs
ZSxEQz1jb20NCj4gb2JqZWN0Q2xhc3M6IHRvcA0KPiBvYmplY3RDbGFzczogZG5zTm9kZQ0K
PiBpbnN0YW5jZVR5cGU6IDQNCj4gd2hlbkNyZWF0ZWQ6IDIwMjIwOTEwMDc0MzE5LjBaDQo+
IHVTTkNyZWF0ZWQ6IDU1MTUNCj4gc2hvd0luQWR2YW5jZWRWaWV3T25seTogVFJVRQ0KPiBu
YW1lOiBfa2VyYmVyb3MuX3RjcC5kYw0KPiBvYmplY3RHVUlEOiA0Y2MzZTEzYS1jZWUyLTQ2
YzMtODY4Zi00NTllY2NiNDNlY2MNCj4gb2JqZWN0Q2F0ZWdvcnk6IENOPURucy1Ob2RlLENO
PVNjaGVtYSxDTj1Db25maWd1cmF0aW9uLERDPXNhbWRvbSxEQz1leGFtcGxlLERDDQo+ICAg
PWNvbQ0KPiBkYzogX2tlcmJlcm9zLl90Y3AuZGMNCj4gZG5zUmVjb3JkOjogSXdBaEFBWHdB
QUJ1QUFBQUFBQURoQUFBQUFBQUFBQUFBQUFBWkFCWUd3UUdjbkJwWkdNeUJuTmhiV1J2YlFk
bGVHDQo+ICAgRnRjR3hsQTJOdmJRQT0NCj4gZG5zUmVjb3JkOjogSXdBaEFBWHdBQUJ1QUFB
QUFBQURoQUFBQUFBQUFBQUFBQUFBWkFCWUd3UUdjbkJwWkdNeEJuTmhiV1J2YlFkbGVHDQo+
ICAgRnRjR3hsQTJOdmJRQT0NCj4gZG5zUmVjb3JkOjogSXdBaEFBWHdBQUJ0QUFBQUFBQURo
QUFBQUFBQUFBQUFBQUFBWkFCWUd3UUdkRzF3WkdNeEJuTmhiV1J2YlFkbGVHDQo+ICAgRnRj
R3hsQTJOdmJRQT0NCj4gd2hlbkNoYW5nZWQ6IDIwMjMxMDE5MTAyODQ2LjBaDQo+IHVTTkNo
YW5nZWQ6IDU2MTgNCj4gZGlzdGluZ3Vpc2hlZE5hbWU6IERDPV9rZXJiZXJvcy5fdGNwLmRj
LERDPV9tc2Rjcy5zYW1kb20uZXhhbXBsZS5jb20sQ049TWljcm9zDQo+ICAgb2Z0RE5TLERD
PUZvcmVzdERuc1pvbmVzLERDPXNhbWRvbSxEQz1leGFtcGxlLERDPWNvbQ0KPiANCj4gQnV0
Og0KPiANCj4gc3VkbyBsZGJzZWFyY2ggLS1zaG93LWJpbmFyeSAtSCAvdmFyL2xpYi9zYW1i
YS9wcml2YXRlL3NhbS5sZGIgLWINCj4gIkRDPUZvcmVzdERuc1pvbmVzLGRjPXNhbWRvbSxk
Yz1leGFtcGxlLGRjPWNvbSIgLXMgc3ViICcob2JqZWN0Y2xhc3M9KiknDQo+IA0KPiBQcm9k
dWNlcw0KPiANCj4gIyByZWNvcmQgMTkNCj4gZG46IERDPV9rZXJiZXJvcy5fdGNwLmRjLERD
PV9tc2Rjcy5zYW1kb20uZXhhbXBsZS5jb20sQ049TWljcm9zb2Z0RE5TLERDPUZvcmVzdERu
c1pvbmVzLERDPXNhbWRvbSxEQz1leGFtcGxlLERDPWNvbQ0KPiBvYmplY3RDbGFzczogdG9w
DQo+IG9iamVjdENsYXNzOiBkbnNOb2RlDQo+IGluc3RhbmNlVHlwZTogNA0KPiB3aGVuQ3Jl
YXRlZDogMjAyMjA5MTAwNzQzMTkuMFoNCj4gdVNOQ3JlYXRlZDogNTUxNQ0KPiBzaG93SW5B
ZHZhbmNlZFZpZXdPbmx5OiBUUlVFDQo+IG5hbWU6IF9rZXJiZXJvcy5fdGNwLmRjDQo+IG9i
amVjdEdVSUQ6IDRjYzNlMTNhLWNlZTItNDZjMy04NjhmLTQ1OWVjY2I0M2VjYw0KPiBvYmpl
Y3RDYXRlZ29yeTogQ049RG5zLU5vZGUsQ049U2NoZW1hLENOPUNvbmZpZ3VyYXRpb24sREM9
c2FtZG9tLERDPWV4YW1wbGUsREM9Y29tDQo+IGRjOiBfa2VyYmVyb3MuX3RjcC5kYw0KPiBk
bnNSZWNvcmQ6ICAgICBORFI6IHN0cnVjdCBkbnNwX0Ruc3NydlJwY1JlY29yZA0KPiAgICAg
ICAgICB3RGF0YUxlbmd0aCAgICAgICAgICAgICAgOiAweDAwMjMgKDM1KQ0KPiAgICAgICAg
ICB3VHlwZSAgICAgICAgICAgICAgICAgICAgOiBETlNfVFlQRV9TUlYgKDMzKQ0KPiAgICAg
ICAgICB2ZXJzaW9uICAgICAgICAgICAgICAgICAgOiAweDA1ICg1KQ0KPiAgICAgICAgICBy
YW5rICAgICAgICAgICAgICAgICAgICAgOiBETlNfUkFOS19aT05FICgyNDApDQo+ICAgICAg
ICAgIGZsYWdzICAgICAgICAgICAgICAgICAgICA6IDB4MDAwMCAoMCkNCj4gICAgICAgICAg
ZHdTZXJpYWwgICAgICAgICAgICAgICAgIDogMHgwMDAwMDA2ZSAoMTEwKQ0KPiAgICAgICAg
ICBkd1R0bFNlY29uZHMgICAgICAgICAgICAgOiAweDAwMDAwMzg0ICg5MDApDQo+ICAgICAg
ICAgIGR3UmVzZXJ2ZWQgICAgICAgICAgICAgICA6IDB4MDAwMDAwMDAgKDApDQo+ICAgICAg
ICAgIGR3VGltZVN0YW1wICAgICAgICAgICAgICA6IDB4MDAwMDAwMDAgKDApDQo+ICAgICAg
ICAgIGRhdGEgICAgICAgICAgICAgICAgICAgICA6IHVuaW9uIGRuc1JlY29yZERhdGEoY2Fz
ZSAzMykNCj4gICAgICAgICAgc3J2OiBzdHJ1Y3QgZG5zcF9zcnYNCj4gICAgICAgICAgICAg
IHdQcmlvcml0eSAgICAgICAgICAgICAgICA6IDB4MDAwMCAoMCkNCj4gICAgICAgICAgICAg
IHdXZWlnaHQgICAgICAgICAgICAgICAgICA6IDB4MDA2NCAoMTAwKQ0KPiAgICAgICAgICAg
ICAgd1BvcnQgICAgICAgICAgICAgICAgICAgIDogMHgwMDU4ICg4OCkNCj4gICAgICAgICAg
ICAgIG5hbWVUYXJnZXQgICAgICAgICAgICAgICA6IHJwaWRjMi5zYW1kb20uZXhhbXBsZS5j
b20NCj4gDQo+IGRuc1JlY29yZDogICAgIE5EUjogc3RydWN0IGRuc3BfRG5zc3J2UnBjUmVj
b3JkDQo+ICAgICAgICAgIHdEYXRhTGVuZ3RoICAgICAgICAgICAgICA6IDB4MDAyMyAoMzUp
DQo+ICAgICAgICAgIHdUeXBlICAgICAgICAgICAgICAgICAgICA6IEROU19UWVBFX1NSViAo
MzMpDQo+ICAgICAgICAgIHZlcnNpb24gICAgICAgICAgICAgICAgICA6IDB4MDUgKDUpDQo+
ICAgICAgICAgIHJhbmsgICAgICAgICAgICAgICAgICAgICA6IEROU19SQU5LX1pPTkUgKDI0
MCkNCj4gICAgICAgICAgZmxhZ3MgICAgICAgICAgICAgICAgICAgIDogMHgwMDAwICgwKQ0K
PiAgICAgICAgICBkd1NlcmlhbCAgICAgICAgICAgICAgICAgOiAweDAwMDAwMDZlICgxMTAp
DQo+ICAgICAgICAgIGR3VHRsU2Vjb25kcyAgICAgICAgICAgICA6IDB4MDAwMDAzODQgKDkw
MCkNCj4gICAgICAgICAgZHdSZXNlcnZlZCAgICAgICAgICAgICAgIDogMHgwMDAwMDAwMCAo
MCkNCj4gICAgICAgICAgZHdUaW1lU3RhbXAgICAgICAgICAgICAgIDogMHgwMDAwMDAwMCAo
MCkNCj4gICAgICAgICAgZGF0YSAgICAgICAgICAgICAgICAgICAgIDogdW5pb24gZG5zUmVj
b3JkRGF0YShjYXNlIDMzKQ0KPiAgICAgICAgICBzcnY6IHN0cnVjdCBkbnNwX3Nydg0KPiAg
ICAgICAgICAgICAgd1ByaW9yaXR5ICAgICAgICAgICAgICAgIDogMHgwMDAwICgwKQ0KPiAg
ICAgICAgICAgICAgd1dlaWdodCAgICAgICAgICAgICAgICAgIDogMHgwMDY0ICgxMDApDQo+
ICAgICAgICAgICAgICB3UG9ydCAgICAgICAgICAgICAgICAgICAgOiAweDAwNTggKDg4KQ0K
PiAgICAgICAgICAgICAgbmFtZVRhcmdldCAgICAgICAgICAgICAgIDogcnBpZGMxLnNhbWRv
bS5leGFtcGxlLmNvbQ0KPiANCj4gZG5zUmVjb3JkOiAgICAgTkRSOiBzdHJ1Y3QgZG5zcF9E
bnNzcnZScGNSZWNvcmQNCj4gICAgICAgICAgd0RhdGFMZW5ndGggICAgICAgICAgICAgIDog
MHgwMDIzICgzNSkNCj4gICAgICAgICAgd1R5cGUgICAgICAgICAgICAgICAgICAgIDogRE5T
X1RZUEVfU1JWICgzMykNCj4gICAgICAgICAgdmVyc2lvbiAgICAgICAgICAgICAgICAgIDog
MHgwNSAoNSkNCj4gICAgICAgICAgcmFuayAgICAgICAgICAgICAgICAgICAgIDogRE5TX1JB
TktfWk9ORSAoMjQwKQ0KPiAgICAgICAgICBmbGFncyAgICAgICAgICAgICAgICAgICAgOiAw
eDAwMDAgKDApDQo+ICAgICAgICAgIGR3U2VyaWFsICAgICAgICAgICAgICAgICA6IDB4MDAw
MDAwNmQgKDEwOSkNCj4gICAgICAgICAgZHdUdGxTZWNvbmRzICAgICAgICAgICAgIDogMHgw
MDAwMDM4NCAoOTAwKQ0KPiAgICAgICAgICBkd1Jlc2VydmVkICAgICAgICAgICAgICAgOiAw
eDAwMDAwMDAwICgwKQ0KPiAgICAgICAgICBkd1RpbWVTdGFtcCAgICAgICAgICAgICAgOiAw
eDAwMDAwMDAwICgwKQ0KPiAgICAgICAgICBkYXRhICAgICAgICAgICAgICAgICAgICAgOiB1
bmlvbiBkbnNSZWNvcmREYXRhKGNhc2UgMzMpDQo+ICAgICAgICAgIHNydjogc3RydWN0IGRu
c3Bfc3J2DQo+ICAgICAgICAgICAgICB3UHJpb3JpdHkgICAgICAgICAgICAgICAgOiAweDAw
MDAgKDApDQo+ICAgICAgICAgICAgICB3V2VpZ2h0ICAgICAgICAgICAgICAgICAgOiAweDAw
NjQgKDEwMCkNCj4gICAgICAgICAgICAgIHdQb3J0ICAgICAgICAgICAgICAgICAgICA6IDB4
MDA1OCAoODgpDQo+ICAgICAgICAgICAgICBuYW1lVGFyZ2V0ICAgICAgICAgICAgICAgOiB0
bXBkYzEuc2FtZG9tLmV4YW1wbGUuY29tDQo+IA0KPiB3aGVuQ2hhbmdlZDogMjAyMzEwMTkx
MDI4NDYuMFoNCj4gdVNOQ2hhbmdlZDogNTYxOA0KPiBkaXN0aW5ndWlzaGVkTmFtZTogREM9
X2tlcmJlcm9zLl90Y3AuZGMsREM9X21zZGNzLnNhbWRvbS5leGFtcGxlLmNvbSxDTj1NaWNy
b3NvZnRETlMsREM9Rm9yZXN0RG5zWm9uZXMsREM9c2FtZG9tLERDPWV4YW1wbGUsREM9Y29t
DQo+IA0KPiBOb3QgdGhlIHNhbWUgc2VhcmNoLCBidXQgaXQgZG9lcyBleHBhbmQgJzo6JyBh
dHRyaWJ1dGVzLg0KDQpZZXMsIHRoYXQgaXMgd29ya2luZyAoaW4gYm90aCBNaWNyb3NvZnQt
QUQgYW5kIFNhbWJhLUFEKSBidXQgbm90IGZvciB0aGUgDQpBdHRyaWJ0dXRlIG1zRFMtVXNl
ckFsbG93ZWRUb0F1dGhlbnRpY2F0ZVRvLiBFaXRoZXIgc2VhcmNoaW5nIGluIGEgDQpzYW1i
YS1BRCBvciBhIE1pY3Jvc29mdC1BRC4gSSB0cmllZCAibmV0dG9vbHMiIGEgdG9vbCB0byBz
ZWFyY2ggdGhlIA0KTWljcm9zb2Z0IEFEIExkYXAgYW5kIHNlZSBhbGwgYXR0cmlidXRlcyB3
aXRoIHRoZSB2YWx1ZSwgYnV0IHRoZSANCmF0dHJpYnV0ZSBtc0RTLVVzZXJBbGxvd2VkVG9B
dXRoZW50aWNhdGVUbyBpcyBlbXB0eSA6LSggb25seSBsZGJzZWFyY2ggDQppcyBnaXZpbmcg
dGhlIHZhbHVlIGJ1dCBub3QgYXMgcmVhZGFibGUgU0RETC1TdHJpbmcuIEluIGEgc2FtYmEt
QUQgSSB1c2UgDQpzYW1iYS10b29sIHRvIHJlYWQgaXQgYnV0IEkgY2FuJ3QgdXNlIHNhbWJh
LXRvb2wgaW4gYSBNaWNyb3NvZnQgQUQuIFRoZSANCm9ubHkgd2F5LCBJIHRoaW5rLCB3aWxs
IHdvcmsgaXMgYWRkaW5nIGEgc2FtYmEtREMgdG8gbXkgTWljcm9zb2Z0LUFELg0KDQpTdGVm
YW4NCg0KPiANCj4gUm93bGFuZA0KPiANCg0KDQoNCg==
--------------1W3mELEGSklgbD0B6sp0CykM
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

--------------1W3mELEGSklgbD0B6sp0CykM--

--------------cVh0xngBc5sqGfZTnVb9p0te--

--------------NJV84FrwX6VUJOpG0YMfv9XL
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQRsT9azWR5AolaZQIFS9tTdG7aKtQUCZyKBSQUDAAAAAAAKCRBS9tTdG7aKtQkk
AP97WFgtwc9ddPklHooyJR6Gg4kw+8tWg8DDlgSoJr2/kAEAij81Pmf/324n4YMG9fyIMCpGMXfi
V5CSNL9OksrWPgo=
=FQx1
-----END PGP SIGNATURE-----

--------------NJV84FrwX6VUJOpG0YMfv9XL--

