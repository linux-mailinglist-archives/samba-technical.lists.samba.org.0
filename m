Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id BA7F34AC7BE
	for <lists+samba-technical@lfdr.de>; Mon,  7 Feb 2022 18:38:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=LuXcPs4Ue2IM7w2I3iHTsL1ojQFibq26rt91LpWReV4=; b=U48kOskyHChvM6Vuxc0x6+4UxG
	vBK6Z5ca5KgkfMN0Sl0jCK1tjp5msaoLUj4rWH8TlTsmJQ4HZ5A/c6RlM9RpI+8WHtRGbjwWYyKwz
	rkUj9B3qfC4UJ6YwGmg1C74gl2pykJOktQG4FrkauSUy/04thfdFWbDsnWGBWraIIAdVnai4WeNQw
	UWAU6Q1FUZdXIPZItSxbVRBRYNpP0S/rMPm5aBnqnU7Wh6JYGrT+zqD5qX/qsJpGQ4k9oI2mD1Jcw
	R/QouQcXOkIYX5uJJFMGrJioqnqjf2eIJcpo4fJxV25HQSxu1qi9LS6pMAwIP2Hq0XTDJ0ozlEHgE
	6WWn+hxw==;
Received: from ip6-localhost ([::1]:42024 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nH7xz-005S6m-Df; Mon, 07 Feb 2022 17:38:19 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:48728) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nH7xs-005S6Y-U1; Mon, 07 Feb 2022 17:38:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:Cc:To:Date:Message-ID;
 bh=LuXcPs4Ue2IM7w2I3iHTsL1ojQFibq26rt91LpWReV4=; b=a+6xrmdXBrbiNaooqlCE/Zt3rd
 Du/lwmKyoKmuV2Mt3vtbEHFCydVBk+1xbPUTqzqyHcoao3cAD0pNsiWclmowlwLuTDyWMbK0RwIUt
 9TYowplXGRoe4pH5PXQpfwMEYT8nXqM2UWBnzZLXtY2OCQX04hOxeQ7chOwvv/4AmVXBqiGbAQU8w
 Kv29IwUz+6aBtmz8NDUPRpIkCfxOe+JFua3pW2d4eHVYJVVvioEVJfLKgKMqHoe3nseywytKaRP7h
 uDhOCnrud8UelioQ708VCzisNcCVC8w2xcEdJ07J7jLovjR5tO8TmgPSDmzAhOeW7PPcHZRHoH9Gm
 FnhphnZpFhRNTisOv5yh4wMKlnHl8OI/2W5IkS6/UH44vyNyyyEtN7tVVZ+JY/GbqTLux/EzxztVF
 YfKthTbDNr3uiMiS13on5sKwBCwHuz5mPLuXgniOmDrfs59Dcs/iEowPdqWauSx45ONVGolUd2tEJ
 oFkdRP+yafIoZzxJRG32J0Ff;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1nH7xs-002Zld-1f; Mon, 07 Feb 2022 17:38:12 +0000
Message-ID: <28c3b502-7146-4403-b728-4815dafa9110@samba.org>
Date: Mon, 7 Feb 2022 18:38:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [Samba] Remove LanMan auth from the AD DC and possibly file
 server?
Content-Language: en-US
To: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
References: <53125588031f8ffad9e7c8a4b16a7f093781a39f.camel@samba.org>
In-Reply-To: <53125588031f8ffad9e7c8a4b16a7f093781a39f.camel@samba.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------mtB1VzL6SLKUm28vjN9camWs"
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
Cc: samba@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------mtB1VzL6SLKUm28vjN9camWs
Content-Type: multipart/mixed; boundary="------------t0jn8GJ5W1iJn0QXnpxaf4UH";
 protected-headers="v1"
From: Ralph Boehme <slow@samba.org>
To: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Cc: samba@lists.samba.org
Message-ID: <28c3b502-7146-4403-b728-4815dafa9110@samba.org>
Subject: Re: [Samba] Remove LanMan auth from the AD DC and possibly file
 server?
References: <53125588031f8ffad9e7c8a4b16a7f093781a39f.camel@samba.org>
In-Reply-To: <53125588031f8ffad9e7c8a4b16a7f093781a39f.camel@samba.org>

--------------t0jn8GJ5W1iJn0QXnpxaf4UH
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMS8yNi8yMiAwNDo1MCwgQW5kcmV3IEJhcnRsZXR0IHZpYSBzYW1iYSB3cm90ZToNCj4g
V2hhdCBkbyBmb2xrcyB0aGluaz8NCg0KSSB3b3VsZCB2b3RlIGZvciByZW1vdmluZyBpdCBh
bmQgaWYgcGVvcGxlIHN0aWxsIHJlcXVpcmUgaXQgdG8gd29yayB3aXRoIA0Kb2xkIHNoaXQg
dGhleSBjYW4ganVzdCBjb250aW51ZSB1c2luZyB0aGUgbGF0ZXN0IFNhbWJhIHZlcnNpb24g
dGhhdCANCnN1cHBvcnRzIGl0Lg0KDQpDaGVlcnMhDQotc2xvdw0KLS0gDQpSYWxwaCBCb2Vo
bWUsIFNhbWJhIFRlYW0gICAgICAgICAgICAgICAgIGh0dHBzOi8vc2FtYmEub3JnLw0KU2Vy
TmV0IFNhbWJhIFRlYW0gTGVhZCAgICAgIGh0dHBzOi8vc2VybmV0LmRlL2VuL3RlYW0tc2Ft
YmENCg==

--------------t0jn8GJ5W1iJn0QXnpxaf4UH--

--------------mtB1VzL6SLKUm28vjN9camWs
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEE+uLGCIokJSBRxVnkqh6bcSY5nkYFAmIBWQEFAwAAAAAACgkQqh6bcSY5nka4
yBAAg8k/7T1K8L0BEb9QP1p3HQCKhnZ6VzqPS+CUeZ13k4HwPon5P5zQ+uITNsVpNtQBDa6ajYcq
sTNyAASq/dLRndEzaYJlieUHyPIxEkyMuXabRPt8vB6jvNDM5jQWZ7Ap0eBovAQCkSvWDa02kw1H
2STPlotE0oXDUbASVbn16EXD9n+H78GAJInBHddLFkP+WXa1AXGNzwdaCKhsL2kdH2H6LxPhzv8C
I20iPrmEUImXcvJ4Pu7IBoATzaVCI/OoQEdb5bnonRmgy56f8f6n86xLpULxS9sYatZzCGFahljP
bCzF4EYvksrOtmivYzstmiHsksb9hyg/Ca0rBmqOij2eej+zgfPk6ce5TpJiZIHvo1cFp7kkGo2I
j8u8bBTfAX7tsmsFOmb/prH5rzMFhFBmFRE5WiE+FB/Md23ipJI1/NlQhRBXnbbRIX+w7RZggnig
By3Q+t3KLOR5hZOKEer5AmFgBPyHLCrP6nolUUiBu8bUsMPxL80/0tkdVWRylXm0eMrr0rLqCTEp
4Or3pC84ohO+uh4/LBd91GCYFl/TgHKPe7E6USKiipwmsP524Den/M578FC8eFZHtXF/oADsPU1K
IOmyI0W7oP7dk4WRbJ/INbQT/f6+dt5fx/jSXKLb6ddm+QQm2maH17CkIjzBYNGEQlC2Jz3sx7j6
Mts=
=dVyi
-----END PGP SIGNATURE-----

--------------mtB1VzL6SLKUm28vjN9camWs--

