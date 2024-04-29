Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id C78CA8B5F51
	for <lists+samba-technical@lfdr.de>; Mon, 29 Apr 2024 18:44:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=SVy0R4ZEvep0aD/IuUJ9sPgMskcH3sXlnbrUJ5vdxys=; b=Tz/FEiBRudy975WaQKSkfcLPf/
	YK23R1KSbonuYkbqi+eM1pfNO94PU80GZh6zpxv36ehPTfiS2w3So8ZZ39vkcEjqBSXecVandI34d
	qim833FRotQ0zUCpx1OluSrW0Xg4uJlTVoWk4I4eWdsj4LgbrLkX/pDAumGn9B89QMMt80B0+Pj9B
	CMiT7YKbUibEGBVzcvdllzy6RRf4DKtq/VhQZPfEDbLYDFstp4OQmizZa75GR1/VKNVzVJXLuMS7i
	t/qv8b5tLAgbT+8fUnr/m+Uok/mtD0jO63dLrcfYnWXRRzzhVBPsEYgXRwBpSsxIUck4ZTJIlaou2
	HDuVKokw==;
Received: from ip6-localhost ([::1]:18546 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1s1U7R-0061DL-6M; Mon, 29 Apr 2024 16:44:45 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:57426) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1s1U7M-0061DE-OB
 for samba-technical@lists.samba.org; Mon, 29 Apr 2024 16:44:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:Cc:To:Date:Message-ID;
 bh=SVy0R4ZEvep0aD/IuUJ9sPgMskcH3sXlnbrUJ5vdxys=; b=n2j7dengqDoLnvBZEN3uVU9yPU
 ALrZ/llPjJk+ZXqorGzk//lAWNt7NsPuRl3zn9/jMTQGtJFlrBFDtF6KCY48MembZ1MwslBYfpGRy
 hMZggj7iI9r/eFeeray9nR3vGRSIf5MqM0sJyvnJ3p+95zY6rTODW0pCVXX3IIX0KR7canKSTQok0
 xnxHLdVoM81M7bBLVsbI3+evuBg/JM9l4HgGigoe+ZwLAAoHH2WyR01vrbR1HfRDF57f1GIMDbNmz
 9rs3O+u7pYVN0MS53okXkigaoANP0GvPsdKMNBX77KeblVnqbHsW6KikU4fr7ZPjiv8V4Osd1k9LF
 nKYjJWCHgDtxJQLwhHj5MkaW7kB0MRQPiQB1oiKKL6e9kEQvyC0UleqCemneO1ayNbsCdIQ+6ueeM
 ZX4R0MPdCmBzjSWzEQrTNFc5w9jQmSyXCo3ma+iHbJbbHrbGyB3hRZ8C0I2eKXG9jsFY4z2ishP7S
 jGFP3Pdtx0jOK9ljZCiqLYtW;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1s1U7L-008y3b-2z; Mon, 29 Apr 2024 16:44:40 +0000
Message-ID: <83480311-74b1-4ee6-be85-5b21b0f55ee9@samba.org>
Date: Mon, 29 Apr 2024 18:44:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: query fs info level 0x100
To: Steve French <smfrench@gmail.com>
References: <CAH2r5msg91ad+K+eZmCjKCJeDgyb6xcUUhmpaXeeTFjqFZUeBA@mail.gmail.com>
 <72ec968a-ac67-415f-8478-d1b9017c0326@samba.org>
 <CAH2r5muhcnf6iYaB25k+wZC50b5pNV+enrK=Ye_-9t2NCVdCJQ@mail.gmail.com>
Content-Language: en-US, de-DE
In-Reply-To: <CAH2r5muhcnf6iYaB25k+wZC50b5pNV+enrK=Ye_-9t2NCVdCJQ@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------HU5CWFqdUnTCCbO3V00Q5gdn"
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
Cc: CIFS <linux-cifs@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>,
 Jeremy Allison <jra@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------HU5CWFqdUnTCCbO3V00Q5gdn
Content-Type: multipart/mixed; boundary="------------g0Vb3TZS9MUhuVFhz60on7kd";
 protected-headers="v1"
From: Ralph Boehme <slow@samba.org>
To: Steve French <smfrench@gmail.com>
Cc: samba-technical <samba-technical@lists.samba.org>,
 Jeremy Allison <jra@samba.org>, CIFS <linux-cifs@vger.kernel.org>
Message-ID: <83480311-74b1-4ee6-be85-5b21b0f55ee9@samba.org>
Subject: Re: query fs info level 0x100
References: <CAH2r5msg91ad+K+eZmCjKCJeDgyb6xcUUhmpaXeeTFjqFZUeBA@mail.gmail.com>
 <72ec968a-ac67-415f-8478-d1b9017c0326@samba.org>
 <CAH2r5muhcnf6iYaB25k+wZC50b5pNV+enrK=Ye_-9t2NCVdCJQ@mail.gmail.com>
In-Reply-To: <CAH2r5muhcnf6iYaB25k+wZC50b5pNV+enrK=Ye_-9t2NCVdCJQ@mail.gmail.com>
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

--------------g0Vb3TZS9MUhuVFhz60on7kd
Content-Type: multipart/mixed; boundary="------------ydXWauukc0iw0g91eqtIsoyh"

--------------ydXWauukc0iw0g91eqtIsoyh
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gNC8yOS8yNCA2OjEzIFBNLCBTdGV2ZSBGcmVuY2ggd3JvdGU6DQo+IEJ1dCB0aGUgKGN1
cnJlbnQgU2FtYmEpIHNlcnZlciBmYWlscyB0aGUgbGV2ZWwgMTAwIChsZXZlbCAweDY0IGlu
IGhleCkNCj4gRlNfUE9TSVhfSU5GTyB3aXRoICJTVEFUVVNfSU5WQUxJRF9FUlJPUl9DTEFT
UyINCj4gd2hpY2ggY2F1c2VzIGFsbCB4ZnN0ZXN0cyB0byBicmVhayBzaW5jZSB0aGV5IGNh
bid0IHZlcmlmeSB0aGUgbW91bnQNCj4gKGUuZy4gd2l0aCAic3RhdCAtZiIpLg0KPiBOb3Ro
aW5nIHJlbGF0ZWQgdG8gdGhpcyBvbiB0aGUgY2xpZW50IGhhcyBjaGFuZ2VkLCBhbmQga3Nt
YmQgaGFzDQo+IGFsd2F5cyBzdXBwb3J0ZWQgdGhpcyBzbyB3b3JrcyBmaW5lIHRoZXJlLg0K
DQphaCwgSSBicm9rZSBpdC4gRml4IGF0dGFjaGVkLiBSZWFsbHkgZW1iYXJyYXNzaW5nLi4u
DQoNCi1zbG93DQoNCg==
--------------ydXWauukc0iw0g91eqtIsoyh
Content-Type: text/x-patch; charset=UTF-8; name="bug15639-master.patch"
Content-Disposition: attachment; filename="bug15639-master.patch"
Content-Transfer-Encoding: base64

RnJvbSAzODYyNTYzNTgyNjgzZjg2YTFmZDVkMjU0MjJiMzEzN2YxYjA1MTQxIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBSYWxwaCBCb2VobWUgPHNsb3dAc2FtYmEub3JnPgpE
YXRlOiBNb24sIDI5IEFwciAyMDI0IDE4OjM4OjEwICswMjAwClN1YmplY3Q6IFtQQVRDSF0g
c21iZDogU01CMyBQT1NJWCBFeHRlbnNpb25zIHN0YXRmcygpIGlzIGJyb2tlbgoKUmVncmVz
c2lvbiBpbnRyb2R1Y2VkIGJ5IDU1ZDk4YjI5ZWIyOTQ1NDJjYzQ5NDc1NzNmMjMzZTBkNWU2
OTY2Y2IuIEQnb2ghCgpCVUc6IGh0dHBzOi8vYnVnemlsbGEuc2FtYmEub3JnL3Nob3dfYnVn
LmNnaT9pZD0xNTYzOQoKU2lnbmVkLW9mZi1ieTogUmFscGggQm9laG1lIDxzbG93QHNhbWJh
Lm9yZz4KLS0tCiBzb3VyY2UzL3NtYmQvc21iMl90cmFuczIuYyB8IDIgKy0KIDEgZmlsZSBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3Nv
dXJjZTMvc21iZC9zbWIyX3RyYW5zMi5jIGIvc291cmNlMy9zbWJkL3NtYjJfdHJhbnMyLmMK
aW5kZXggNTE5OGEwNGE3NGM2Li44ZTEyMjAyNWQyODMgMTAwNjQ0Ci0tLSBhL3NvdXJjZTMv
c21iZC9zbWIyX3RyYW5zMi5jCisrKyBiL3NvdXJjZTMvc21iZC9zbWIyX3RyYW5zMi5jCkBA
IC0xOTkxLDcgKzE5OTEsNyBAQCBzdGF0aWMgYm9vbCBmc2luZm9fdW5peF92YWxpZF9sZXZl
bChjb25uZWN0aW9uX3N0cnVjdCAqY29ubiwKIAkJCQkgICAgdWludDE2X3QgaW5mb19sZXZl
bCkKIHsKIAlpZiAoY29ubl91c2luZ19zbWIyKGNvbm4tPnNjb25uKSAmJgotCSAgICBmc3At
PnBvc2l4X2ZsYWdzID09IEZTUF9QT1NJWF9GTEFHU19PUEVOICYmCisJICAgIChmc3AtPnBv
c2l4X2ZsYWdzICYgRlNQX1BPU0lYX0ZMQUdTX09QRU4pICYmCiAJICAgIGluZm9fbGV2ZWwg
PT0gU01CMl9GU19QT1NJWF9JTkZPUk1BVElPTl9JTlRFUk5BTCkKIAl7CiAJCXJldHVybiB0
cnVlOwotLSAKMi40NC4wCgo=

--------------ydXWauukc0iw0g91eqtIsoyh--

--------------g0Vb3TZS9MUhuVFhz60on7kd--

--------------HU5CWFqdUnTCCbO3V00Q5gdn
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEE+uLGCIokJSBRxVnkqh6bcSY5nkYFAmYvzncFAwAAAAAACgkQqh6bcSY5nkbs
0w/9Gm6MW/V42B9hl+l//kepsNewHn1vGHjEhT9C5y64gvkbxikohJV4vz3UR51hOHz7fqfzr4R4
Nh/nBxoNqTr3jYZt5mznvDSg3esvwujC2PM2Qvxgj79MhdezrY3w0SmXXgmGen9n6Y53GCFuYXFw
qpQykD4V7xcEP8X1xx1oDFh0lkuBUVtd5lP2Ddr8QdVTEuO/K2+RN6YJTF1rkxgRVWw2iOjMoWXE
hVUiO/KwKbMFDdA1Vs0Wh3pAGWf923Awbf9trj+5jubN3LXXknFclca8NlhA8qDlFEF5nAxBBOrb
iCwgWXvvjehF7HSX/zUqhZjZOEyxVcURTV5sSv1roaCx7fHHT38eV1NfKn/nPg5rM1+A/Ck+yRsH
AyqTb1BGLFuyF3ov9kshrjlj+OHPhp6O6Qlt/KRSHdzyV+W4GdZd6IgRqm5mRhvA4VUgo2AgsdM6
R7aGWwSRwtCmw22LLrbOPga/fA1ue4E4yDh3XBPGMwFO7va9ZOm0TPtz/rupp4a8A+quo+Imdj0Z
sv87IGylfwgXURWUNBgoPPCAQtGtN8Kaj0vUiABkRJfHvQucXfbXE8LI+37kAXYLRZTpTK50AUh2
3CBySKqZJJtiUT0qJ01SE5SKNHAABvQ25GIESoKpnu22U2z0VwohylsAiPL08h+oijAvG48qXua2
WY4=
=xYkB
-----END PGP SIGNATURE-----

--------------HU5CWFqdUnTCCbO3V00Q5gdn--

