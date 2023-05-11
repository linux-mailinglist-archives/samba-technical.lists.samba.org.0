Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C3436FEFB3
	for <lists+samba-technical@lfdr.de>; Thu, 11 May 2023 12:12:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=+gnG4mDVqLfbMWaqlemeLD9Xm1syL500RKBNHaGKQUk=; b=MuluGv0FckUTg9WGotk5a6cB5D
	MeDvKJE4gyChsOMLN34NiJOyXhmFSIYrI5eiokMcpuqaMlKyY8d6KrbON5bx+cJSXzEhN560SSJQW
	atxnWS3X147A/5YWw+Xv74FmCmVbSEjI4w16zN5IXLNZ3s+yxwPQfFQvrmdIceBiS8BV3Nmz+oyLd
	X2/Vb4cUQXKJ6vL+y5E91/bAVTKnJCe5txb4VWQ2UuOPY51FvoHjdS+swpnu6dXfQQiMordjDG65m
	4evbbEjJOVBHhRG8xu9Y9ukhZt4guP8W7X7uMNZ8DcbzzkIhF5QB10E8JpytDIFCX1lzeYxuSlYtq
	NyZ0TK6Q==;
Received: from ip6-localhost ([::1]:27142 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1px3Gr-009bqM-27; Thu, 11 May 2023 10:11:37 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:14708) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1px3Gl-009bqD-U0
 for samba-technical@lists.samba.org; Thu, 11 May 2023 10:11:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=+gnG4mDVqLfbMWaqlemeLD9Xm1syL500RKBNHaGKQUk=; b=K5mkGvaVHRH1fRN3w8b3e4Os3L
 tTFw0jwjz/aKpiF00SkQ9e371grw0fIIKQLADgMlJLlGfzsMSU8f6H/7nXyOUXBNkM4Jz9GtM10Ja
 l2PcPSExtHf5jEglTQLGQO/Y6erpyfTh2kGKGBsv0HPyjO52Ewlc0LmDGk7HUZeVPhwWZqb8OMBla
 xvQQG/HMIVQtygXv/H7SO6T8zNB/2p3/VOg/1n7HkNYxl0jSzfMEIbuHqslKy4FFVRVxnEMednnZs
 15DDVWN5kBeqJMIygydrMyQWzwDb10RGIYv/vnvTuu9WvmJVD3q//VvDbPDAuRfGEsF2+I4nuwTcy
 2zjuCA6nbJo2CZcqWbdDHuucXfsomzIVlky1rhulU9ffqWM0U3+sdJGGvHkt1TQQkO+EGcNH4l8Om
 Ufn3h8dfzEVvLRzP4fyG7fIpcRFsM/j6L+5GRTw7nvYQ9df7y8Xf8DIgn51gu0Se6DXMMrplHUT3I
 7xWnB7pQm2E/U5YxgxFlnP12;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1px3Gl-007TTv-BM; Thu, 11 May 2023 10:11:31 +0000
Message-ID: <38ac64f9-83ce-653a-2056-73c9ef44b34d@samba.org>
Date: Thu, 11 May 2023 12:11:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-US, de-DE
To: Ralph Boehme via samba-technical <samba-technical@lists.samba.org>
Subject: Survey: SMB3 IO Lab in Redmond week after SDC in September
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------wJg00vNhTY0p4lolKxhr04DK"
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
--------------wJg00vNhTY0p4lolKxhr04DK
Content-Type: multipart/mixed; boundary="------------idFBD3dcuOrFeACah98IfRId";
 protected-headers="v1"
From: Ralph Boehme <slow@samba.org>
To: Ralph Boehme via samba-technical <samba-technical@lists.samba.org>
Message-ID: <38ac64f9-83ce-653a-2056-73c9ef44b34d@samba.org>
Subject: Survey: SMB3 IO Lab in Redmond week after SDC in September

--------------idFBD3dcuOrFeACah98IfRId
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgZm9sa3MhDQoNCk1pY3Jvc29mdCBpcyBjb25zaWRlcmluZyB0byBydW4gYW4gU01CMyBJ
TyBMYWIgaW4gUmVkbW9uZCB0aGUgd2VlayBhZnRlciANClNEQyBpbiBTZXB0ZW1iZXIgYW5k
IGlzIGFza2luZyB3aG8gd291bGQgYmUgaW50ZXJlc3RlZCBpbiBwYXJ0aWNpcGF0aW5nPw0K
DQpUaGlzIGhhcyBiZWVuIGEgZ3JlYXQgZXZlbnQgaW4gdGhlIHBhc3QgYW5kIHRoZSBleGFj
dCBkYXRlcyB3b3VsZCBiZQ0KDQpTZXB0ZW1iZXIgMjYgLSAyOCwgMjAyMw0KDQpodHRwczov
L3d3dy5pbnRlcm9wZXZlbnRzLmNvbS9lbi11cy9zbWIzaW9sYWIyMDIzDQoNClBsZWFzZSBy
ZXNwb25kIHB1YmxpY2x5IG9yIHRvIG1lIHByaXZhdGVseSBpZiB5b3Ugd291bGQgbGlrZSB0
byBhdHRlbmQuDQoNClRoYW5rcyENCi1zbG93DQoNCi0tIA0KUmFscGggQm9laG1lLCBTYW1i
YSBUZWFtICAgICAgICAgICAgICAgICBodHRwczovL3NhbWJhLm9yZy8NClNlck5ldCBTYW1i
YSBUZWFtIExlYWQgICAgICBodHRwczovL3Nlcm5ldC5kZS9lbi90ZWFtLXNhbWJhDQo=

--------------idFBD3dcuOrFeACah98IfRId--

--------------wJg00vNhTY0p4lolKxhr04DK
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEE+uLGCIokJSBRxVnkqh6bcSY5nkYFAmRcv1MFAwAAAAAACgkQqh6bcSY5nkY3
7A/+PKpfxiik9xhWunTdk8RhJg+z5KAVXrft4giFPx0sdo+dIoHSGAFdT//RA22Xl9amqjkeD+Ij
91Vc3znf5Cd7Do4CBp43ZWTp6FSzDqd0Q9tQhZLZXIWFZnUhW3h0aqqGoUbGqZgHCqWY+Sdgpg7j
zGrb0tDAXiNmXi1C1WADWwP6w+Ig1fbNQpQKI12xW3sShuRh33+lNK3t9DwIr2W3+5NL8ILLu3Qy
ZY6WmOej/SIIYbFT2YXsEkWGvg/Q1+40rmWmvVwlIXZJtSiLS/YA6U0eqEFzFixZVouxF/+Pkgy8
Cxqo4Ve/6sIPdewqTpkmjjBv/p0VNoiWPijncAHwpiHehegWQED6V3Pq1c+bR2iO/n4mp+8YnZ8+
X2MtgCxCFurAaZMOkRtliPuXcc5U+bD0FOepAgVihvT8fPfBayW2CMvJYnqXryokNAYlLg8mBXUH
NyREaId8STIXCDisxPNoPK71EPb6nTsC7GhABMlFqs13r6qfBhIPqirPzZmzLbjjAGlIkxcf5af8
jGu6oHxGbxJf3OPLGFS7Syz4NdzVSh/KBCsWTg3vIM0Hu1MPRP7rQrnmCXJKPrCEclwyS2w2RVmm
rET3BPIfYeeo02B9T3GAJF3RvlcyvBnaQUBMdXO70H8dgltckcmzvHgEpV8Jn5XqdpPBjvi6ScbO
+Bc=
=EQ5Y
-----END PGP SIGNATURE-----

--------------wJg00vNhTY0p4lolKxhr04DK--

