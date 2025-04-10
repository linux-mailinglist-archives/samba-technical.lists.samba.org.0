Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id EB4FCA83D13
	for <lists+samba-technical@lfdr.de>; Thu, 10 Apr 2025 10:34:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=uipzv4lbUp1HDr06giaCBYq5HoKcMQO+vUXhUyohBu0=; b=bXCvil8cnmk6uo7V1K42Jhyy11
	/+7+w+aYzoR7C5ecZ6jkdUgSTE5OBEjtCPhn9I0Qmeyb6nZ5bKjJC6cbioEfxxfkBEm8B0MZAYtVT
	PP1GIDV6TLU/nRU8awdCnZ4/ilI9JrWNMQcx/Ws51TgAIC66uQeFhg9kmiVGlYHY8Sp1yVC+9yg0F
	iy6y9DnfZk3xGC4F9BkXSCbj83OlELORAO77Sj05LV8NBHi0fteKszWC4xUtAPQmnlEvfaXG8CNfc
	5dY9bioxmlNhzs9RfbXXp9xLwn0ZDTs7Bqx3nCF/mPo0fd0rCqAC3F7Nl/fOocd46WcL9i5Nt/O9M
	sK5Wzjdw==;
Received: from ip6-localhost ([::1]:34808 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1u2nMT-0027ZQ-Ft; Thu, 10 Apr 2025 08:34:13 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:13482) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1u2nMO-0027ZI-9y
 for samba-technical@lists.samba.org; Thu, 10 Apr 2025 08:34:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:Cc:To:Date:Message-ID;
 bh=uipzv4lbUp1HDr06giaCBYq5HoKcMQO+vUXhUyohBu0=; b=uj/1vv63Wse2tdsTeuo3sv5YWf
 14V3fV1JfUDiFR3NPXZeLK0iIs3Yh59/Ve3sF4ZInFMy1ytRfs5pp/ANbHoonSFphWws+BHU5Ra8y
 gs68D59Xbr+x4MYbpA0pfgff02Xipku+108lUchVQMi+BzotILnhTVJKYuV1BHwLR/5Win212bRE+
 fa1Yf6NiNVehf+lTuvUn9//fuWEoK9ecx91O0dKBzepFaXlAPsFmp4zEXsyxWTkMnTJMAuKwTsbST
 GtiqagYkAgzIgBjU7Blgta8VmkIIDuClR8Vd9jsY01yxZmkEmOghtDwGjNvNXNhzMvpfU/GoqqSj3
 hBHopi1Bmw56+MK5qkhk7At4e7ostF+4V7KecQH/aXw4xAJzn2YWo8uLJTMAuMYBO4aDXFu8jCRhj
 V42jJNr13GlnM7SBAG8tRJcQeQ4nzCvj/vh9HxYfEcO/1JIWKcc7ukCMEzgRxeOa4oEns4lXy3I0B
 lcio9xpbQnakF7VIpF2cx1IX;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1u2nMB-0094Ul-0o; Thu, 10 Apr 2025 08:33:55 +0000
Message-ID: <9f7da486-5d85-4ef3-8fcf-14b408d78700@samba.org>
Date: Thu, 10 Apr 2025 10:33:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: SMB3 POSIX and deleting files with FILE_ATTRIBUTE_READONLY
To: Jeremy Allison <jra@samba.org>
References: <32f7a0c2-32cd-4ccd-b471-7cba98cc30f3@samba.org>
 <Z_b4DS3kOpbCI4pG@jeremy-HP-Z840-Workstation>
Content-Language: en-US, de-DE
In-Reply-To: <Z_b4DS3kOpbCI4pG@jeremy-HP-Z840-Workstation>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------C093IENLqWg8z5ajy0KARBUG"
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
Cc: CIFS <linux-cifs@vger.kernel.org>, Stefan Metzmacher <metze@samba.org>,
 Steven French <Steven.French@microsoft.com>,
 samba-technical <samba-technical@lists.samba.org>, Tom Talpey <tom@talpey.com>,
 "vl@samba.org" <vl@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------C093IENLqWg8z5ajy0KARBUG
Content-Type: multipart/mixed; boundary="------------FKN8XcEw0esKQXnTSwJXMhZU";
 protected-headers="v1"
From: Ralph Boehme <slow@samba.org>
To: Jeremy Allison <jra@samba.org>
Cc: CIFS <linux-cifs@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>,
 Tom Talpey <tom@talpey.com>, Steven French <Steven.French@microsoft.com>,
 "vl@samba.org" <vl@samba.org>, Stefan Metzmacher <metze@samba.org>
Message-ID: <9f7da486-5d85-4ef3-8fcf-14b408d78700@samba.org>
Subject: Re: SMB3 POSIX and deleting files with FILE_ATTRIBUTE_READONLY
References: <32f7a0c2-32cd-4ccd-b471-7cba98cc30f3@samba.org>
 <Z_b4DS3kOpbCI4pG@jeremy-HP-Z840-Workstation>
In-Reply-To: <Z_b4DS3kOpbCI4pG@jeremy-HP-Z840-Workstation>
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

--------------FKN8XcEw0esKQXnTSwJXMhZU
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gNC8xMC8yNSAxMjo0MyBBTSwgSmVyZW15IEFsbGlzb24gd3JvdGU6DQo+IERvZXMgV2lu
ZG93cyBldmVyIHNlbmQgRklMRV9ESVNQT1NJVElPTl9JR05PUkVfUkVBRE9OTFlfQVRUUklC
VVRFIG92ZXINCj4gdGhlIHdpcmUgPw0KDQpObywgaXQncyBsb2NhbCBvbmx5LCBjZiBNUy1G
U0NDIGFuZCB0aGUgdGhyZWFkICJTTUIyIERFTEVURSB2cyBVTkxJTksiIA0Kb24gdGhlIExp
bnV4IGNpZnMgbWFpbGluZyBsaXN0Lg0KDQo8aHR0cHM6Ly9sZWFybi5taWNyb3NvZnQuY29t
L2VuLXVzL29wZW5zcGVjcy93aW5kb3dzX3Byb3RvY29scy9tcy1mc2NjLzQ3MThmYzQwLWU1
MzktNDAxNC04ZTMzLWI2NzVhZjc0ZTNlMT4NCg0KDQo=

--------------FKN8XcEw0esKQXnTSwJXMhZU--

--------------C093IENLqWg8z5ajy0KARBUG
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEE+uLGCIokJSBRxVnkqh6bcSY5nkYFAmf3gnIFAwAAAAAACgkQqh6bcSY5nkax
jg/9GNF1fezg8f7GIjf4djyu78H181afc7GUBWUWefJc1nBn+eysjyI/dtLq99PtaQLml4y2PBOM
iZXsnSKhz4lqHistW6JinrrX8m/v3KeKpi/zAaCdYL5HFSBFNaLAxDMklvH5KnAR5/zmFqW6pBZJ
oHjXGGj9zklMaXMEmMnNgwNtSJq4qZaFAhuAUFin+RCreVMuT2b5uemvv451BiK77k3W8mlupSrw
Gw5Ocr2+DpMUTHomFjd6gXca6QkPXjLJ20JZkuAtjqq31mjJvO+WgXcLdvQT7pM/VmGUTQMuE5Pl
VEx4JERbqmOjt5dAbRJoI/3jlgIDk2K9H/CF6wwV9YP9rN4W9ah3n1iXkMO1E4qdBXsnjjoVLwG9
3NHstF2SEx9pr7HPctEicGGAYD9iv9+xbFuXZRBwitryYEdmPhur+XbIJEdKgy8OwzukI4DjYouP
loitIjpe/c24CHQc+uN7mHvjwrBcIaqFriDvtJeLCUmQa9QXvkX622YISOfYI1eDnvH4OX/y0I0I
PuFV3oA6pIZYmLsCQidwrW+gf+Z+eRSlGaDJU6j/1LfHCFkirQGFNpU4fTRIGEKDscT9IO8mWS/N
NY932eDvV0I8wjP6koLZYibwH3MDjg5HtW9atfNMdcwzNuLfq1eFPnhUCdFE8R3R0EEsvjhH5EgU
mec=
=nIDK
-----END PGP SIGNATURE-----

--------------C093IENLqWg8z5ajy0KARBUG--

