Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A99D98B6D40
	for <lists+samba-technical@lfdr.de>; Tue, 30 Apr 2024 10:46:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=lPgbSIk7Xugq1EuJedy06u5E3JRSpsT0MgUMQZr6Wwo=; b=i2/iwmnZfvpCUfaRZx/bk1+Zc4
	LJEST4NIwzRAZHNg1U1NdllIqbVLIE/kqElAGpLPabsYrVwut4VgA+9puNl3Uk8Bh9aGDMkO3N7fr
	ZSdf36KjkcFh/11NWK6MwoN19YRjC49Xy9yAaenQAcAeFFY2VO5vrMfSd+MOffKMY455kyQOE2DKl
	UHNzHRg2eyND0b5XV5W6fTYQO9w+ookmueVSwPLyvq2NKiMjE+E0007jJMJYeWrPJ6G8LoUVDwnNk
	9CMgL4jkimr/WQxfH+8XosK7XuaqEW8e1GPJdAvt2zRBxtqbIK/X/krGjOEBr2RegSz+y0R7qkbMO
	4ro6DOcA==;
Received: from ip6-localhost ([::1]:22204 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1s1j7N-0063Zr-1X; Tue, 30 Apr 2024 08:45:41 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:43156) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1s1j7I-0063Zj-R5
 for samba-technical@lists.samba.org; Tue, 30 Apr 2024 08:45:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:Cc:To:Date:Message-ID;
 bh=lPgbSIk7Xugq1EuJedy06u5E3JRSpsT0MgUMQZr6Wwo=; b=PEGVHKgKBlN1vDgDr5Ht3ZBQoR
 SSMaxPemHq1A4/hmkQGoCNeBL3nxj5Y/mfFufWakbGkjPW7CLDquk20yZbewAkJS05AFgfu3cWsFo
 6/0GLKzXL8sVEWlW4Fb0bZsoePKlRATRV6t0zkvLlBI4Y0qvFkURNGb+3WBUPyU272MsY9RnkQpCD
 6Ius606PczHD8tpESNEKzd8sFwtz1DtEtvRonHWT9uXrlxn752UOGnIEia2Il9Taiz057A9qjfNkx
 ANG115O9iQEKV9cTCDudaAlzKdBDT36t0COs7R5qWdQdqEHBU7R+eLqmULMvjX6ox9fuaJOPcFSuP
 9PabvHkP6hV/S8kThgxtlIu9Cd6cqC/DPhlqcPKvBCO0M8mhG9qJAMlMYZMuzj/DYqbO8eet6Ccpb
 yByACD1dcQTLZnpexrwXxPHRpuJ+4p2kZhV6LLxIDNors4EvuLAUHKThrFoyniGWitQQ3UIO8Nkeo
 MKdZ05/MhcKsllZhdqeSZCA5;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1s1j7G-0095US-09; Tue, 30 Apr 2024 08:45:34 +0000
Message-ID: <6f392ee2-7648-4505-96c1-a089f1652606@samba.org>
Date: Tue, 30 Apr 2024 10:45:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Samba ctime still reported incorrectly
To: Jeremy Allison <jra@samba.org>
References: <CAH2r5muXqpZN1mu=WAhaxXe0yRB7Rib_CaoGo3h15wwcSPZFuw@mail.gmail.com>
 <b40a9f3b-6d2d-4ddc-9ca3-9d8bb21ee0b9@samba.org>
 <Zi/WD7EsxMBilrT0@jeremy-HP-Z840-Workstation>
 <d9f60326-9ddf-485f-81c8-2012b7598484@samba.org>
Content-Language: en-US, de-DE
In-Reply-To: <d9f60326-9ddf-485f-81c8-2012b7598484@samba.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------DiwWeT0QUNTNLbqUHgnDrxm9"
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
--------------DiwWeT0QUNTNLbqUHgnDrxm9
Content-Type: multipart/mixed; boundary="------------MLIT4EymEDbqaLS4HyDLWqhR";
 protected-headers="v1"
From: Ralph Boehme <slow@samba.org>
To: Jeremy Allison <jra@samba.org>
Cc: Steve French <smfrench@gmail.com>,
 samba-technical <samba-technical@lists.samba.org>,
 CIFS <linux-cifs@vger.kernel.org>
Message-ID: <6f392ee2-7648-4505-96c1-a089f1652606@samba.org>
Subject: Re: Samba ctime still reported incorrectly
References: <CAH2r5muXqpZN1mu=WAhaxXe0yRB7Rib_CaoGo3h15wwcSPZFuw@mail.gmail.com>
 <b40a9f3b-6d2d-4ddc-9ca3-9d8bb21ee0b9@samba.org>
 <Zi/WD7EsxMBilrT0@jeremy-HP-Z840-Workstation>
 <d9f60326-9ddf-485f-81c8-2012b7598484@samba.org>
In-Reply-To: <d9f60326-9ddf-485f-81c8-2012b7598484@samba.org>
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

--------------MLIT4EymEDbqaLS4HyDLWqhR
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gNC8yOS8yNCA5OjI3IFBNLCBSYWxwaCBCb2VobWUgdmlhIHNhbWJhLXRlY2huaWNhbCB3
cm90ZToNCj4gTGV0J3Mgc2VlIGhvdyBtYW55IHRlc3RzIGNvbXBsYWluOg0KPiANCj4gPGh0
dHBzOi8vZ2l0bGFiLmNvbS9zYW1iYS10ZWFtL2RldmVsL3NhbWJhLy0vcGlwZWxpbmVzLzEy
NzIzMzM1NDM+DQoNCnRoaXMgcGlwZWxpbmUNCg0KaHR0cHM6Ly9naXRsYWIuY29tL3NhbWJh
LXRlYW0vZGV2ZWwvc2FtYmEvLS9waXBlbGluZXMvMTI3MjM4NTU0OA0KDQp3YXMgcnVuIHdp
dGggQVVUT0JVSUxEX0ZBSUxfSU1NRURJQVRFTFk9MC4gVGhlcmUgYXJlIGEgZmV3IG5pY2Ug
b25lcywgDQpidXQgaXQncyBub3QgdGhhdCBiYWQuDQoNCg==

--------------MLIT4EymEDbqaLS4HyDLWqhR--

--------------DiwWeT0QUNTNLbqUHgnDrxm9
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEE+uLGCIokJSBRxVnkqh6bcSY5nkYFAmYwr60FAwAAAAAACgkQqh6bcSY5nkbY
kQ/+IjgLbhwAP0aufIBDPr22u5QBH5yOumDkaACgtasQK2gBfGBlLM8VJmS/Gas+DEyeG1Se83ke
CmvN3iYC39JkvxnYwM2ltBXIr++2Rr22VKrrD9iBfLe20GFN7MVew9iWVsSXunbyygkSYrv/TlXt
Jt1c6Na2afWXt1cjdOIdadegHRvzKitThiZAkRi1j7KimChWeamp6JaFJQgUvSK173/Z9wegYBC6
VHBBxq8F1qpZr0v2MwzUVuMCz3x7t8F1LfqhBh79cBS04ShlxKodOwTVg5vza//d203pvQVl+P5e
zM2LdTiOnLfkU6qnQWrT/j5jQs3s9VXPDGlNo1MgSL3FvN1oUdxj7S5LpLxh93uQmPudTsYlKMCQ
Q1agUTNXnheCYtdUENMiKhIDmX5KLOJKTXDde9X2qtcZL0rMlElibsvXcIv0Sy8SOb5DJ73gAGQs
y4z71yvugHh5FMHDZZOkq0oNTfcnFS+nDa4BLJu6F0Nn71f3WRKBRzJ5UXfZDfhhyrB2lzQ4kzXq
9XXLSYVxTfISg3SzHnkCVFa1R9Tk95P4nm6MkzIDzgAez4RgsOrdHjC1rpE8zi4PaDVJFe/XLqXu
TWMYsxoCNTaUccvBBUzJxSvtxq4gnCqAs2arP5W/e3ldDM06Aluexn1bd7Dy+gVefBrFnP2li4gr
5MA=
=my3t
-----END PGP SIGNATURE-----

--------------DiwWeT0QUNTNLbqUHgnDrxm9--

