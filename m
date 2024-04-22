Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E4AE38ACC56
	for <lists+samba-technical@lfdr.de>; Mon, 22 Apr 2024 13:52:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=N3v+qBP0ricHfVDVvQlMUZCu4OURyXQNUZt2/PfnGeQ=; b=GhHnc/L9pHdofODC58cRNzY6ld
	D7XGGCYNaSHWS2/Bl6GSvBq72+RMDec5zs7LnGBp4aH+BBLehFND73mn75FAZyLD+TbH8LsUGMpY5
	SuDDILbqXbAOTSxzqF3dZe5u+4zPUhRMmn2eywzTYpMXz96hOT8b+mu165U262Z9vH5JLmyJx4Gnv
	Inr2Kiaxqco94w3B92Rak1QGR6tH0WfR9wGpLNCysX9TUJbjzKTTx+zweI0rpNHP+mAXS91CfgxWS
	/YWBoXdvdV/zpnYEuxT2WvnVbsDJUmwAp9XiKpIXZrnKvuEns6S0Ln5oCt9YsQCGhSLwrAJxqeARz
	PUh5ZEvw==;
Received: from ip6-localhost ([::1]:56896 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1rysDI-005Mhs-Fo; Mon, 22 Apr 2024 11:52:00 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:17910) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rysDE-005Mhl-LR
 for samba-technical@lists.samba.org; Mon, 22 Apr 2024 11:51:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:Cc:To:Date:Message-ID;
 bh=N3v+qBP0ricHfVDVvQlMUZCu4OURyXQNUZt2/PfnGeQ=; b=G8P6KVw1C8HlBBwQB3Oo7ZpFIA
 ffdoee68QsS9wianmPASsNHG//7im4uAZ07aLmsQqChFWO6Jx3s+TPLGRmimRytW0Z5Q9pxy/DPGL
 OV+z9mNBDu97Ab/UV8fG/gtrVSiw+8WxUUyPCm76oh8StQnALnJlWf45PyVnPaqH+USve0ch9wsDt
 sv5qhSuj15DIxQ+GBGasxLtJ7GQQhE53Q+FMsCeBk2BxPr0PjzyCt1l6cqWgON608i/C2lyCt6c+M
 s2ROUVOXOaKeuHQQgKPS2HNkoXtjOawk4flGCUvJCYEPK0jVNLy2E+uwcs6rUx2svjnM2uJIbvHK8
 sGkXjUjC1QechgR/nwP5Tak6wrhAPOMlyjMD36zsPtkaekJCwHevrimVuuq2obFrXWoHCW6xVb1I8
 HAO4O9flbAJTUw/hBvVyfei0LgrkvGHhtLRsROvzT2LxWRe4vHRqYsl5XJ2j2IngmW2Sxoat4Lhv1
 sxpWKJTYsi0H+JsRkc0NRCAR;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rysDD-007hLi-2i; Mon, 22 Apr 2024 11:51:55 +0000
Message-ID: <17264f9a-2d6f-4bf4-a0e7-f28372a6f82a@samba.org>
Date: Mon, 22 Apr 2024 13:51:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Proposal for changes in become root
To: Xavi Hernandez <xhernandez@gmail.com>
References: <CAO9H7P_oqwoJoC_8mWNZVYZ-pxrYt9TrEt3t0LJsEvS32EorEg@mail.gmail.com>
 <4249c3b6-3b4e-4bd3-95e5-864158e5797f@samba.org>
 <CAO9H7P8Cttbg6v-Cn+rRR5cKc06K1pid9oQqsjPnHL49iCE=ig@mail.gmail.com>
Content-Language: en-US, de-DE
In-Reply-To: <CAO9H7P8Cttbg6v-Cn+rRR5cKc06K1pid9oQqsjPnHL49iCE=ig@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------62UCDrLyI6v5B9PI4Y99ozxq"
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
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------62UCDrLyI6v5B9PI4Y99ozxq
Content-Type: multipart/mixed; boundary="------------5L01XhloQ1fVhYtNisba4Ojj";
 protected-headers="v1"
From: Ralph Boehme <slow@samba.org>
To: Xavi Hernandez <xhernandez@gmail.com>
Cc: samba-technical@lists.samba.org
Message-ID: <17264f9a-2d6f-4bf4-a0e7-f28372a6f82a@samba.org>
Subject: Re: Proposal for changes in become root
References: <CAO9H7P_oqwoJoC_8mWNZVYZ-pxrYt9TrEt3t0LJsEvS32EorEg@mail.gmail.com>
 <4249c3b6-3b4e-4bd3-95e5-864158e5797f@samba.org>
 <CAO9H7P8Cttbg6v-Cn+rRR5cKc06K1pid9oQqsjPnHL49iCE=ig@mail.gmail.com>
In-Reply-To: <CAO9H7P8Cttbg6v-Cn+rRR5cKc06K1pid9oQqsjPnHL49iCE=ig@mail.gmail.com>

--------------5L01XhloQ1fVhYtNisba4Ojj
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gNC8yMi8yNCAxMjo0NiwgWGF2aSBIZXJuYW5kZXogd3JvdGU6DQo+IEkndmUganVzdCBz
dGFydGVkIHRvIHRha2UgYSBsb29rLCBidXQgaWYgSSB1bmRlcnN0YW5kIGl0IGNvcnJlY3Rs
eSwgdGhlIA0KPiB1c2VyIGNyZWRlbnRpYWxzIHdpbGwgYmUgc2V0IGp1c3QgYmVmb3JlIGRv
aW5nIHRoZSBzeXN0ZW0gY2FsbC4NCg0KZXhhY3RseS4NCg0KPiBJJ3ZlIG5vdCANCj4gc2Vl
biBhbnkgcmVmZXJlbmNlIHRvIGJlY29tZV9yb290KCkgKEkgbWF5IGhhdmUgbWlzc2VkIHNv
bWV0aGluZywgDQo+IHRob3VnaCksDQoNCnRoYXQgcGFydCBpcyBub3QgaW1wbGVtZW50ZWQg
eWV0LCBzbyBmYXIgdGhlcmUncyBvbmx5IHRoZSByb290IA0KaW1wZXJzb25hdGlvbiBvYmpl
Y3QgaW4gdGhlIHN0cnVjdCBzYW1iYV9pbXBlcnNvbmF0aW9uLiBUaGlzIHN0aWxsIG5lZWRz
IA0KdG8gYmUgZmxlc2hlZCBvdXQgaW4gc2FtYmFfaW1wZXJzb25hdGlvbl9jcmVhdGUoKS4N
Cg0KSWlyYyB3ZSdkIHRoZW4gaGF2ZSBhIG5ldyBmdW5jdGlvbiBsaWtlIHNhbWJhX3Jvb3Rf
aW1wZXJzb25hdGlvbigpIHRoZW4gDQpjaGVja3MgaW1wLT5pc19iZWNvbWVfcm9vdCBhbmQg
ZWl0aGVyIHJldHVybnMgaW1wIG9yIGltcC0+YmVjb21lX3Jvb3QuDQoNCkluIHBsYWNlcyB3
ZXJlIHdlIGN1cnJlbnRseSBjYWxsIGJlY29tZV9yb290KCksIHdlJ2QgdGhlbiBjYWxsIHJv
b3RfaW1wIA0KPSBzYW1iYV9yb290X2ltcGVyc29uYXRpb24oKSBhbmQgcGFzcyByb290X2lt
cCB0byB0aGUgZnVuY3Rpb24gd2Ugd2FudCANCnRvIGV4ZWN1dGUgYXMgcm9vdC4NCg0KTm90
ZSB0aGF0IHdlJ2xsIGxpa2VseSBhbHNvIGhhdmUgdG8gYml0ZSB0aGUgYnVsbGV0IGFuZCBw
cm9wZXJseSBoYW5kbGUgDQpjYXBhYmlsaXRpZXMgaW5zdGVhZCBvZiB1c2luZyBbc2V0fGRy
b3BdX2VmZmVjdGl2ZV9jYXBhYmlsaXR5KCkuIFRvIGRvIA0KdGhpcyB3ZSBzb21laG93IG5l
ZWQgdG8gdHJhY2sgdGhlIGN1cnJlbnQgYW5kIG1vZGlmaWVkIHNldCBvZiANCmNhcGFiaWxp
dGllcyBpbiB0aGUgaW1wZXJzb25hdGlvbiBvYmplY3RzLg0KDQo+IGJ1dCBJIGd1ZXNzIGl0
IG5lZWRzIHRvIGludGVncmF0ZSB3aXRoIHRoYXQgYW5kLCBpbiB0aGlzIGNhc2UsIA0KPiBp
dCB3b24ndCBpc3N1ZSBhbnkgc3lzY2FsbHMgdG8gY2hhbmdlIHRoZSBjdXJyZW50IHByb2Nl
c3Mgb3duZXIsIHJpZ2h0ID8NCj4gDQo+IFRoYXQgYXBwcm9hY2ggY291bGQgYmUgdmVyeSB1
c2VmdWwgZm9yIHdoYXQgSSByZWFsbHkgd2FudGVkIHRvIGRvLiBJZiBJIA0KPiBzZWUgaXQg
Y29ycmVjdGx5LCB0aGUgY3JlZGVudGlhbHMgc3dpdGNoIGhhcHBlbnMgaW4gdmZzX2RlZmF1
bHQsIHNvIA0KPiBtb2R1bGVzIGFyZSBmcmVlIHRvIGltcGxlbWVudCB0aGUgY3JlZGVudGlh
bHMgYXMgdGhleSB3YW50Lg0KDQp5ZXMuDQoNCkluIHRoZSBlbmQgeW91IHdvdWxkIGNhY2hl
IHlvdXIgb3duIGltcGVyc29uYXRpb24gdG9rZW5zIGluIGEgY2FjaGUgDQphc3NvY2lhdGVk
IHdpdGggdGhlIG1haW4gaW1wZXJzb25hdGlvbiBvYmplY3QgY2FjaGUgaWQgDQooc2FtYmFf
aW1wZXJzb25hdGlvbl9jYWNoZV9pZCgpKSwgdXNpbmcgYSB0YWxsb2MgZGVzdHJ1Y3RvciBv
biBhbiBvYmplY3QgDQp0aGF0IGlzIGEgdGFsbG9jIGNoaWxkIG9mIHRoZSBpbXBlcnNvbmF0
aW9uIG9iamVjdCBhbmQgcmVtb3ZlcyB0aGUgVkZTIA0KbW9kdWxlIHRva2VuIGZyb20gdGhl
IFZGUyBtb2R1bGUgY2FjaGUuDQoNCk1ha2VzIHNlbnNlPw0KDQpDaGVlcnMhDQotc2xvdw0K


--------------5L01XhloQ1fVhYtNisba4Ojj--

--------------62UCDrLyI6v5B9PI4Y99ozxq
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEE+uLGCIokJSBRxVnkqh6bcSY5nkYFAmYmT1sFAwAAAAAACgkQqh6bcSY5nkYY
8g//QvQzdLpgXGBWgWl1JmZVX9xhQS22ztpYeU95hWPP1KaLUqdxkt4leosJ3mPm/dtB3/r30zOj
EiB5WlFjq8hvf66Ov7FnxUGq2weow8UnZ2RD9bljnQX+6ZYyExIoRgpcJ0XFkSxhFo9lq5PsJrTp
DwlLGFOytBdf/XOepalWXkY25iM6QE49iE+aGa2oMQLA1npKRhCOTp9kIykOE6fU6+QP9IOTJRfZ
yxKxq96T/TCuNBbXM7guLtD4beFLyMYnUjG+ZqE7ONUFoXvhwLuAZhlEmijHMXxkga/h3GaU+ViR
ZLQ+itKW1hOVl8NyKz3mWqzKfw0xpMO5483R5pk7jYWyeW5VLE4deAxdJJFGYZ138KG2X49EGd//
JyNSxA1aDjS9Ri12jrse9v+rC7Dt4sNUYQx+PNQ+ZC2TUkPtbFyIlgUXKn3K2NlL89KWkOClmFCA
mEWzCjk5VlMgWXYB09qxcoEX5q72c0aAlbU9e4ITFVwYUn10CNPyDBIBIDs82r09BLb5KqnA+r/a
jYHuUA5LW46S9TnA4n9LgPBdgMOndk90msGmTQHZr6fJ42SAcqhzMOAHtuLsk2+n3G3f7ocdLHAc
3+RcIEc5eu6nT+QVsY+txQmzrZUks1n6Lvs+kYFnfih5jn32dO4qSFHFKtqOocqWE9u/Mfd1B6Uo
4F0=
=OtdG
-----END PGP SIGNATURE-----

--------------62UCDrLyI6v5B9PI4Y99ozxq--

