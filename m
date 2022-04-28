Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 19B65512C81
	for <lists+samba-technical@lfdr.de>; Thu, 28 Apr 2022 09:16:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=BFaDgc3WpQFKl0Lq4dC9yjH2OqX9+QYqKt6On7twQec=; b=qhpU93/3fPEFrONUJthjpYbIOt
	g6qg7YY6UIWG+0y3OkcGJbZGv9Bep/JtmhofM0oB2UyIsg7ZBsFnR5WefCenIOEuP9lev/L9WlCNr
	xJvX9OipZNv3TNuieEsrS7+8GkXcZLEDHM864h87JG+gOJLgb85VWXVJYyz+80G9QxcfcZ/EmuMA5
	vCC0079COEdp34cse7m3yxUwHwBA8qys0aVZV777P2UJA8UEqv6hsLYH/ldPAzr8K1MEvQaKX00zu
	ol8m0a4q2iIK+Gi6kicQoExF9fSF3mC14+UB3eFgSvo0taYV2QfqVy/X2rNC/P8dZ0WUI48boHfCr
	HDa94HKg==;
Received: from ip6-localhost ([::1]:25314 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1njyO7-002wZ3-0H; Thu, 28 Apr 2022 07:16:31 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:39732) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1njyNt-002wYt-52
 for samba-technical@lists.samba.org; Thu, 28 Apr 2022 07:16:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Cc:From:To:Date:Message-ID;
 bh=BFaDgc3WpQFKl0Lq4dC9yjH2OqX9+QYqKt6On7twQec=; b=eRGmDVd72fxqoyqcN4JipQ4Xjv
 XN+ZLbZWsQRbY2sdUyfe8oGdZ3rHQMWEgbq25uuf0wZrgVB9fLQo/MlecfnQcQ6ZM92Lf7JoMVAaN
 bcWUQ5WHMB1+51pTg4NJmvDgdXlQCgNicefbM3SUs9V3iEfrdSgfp+uTDKi/eEY9JBDqUsnRMm63n
 vf/KsobFo+Brizm/yVbTeset/21Rpn2XRr9IJQx9hKbaMzygwUXmP5b1Ys9TIUZ5IUzNp4UBPqit3
 Sp91nyTx9nibSJjKfL3mwe7rcrvAFfg4LH841nwnVBWXVihIk6da2Tpz0Vuo+XGxpCwdTGJREhIF1
 rHAbTrVyYyszHWzhBV4DQcdan//FSkdVReyVO7MRELW7RPe1v+3SJnEt8i+kbyxptf3nHASkzd9Yw
 yRhP2ydNOhiu40bHNKRy8H5C4RbCbFlbbk1flwwLmR2coZgK8+VW21p51BLfDt/Wg3tvS6PulRsXx
 4NkEBC26LVoEnKXjbjIU20x4;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1njyNq-002mNX-L9; Thu, 28 Apr 2022 07:16:15 +0000
Message-ID: <ec1be4f0-8ee2-589e-59c4-3a288dbbb5b5@samba.org>
Date: Thu, 28 Apr 2022 09:16:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: ctdb client python bindings
Content-Language: en-US
To: Andrew Walker <awalker@ixsystems.com>,
 samba-technical <samba-technical@lists.samba.org>
References: <CAB5c7xrKB52rmAP9qPFxzjtCcBLvGsGiUn_ODz7QwQwrJ15o0A@mail.gmail.com>
In-Reply-To: <CAB5c7xrKB52rmAP9qPFxzjtCcBLvGsGiUn_ODz7QwQwrJ15o0A@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------1Kzscb0vSlEbfW0aeiTUXMqi"
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
Cc: Martin Schwenke <mschwenke@ddn.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------1Kzscb0vSlEbfW0aeiTUXMqi
Content-Type: multipart/mixed; boundary="------------JWB2Vanx9N0JGSgijRgeyGUf";
 protected-headers="v1"
From: Ralph Boehme <slow@samba.org>
To: Andrew Walker <awalker@ixsystems.com>,
 samba-technical <samba-technical@lists.samba.org>
Cc: Martin Schwenke <mschwenke@ddn.com>
Message-ID: <ec1be4f0-8ee2-589e-59c4-3a288dbbb5b5@samba.org>
Subject: Re: ctdb client python bindings
References: <CAB5c7xrKB52rmAP9qPFxzjtCcBLvGsGiUn_ODz7QwQwrJ15o0A@mail.gmail.com>
In-Reply-To: <CAB5c7xrKB52rmAP9qPFxzjtCcBLvGsGiUn_ODz7QwQwrJ15o0A@mail.gmail.com>

--------------JWB2Vanx9N0JGSgijRgeyGUf
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgQW5kcmV3LA0KDQpncmVhdCBzdHVmZiwgbmljZSB3b3JrISBKdXN0IGhhZCBhIHF1aWNr
IGxvb2sgYW5kIGl0IHNlZW1zIHRoYXQgdGhlIA0KYmluZGluZ3MgYXJlIGR1cGxpY2F0aW5n
IHF1aXRlIHNvbWUgY29kZSBsaWtlIGdldF9ub2RlX2J5X3BubigpLCANCm5vZGVfbWFwX2Fk
ZCgpIGFuZCBzbyBvbi4NCg0KTWF5YmUgTWFydGluIGNhbiBhZHZpY2Ugb24gdGhlIGVhc2ll
c3QgYW5kIGJlc3Qgd2F5IHRvIG1ha2UgdGhlIGV4aXN0aW5nIA0KZnVuY3Rpb25zIHVzYWJs
ZSBmb3IgdGhlIGJpbmRpbmdzLg0KDQpDaGVlcnMhDQotc2xvdw0KDQpPbiA0LzI3LzIyIDE5
OjI1LCBBbmRyZXcgV2Fsa2VyIHZpYSBzYW1iYS10ZWNobmljYWwgd3JvdGU6DQo+IEhleSBh
bGwsDQo+IA0KPiBJIHRocmV3IHRvZ2V0aGVyIHNvbWUgcXVpY2sgcHl0aG9uIGJpbmRpbmdz
IGZvciBhIGN0ZGIgY2xpZW50LiBXSVAsIGJ1dCBhbnkNCj4gZmVlZGJhY2sgd291bGQgYmUg
YXBwcmVjaWF0ZWQgKGVpdGhlciBpbi1saXN0IG9yIGRpcmVjdCBlbWFpbCB0byB0aGlzDQo+
IGFkZHJlc3MpLg0KPiANCj4gSSd2ZSBjdXJyZW50bHkgdGhyb3duIHRvZ2V0aGVyDQo+IA0K
PiBodHRwczovL2dpdGxhYi5jb20vc2FtYmEtdGVhbS9kZXZlbC9zYW1iYS8tL2NvbW1pdHMv
YW5vZG9zMzI1LWN0ZGJfcHl0aG9uX2JpbmRpbmdzDQo+IA0KPiBiZWxvdyBhcmUgc29tZSBi
YXNpYyBvcGVyYXRpb25zDQo+ICogaW5pdGlhbGl6aW5nIGNsaWVudA0KPiAqIGdldHRpbmcg
Y2x1c3RlciBzdGF0dXMNCj4gKiBjcmVhdGluZyBhIG5ldyBwZXJzaXN0ZW50IGN0ZGIgZmls
ZSAoaWYgdGhhdCdzIHlvdXIgdGhpbmcpDQo+ICogbGlzdGluZyBjdXJyZW50IG5vZGVzDQo+
ICogZ2V0dGluZyBwbm4wIG9iamVjdCBhbmQgcHJpbnRpbmcgaXRzIGN1cnJlbnQgc3RhdHVz
DQo+IA0KPiBgYGANCj4+Pj4gaW1wb3J0IGN0ZGINCj4+Pj4gY2wgPSBjdGRiLkNsaWVudCgp
DQo+Pj4+IGNsLnN0YXR1cygpDQo+IHsnbm9kZW1hcCc6IHsnbm9kZV9jb3VudCc6IDEsICdk
ZWxldGVkX25vZGVfY291bnQnOiAwLCAnbm9kZXMnOiBbeydwbm4nOiAwLA0KPiAnYWRkcmVz
cyc6IHsndHlwZSc6ICdJTkVUJywgJ2FkZHJlc3MnOiAnMTkyLjE2OC4wLjkyJ30sICdmbGFn
cyc6IFtdLA0KPiAnZmxhZ3NfcmF3JzogMCwgJ3BhcnRpYWxseV9vbmxpbmUnOiBGYWxzZSwg
J3RoaXNfbm9kZSc6IFRydWV9XX0sICd2bm5tYXAnOg0KPiB7J3NpemUnOiAxLCAnZ2VuZXJh
dGlvbic6IDcwNTY4MzQ0NiwgJ2VudHJpZXMnOiBbeydoYXNoJzogMCwgJ2xtYXN0ZXInOg0K
PiAwfV19LCAncmVjb3ZlcnlfbW9kZV9yYXcnOiAwLCAncmVjb3ZlcnlfbW9kZV9zdHInOiAn
Tk9STUFMJ30NCj4+Pj4gaW1wb3J0IG9zDQo+Pj4+IGRiID0gY3RkYi5DdGRiKGNsLCAiY3Vy
bHkudGRiIiwgb3MuT19DUkVBVCkNCj4+Pj4gZGIuZXhpc3RzDQo+IEZhbHNlDQo+Pj4+IGRi
LmF0dGFjaChjdGRiLkRCX1BFUlNJU1RFTlQpDQo+Pj4+IGRiLmV4aXN0cw0KPiBUcnVlDQo+
Pj4+IGRiLnN0YXR1cygpDQo+IHsnZGJpZCc6ICcweDNjMDU3NjljJywgJ2RiaWRfcmF3Jzog
MTAwNjk5MTAwNCwgJ25hbWUnOiAnY3VybHkudGRiJywgJ3BhdGgnOg0KPiAnL3Vzci9sb2Nh
bC9zYW1iYS92YXIvbGliL2N0ZGIvcGVyc2lzdGVudC9jdXJseS50ZGIuMCcsICdwZXJzaXN0
ZW50JzogVHJ1ZSwNCj4gJ3JlcGxpY2F0ZWQnOiBGYWxzZSwgJ3N0aWNreSc6IEZhbHNlLCAn
cmVhZG9ubHknOiBGYWxzZSwgJ2ZsYWdzX3Jhdyc6IDEsDQo+ICdoZWFsdGgnOiAnT0snfQ0K
Pj4+PiBjbC5saXN0bm9kZXMoKQ0KPiB7J25vZGVfY291bnQnOiAxLCAnZGVsZXRlZF9ub2Rl
X2NvdW50JzogMCwgJ25vZGVzJzogWzxjdGRiLkN0ZGJOb2RlIG9iamVjdA0KPiBhdCAweDdm
MDEzZGViOTVhMD5dfQ0KPj4+PiBteV9ub2RlID0gY2wubGlzdG5vZGVzKClbJ25vZGVzJ11b
MF0NCj4+Pj4gbXlfbm9kZS4NCj4gbXlfbm9kZS5iYW4oICAgICAgICAgICAgIG15X25vZGUu
ZGlzYWJsZSggICAgICAgICBteV9ub2RlLmZsYWdzDQo+ICAgbXlfbm9kZS5wcml2YXRlX2Fk
ZHJlc3MgIG15X25vZGUudW5iYW4oDQo+IG15X25vZGUuY3VycmVudF9ub2RlICAgICBteV9u
b2RlLmVuYWJsZSggICAgICAgICAgbXlfbm9kZS5wbm4NCj4gICBteV9ub2RlLnJlYmFsYW5j
ZSgNCj4+Pj4gbXlfbm9kZS5wbm4NCj4gMA0KPj4+PiBteV9ub2RlLmZsYWdzDQo+IHsncGFy
c2VkJzogW10sICdyYXcnOiAwfQ0KPiBgYGANCg==

--------------JWB2Vanx9N0JGSgijRgeyGUf--

--------------1Kzscb0vSlEbfW0aeiTUXMqi
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEE+uLGCIokJSBRxVnkqh6bcSY5nkYFAmJqPz0FAwAAAAAACgkQqh6bcSY5nkZd
pQ//XgA2ILu62AIM86e5UbySpbrmDW9/6/e3im5fXKW7VJkzlw1hUva6dbr4DEebpwAeo73J7a3Q
DkyynFiAeed0y4jxJUPYRWF1wymGSeybW86rYU1cKrBUbyWoBUWaNiHvIa95btQ1WMUEQ0qqzvsI
46Tqu/Atoax8UPMvCL3f1CDZOXAlOI9tpGzb4RkCmt3F/jV+3k5pPjl6MvlLgFJgfGIHrw6sUZ+t
ewLQ492pQCKkpJ0zN+5W6hR5QRl56gd+C3GFbJ4IZNpXlQVTiV+8BhCZL+k7bnKjAVvCdBoNZ69h
DqXkL/MQB7sesPacCW5JtdmxaWxWa2YNDT6YLDfB+gtXIuPjfhuc65CIsKLoQEGD9o/b6m0s72dK
ZwvSzlQLG8XUhJvlF8FvzfAWteV1ajibuDeZTb5pW00tXyF6f/ka3pegwOH+hrHdPQPWliGVWvl8
dWQsQsT1ggub2GKwdQNcIIk86egLfxenf2MWww8zS1tXfzT79aB6rwnrOIUckwb5p19+UD8zqc9m
gaEZ8n24gzfRatvugtR9P2qElM9wG+3eey9m9yL/amgr2AdKtKJvEgPz6TU1NKFQCSJ9JwsasO2f
ARWi9IsGNMdYwFIBVHPHeZUdSlCmRAJenII1q6/eVNUV/rq1QqrmIJZdATpOMeyrbLCmbiyrvbNq
Kmg=
=qHQ8
-----END PGP SIGNATURE-----

--------------1Kzscb0vSlEbfW0aeiTUXMqi--

