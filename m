Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 6786F8AB2A1
	for <lists+samba-technical@lfdr.de>; Fri, 19 Apr 2024 17:58:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=yidgnp2eXeizX7W6Uz2vJpOpSRPjfAIACyTsTwt/aO8=; b=aPtLUcwrtMpD8qKDTZYkOVM9NO
	6hROLZuY8ZDcBZlBQeNEY9cxpBuXGXyzCHL0INlY/AvCOj14pf0q4oaTm7qdadiPPzEMrOxqwp5UH
	BzSJSiKI0Jo2rMNVPfLNp+fngIUm3QC6aPWR2CDbDbUxqUq5cZIZwPXirgZZJ4B9yRgzwJD75DZBj
	gAw6dSL4hBttz8I7lxVnILNsxVaIzQTP7I8PoFA41jvOrgjpb7eQi15IkrDpaAOQGwnuGhdPM8Rwd
	d94Tyl3s95Gd1RGRyM8zogOU6KZExqe+uEgdsixJJLXOjnknuxb/xF770zJEVS8Q7aAy3R0dTGXF4
	XbJAyCEA==;
Received: from ip6-localhost ([::1]:33716 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1rxqd9-005Cgv-MV; Fri, 19 Apr 2024 15:58:27 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:40390) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rxqd6-005Cgo-7E
 for samba-technical@lists.samba.org; Fri, 19 Apr 2024 15:58:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:Cc:To:Date:Message-ID;
 bh=yidgnp2eXeizX7W6Uz2vJpOpSRPjfAIACyTsTwt/aO8=; b=epr4DHq4V36isLbS6aVxx+hI2m
 d+yr2lzvPnzeDFUQa+KRvHufw7Xq/QZAF68Wf73FZt2IFbkWkTMyPhDCHffxlTcvh6bV8lDPONLin
 D4PKdznGPbxKq8GhJF9uqsdstuMnWM5Y3E4lxNwJlCseCIWGl6rt/aX4c+wrNr48rCSW5NU43zhPD
 yJN+FJXcAvHYOqtMBou0g4zEyzsIk6G+pLD1BAqw3JL83So4tYCkq/aaDmDX5JyVMggstc1ieSrsp
 EirbkUzBRc0p4izAi8OjejFuBpNedP73lawXrGdBMBCW5pwrPmt/Fa4QRX/17yzPI5XGiR2RhJ3NO
 07fFcGJnPtapMXy0eOJ4gPmE/vHQE59DpjnKX/LcEr9YkUT6siPtIwamSbX0BckDpkLmuIScmoW7A
 3qK0fPRbxYaLJvXif+C82MqMqztg+2902Yhj5rILp+TeWaGmePTWb4YXCdRs2x45k9nVUR4MA777/
 y/H+G9GVYQwyGlwNJ7FRBbmo;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rxqd5-007HPy-1W; Fri, 19 Apr 2024 15:58:23 +0000
Message-ID: <1ea601ed-b40b-4116-b378-32508a6619d7@samba.org>
Date: Fri, 19 Apr 2024 17:58:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Missing protocol features that could help Linux
To: Jeremy Allison <jra@samba.org>, Andrew Bartlett <abartlet@samba.org>
References: <CAH2r5mstDacz=gvpjFQeB_nc1kBjyzTZw57tF8UNrXARXkV1rQ@mail.gmail.com>
 <c7d80c1538db3a414636977314feba13871907ef.camel@samba.org>
 <ZiKT4CursWvT2dhq@jeremy-HP-Z840-Workstation>
Content-Language: en-US, de-DE
In-Reply-To: <ZiKT4CursWvT2dhq@jeremy-HP-Z840-Workstation>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------vWthM8oT5NlLwYqNGG6yzJBQ"
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
 Namjae Jeon <linkinjeon@kernel.org>, CIFS <linux-cifs@vger.kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------vWthM8oT5NlLwYqNGG6yzJBQ
Content-Type: multipart/mixed; boundary="------------0Y2HB0CSVNKjw37gX8pscK02";
 protected-headers="v1"
From: Ralph Boehme <slow@samba.org>
To: Jeremy Allison <jra@samba.org>, Andrew Bartlett <abartlet@samba.org>
Cc: Steve French <smfrench@gmail.com>,
 samba-technical <samba-technical@lists.samba.org>,
 CIFS <linux-cifs@vger.kernel.org>, Namjae Jeon <linkinjeon@kernel.org>
Message-ID: <1ea601ed-b40b-4116-b378-32508a6619d7@samba.org>
Subject: Re: Missing protocol features that could help Linux
References: <CAH2r5mstDacz=gvpjFQeB_nc1kBjyzTZw57tF8UNrXARXkV1rQ@mail.gmail.com>
 <c7d80c1538db3a414636977314feba13871907ef.camel@samba.org>
 <ZiKT4CursWvT2dhq@jeremy-HP-Z840-Workstation>
In-Reply-To: <ZiKT4CursWvT2dhq@jeremy-HP-Z840-Workstation>
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

--------------0Y2HB0CSVNKjw37gX8pscK02
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gNC8xOS8yNCAxNzo1NSwgSmVyZW15IEFsbGlzb24gd3JvdGU6DQo+IFBPU0lYIGxvY2tz
IGNhbiBiZSBzcGxpdC9tZXJnZWQvb3ZlcmxhcHBlZC4gV2luZG93cyBsb2Nrcw0KPiBtdXN0
IGJlIGRpc3RpbmN0LiBDdXJyZW50bHkgb3ZlciBTTUIzIHdlIG9ubHkgZXhwb3NlIFdpbmRv
d3MNCj4gbG9ja3MuDQoNCm1heWJlIHRoZXkgY2FuIHVzZSB0aGUgZXhwZXJpbWVudGFsIFNN
QjMgVU5JWCBleHRlbnNpb25zPyBUaGF0IHNob3VsZCANCmFsc28gZW5hYmxlIFBPU0lYIGxv
Y2tpbmcgYmVoYXZpb3VyIGZvciB0aGUgY2xpZW50Og0KDQpzbWIzIHVuaXggZXh0ZW5zaW9u
cyA9IHllcw0KDQpDaGVlcnMhDQotc2xvdw0KDQo=

--------------0Y2HB0CSVNKjw37gX8pscK02--

--------------vWthM8oT5NlLwYqNGG6yzJBQ
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEE+uLGCIokJSBRxVnkqh6bcSY5nkYFAmYilJ4FAwAAAAAACgkQqh6bcSY5nkYF
qQ//Tvp3ZsI0UBOWuHn8nWNCrUaHTJvznfFhi3dlBpWreX8bT3+GLT4sxPXO0UVsiW2Io9xBussX
rkd31y9QwPBH3XdhVoqE1JHMXIXp8zSpFUdJU7K2T3IJcNiaOkKJMdxGUYF53dFJKp7VXLUvYVdM
Wyu2230+tr0lLiLzPUSKCV0/Aa084jIqdkMEvnfntlcaqUsEx+J+Zu24ldpTTfxMLuJr9v4QkxoM
6qZ7P+u7eFSxCBddXP2r8hKoSHRXBXmo7+JHECFqflNhsXMrE7mLUQwoKjkwrpaYLsZ1sMhEt+xr
ff7L57BmuxRqHqRTgJJp7R9W1vtZ3CWUUnvouLue7j9QWkKY14awLE8Ukvpz5wnoFE1TQJB/uyOn
ARXh+8lcAD39gA03+gAYZlswJxVcfvlVVSlLRkfGdSZmtN9IEb+za4FEwsM8jt/kcRmTW9SIz/uC
RlVki8yzpzhTl/B5hLgbqgsqSFDKzwZyvHa6Xiv2OeA0pwJMoI6A9ubeW70FrJdWo1lt2roJhYrZ
bL2a3rSv5RbvNksyhGn3UZYWn5vBatF7+qq7yf1qGmVevI2BRyi9OCeKsrcYozcJ99Ge5GPtqrJo
h2NtEjvX9ytcrgGJC7Dm4yKKUnm8eaKxdi9jBMzFb4sZ+XVzqfrOea2JpDBpaCGxTrh26KPgLH6h
uBI=
=dUum
-----END PGP SIGNATURE-----

--------------vWthM8oT5NlLwYqNGG6yzJBQ--

