Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A06D4BFB1FC
	for <lists+samba-technical@lfdr.de>; Wed, 22 Oct 2025 11:19:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=g81Z9YTX77AsyRG74Uwo0l6CbfR9QXYZBDIRvPS16hM=; b=dsX0z2RScF0gH1pvobwVLJ5BTz
	yz4Pu/wfwudT6sdZXQt9UNdrKXQGGJ5/qIPH01pOwbKEopWGUeMAfJyvYne81F0AwOdAz++chdmE/
	z3vy4dCfCqp/gcMoAkIn766TA/w7XEKG3qxIDNzdUnhTPyubTGaN2mfjRf52ahDGpQgfq2FoJV9YP
	+tonKiP6ZFya/zD8B4DyqRtaqQO2AE0OAG7x6p2NShmaD69ITob9gXueyctxCcMh+ewW5nmB1fqt8
	yJS4u2OqZaYAiiLhV8Jy4LW+Sxay1cSthT53KYPMIkl/aDFnzNyesfXyojqaNqpVwO2EEHE+f94oU
	Uo7NTKRw==;
Received: from ip6-localhost ([::1]:44180 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vBV04-008UZH-JJ; Wed, 22 Oct 2025 09:19:20 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:20014) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vBV00-008UZA-K8
 for samba-technical@lists.samba.org; Wed, 22 Oct 2025 09:19:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=g81Z9YTX77AsyRG74Uwo0l6CbfR9QXYZBDIRvPS16hM=; b=MDhPIIdE4/1f/HWE5VT3XhhUpJ
 MDdq294mOLPzWuDHTc4c6IDCXvw0+bfeSS4cFkknvqsWnNHU4sYb1LL8GAsWRnGk48ILnrk0v1drQ
 p71VNG/M7ctT4vs4tqeATS8RRXGyvRO3aQ8Jvh7eBRphxIOXoKqSdQ0hz7kyJTE61f9ZlCY9QSatT
 b7BeYHFKdFs2sXpcG/6MquafOs+54orRhViGS5H8G7EhPe2oKui6yY7FL8RQSuaBepvGBbaKZJ0yE
 IEMvA0rH0a27j7WuOMxwv0gZq/DNpDsELdZ+UzuHM6O1COn/srtpSBLqSQ+EFqv3zFW4Rdo6G47am
 xsy4cMI4JUKQFyExYSC3pLomaKKmn1ceMxVJcW4ETr8hpcinE1SoecRSQms5LTdC2plZ1I/Oe08m+
 QKdscZlLP+8SOS3jt7eLwGvzSiDhFXWXmOc52TOrb7bLOH+haYZ+tIcE7yR8XRVwsZRSkIMuOKjBz
 nc6Il2H9h+UaiA/8ZgO/ZGha;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vBUzz-00AVBF-0y; Wed, 22 Oct 2025 09:19:15 +0000
Message-ID: <70c708c6-aea3-4ef7-97cc-cc8c08d2b0c9@samba.org>
Date: Wed, 22 Oct 2025 11:19:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Samba 4.22++ - RENAME_NOREPLACE w/o fallback?
To: Douglas Bagnall <douglas.bagnall@catalyst.net.nz>,
 Heiner Lesaar <heiner.lesaar@googlemail.com>, samba-technical@lists.samba.org
References: <CAHCztZtZZGnEUS11oDhmSdZ1er-4sXEAtb6mb+hcBYPXn4X0Dg@mail.gmail.com>
 <08227725-014f-4b96-975b-58784d9b91cc@catalyst.net.nz>
Content-Language: en-US, de-DE
In-Reply-To: <08227725-014f-4b96-975b-58784d9b91cc@catalyst.net.nz>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------5eHmOGmQ6T0bs9Ug1ZLMSwvk"
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
--------------5eHmOGmQ6T0bs9Ug1ZLMSwvk
Content-Type: multipart/mixed; boundary="------------YOienVRWZZi9iuckelN7ulWC";
 protected-headers="v1"
From: Ralph Boehme <slow@samba.org>
To: Douglas Bagnall <douglas.bagnall@catalyst.net.nz>,
 Heiner Lesaar <heiner.lesaar@googlemail.com>, samba-technical@lists.samba.org
Message-ID: <70c708c6-aea3-4ef7-97cc-cc8c08d2b0c9@samba.org>
Subject: Re: Samba 4.22++ - RENAME_NOREPLACE w/o fallback?
References: <CAHCztZtZZGnEUS11oDhmSdZ1er-4sXEAtb6mb+hcBYPXn4X0Dg@mail.gmail.com>
 <08227725-014f-4b96-975b-58784d9b91cc@catalyst.net.nz>
In-Reply-To: <08227725-014f-4b96-975b-58784d9b91cc@catalyst.net.nz>

--------------YOienVRWZZi9iuckelN7ulWC
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTAvMjIvMjUgMTA6NTUgQU0sIERvdWdsYXMgQmFnbmFsbCB2aWEgc2FtYmEtdGVjaG5p
Y2FsIHdyb3RlOg0KPiBPbiAxOC8xMC8yNSAwMjowMSwgSGVpbmVyIExlc2FhciB2aWEgc2Ft
YmEtdGVjaG5pY2FsIHdyb3RlOg0KPj4gRGVhciBzYW1iYS10ZWNobmljYWwsDQo+Pg0KPj4g
d2Ugbm90aWNlZCBhZnRlciB1cGdyYWRpbmcgZnJvbSBTYW1iYSA0LjIwIHRvIDQuMjIuMyAo
YW5kIGxhdGVyKSwgdGhhdA0KPj4gZGlyZWN0b3J5IGNyZWF0aW9uIG9uIE1hY09TIGNhdXNl
cyBhIHdlaXJkIGZvbGRlciBjcmVhdGlvbiAibG9vcCIgd2hlbg0KPj4gY3JlYXRpbmcgYSBu
ZXcgZm9sZGVyIGluIE1hY09TIEZpbmRlci4gRmluZGVyIGJhc2ljYWxseSBmb3JldmVyIGtl
ZXBzDQo+PiBjcmVhdGluZyBuZXcgZGlyZWN0b3JpZXMuDQo+Pg0KPj4gVGhpcyBpcyBvbmx5
IHdoZW4gdGhlIHVuZGVybHlpbmcgZmlsZXN5c3RlbSBpcyBCZWVHRlMsIGEgcGFyYWxsZWwN
Cj4+IGZpbGVzeXN0ZW0gd2hpY2ggZG9lcyBub3Qgc3VwcG9ydCBSRU5BTUVfTk9SRVBMQUNF
Lg0KPj4NCj4+IE15IHF1ZXN0aW9uOiBJcyB0aGVyZSBhIG1lY2hhbmlzbSB0byB0ZWxsIFNh
bWJhIHRvIHJldmVydCB0byBwcmV2aW91cw0KPj4gYmVoYXZpb3VyIG9mIG5vdCB1c2luZyBS
RU5BTUVfTk9SRVBMQUNFIGlmIHRoZSB1bmRlcmx5aW5nIGZpbGVzeXN0ZW0gZG9lcw0KPj4g
bm90IHN1cHBvcnQgaXQ/DQo+IA0KPiBJIHRoaW5rIHRoYXQgaXMgdW5saWtlbHkuIFdoYXQg
d2Ugd2FudCBpcyB0byBnZXQgdGhpcyBsb2dpYyByaWdodC4NCmluIHRoZSBiZXN0IFNhbWJh
IHRyYWRpdGlvbiB0aGVyZSdzIGFuIG9wdGlvbiBmb3IgZXZlcnl0aGluZzoNCg0KdmZzIG1r
ZGlyIHVzZSB0bXAgbmFtZSA9IG5vDQoNCmNmIG1hbiBzbWIuY29uZg0KDQotc2xvdw0KDQot
LSANClNlck5ldCBTYW1iYSBUZWFtIExlYWQgaHR0cHM6Ly9zZXJuZXQuZGUvDQpTYW1iYSBU
ZWFtIE1lbWJlciAgICAgIGh0dHBzOi8vc2FtYmEub3JnLw0KU2FtYmEgU3VwcG9ydCBhbmQg
RGV2ICBodHRwczovL3NhbWJhLnBsdXMvc2VydmljZXMvDQpTQU1CQSsgcGFja2FnZXMgICAg
ICAgIGh0dHBzOi8vc2FtYmEucGx1cy9wcm9kdWN0cy9zYW1iYQ0K

--------------YOienVRWZZi9iuckelN7ulWC--

--------------5eHmOGmQ6T0bs9Ug1ZLMSwvk
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEE+uLGCIokJSBRxVnkqh6bcSY5nkYFAmj4oY8FAwAAAAAACgkQqh6bcSY5nka2
8A//YbiTfAR1/KnVuDGwNnIKPHzxz/9CqNbXROryg3yXzvjXjBm7BLf5dunuqoJQFG661fhAwtHl
lcTkH6AdpDt2973c/9m6bWsnm+HI+MZLnS5alhaAxtW/MtWh67m7bgyDL6FGfGk/MmS6Nswm+3jD
RhTlv664OVu8m4zePLXsvykG1M6AYYEv20UeNPrQ1WsgogpI//IqUlsk6+WYvoHLI3ZdByDKuwo0
5tjGDuh9WDOOO+Geh5BFJ9pMvfR0ggunaZmJJaCf6uoILJTCDKYVvBWPiyBvLjAffwXu5IJ4f40Y
Gk5f0PFG/+vWZKzceo9vog5kUpS5Vlq40I0ydjE9HrLDyR/geqESd+9oEj7cgWeFD6vuBrS+j8VR
D6L7XUSPDIOeEYozwV8voubSWIHHAIiipmFzatOHXBFBA4pfPjebQ9RjwedUTqTHZPmgNG7rsr5M
7uE6WpIpffmvt6CVar+QcG7vEGrBGrYqmGw1KQUbVpI09yM/MCu6wPCBpfk7Y5RFwXEREeIr5PAQ
rDtlS9vdf/BY3vk8skGI7/Luu5x27XExSiOabbUlQZNgLG+9ZOdyc8p2maAWOAO4beqVLayfivq+
r/s8vqaN3XdlubHLlKy763tETv+pMLdWXrUmMKkCYsgW34m5TdpNDplcQCj0Zw2myUN/r2g0GVDS
IKo=
=B9DL
-----END PGP SIGNATURE-----

--------------5eHmOGmQ6T0bs9Ug1ZLMSwvk--

