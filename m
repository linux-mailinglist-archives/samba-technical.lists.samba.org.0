Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 05DDE470609
	for <lists+samba-technical@lfdr.de>; Fri, 10 Dec 2021 17:43:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=k0LtglK4fzTD5FlX2iv7+QWtbqOhfzjepc2P3Kgeh4s=; b=lT/V2hIusafohWh9jB8yZ2TMvi
	S8ddjGTvnOGEai573OIvnYKs5bChAHpm/UZfMOm+LIsPVwDslRAmxGj/GWgqBpix5fUbY66josjlZ
	Ga8J7V7zTJ/3LuvZK94LoJ/nXMyQf+6lHEvMcUwViBTycwnk1CPB495LReTQXnPoxu3Nns1ho8dwP
	fiMkqpHg8dXlML+uqRDiUO7tNjgvN6iteWI2x9Xh3GFgBoJPdVno/nWFmh7NOZVG01rVOb3pbqxyB
	2TI56em5nqsw/RUx3aXwHfQXAAxa+SucTUpfNvxQfUJMr1Z/v/nQkqPlfbjmI8HTf5yueF7Di0syg
	C/22sBdg==;
Received: from ip6-localhost ([::1]:39762 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1mviz3-0052Bh-BR; Fri, 10 Dec 2021 16:42:57 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:54428) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1mviyw-0052BY-Nj
 for samba-technical@lists.samba.org; Fri, 10 Dec 2021 16:42:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:Cc:To:Date:Message-ID;
 bh=k0LtglK4fzTD5FlX2iv7+QWtbqOhfzjepc2P3Kgeh4s=; b=CXu4a/xxfFcrhhC/75ZKLsW/vi
 pNProl5zBjqVp1/e74GGpPUw7YW8ohpDTyGAdjELPPPFqKIg2YQD/WVpm3CjXVChsOK6VMgMvB1Qg
 ZSzg7Khp+DSKXtUmL8b/1uY93KpiljK5A2qYgWVp0Gmaw5OXEA7fwHJX7bqKi2uKItdB+5s/u4cSN
 TwwkeSj/NHQbMJ8QnJD+7dPvcNGbjJA8QWzTgl2YEhcmwcPevLreWtgpuxR0GUpl2Ot5aEGLnSQEp
 pHtCN49qo3pGpoNDiVv5NbwS8EFn4k0LA3paxVzA6mZ8YDfZYyt8sxRm/bbRJon+rBaVnJTjDRrSt
 s2X0KPNLNamRAL4k3u5ySXVq1rbD96dGAsOvQEcmwqf2ZjBkD5LuPns3w5HRVUyfmklPlWOzQcR8b
 Zl4cxQdGPYsh11OLVAUTfmALbzgPDGzKq1ToR5BwOjFbFhCVXUhCZ9V+Fg2cvhzwjcaRoyhFONerk
 ksKnY1p1DULCuKO/CfLnHz9C;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1mviyw-002C7A-CS; Fri, 10 Dec 2021 16:42:50 +0000
Message-ID: <3510e5f9-b790-4dd8-0b24-bc514f8d2ce0@samba.org>
Date: Fri, 10 Dec 2021 17:42:49 +0100
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
 <CAB5c7xqdxsPyuxNfOx-tCxCu3Jfm--CNQZXn=YCwUC3M72jSKQ@mail.gmail.com>
In-Reply-To: <CAB5c7xqdxsPyuxNfOx-tCxCu3Jfm--CNQZXn=YCwUC3M72jSKQ@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------R8dYv7c93MKU94J8Cb0urwVf"
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
Cc: "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------R8dYv7c93MKU94J8Cb0urwVf
Content-Type: multipart/mixed; boundary="------------nk2qHkz0xCZMLc8q95Lg19vt";
 protected-headers="v1"
From: Ralph Boehme <slow@samba.org>
To: Andrew Walker <awalker@ixsystems.com>
Cc: "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
Message-ID: <3510e5f9-b790-4dd8-0b24-bc514f8d2ce0@samba.org>
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
 <CAB5c7xqdxsPyuxNfOx-tCxCu3Jfm--CNQZXn=YCwUC3M72jSKQ@mail.gmail.com>
In-Reply-To: <CAB5c7xqdxsPyuxNfOx-tCxCu3Jfm--CNQZXn=YCwUC3M72jSKQ@mail.gmail.com>

--------------nk2qHkz0xCZMLc8q95Lg19vt
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTIvMTAvMjEgMTc6MTksIEFuZHJldyBXYWxrZXIgd3JvdGU6DQo+IEZvciB0aGUgcGF0
aG9sb2dpY2FsbHkgY3VyaW91cywgZm9yZ290IHRvIGluY2x1ZGUgbGluayB0byBNYWNPUyBT
TUIgDQo+IGNsaWVudCAvIHNlcnZlciBzb3VyY2U6DQo+IGh0dHBzOi8vb3BlbnNvdXJjZS5h
cHBsZS5jb20vc291cmNlL3NtYi8gDQo+IDxodHRwczovL29wZW5zb3VyY2UuYXBwbGUuY29t
L3NvdXJjZS9zbWIvPg0KDQpJIGhhdmUgYSBmZXcgdmVyc2lvbiB1bmRlcg0KDQpodHRwczov
L2dpdGh1Yi5jb20vc2xvd2ZyYW5rbGluL2FwcGxlLXNtYjINCg0KQ2hlZXJzIQ0KLXNsb3cN
Cg0KLS0gDQpSYWxwaCBCb2VobWUsIFNhbWJhIFRlYW0gICAgICAgICAgICAgICAgIGh0dHBz
Oi8vc2FtYmEub3JnLw0KU2VyTmV0IFNhbWJhIFRlYW0gTGVhZCAgICAgIGh0dHBzOi8vc2Vy
bmV0LmRlL2VuL3RlYW0tc2FtYmENCg==

--------------nk2qHkz0xCZMLc8q95Lg19vt--

--------------R8dYv7c93MKU94J8Cb0urwVf
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEE+uLGCIokJSBRxVnkqh6bcSY5nkYFAmGzg4kFAwAAAAAACgkQqh6bcSY5nka6
7BAAsOWKsI3j2cY+jNzNicWeRWoqMDbnPuBRu9Bxe+LtHetOqfwstJqDa7BWXXbFoCDU5uMhU4Mb
bW3QNn7tNpYVHFoHM/ch5ZSKrk1xxqapY30iZZml+dXk2hWSEjO9qCL5nugD0ks66UO+/W8pXDdP
OUHmIVBzKsObbX2iWmziVXImrJ7hWmiKdlWsfeGOi1TpYALgRr8gbjZ5iFIwclabQT528q7zeNWN
W1zGf4+CyNBlwkJ58Yv/wF+ZJE6D7Hh6nnbReJTGVdq+9GXDbzzI6GP7Nh1O05WLmFNB/3FW2a2Q
ZA1JtEi+Axyh4AloVg8CninsN1UHhb2JXIj0dxN4sHx9pOtT/80lYYGS2N/dev+zfFbUdTfkyFLq
kR0TBWOqReLMuNcsQLjldGITUzNDGELYfeVD4TE/5ehomhCco5IE1VzaHH9eG648qLmyA3KtBOTp
/Jj15CGUYi7zQ1kcSPYTzGaOywLm7dOR9JHqDVyZg736aGuKUV9fHYcCSOkVPSC3mpb6HxGzoFim
BCnutBQV2htYq8fugrtDfNSJGUCUGjx/C2Voixq+rA5bJMM1kujfZFlaCd52OMfV2QeMEIh/bxL2
gLjPKYEx4M1upOT49VVg3BrJoPLsiVeukvy/VO1pRHoR5n9zNmGqjYloj46sDbpHxmyQoFA1ntjU
mLs=
=9ATo
-----END PGP SIGNATURE-----

--------------R8dYv7c93MKU94J8Cb0urwVf--

