Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 3731198CDF3
	for <lists+samba-technical@lfdr.de>; Wed,  2 Oct 2024 09:45:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=oY9GpVLNcEmYqW4eepmmOmBHJ8KexUVA3p6EDNls5Ks=; b=3pwa3i2XgZRqE1YbXRtbUPrzFV
	/8xxsWgkF4b4PRvnk7moX7YdZ5XFb8jyV3Jdso3d33RdKfm/00VGGuKxrB9SWE2sxBUDmvhzV68TU
	lLHpcoMoF3NIBy+lnc6vIyr5yXavoE2+BnEguhH0GvnJzxJiIGw0Jmdld4ACyfVxx70Ron+jfQlAc
	Ede1ZZ5X7Jz204OKulz5eY4IXPY7lncq8QZZwtKp8+A0USvR59KgjcDaYRWMacwb9hIb0ZPFpUINF
	O4E/M13Imtb+TMX9HctFX+1UZArg8FULC1Dqvey0IYrwx505vtz6Yt41JzCMP+zuc8L2/sVumNVR3
	BLAm+B4Q==;
Received: from ip6-localhost ([::1]:42468 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1svu23-002plu-6A; Wed, 02 Oct 2024 07:44:23 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:48440) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1svu1u-002pln-Ht
 for samba-technical@lists.samba.org; Wed, 02 Oct 2024 07:44:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=oY9GpVLNcEmYqW4eepmmOmBHJ8KexUVA3p6EDNls5Ks=; b=FfNwdZirMyx47nEWEAZu5ZGk7M
 qM7QCKUfRxFT0eY4gQFR6zItfWAjAGgEq+QPngtE4fccc3uSRuwOjsngkk+kd5o9a8qR9QmR+DeSW
 k/Fz0nudPCAtjFuFxDsqc85T4Zsmyn8UhOih38sq8W+ykmdjgXYtfHS27fmTYLwZJRy4YjlJhZjrh
 ytvGahBlMHuBt0fakvOXNeSnWHgFnJCl/lzzoOeegIkWFGPytKKtUjUc1siGzJ0hxPlSeFs5rrjV7
 4uahf7OiJeFXlZahM0edv7DT4RSD8f6Q1MPc+ltlTtJirKhNmQeG5gMc8v3wGIcSyuIlpB93GFH14
 64KuZGeFmCAgm1xXPlUpEGWx2uRS045X9vtXQwfLIwQdvXmcewIV0zT82IVdCuxywruxBrFxvV+ps
 rJAKS02F4xIa83QwL7bowfvNhCs5zcgMh8HMrDPtGbNf8kbg0V3VKJ+gC+N6O9mE1xyUHgKpS+tS0
 go0WsUy1klu3sunydA87/TSI;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1svu1t-003296-0r; Wed, 02 Oct 2024 07:44:13 +0000
Message-ID: <56ac8ed5-781d-4ca9-95e6-75a6e52c34e3@samba.org>
Date: Wed, 2 Oct 2024 09:44:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: SMB POSIX Extensions specification
To: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>,
 samba-technical@lists.samba.org, linux-cifs@vger.kernel.org
References: <20241002073519.2fee66fwopzy3dpp@pali>
Content-Language: en-US, de-DE
In-Reply-To: <20241002073519.2fee66fwopzy3dpp@pali>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------sIcR74uqMEPq5ZQHkap7q4yj"
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
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------sIcR74uqMEPq5ZQHkap7q4yj
Content-Type: multipart/mixed; boundary="------------Ih3GYj69kv3uPzl0DWNKIsSz";
 protected-headers="v1"
From: Ralph Boehme <slow@samba.org>
To: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>,
 samba-technical@lists.samba.org, linux-cifs@vger.kernel.org
Message-ID: <56ac8ed5-781d-4ca9-95e6-75a6e52c34e3@samba.org>
Subject: Re: SMB POSIX Extensions specification
References: <20241002073519.2fee66fwopzy3dpp@pali>
In-Reply-To: <20241002073519.2fee66fwopzy3dpp@pali>

--------------Ih3GYj69kv3uPzl0DWNKIsSz
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTAvMi8yNCA5OjM1IEFNLCBQYWxpIFJvaMOhciB3cm90ZToNCj4gSGVsbG8sIEkgd291
bGQgbGlrZSB0byBhc2ssIGlzIHRoZXJlIGFueSBub3JtYXRpdmUgc3BlY2lmaWNhdGlvbiBv
Zg0KPiBTTUIgUE9TSVggRXh0ZW5zaW9ucz8gQmVjYXVzZSBJIHdhcyBub3QgYWJsZSB0byBm
aW5kIGFueXRoaW5nIGluDQo+IE1TLVNNQjIgYW5kIG5laXRoZXIgaW4gb3RoZXIgcmVsYXRl
ZCBkb2N1bWVudHMuDQoNCnRoaXMgaXMgc3RpbGwgdmVyeSBtdWNoIFdJUC4NCg0KaHR0cHM6
Ly9naXRsYWIuY29tL3NhbWJhLXRlYW0vc21iMy1wb3NpeC1zcGVjDQpodHRwczovL2dpdGxh
Yi5jb20vc2FtYmEtdGVhbS9zbWIzLXBvc2l4LXNwZWMvLS9yZWxlYXNlcw0KDQpJJ20gaG9z
dGluZyBXSVAgaHRtbCB2ZXJzaW9ucyBoZXJlOg0KDQpodHRwczovL3d3dy5zYW1iYS5vcmcv
fnNsb3cvU01CM19QT1NJWC8NCg0KLXNsb3cNCg==

--------------Ih3GYj69kv3uPzl0DWNKIsSz--

--------------sIcR74uqMEPq5ZQHkap7q4yj
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEE+uLGCIokJSBRxVnkqh6bcSY5nkYFAmb8+cwFAwAAAAAACgkQqh6bcSY5nkYE
7A/+JFDnTh/0tM7SDhJJZmaQygOstfMI7Hl1SOknWqTnndMUwvaxa05WHnGtIqAc0SgHPLhpYP8U
nVwpX4FwYXfMZNnar2kBXD7VcM+WytLZuN9onNfelBefuJMFe5/6/iCsSfa0U1NE/b3iS3+ou1tR
n4Ic2YdotSrcQo3HvnYa+c4t54qIix3KTXuCNr0/Clmznmt8UAG9QGvBYTxRyvoh6JEMerRUsV/c
bJRdV1g4QplnKsz+fJuRZ3LOtAxgoJ0SsbGOXMKuU9729BD4D/uEXNOF0Nq737GCFtvxRuoTl466
fTr0B6f7mINEy2MjMaELkLet2hsgQdagi75ki6tW+pZ8mCwKdoWH3Xr9inYHiH8K3j45MDf3UDgQ
Rt0JxPn0d/bUcwe7ioorkvdtDTrhH0LHFsX+z5Ywgmu7dH/ZXd4OfYtS+PzssDzoVAZwJ9E2sYLB
Nzz3b+xPR/2ApeVE4B4TCHkSaYlsOZQ9bgTIBf6s2ytCOz6JxIcgvnI9pU1S2JiFQlJjyJtsb8sS
ODBOFOIr5oDNqQTQ3egxKRnbuZU+8tfEk47h+vNVVlQ3ZJo9epFVeN5ikdlzREHoftVuLp9l2w0U
zMRnAKbx+lnizh3qzmzorquVodIJM43xQmjtUVZevbKJJ3aus00lOzaifPfWgwsBShMfbgyEmk5K
I3A=
=jPmn
-----END PGP SIGNATURE-----

--------------sIcR74uqMEPq5ZQHkap7q4yj--

