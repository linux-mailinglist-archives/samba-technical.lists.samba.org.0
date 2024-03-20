Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id C1AE6881690
	for <lists+samba-technical@lfdr.de>; Wed, 20 Mar 2024 18:27:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=GgRjVapIUQW4U/PGEnZk6hw51ddX628IIScvknwNVvY=; b=meLnut+2VYnduKSDYA5crPp+4B
	7TV+TIi0CTK3eI3zs55gQ8Xbt+0i0DQ3Up7o76yeT0XS4Ckdbl5xrCVNxH7LXeBEUfuxsCD0m4NS+
	cu4yy7HDepxSPWLNUEUtZIYOpA5gpS/FSmgP5oTEj0nVdLZxwHMTOE8XxloaKz7kgpHzqYld3qGRV
	xSEgopqXfzFAmHFCCNsaLaRYoL8WIFO//QDFR92KdQM1FjsxlhCZE5410TmhRPVVfjBVui3ubLRc5
	wQHLl4Q4x1afYRjoA8MIdoZiDm8bVbQHoxvnvy5Qsz+6toN3+LpjgN2WhKAWIpi2oyAbOnppNFg3r
	zYYQ3OUA==;
Received: from ip6-localhost ([::1]:29158 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1rmzi3-000nUf-2G; Wed, 20 Mar 2024 17:26:40 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:23728) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rmzhw-000nUG-Qh; Wed, 20 Mar 2024 17:26:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=To:From:Date:Message-ID:CC;
 bh=GgRjVapIUQW4U/PGEnZk6hw51ddX628IIScvknwNVvY=; b=lDj2D8zNTw6vUep6BDsZgB7Mz/
 zjlJtf2BNfpFvz3BIZUxGO2XlnGJfHvD/qZLjWzCWRNhU2Q/YjD/sa9FpkTIpkeWEJzA3Nl/KPHy1
 WRGVCPmWe9ew56NOt6c9rb/yJSDkgCJaMvmsK70KFAIRXBnbd2S0lvcb+gCBUU8HyftzHY8jyjd7V
 Qr0Gjtof7VMZGl7o5UwpolDoI4pdvgWAf8sOl08hyFN8tv2yQBUpZKC4cwSmg2VVPabYFFkvJciJf
 l/xwD4+EfoYxNmER2V+Lvha6OVsiqBN+a5e7A/S6LaxyD19xTt/N4NJMZbV3D3gk9UAAFE0QepNLw
 2a/2t58s0uHHhCSF4trD38fDyyrN8AJE1PZ7KqXuXEWqaTEcLGa+cxmHfK9+bRfixbx8OV6ebIsPp
 Z9qwrEDwkq1UMWE9pEmB9Yx+VkDk4LYI0RrGzxOGKOuRVN2/TfJTcd+Bcu40e9i2Yivizz7fXLZbL
 Ko3thr64oPqbj0UjsztNOw4f;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rmzhx-0021b8-0a; Wed, 20 Mar 2024 17:26:33 +0000
Message-ID: <1926bc0b-b964-456d-802a-df0ce33fec8f@samba.org>
Date: Wed, 20 Mar 2024 18:26:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US, de-DE
Subject: Reminder: SambaXP 2024: digital & free - 17th and 18th of April
To: sambalist <samba@lists.samba.org>, samba-technical@lists.samba.org
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------BO2tmCPLLrIcRhyi00UAMrzD"
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
--------------BO2tmCPLLrIcRhyi00UAMrzD
Content-Type: multipart/mixed; boundary="------------nSQ6FrmkDJY8XEU9fu8Uwyu3";
 protected-headers="v1"
From: Ralph Boehme <slow@samba.org>
To: sambalist <samba@lists.samba.org>, samba-technical@lists.samba.org
Message-ID: <1926bc0b-b964-456d-802a-df0ce33fec8f@samba.org>
Subject: Reminder: SambaXP 2024: digital & free - 17th and 18th of April

--------------nSQ6FrmkDJY8XEU9fu8Uwyu3
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

U2FtYmFpc3RhcyENCg0KV2UgYXJlIGRlbGlnaHRlZCB0byBpbnZpdGUgeW91IHRvIHRoaXMg
eWVhcnMgc2FtYmFYUCEgVGhlIDIzcmQgc2FtYmFYUA0Kd2lsbCB0YWtlIHBsYWNlIG9uIEFw
cmlsIDE3IGFuZCAxOCwgMjAyNC4gVGhpcyB5ZWFyLCB0aGUgY29uZmVyZW5jZSB3aWxsDQpi
ZSBoZWxkIHJlbW90ZWx5IHZpYSBab29tLiBKdXN0IGxpa2UgbGFzdCB5ZWFyLCBhIHdpZGUg
cmFuZ2Ugb2YNCnByZXNlbnRhdGlvbnMgb24gdGhlIGxhdGVzdCBkZXZlbG9wbWVudHMgaW4g
U2FtYmEgYXdhaXRzIHlvdS4NCg0KQWdlbmRhDQotLS0tLS0NCg0KVGhlIEFnZW5kYSBoYXMg
YmVlbiBwdWJsaXNoZWQuIEhlcmUgYXJlIGEgZmV3IGdlbXMgZnJvbSB0aGUgbGlzdDoNCg0K
KiBrc21iZCBzdGF0dXMgdXBkYXRlIC0gTmFtamFlIEplb24gKExHRSAvIFNhbWJhIFRlYW0p
DQoNCiogSW1wcm92aW5nIHRoZSBuZXR3b3JrIHN0YWNrOiBwcm9ncmVzcyBvbiBRVUlDIGFu
ZCBTTUIzLjEuMSBmb3IgTGludXggLQ0KICAgU3RldmVuIEZyZW5jaCAoTWljcm9zb2Z0IC8g
U2FtYmEgVGVhbSkNCg0KKiBQT1NJWCBpZGVudGl0aWVzIG91dCBvZiBPQXV0aDIgaWRlbnRp
dHkgcHJvdmlkZXJzOiBob3cgdG8gcmVkZXNpZ24NCiAgIFNTU0QgYW5kIFNhbWJhPyAtIEFs
ZXhhbmRlciBCb2tvdm95ICYgQW5kcmVhcyBTY2huZWlkZXIgKFJlZCBIYXQgLw0KICAgU2Ft
YmEgVGVhbSkNCg0KKiBTTUIgYW5kIE5GUyBjb21wYXJlZCAtIFZvbGtlciBMZW5kZWNrZSAo
U2VyTmV0IC8gU2FtYmEgVGVhbSkNCg0KKiBGaWxlIFNoYXJpbmcgVGVzdCBTdWl0ZXMgVXBk
YXRlcyBhbmQgT3ZlcnZpZXcgb2YgU01CMiBEaXNzZWN0b3JzIG9uDQogICBXaXJlc2hhcmsg
LSBPYmFybyBPZ2JvICYgQWRlZGVqaSBBZGVsb3llIChNaWNyb3NvZnQpDQoNCiogQnJpZGdp
bmcgV29ybGRzOiBMaW51eCBhbmQgQXp1cmUgQUQgLSBEYXZpZCBNdWxkZXIgKFNVU0UpDQoN
CiogRXhjaGFuZ2UgUHJvdG9jb2wgMjAyNCB1cGRhdGUgLSBBbmRyZXcgRGF2aWRvZmYgKE1p
Y3Jvc29mdCkNCg0KRm9yIG1vcmUgdGFsa3MgYW5kIGRldGFpbHMgcGxlYXNlIHZpc2l0IGh0
dHBzOi8vc2FtYmF4cC5vcmcuDQoNClRpY2tldHMNCi0tLS0tLS0NCg0KUGFydGljaXBhdGlv
biBpbiB0aGUgY29uZmVyZW5jZSBpcyBmcmVlIG9mIGNoYXJnZS4gQWxsIHlvdSBoYXZlIHRv
IGRvIGlzDQp0byByZWdpc3RlciBvbiBodHRwczovL3NhbWJheHAub3JnLg0KDQpXZWJpbmFy
cyBvbiBBcHJpbCAxNiwgMjAyNA0KLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCg0KT24g
dGhlIGRheSBiZWZvcmUgdGhlIGNvbmZlcmVuY2UgdGhyZWUgd2ViaW5hcnMgd2lsbCBiZSBv
ZmZlcmVkIG9uIHRoZQ0KdG9waWNzIG9mIENUREIgY2x1c3RlcnMsIFNBTUJBIG9uIEFJWCBh
bmQgU2FtYmEgYXMgYW4gQWN0aXZlIERpcmVjdG9yeQ0KZG9tYWluLiBQYXJ0aWNpcGF0aW5n
IGluIHRoZXNlIGlzIGFsc28gZnJlZSBvZiBjaGFyZ2UuIFJlZ2lzdHJhdGlvbiBhbmQNCm1v
cmUgZGV0YWlscyBjYW4gYmUgZm91bmQgb24gaHR0cHM6Ly9zYW1iYXhwLm9yZy4NCg0KV2Ug
bG9vayBmb3J3YXJkIHRvIHdlbGNvbWluZyB5b3UgYXQgc2FtYmFYUCAyMDI0IQ0K

--------------nSQ6FrmkDJY8XEU9fu8Uwyu3--

--------------BO2tmCPLLrIcRhyi00UAMrzD
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEE+uLGCIokJSBRxVnkqh6bcSY5nkYFAmX7HEgFAwAAAAAACgkQqh6bcSY5nkaR
KBAAu4+3qehSaJ3V1mxlHJ14qtQ5l+DsQG82jYxYoUnBdOFCRIhh1Whbn0/ZnufqxIhKVK8BTJlT
R3QMcgVSyPSARf+/AqiVrhlWHzVxWQIhfj63A9FFXfyC05MqwDogWj6gS0cpHCmstKKAnZpfcb6N
hgxkub2D9TIgkhrpss1lGSwiFCTwXKfiK2JkbsMqROugrQ6YDgBcDe98KMOUNSMx9YfWsf2+ERbE
QVz7hlRendRUw5GcDxdPZpoMu9/z81tqIoSfJbFugPCj/rx2ndfGk6yoed3Lq2K9vGmi29SidbTD
vJtuOzSujBh6dfJaCjk7Riz0ryiFFMP5YsWaYc+79UbsIPCQoXCohZKlSO7U6yLX6iBwhyR2BbP6
sMPsNRN4MqOlWsB4TJx+u3Qlkx2GPJ1bPvQWc9IZZicL34x1FZhYafcbmpam8rOUy4ElsLsNd7Y3
lAf1e1YPDGs2jzEtrJRPb19hbjPnFSLJ4PCe1TiwYxrMNccQ/0bCK7pDGuFN0cuCqEAwwC4UvJFf
0TSQmqOSiTA1QCV7F9JOZNYzF+WJndN7c6N4cuH+DgzlvT+N0o0k96Gw4oDSQnN4zIenF/Wz+l0B
wR/23tZiEP8UQsO5YqyFPu6GyHgLM7rQCY3Og7pTkVe9KBF80r7PFnm+pvAPraaE5rV/cJQRMJLA
dXQ=
=ASC1
-----END PGP SIGNATURE-----

--------------BO2tmCPLLrIcRhyi00UAMrzD--

