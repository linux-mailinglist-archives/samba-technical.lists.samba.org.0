Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id C11CB4FC546
	for <lists+samba-technical@lfdr.de>; Mon, 11 Apr 2022 21:47:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=JHiZrYKpPjlj15CI5Scnf5xOit9T1sOmHMAK+z8Boco=; b=PM5hvqPdqU6/QCIHGle6Z8RXz2
	dV/2mXQRshgzu6CUs2wsbz5ZKOjCKaIlpvSGeKn/VvgUIj2aYgb0c1NdrLK+6jgPwt5SOKwX1V3Ku
	Mplbf95fE0NRkV2r5ExNHF5G9S4RLTKoom+GkU8oWDEVEwSWx3HbIVbD8ZTz3Jz6/jwv7dGXBbk33
	XFEGVlD8rFsBeNsxAzIw6Hz9I3K34jKpOfspkwt2md6MBp3X34Y8oyZSczl607mgdL6GnCa6RyCLR
	h1Dqf7nT707ufExg7/+ACSk+l7l9bbmMEoBtc4PQajJxRE19zw7eQeLUNJFAz8JvzFsuLq8YrBecd
	c4Czr1qg==;
Received: from ip6-localhost ([::1]:18234 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ne00E-00BZ5R-63; Mon, 11 Apr 2022 19:47:10 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:38294) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ne009-00BZ5D-7k; Mon, 11 Apr 2022 19:47:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:Cc:To:Date:Message-ID;
 bh=JHiZrYKpPjlj15CI5Scnf5xOit9T1sOmHMAK+z8Boco=; b=uFp4wQNPGGTZbvrA3JqI3oNeX7
 zJWWx/FjyRcW17y/Rm/ra2OXAUccR2xYX5KzSh+16KsYO9RXJ7wXe6beL3OLtUEeGvyGXG3VF6Wcd
 SE5EmSqL3xACt5FVaioLTDk07JBA4N3hPda4EUV4dIIIIPCkc9bCLMvd43n5KhEaWX6TNa8A3nfaW
 w5CRwGwtYLsLpjBiee7lPj8aWRBMUivVjo09ika1ia5X0V1y+WVi+HoopyGUeGuNU0nygezsi59O7
 oALkoT0UAqMly8CjHjICjRU326TBRnYhxplwxEeLB4FeOTqzKnAc6eP+C40Ge/wvdIoaf/p1cJ9+w
 7wBv0fMa/HzhDjKmtRKQ+NylJ5k9jsxzKRal4czkm0PCKLyuZBk+9HqrR/1npwB6LUsOx+wZd4fEi
 FEATtWj+QxJiDaTjdumSLhAMPIB48URfMNGZ76nsHgDMVure2DE1i1c3+biIkZnjsEZ8E5ga4B1u1
 6yLQnEeUQp3+K7uCQUEA0GeK;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1ne008-006URK-9v; Mon, 11 Apr 2022 19:47:04 +0000
Message-ID: <735213dc-d0d7-6cd9-81cd-d93d770564e9@samba.org>
Date: Mon, 11 Apr 2022 21:47:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [Samba] Samba in Containers/Kubernetes Status Update 2
Content-Language: en-US
To: sprabhu@redhat.com, samba-technical@lists.samba.org
References: <0a33793ae6a05b492a899ffbde9a8533d14c7faf.camel@redhat.com>
In-Reply-To: <0a33793ae6a05b492a899ffbde9a8533d14c7faf.camel@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------omdPrusG0BXycU02FDL4CdhV"
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
--------------omdPrusG0BXycU02FDL4CdhV
Content-Type: multipart/mixed; boundary="------------6VL6R0lHHm0783L0XSQX0kzB";
 protected-headers="v1"
From: Ralph Boehme <slow@samba.org>
To: sprabhu@redhat.com, samba-technical@lists.samba.org
Cc: samba@lists.samba.org
Message-ID: <735213dc-d0d7-6cd9-81cd-d93d770564e9@samba.org>
Subject: Re: [Samba] Samba in Containers/Kubernetes Status Update 2
References: <0a33793ae6a05b492a899ffbde9a8533d14c7faf.camel@redhat.com>
In-Reply-To: <0a33793ae6a05b492a899ffbde9a8533d14c7faf.camel@redhat.com>

--------------6VL6R0lHHm0783L0XSQX0kzB
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgU2FjaGluIQ0KDQpPbiA0LzExLzIyIDE5OjIzLCBTYWNoaW4gUHJhYmh1IHZpYSBzYW1i
YSB3cm90ZToNCj4gU2FtYmEgaW4gQ29udGFpbmVycyAmIEt1YmVybmV0ZXMgU3RhdHVzIFVw
ZGF0ZSB2b2wuIDINCnRoaXMgaXMgZ3JlYXQgc3R1ZmYhIFRoYW5rcyBmb3Igc2hhcmluZyB0
aGUgdXBkYXRlLiBSZWFsbHkgbG9va2luZyANCmZvcndhcmQgdG8gSm9obidzIFNhbWJhWFAg
cHJlc2VudGF0aW9uIQ0KDQpDaGVlcnMhDQotc2xvdw0KDQotLSANClJhbHBoIEJvZWhtZSwg
U2FtYmEgVGVhbSAgICAgICAgICAgICAgICAgaHR0cHM6Ly9zYW1iYS5vcmcvDQpTZXJOZXQg
U2FtYmEgVGVhbSBMZWFkICAgICAgaHR0cHM6Ly9zZXJuZXQuZGUvZW4vdGVhbS1zYW1iYQ0K


--------------6VL6R0lHHm0783L0XSQX0kzB--

--------------omdPrusG0BXycU02FDL4CdhV
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEE+uLGCIokJSBRxVnkqh6bcSY5nkYFAmJUhbcFAwAAAAAACgkQqh6bcSY5nkZK
xA//ZLl1NFq5SAS3tbRfl4HauIv6rTAMZh3WY76iKKFKaPp1F9bJwncpSSg4OoV9EUtGECeGSbLW
8ZiJmr5zhqXdrEZdA5FghbFDpbvkTJgAYEaMSOkmynACMdg5mgL7zKiH44xogejAvkBuk8ZXHkyM
vgVOTs6Z95Tesfi0yW9DS1VpU3EhZ4yO0BnpvmYffuml1DEUynuL9/H+of8Fl2e3MO/5k1+a4C/R
v2OmqSvCZiTHnA3zR9lEMMOmgzdLAd0Aa5qfJeejQLkKZYmwgyjw8R9I2AE9qmAmYqkDB/IV3hD/
0q1MlKiGx3se5mWjDxAA4NDHWwji0IK8tk3qkAk++71ocdAn/L9J71Niooqhpaia3TX5Q7aH97Az
Z3UoNwTJ8FXrvofCnZ3JbulNiOR5zktNOG6AGex/iZ4d9b+DExLeQJNycw2ZZWsy48T1GHNvM5e9
15juvLCfHNCjhtCQ3LaES36jPUHzbmz2QsUxELCFFMJs4Y9uF+UITTRWffI5N+syGhUN/XweyWi+
9MZgyXdCrlfDRmuO35YKI96Vn4hcMw5gUDdWxW1LCzMVsdGyKSu5sJVVi83FJ5PfFOTYachP6+Y+
ixv574Dj7cdOS62S+IBOtPa7PFCApu6BpdgErsjDb7auZ7F2U14j2hIgSg9dt95midr+6EAQLkjj
l+0=
=Rwfz
-----END PGP SIGNATURE-----

--------------omdPrusG0BXycU02FDL4CdhV--

