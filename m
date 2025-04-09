Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 8880BA83004
	for <lists+samba-technical@lfdr.de>; Wed,  9 Apr 2025 21:07:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=4e9OV1lO7zq6Z8pylcgU0T0+nkKzPGsrUiLuSsPaYlE=; b=ZJOY1JNNGfn1YlZw+fHPLq6jZs
	MGR1N7HljQ3UOIOaPShIwGdCkB++C6DBVrcxNYgMmZ09ZP6uHwkntIcRhutZLr8jFJhufEGsJ6Uoa
	qUDDs8z6ox9kxPNrsCbRq7haz1KJcy61jKqjO4GjvPHDGMBg+wt8jIdSh+RQQ95fRQZXRY+jwD0Tg
	0GXVfSSIbET9HpypwlpEXkalhXAtNbUTdTni64a7FVrrhc6Y6ixqv0EEPzH3hCnTQV1Slg+cfJDX2
	QeYo/4FefeBK+JdThwFkUppsGf+wphYNtum8UVMPtV7ALWqApRGPpn0bSMAIRpHzbGwFHodWtbQmu
	7AIdSYxA==;
Received: from ip6-localhost ([::1]:52390 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1u2alb-0024TJ-8V; Wed, 09 Apr 2025 19:07:19 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:60724) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1u2alX-0024TB-Bu
 for samba-technical@lists.samba.org; Wed, 09 Apr 2025 19:07:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:Cc:To:Date:Message-ID;
 bh=4e9OV1lO7zq6Z8pylcgU0T0+nkKzPGsrUiLuSsPaYlE=; b=gJbIaN4DiOdYOiLe3kXYypq7dq
 6kFZUd4kA4CvYdD3bhD1Ck2cH0YikkL/KtrLoCQQekTtIc95e+UgspA9M0TO2c+8hhXVzHRldNW11
 jFqugpPzOxUJTkWautWnZ/6IsWmGsPjhUgd1T4m6nP+dJmZD5eAhqfsb7ylhW4S+Vjj45Y4UIU4E/
 dD3tqH6sozA6A03UxlDl0fQ/yYbOneho4jADKOXJYuH/2xrELxSfm7JS4hcuYfWf+FYGgaZMvQssf
 kMJei31xIiJsmu4gxQmi3d7pyPPlNQTLqdLQtX2tlTLP4vpodtsm/RbBNNFfmDGBS4wL3OKQM4Z9E
 UvG4SA8UvKtwpz1bMa8kbMB2ZrbIHGH2CXJ0fEI0u1AtWegZrCJ57qfBtVwmbrERtqYTs3e+VjYnL
 cCPRveq/jiDZCeuKxkifO+Tvl6HATI8YvhJHZz/PXia6uWOLT8UV0TXi8psl0sNb//jLkLfaGqu5d
 qmCArrCbvrN/bLk/zS7ZkNnM;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1u2alI-008xub-1T; Wed, 09 Apr 2025 19:07:00 +0000
Message-ID: <a5c81acc-1e85-463d-925e-eb5b05af9ee7@samba.org>
Date: Wed, 9 Apr 2025 21:06:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: SMB3 POSIX and deleting files with FILE_ATTRIBUTE_READONLY
To: Steve French <smfrench@gmail.com>
References: <32f7a0c2-32cd-4ccd-b471-7cba98cc30f3@samba.org>
 <CAH2r5mt2032HC_yLrqGoAY-J6JZfP_2zjOjoKiY92YUrxBiqnA@mail.gmail.com>
Content-Language: en-US, de-DE
In-Reply-To: <CAH2r5mt2032HC_yLrqGoAY-J6JZfP_2zjOjoKiY92YUrxBiqnA@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------bJ0C5iqPbKER7raHFzAq0LXs"
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
 "vl@samba.org" <vl@samba.org>, Jeremy Allison <jra@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------bJ0C5iqPbKER7raHFzAq0LXs
Content-Type: multipart/mixed; boundary="------------ymg01wZPieuh0cgdJ6fQ0qVI";
 protected-headers="v1"
From: Ralph Boehme <slow@samba.org>
To: Steve French <smfrench@gmail.com>
Cc: CIFS <linux-cifs@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>,
 Tom Talpey <tom@talpey.com>, Steven French <Steven.French@microsoft.com>,
 Jeremy Allison <jra@samba.org>, "vl@samba.org" <vl@samba.org>,
 Stefan Metzmacher <metze@samba.org>
Message-ID: <a5c81acc-1e85-463d-925e-eb5b05af9ee7@samba.org>
Subject: Re: SMB3 POSIX and deleting files with FILE_ATTRIBUTE_READONLY
References: <32f7a0c2-32cd-4ccd-b471-7cba98cc30f3@samba.org>
 <CAH2r5mt2032HC_yLrqGoAY-J6JZfP_2zjOjoKiY92YUrxBiqnA@mail.gmail.com>
In-Reply-To: <CAH2r5mt2032HC_yLrqGoAY-J6JZfP_2zjOjoKiY92YUrxBiqnA@mail.gmail.com>
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

--------------ymg01wZPieuh0cgdJ6fQ0qVI
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gNC85LzI1IDg6NDMgUE0sIFN0ZXZlIEZyZW5jaCB3cm90ZToNCj4gT24gV2VkLCBBcHIg
OSwgMjAyNSBhdCAxOjE44oCvUE0gUmFscGggQm9laG1lIDxzbG93QHNhbWJhLm9yZz4gd3Jv
dGU6DQo+PiB3aGF0IHNob3VsZCBiZSB0aGUgYmVoYXZpb3Igd2l0aCBTTUIzIFBPU0lYIHdo
ZW4gYSBQT1NJWCBjbGllbnQgdHJpZXMgdG8NCj4+IGRlbGV0ZSBhIGZpbGUgdGhhdCBoYXMg
RklMRV9BVFRSSUJVVEVfUkVBRE9OTFkgc2V0Pw0KPj4NCj4+IFRoZSBtYWpvciBxdWVzdGlv
biB0aGF0IHdlIG11c3QgYW5zd2VyIGlzLCBpZiB0aGlzIHdlIHdvdWxkIHdhbnQgdG8NCj4+
IGFsbG93IGZvciBQT1NJWCBjbGllbnRzIHRvIGlnbm9yZSB0aGlzIGluIHNvbWUgd2F5OiBl
aXRoZXIgY29tcGxldGVseQ0KPj4gaWdub3JlIGl0IG9uIFBPU0lYIGhhbmRsZXMgb3IgZmly
c3QgY2hlY2sgaWYgdGhlIGhhbmRsZSBoYXMgcmVxdWVzdGVkDQo+PiBhbmQgYmVlbiBncmFu
dGVkIFdSSVRFX0FUVFJJQlVURVMgYWNjZXNzLg0KPiANCj4gSSBhZ3JlZSB0aGF0IHRvIGRl
bGV0ZSBhIGZpbGUgd2l0aCBSRUFEX09OTFkgc2V0IHNob3VsZCBieSBkZWZhdWx0IHJlcXVp
cmUNCj4gV1JJVEVfQVRUUklCVVRFUyAoYW5kIGRlbGV0ZSkNCg0KZGVsZXRlIHdpbGwgYmUg
Y2hlY2tlZCB0aGUgdXN1YWwgd2F5LCBzbyBub3RoaW5nIHNwZWNpYWwgdGhlcmUuDQoNCj4g
cGVybWlzc2lvbiAoYmV0dGVyIHRvIGJlIHNhZmUNCj4gaW4gcmVzdHJpY3RpbmcgYSBwb3Rl
bnRpYWwgZGFuZ2Vyb3VzIG9wZXJhdGlvbikuDQoNCnllcywgdGhhdCB3YXMgbXkgdGhvdWdo
dCBhcyB3ZWxsLg0KDQo+IA0KPiBCdXQgdGhpcyBpcyBhIGdvb2QgcXVlc3Rpb24gLi4uDQoN
ClRoYXQncyB3aHkgSSBicm91Z2h0IGl0IHVwIDopKSkNCg0KVGhhbmtzIQ0KLXNsb3cNCg0K
DQo=

--------------ymg01wZPieuh0cgdJ6fQ0qVI--

--------------bJ0C5iqPbKER7raHFzAq0LXs
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEE+uLGCIokJSBRxVnkqh6bcSY5nkYFAmf2xVIFAwAAAAAACgkQqh6bcSY5nkbB
wBAAtcDohf4Xqd4XL8b2k58vFOMNprsqFejVvNNnK4vzd6PhMp93EbxJyrQVgVXRMTf06KGS0Ij2
Xk4LHR3/NIGEJUos7cWRfl/ERX3s+zrGnKjO0wZiM2aKUKozQfI8/7MoZuvqmFDwSNR35y148P02
qEHUb8rHNrJU9h/JgzW7M4J6DZlLNAnc91C5/ChzUGW1kAPxUV4/5JnBPvX4VqVTeLWb8XCQtoPv
kmuWwt4SdMH7ZrXTXYww+7TyculDgqsh6XXJTtj05mDfI1TfR1yqFzY2xnRhWPu6QDWZnPcRawNC
3yexMa9sy7Qq5esHAUQABw7JoF1rcB0p8C7OdWyoA7TYHDKUMf4WFG2I6isTUuv5OQAz2PIIQLL2
ZrKLxD0tUxByelTyCY+fjf2zcwxCADN5CnXmm+KyKoBFboEnQqMhoJOdnFqngEBTGbOnCOdiijLh
lQMllVh4fjtoPOWjMv4klfVGhTHAOjzTJAALTY/xDmXpjqN9EHNI0+vMp5SFwwnsIncdaTtgGME4
p3ht0ly1tX976y4kpDvHzcwAcIok284HWiBuNGPbqIZmDDWPn+MdYh/q1Tv6kIZuKl8xCkyjZbrX
6OhoiBIC05ubkh+anNQTswZH1e55W35uN0T71l55QP4Ng4XLi716hxQskg0VRjgA60R66GD/Gtz8
3vg=
=7quf
-----END PGP SIGNATURE-----

--------------bJ0C5iqPbKER7raHFzAq0LXs--

