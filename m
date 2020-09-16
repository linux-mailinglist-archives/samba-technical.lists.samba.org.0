Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 39F8626C21C
	for <lists+samba-technical@lfdr.de>; Wed, 16 Sep 2020 13:30:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=lLGO10SXS8+JiIERm1oGX4RebllCdKA6UBVEUBnffRk=; b=3Lg4Yfo2RZYWDYVh43nhG61BhE
	IT2KmilTitJ8C/WzGxyfs1isbc6sBagO/pd9JKaLzRvkbogIyvBdZTY+H5wuqaA4MSUiprCALY4Ke
	GpV7C54BQmNXVOh+0uylMWnf9mAAFhmQu//2y+TtpsAEp92j4wKn3mvuujVJYHZ1Day2KaYjraucL
	3A1LjBPoIYrgrY1tXzhVUK2LsO+PHfJDcPnyI3xpcXhJ5vvOAA0wGoNLwsWpkkr8CgFXhRA09D41t
	mCItRrr7Xjss/p/LYaL0Hm8gbXZ0osYR8XyfypxnQoasyyz1iIQwIaesrHGW130WkKsk3ZAnxZiDy
	U985GfRg==;
Received: from localhost ([::1]:34624 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kIVcx-005l78-Ti; Wed, 16 Sep 2020 11:29:31 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:15144) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kIVcs-005l71-Kp
 for samba-technical@lists.samba.org; Wed, 16 Sep 2020 11:29:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=lLGO10SXS8+JiIERm1oGX4RebllCdKA6UBVEUBnffRk=; b=poqiU5yNHv0dZi4/1Bp4dj6Peo
 wSNl6iSvCSxEZ0puzykbauiCbAuiB/GlenZyFIj1KVkTOAoS5v13BJmiyytBE1aXnhY0BoCvPkBno
 G8Feh2wxe0jpTkJfISW5uPA+Mz/Qg5gPpY2p1F72fBV8j3DHBxUs6hIXgNW1DJPQ3glAcm6MqUXoG
 llNHZZ28FAU63YZzeNP+Q/N8hBY0rCjBXqvC6PrADhB9LifbQs3Hqddqa4dVNtOshZdNBFT1Mk1Zr
 PHMg0S7dPALc9xaV12vlkMiQdnGqHkU/QzRBcIwkEJJmC9u3Zu2LImEv7Nwu420kcnHfx/K65eZQF
 qk+iKr2ai2HdtbJugH/jw2yWAoZB2tZmi3hOzEt956WD+ywPbrS0vr+ZitjOBFg+oQlNIHDRAjNmt
 +HcnaYAVkVlrtl+IANFpJqmzgUguMHMe08lj4R4jlFAtaK8P/dTAi9WS6qTQ6sqtM12Cvy0eLsa59
 VB+tke1mVRi364oNDBDLwYhy;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kIVcq-0003jN-Rq; Wed, 16 Sep 2020 11:29:24 +0000
To: Andrew Bartlett <abartlet@samba.org>,
 Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
References: <d415684468ce9d140f570791f6a4d560df9bb7da.camel@samba.org>
Subject: Re: Ideas (other than just mandetory schannel) for ZeroLogin
 CVE-2020-1472
Message-ID: <4caec4ad-16be-087b-9d35-a8e8855e2c1c@samba.org>
Date: Wed, 16 Sep 2020 13:29:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <d415684468ce9d140f570791f6a4d560df9bb7da.camel@samba.org>
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="cbsocqUec5LldFMsmcO75I6jhYVUfkMLS"
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
From: Stefan Metzmacher via samba-technical <samba-technical@lists.samba.org>
Reply-To: Stefan Metzmacher <metze@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--cbsocqUec5LldFMsmcO75I6jhYVUfkMLS
Content-Type: multipart/mixed; boundary="NgvcB9VTcYHBZ7lqZjjGUVvDli73tk0j6";
 protected-headers="v1"
From: Stefan Metzmacher <metze@samba.org>
To: Andrew Bartlett <abartlet@samba.org>,
 Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Message-ID: <4caec4ad-16be-087b-9d35-a8e8855e2c1c@samba.org>
Subject: Re: Ideas (other than just mandetory schannel) for ZeroLogin
 CVE-2020-1472
References: <d415684468ce9d140f570791f6a4d560df9bb7da.camel@samba.org>
In-Reply-To: <d415684468ce9d140f570791f6a4d560df9bb7da.camel@samba.org>

--NgvcB9VTcYHBZ7lqZjjGUVvDli73tk0j6
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Am 16.09.20 um 07:51 schrieb Andrew Bartlett via samba-technical:
> This isn't on the bug
> https://bugzilla.samba.org/show_bug.cgi?id=3D14497
> because it isn't at that point yet, and isn't a MR as I've not even
> compiled it, but ideas (done with Gary) for mitigation for those who
> must run with schannel are:
>=20
> Ensure that the password set via ServerSetPassword2 is of non-zero
> length.
>=20
> Check the password does not have zero bytes in it.
>=20
> Check that the challenge in ServerAuthenticate3 does not have repeating=

> patterns in the first 3 bytes and repeating 0s in the computed
> response.

MS-NRPC has added recently:

7. If none of the first 5 bytes of the client challenge is unique, the se=
rver MUST fail session-
key negotiation without further processing of the following steps.<70>

I'll add a similar check.

metze


--NgvcB9VTcYHBZ7lqZjjGUVvDli73tk0j6--

--cbsocqUec5LldFMsmcO75I6jhYVUfkMLS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEfFbGo3YXpfgryIw9DbX1YShpvVYFAl9h9wwACgkQDbX1YShp
vVY/LxAAkzEy/Tnok+GaJp8w3B6lhCh0k4bwPHpwdmMF9YK3Pi0vmuQKLSFijZLq
vNaQg2E5qM8z5PzSSZKD4PP2cf/6ie3yBRnzcvFHAvR92/vA5s4MmytWW2VWfkAD
EJZImsntGDhMH5tc+dOrWpo7vuNC2VAIOuKa5w6BdMIKz7nDuGUHg3yXiVUBhDLe
Zrj7l0Bik9N2VKugXyw0f75UqM0wXnLr0JIxJZGl5jUTgErhdlpS/inmY89fAE8p
dZdn2YDcwdIFYDKe++pwvGKYBnO/Z8RhaSuOwagOiV5yCWtmzXEks0pRU8gFJFe1
F5I6j7R1YWU19TW+AjbQ31RnTiRyUMbYFBMdfS8hsOGtJYfnfGlBc3audF3lRYBh
3KlA1YnTrYiPTnpbCN3PX14YwDfaz35hGpoHyj7ZKhxnpdmXp2nhwnFaQjnsnH5M
Y/tJ/WM6euZPZ3r4rUf51ySb1n+ttwuWVhCuOJlAH9C563HC+xuAHURZiMmCvsRZ
B07xbrn4It9z8IAnjlEywlzJwCmsohRbuyhetORC+vVjsecv3dJtBOW4WozBYGJa
ocVq69dBKW2PCZN+RNeIEcMvPN5KN5ksz7h6+RuGd2wYCV27R8vuVrpLniSKargZ
VzklePi1v6irkJMFJRcZpKqAnGPbU2Bi9wMZIR9o4ypVxIxibu8=
=J/vI
-----END PGP SIGNATURE-----

--cbsocqUec5LldFMsmcO75I6jhYVUfkMLS--

