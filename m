Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 39A79AFA4CB
	for <lists+samba-technical@lfdr.de>; Sun,  6 Jul 2025 13:41:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=yXZ1QwtyXWpYw+cNhAnQXu4pFrkdP2ZFzsO4kqzmNj0=; b=tq+sW6KAcnsSw1s/1EYTNACiNu
	OMA1s1ygwL2RXXQEly+q/uqVpOO7tinDIywO4XD9ojysV80FMtOPRbY1SUn8y+QTLi1VopOYUcRVO
	+1btLb7OIFsQj0kOjP76aZ4zGdaEkxhAqrSibwVMGyjz7fAepATaaNtOxpnDbZUQB0xoSAZyFKrox
	Do2YTzSaTG0H35w++5sv9QmgnbvkxAwVyZZ2egw3wQiPx05qOlsjAjl+nVANKI/0ZtaGUzgEoExto
	qosvqBFl1XqKJYMVdZMBZ46qSSO5JoRlVAHpqMbhcdNUDcfOcxDaHikdIs9DbIw7Qh+D+0We40G1T
	1PZvqfuA==;
Received: from ip6-localhost ([::1]:44452 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uYNjH-00Aegv-Ie; Sun, 06 Jul 2025 11:40:19 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:51864) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uYNj3-00AegT-8R; Sun, 06 Jul 2025 11:40:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=yXZ1QwtyXWpYw+cNhAnQXu4pFrkdP2ZFzsO4kqzmNj0=; b=QqihfUj3QPbyRySGbvOT/UiHaY
 Cjjf6u1wEfcEalQ6CqeYTRXRfPn2MtjrLkmp8uesoRwIhv48kVx7XU2gCxadF0aILv1q19P2KFQp9
 ukzQ0bwQHPfH4hUiZn1/e+/Onriu+8QER6n6+YlVRYs+pINQca7RhVP/Ll1xNFsb6VG1x5K5JKJJf
 hNlPzGwFWgDHFsy7qSAMj30QsCD2TUKdO2tq900BUKWiAIMCr5lB69ROv4v5Cqv436pj9z5Ezd/Dy
 uV1DaRDXMveKHl52a7A1O6M0bazRozO0uFGdd/ApDkDUSE+mm14oCe5hvWAoq/IoOuObftgliadhv
 vqI4oPKUl6bVHWo63/aCT3bq9yC2E0F6f5IABNCAh2yK6RdptfpMtCRfW79lZBe0UBs0XYDveaR+Y
 pEHG86VRmf8+3Wi/s8GDzf8XY6AqXC3Pa0BlKJaBvZEiS/iGTGvrcWnG0ISDU9Uy8fNLnuJm+v5az
 yLNr3cTIXsEsmg0jqz+t0haO;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uYNj1-00EATg-3A; Sun, 06 Jul 2025 11:40:04 +0000
Message-ID: <f8071770-dc50-49c0-80fe-b98c95ea207a@samba.org>
Date: Sun, 6 Jul 2025 13:40:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US, de-DE
To: "samba@lists.samba.org" <samba@lists.samba.org>,
 samba-technical <samba-technical@lists.samba.org>,
 samba-announce@lists.samba.org
Subject: Important Change in Upcoming Microsoft Update
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------hfAM0ib8BWRVnzk10ZixhykE"
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
--------------hfAM0ib8BWRVnzk10ZixhykE
Content-Type: multipart/mixed; boundary="------------YG0S5chCRrWbgb5V5xSNYP6B";
 protected-headers="v1"
From: Ralph Boehme <slow@samba.org>
To: "samba@lists.samba.org" <samba@lists.samba.org>,
 samba-technical <samba-technical@lists.samba.org>,
 samba-announce@lists.samba.org
Message-ID: <f8071770-dc50-49c0-80fe-b98c95ea207a@samba.org>
Subject: Important Change in Upcoming Microsoft Update

--------------YG0S5chCRrWbgb5V5xSNYP6B
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgYWxsIQ0KDQpPbiA4dGggb2YgSnVseSwgTWljcm9zb2Z0IHdpbGwgcmVsZWFzZSBhbiBp
bXBvcnRhbnQgc2VjdXJpdHkgdXBkYXRlIGZvciANCkFjdGl2ZSBEaXJlY3RvcnkgRG9tYWlu
IENvbnRyb2xsZXJzIGZvciBXaW5kb3dzIFNlcnZlciB2ZXJzaW9ucyBwcmlvciB0byANCjIw
MjUuDQoNClRoaXMgdXBkYXRlIGluY2x1ZGVzIGEgY2hhbmdlIHRvIHRoZSBNaWNyb3NvZnQg
UlBDIE5ldGxvZ29uIHByb3RvY29sLCANCndoaWNoIGltcHJvdmVzIHNlY3VyaXR5IGJ5IHRp
Z2h0ZW5pbmcgYWNjZXNzIGNoZWNrcyBmb3IgYSBzZXQgb2YgUlBDIA0KcmVxdWVzdHMuIFNh
bWJhIHJ1bm5pbmcgYXMgZG9tYWluIG1lbWJlcnMgaW4gdGhlc2UgZW52aXJvbm1lbnRzIHdp
bGwgYmUgDQppbXBhY3RlZCBieSB0aGlzIGNoYW5nZSBpZiBhIHNwZWNpZmljIGNvbmZpZ3Vy
YXRpb24gaXMgdXNlZCwgc2VlIGJlbG93IA0KZm9yIHdoaWNoIGNvbmZpZ3VyYXRpb24gaXMg
YWZmZWN0ZWQuDQoNCldpbmRvd3MgU2VydmVyIHZlcnNpb24gMjAyNSBpcyBhbHJlYWR5IGVx
dWlwcGVkIHdpdGggdGhlc2Ugc3BlY2lmaWMgDQpzZWN1cml0eSBoYXJkZW5pbmdzLCBhbmQg
TWljcm9zb2Z0IGlzIG5vdyBwbGFubmluZyB0byBkZXBsb3kgdGhlbSB0byBhbGwgDQpzdXBw
b3J0ZWQgV2luZG93cyBTZXJ2ZXIgdmVyc2lvbnMgZG93biB0byBXaW5kb3dzIFNlcnZlciAy
MDA4Lg0KDQoNCldobyBpcyBhZmZlY3RlZD8NCg0KU2FtYmEgaW5zdGFsbGF0aW9ucyBhY3Rp
bmcgYXMgbWVtYmVyIHNlcnZlcnMgaW4gV2luZG93cyBBRCBkb21haW5zIHdpbGwgDQpiZSBh
ZmZlY3RlZCBpZiB0aGV5IGFyZSBjb25maWd1cmVkIHRvIHVzZSB0aGUgJ2FkJyBpZG1hcHBp
bmcgYmFja2VuZC4gDQpTYW1iYSBzZXJ2ZXJzIG5vdCB1c2luZyB0aGlzIGNvbmZpZ3VyYXRp
b24gd2lsbCBub3QgYmUgYWZmZWN0ZWQgYnkgdGhlIA0KY2hhbmdlIOKAkyBhdCBsZWFzdCB0
byBvdXIgY3VycmVudCBrbm93bGVkZ2UgYW5kIHVuZGVyc3RhbmRpbmcgb2YgdGhlIA0KY2hh
bmdlIOKAkyBhbmQgbm8gZnVydGhlciBhY3Rpb24gaXMgcmVxdWlyZWQuDQoNCkN1cnJlbnQg
dmVyc2lvbnMgb2YgU2FtYmEgd2l0aCB0aGUgYWZmZWN0ZWQgY29uZmlndXJhdGlvbiB3aWxs
IG5vIGxvbmdlciANCmZ1bmN0aW9uIGNvcnJlY3RseSBvbmNlIHRoZSBNaWNyb3NvZnQgdXBk
YXRlIGhhcyBiZWVuIGFwcGxpZWQuIFVzZXJzIA0Kd2lsbCBub3QgYmUgYWJsZSB0byBjb25u
ZWN0IHRvIHRoZSBTTUIgc2VydmljZSBwcm92aWRlZCBieSBTYW1iYSBmb3IgYW55IA0KZG9t
YWluIGNvbmZpZ3VyZWQgdG8gdXNlIHRoZSAnYWQnIGlkbWFwcGluZyBiYWNrZW5kLg0KDQoN
CldoYXQgdGhlIFNhbWJhIFRlYW0gaXMgZG9pbmcgYW5kIHdoYXQgeW91IHNob3VsZCBkbw0K
DQpNZW1iZXJzIG9mIHRoZSBTYW1iYSB0ZWFtIGhhdmUgYmVlbiBjb2xsYWJvcmF0aW5nIHdp
dGggTWljcm9zb2Z0IGFuZCANCmNoYW5nZXMgdG8gU2FtYmEgYXJlIGN1cnJlbnRseSBiZWlu
ZyBkZXZlbG9wZWQgYW5kIHRlc3RlZCB0byBlbnN1cmUgZnVsbCANCmNvbXBhdGliaWxpdHkg
YmV0d2VlbiBTYW1iYSBhbmQgTWljcm9zb2Z0IHByb2R1Y3RzLiBUaGUgU2FtYmEgdGVhbSBp
cyANCmFpbWluZyB0byBwcm92aWRlIHVwZGF0ZWQgU2FtYmEgcmVsZWFzZXMgb24gTW9uZGF5
IGV2ZW5pbmcgKFVUQysyKS4NCg0KDQpXaGF0IHlvdSBzaG91bGQgZG86DQoNCklmIHlvdeKA
mXJlIHJ1bm5pbmcgU2FtYmEgaW4gYSBXaW5kb3dzIEFEIGVudmlyb25tZW50LCBjaGVjayB5
b3VyIA0KY29uZmlndXJhdGlvbi4gS2VlcCBhbiBleWUgb3V0IGZvciBuZXcgU2FtYmEgcGFj
a2FnZSB1cGRhdGVzIGVhcmx5IG5leHQgDQp3ZWVrIChzdGFydGluZyA3IEp1bHkpLg0KDQoN
ClJlZmVyZW5jZXMNCg0KaHR0cHM6Ly9idWd6aWxsYS5zYW1iYS5vcmcvc2hvd19idWcuY2dp
P2lkPTE1ODc2DQoNCg0KT24gYmVoYWxmIG9mIHRoZSBTYW1iYSB0ZWFtDQotc2xvdw0K

--------------YG0S5chCRrWbgb5V5xSNYP6B--

--------------hfAM0ib8BWRVnzk10ZixhykE
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEE+uLGCIokJSBRxVnkqh6bcSY5nkYFAmhqYJEFAwAAAAAACgkQqh6bcSY5nkYg
7BAArVRXfEkldJ6ZfxGWxYsJ8aOxOUk7bqFizFJMQWFZXgT++ic6o1+tmcJAzS+XfG9bZkduTXJG
jTUlBuw/+F5OoZoBRqQKPq9hNbl2pZIxTKBXKLWDpNwzEKyu+tCUvbVEF/ETflRBlA1kEg2TjQ7Q
4iXC2+tny2DN6qKgCAIAS49HHPO4Xvs3HqfWOLVykUR1PlRkNP1OyJFthHNFbhalnE5uwTv1nHdN
vfRZMx7XNL13P0dF3Vgcv+THkLtyYKKX1Dq7AP5Z6i/rJcLMCuv0SskHi7eNicF0zvz7/lALiADI
OkjjOn7UDMwj4YbYgPZ25D7PeC/FZz/QetiXu1J6+/dDJtsVh9MvjVv9ysA70enSWhcpin40Ot0M
gbi8QZpykARxURrnYEuPeFddMlKqFJPQBs8cXe3NwHtDFt16HO4Rpc5Mz+eT5i1JfDS4x0OWO3dw
m92zm1pPiT7Y8sEDixZYq8/ShnQOt8sEsATMpcN9GLqVQO3axTwwIABBZvr2DWSF2n1p4Hsw7sLb
oJ66957hDCKCmcxnjnqGfZiuGbnirxoti7PhsuJxRyPYcRHk1zM7a32ZBS1+96gTiCJbmakdc+hi
08O2gYt+aXRz55orJymnTzhUtNfJqSWaR80+yumZKkS4nJRke0G2Z2PHLoKSh4mSdbjyhcGlXDGs
c8M=
=ryWo
-----END PGP SIGNATURE-----

--------------hfAM0ib8BWRVnzk10ZixhykE--

