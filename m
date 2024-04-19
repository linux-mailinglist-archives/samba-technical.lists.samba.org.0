Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D4B48AB3C8
	for <lists+samba-technical@lfdr.de>; Fri, 19 Apr 2024 18:53:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=CdLUAg6J9P9CgZmrtUFiWuJ3BIHGk3wTFq9/m4uRmuY=; b=wV0YcC43AetHm5R/BybifR9+ea
	A5A1Kry7gbOEflwPXRfiJWclRY07q/xra0uSlTpbTs1+XDitKNUe7VKp2uU0FmtHxJvynq4swNBM8
	BfAeDiThj8TITFajCQbeLUwZhbzG1FpCPPke92bm+62NofKYP9Acv0PcDAo2O1ipTijJSV7ttp8pA
	D9J2MeSkuR8lNV30Gc8tzF2XLIoHLDNuGbYbKbaSZkBwEFbbGgDHS2kCP/wXB096sctWs1XK9o2u9
	OSrn1oc+1oDMzexAfqGKlzKMl9atuqyKdY7lJYOZRGMUUaNkweQv7LR3CNhgim4Uc3Cc1WaYhDz8J
	F0/kp4pg==;
Received: from ip6-localhost ([::1]:44932 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1rxrU3-005D0P-Gg; Fri, 19 Apr 2024 16:53:07 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:33384) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rxrTz-005D0F-5Z
 for samba-technical@lists.samba.org; Fri, 19 Apr 2024 16:53:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:Cc:To:Date:Message-ID;
 bh=CdLUAg6J9P9CgZmrtUFiWuJ3BIHGk3wTFq9/m4uRmuY=; b=x2SCEn0YNrzqzeCmS3kvevJtdl
 lg816d81lX1biP+U/8I/9Q2qdTyp7BLP4gL9DroAG8O0MTGDmSz7ky6l5orEYPQ8gydqKV0cHByc9
 JNIZFaJcfwjvblzQ//wlUfAYFSOuf2Bj6kV34HDVsK4bR7k6pH9KeYjvdi8cVs1mrFLUiara6cc71
 ap3dNaDZh1y4L8wtM5jEgFI5vuyuMTI049pauEPRaHP1DvinZ6GF4hJR8ihCD+HaY+za/+WoaOx1C
 nVylZVTkHcE6N0Didj+KPSIxQ/2bNG5xTWP+lhCTIaLWoRDDGU0923bYne2Z1NyCBQK1jkancdCsN
 GvN0t20Z9tuab75jxitJZ8UEIo0IcJHCZWTcINDjUPhoDKA7rwCzrkSPF3hUyxIShMauWQje9sLVY
 PhI5cvlDt8MldG94l631xWF++A+SsAAdsu/pCWjlePr+prbGN6/5ndDB2ZRHKFYaAMM61l3k0TKqi
 SHruXGf1zmjbyCpCE0lUT08y;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rxrTy-007Hw8-01; Fri, 19 Apr 2024 16:53:02 +0000
Message-ID: <e69bad72-9139-4b01-afe5-5d34edc077a1@samba.org>
Date: Fri, 19 Apr 2024 18:53:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Missing protocol features that could help Linux
To: Steve French <smfrench@gmail.com>,
 samba-technical <samba-technical@lists.samba.org>
References: <CAH2r5mstDacz=gvpjFQeB_nc1kBjyzTZw57tF8UNrXARXkV1rQ@mail.gmail.com>
Content-Language: en-US, de-DE
In-Reply-To: <CAH2r5mstDacz=gvpjFQeB_nc1kBjyzTZw57tF8UNrXARXkV1rQ@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------mdtgv3JNGIQa0naBBbp00lUM"
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
Cc: CIFS <linux-cifs@vger.kernel.org>, Namjae Jeon <linkinjeon@kernel.org>,
 Jeremy Allison <jra@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------mdtgv3JNGIQa0naBBbp00lUM
Content-Type: multipart/mixed; boundary="------------2A7TsdRsXHAyfa8HrzUIZq0I";
 protected-headers="v1"
From: Ralph Boehme <slow@samba.org>
To: Steve French <smfrench@gmail.com>,
 samba-technical <samba-technical@lists.samba.org>
Cc: CIFS <linux-cifs@vger.kernel.org>, Namjae Jeon <linkinjeon@kernel.org>,
 Jeremy Allison <jra@samba.org>
Message-ID: <e69bad72-9139-4b01-afe5-5d34edc077a1@samba.org>
Subject: Re: Missing protocol features that could help Linux
References: <CAH2r5mstDacz=gvpjFQeB_nc1kBjyzTZw57tF8UNrXARXkV1rQ@mail.gmail.com>
In-Reply-To: <CAH2r5mstDacz=gvpjFQeB_nc1kBjyzTZw57tF8UNrXARXkV1rQ@mail.gmail.com>
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

--------------2A7TsdRsXHAyfa8HrzUIZq0I
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gNC8xOC8yNCAyMjoyMSwgU3RldmUgRnJlbmNoIHZpYSBzYW1iYS10ZWNobmljYWwgd3Jv
dGU6DQo+IFdhcyBmb2xsb3dpbmcgdXAgb24gYSByZWNlbnQgcXVlc3Rpb24gYWJvdXQgc3Vw
cG9ydCBmb3IgTGludXggZmVhdHVyZXMNCj4gdGhhdCBhcmUgbWlzc2luZyB0aGF0IGNvdWxk
IGhlbHAgdXMgcGFzcyBtb3JlIHhmc3Rlc3RzDQo+IA0KPiBMb29raW5nIGF0IHRoZSBzdGFu
ZGFyZCBmc3Rlc3RzIGZvciBMaW51eCAoeGZzdGVzdHMgdGhhdCBhcmUgc2tpcHBlZA0KPiBv
ciBmYWlsIGZvciBjaWZzLmtvKSB0byBmaW5kICdmZWF0dXJlcycgdGhhdCB3b3VsZCBoZWxw
LCBwZXJoYXBzDQo+IGV4dGVuZGluZyB0aGUgY3VycmVudCBQT1NJWCBFeHRlbnNpb25zIG9y
IGFkZGluZyBhIGNvdXBsZSBvZiBTTUIzLjEuMQ0KPiBGU0NUTHMsIEkgc3BvdHRlZCBhIGZl
dyBvYnZpb3VzIG9uZXM6DQo+IA0KPiAgIDEpIHJlbmFtZWF0MiAoUkVOQU1FX0VYQ0hBTkdF
KSBhbmQgcmVuYW1lYXQyKFdISVRFT1VUKSAgMikgRklUUklNDQo+IHN1cHBvcnQgMykgdHJ1
c3RlZCBuYW1lc3BhY2UgKHBlcmhhcHMgeGF0dHIvRUEgZXh0ZW5zaW9uKSA0KSBhdHRyDQo+
IG5hbWVzcGFjZSA1KSBkZWR1cGxpY2F0aW9uIDYpIGNoYXR0ciAtaSA3KSB1bnNoYXJlIChu
YW1lc3BhY2UgY29tbWFuZCkNCj4gOCkgZGVsYXllZCBhbGxvY2F0aW9uIDkpIGRheCAxMCkg
YXR0ciBuYW1lc3BhY2Ugc2VjdXJpdHkgMTEpIGZzdHJpbQ0KPiAxMikgY2hhdHRyICtzIDEz
KSBleGNoYW5nZSByYW5nZQ0KPiANCj4gQW55IHRob3VnaHRzIG9uIHdoaWNoIG9mIHRoZXNl
IHdoaWNoIHdvdWxkIGJlICdlYXN5JyBmb3Igc2FtYmEgYW5kL29yDQo+IGtzbWJkIHNlcnZl
ciB0byBpbXBsZW1lbnQgKGUuZy4gYXMgbmV3IGZzY3Rscyk/DQoNCndlbGwsIEkgZ3Vlc3Mg
bm9uZSBvZiB0aGVzZSB3aWxsIGJlIHJlYWxseSAiZWFzeSIuDQoNCklpcmMgd2hlbiBJIGxh
c3QgYnJvdWdoIHVwIGZpbGUgYXR0cmlidXRlcywgd2UgdmV0dGVkIHRvd2FyZHMgcG9zdHBv
bmluZyANCnRoaXMga2luZCBvZiBzdHVmZiB1bnRpbCB3ZSBoYXZlIGZ1bGwgc3VwcG9ydCBm
b3IgdGhlIGNvcmUgU01CMyBQT1NJWCANCmZlYXR1cmVzIGluIFNhbWJhLiBJaXJjIHRoZSBv
bmx5IHJlYWwgdGhpbmcgbWlzc2luZyB0aGVyZSBpcyANCnN5bWxpbmsvcmVwYXJzZSBwb2lu
dCBoYW5kbGluZyBhbmQgZm9yIHRoYXQgd2UgbmVlZCB0byBzZXR0bGUgb24gd2hpY2ggDQpy
ZXBhcnNlIHR5cGUgdG8gdXNlIChXU0wgdnMgTkZTKSBhcyBkaXNjdXNzZWQgeWVzdGVyZGF5
LiBJdCB3b3VsZCBiZSBhIA0KKmh1Z2UqIGhlbHAgU3RldmUsIGlmIHlvdSBjYW4gcHVyc3Vl
IHRoaXMgaW50ZXJuYWxseSwgdGhpcyBoYXMgYmVlbiBhIA0KYmxvY2tlciBmb3IgdGhlIHdo
b2xlIHByb2plY3Qgc2luY2UgcXVpdGUgc29tZSB0aW1lLi4uDQoNCi1zbG93DQoNCg==

--------------2A7TsdRsXHAyfa8HrzUIZq0I--

--------------mdtgv3JNGIQa0naBBbp00lUM
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEE+uLGCIokJSBRxVnkqh6bcSY5nkYFAmYioW0FAwAAAAAACgkQqh6bcSY5nkai
yg//ShKTodwJKbzqEMo/gLLtz+Q2zUykb0yTcw8P1UB4VkeSwJTldq0dqNCXOOqxMcGp0pNMVl69
Ra7qziNgxSd4DfCqPJCP7km+xmmDVCjMNumiAoqtJ2T7+VhvKLRCunIxND1GvjBHcVj60qKTIOdF
Dq1s4t9fL7UYotoP8UquCXuN7mZyxL+qLFqi408eAivxbchhgU56nQ1LaTzTtp79ifzKXiGiKm06
gqDNOD0fKYNnG3gz+6RAJb48lEsPnWZSyO2vFw+9fvqGnlT2l5TRURFW0y0RA/KOIMVjTUpPjs37
LCxboqG3vROgfJZbvUjgmd7Xqt/Qc2utbVPB4XE61sZHElH2upqiwcRdy3f80JMkwXR/qY4IVDR3
zo3/GoMSwKTE1kZnUJQfVZesbXGOZhwzNJuD1GRR1wcASMBCX6MFf6aJDkxP7kf2nFHlv4RkKV4Z
gS0y2PKHbCPLWif+zwRN9lygvn4kNILYd5AnjDAAQESBLAOEmDBaWamUIQEjr9RnhwBvOTCd+A5e
BVJdw5cudOAnrnDoAaD4JlDOjOBMNzdzPk0REEhe3OAW6Qfi0A1pbngb9IQllQwSWWmlomI14PrA
gcOvFFoxs5fbBut7xACD+ujz8MCj6pGiyiogxPsiol+ykxqjF1rHa4XB510qkkVsqp6A4YtHGR5q
6Dg=
=Iaqv
-----END PGP SIGNATURE-----

--------------mdtgv3JNGIQa0naBBbp00lUM--

