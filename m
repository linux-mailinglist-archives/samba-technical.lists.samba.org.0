Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AF0A8B61FB
	for <lists+samba-technical@lfdr.de>; Mon, 29 Apr 2024 21:28:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=FIVuRAcCfw5nsBqG+6O+kti+htdP7tJRyjf00Hm6xQg=; b=Rjl+kHBJO71jP5v0XixvgqioQg
	MKaRpap5WaXdvnsupyGQ+MR9blG3VtsQtLeu59V7sZAZNHSx4R/k2cFz+LbOrDXEvH8gNznNSJWQy
	V+dy2TOn0r18yI5ITGrw9YOr3w4iwyeusCjJqTsHCRqLrBMWHeiQjqd1bDRGmyJ5HT+GJz6/DUmE8
	w4jX5c+ERVpC3iabtBLGdIW2ZcXWK3UkGQlupsvpkUo+X5Ma4Pha07emEhPeLcOnAsHkc2hGguWHT
	cJencA+hWfcAoMetL0WK+1ih6gS7OpCGYtZKSHWkoYPfwp3jLmhrnu3niRLc87CEKb4el6dTFutOd
	LcKgE9xQ==;
Received: from ip6-localhost ([::1]:63372 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1s1Wen-0061hJ-H5; Mon, 29 Apr 2024 19:27:21 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:28916) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1s1Wej-0061hC-AU
 for samba-technical@lists.samba.org; Mon, 29 Apr 2024 19:27:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:Cc:To:Date:Message-ID;
 bh=FIVuRAcCfw5nsBqG+6O+kti+htdP7tJRyjf00Hm6xQg=; b=Rd+M1sjtMyMTLYpRAsJqLSGuqt
 fgRR585uHMswq4sTHBUnNcKOb+gevBBf/HcR9YOby9eqb6yLQwXzEofuWr55kxFq6d/VrCzEoc6mq
 GkB0Jtiv0P/14ix0fjA9ILBBcc/dFZfw92UnFXy55VKikPuEpJGSs5jDAMbJcLQomCwIJOWKPuNC/
 pviP99KLprt9WTio+tq6LeI0b0GqoxKsHdJgT75YeU/nP0aZwgJdFvGiSJql5uXkhhDrm/xxS2kgp
 +lNQVXIN1zKCvY8GfQYF0cyAjRlxLtQOfXyJmLZWrbzbolsBQyLI5+GRCpy2vAVlSFAmAxRwAqqq/
 1koV5uvkZdRYox8vuMtgKD1nW5Zob90eoR7ajb74bIgAqr+XSdqVsBwQ2oCM7zTPWzGnCGJfJvdtJ
 LZ33R8lvyuEfpI96vH1IdE4yqhRcZkpU1sLgnozbpAvSMjkstpw0/Av76fwcPaAgsk6yuGux3TMvf
 pyjFQHA1718MlC+26FEG9kbz;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1s1Wei-008z7h-0w; Mon, 29 Apr 2024 19:27:16 +0000
Message-ID: <d9f60326-9ddf-485f-81c8-2012b7598484@samba.org>
Date: Mon, 29 Apr 2024 21:27:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Samba ctime still reported incorrectly
To: Jeremy Allison <jra@samba.org>
References: <CAH2r5muXqpZN1mu=WAhaxXe0yRB7Rib_CaoGo3h15wwcSPZFuw@mail.gmail.com>
 <b40a9f3b-6d2d-4ddc-9ca3-9d8bb21ee0b9@samba.org>
 <Zi/WD7EsxMBilrT0@jeremy-HP-Z840-Workstation>
Content-Language: en-US, de-DE
In-Reply-To: <Zi/WD7EsxMBilrT0@jeremy-HP-Z840-Workstation>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------K8mR0T935j91PvfHkRZlODEJ"
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
--------------K8mR0T935j91PvfHkRZlODEJ
Content-Type: multipart/mixed; boundary="------------y6ZigJ6oyZhknznbD3kR9dBV";
 protected-headers="v1"
From: Ralph Boehme <slow@samba.org>
To: Jeremy Allison <jra@samba.org>
Cc: Steve French <smfrench@gmail.com>, CIFS <linux-cifs@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>
Message-ID: <d9f60326-9ddf-485f-81c8-2012b7598484@samba.org>
Subject: Re: Samba ctime still reported incorrectly
References: <CAH2r5muXqpZN1mu=WAhaxXe0yRB7Rib_CaoGo3h15wwcSPZFuw@mail.gmail.com>
 <b40a9f3b-6d2d-4ddc-9ca3-9d8bb21ee0b9@samba.org>
 <Zi/WD7EsxMBilrT0@jeremy-HP-Z840-Workstation>
In-Reply-To: <Zi/WD7EsxMBilrT0@jeremy-HP-Z840-Workstation>
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

--------------y6ZigJ6oyZhknznbD3kR9dBV
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gNC8yOS8yNCA3OjE3IFBNLCBKZXJlbXkgQWxsaXNvbiB3cm90ZToNCj4gT24gTW9uLCBB
cHIgMjksIDIwMjQgYXQgMTA6NTE6MjFBTSArMDIwMCwgUmFscGggQm9laG1lIHdyb3RlOg0K
Pj4gSGkgU3RldmUsDQo+Pg0KPj4gT24gNC8yOC8yNCA5OjQxIFBNLCBTdGV2ZSBGcmVuY2gg
dmlhIHNhbWJhLXRlY2huaWNhbCB3cm90ZToNCj4+PiBJIGRpZCBhbm90aGVyIHRlc3Qgb2Yg
dGhlIFNhbWJhIHNlcnZlciBjdGltZSBidWcgb24gU2FtYmEgbWFzdGVyDQo+Pj4gKDQuMjEu
MHByZTEpIGFuZCBTYW1iYSBzZXJ2ZXIgaXMgc3RpbGwgYnJva2VuIGluIGhvdyBpdCByZXBv
cnRzIGN0aW1lLg0KPj4+IEFuIGV4YW1wbGUgc2NlbmFyaW8gaXMgc2ltcGxlLCBjcmVhdGlu
ZyBhIGhhcmRsaW5rIGlzIHN1cHBvc2VkIHRvDQo+Pj4gdXBkYXRlIGN0aW1lIG9uIGEgZmls
ZSAoYW5kIHRoaXMgd29ya3MgZmluZSB0byBXaW5kb3dzIHNlcnZlciBhbmQNCj4+PiBrc21i
ZCBldGMpIGJ1dCBTYW1iYSBzZXJ2ZXIgbWlzdGFrZW5seSByZXBvcnRzIGN0aW1lIGFzIG10
aW1lICh1bmxlc3MNCj4+PiB5b3UgbW91bnQgd2l0aCB0aGUgInBvc2l4IiBtb3VudCBvcHRp
b24pLsKgIFRoaXMgZS5nLiBicmVha3MgeGZzdGVzdA0KPj4+IGdlbmVyaWMvMjM2IHdoZW4g
cnVuIHRvIFNhbWJhDQo+Pj4NCj4+PiBNb3JlIGluZm9ybWF0aW9uIGlzIGF0Og0KPj4+IGh0
dHBzOi8vYnVnemlsbGEuc2FtYmEub3JnL3Nob3dfYnVnLmNnaT9pZD0xMDg4Mw0KPj4NCj4+
IEkgd29uZGVyIGlmIHRoaXMgaXMgYSBidWcgZ29pbmcgYmFjayBhcyBmYXIgYXMgDQo+PiBj
OWRjYTgyZWQ3NzU3ZjQ3NDVlZGY2ZWU2MDQ4YmQ5NGQ4NmM0ZGJjDQo+Pg0KPj4gQEplcmVt
eTogZG8geW91IHJlbWVtYmVyIHdoeSB5b3UgY2hvc2UgdG8gcmV0dXJuIG10aW1lIGluIA0K
Pj4gZ2V0X2NoYW5nZV90aW1lc3BlYygpIGFuZCBub3QgY3RpbWU/DQo+IA0KPiBJZiB5b3Ug
bG9vayBjbG9zZWx5IGF0IHRoYXQgY29tbWl0LCB5b3UnbGwgc2VlDQo+IHRoYXQgaXQncyBh
Y3R1YWxseSBub3QgY2hhbmdpbmcgdGhlIGxvZ2ljIHRoYXQNCj4gcHJldmlvdXNseSBleGlz
dGVkIDotKS4NCg0KeWVhaCwgc3VyZSwgYnV0IGl0IHdhcyBhIGRlY2VudCByZWZhY3Rvcmlu
ZyBzbyBJIHdhcyB3b25kZXJpbmcgd2hldGhlciANCnlvdSdkIGNvbnNpZGVyZWQgdGhlIGFj
dHVhbCBsb2dpYyB5b3Ugd2VyZSB0b3VjaGluZyB3YXMgY29ycmVjdC4gOikNCg0KPiANCj4g
LcKgwqDCoMKgwqDCoCBwdXRfbG9uZ19kYXRlX3RpbWVzcGVjKHAsIG1fdGltZXNwZWMpOyAv
KiBjaGFuZ2UgdGltZSAqLw0KPiArwqDCoMKgwqDCoMKgIHB1dF9sb25nX2RhdGVfdGltZXNw
ZWMocCwgY190aW1lc3BlYyk7IC8qIGNoYW5nZSB0aW1lICovDQo+IA0KPiBQcmV2aW91c2x5
IHdlIHdlcmUgdXNpbmcgbV90aW1lc3BlYyBhcyBjaGFuZ2UgdGltZSwNCj4gYW5kIGNfdGlt
ZXNwZWMgaW4gdGhpcyBjaGFuZ2Ugbm93IGNvbWVzIGZyb206DQo+IA0KPiArwqDCoMKgwqDC
oMKgIGNfdGltZXNwZWMgPSBnZXRfY2hhbmdlX3RpbWVzcGVjKGZzcCwgc21iX2ZuYW1lKTsN
Cj4gDQo+ICtzdHJ1Y3QgdGltZXNwZWMgZ2V0X2NoYW5nZV90aW1lc3BlYyhzdHJ1Y3QgZmls
ZXNfc3RydWN0ICpmc3AsDQo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY29uc3Qgc3RydWN0IHNtYl9maWxlbmFtZSAq
c21iX2ZuYW1lKQ0KPiArew0KPiArwqDCoMKgwqDCoMKgIHJldHVybiBzbWJfZm5hbWUtPnN0
LnN0X2V4X210aW1lOw0KPiArfQ0KPiANCj4gU28gSSBhY3R1YWxseSB3YXNuJ3QgY2hhbmdp
bmcgd2hhdCB3ZSBhbHJlYWR5IHdlcmUNCj4gZG9pbmcgOi0pLg0KPiANCj4gTm93IGFzIHRv
ICp3aHkqIHdlIHdlcmUgdXNpbmcgbV90aW1lIGluc3RlYWQgb2YgY190aW1lLA0KPiBteSBn
dWVzcyBpcyB0aGF0IHdlIHdlcmUgdHJ5aW5nIHRvIGVtdWxhdGUgTlRGUw0KPiBzZW1hbnRp
Y3Mgd2hpY2ggd2VyZSBub3QgZG9jdW1lbnRlZCBvciB3ZWxsIHVuZGVyc3Rvb2QgYXQgdGhl
DQo+IHRpbWUgKHdoZXJlICJ0aGUgdGltZSIgaXMgcHJvYmFibHkgcHJpb3IgdG8gMjAwOSA6
LSkuDQoNCkhtLCBzbyB3aGF0IGRvIHdlIGRvPyBNUy1GU0Egc2VlbXMgdG8gaW5kaWNhdGUg
TlRGUyBjdGltZSBoYXMgcHJldHR5IA0KbXVjaCB0aGUgc2FtZSBzZW1hbnRpY3MgYXMgUE9T
SVggY3RpbWU6DQoNCjIuMS4xLjMgUGVyIEZpbGUNCg0KTGFzdENoYW5nZVRpbWU6IFRoZSB0
aW1lIHRoYXQgaWRlbnRpZmllcyB3aGVuIHRoZSBmaWxlIG1ldGFkYXRhIG9yIA0KY29udGVu
dHMgd2VyZSBsYXN0IGNoYW5nZWQgaW4gdGhlIEZJTEVUSU1FIGZvcm1hdCBzcGVjaWZpZWQg
aW4gW01TLUZTQ0NdIA0Kc2VjdGlvbiAyLjEuMS4NCg0KTGV0J3Mgc2VlIGhvdyBtYW55IHRl
c3RzIGNvbXBsYWluOg0KDQo8aHR0cHM6Ly9naXRsYWIuY29tL3NhbWJhLXRlYW0vZGV2ZWwv
c2FtYmEvLS9waXBlbGluZXMvMTI3MjMzMzU0Mz4NCg==

--------------y6ZigJ6oyZhknznbD3kR9dBV--

--------------K8mR0T935j91PvfHkRZlODEJ
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEE+uLGCIokJSBRxVnkqh6bcSY5nkYFAmYv9JMFAwAAAAAACgkQqh6bcSY5nkav
Tw/8DC0CoBZKep+j/rZx2L4VAVCwVdnwNL328U2KF4wdGhORWT8L2/8JaCt+UDYubXYuaPXqvARg
Orx4FG7DabtNklInEMMnD0nC1iJ4bKa7y0eP7EQszl/JU7gf9qhw7iAFs4IgrZwERS8H641UCV0p
4xjLWaMilRS7LuuPcF0nBx9+1WHDTsxh80XvfclsObAqiPkOcOrBrpQlte81Ml3wZNMt2hrpMNWb
QMjFq9UAJUGQCgqyCiwm/1R73WWmA8+MKkb3U9A6EO7fxVj8LEYA660G9FlLHEbZFaLqDyIG+yjK
vKnJQXaK3D6ODKwGsal/sQC0VsHjE8WlrtANOp1rcLudeWbU8X/kPeEyWJ6S9UJVcHzV7Edaw7UU
2rtdbIdtS/mTQgsL7DFMw4FHcnDiWU1qQQumwrv9pSnaJ8/buT1pQtiXk3hUBIwavY9W2bi9nWW2
1pFLanr+/eX2Fsw4r9K7rxxjMD1Nb8+dRM4PstOHZKIhs4ZA0lxDjWh9Vm8037pCGpVt2H6oxvej
ntQ/eaYCnGnzZXDCDUv7qYDQa3YthDKZz7Agy/V7vcXErfSECjwxuj3rWOtQ0iq02xDhr/4X5fms
yEGEeApQAXPQU4F1kzZE8x0bTpncvp66w2SPIkqKJ6oJ+K+uIugKcnss1NmOKSeyBYmGtG/trGWl
e68=
=Q8o3
-----END PGP SIGNATURE-----

--------------K8mR0T935j91PvfHkRZlODEJ--

