Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C0527E9B35
	for <lists+samba-technical@lfdr.de>; Mon, 13 Nov 2023 12:29:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=ICOHkYsORbRHy2tYs6oX9TisizLORDcPttC5rZsdARM=; b=eWn/TfiYenDeAfX+SWyiGDiztf
	7xG5qQUSybijhzbLMtJ7xpIhXIH9jPemr54cCj+ooZ7ytQr/lIfAyHq9Q1l9ZS+sejBzZrPB8qYPv
	BnhlewZTTicRgIzo29sVt0qa74fmNClpypeTPFIzjOTS9sPGf6K1GebcQ/MWKuaG4CT5Bzs7548oh
	H6QHLdYfuX5crnmAt07X1MPd1006GBJU8diQCLsXxzj9G3/szhr3BRO3IrTw1AKJFLNXFey0GXe7Q
	uGF9G/yaII8nGkxGgwYX5GUWLFB1pVU8BDwp793dbb336Bn3/B8XVwdXNE0T313o1k0aU35Y08HTF
	a099jdgw==;
Received: from ip6-localhost ([::1]:33186 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1r2V7C-007sxv-Tl; Mon, 13 Nov 2023 11:28:26 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:42248) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1r2V78-007sxm-GU
 for samba-technical@lists.samba.org; Mon, 13 Nov 2023 11:28:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:Cc:To:Date:Message-ID;
 bh=ICOHkYsORbRHy2tYs6oX9TisizLORDcPttC5rZsdARM=; b=CE5t4biTKJfjFjwsRrgtyQzRpW
 swU3kxl8mvKHToRth0+o9dpHbtdFLdlgWpoQCMhZRwwnnPJYY7RTqpN5GAWMLODvZnY71EHCCqdzU
 Ux/IIDsg7LhrD7A59xa2U805IUBF0lY5F8/VPdje6LhmvYA9pcC5sxBPq0ee0FZaZfTHh5AqTCK9I
 IUw5UMVnCZJdjjyNeUkgv2g7Lu5U8KRJEewNjY0dZ4jb+NYcm0NkuCmpba8Y0ENmFLoEjmycVlTpL
 InkHjSHY7egf50C6yHKO8/1X/KUGwNp15Y/MCo1Ecq2qiYKI9AYa7hTgIgaa0UKdcmbPQWSqjf2+e
 N7Je6BvUYQiyY6ujZ4gMx9JQQVbeaxkZzYu+0R31HIGX+xEbpjHjvXqQY7pg+wF97SDB7CADiIGwx
 byPgwHxyouqs5vd1/cwWpD9kzzHqnpmo0MQZOTLNoK0blmuaIUsKIoU7WE1P8XnPU3/y5zLrlK4xr
 i7LDxvcG4ZM4Kz6o896HjEvW;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1r2V75-005txb-1w; Mon, 13 Nov 2023 11:28:20 +0000
Message-ID: <e916bdea-4197-4372-a15b-cea41c8ebe03@samba.org>
Date: Mon, 13 Nov 2023 12:28:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US, de-DE
To: Jeremy Allison <jra@samba.org>
Subject: [SMB3POSIX] File attributes
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------8Of30asR1GFyri160L78nrJZ"
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
Cc: Tom Talpey <tom@talpey.com>, Volker Lendecke <vl@samba.org>,
 Ralph Boehme via samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------8Of30asR1GFyri160L78nrJZ
Content-Type: multipart/mixed; boundary="------------YvoREKgthdH4HkN0Uu6XMOyX";
 protected-headers="v1"
From: Ralph Boehme <slow@samba.org>
To: Jeremy Allison <jra@samba.org>
Cc: Ralph Boehme via samba-technical <samba-technical@lists.samba.org>,
 Tom Talpey <tom@talpey.com>, Volker Lendecke <vl@samba.org>
Message-ID: <e916bdea-4197-4372-a15b-cea41c8ebe03@samba.org>
Subject: [SMB3POSIX] File attributes

--------------YvoREKgthdH4HkN0Uu6XMOyX
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkhDQoNCldlIGhhZCBzdXBwb3J0IGZvciBmaWxlIGF0dHRyaWJ1dGVzIGluIHRoZSBDSUZT
IFVOSVggZXh0ZW5zaW9ucywgdGhpcyBpcyANCmN1cnJlbnRseSBub3QgaW4gdGhlIHNwZWMg
KG9yIGNvZGUpIGZvciBTTUIzIFBPU0lYLg0KDQpJcyB0aGlzIGludGVudGlvbmFsPyBXaGF0
IGlzIHRoZSByZWFzb24/DQoNClRoYW5rcyENCi1zbG93DQo=

--------------YvoREKgthdH4HkN0Uu6XMOyX--

--------------8Of30asR1GFyri160L78nrJZ
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEE+uLGCIokJSBRxVnkqh6bcSY5nkYFAmVSCFIFAwAAAAAACgkQqh6bcSY5nka/
6Q//TstarGlKvkzzy14zZpec6ds9vsrHtfHvuiSR94FcQD/mfTlEk/AmOXBLB6EYtM7BNuM19D/o
ss5f5G1wlFsJPLxVghTfIQAvEjnxKjZsqcYz6OJZovfURxdXg4cnBz5ODrMcU0kh6b8esn3Xev9a
xBIqDnez8Meu7dz1jjAxjo/6WmgiLPPeDyvk6v8S/G+6BW7MBSo9jdRVV/VczDYmlR5bZJ2dUw1D
6/xtOVPDPXF07VzD4/FvLaALZTd11UHMqrCdbJzrzwQgJd3Q5U2KaR4xnDkK94QZWz96b/9ZaqVg
T5Z+tvZQkS4wNNuiPC3bwfVkwTNYE0EzuaOqob1OcqH/eeVZUzOSVx5Vfn2NG0xP017EcFu7fJjW
egEn+g2lG2iM1bQYw6qGZ8yY/ssBx0SZ/NPzQnS7nK/OZIiP6p6leNR2gLVmuGZsG+VK0mo42vsT
MsmxzaY8eUZCJ6PHtaSvU9heWEaV6SyItcet97vyfS73AAoMjGgZ1dzVLNiAm4nrqsYh152JyMts
ciXLOSHroiDqqxGRfJ+WCKhNFdEhd9OH2ogBG32gv0UnYo1KX6h+elGyMyvjrIixar7mfEraHlNU
luBpbbvV/Jfypz0wOoYN2/ur7+1ZaOukf1qQyZY3MfQgKFwXTbcg2iX7xcxDJHnfxrUn2W89nAMU
X9Q=
=at4Z
-----END PGP SIGNATURE-----

--------------8Of30asR1GFyri160L78nrJZ--

