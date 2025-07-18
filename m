Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B1ACB0A469
	for <lists+samba-technical@lfdr.de>; Fri, 18 Jul 2025 14:46:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=T/xSb4xp+kaNDbEQAkkF/2m4O7UGzkU9ZfHf19ZLv1Y=; b=OiOkE3dKhpsJmW32U9l30TYvnD
	8R2UL/grXEZENgYpu2hAqmCBFmKC9UvWxYNEasJVTmJqJNjqo4Y3f2qIFyIyofkLbxjYRukD1KFVC
	4yYkDnr50j9hS4W82NgWQXgSX/Y++RKaeRLYFUzXC1A5JSkJR+nO2xUH2B0GR9B/mhX4E1ZCinCx7
	GF313TCtxhRnjz63M1k95LJSlHjAkeUVgpVoBdGQO5uZm1HQIPes/zpfNtKE2UzxFUs39G6nhek7W
	I41pCtrXpQxI59mZ94nFSF3ME3SIlW59w3sp4UaLx6PDl4o3kcOjfUsFt3enRsZ6+Jo4sShwcTH9H
	hDgjSJNQ==;
Received: from ip6-localhost ([::1]:49094 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uckTP-00BSGB-MS; Fri, 18 Jul 2025 12:45:59 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:59360) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uckTK-00BSG2-K4
 for samba-technical@lists.samba.org; Fri, 18 Jul 2025 12:45:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=T/xSb4xp+kaNDbEQAkkF/2m4O7UGzkU9ZfHf19ZLv1Y=; b=Mz3xzolYrt3L2IYdsSiMH02/Ng
 EvGuoDhR7Lpw9MEd0nCH2i2PWd5h0+YfV7GYA5OAuJ4rrw4Uoa7hByk6wuHixzfMjpOrCowzkyN/5
 0qvfRaDIuPk/YHNza9+Gwz7WXhGLQqVWF73aYNRpYpK0uuM2fOAx+NTihHinnNHYA/w3DhhtQArYH
 iDI2BY5TeeGmuAtOxIfR64nsq5MUM9LdXDzDoqhNNbkDl2fiM+T98qZ+/fnRMSJKiKawQYvo4bxer
 OUtjy+etnXn+iDg6bE8jLEsQBnveJwoBlvWq01mtMvJDqX1LXPpbOkQ03hyZ54pQreBOe1DKUwPo/
 ky4c6QFiEy6pmQ35u5ig25meL/20niEct+IA/14gOywpJjCi9/EdmQ7uDMMqmJP2BTc3A801orcAp
 LCDUmRyeb3SndSMLOdy8SiKw8ooirLQrBExAaLpVwIbu5PvwWruM6CBRNbubmm8g5p/l0zes2gfhE
 ZNB5phaZgKWeeEuBm18dMg2P;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uckTJ-00Fubr-30; Fri, 18 Jul 2025 12:45:54 +0000
Message-ID: <19974c0b-cdb2-4325-a7ce-7fce9a283605@samba.org>
Date: Fri, 18 Jul 2025 14:45:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: growth of smbXsrv_session_global.tdb
To: Michael Tokarev <mjt@tls.msk.ru>, samba-technical@lists.samba.org
References: <57f12264-b359-4057-b5f9-41464debeb8d@tls.msk.ru>
Content-Language: en-US, de-DE
In-Reply-To: <57f12264-b359-4057-b5f9-41464debeb8d@tls.msk.ru>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------pQLRE06uTce9ezNmf0BYUjkO"
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
--------------pQLRE06uTce9ezNmf0BYUjkO
Content-Type: multipart/mixed; boundary="------------NK16d2DXJsMkVY3b0Ox3QifJ";
 protected-headers="v1"
From: Ralph Boehme <slow@samba.org>
To: Michael Tokarev <mjt@tls.msk.ru>, samba-technical@lists.samba.org
Message-ID: <19974c0b-cdb2-4325-a7ce-7fce9a283605@samba.org>
Subject: Re: growth of smbXsrv_session_global.tdb
References: <57f12264-b359-4057-b5f9-41464debeb8d@tls.msk.ru>
In-Reply-To: <57f12264-b359-4057-b5f9-41464debeb8d@tls.msk.ru>

--------------NK16d2DXJsMkVY3b0Ox3QifJ
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gNy8xOC8yNSAxOjQzIFBNLCBNaWNoYWVsIFRva2FyZXYgdmlhIHNhbWJhLXRlY2huaWNh
bCB3cm90ZToNCj4gSG93IG9uZSBjYW4gcmVtZWR5IHRoZSB1bmRlcmx5aW5nIHByb2JsZW0/
DQoNCmRlYnVnIHRoZSBvcGVuIHJlY29yZHMgbGVhay4NCg0KWW91IG1pZ2h0IGJlIGFibGUg
dG8gdXNlDQoNCm5ldCBzZXJ2ZXJpZCB3aXBlZGJzDQoNCmFzIGEgd29ya2Fyb3VuZC4NCg0K
LXNsb3cNCg0KLS0gDQpTZXJOZXQgU2FtYmEgVGVhbSBMZWFkIGh0dHBzOi8vc2VybmV0LmNv
bS8NClNhbWJhIFRlYW0gTWVtYmVyICAgICAgaHR0cHM6Ly9zYW1iYS5vcmcvDQpTYW1iYSBT
dXBwb3J0IGFuZCBEZXYgIGh0dHBzOi8vc2FtYmEucGx1cy9zZXJ2aWNlcy8NClNBTUJBKyBw
YWNrYWdlcyAgICAgICAgaHR0cHM6Ly9zYW1iYS5wbHVzL3Byb2R1Y3RzL3NhbWJhDQo=

--------------NK16d2DXJsMkVY3b0Ox3QifJ--

--------------pQLRE06uTce9ezNmf0BYUjkO
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEE+uLGCIokJSBRxVnkqh6bcSY5nkYFAmh6QgAFAwAAAAAACgkQqh6bcSY5nkaa
rw//X1yix4r7Jd2cLSGtT+OvUqPKX7N68c4hIWY1cDveiJTRih3uTfp4MBzzdSWx6LybzLGaa3gD
ZD8Duox/BRdTwfxIPE/gpNxA6zXk03NDCk6hl7AeqU6t2AqtdzqkUp/bQOrnEfCkId7CCcXERlv7
nUdBL/zvzK+Hu+xZIxXGlfHp9NGL/yf5EE7CBV/Hb0zRu0RS8ZGnyN4wwjFYVZCM5VxioWpnlv6R
pWi28rz/Ge+w3tYLEI4QQfwcaOFBLFGnhu1xdEQzDGlotymg1M3YWaqgUv0B5ZapnhVEPPlaqd3Y
LCgbytcjDeslxAPvf3760TfajN0LLdCsNDixUJQVNuc/7m5mSsA4QLRf0wMoZqqmlwY7Kiv1BWIA
vaPbdCzeFoMx6XzEVIxKpTXzwrWHED0YpBrgWs0vC9y+uigmcOZ3XzLJYljTfp1j4CWsy/+ZCL+D
1WKVvKWswjZs6XfLbEfk3dESrY44LYGIwRLDF1Srh2avRPqRmSwXmeaBnmN5AIJGzoZBVevQXJJL
u8Lqwd6Cvcz2lWPJPdCa07NTHJi8GAk9LL8H7JtZLEszIYFBC0zMzi4EDOZ3qUS0KWwjUDuWI7gl
dvRrFweqQOyS5d/qtPet0lSPY/Nl1eAYGw1yDQQeFj9qaW4vPVo9v5anRX14F6W+soJQB3puS0BK
G+s=
=jSSm
-----END PGP SIGNATURE-----

--------------pQLRE06uTce9ezNmf0BYUjkO--

