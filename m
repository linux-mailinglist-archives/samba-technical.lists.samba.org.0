Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id AB14F6B10E7
	for <lists+samba-technical@lfdr.de>; Wed,  8 Mar 2023 19:19:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=e9S9N3UDLjdK3DjYFGcbDSMieDzwrZEsglPMsYsIOJI=; b=cpvddm5VVEfkpHHZmpU0m5RuDJ
	LhJwcLQXTxPQ3ZDsL1S2umtxvj1TC4xER849oCVImiyybiTh9hlJPY8LUDoIgfBIyvU3FNrh5ySIX
	DNXsMJMQjtiKl9BTuPT0eP09IGiezzSBo5inMsx59sRy/NzWHHmoP86dDXFWS+h0lLNgI62mdHXhX
	9jhzs/zzEbOgAsoULGN7rAo0wgkH1sRHwTxRY9Od6csp+DtmQhA8CiV/EA6QugTYi+CDC7sAEJ+e0
	Lg9aWDQ2qF311eJHXn0VJu7JgCqO+1OCPtoqpDBOuQkw8sgj37HYf66oxDWBTBNk7gRhnvqv/AvKY
	GBEiuFWQ==;
Received: from ip6-localhost ([::1]:22508 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pZyNQ-000PMZ-LJ; Wed, 08 Mar 2023 18:19:00 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:60220) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1pZyNL-000PMQ-RD
 for samba-technical@lists.samba.org; Wed, 08 Mar 2023 18:18:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:Cc:To:Date:Message-ID;
 bh=e9S9N3UDLjdK3DjYFGcbDSMieDzwrZEsglPMsYsIOJI=; b=mDh4TecaaxRg2Wbdm59qU51SML
 cL4pUa377sA+Z8rp/1Di+Dsd9Bx7zZIeY0dSurTJ2PLxHvmyMxkcdHr6nN3BFU6vDP4mW4RtHO0/C
 luVyxbqBmkOHHfs8dDS+3lW5oEeRuowZE0j7xbJJNQvGAGHWLj4Wv05sHzNpWCxEuFYyEW/Gm3mGL
 qtWCABNzJ5NCk7iAoShzX7IdhVLvtmufcD+gB6azfz0QpX9S77hsblfqSqm566fB5DJrcdGitq6oc
 uITv6REeNRQ8u090v5KX9vAjpOLGeeowuNAb2ec6VAqcn3wJB9EG43cGhCA5TegdR7Jys1tdYklpE
 lUPmGkwY0L7ptkMVdbu768n3Ip9nwC2v7LDgJ4fDEpkqr/HqnIFVx5uUnBzAhVTLxU4W0eh1PbgOi
 Hwc6WQyYEKxjg6e+rOyNh5bTgqWTiqTfRSmdIAEvAGJW/EhWzljZw/MFE0GJH6nFf6XpPVXaqpuwp
 O0vS/jhZ8KijfoI7u5B2Gjs2;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1pZyNL-001Wue-2Y; Wed, 08 Mar 2023 18:18:55 +0000
Message-ID: <2aac41be-f84b-9595-231a-6c3536e4cbf5@samba.org>
Date: Wed, 8 Mar 2023 19:18:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: Ceph RADOS linearizable?
Content-Language: en-US
To: David Disseldorp <ddiss@samba.org>
References: <7bc0c282-e9e6-ab70-6dca-227bb9802ef3@samba.org>
 <20230308184741.4e9f2b2b@echidna.fritz.box>
In-Reply-To: <20230308184741.4e9f2b2b@echidna.fritz.box>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------XDCebpMPJDzs6rrXV0IfNTS0"
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
Cc: Ralph Boehme via samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------XDCebpMPJDzs6rrXV0IfNTS0
Content-Type: multipart/mixed; boundary="------------BIFDDC8VwDBkD1PjWcfw00Ko";
 protected-headers="v1"
From: Ralph Boehme <slow@samba.org>
To: David Disseldorp <ddiss@samba.org>
Cc: Ralph Boehme via samba-technical <samba-technical@lists.samba.org>
Message-ID: <2aac41be-f84b-9595-231a-6c3536e4cbf5@samba.org>
Subject: Re: Ceph RADOS linearizable?
References: <7bc0c282-e9e6-ab70-6dca-227bb9802ef3@samba.org>
 <20230308184741.4e9f2b2b@echidna.fritz.box>
In-Reply-To: <20230308184741.4e9f2b2b@echidna.fritz.box>

--------------BIFDDC8VwDBkD1PjWcfw00Ko
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgRGF2aWQsDQoNCk9uIDMvOC8yMyAxODo0NywgRGF2aWQgRGlzc2VsZG9ycCB3cm90ZToN
Cj4gVGhpcyBhIHF1ZXN0aW9uIGJldHRlciBzdWl0ZWQgdG8gdGhlIENlcGggZGV2ZWxvcG1l
bnQgbGlzdCwgYnV0IEknbGwgZG8NCj4gbXkgYmVzdCB0byB0cnkgdG8gYW5zd2VyLi4uDQoN
CnlvdSdyZSByaWdodC4gU29ycnkgZm9yIGJlaW5nIGxhenkgYW5kIHRyeWluZyB0byBzaG9y
dGN1dC4uLiA6KSkpDQoNCj4+IENhbiB5b3UgY29uZmlybSB3aGV0aGVyIFJBRE9TIGlzIGlu
ZGVlZCBMaW5lYXJpemFiaWxlPyBJJ20gcHJldHR5IHN1cmUNCj4+IGl0IGlzLCBidXQgd291
bGQgbGlrZSB0byBiZSBzdXJlLiA6KQ0KPiANCj4gUkFET1MgaXMgYSB2ZXJ5IGJyb2FkIGlu
dGVyZmFjZSB3aGVuIGNvbnNpZGVyaW5nIGxpbmVhcml6YWJpbGl0eSwgYnV0DQo+IGlmIHlv
dSBjaG9vc2UgdG8gZm9jdXMgb24ga2V5L3ZhbHVlIHN0b3JhZ2UgYWNjZXNzZWQgdmlhIHRo
ZSBDZXBoIG9tYXANCj4gaW50ZXJmYWNlLCB0aGVuIHllcywgbXkgdW5kZXJzdGFuZGluZyBp
cyB0aGF0IE9TRCByZXF1ZXN0cyBmb3IgYSBzaW5nbGUNCj4gb2JqZWN0IGFyZSBwcm9jZXNz
ZWQgaW4gYSB3YXkgdGhhdCBwcm92aWRlcyBhdG9taWMgY29uc2lzdGVuY3kgZnJvbSBhDQo+
IFJBRE9TIGNsaWVudCBwZXJzcGVjdGl2ZS4NCg0Kd2VsbCwgYXRvbWljaXR5IGlzIG9uZSBw
b2ludCByZWxhdGVkIHRvIHRoZSBzaW5nbGUgb3BlcmF0aW9ucyBvciANCnRyYW5zYWN0aW9u
cywgY29uc2lzdGVuY3kgaXMgYSBicm9hZGVyIGNvbmNlcHQgZGVhbGluZyB3aXRoIHRoZSBv
cmRlcmluZyANCmFuZCByZWxhdGlvbiBiZXR3ZWVuIGRpZmZlcmVudCBvcGVyYXRpb25zLg0K
DQpXaXRoIGxpbmVhcml6YWJsZSBjb25zaXN0ZW5jeSwgd2hpY2ggaXMgdGhlIHN0cm9uZ2Vz
dCBjb25zaXN0ZW5jeSB5b3UgDQpjYW4gZ2V0IHdpdGggc2luZ2xlLWtleSBvcGVyYXRpb25z
LCB5b3UncmUgZ3VhcmFudGVlZCB0aGF0IG9wZXJhdGlvbnMgDQphcHBlYXIgaW4gYW4gb3Jk
ZXIgY29uc2lzdGVudCB3aXRoIHRoZSByZWFsLXRpbWUgb3JkZXJpbmcgb2YgdGhvc2UgDQpv
cGVyYXRpb25zLiBXaGljaCBhcyBhbm90aGVyIHdheSB0byBzYXkgdGhhdCBmb3INCg0KVGlt
ZSAxOiBDbGllbnQgMTogc2V0IEEgdG8gWA0KVGltZSAyOiBDbGllbnQgMjogZ2V0IEEgLT4g
Pw0KDQp3aXRoIGxpbmVhcml6YWJsZSBjb25zaXN0ZW5jeSBpdCdzIGd1YXJhbnRlZWQgdGhh
dCBjbGllbnQgMiByZWFkcyAiWCIuIA0KV2hpY2ggaXMgbm90IHRoZSBjYXNlIHdpdGggd2Vh
a2VyIGNvbnNpc3RlbmN5IGxldmVscyB3aGVyZSB0aGUgY2xpZW50IGlzIA0KYWxsb3dlZCB0
byBzZWUgdGhlIG9sZCB2YWx1ZSAod2hhdGV2ZXIgdGhhdCB3YXMpLg0KDQpUaGFua3MhDQot
c2xvdw0KDQotLSANClJhbHBoIEJvZWhtZSwgU2FtYmEgVGVhbSAgICAgICAgICAgICAgICAg
aHR0cHM6Ly9zYW1iYS5vcmcvDQpTZXJOZXQgU2FtYmEgVGVhbSBMZWFkICAgICAgaHR0cHM6
Ly9zZXJuZXQuZGUvZW4vdGVhbS1zYW1iYQ0KU0FNQkErLCBTYW1iYSBwYWNrYWdlcyAgICAg
ICAgICAgICAgICAgIGh0dHBzOi8vc2FtYmEucGx1cy8NCg0K

--------------BIFDDC8VwDBkD1PjWcfw00Ko--

--------------XDCebpMPJDzs6rrXV0IfNTS0
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEE+uLGCIokJSBRxVnkqh6bcSY5nkYFAmQI0Y4FAwAAAAAACgkQqh6bcSY5nkZE
tQ//QAcGWc/T40ztpYKqYSDcvU7d2NT283PKLsB1xYtc1BpHZKdn5HI7uUqk8cti4jnbiiUbyel5
THUd5kRC+W6YDXhzazSxNy1pDe6D1shTVJPrvB4sbJsnEkR5lY9Hd42LjJy0YpWe0oM7SNNpuULe
3r2fmnFc25zba2AmJMUlrYoamrMwKbeSVQpIIzpUcU0bcazQubZK7XzNgxe5u3KdR+Jtbg7EbuP5
f+s4OooeofzmgVnxQrMxol2yJLr6nUOvpTxSwoeKxCUyXperjPUo9sBmjS7ZVBKKqTg2RCtQhltK
oTLBpTHYw7qvlZfWSN9LyHMZGbzfKmkofY998DqVIJIG7CCRJq3IWc9TBuE8boBkQWygyRWU2PLB
yDm+2IBKNC2C1/hDl/rp/AAaGweD1ia1jgvYLITMnLy4+uMOfqbXJWMsv3vVS7JYk8VQbT2GcE23
anVSjwDmfhSJSVqbaiBWcwBXvTuG9HnedTgW9LHnNV27BVX7keKZK/oFFAcfd4c6rHHNV0T3j6FI
Ld1TziSXbsNJIU4WmWnAlcWS4LgTulxg0nsYDtvvBi97IyEs7HDb2vAGCwrqjof766QU+xRccNqU
G3L0bkorIbF7Okyt64dfkzXQ6c3vL5+1M70El4Gw03bNT1F7wP0KetCXRV8H+Tu8MlM1Wi85cuyJ
Yxg=
=m1PL
-----END PGP SIGNATURE-----

--------------XDCebpMPJDzs6rrXV0IfNTS0--

