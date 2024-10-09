Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ACEF99761B
	for <lists+samba-technical@lfdr.de>; Wed,  9 Oct 2024 22:00:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=zwbnmqHN8mBoR9K8UBvzVRN9o5r0n5r3mCN7hZY/KYo=; b=Nv9jj6oC9OsBlKAJxS4h4a8aX4
	70CbmkbfQxsmTyj5FXAN2n9Uk5TKr2Rivu6Y5Yhz+G26wiw+2gKJF251k+kcMSJba5l+rPRQMYeDC
	cXlPxNXgLRbgFUtVDJXY60xHr+Y2s9/BMfhhEkygmsO7ZjOk0NcIUCeZME5t6ld0nno2RcDlYczsZ
	M/gIOyqM11kmaFNAmyIOEzos10KtW866P/y7niNXqKpQbKj6UhsZbJGJdLRGyX0aYYhw6K8gL88LC
	ZxJ9QddsTpg3xEnTbTDuLV1Cl+Zw1mKAFIlDG6j5+3Ar07BeU06fU3GwYA4SKBuj+THFl1g61Ekui
	Glw8SRTA==;
Received: from ip6-localhost ([::1]:59122 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1sycqt-003PY0-U1; Wed, 09 Oct 2024 20:00:08 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:42004) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1sycqo-003PXn-WB
 for samba-technical@lists.samba.org; Wed, 09 Oct 2024 20:00:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:Cc:To:Date:Message-ID;
 bh=zwbnmqHN8mBoR9K8UBvzVRN9o5r0n5r3mCN7hZY/KYo=; b=17kGqdqdr+XxpZol9rB1JWrtwu
 0HxeC01jjXliLRT3kSBWxpCLxz5Pauyec5bnIf4I1dq/DsF8NAMDL69CpTgN9DDo4IRRG/W8pNcCH
 kKdm4qNqImGlFoVOV06FTcHOyQcPXLLDP5+nP4I8Yg+/mmHW7NjMs26V3pp0h12Da3PfyURQ4rFZR
 Me9akYnkKEA0nURvI/O6rsquk5WI5pgOVoE9Xc+wIiKCS/ykF9ShsKPjvs1ucM5uUxfC5PtMzbgB6
 YWn7sldWxpJglJQP1uGAAkzSwCvsnVb3yINpJ/17JOhFyqkEidQh9LiUfj4aShWrTzq2+ukHe2S74
 EiZu7SM1+t42k7r58Zdb4ryJ7ykdvKcbgOdv4697/5A9KoGzSIyv0KM+6e+5cuPR7VMliqDYMYDNq
 BsvvBM3NDIf5xyfd5IFAhX9FsqbpuTnexW9EkBKtQPYKyr049fLKqJFl2vjHcobdWgyyhWHzKUh0t
 6U4mbGDU7syjI6r569YDo0kZ;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1sycqo-00463m-07; Wed, 09 Oct 2024 20:00:02 +0000
Message-ID: <b84b2bb0-0afe-4f9e-9553-1a0201ed92d3@samba.org>
Date: Wed, 9 Oct 2024 22:00:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Current Samba master incorrectly returns STATUS_INVALID_HANDLE on
 copy_chunk
To: Jeremy Allison <jra@samba.org>
References: <CAH2r5mt7cE8Cc2K5K8nRM2RL=R-rwuAR9h6SSyEqtApuochtuQ@mail.gmail.com>
 <e12d7594-02df-4cbb-80fc-276d907afd90@samba.org>
 <CAH2r5muqSmNy+3SViFKNJ=5Sm61u8r9ej9Wy8JLUDeC2XHwccA@mail.gmail.com>
 <77aff6ef-291d-4840-82e2-b02646949541@samba.org>
 <d84732db-dea1-4fbd-9fc9-105c115c9ca0@samba.org>
 <990b4f16-2f5a-49ab-8a14-8b1f3cee94dc@samba.org>
 <ZwVM1-C0kBfJzNfM@jeremy-HP-Z840-Workstation>
 <569625f6-e0d2-43db-88cf-eb0fff6eb70e@samba.org>
 <ZwbczZYBsTU03Ycv@jeremy-HP-Z840-Workstation>
Content-Language: en-US, de-DE
In-Reply-To: <ZwbczZYBsTU03Ycv@jeremy-HP-Z840-Workstation>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------HucREB0K7EzXlxYf0iVPQIU5"
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
--------------HucREB0K7EzXlxYf0iVPQIU5
Content-Type: multipart/mixed; boundary="------------OCcSXARbpOBUeya2ZNhBWmHv";
 protected-headers="v1"
From: Ralph Boehme <slow@samba.org>
To: Jeremy Allison <jra@samba.org>
Cc: Steve French <smfrench@gmail.com>, CIFS <linux-cifs@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>
Message-ID: <b84b2bb0-0afe-4f9e-9553-1a0201ed92d3@samba.org>
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
In-Reply-To: <ZwbczZYBsTU03Ycv@jeremy-HP-Z840-Workstation>
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

--------------OCcSXARbpOBUeya2ZNhBWmHv
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTAvOS8yNCA5OjQzIFBNLCBKZXJlbXkgQWxsaXNvbiB3cm90ZToNCj4gT24gV2VkLCBP
Y3QgMDksIDIwMjQgYXQgMDg6NTQ6MTJQTSArMDIwMCwgUmFscGggQm9laG1lIHdyb3RlOg0K
Pj4gT24gMTAvOC8yNCA1OjE2IFBNLCBKZXJlbXkgQWxsaXNvbiB3cm90ZToNCj4+PiBJdCB3
YXMgZG9uZSBhcyBwYXJ0IG9mIHRoZSBTTUIxIGV4dGVuc2lvbnMgLSB0cnlpbmcgdG8gInBh
c3MtdGhyb3VnaCIgDQo+Pj4gYWxsDQo+Pj4gcG9zc2libGUgUE9TSVggb3BlbiBmbGFncy4N
Cj4+Pg0KPj4+IEp1c3QgcmVtb3ZlIGl0Lg0KPj4NCj4+IG9rLg0KPj4NCj4+IEJ1dCB0aGVu
IHdlIHN0aWxsIG5lZWQgYSB3YXkgdG8gcGFzcyBPX0FQUEVORCBvdmVyIHRoZSB3aXJlIHdp
dGggU01CMyANCj4+IFBPU0lYIGFuZCB3ZSdyZSBjdXJyZW50bHkgbGFja2luZyBhIHNhbmUg
d2F5IGl0IHNlZW1zLg0KPj4NCj4+IFdoYXQgYWJvdXQgdXNpbmcgb25lIGJpdCBvZiB0aGUg
MTcgcmVzZXJ2ZWQgYml0cyBpbg0KPj4NCj4+IDxodHRwczovL3d3dy5zYW1iYS5vcmcvfnNs
b3cvU01CM19QT1NJWC8gDQo+PiBmc2NjX3Bvc2l4X2V4dGVuc2lvbnMuaHRtbCNwb3NpeC1t
b2RlPg0KPj4NCj4+IFRoZXJlIGFyZSBtb3JlIHBvc3NpYmx5IGludGVyZXN0aW5nIG9wZW4g
ZmxhZ3MgdGhvdWdoIGFuZCBJIHdvbmRlciANCj4+IHdoZXRoZXIgcGFja2luZyBhbGwgb2Yg
dGhpcyBpbnRvIHRob3NlIDMyIGJpdHMgaXMgYSBnb29kIGlkZWEsIGJ1dCB0aGUgDQo+PiBh
bHRlcm5hdGl2ZSBvZiBjaGFuZ2luZyB0aGUgU01CMl9DUkVBVEVfQ09OVEVYVCByZXF1ZXN0
IHRvIGFkZCBhIG5ldyANCj4+IGZpZWxkICJPcGVuRmxhZ3MiIGlzIG5vdCByZWFsbHkgYSBn
cmVhdCBsb29raW5nIG9wdGlvbiBlaXRoZXIuDQo+IA0KPiBTTUIxLzIvMyBoYXMgRklMRV9B
UFBFTkRfREFUQS4NCj4gDQo+ICDCoEZyb20gdGhlIGRlZmluaXRpb24gb2YgTnRDcmVhdGVG
aWxlICh0aGUgTlQga2VybmVsDQo+IHN5c3RlbSBjYWxsKS4NCj4gDQo+IGh0dHBzOi8vbGVh
cm4ubWljcm9zb2Z0LmNvbS9lbi11cy93aW5kb3dzL3dpbjMyL2FwaS93aW50ZXJubC9uZi0g
DQo+IHdpbnRlcm5sLW50Y3JlYXRlZmlsZQ0KPiANCj4gIklmIG9ubHkgdGhlIEZJTEVfQVBQ
RU5EX0RBVEEgYW5kIFNZTkNIUk9OSVpFIGZsYWdzIGFyZSBzZXQsIHRoZSBjYWxsZXIgDQo+
IGNhbiB3cml0ZSBvbmx5DQo+IHRvIHRoZSBlbmQgb2YgdGhlIGZpbGUsIGFuZCBhbnkgb2Zm
c2V0IGluZm9ybWF0aW9uIG9uIHdyaXRlcyB0byB0aGUgZmlsZSANCj4gaXMgaWdub3JlZC4N
Cj4gSG93ZXZlciwgdGhlIGZpbGUgaXMgYXV0b21hdGljYWxseSBleHRlbmRlZCBhcyBuZWNl
c3NhcnkgZm9yIHRoaXMgdHlwZSANCj4gb2Ygd3JpdGUgb3BlcmF0aW9uLiINCj4gDQo+IENh
biB3ZSBqdXN0IG1hcCAoYWNjZXNzX21hc2sgKEZJTEVfQVBQRU5EX0RBVEF8U1lOQ0hST05J
WkUpKSA9PSAgDQo+IChGSUxFX0FQUEVORF9EQVRBfFNZTkNIUk9OSVpFKSkNCj4gdG8gT19B
UFBFTkQsIHJlZ2FyZGxlc3Mgb2YgUE9TSVggbW9kZSA/DQoNCkhtLCBpbnRlcmVzdGluZyBm
aW5kDQoNCkJ1dCBJIGd1ZXNzIHRoaXMgd29uJ3QgaGVscCBhcyB3aXRoIFBPU0lYIHlvdSBj
YW4gb3BlbigpIGEgZmlsZSB3aXRoIA0KT19BUFBFTkQgYnV0IHRoZW4gc3RpbGwgY2FsbCBw
cmVhZC9wd3JpdGUgb24gdGhlIHJlc3VsdGluZyBmZC4NCg0KSG93ZXZlciwgaWYgd2UgcmVx
dWlyZSBTTUIzIFBPU0lYIGNsaWVudHMgdG8gbWFwIE9fQVBQRU5EIHRvIGFuIA0KYWNjZXNz
X21hc2sgb2YgKm9ubHkqIEZJTEVfQVBQRU5EX0RBVEF8U1lOQ0hST05JWkUsIHByZWFkL3B3
cml0ZSB3b3VsZCANCmZhaWwgYXMgdGhlIGhhbmRsZSBsYWNrcyBGSUxFX1JFQURfREFUQS9G
SUxFX1dSSVRFX0RBVEEuIFJpZ2h0Pw0KDQo=

--------------OCcSXARbpOBUeya2ZNhBWmHv--

--------------HucREB0K7EzXlxYf0iVPQIU5
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEE+uLGCIokJSBRxVnkqh6bcSY5nkYFAmcG4MEFAwAAAAAACgkQqh6bcSY5nkb/
+xAAisiiEdh4JfaZ2wpESowRTs5AfurIzKa8eEReDGWbApK5e8HLFtUUIxxYIPwd933pqBFMH9XB
XDSKdb+2/k0s/F4G21pdrne/F0WD7mU2xl/i8zIQKx+sMUpKsPLzXYez7lsOe/Y0AunU5e08kwWB
4E81i4/qdt5HFDCMFsC6tS+UOIAY05y88bRknAYver68W4dJ1Guz+fARj1QsOB/ZpXtxbgWHSyme
akbp8e9jy31f+L8Kd73AgiesJiqBCXpLhL0AEZqH1cbrbDfj/NpsaQQW3SjyHfEoF230qqx6zv5d
Z4fxcC891b6F6I6F6CuiAlKQXB1U7goN5xsxtxENP0Wt2NBIZNupCGZmqsOwCmoGRP1IDKCnaaK7
Abk+wXDw1JvPErV8J7n1xhU5BBjfFPIngo9oeAP6oJHfiQJleljXYO6kZurIu/YK7uepRhe5/mhn
xjJdM9DjhBosBXla+rBv/Y1CorahuBW63VjCSyf9wpBMxkoyBnvtsFVLiZo4uo2yV0Jkv1lWm6wQ
LiIrsMmyXLNwcp6gwXdsZ3Jnc4nsOb8sPXFkLJ8gHdYwJ9yhmUxA0iiYNG1ortiLVRJWx7whjDIx
RH4RL2rya/P1wLiByhjpOY9yrtI7lFbzWE1FkNEY8fD0lbwAwBpgZm5tQzdpigVi5Q9UngWQvZ1F
1sw=
=Sn9m
-----END PGP SIGNATURE-----

--------------HucREB0K7EzXlxYf0iVPQIU5--

