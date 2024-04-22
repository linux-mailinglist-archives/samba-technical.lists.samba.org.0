Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 13BEE8AD397
	for <lists+samba-technical@lfdr.de>; Mon, 22 Apr 2024 19:57:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=FGjPfItBlotJ+B2g9ZTUTCJ1x+FzuFq6E79f1op+xvY=; b=hQGMKVP1U3DRYqZLkYXYyqvL2m
	G4rSH3/sgYd9qDslgL1PhQTwgCNnFgcFzPhhGpg1UD1NM1BT2mTVhV2vvohSudw2EnMrGei7wnjQk
	1X+0aKylXM+sepV2xlJUoj7qv6hfIX/16zcRazIZuB1RYctcpF+ldj4M8vD2+LIgMyUJ0L/iWhIql
	wjmoRk/MbcYZk3OFANo+Rg+cKRJe74UzOfARGsbvvUOBqXBc4KP7WnW9VkUJIfyCcA9Bb0x1ilJ/A
	uUKwU+z1R7C7RNX7/rQPuUV22dsUk2Nzx3FyTuwGrM2foz5hCNeEj2VPoTqxJM4RIcgD0tUoER8cN
	XKboIkoQ==;
Received: from ip6-localhost ([::1]:48234 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ryxuC-005Ntq-Uc; Mon, 22 Apr 2024 17:56:41 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:15074) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1ryxu8-005Nti-Qb
 for samba-technical@lists.samba.org; Mon, 22 Apr 2024 17:56:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:Cc:To:Date:Message-ID;
 bh=FGjPfItBlotJ+B2g9ZTUTCJ1x+FzuFq6E79f1op+xvY=; b=K3znjZh9xAmyhv/H9osOwIbO7Z
 Y5MJLaU0L1YIFND50QrHMnA9P6tpGcyLgUohdI9xKLDhVFd8nU3/jf+N3izSccf2mQ9p5E9RWREDu
 f5xvllCAl4PLBdXqnrQmpjUFWZoIV33d/NwG5xmFb/x1mVEteGhVqxRv6ITsvOAYgJ/H1E93lsE1E
 D71kp57Ob9x0P6dZKNmH5JcssAztCyHtA1S65L/IewuTmvB41nwVTSkZ29bk5I2fivsJoxmJYJ4aI
 Cevb0CEcLZ+/vJUn+ALzqBWT9ldoAs3LGi1D7d68N5CCOkdB9XSsx2hJ9gbRd38r65vuw9bDVgQHm
 G6FLpp3/zbmKEUON4pzD7Rmm4RkMO9BOJ0aeZcLZXB86vhiko/1jn9Is/nvdmQqx1tnQMQhrl7+FS
 7s4axkIoe6A8+U6pKO2yY7iMVIVrHO6c+/UDXO8p9Fz+wk61knprbMRMohSDp74VNAVApAr6dMK7d
 gokRtkfH8mHxyVRlhVWuMNwS;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1ryxu2-007jse-1S; Mon, 22 Apr 2024 17:56:30 +0000
Message-ID: <928cdbd1-a1ed-4b5e-93e9-866ba5f8e504@samba.org>
Date: Mon, 22 Apr 2024 19:56:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Proposal for changes in become root
To: Xavi Hernandez <xhernandez@gmail.com>
References: <CAO9H7P_oqwoJoC_8mWNZVYZ-pxrYt9TrEt3t0LJsEvS32EorEg@mail.gmail.com>
 <4249c3b6-3b4e-4bd3-95e5-864158e5797f@samba.org>
 <CAO9H7P8Cttbg6v-Cn+rRR5cKc06K1pid9oQqsjPnHL49iCE=ig@mail.gmail.com>
 <17264f9a-2d6f-4bf4-a0e7-f28372a6f82a@samba.org>
 <CAO9H7P8jocp0J_8oFqnYCmheS0o83x6B7koFBMQa_Y2vwdETtw@mail.gmail.com>
Content-Language: en-US, de-DE
In-Reply-To: <CAO9H7P8jocp0J_8oFqnYCmheS0o83x6B7koFBMQa_Y2vwdETtw@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------00Ykiu0HMbs0Ht5ZVotl1y0O"
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
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------00Ykiu0HMbs0Ht5ZVotl1y0O
Content-Type: multipart/mixed; boundary="------------Ml1tBgJfwQeBJnjo04Q5VZT2";
 protected-headers="v1"
From: Ralph Boehme <slow@samba.org>
To: Xavi Hernandez <xhernandez@gmail.com>
Cc: samba-technical@lists.samba.org
Message-ID: <928cdbd1-a1ed-4b5e-93e9-866ba5f8e504@samba.org>
Subject: Re: Proposal for changes in become root
References: <CAO9H7P_oqwoJoC_8mWNZVYZ-pxrYt9TrEt3t0LJsEvS32EorEg@mail.gmail.com>
 <4249c3b6-3b4e-4bd3-95e5-864158e5797f@samba.org>
 <CAO9H7P8Cttbg6v-Cn+rRR5cKc06K1pid9oQqsjPnHL49iCE=ig@mail.gmail.com>
 <17264f9a-2d6f-4bf4-a0e7-f28372a6f82a@samba.org>
 <CAO9H7P8jocp0J_8oFqnYCmheS0o83x6B7koFBMQa_Y2vwdETtw@mail.gmail.com>
In-Reply-To: <CAO9H7P8jocp0J_8oFqnYCmheS0o83x6B7koFBMQa_Y2vwdETtw@mail.gmail.com>

--------------Ml1tBgJfwQeBJnjo04Q5VZT2
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gNC8yMi8yNCAxNDoxNSwgWGF2aSBIZXJuYW5kZXogd3JvdGU6DQo+IFllcy4gSXQgbWFr
ZXMgYSBsb3Qgb2Ygc2Vuc2UuIEkgc3RpbGwgbmVlZCB0byB1bmRlcnN0YW5kIHRoZSBkZXRh
aWxzIA0KPiBiZXR0ZXIsIGJ1dCBsZXQgbWUga25vdyBpZiBJIGNhbiBoZWxwIHdpdGggc29t
ZXRoaW5nLg0KDQpjb25ncmF0cyEgSXQncyBub3cgeW91ciBwcm9qZWN0IGFuZCB3ZSB3aWxs
IGhlbHAuIDopDQoNCkNoZWVycyENCi1zbG93DQo=

--------------Ml1tBgJfwQeBJnjo04Q5VZT2--

--------------00Ykiu0HMbs0Ht5ZVotl1y0O
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEE+uLGCIokJSBRxVnkqh6bcSY5nkYFAmYmpM0FAwAAAAAACgkQqh6bcSY5nkbZ
WRAArW8Usea2Qws1/5xZ4TWzxYJFBewsJTNXhRJG8DoRKsyArgbqVBVRn+Xw+50BKg2xpl5T53Yv
lXsrIlt433wOipCg5LfmqV/gUwQXzMZMUnVQLglwwO9YB1d21NTCtVB53oeTUHcUHwzZLY6OxMEA
pZZJHsFn7zwjKqnevETZp8t6nylHiyM8Ij1GXnRZecwd1F7I8ZSJDW4/S9XYbQtc8EtFW8IAMoe/
adjmPdXxBM6C+kHJmi0x8qDXwQXJ5hTgLTgV3VN72hAPtDOT4NwsC5TluXwbm/2Jbh/z2EKrkR1O
amarCvmFCLuvc1gGI3fLFjenmvW25s3A+MWY5LJtiRL6zgGYPheRMXf0KaK3nU4A2q6JX6gQY+f3
8d669KcfEo00RyIVDVv9UBpzmvPgXUlcUQ+hb6+lQw0K1tzCdis5+o6+crPKEWDkthkhH5VPxl/L
PSDRz9NU8QNkEeghH+S6DdQPba3RApaPee86lI1cfRx1FHvZp6k0Z3eIpxeuLrzPcvIXS3MVIAIH
7W32lCv8MugWq9KGTDsTjf/kfmtAZHeMFFYyH7r6g3ADViNUe2PCePoamim6s6SvFRYRLHxOiV8j
dVnKbIwrUnXokzkSDF2K4fCwQyXyaM8bfoKq5vGUWSi2GdU6Ub4mJoxp0AEaXYDhRdTSypvxOjNO
86M=
=o7LJ
-----END PGP SIGNATURE-----

--------------00Ykiu0HMbs0Ht5ZVotl1y0O--

