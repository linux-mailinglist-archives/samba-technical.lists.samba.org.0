Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 190404706B3
	for <lists+samba-technical@lfdr.de>; Fri, 10 Dec 2021 18:07:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=FElXypD/PiMbFino5tOVN/SkWKz5rVjBDQLIDWP8b9Y=; b=u+RZMBP8sIFM0en8GBMQVWH9ts
	YfCXXMiPc+Ll4WXo6UBi1v+HftZ/ljp4S3mIhEOBMFRuIN5BZOmIvDktADzjBYHCSykoCeHe7kZ8J
	J86cMu3datLNt9z1IJv2CTwQNs5R/jigaxY6d7UER7kLS6bwaj+N+13NISyDlWv1ylR+wwjVHPo3+
	ARr+cw6OBnn9tVbNuD5S1qK/TBN2ed5jzKPh41bgWpZ095Z+yfLZbIh9foGPAAMftiibECLz183Ul
	2eG3lpwLm+BhA4UO2bUI9r0hpHZU+weXfbF0NKGuKtt+sgL3ZE9K+6n/YCanHqU5WwH6RNmDls0bv
	WUHWK9/g==;
Received: from ip6-localhost ([::1]:43292 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1mvjMO-0053fH-LZ; Fri, 10 Dec 2021 17:07:04 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:54432) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1mvjMI-0053f8-E4
 for samba-technical@lists.samba.org; Fri, 10 Dec 2021 17:07:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:Cc:To:Date:Message-ID;
 bh=FElXypD/PiMbFino5tOVN/SkWKz5rVjBDQLIDWP8b9Y=; b=Vd/23+Q9chJ/LgILXWioAQQgKx
 exswXvauT0WXQLMEWLHiq2VLw0pKYLmxPwythkBT65DH4P2QrU6iuAuwcLS8Lcr1T5OBR7bZ0y5J0
 HUpK+Vm/q/cmrGVcboE5SwChX1U4pWTiR4nQEEnSOimZal/JnfEYM7vBD9e//+NskO/4tAPhFnjNV
 zTWEJKD9PKKdSB3ZfxM21UBr1XmWE8vxo+Stopy2TQNFI9gdkN8Y+odgS+KO3eh7m0lbKF87Wvbq/
 +xTQeWWF/cbmDqsGsjdx2kLIBDjo6xWxmaLO51tgsmFfiDbJPFvYWQ7UHiBiUToCiGFPnrMCaiVay
 uRymsFR7fkkwDFIp2Nw4RLwUJnCgJ+zrLDcNQZAGXX2NtzemoJ12bOvmIi4aqXG39c+ZM44bo31cX
 Jhrzv6b2mg0uS4JUyBUlsKta1r044r6nE0RL0yPpcIFseQFXcZ8OcsP70QE2ckKVX455iRqo92pSc
 x9jBpQTyMzpKds8h/gWxiv5I;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1mvjMG-002CLh-SW; Fri, 10 Dec 2021 17:06:56 +0000
Message-ID: <9ed4d4ed-155c-7740-854a-8819eb7bec91@samba.org>
Date: Fri, 10 Dec 2021 18:06:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: Duplicate SMB file_ids leading to Windows client cache poisoning
Content-Language: en-US
To: Andrew Walker <awalker@ixsystems.com>
References: <CH2PR12MB4152F65AF85E23297EB5146D9F6E9@CH2PR12MB4152.namprd12.prod.outlook.com>
 <d37f9e09-fdca-07c8-ac5c-b5e859930b9e@samba.org>
 <CH2PR12MB415202EB8137713529ECEF6E9F6F9@CH2PR12MB4152.namprd12.prod.outlook.com>
 <1cd1e3f9-1773-2ba9-24f2-f7a0c4f49cbd@talpey.com>
 <5f6cc5cf-55ee-8422-b284-bd45b8faf448@samba.org>
 <84a566c0-4b04-eafd-89f4-d636ff655371@talpey.com>
 <93cc9a8b-8404-f5a1-3615-62919be31e69@samba.org>
 <fdbdbd51-92cf-d424-655f-fca636583e13@talpey.com>
 <CAB5c7xqZcK9-Oa+o+w5Mva9Dr8_wWojx=krWiP+4zQ0X3ksH+Q@mail.gmail.com>
 <6c8aca36-8856-cf8a-2ea9-902106d0adc3@talpey.com>
 <a25972a3-3688-367b-fcab-fa748e590153@samba.org>
 <CAB5c7xp-zEwjcZSHfjL8YyWd_4y=K3HC3GSjAzvMoJR9aPOv6A@mail.gmail.com>
 <9bbb9a27-9100-9a61-50e3-bdc7ab0bab1a@samba.org>
 <CAB5c7xpys+Ch65-6v0qv6rtGonFcKkMKJRYEzOboiRfiOPLs4Q@mail.gmail.com>
 <a806f198-69d1-a836-b5d8-c1b7b37c4d87@samba.org>
 <CAB5c7xpBqoumBu_dX9N7eVY_vYUhu57Y+PDeT-S7jOs325GcyA@mail.gmail.com>
In-Reply-To: <CAB5c7xpBqoumBu_dX9N7eVY_vYUhu57Y+PDeT-S7jOs325GcyA@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------tVkFjy4KbEN4Hpx93Ylj5Fjf"
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
Cc: Tom Talpey <tom@talpey.com>,
 "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------tVkFjy4KbEN4Hpx93Ylj5Fjf
Content-Type: multipart/mixed; boundary="------------NdHfrNntmEyC6F7M7eXX2FX0";
 protected-headers="v1"
From: Ralph Boehme <slow@samba.org>
To: Andrew Walker <awalker@ixsystems.com>
Cc: Tom Talpey <tom@talpey.com>,
 "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
Message-ID: <9ed4d4ed-155c-7740-854a-8819eb7bec91@samba.org>
Subject: Re: Duplicate SMB file_ids leading to Windows client cache poisoning
References: <CH2PR12MB4152F65AF85E23297EB5146D9F6E9@CH2PR12MB4152.namprd12.prod.outlook.com>
 <d37f9e09-fdca-07c8-ac5c-b5e859930b9e@samba.org>
 <CH2PR12MB415202EB8137713529ECEF6E9F6F9@CH2PR12MB4152.namprd12.prod.outlook.com>
 <1cd1e3f9-1773-2ba9-24f2-f7a0c4f49cbd@talpey.com>
 <5f6cc5cf-55ee-8422-b284-bd45b8faf448@samba.org>
 <84a566c0-4b04-eafd-89f4-d636ff655371@talpey.com>
 <93cc9a8b-8404-f5a1-3615-62919be31e69@samba.org>
 <fdbdbd51-92cf-d424-655f-fca636583e13@talpey.com>
 <CAB5c7xqZcK9-Oa+o+w5Mva9Dr8_wWojx=krWiP+4zQ0X3ksH+Q@mail.gmail.com>
 <6c8aca36-8856-cf8a-2ea9-902106d0adc3@talpey.com>
 <a25972a3-3688-367b-fcab-fa748e590153@samba.org>
 <CAB5c7xp-zEwjcZSHfjL8YyWd_4y=K3HC3GSjAzvMoJR9aPOv6A@mail.gmail.com>
 <9bbb9a27-9100-9a61-50e3-bdc7ab0bab1a@samba.org>
 <CAB5c7xpys+Ch65-6v0qv6rtGonFcKkMKJRYEzOboiRfiOPLs4Q@mail.gmail.com>
 <a806f198-69d1-a836-b5d8-c1b7b37c4d87@samba.org>
 <CAB5c7xpBqoumBu_dX9N7eVY_vYUhu57Y+PDeT-S7jOs325GcyA@mail.gmail.com>
In-Reply-To: <CAB5c7xpBqoumBu_dX9N7eVY_vYUhu57Y+PDeT-S7jOs325GcyA@mail.gmail.com>

--------------NdHfrNntmEyC6F7M7eXX2FX0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTIvMTAvMjEgMTc6NTYsIEFuZHJldyBXYWxrZXIgd3JvdGU6DQo+IFRoYXQncyBhIGdv
b2QgcG9pbnQsIGJ1dCBpZiBNYWNPUyBTTUIgY2xpZW50IGlzIGZha2luZyB1cCBhbiBpbm9k
ZSANCj4gbnVtYmVyIGJhc2VkIG9uIGEgaGFzaCBvZiB0aGUgZmlsZW5hbWUgaW4gdGhlIHpl
cm8taWQgY2FzZSwgaXNuJ3QgaXQgDQo+IGV2ZW4gbW9yZSBsaWtlbHkgdG8geWllbGQgYSBj
b2xsaXNpb24gYXQgc29tZSBwb2ludD8NCg0Kd2VsbCwgaXQncyBzb21laGFzaChuYW1lKSBj
b21iaW5lZCB3aXRoIHRoZSBwYXJlbnQtaW5vZGUgbnVtYmVyLiBJIGtub3csIA0KaXQncyBu
b3QgaWRlYWwuDQoNCkJ1dCBnb2luZyBiYWNrIHRvIGlub2RlIG51bWJlcnMgYnJpbmdzIHVz
IGJhY2sgdG86DQoNCmh0dHBzOi8vYnVnemlsbGEuc2FtYmEub3JnL3Nob3dfYnVnLmNnaT9p
ZD0xMjcxNQ0KDQoqc2NyYXRjaGVzIGhlYWQqDQoNCi1zbG93DQoNCi0tIA0KUmFscGggQm9l
aG1lLCBTYW1iYSBUZWFtICAgICAgICAgICAgICAgICBodHRwczovL3NhbWJhLm9yZy8NClNl
ck5ldCBTYW1iYSBUZWFtIExlYWQgICAgICBodHRwczovL3Nlcm5ldC5kZS9lbi90ZWFtLXNh
bWJhDQo=

--------------NdHfrNntmEyC6F7M7eXX2FX0--

--------------tVkFjy4KbEN4Hpx93Ylj5Fjf
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEE+uLGCIokJSBRxVnkqh6bcSY5nkYFAmGziTAFAwAAAAAACgkQqh6bcSY5nkYu
uBAAnnVAkuT8eg9DN40qrWYQ2f0ikBc674rnVKtDPQZh4YnyNA6AaBXZm/CZN6ujqAg6lbu7PjtU
evNZtq6qrO8yJ2HMXVtuFyp8p3ZoMwDocyL1T2vYETQIbMjquZ0XJvkYuKOEGUoyx44uEY5r4knf
P/Lhe5iAZCGW3tlFcwoLRA49W/EbXm03glt6YuEiQxSlCd/YquBpI0GWeiSdJIERAsseETMU2avb
HdEPAjOZbBcj7Yy3W7TIJN/E7GqG5HDuzf0UdPtjwPPPH6hEYg2zaokAaqlKbx1NgVPFIHLv7rnz
1axe01UVkh8ngxe+OPfUCKWKAFRzuMtgv4CXJfWENxcVqr8rrH6uHKvecg9lqPgfa+E4hG+qVEdH
Y4BBt6rXIXh7JN0zXdqSugINAGIiIzAJUyHubrC4P9Ldsfc0NatsC0G5hvwopwNiGTZAH8gA6Avc
4ahKjqeQ6KGJig9nI+PgGsRB8bk9OW6cnDosq6Nr5018f5LlhaAiyBc6zoC95PQ7FjOYA+95VdIl
QD7387TUaVVjqySw9bU5wDxMrM8DH68A5H/NuIm/hfhS3kr/sesxhI8LGR39YbhTM9THx+Kk0NDW
+BfW8MYw+xZ/6AaqchA57Pg0BTr0jzoWDVqZVevQXVT5Kl/wQiSpdyrCrDgXb8G2/HtSfabTPFWb
bjw=
=mRKs
-----END PGP SIGNATURE-----

--------------tVkFjy4KbEN4Hpx93Ylj5Fjf--

