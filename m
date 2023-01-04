Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 20C0665D016
	for <lists+samba-technical@lfdr.de>; Wed,  4 Jan 2023 11:02:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=DYzmZlWgzPQ4TeHB6g1FhWkIoqTm5H5bvLK18SfPaWU=; b=eQ3yjiFI3zTcs87e3R7bBqE3xF
	Y6sUgYi7ONrvkLHQThGgu6AlnUG2twbRbIhUKws8WVD/p5r/RTU3p2BTK7L1ygmxxfGHQpEaxwl23
	1PnCMeyhLkRT2ALdwZUD7HD3/jESY+GfPF/Tq0RYNWuvT0XmOIEoWoMe4zeRtBZ1O8Sd7BLKJ8LS7
	98a/LxvuccEwESrYMJTutVWM3fYVzsKm+TYYG9J2mdSibRtGqQpO4BY/RGSPLDinvzK1VkKDkpTFL
	OA4+u4wkoWNjc2d2xKnlX0CcBG4cOORAQSa0l5ph/7s4teXWP95hZRw5ko/fO9xSjDc8y/vpmBmUy
	OqNZXyTw==;
Received: from ip6-localhost ([::1]:60410 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pD0b8-00EXAo-EH; Wed, 04 Jan 2023 10:02:14 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:29146) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1pD0b3-00EXAf-QT
 for samba-technical@lists.samba.org; Wed, 04 Jan 2023 10:02:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:Cc:To:Date:Message-ID;
 bh=DYzmZlWgzPQ4TeHB6g1FhWkIoqTm5H5bvLK18SfPaWU=; b=ZmD3AW64iWqxMR+uTfHWxtJ5sq
 NhM6F4mxkq+mntC8fVWNz7M/VQaPmH3hDfKLpxb9FlzOcP1JAGr4e0elpvvlXlfsKWMi0t32UpCeu
 aSSama3IuFQ+PGavzHwKX35GYSZ/5P9pyoMg5keHP8HIQeF+Z74odBrihBChSM1rar0+8rkQp19si
 9XOTI2tHTEEHvvx0lhxi7ooPjFmWY3DVAOj5b71fCNN51zi8oswEASYGjZNPUnzTf8WpbO+FAf8V9
 qRYo3mke6gQ/DD6zIUj8J4S7vlP2EMXici2AsmNm+ls/gzGU1fri299QpdCp3gyS8Wy8pPmtXrI46
 u+U4y8HSq92pxyZOwAVVMCPudTtcsc+cR746RHj3w3Tif4JfKn+RaaANl8zJf5UXhGeuSPOCKwym7
 FWRfZweGhUvVCn0ceKF7GpLJzvCvy8ygDxnNIAD5VQfJ7n+E2vWe3HC0eTOl3TjivUSA8N1W61WFq
 tQ0pf9voDCwwwTzUdvDryqET;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1pD0az-006hUH-7E; Wed, 04 Jan 2023 10:02:05 +0000
Message-ID: <01c42bcc-e066-b14b-9258-0378d74618df@samba.org>
Date: Wed, 4 Jan 2023 11:02:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: Wiki: 64 bit printer drivers
Content-Language: en-US
To: samba-technical@lists.samba.org
References: <f613dab1-cbb0-3846-6256-b492afb32c8c@samba.org>
 <87089e51-9b9b-6539-8c1b-0063d37c180e@samba.org>
In-Reply-To: <87089e51-9b9b-6539-8c1b-0063d37c180e@samba.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------ndNYLWZQC95MXJ8IkympLjSr"
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
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------ndNYLWZQC95MXJ8IkympLjSr
Content-Type: multipart/mixed; boundary="------------T609EXMHn1T1hWkPjeGDvKDF";
 protected-headers="v1"
From: Ralph Boehme <slow@samba.org>
To: samba-technical@lists.samba.org
Cc: Rowland Penny <rpenny@samba.org>
Message-ID: <01c42bcc-e066-b14b-9258-0378d74618df@samba.org>
Subject: Re: Wiki: 64 bit printer drivers
References: <f613dab1-cbb0-3846-6256-b492afb32c8c@samba.org>
 <87089e51-9b9b-6539-8c1b-0063d37c180e@samba.org>
In-Reply-To: <87089e51-9b9b-6539-8c1b-0063d37c180e@samba.org>

--------------T609EXMHn1T1hWkPjeGDvKDF
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgUm93bGFuZCwNCg0KT24gMS80LzIzIDEwOjQ2LCBSb3dsYW5kIFBlbm55IHZpYSBzYW1i
YS10ZWNobmljYWwgd3JvdGU6DQo+IEkgcmV2ZXJ0ZWQgaXQgYmVjYXVzZSB0aGVyZSBhcmUg
c3RpbGwgMzJiaXQgc3lzdGVtcyBvdXQgdGhlcmUgYW5kLCBhZnRlciANCj4gY2hlY2tpbmcs
IEkgY291bGRuJ3QgZmluZCBhbnl0aGluZyB0aGF0IHNhaWQgdGhhdCBwcmludGluZyB3YXMg
bm93IDY0Yml0IA0KPiBvbmx5Lg0KDQpQbGVhc2UgbG9vayBjbG9zZWx5OiBqdXN0IHRoZSAq
ZGVmYXVsdCogY2hhbmdlZCwgdGhpcyBoYXMgbm90aGluZyB0byBkbyANCndpdGggYmVpbmcg
NjQtYml0ICpvbmx5Ki4NCg0KVGhhbmtzIQ0KLXNsb3cNCg0KLS0gDQpSYWxwaCBCb2VobWUs
IFNhbWJhIFRlYW0gICAgICAgICAgICAgICAgIGh0dHBzOi8vc2FtYmEub3JnLw0KU2VyTmV0
IFNhbWJhIFRlYW0gTGVhZCAgICAgIGh0dHBzOi8vc2VybmV0LmRlL2VuL3RlYW0tc2FtYmEN
Cg0K

--------------T609EXMHn1T1hWkPjeGDvKDF--

--------------ndNYLWZQC95MXJ8IkympLjSr
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEE+uLGCIokJSBRxVnkqh6bcSY5nkYFAmO1TpwFAwAAAAAACgkQqh6bcSY5nkbO
IxAAoS+xffbUoxqGJVPmNMoWlJWhgK5tCIuEwVNyewSYoH1tOP+zgu2FwyOPouDyz8pLbnfdRHnj
WbsKNI1ckEV2KWwXgY1PEhvo6QT9GGxsbJzZZ7HrBbMUnqgqjB91PqbmvtmkPqs/eAobHcacIyYy
8rLxF1O3DjSytbhrs0TmIZcFljL53T+cQXJCzaFbDKweFtjLUloJGB1YGFKVbebJg3oDhI2OUBdV
fyC6etw/ofpnI2oVPW+6vrXzhREYDXp3vgi6c5v9aNueF37pxUavvoKqrEDbzAp5pXE0RILSSV6Q
vKJQF0AOvprZXqE4EYKUz+ysI7KLYinkLKO9PyXuEau+ySkosDiXba8PKRU9bME3TiDe0fKaEefL
FAQ1QrnWxTdNltB+UBcItv//fxUEedddTQxxFjToDjPurSpXLnvStMQgY3hxk//1JW3aoT7+vVlu
sw6w6cIbS2sg6tKwiFaKbibyxle1NSGOin5/P2MjumqefAx3Eo7LXY6X5bSN9wdJ7QYG/Bv7eoo0
xGWU9YklEFiw60Hir0ntts80RDam3Mxy8EdyizLEeeyIVq8AC6q+wbsUumtOuTfec4BpsPanfki/
cikceqSqPfq+9DZP/pvgsCVfpsbha8PtvT8VVhWH5sGmU2Dn+w1nlZO6kdG2SmxGSwfBQ+7oTK8c
U1I=
=Kh3S
-----END PGP SIGNATURE-----

--------------ndNYLWZQC95MXJ8IkympLjSr--

