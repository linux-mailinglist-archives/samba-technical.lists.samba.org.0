Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EDAB6CA98C
	for <lists+samba-technical@lfdr.de>; Mon, 27 Mar 2023 17:49:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=wQukw33VSuKX2TfpV8qtAVkB6oLpDqI9h4PnwirPHTU=; b=HIE6yiFyfIs7prAFVHL923u0MR
	j0asLx3gL61CaJursJqt1z1raw+KUxG+3qIPLsDRkhqTgeLUAndTp96EPOpTF9VGhsR2dCzE9vxiQ
	ZUAhNJfHMmRE2LL/CLAQgYc4XHGSW/SX6MLCUow6ZCFUFkkJ6KOgeLpjghxXi4doATJHzZgjmVc7r
	Ch6WoPjRWGclLZkNpySzjQgcTMBKsvvZuBXj08Rke/pL2CyOVi8bV88IQfWJ00QAOx47quoJ+tHeE
	M/Mm/Gq94VVsMmWBTuZQ2tH/3r/IXnj+FpE03pzbcdhUGD5HHqwwBbDZgaLj5NeYRc+fPcwyKvsEn
	DWrX9DQA==;
Received: from ip6-localhost ([::1]:27242 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pgp5y-004k63-Pt; Mon, 27 Mar 2023 15:49:18 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:12212) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1pgp5t-004k5i-U8
 for samba-technical@lists.samba.org; Mon, 27 Mar 2023 15:49:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=wQukw33VSuKX2TfpV8qtAVkB6oLpDqI9h4PnwirPHTU=; b=UdgfCkvWI+Hp+TemJZ7qhB9772
 NarANTbtHKfMkbub8guCFlpYyGjL2yrNGPu3Uh1VaBcCYPTXIS+/RZdcFSwYOoMmM2qaWYiquMHEk
 JhGEpxCfn0dDVZu+BziXIaLjGCLD/HUE/idR83WhPmqqK/rIB7g2NzPhy+OunUJ5+eDxgKIQgg2eB
 PxW7DfvgmxujEoHDAkkdlESqQtbfhlC3x3cFQNnrTXc2C+yTD+tOCFBmDdvJUTfjnwlPOVVAraxRd
 YZ7wk0eZFE8YoiG64sDDRDFQZKh4C+UFTqVooR8TQh2Gfb/YZT1RNuFuhCO0mpfYIR8cfVHTe1Cch
 VIDJ1X/rJZ9IhBHEmWOcdwwwGWXCFC/8KEvFqsDgvRDXrxozlZeB14Jn1BkwGUFM73bklelRxc3g3
 1eVwWfCtKIqgn2nfF5/xrBKj0MX19mvfy76BC+AzryETzHeogybJYiOOhcQD/BrdJIUO4K7u5Cn0j
 kniovUYF9mIhQXIpnMkdVS/q;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1pgp5t-005fz9-KZ; Mon, 27 Mar 2023 15:49:13 +0000
Message-ID: <7e5451f5-e5c2-2566-f7f6-5e4bf2993cae@samba.org>
Date: Mon, 27 Mar 2023 17:49:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: Joining a Windows DC to a Samba AD Domain
Content-Language: en-US
To: miguel medalha <medalist@sapo.pt>, samba-technical@lists.samba.org
References: <83053097-3abf-8fae-58e3-25c233049053@samba.org>
 <!&!AAAAAAAAAAAuAAAAAAAAABM14PwpMuJDgheI8SVrAIkBAMO2jhD3dRHOtM0AqgC7tuYAAAAAAA4AABAAAABR1/ccgIQiT6ZT6R4bY/faAQAAAAA=@sapo.pt>
In-Reply-To: <!&!AAAAAAAAAAAuAAAAAAAAABM14PwpMuJDgheI8SVrAIkBAMO2jhD3dRHOtM0AqgC7tuYAAAAAAA4AABAAAABR1/ccgIQiT6ZT6R4bY/faAQAAAAA=@sapo.pt>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------Qd4qoDNfODWGdt0l4F0sfAPy"
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
--------------Qd4qoDNfODWGdt0l4F0sfAPy
Content-Type: multipart/mixed; boundary="------------WHg0ZzJlLpDorEJz0i9O4Z1K";
 protected-headers="v1"
From: Ralph Boehme <slow@samba.org>
To: miguel medalha <medalist@sapo.pt>, samba-technical@lists.samba.org
Message-ID: <7e5451f5-e5c2-2566-f7f6-5e4bf2993cae@samba.org>
Subject: Re: Joining a Windows DC to a Samba AD Domain
References: <83053097-3abf-8fae-58e3-25c233049053@samba.org>
 <!&!AAAAAAAAAAAuAAAAAAAAABM14PwpMuJDgheI8SVrAIkBAMO2jhD3dRHOtM0AqgC7tuYAAAAAAA4AABAAAABR1/ccgIQiT6ZT6R4bY/faAQAAAAA=@sapo.pt>
In-Reply-To: <!&!AAAAAAAAAAAuAAAAAAAAABM14PwpMuJDgheI8SVrAIkBAMO2jhD3dRHOtM0AqgC7tuYAAAAAAA4AABAAAABR1/ccgIQiT6ZT6R4bY/faAQAAAAA=@sapo.pt>

--------------WHg0ZzJlLpDorEJz0i9O4Z1K
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMy8yNy8yMyAxNzoyMywgbWlndWVsIG1lZGFsaGEgd3JvdGU6DQo+IFRoZSBwaHJhc2lu
ZyBvZiB0aGUgd2FybmluZ3Mgc2VlbXMgbWlzbGVhZGluZyB0byBtZS4gQXJlIHdlIHRhbGtp
bmcNCj4gPSBhYm91dCBqb2luaW5nIGEgV2luZG93cyBTZXJ2ZXIgdG8gYSBTYW1iYSBBRCBk
b21haW4gb3IgYWJvdXQNCj4gam9pbmluZyBhID0gV2luZG93cyBBRCBEQyB0byBhIFNhbWJh
IEFEIGRvbWFpbj8gVGhpcyBpcyB3aGF0IHRoZQ0KPiB3YXJuaW5nIHNheXM6DQo+IA0KPiAi
Sm9pbmluZyBhIFdpbmRvd3MgU2VydmVyIHRvIGEgU2FtYmEgQUQgZG9tYWluIGlzIGdlbmVy
YWxseSBub3QNCj4gcmVjb21tZW5kZWQuIg0KPiANCj4gSSBndWVzcyBpdCBzaG91bGQgYmU6
DQo+IA0KPiAiSm9pbmluZyBhIFdpbmRvd3MgQUQgREMgdG8gYSBTYW1iYSBBRCBkb21haW4g
aXMgZ2VuZXJhbGx5IG5vdA0KPiByZWNvbW1lbmRlZCINCg0KZXhhY3RseSEgVGhhbmtzIGZv
ciBwb2ludGluZyB0aGlzIG91dC4gSSd2ZSB1cGRhdGVkIHRoZSB3aWtpIHdoaWxlIA0KZGlz
Y3Vzc2lvbiBoZXJlIGlzIG9uZ29pbmcgd2hldGhlciB0aGUgd2FybmluZyBpcyBhZGVxdWF0
ZSBpbiB0aGUgZmlyc3QgDQpwbGFjZS4gOikNCg0KVGhhbmtzIQ0KLXNsb3cNCg0KLS0gDQpS
YWxwaCBCb2VobWUsIFNhbWJhIFRlYW0gICAgICAgICAgICAgICAgIGh0dHBzOi8vc2FtYmEu
b3JnLw0KU2VyTmV0IFNhbWJhIFRlYW0gTGVhZCAgICAgIGh0dHBzOi8vc2VybmV0LmRlL2Vu
L3RlYW0tc2FtYmENClNBTUJBKywgU2FtYmEgcGFja2FnZXMgICAgICAgICAgICAgICAgICBo
dHRwczovL3NhbWJhLnBsdXMvDQoNCg==

--------------WHg0ZzJlLpDorEJz0i9O4Z1K--

--------------Qd4qoDNfODWGdt0l4F0sfAPy
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEE+uLGCIokJSBRxVnkqh6bcSY5nkYFAmQhuvkFAwAAAAAACgkQqh6bcSY5nkbT
+w/+NUKyR3zr9hnZjXTw+It1V1IPsgPMwxsRmjmVobsikI6Qs+GkM9vu+fJxnZOl/0K6E17sL1UJ
s357Gl4rSUVamTdZeXGV8oUy3K7nLvy/tXLtom9VyYQ5ujsBslIO9I4bZqgvHo7a4Xmf0K78QqVj
YuNwZxneDcbrlwsvV+e8ses+KSjen0v9rG74WrWSQfexwOxjegf2dlDfzZMLSnBzghJrERJLMvBa
9eR4G09ZryncWgxkom1ssBPqdw7w0g27H4gx6ixSS8Pg3v7EgdV6c0/naE465ROL6uWvaNx5YF65
qMtVnvXcTDZJMnDpUzr8K10cEesK2y3VJbdw6nCqGQWo/Ag4DJX6rraqXz8F8v2Ufw01MGvbuR9R
Xd28KcK7Rmi8vYY5XW0Ft6ouMzSUNf5DbL9+lsqVe+21c67f6Yb3sJsnrDT42hgQ2qRfu79LU724
8nwCVLFgLutPO/cL7VtgKx8gtAYEY+vn3cxEPPHC06bz+BU0QsTROlWPiltVcuAmF7Fb0AvbFCIY
weFHK/oobKH0m9tynsdcaWc0JlvhSDIdJ1ywHTSsdJgrmW4Up0qSQkGHqjRb2WDpWXsaNOWqOhwD
MEtBkqSxMPgeMesdFe3J87y8r/esV1siebRxAvV0PcDsk6FY24LGJHZV8hbn51WAn1BSY/qpW6n1
fUQ=
=8u5h
-----END PGP SIGNATURE-----

--------------Qd4qoDNfODWGdt0l4F0sfAPy--

