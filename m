Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E2630B059F9
	for <lists+samba-technical@lfdr.de>; Tue, 15 Jul 2025 14:28:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=/ohCHtMk2rDJUfJOSGLkjBtqTVyiDu76NEM2+5TbNcs=; b=bXTmnFP1qe6vegD7eg/VBTQTo4
	LcLM8W+anJv1Ni/u/eKFu3rTy/C6d80YrZbC6wkwHsAbeoc1Iy0j680q2JihwoIyRzgamlCwCVNcv
	tuvnWm8uD0s+c4MCNmCinkEcSY3MYB9CrUN4sPEL5zzhSBF8YoegSaeqFPE+EYC/6e/j9HGeVsH9M
	/2XSHm8nu26ilqluU8kFvZoHsZMrVZZHvlLj6xgR1kjAm7oStsEXcxAgoudNIlhb1SbkKYd1ktkWw
	oaI6dvpiqG6uQak5YGY02t1f805ENLX4QnKx2+HRUlc7YX5Be54uFD4zi2fWE18JocJauErS+ywAp
	mYJhVdMA==;
Received: from ip6-localhost ([::1]:45948 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ubelM-00BGRQ-DC; Tue, 15 Jul 2025 12:28:00 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:32482) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1ubelH-00BGRJ-Gw
 for samba-technical@lists.samba.org; Tue, 15 Jul 2025 12:27:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Cc:To:From:Date:Message-ID;
 bh=/ohCHtMk2rDJUfJOSGLkjBtqTVyiDu76NEM2+5TbNcs=; b=XMYI0mK9r0MOgXvY9yY3VuBhGA
 fGtXzFP4HXwOHqL8QEIlX16X0oqpS+pLPz5zCUsVpTioSfpqdXb61r5yIm0AOks61hzPLAPjX1uCO
 iYpWPskGj+HuoxvjXsQjkixN38jJM46+1EZduWq0Y/LbuEfrhR8l47SkydkDw79YqZC7rUkoi2Atz
 XjWVl200JodeNyL6j+ytkCzjliq7qWKWcRYyq5X8SwfE8Hs4/IsevFIZJtNhpJSu/jK+ZY9twT2/d
 HAVanR18TbWNU2VrRo/z5anC2BoialbUmtVIjqHNfWiWdOCs0ryj8oZIgATfZ7qKQbSI/xZyB5fxa
 OzqNGzgzvRF0J4kN/MKCYVfYRQ+cHbzF38xOzk4Zw8x7uwgK1L1KcLvrvHZYgncozZ/FHP4vLfJQw
 M0qFGErgOHGsRSVqrnsJ5PCTh9S7A25iXhGNakReSPpg6ah5zNy/dABS84qk0FBlMcZNv0ZQeuM0m
 +ZlzX7wQ/tHCeDaKXL8HChJs;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1ubelC-00FSa4-37; Tue, 15 Jul 2025 12:27:51 +0000
Message-ID: <946b0ed2-6aca-4b52-be1e-2910bc371ba7@samba.org>
Date: Tue, 15 Jul 2025 14:27:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Samba support for creating special files (via reparse points)
To: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>
References: <CAH2r5muQGDkaHL78JOcgsfjL_=A64Xm9CrCBSKgOMABOjcg44w@mail.gmail.com>
 <CAH2r5msdLbvGMARXJ=V9wt0pvXJOrc=zh3eUfeF9AXEeshtByg@mail.gmail.com>
 <aHRo9VfMDIfK5MR6@jeremy-HP-Z840-Workstation>
 <42e549c1-0f92-4b95-b62b-3e0efab9aa10@samba.org>
 <5519b2d9-600c-4a3f-b44f-594877417df7@samba.org>
 <20250714165844.4hctlrwegfspiius@pali>
Content-Language: en-US, de-DE
In-Reply-To: <20250714165844.4hctlrwegfspiius@pali>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------zldo1VzisxkV2xLRneBVfuFy"
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
Cc: CIFS <linux-cifs@vger.kernel.org>, Paulo Alcantara <pc@manguebit.org>,
 samba-technical <samba-technical@lists.samba.org>,
 Steve French <smfrench@gmail.com>, vl@samba.org,
 Jeremy Allison <jra@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------zldo1VzisxkV2xLRneBVfuFy
Content-Type: multipart/mixed; boundary="------------02RbiWYPgyIdwW0HkhWt2D6Z";
 protected-headers="v1"
From: Ralph Boehme <slow@samba.org>
To: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>
Cc: Jeremy Allison <jra@samba.org>, Steve French <smfrench@gmail.com>,
 vl@samba.org, samba-technical <samba-technical@lists.samba.org>,
 Paulo Alcantara <pc@manguebit.org>, CIFS <linux-cifs@vger.kernel.org>
Message-ID: <946b0ed2-6aca-4b52-be1e-2910bc371ba7@samba.org>
Subject: Re: Samba support for creating special files (via reparse points)
References: <CAH2r5muQGDkaHL78JOcgsfjL_=A64Xm9CrCBSKgOMABOjcg44w@mail.gmail.com>
 <CAH2r5msdLbvGMARXJ=V9wt0pvXJOrc=zh3eUfeF9AXEeshtByg@mail.gmail.com>
 <aHRo9VfMDIfK5MR6@jeremy-HP-Z840-Workstation>
 <42e549c1-0f92-4b95-b62b-3e0efab9aa10@samba.org>
 <5519b2d9-600c-4a3f-b44f-594877417df7@samba.org>
 <20250714165844.4hctlrwegfspiius@pali>
In-Reply-To: <20250714165844.4hctlrwegfspiius@pali>
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

--------------02RbiWYPgyIdwW0HkhWt2D6Z
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gNy8xNC8yNSA2OjU4IFBNLCBQYWxpIFJvaMOhciB3cm90ZToNCj4gT24gTW9uZGF5IDE0
IEp1bHkgMjAyNSAxMDoyMzoxNyBSYWxwaCBCb2VobWUgd3JvdGU6DQo+PiBPbiA3LzE0LzI1
IDg6MDEgQU0sIFJhbHBoIEJvZWhtZSB2aWEgc2FtYmEtdGVjaG5pY2FsIHdyb3RlOg0KPj4+
IE9uIDcvMTQvMjUgNDoxOCBBTSwgSmVyZW15IEFsbGlzb24gd3JvdGU6DQo+Pj4+IEl0J3Mg
YW4gb3ZlcnNpZ2h0IEknbSBhZnJhaWQuDQo+Pj4NCj4+PiBobS4uLiBpdCBzZWVtcyByZXBh
cnNlIHBvaW50cyBzdXBwb3J0IGlzIG1hbmRhdG9yeSBmb3IgU01CMyBQT1NJWCBzbyBJDQo+
Pj4gd29uZGVyIHdoYXQgdGhpcyBhZGRpdGlvbmFsIGNoZWNrcyBidXlzIHVzLg0KPiANCj4g
Tm8uIEl0IGlzIG5vdCBtYW5kYXRvcnkuDQoNCnNvcnJ5LCBpbXByZWNpc2Ugd29yZGluZzog
c3VwcG9ydCBmb3IgcmVjZWl2aW5nIGFuZCB1bmRlcnN0YW5kaW5nIA0KUkVQQVJTRV9UQUdf
TkZTIGFuZCBSRVBBUlNFX1RBR19TWU1MSU5LIGlzIG1hbmRhdG9yeS4gU2VydmVyIGFuZCBj
bGllbnQgDQpNVVNUIGJlIGFibGUgdG8gc2VuZC9yZWNlaXZlIGFuZCB1bmRlcnN0YW5kIHRo
ZXNlLiBUaGV5IGNhbiBzdGlsbCBmYWlsIA0Kb2YgY291cnNlIG9uIHRoZSBzZXJ2ZXIgZm9y
IHZhcmlvdXMgcmVhc29ucy4NCg0KU3VwcG9ydCBmb3Igb3RoZXIgcmVwYXJzZSBwb2ludCB0
eXBlcyBpcyBvcHRpb25hbCBhbmQgdGhlIGNsaWVudCBNQVkgDQpjaGVjayBGSUxFX1NVUFBP
UlRTX1JFUEFSU0VfUE9JTlRTIGJlZm9yZSB1c2luZyB0aG9zZS4NCg0KUkVQQVJTRV9UQUdf
TkZTIGFuZCBSRVBBUlNFX1RBR19TWU1MSU5LIGFyZSByZXBhcnNlIHBvaW50cyBvbiB0aGUg
d2lyZSwgDQpidXQgdHlwaWNhbGx5IHRoZSBzZXJ2ZXIgc3RvcmVzIHRoZW0gaW4gdGhlaXIg
Im5hdGl2ZSIgUE9TSVggZm9ybWF0IGFuZCANCnRoZSBjbGllbnQgTVVTVCByZXByZXNlbnQg
dGhlbSBpbiB0aGVpciBuYXRpdmUgUE9TSVggZm9ybWF0Lg0KDQpJdCdzIHJlYWxseSBqdXN0
IHNvbWUgYWNjb21tb2RhdGlvbiB0byB0aGUgcHJvdG9jb2wsIHdpdGggc29tZXRoaW5nIA0K
YmVpbmcgZGlzZ3Vpc2VkIGFzIGEgcmVwYXJzZSBwb2ludCB3aGVuIGl0IGlzIGFjdHVhbGx5
IHNvbWV0aGluZyBlbHNlIA0KZW50aXJlbHkuDQoNCj4gR2V0dGluZyBvciBzZXR0aW5nIG9m
IHJlcGFyc2UgcG9pbnRzIGlzIGRvbmUNCj4gdmlhIElPQ1RMcyB3aGljaCBhcmUgb3B0aW9u
YWwuDQoNClNhbWUgaGVyZS4gU2VydmVyIGFuZCBjbGllbnQgTVVTVCBiZSBhYmxlIHRvIHNl
bmQvcmVjZWl2ZSANClJFUEFSU0VfVEFHX05GUyBhbmQgUkVQQVJTRV9UQUdfU1lNTElOSy4N
Cg0KPiBBbHNvIGZzIGF0dHJpYnV0ZSBmb3IgcmVwYXJzZSBwb2ludHMgaXMNCj4gb3B0aW9u
YWwuDQoNCnllcy4gQW5kIGl0IGFwcGxpZXMgdG8gYWxsIG90aGVyIHJlcGFyc2UgcG9pbnQg
dHlwZXMuDQoNCj4gDQo+IEFuZCB0aGF0IG1ha2Ugc2Vuc2UgYXMgdGhlcmUgYXJlIHN0aWxs
IGxvdCBvZiBmaWxlc3lzdGVtcyB3aGljaCBkbyBub3QNCj4gc3VwcG9ydCByZXBhcnNlIHBv
aW50cyAoZS5nLiBGQVQpIGFuZCB0aGlzIGZzIGF0dHJpYnV0ZSBpcyBleGFjdGx5IHdoYXQN
Cj4gc2VydmVyIGFubm91bmNlIGZvciBjbGllbnRzIGFuZCBhcHBsaWNhdGlvbnMgdG8gdGVs
bCBmZWF0dXJlIHN1cHBvcnQuDQoNCklmIGEgZmlsZXN5c3RlbSBvbiB0aGUgc2VydmVyIGRv
ZXNuJ3Qgc3VwcG9ydCBzdG9yaW5nIFJFUEFSU0VfVEFHX05GUyBvciANClJFUEFSU0VfVEFH
X1NZTUxJTksgb25lIHdheSBvciBhbm90aGVyLCBpdCBpcyBmcmVlIHRvIGZhaWwgdGhlIG9w
ZXJhdGlvbiANCndpdGggc29tZSBzZW5zaWJsZSBlcnJvci4NCg0KPiBTbyBhcHBsaWNhdGlv
biB3b3VsZCBrbm93IHdoYXQgZmVhdHVyZXMgYXJlIHByb3ZpZGVkIGFuZCB3aGljaCBub3Qg
b24NCj4gcGFydGljdWxhciBzaGFyZS4NCg0KQXBwbGljYXRpb24gZG8gbm90IGFuZCBjYW4g
bm90IGNoZWNrIHRoaXMuDQoNCj4gU2VydmVyIGNhbiBzdXBwb3J0IHJlcGFyc2UgcG9pbnRz
IG9uIHNoYXJlIEEgYnV0IGRvZXMNCj4gbm90IGhhdmUgdG8gc3VwcG9ydCBpdCBvbiBzaGFy
ZSBCLiBFLmcuIHdoZW4gQSBpcyBOVEZTIGFuZCBCIGlzIEZBVC4NCg0KU2hhcmluZyBOVEZT
IGlzIHNvbWVoYXQgb3V0IG9mIHNjb3BlIGZvciBTTUIzIFBPU0lYIEV4dGVuc2lvbnMgcmVh
bGx5LCANCmFzIGlzIEZBVC4gVGhlIHNjb3BlIGlzIGVuZC10by1lbmQgUE9TSVgtdG8tUE9T
SVggY29tcGF0aWJpbGl0eS4NCg0KPj4+IFdoaWxlIEkgYWdyZWUgdGhhdCBnZW5lcmFsbHkg
d2Ugc2hvdWxkIGxpa2VseSBzZXQgdGhpcywgZm9yIFNNQjMgUE9TSVgNCj4+PiB0aGUgY2xp
ZW50IHNob3VsZCBwcm9iYWJseSBub3QgY2hlY2sgdGhpcyBhbmQgd2Ugc2hvdWxkIGtlZXAg
aXQgb3V0IG9mDQo+Pj4gdGhlIHNwZWMuDQo+Pg0KPj4gb25lIGFkZGl0aW9uYWwgdGhvdWdo
dDogaXQgc2VlbXMgbGlrZSBhIHZhbGlkIHNjZW5hcmlvIHRvIGJlIGFibGUgdG8gc3VwcG9y
dA0KPj4gU01CMyBQT1NJWCBvbiBhIHNlcnZlciB0aGF0IGRvZXMgbm90IHN1cHBvcnQgeGF0
dHJzIG9uIHRoZSBiYWNraW5nDQo+PiBmaWxlc3lzdGVtIGFuZCBoZW5jZSBtYXkgbm90IGhh
dmUgYSB3YXkgb2Ygc3RvcmluZyBhcmJpdHJhcnkgcmVwYXJzZSBwb2ludHMuDQo+IA0KPiB4
YXR0cnMgYW5kIHJlcGFyc2UgcG9pbnRzIGFyZSB0d28gY29tcGxldGVseSBkaWZmZXJlbnQg
dGhpbmdzLCBhbmQgdGhleQ0KPiBzaG91bGQgbm90IGJlIG1peGVkIG9yIGV4Y2hhbmdlZC4N
Cg0KSXQgc2VlbXMgeW91J3JlIG1pc3NpbmcgdGhlIHBvaW50OiBpZiB0aGUgc2VydmVyIGlt
cGxlbWVudGF0aW9uIHN0b3JlcyANCnJlcGFyc2UgcG9pbnRzIGFzIHhhdHRycywgdGhlbiBv
ZiBjb3Vyc2UgeW91IGNsYWltIHN1cHBvcnQgZm9yIHJlcGFyc2UgDQpwb2ludHMgb25seSBp
ZiB5b3Uga25vdyAoYnkgY29uZmlndXJhdGlvbiksIHRoYXQgdGhlIGZpbGVzeXN0ZW0gc3Vw
cG9ydHMgDQp4YXR0cnMuDQoNCkNoZWVycyENCi1zbG93DQo=

--------------02RbiWYPgyIdwW0HkhWt2D6Z--

--------------zldo1VzisxkV2xLRneBVfuFy
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEE+uLGCIokJSBRxVnkqh6bcSY5nkYFAmh2SUYFAwAAAAAACgkQqh6bcSY5nkZn
Cw//W7EUf1FFdFzdIrX9bTVD2DuCo6ZLyMZQrWjYxiNYxZvoajsaGXtc69Wfoc9wSymkZ4PRB1D/
BDASAQVHQhyog2qqVdrzN575e5+MUEr7GcT+DGPqyqCh71qVT1FI51/k1ATFklwr7JZGfjTT1oAB
ZJ+nPmAMO+6tgD9s2TsC1fq1akSXbPhmSpBONrZxFGxsphCVlEnM7guCktW4SbJN7ZdZtBRn+z3S
x/UwXKlkl5PEjvcf8vLIti3+VVYeD1R+6HS4Ks5RYb0mu8zpbUjuoNo0UFPx9Bov0SuA+V6hwHSU
Tn4vjjSrAWDYsz6BovauOUhoedv+HjPPKPOHj1miZqaLQJuz+NgC6L9pF3XyeyaYnyfYz0TK7jMt
ryHkWOA1BEnBEGevWZ13rBcphkVB+f0e9oJ0uUua0Qe25GGveok4cPOKJdXRtZsBr74OqxTKwxYa
Azi6iywwJvx7gbSUz6hT0k9drj1P6S3BC27ORxNzJEYbtRj/epsjjbCzM5RB3ro6qnjDDffQJXcc
BwpRhu+uao46ZLxSBIBtZNKSqOL9Ird56fmaK4k9onzkBHFVPs9iNRtPzwt8MDj3tEYLRK9Xmedq
0htvU+ZxOirzrWeI8ERehflDgl8V9FEEN5TQlXriOEAYnVJWcrihH0FT/vlOEWXB6ZHrRnrdv2Ld
c2c=
=XYUf
-----END PGP SIGNATURE-----

--------------zldo1VzisxkV2xLRneBVfuFy--

