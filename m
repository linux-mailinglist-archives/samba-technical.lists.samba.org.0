Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D294E9E5A21
	for <lists+samba-technical@lfdr.de>; Thu,  5 Dec 2024 16:47:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=IVNmyQzOhzoHH6b7xtOnDlluJJSj4JcqO30wdOFlI3s=; b=w0eUdBMbcAxtK0zZH/wtwGMp/4
	ppUGFZb/c/39PKTp/GzTkL+PEP+NRQH+lJKZxixj55vquk0itHoEaiyTGl/h3SqJ+VYmkFnxtHHPc
	mrRe9IH1CQomCb8B3phsjWQeoZiUQh0bSuN6+LsLqQJPLvSZ/uhAMDh81Kezmy1HD7yk4+3IhRV6n
	PzWb6RYpo3h6ZkWHVdE+1TJJsCraEWXSbgMANNJfpv4kxo5cpPzMomLyRlLA9mYPLWq2altkrnImf
	2Hy6DDOhE3fV1RXOIprozCRkifBQi12NMkLq9k9ut2deghr4LgjiPuI3Rx58HXfe+Qj4Q225TwziG
	pemR7COQ==;
Received: from ip6-localhost ([::1]:37678 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1tJE3f-003YGE-4j; Thu, 05 Dec 2024 15:46:27 +0000
Received: from plasma4.jpberlin.de ([80.241.57.33]:35443) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1tJE3a-003YG7-N5
 for samba-technical@lists.samba.org; Thu, 05 Dec 2024 15:46:25 +0000
Received: from spamfilter04.heinlein-hosting.de
 (spamfilter04.heinlein-hosting.de [80.241.56.122])
 by plasma.jpberlin.de (Postfix) with ESMTP id BFEA6AB702;
 Thu,  5 Dec 2024 16:46:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kania-online.de;
 s=MBO0001; t=1733413577;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=IVNmyQzOhzoHH6b7xtOnDlluJJSj4JcqO30wdOFlI3s=;
 b=hNhqPGh8Ni7pc3+LKQ9l6MNArqGQi4yeM8ICTwOzYFrytKUi7fVREDqQPRS2b+SHaL6VUb
 sFcY+8vUUE0Cif2G9IFK46kprJ+Qe3SwWIXkMNkoGegsGz8XHe7GnNZNImIaEHvs9yIALd
 uxrTuPvYmmfRBWwVgA+9xGyu8c6Vx6Cam3BFBKlJjhYYgjKiJrdoUqxptzsMjhlcTC0+BS
 271qHTnY0c6YJ0Hkv7GPuRnTvhC9iEI1Fi5uqrRp5RuXsMjhwId4girpRWyw3t2m7o4nyg
 Y7476k/HfrsBO5MOeoUqWv6AYJ8L09Z9hhQJNMuBNgBm2DbIDcJ8Stkg0QdkTA==
Received: from plasma.jpberlin.de ([80.241.56.68])
 by spamfilter04.heinlein-hosting.de (spamfilter04.heinlein-hosting.de
 [80.241.56.122]) (amavisd-new, port 10030)
 with ESMTP id zyR9KXdjpQFF; Thu,  5 Dec 2024 16:46:11 +0100 (CET)
Received: from [192.168.123.203] (p5b240852.dip0.t-ipconnect.de [91.36.8.82])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 (Authenticated sender: stefan@kania-online.de)
 by plasma.jpberlin.de (Postfix) with ESMTPSA id 5B4B4ABDCA
 for <samba-technical@lists.samba.org>; Thu,  5 Dec 2024 16:46:06 +0100 (CET)
Message-ID: <0d73fa11-3e41-4125-99c3-b84bc07e527f@kania-online.de>
Date: Thu, 5 Dec 2024 16:46:05 +0100
MIME-Version: 1.0
Subject: Re: script enablerecyclebin
To: samba-technical@lists.samba.org
References: <da0dbae1-2fde-45ad-97b7-3b92a48dd9f3@kania-online.de>
 <20241205110511.13446bae@devstation.samdom.example.com>
Content-Language: en-US, de-DE
Organization: Stefan Kania
In-Reply-To: <20241205110511.13446bae@devstation.samdom.example.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------jwvI5f204xXG5KR05nKFmENJ"
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
From: Stefan Kania via samba-technical <samba-technical@lists.samba.org>
Reply-To: Stefan Kania <stefan@kania-online.de>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------jwvI5f204xXG5KR05nKFmENJ
Content-Type: multipart/mixed; boundary="------------RtJCGHUCMEmM0i0JnAlQeJl4";
 protected-headers="v1"
From: Stefan Kania <stefan@kania-online.de>
To: samba-technical@lists.samba.org
Message-ID: <0d73fa11-3e41-4125-99c3-b84bc07e527f@kania-online.de>
Subject: Re: script enablerecyclebin
References: <da0dbae1-2fde-45ad-97b7-3b92a48dd9f3@kania-online.de>
 <20241205110511.13446bae@devstation.samdom.example.com>
In-Reply-To: <20241205110511.13446bae@devstation.samdom.example.com>

--------------RtJCGHUCMEmM0i0JnAlQeJl4
Content-Type: multipart/mixed; boundary="------------2AOkUaIVwy6YOeLgWIBdYEGJ"

--------------2AOkUaIVwy6YOeLgWIBdYEGJ
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

DQoNCkFtIDA1LjEyLjI0IHVtIDEyOjA1IHNjaHJpZWIgUm93bGFuZCBQZW5ueSB2aWEgc2Ft
YmEtdGVjaG5pY2FsOg0KPiBPbiBUaHUsIDUgRGVjIDIwMjQgMTE6MTk6MDIgKzAxMDANCj4g
U3RlZmFuIEthbmlhIHZpYSBzYW1iYS10ZWNobmljYWwgPHNhbWJhLXRlY2huaWNhbEBsaXN0
cy5zYW1iYS5vcmc+DQo+IHdyb3RlOg0KPiANCj4+IEhpLA0KPj4NCj4+IGFmdGVyIGVuYWJs
aW5nIHJlY3ljbGViaW4gd2l0aCB0aGUgc2NyaXB0IGVuYWJsZXJlY3ljbGViaW4gZnJvbSB0
aGUNCj4+IHNvdXJjZXMsIHRoZXJlIGFyZSBubyBtb3JlIGRlbGV0ZWQgb2JqZWN0IGluICJj
bj1kZWxldGVkIG9iamVjdHMiIGl0DQo+PiBsb29rIGxpa2UgdGhlIG9iamVjdHMgd2lsbCBi
ZSBkZWxldGVkIGltbWVkaWF0ZWx5Lg0KPj4gSSdtIHVzaW5nIFNhbWJhIDQuMjEuMSBmcm9t
IHRoZSBEZWJpYW4gYm9va3dvcm0tYmFja3BvcnRzIGFuZCB0aGUNCj4+IHNjcmlwdCBmcm9t
IHRoZSBzb3VyY2VzIG9mIFNhbWJhIDQuMjEuMS4NCj4+DQo+PiBBbnkga25vd24gaXNzdWU/
DQo+Pg0KPj4gU3RlZmFuDQo+IA0KPiBVbmxlc3Mgc29tZXRoaW5nIGhhcyBjaGFuZ2VkIGFu
ZCBJIG1pc3NlZCBpdCwgdGhlIHJlY3ljbGUgYmluIGluIFNhbWJhDQo+IEFEIGRvZXMgbm90
IHdvcmssIHRoZXJlIGlzIGEgYnVnIGFib3V0IGl0IGhlcmU6DQo+IA0KPiBodHRwczovL2J1
Z3ppbGxhLnNhbWJhLm9yZy9zaG93X2J1Zy5jZ2k/aWQ9MTA0MDMNCj4gDQo+IFJvd2xhbmQN
Cj4gDQoNClRoYXQncyBiYWQuIEFmdGVyIHRyeWluZyB0byBhY3RpdmF0ZSB0aGUgcmVjeWNs
ZWJpbiwgZGVsZXRlZCBvYmplY3RzIGFyZSANCm5vIGxvbmdlciBzdG9yZWQgaW4gImNuPWRl
bGV0ZWQgb2JqZWN0cyIgdGhhdCdzIHZlcnkgYmFkLiBTbyBlaXRoZXIgaXQgDQpzaG91bGQg
YmUgZml4ZWQgdmVyeSAgcXVpY2ssIG9yIHRoZSBzY3JpcHQgc2hvdWxkIGJlIHJlbW92ZWQu
DQpGb3IgbWUgaXQncyBqdXN0IGEgdGVzdCwgc28gSSBkb24ndCBjYXJlIHRvIHJlaW5zdGFs
bCBteSBBRC4NCg0KSXMgdGhlcmUgYSB3YXkgdG8gcmVtb3ZlIGl0PyBTbyB0aGF0IGNvdWxk
IGhlbHAuDQoNCg==
--------------2AOkUaIVwy6YOeLgWIBdYEGJ
Content-Type: application/pgp-keys; name="OpenPGP_0x52F6D4DD1BB68AB5.asc"
Content-Disposition: attachment; filename="OpenPGP_0x52F6D4DD1BB68AB5.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

xjMEZD5zHxYJKwYBBAHaRw8BAQdAMVmXn59f0nkYv5WMsQq+KrcYCsNfaUj/WZtg
zdF72yDNJVN0ZWZhbiBLYW5pYSA8c3RlZmFuQGthbmlhLW9ubGluZS5kZT7CiQQT
FggAMRYhBGxP1rNZHkCiVplAgVL21N0btoq1BQJkPnNQAhsDBAsJCAcFFQgJCgsF
FgIDAQAACgkQUvbU3Ru2irXx0QEAtwVwH3XaKI4V5K8xNBFjLCvNHZsOBiF1zXRe
V3+ocvcA/i+HTEj2s+Xw0AdOCzTKpUetOkifYMHmRdzoRdjItaUIzjgEZD5zHxIK
KwYBBAGXVQEFAQEHQLCpLYCfOAWfcF2Za/K3FymUQPfyIZ/eupKMlQrGRJUhAwEI
B8J4BBgWCAAgFiEEbE/Ws1keQKJWmUCBUvbU3Ru2irUFAmQ+c1ACGwwACgkQUvbU
3Ru2irV69QEAxwzfX/shQahBfmica2GbWv7hytmlnu/QFNP2WNDb/9MA/133+PWv
q8PePaEGS4s2tRUd8ktDKmVYz7EnJwaCyqcH
=3Dxppn
-----END PGP PUBLIC KEY BLOCK-----

--------------2AOkUaIVwy6YOeLgWIBdYEGJ--

--------------RtJCGHUCMEmM0i0JnAlQeJl4--

--------------jwvI5f204xXG5KR05nKFmENJ
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQRsT9azWR5AolaZQIFS9tTdG7aKtQUCZ1HKvQUDAAAAAAAKCRBS9tTdG7aKtc4V
AQDKJ5q8Q+QaNKokeLcttyPWGYCg4JH+BMGZ4VX+nCXebgD+KkQ7DGFhi+P9+MQzxFGe0FpF5aTI
kupXI+4oSYZ6jQA=
=IpuY
-----END PGP SIGNATURE-----

--------------jwvI5f204xXG5KR05nKFmENJ--

