Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C3D47F8566
	for <lists+samba-technical@lfdr.de>; Fri, 24 Nov 2023 22:17:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=jLD/lyXvW/bieoXPFrS86SslRKCsazrAABCLw6OkvLM=; b=kFtRg/Ptp6a7A3jSVIcmUONfAq
	HBoAcVE3fbwb7t0cTN0eA5/n0J8g4VTpMl2QKqbX2sCZHDwTtVQCQFYChaP6IrfMpwdDO9xO3K/6q
	/gyuvh1d2xEm8cCLiA4fi5ZOD+ocRcniYdZnw0Q80AotmhI2O8cPewIX1Fez3yZNRPG+h1AFc4mU+
	awUNJmjuEwrcniC6O1sy88f3cGcMZXqMpEfEVT8UcksBtwZgTRWhQxhySRZeYkJS3RaLe7GdOXFGb
	jmQeBhpbwQa6c0H+0RJZftF305nSaYhSYckiurc4ssc8v/NRpChai2AsPey1B5D+/n9rBIWZiuiQH
	LGOSOjbw==;
Received: from ip6-localhost ([::1]:37640 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1r6dXZ-000Vr3-9O; Fri, 24 Nov 2023 21:16:45 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:58074) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1r6dXU-000Vqu-JE
 for samba-technical@lists.samba.org; Fri, 24 Nov 2023 21:16:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:Cc:To:Date:Message-ID;
 bh=jLD/lyXvW/bieoXPFrS86SslRKCsazrAABCLw6OkvLM=; b=dSTwqsoUArK77TjiGUWQvbPRYC
 PVrOslQYTi/GTu9FBu7q58kbpuh4ygbFlLxBwhfrvcBSI0nFtyUBMt4WDvrtTyFokPKMTKujjGIi1
 j+DJSXzpcE9mTox71aoiZseXkJoXcuS50c/iSSUCHdgINz0gZYgGsF71S/dBmwj6BdDu8RZgZgx6F
 KGvkpDmZJlfOpuoSOtHRWEod3B6Df4jNMVfU3fiiNqBkHNrsR9sw9AfHlSBYDZC2qNJ+wo0D4f6n3
 j+MpqkIsoAvphroSR9DXf5souHZJNkayX3QP6Q3pOhR+zKrXP48BeliDyVPakW9dJ/N6uAfzRkLFR
 Lhw6pQEE2/qq8tySo1TBkiBceut0+//2FDMY7Dmot236kJ4TN5XRdLV8wcn3lEXN9ET5e6sZpQ67Z
 Ivx+fRNdiTFI14LQrtlMXVxLHN6kthZcQQiyccCYVxdVg+ItF09tQZLbs+xP3I0B4rxXAdIueWBA/
 SSMXklyLBwWXBClGBT6/nGsJ;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1r6dXS-000QAC-2O; Fri, 24 Nov 2023 21:16:38 +0000
Message-ID: <6f0cc893-5252-4d02-acea-560284f51a19@samba.org>
Date: Fri, 24 Nov 2023 22:16:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [EXTERNAL] Re: [SMB3UNIX] Add POSIX-FSA and POSIX-FSCC
Content-Language: en-US, de-DE
To: Steven French <Steven.French@microsoft.com>,
 David Mulder <dmulder@samba.org>
References: <b63ead3c-f0dd-4acb-ae01-14e887d1d03e@samba.org>
 <3bf22a9f-ed05-baa2-3698-5870ca9e957a@samba.org>
 <e05f7cb9-38ac-4281-aa5f-bf178714b47b@samba.org>
 <DM4PR21MB34411774AEAF75085F4EC5B3E4B8A@DM4PR21MB3441.namprd21.prod.outlook.com>
 <f387ca21-0e4a-43e9-92c9-4457dbfdcaf2@samba.org>
 <DM4PR21MB3441A8796DA6A0C933C59385E4B8A@DM4PR21MB3441.namprd21.prod.outlook.com>
In-Reply-To: <DM4PR21MB3441A8796DA6A0C933C59385E4B8A@DM4PR21MB3441.namprd21.prod.outlook.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------gn0IwLB0aa9rvE0KwcAdCOrv"
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
Cc: "Paulo Alcantara \(SUSE\)" <pc@manguebit.com>, metze <metze@samba.org>,
 "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>,
 tom <tom@talpey.com>, Steve French <smfrench@gmail.com>,
 Volker Lendecke <vl@samba.org>, Jeremy Allison <jra@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------gn0IwLB0aa9rvE0KwcAdCOrv
Content-Type: multipart/mixed; boundary="------------jv3Ouiu0rMxLn9REzZ0Jt3qq";
 protected-headers="v1"
From: Ralph Boehme <slow@samba.org>
To: Steven French <Steven.French@microsoft.com>,
 David Mulder <dmulder@samba.org>
Cc: "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>,
 "Paulo Alcantara (SUSE)" <pc@manguebit.com>, tom <tom@talpey.com>,
 Steve French <smfrench@gmail.com>, Jeremy Allison <jra@samba.org>,
 Volker Lendecke <vl@samba.org>, metze <metze@samba.org>
Message-ID: <6f0cc893-5252-4d02-acea-560284f51a19@samba.org>
Subject: Re: [EXTERNAL] Re: [SMB3UNIX] Add POSIX-FSA and POSIX-FSCC
References: <b63ead3c-f0dd-4acb-ae01-14e887d1d03e@samba.org>
 <3bf22a9f-ed05-baa2-3698-5870ca9e957a@samba.org>
 <e05f7cb9-38ac-4281-aa5f-bf178714b47b@samba.org>
 <DM4PR21MB34411774AEAF75085F4EC5B3E4B8A@DM4PR21MB3441.namprd21.prod.outlook.com>
 <f387ca21-0e4a-43e9-92c9-4457dbfdcaf2@samba.org>
 <DM4PR21MB3441A8796DA6A0C933C59385E4B8A@DM4PR21MB3441.namprd21.prod.outlook.com>
In-Reply-To: <DM4PR21MB3441A8796DA6A0C933C59385E4B8A@DM4PR21MB3441.namprd21.prod.outlook.com>

--------------jv3Ouiu0rMxLn9REzZ0Jt3qq
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTEvMjQvMjMgMjI6MDMsIFN0ZXZlbiBGcmVuY2ggd3JvdGU6DQo+IFNlZW1zIGxpa2Ug
dGhlcmUgYXJlIHRocmVlIGdvYWxzOg0KPiANCj4gMSkgZG9jdW1lbnQgdGhlIGdlbmVyYWwg
cHVycG9zZSBhbmQgaW1wbGVtZW50YXRpb24gb2YgdGhlIFNNQjMuMS4xDQo+IExpbnV4IGV4
dGVuc2lvbnMgYW5kICJyZWNvbW1lbmRlZCIgd2F5IHRvIGRvIGNlcnRhaW4gUE9TSVggdGhp
bmdzDQo+IHRoYXQgd2VyZSBhbHJlYWR5IGluIHRoZSBwcm90b2NvbCAoZS5nLiB0aGUgcmVw
YXJzZSB0YWdzKS4gICBTb21lIG9mDQo+IHRoaXMgY291bGQgYmUgaW4gdGhlICJNUy1GU0Et
bGlrZSIgZG9jdW1lbnQuDQoNCj4gMikgZG9jdW1lbnQgdGhlIHByb3RvY29sIGV4dGVuc2lv
bnMgKE1TLVNNQjItbGlrZSBjaGFuZ2VzLCBuZXcNCj4gbmVnb3RpYXRlIGFuZCBvcGVuIGNv
bnRleHQgYW5kIG5ldyBpbmZvIGxldmVsIGZvciBxdWVyeSBmaWxlIGFuZCBmcw0KPiBpbmZv
KQ0KDQo+IDMpIGRvY3VtZW50IGJlaGF2aW9yIGNoYW5nZXMgKE1TLUZTQS1saWtlIGNoYW5n
ZXMpIHdoZW4gYSBoYW5kbGUgaXMNCj4gb3BlbmVkIHdpdGggUE9TSVggb3BlbiBjb250ZXh0
DQoNCj4gNCkgZG9jdW1lbnQgYW55IGRldGFpbHMgbWlzc2luZyBmcm9tIE1TLUZTQ0MgKGUu
Zy4gYW55dGhpbmcgd2UgZmluZA0KPiB0aGF0IGlzIG1pc3NpbmcgZnJvbSB0aGUgZGVzY3Jp
cHRpb24gb2YgcmVwYXJzZSBwb2ludHMgb3IgdGhhdCB3ZSBkbw0KPiBkaWZmZXJlbnRseSB0
aGFuIHdoYXQgaXMgZG9jdW1lbnRlZCAoaWYgc29tZXRoaW5nIGVuZHMgdXAgcmVxdWlyaW5n
IGENCj4gbWlub3IgdHdlYWsgZm9yIGEgc3BlY2lhbCBmaWxlIHR5cGUpLCBkZXRhaWxzIG9u
IHRoZSBuZXcgaW5mb2xldmVsKQ0KPiBpbiB0aGUgUE9TSVgtRlNDQyBkb2N1bWVudA0KDQp0
aGF0J3MgdGhlIHBsYW4gYW5kIGhlcmUncyB0aGUgY3VycmVudCBXSVA6DQoNCmh0dHBzOi8v
d3d3LnNhbWJhLm9yZy9+c2xvdy9zbWIzX3Bvc2l4X2V4dGVuc2lvbnMuaHRtbA0KaHR0cHM6
Ly93d3cuc2FtYmEub3JnL35zbG93L2ZzYV9wb3NpeF9leHRlbnNpb25zLmh0bWwNCmh0dHBz
Oi8vd3d3LnNhbWJhLm9yZy9+c2xvdy9mc2NjX3Bvc2l4X2V4dGVuc2lvbnMuaHRtbA0K

--------------jv3Ouiu0rMxLn9REzZ0Jt3qq--

--------------gn0IwLB0aa9rvE0KwcAdCOrv
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEE+uLGCIokJSBRxVnkqh6bcSY5nkYFAmVhErUFAwAAAAAACgkQqh6bcSY5nkZd
3BAAqiII16mHNlMJ9n6dOaJGlop2iKgQ7DKUJNUNeTz4S+f/4cW3ek0CZ4N3lTIDs+Whr4qpoCcc
RX+SJQl8uXH5OlpXZlbZnSufLR2CoMQpzdgDialyrzcyvbZnLbfrr9AgsCxsy9qOx21NFjA/jiIb
MwG8EAOf/l2DPxoSvTbZf7gTzAsHjaAL4Etz7NoyL7rqxKs05DVWmKEO1mWYL91ql5DLe957irGZ
EL3NvXeAftYLNTjSBWBFEfyTCVoLCoSkvxyGANnvtnNBcW1B8eB6Dj3VzcUXoulVwH69XCSuIsVE
zz8FZ0KcWia5RuByMJ3orqdkoTVKdB0vosxUs4lPKCORhabGtA0dS0RKg849vKDqJuPjyCd1qC0F
/+wvvzMVCI+8z1yQnXNyYF0OGijWBDar92l2aoDoP+6jl/Z69/UTUfI3FE6LkG91ryad62Vux1uB
lYz1N++IoRlOhMeeRYRqk+YS/JCml1Noyte4M0M6TFnghHAKE4r/1AKEMod6n7o930K+b/F4ywcx
w1/1OwhNjTowPVwkedoRuAzJnMvI6asTjdoWbAfiHJJSamcEQF0wC+0mZ71lUR/P1DlYOWBUlKuV
NUVJ4OZQ0mAR4YU+tJMR4B33eFAFxDW/C7zbtlI4zGzetJiDD6henXaejJJgl1H6ieTD/Q7mWJrd
E34=
=krKn
-----END PGP SIGNATURE-----

--------------gn0IwLB0aa9rvE0KwcAdCOrv--

