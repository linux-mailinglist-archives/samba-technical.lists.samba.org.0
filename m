Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FA6D998DD9
	for <lists+samba-technical@lfdr.de>; Thu, 10 Oct 2024 18:53:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=czYKXY4sn13yj1sg8US+iDQP8+zUbToMdti2ra2vDpQ=; b=pjHWRKz33dnRLTVVWONAbH+Ej+
	lpYKnUtCv2V6e/3Ovzogu0dHeFB1pOw7M//IVM5KNlNLSS+7o5gVd2nJDlKkH105yXiwSy8bkUXag
	SD2ft9xtodpN/csDG2kWjEgIL4IriAvicPM85txsnergF74qEDFhGVNWAeU+HnVRt7/tnOUdkh+AL
	AlBGenREejkcZr3G+aYNF+sIjHauliWQ0/AJEPVm+cRaUWvUZHb1H+w7hcd5k2D97ND6J2xMJCX+m
	nn8GBkH19Icr3kS8+fzCPPlQD6/PF0aN5hVLqUD9AaNuV4eZ0lCoKdLAZiuSzBJRxvFyFIvDTLFZJ
	3Rx9Na7g==;
Received: from ip6-localhost ([::1]:37296 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1sywPg-003VR2-5h; Thu, 10 Oct 2024 16:53:20 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:63028) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1sywPb-003VQv-Jq
 for samba-technical@lists.samba.org; Thu, 10 Oct 2024 16:53:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:Cc:To:Date:Message-ID;
 bh=czYKXY4sn13yj1sg8US+iDQP8+zUbToMdti2ra2vDpQ=; b=COJHfLhEHHDwTfi1UlqM3wW+r+
 gOc4YwGfxD1oG707A+5YMvPHQBEtKmKW0rqcJiqTML1yNOATt8LKRViQlDO66+EWyVhhqYnnnW31g
 +DTeex/xir9415aHN2rU9XmDG7KO8gGj0lJvzElCnSZWH9Tl9H9xeVuosKfW6/DmwOTQ6Qm4baRCi
 2vKm3W4j2WZoIs5b0mVXl0dCI6CDwhrSAEzGM3F6Jrp6awq5tiZnGi0i94STIbBqbAnrE5T73a4QL
 pVkNxXrtPARMkIQaumFHqH859kee2pyME3VfCuFzY4sHSNFds4WVd6HEp3ZERqKuPgm+IPAZ6ksEU
 duJlghw3f3AOUQAePxu6s4wHvr0Oktft+iNjWNSpGqbF32Qggs0nzqnAFq8vmR+J6kELgVGa68vxJ
 MgdwYgDdhYVFmRw5e4R6U+RxmSTh202LrfcPceWU6Zzbe7vc+oXda6Kqv8ORPLr+GkfOBxYclbQZC
 9yyd3xCUQdkPtu0En9SxUniq;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1sywPa-004EgP-0V; Thu, 10 Oct 2024 16:53:14 +0000
Message-ID: <20304cda-37da-47b2-9260-a8478373376b@samba.org>
Date: Thu, 10 Oct 2024 18:53:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Current Samba master incorrectly returns STATUS_INVALID_HANDLE on
 copy_chunk
To: Stefan Metzmacher <metze@samba.org>, Jeremy Allison <jra@samba.org>
References: <CAH2r5mt7cE8Cc2K5K8nRM2RL=R-rwuAR9h6SSyEqtApuochtuQ@mail.gmail.com>
 <e12d7594-02df-4cbb-80fc-276d907afd90@samba.org>
 <CAH2r5muqSmNy+3SViFKNJ=5Sm61u8r9ej9Wy8JLUDeC2XHwccA@mail.gmail.com>
 <77aff6ef-291d-4840-82e2-b02646949541@samba.org>
 <d84732db-dea1-4fbd-9fc9-105c115c9ca0@samba.org>
 <990b4f16-2f5a-49ab-8a14-8b1f3cee94dc@samba.org>
 <ZwVM1-C0kBfJzNfM@jeremy-HP-Z840-Workstation>
 <569625f6-e0d2-43db-88cf-eb0fff6eb70e@samba.org>
 <ZwbczZYBsTU03Ycv@jeremy-HP-Z840-Workstation>
 <b84b2bb0-0afe-4f9e-9553-1a0201ed92d3@samba.org>
 <ZwblLYrVQM92eFl8@jeremy-HP-Z840-Workstation>
 <7980bb29-e434-487f-b70d-aa9d29156f00@samba.org>
Content-Language: en-US, de-DE
In-Reply-To: <7980bb29-e434-487f-b70d-aa9d29156f00@samba.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------DJZRpraVekr0AKeYDJluehv9"
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
Cc: Steve French <smfrench@gmail.com>,
 samba-technical <samba-technical@lists.samba.org>,
 CIFS <linux-cifs@vger.kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------DJZRpraVekr0AKeYDJluehv9
Content-Type: multipart/mixed; boundary="------------WlCx0GI13tBqDORFJ4j1kcvp";
 protected-headers="v1"
From: Ralph Boehme <slow@samba.org>
To: Stefan Metzmacher <metze@samba.org>, Jeremy Allison <jra@samba.org>
Cc: Steve French <smfrench@gmail.com>,
 samba-technical <samba-technical@lists.samba.org>,
 CIFS <linux-cifs@vger.kernel.org>
Message-ID: <20304cda-37da-47b2-9260-a8478373376b@samba.org>
Subject: Re: Current Samba master incorrectly returns STATUS_INVALID_HANDLE on
 copy_chunk
References: <CAH2r5mt7cE8Cc2K5K8nRM2RL=R-rwuAR9h6SSyEqtApuochtuQ@mail.gmail.com>
 <e12d7594-02df-4cbb-80fc-276d907afd90@samba.org>
 <CAH2r5muqSmNy+3SViFKNJ=5Sm61u8r9ej9Wy8JLUDeC2XHwccA@mail.gmail.com>
 <77aff6ef-291d-4840-82e2-b02646949541@samba.org>
 <d84732db-dea1-4fbd-9fc9-105c115c9ca0@samba.org>
 <990b4f16-2f5a-49ab-8a14-8b1f3cee94dc@samba.org>
 <ZwVM1-C0kBfJzNfM@jeremy-HP-Z840-Workstation>
 <569625f6-e0d2-43db-88cf-eb0fff6eb70e@samba.org>
 <ZwbczZYBsTU03Ycv@jeremy-HP-Z840-Workstation>
 <b84b2bb0-0afe-4f9e-9553-1a0201ed92d3@samba.org>
 <ZwblLYrVQM92eFl8@jeremy-HP-Z840-Workstation>
 <7980bb29-e434-487f-b70d-aa9d29156f00@samba.org>
In-Reply-To: <7980bb29-e434-487f-b70d-aa9d29156f00@samba.org>
Autocrypt-Gossip: addr=jra@samba.org; keydata=
 xsDiBDxEcLsRBADMQzpWoVuu4oiq23q5AfZDbakENMP/8ZU+AnzqzGr70lIEJb2jfcudViUT
 97+RmXptlnDmE4/ILOf6w0udMlQ9Jpm+iqxbr35D/6qvFgrgE+PnNAPlKSlI2fyGuLhpv1QP
 forHV13gB3B6S/ZWHpf/owKnJMwu8ozQpjnMnqOiVwCg8QnSX2AFCMd3HLQsqVaMdlO+jBEE
 AKrMu2Pavmyc/eoNfrjgeRoNRkwHCINWO5u93o92dngWK/hN1QOOCQfAzqZ1JwS5Q+E2gGug
 4OVaZI1vZGsAzb06TSnS4fmrOfwHqltSDsCHhwd+pyWkIvi96Swx00e1NEwNExEBo5NrGunf
 fONGlfRc+WhMLIk0u2e2V14R+ebDA/42T+cQZtUR6EdBReHVpmckQXXcE8cIqsu6UpZCsdEP
 N6YjxQKgTKWQWoxE2k4lYl9KsDK1BaF6rLNz/yt2RAVb1qZVaOqpITZWwzykzH60dMaX/G1S
 GWuN28by9ghI2LIsxcXHiDhG2CZxyfogBDDXoTPXlVMdk55IwAJny8Wj4s0eSmVyZW15IEFs
 bGlzb24gPGpyYUBzYW1iYS5vcmc+wlcEExECABcFAjxEcLsFCwcKAwQDFQMCAxYCAQIXgAAK
 CRCl3XhJ1sA2rDHZAKDwxfxpGuCOAuDHaN3ULDrIzKw9DQCdHb3Sq5WKfeqeaY2ZKXT3AmXl
 Fq7OwE0EPERwvhAEAIY1K5TICtxmFOeoRMW39jtF8DNSXl/se6HBe3Wy5Cz43lMZ6NvjDATa
 1w3JlkmjUyIDP29ApqmMu78Tv4UUxAh1PhyTttX1/aorTlIdVYFjey/yW4mSDXUBhPvMpq52
 TncLRmK9HC6mIxJqS0vi6W9IqGOqDRZph3GzVzJN7WvLAAMGA/sGAyg2rVsBzs77WH0jPO+A
 QZDj+Hf/RFHOwmcyG7/XgmV6LOcQP4HfQHH3DGYihu5cZj3BeWKPDJnjOjB2qmr+FTjYEsjw
 LDBNG7rjRye412rUbNwmEtcD2/dw4xNyu5h2u+1++KVBPf4SqG/a10gDqGJXDHA1Os5MmnQl
 3CTq9sJGBBgRAgAGBQI8RHC+AAoJEKXdeEnWwDasbeIAoL6+EsZKAYrZ2w22A6V67tRNGOIe
 AJ0cV9+pk/vqEgbv8ipKU4iniZclhg==

--------------WlCx0GI13tBqDORFJ4j1kcvp
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTAvMTAvMjQgMTE6MDEgQU0sIFN0ZWZhbiBNZXR6bWFjaGVyIHdyb3RlOg0KPiBpZiBv
ZmZzZXQgLTIgc2hvdWxkIGJlIHVzZWQuIE9uIHRoZSBzZXJ2ZXIgd2UgY291bGQgbWFwIHRo
YXQgdG8gDQo+IHB3cml0ZXYyKFJXRl9BUFBFTkQpLg0KDQpobSwgdGhhdCBzZWVtcyB0byBi
ZSBhIExpbnV4IG9ubHkgdGhpbmcuDQoNCg0K

--------------WlCx0GI13tBqDORFJ4j1kcvp--

--------------DJZRpraVekr0AKeYDJluehv9
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEE+uLGCIokJSBRxVnkqh6bcSY5nkYFAmcIBnUFAwAAAAAACgkQqh6bcSY5nkbV
2g/6A6leDj+DsH9EA2ZBYqXrcxd7I78LHIrYfkiMsxPSXXEWv62i6/5QCgkImn6YK15bU25jd1tN
+znKSkrgf6MP8Dgv+YLavpscR+dXa71Wq7iyFGwQZ/Qe2mk+YcmDsCTgv0BqadPVWIyCvtH++DeV
ClOlBEtLnHLYOjscriNwJb0li6xNDiMNAt/Usq9l2X4PjhlTUnXcksSVBnpm98fUVVGXufFFeMOw
5ln7NbFD2u7uBfjNEtkiPevHZ0BwzvsVsny4q7y8AOfSXsrPYDSu+NPdZ2zlAkJDUqksFtt6Qt0a
i8m9lcm7KlYZjTetOl99xK1eqhOZlKr/w6LkUPHfMTaO8uNy/bg5ry5mJgVVPldpoLv09vhy29/s
Bc1/3lOkoXAo+TOY3ymeUkongsm655AsEVorDPgSr68ylDmmJKm+N0rqxjTf/JxzgGof1YOsN0bG
anovSNE4uyTHrUpxGprAPrm1bCXIb1rim4v8h33OpB/InAMTuERsO+XxLXrzakaz55K9OLjFX1l2
snnaLt+0EfZg/LX/C476KO7/VSxbyM91RF9uYCZlDwqXS+PM99MdqK1WbLZbGvQhFgXiKnz3++AX
DX9csst7ZR0au+REEz2+5EU73wgP+raPNnongxcJ64cytWCtUV+vnGgRDuVjisBnQe7uPiNIxOic
4vU=
=IKtQ
-----END PGP SIGNATURE-----

--------------DJZRpraVekr0AKeYDJluehv9--

