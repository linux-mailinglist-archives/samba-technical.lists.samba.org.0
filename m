Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 2867A7DD4C3
	for <lists+samba-technical@lfdr.de>; Tue, 31 Oct 2023 18:36:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=K09hs0Kmh/fr4qe8W/gHysXyzW/pX8FI+iUja1mokTc=; b=mekiG26MfS9XiH1wLHSKJZ57fz
	s6OvKZV1juwqBSI/AeFM3vnBvUme8gVtNDdU31kRMHsHI6ByFtqTSAr7WJ76DEcvpDnU5CE3/urLY
	nLAL1jNs2GeS/3tdwvgSaFvGepF5zeTyDDZcFh8vw29/euBezgugKPnRq0ecB78lf5KxLyqcUv0di
	F9aqbaX671eT9e9vvQjfN5HZuABkkvOaMQTK8JB4KouZcd56Z+4ak/+aXpSCTyMvLFxMDID4oaZ+E
	RtZ7mror7B2aAiH9++lXvPhyf8M22xRc+O4HCxACCj2gf4VCRqJln11d6O9igYbh49bokh41FCuIe
	tLobjjcw==;
Received: from ip6-localhost ([::1]:55190 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1qxseb-003iRX-KA; Tue, 31 Oct 2023 17:35:49 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:64674) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1qxseQ-003iRO-Om
 for samba-technical@lists.samba.org; Tue, 31 Oct 2023 17:35:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:Cc:To:Date:Message-ID;
 bh=K09hs0Kmh/fr4qe8W/gHysXyzW/pX8FI+iUja1mokTc=; b=vrYy6gLKRjWbrSdM0CVRkJ+qdD
 ZnBg6IrOS/eaJl4s3VwWSa8qvK2Hcu0pIhilYJzG6EB9GI/Nv7EUfe0dX62Zxjua/xtYknkXRj+am
 dwZksQwpxPHtm6fjePPlwK/YIDARbS9CmWyufAvA8UtQi4J97pn0vR2ve8B9Kh45km/78GOhfUA6J
 GuAiQZU5fCHrgsy7mP71I31CsPovI7najgQVkjLE0zkWijCioCOzQdZev70ijm+fm27vhPabPLXda
 2LCuPGaTM3wCVa/61swkCvJlo8AcbpnQ150PZT7L7d9r5vMTrZvsq/3teJjCx3ilqRzexRlv7fCkm
 FMSUulQWlDGvwZaP6yBY1ILwsBc+xr2kAO9io0FViRoxCLy0rOfvrVWJPagdPylikFog+wQngZToT
 jP45h5/dbHytzuM5zIY9A4969iDK4smRnoOSFVOVGRg4aC3R2By1SSCmQ+0o68xtB1q+SB6AXB69M
 XrdV0UhlWaAmZOruJryLPMDQ;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1qxseL-003Xxe-21; Tue, 31 Oct 2023 17:35:33 +0000
Message-ID: <c187e800-5244-43fc-8e11-dcefa11e0221@samba.org>
Date: Tue, 31 Oct 2023 18:35:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [SMB3 POSIX] POSIX client creates a file, set the ARCHIVE bit or
 not
Content-Language: en-US, de-DE
To: Jeremy Allison <jra@samba.org>
References: <3b2fa1bd-2eae-482a-a9d9-543ebb921046@samba.org>
 <ZT/ZoUmdarteCey4@jeremy-HP-Z840-Workstation>
 <18abc825-a35d-441b-9476-32c6c368275f@samba.org>
 <ZT/tY0fVsAaaqpZE@jeremy-HP-Z840-Workstation>
In-Reply-To: <ZT/tY0fVsAaaqpZE@jeremy-HP-Z840-Workstation>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------4CXR5rqAEW1ON0vzsInhm7Bk"
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
Cc: Volker Lendecke <vl@samba.org>, Stefan Metzmacher <metze@samba.org>,
 Tom Talpey <tom@talpey.com>, Steven French <Steven.French@microsoft.com>,
 Ralph Boehme via samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------4CXR5rqAEW1ON0vzsInhm7Bk
Content-Type: multipart/mixed; boundary="------------RLTSWqIaUdxS0ngIikR1wsMp";
 protected-headers="v1"
From: Ralph Boehme <slow@samba.org>
To: Jeremy Allison <jra@samba.org>
Cc: Ralph Boehme via samba-technical <samba-technical@lists.samba.org>,
 Volker Lendecke <vl@samba.org>, Stefan Metzmacher <metze@samba.org>,
 Tom Talpey <tom@talpey.com>, Steven French <Steven.French@microsoft.com>
Message-ID: <c187e800-5244-43fc-8e11-dcefa11e0221@samba.org>
Subject: Re: [SMB3 POSIX] POSIX client creates a file, set the ARCHIVE bit or
 not
References: <3b2fa1bd-2eae-482a-a9d9-543ebb921046@samba.org>
 <ZT/ZoUmdarteCey4@jeremy-HP-Z840-Workstation>
 <18abc825-a35d-441b-9476-32c6c368275f@samba.org>
 <ZT/tY0fVsAaaqpZE@jeremy-HP-Z840-Workstation>
In-Reply-To: <ZT/tY0fVsAaaqpZE@jeremy-HP-Z840-Workstation>

--------------RLTSWqIaUdxS0ngIikR1wsMp
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTAvMzAvMjMgMTg6NTIsIEplcmVteSBBbGxpc29uIHdyb3RlOg0KPiBPbiBNb24sIE9j
dCAzMCwgMjAyMyBhdCAwNjoyNjoxNlBNICswMTAwLCBSYWxwaCBCb2VobWUgd3JvdGU6DQo+
PiBPbiAxMC8zMC8yMyAxNzoyOCwgSmVyZW15IEFsbGlzb24gd3JvdGU6DQo+Pj4gSSAqdGhp
bmsqIGl0IHdhcyBiYWNrIGZyb20gd2hlbiBtb3N0IHNlcnZlcnMgd2VyZSBydW5uaW5nDQo+
Pj4gd2l0aG91dCBFQSdzLCBzbyBhcmNoaXZlIHdhcyBtYXBwZWQgdG8gYSBQT1NJWCBwZXJt
cyBiaXQuDQo+Pg0KPj4gYWgsIHRoYXQgbWFrZXMgc2Vuc2UuIFRoYW5rcyENCj4+DQo+PiBT
byBidWlsZGluZyBvbiB0aGF0LCBtYXliZSBhIHR3ZWFrIGxpa2UNCj4+DQo+PiBpZiAobmV3
X2Rvc19hdHRyaWJ1dGVzICYgRklMRV9GTEFHX1BPU0lYX1NFTUFOVElDUykNCj4+IMKgwqAg
aWYgKGxwX3N0b3JlX2Rvc19hdHRyaWJ1dGVzKFNOVU0oY29ubikpKSB7DQo+PiDCoMKgwqDC
oMKgwqDCoCBuZXdfZG9zX2F0dHJpYnV0ZXMgfD0gRklMRV9BVFRSSUJVVEVfQVJDSElWRTsN
Cj4+IMKgwqAgfSBlbHNlIHsNCj4+IMKgwqDCoMKgwqDCoMKgIG5ld19kb3NfYXR0cmlidXRl
cyA9IDA7DQo+PiDCoMKgIH0NCj4+IH0gZWxzZSB7DQo+PiDCoMKgIC4uLg0KPj4gfQ0KPj4N
Cj4+IG9yIHNpbWlsYXIgbG9naWMgaXMgZHVlPw0KPiANCj4gWWVwLCBzb3VuZHMgZ29vZCB0
byBtZSAhDQoNCmZ3aXcsIGhlcmUncyB0aGUgKFdJUCkgTVINCg0KaHR0cHM6Ly9naXRsYWIu
Y29tL3NhbWJhLXRlYW0vc2FtYmEvLS9tZXJnZV9yZXF1ZXN0cy8zMzU3DQoNClRoYW5rcyEN
Ci1zbG93DQo=

--------------RLTSWqIaUdxS0ngIikR1wsMp--

--------------4CXR5rqAEW1ON0vzsInhm7Bk
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEE+uLGCIokJSBRxVnkqh6bcSY5nkYFAmVBOuQFAwAAAAAACgkQqh6bcSY5nkZz
Sg//V4+RzNK4QxgPduAXMPesmvAe7wx55txfIgrpU8LJvaaR7Zj1xtc1l4Kci0gi20+ElUX+uYz4
Kwt5QIW36TWJXj+dcD69EDm0RHLK7rtLPgNrPMcjULX36hAZ8H+VG9qMAvRfqwVbS3VMxBF55RDT
HIkHEIlujrYqKVMCvB8x3N9+th092ZdXzMYfk+Mvrl41h0VB8eJKJAHA5IXcaHt2BH7iqHpLjGIV
1tQyEgvhK55Y6DfLI0ULDU8Rd81oQg+41BjLNQYCHRehfIlKMzn642jAk33h8WIHKwjIMnkVD3ns
C9d+P4UitCj9srTOouvuVJOuBPnWDB1q4OCjhPapJsbdv4R1kQNQrwqFDOvKFZlkueo362Zn2Yrq
weKoTA6+D2s9Z5eYvKUNFi5Df8bnm9WIYy4/vgxuI8ygF60JBqsMouuNsMiH9u80MQyL6ZzFSoDI
5RsDZYy7Chwg4pEmPP38kbB2kyNo5Um/KW/UN4QdYR5UvKPiSaS+v3K3UWcku1JkQABNjmrXpwXE
Jru/pDQj/tx7cyx9gw2B8IhkzpDCgHZNOIr5aCa/NQnpQnwKmxzUUTSPXn6Sw0RVOE8MGFW1159i
pNds7FO5/KquTC+Fq7d2OJkn50d9IXIXf0jEDBLS/smyDSloKNn1rKwqHaEY5U7C+QkHN/riFFmM
U+I=
=/ZoV
-----END PGP SIGNATURE-----

--------------4CXR5rqAEW1ON0vzsInhm7Bk--

