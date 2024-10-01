Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B2D698BCDF
	for <lists+samba-technical@lfdr.de>; Tue,  1 Oct 2024 14:55:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=I9tAKtXhAEoNUIUpdOSQ7fW72f92mtJgZDd0QfaA4dU=; b=UHt2/M49fdaw33ktnBr1ceg29K
	xKQZ3MFrXXOnk8eC7umGKfXKvW3tDaUBXDwmiNyupK52gzOrLuvoB+GosY/VIzCqxV4AQr4/tiieq
	p4765VgSKrB8/lgnXtIGqcqMqi+S+HMLt0cCc2L8uZ5Tgmfem6a1ROV6NBGQFZ9iUhd00Ct4GyC7G
	gn4GtK3q5lcoDpdqNQVl3xmSoQ5S8f0Kx1gObtKjl3Zf0cVaHuI94zl4m/PBhYP/AR/bRYIEfuVId
	vu7T/b8IJVqRdBaI9lR2zEZgGnppoUUENGqfbMVTly4OV2lSNWzL/5ETVgyqQDHrCo3Xcdi5jbMlv
	dZYpj1Rw==;
Received: from ip6-localhost ([::1]:36436 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1svcPA-002mpx-1e; Tue, 01 Oct 2024 12:55:04 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:32300) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1svcP5-002mpn-4t
 for samba-technical@lists.samba.org; Tue, 01 Oct 2024 12:55:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:Cc:To:Date:Message-ID;
 bh=I9tAKtXhAEoNUIUpdOSQ7fW72f92mtJgZDd0QfaA4dU=; b=h7fH6VBYFGkgpkPusA1if0p1+5
 zPlh8YTCIt27dnhDRaVJg40hToHfgZmKKm9iNWxDnJhxy1q6CDn/sHVBMSfFpOp3coPPUviZaMbxY
 U2uDhxlmLFkZfjXwpfHkJWCWOMKV9k9aiKwWHosv9OvcUOaSb42wb6MS4Clh8dKmoM31NUzL7SMrs
 vO7wP4G76KE0ckLpJA8NEvyZYdq7xl0GMEoyI2SwrvmiCVu9E8Ty4kCLmbg1ekqijPEDbH2I0QYO0
 LPFSMaAz1/ShNWZnhAv4dhsN3gd0iFiCCNdcNeXLR5tFX7EIo1Hv4B+dbA26Qu23ExCMKYZv3ppLV
 nuNlXf+RUISdwB8r2FAIK1IL1b2zkxJCLAd0EsdNLqstVTeCcIhF8cgygwKh3g9GY8iYLrF95pF2i
 44a90seVAxd2KvzEB+AoqB7tsytlEUZfCiwvaTWaDPg8XR6q+DBRIYOqVo/w1j/iDp8Kl/rzU68vs
 cwMrbVsegIEictNjYQyZI0xJ;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1svcP4-002ted-1b; Tue, 01 Oct 2024 12:54:58 +0000
Message-ID: <e12d7594-02df-4cbb-80fc-276d907afd90@samba.org>
Date: Tue, 1 Oct 2024 14:54:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Current Samba master incorrectly returns STATUS_INVALID_HANDLE on
 copy_chunk
To: Steve French <smfrench@gmail.com>,
 samba-technical <samba-technical@lists.samba.org>
References: <CAH2r5mt7cE8Cc2K5K8nRM2RL=R-rwuAR9h6SSyEqtApuochtuQ@mail.gmail.com>
Content-Language: en-US, de-DE
In-Reply-To: <CAH2r5mt7cE8Cc2K5K8nRM2RL=R-rwuAR9h6SSyEqtApuochtuQ@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------AYUhX4xCD030kYZlfP1FTU91"
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
Cc: CIFS <linux-cifs@vger.kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------AYUhX4xCD030kYZlfP1FTU91
Content-Type: multipart/mixed; boundary="------------qPZflcvuPeb03oIhDPVGhJMA";
 protected-headers="v1"
From: Ralph Boehme <slow@samba.org>
To: Steve French <smfrench@gmail.com>,
 samba-technical <samba-technical@lists.samba.org>
Cc: CIFS <linux-cifs@vger.kernel.org>
Message-ID: <e12d7594-02df-4cbb-80fc-276d907afd90@samba.org>
Subject: Re: Current Samba master incorrectly returns STATUS_INVALID_HANDLE on
 copy_chunk
References: <CAH2r5mt7cE8Cc2K5K8nRM2RL=R-rwuAR9h6SSyEqtApuochtuQ@mail.gmail.com>
In-Reply-To: <CAH2r5mt7cE8Cc2K5K8nRM2RL=R-rwuAR9h6SSyEqtApuochtuQ@mail.gmail.com>

--------------qPZflcvuPeb03oIhDPVGhJMA
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgU3RldmUNCg0KT24gOS8zMC8yNCAxMDoxMyBQTSwgU3RldmUgRnJlbmNoIHZpYSBzYW1i
YS10ZWNobmljYWwgd3JvdGU6DQo+IEkgbm90aWNlZCB0aGF0IFNhbWJhIG1hc3RlciBpZiBt
b3VudCB3aXRoICJwb3NpeCIgdGhlbg0KPiBGU0NUTF9TUlZfQ09QWUNIVU5LX1dSSVRFIHdp
bGwgcmV0dXJuICJTVEFUVVNfSU5WQUxJRF9IQU5ETEUiIHdoZXJlDQo+IHRoZSBzYW1lIHRo
aW5nIHdvcmtzIGZpbmUgaWYgeW91IG1vdW50IHdpdGhvdXQgInBvc2l4IiAoc28gbG9va3Mg
bGlrZQ0KPiANCj4gQW4gZWFzeSByZXBybyBpcyB3aXRoIHRoZSB4ZnN0ZXN0IHRvb2wgImNs
b25lciINCj4gDQo+IGUuZyAuL3NyYy9jbG9uZXIgL21udC9haW8tdGVzdGZpbGUgL21udC9j
bG9uZS1vZi1haW8tdGVzdGZpbGUNCj4gDQo+IEl0IHdvcmtzIGZpbmUgdG8gb3RoZXIgc2Vy
dmVycyAoZS5nLiB0byBrc21iZCB3aXRoIG9yIHdpdGhvdXQgInBvc2l4Ig0KPiBtb3VudCBv
cHRpb24pDQoNCm5vIGlkZWEgd2hhdCBjb3VsZCBiZSBjYXVzaW5nIHRoaXMuDQoNCkNhbiB5
b3UgcGxlYXNlIGdldCB1cyBhIFNhbWJhIGxvZyB3aXRoIGxldmVsIDEwIHBsdXMgc3RyYWNl
IC12dHQgLXAgUElEIA0KLW8gc3RyYWNlLnR4dCBvZiB0aGUgc21iZCBvZiB0aGUgY29ubmVj
dGlvbj8NCg0KVGhhbmtzIQ0KLXNsb3cNCg==

--------------qPZflcvuPeb03oIhDPVGhJMA--

--------------AYUhX4xCD030kYZlfP1FTU91
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEE+uLGCIokJSBRxVnkqh6bcSY5nkYFAmb78SEFAwAAAAAACgkQqh6bcSY5nkaB
ZQ/+PUNw9ceTSNR5TM2qvPF6fSAA7TvVvRt/OXxuyyz/LUC9UzLPQGHEi3jRT/ZttxlvFLvbLc2X
Pl1jL7+AIwHVlmO1iH6gQwRUh/TanuI5q0/yUh4S7aLm+XS+1ZudmSz95pbWCaMjwhZeFo/GioB2
zbwGFQ7sy4h91ZT5OkINHrtyutCBJF0kat7TPlxtkDYA7xWmPQN4sbxojAAE6tksMyrzrG21S/N/
lOj5rStADMGXMaN1irFvJWH5A5Dc+bZxOWQ/XmdTgDCCZN9r5PPGvua7S/qia099mTMe47pt1LWX
XDS7HkzT6GFaw88m50hF3DkQoIYHlUSqCOxJvItjpEDV0m7eXA4hVG6zbKoqIuZEh6aE3S7c8FAE
TDZRhKXQk1BXqZ1CemxNasW43TIdBJwJHncubqKDkPe/cuNZvqYp5OqoG+6+Nto1gskzG1e1YEMD
xnuSL9DYAeJkbyd8A2LZnx+mq89zkH1kUQNfCL6MAajBMCOpjtp0owzq2fGE7XHjzUUQS1anc8Jc
Dju51Tp1SmITP4pr0X8kyYlL7nqOGnvxnyAVjBjM3gtaUYz20H8FJKzGE8J2uqc+4iVam7q09olo
Ikqe4W2WORczEYMnqv1oEXsbQdTOY4ezP7MML3wqw6Y39jkX27dbj7qFiidO//h0w5TorsXkvhv2
5o8=
=uIvc
-----END PGP SIGNATURE-----

--------------AYUhX4xCD030kYZlfP1FTU91--

