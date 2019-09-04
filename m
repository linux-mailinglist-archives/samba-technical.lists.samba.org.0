Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 295EBA80B8
	for <lists+samba-technical@lfdr.de>; Wed,  4 Sep 2019 12:59:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=C3ye/X3SK7uD6Eqm/7cQi6AR6rs900/+LjG87LplGwI=; b=P98iBoUqKWbq7nBC7rhvII+wnR
	LS2QlmW3NVx6XzvUchoNkJm1TZyr/4Y3j8+37l/DVXjx9ootGRDI7Mtlz4tWM6nJVXvRc/GDLyCaE
	ACoPTXPPVjlQf3bnIvUWeDNO2yD9MGv4a9Og3yBBqeJTkDwIztNUVO+WOgq2vc8xwigfEm6peBgSE
	5BNiEcTgsLgMBmkeguSw8Re9Z0IbKzzPV1phAMMxW/qXUEgzNvVEiNLrpKSRn3j6CTuZM5cO1XPGQ
	Hz6POWPFbS7qCQefAhgJ3QVW0OtVumabDSUmwQIW6KIopsK3aCRxqda8oMspim0IbU4OzNPNFgVNF
	BMktDWLA==;
Received: from localhost ([::1]:51442 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1i5Szj-003Mqv-7X; Wed, 04 Sep 2019 10:58:35 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:48456) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1i5Sze-003Mqo-Dm
 for samba-technical@lists.samba.org; Wed, 04 Sep 2019 10:58:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Date:Message-ID:From:To:CC;
 bh=C3ye/X3SK7uD6Eqm/7cQi6AR6rs900/+LjG87LplGwI=; b=VD3oschRWueTOy1136Y18onC7T
 O3+GRStuK1yjA5LBH3gIK/Wl6uc3QFOkY+8HzjMErz/8GszE7T9fTmI6Ui2dseUkjAPJOBfWaIfUp
 qKRjE3yP6jIzANS4WfR+qdDGtsfHRlCOzhuwHxlpJ9XRavF/QlCbEYsuUjRmSj0pFUTc=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1i5Szd-000580-I5; Wed, 04 Sep 2019 10:58:29 +0000
To: Andrew Bartlett <abartlet@samba.org>,
 Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
References: <ad9719c06273cac4686726b293ce9e78fecd8ca4.camel@samba.org>
Openpgp: id=A3D192CE44EF412517BCED646A739B025C6B98D4
Subject: Re: PROPOSAL: deprecate plaintext password support (in SMB1) for 4.11?
Message-ID: <e5796781-277a-5e10-cd55-0322f42783d7@samba.org>
Date: Wed, 4 Sep 2019 12:58:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <ad9719c06273cac4686726b293ce9e78fecd8ca4.camel@samba.org>
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="9PUMVuy7PPaOLvQu2qcbKyKclR4fGB79Y"
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
--9PUMVuy7PPaOLvQu2qcbKyKclR4fGB79Y
Content-Type: multipart/mixed; boundary="v3g9u0jSPG8ZuG250xLSXR15cP6PxqiKN";
 protected-headers="v1"
From: Stefan Metzmacher <metze@samba.org>
To: Andrew Bartlett <abartlet@samba.org>,
 Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Message-ID: <e5796781-277a-5e10-cd55-0322f42783d7@samba.org>
Subject: Re: PROPOSAL: deprecate plaintext password support (in SMB1) for
 4.11?
References: <ad9719c06273cac4686726b293ce9e78fecd8ca4.camel@samba.org>
In-Reply-To: <ad9719c06273cac4686726b293ce9e78fecd8ca4.camel@samba.org>

--v3g9u0jSPG8ZuG250xLSXR15cP6PxqiKN
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

> It is quite late for Samba 4.11 but I wondered what folks would think
> of marking 'encrypt passwords' as deprecated so we can consider to
> remove this code in Samba 4.12 (eg master) later this year?
>=20
> This would dovetail with the SMB1 deprecation effort and I hope also
> help find users who can't live without this (because SMB2 doesn't have
> this at all). =20
>=20
> I'm unclear if this even works, given bugs like:
> https://bugzilla.samba.org/show_bug.cgi?id=3D9705
>=20
> If this is supported I'll polish up the attached patch and then write a=

> WHATSNEW for 4.11.

I don't see an attached patch, but I like the idea of deprecating
plaintext passwords, maybe we should also deprecate lanman auth
and ntlmv1, we may not go on and remove them before SMB1, but
people should avoid them.

> It doesn't commit us to doing anything in master / 4.12 (and we might
> want to wait till closer to the end of the year for feedback), but I
> took a stab at seeing what it might allow us to remove and this was the=

> diffstat (and there is probably more if we tried):

For now just mark them as deprecated and defer the removal decision.

metze


--v3g9u0jSPG8ZuG250xLSXR15cP6PxqiKN--

--9PUMVuy7PPaOLvQu2qcbKyKclR4fGB79Y
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEfFbGo3YXpfgryIw9DbX1YShpvVYFAl1vmNEACgkQDbX1YShp
vVY4kQ//bCkp+4kXRI5HEnbIpGeT8ezN/fU8w6mmiZ1MiPOfVS9ygyMiJCCf2Qng
VHw7Pfpc1AtVwKvsznPW+OsSSVn0fhIonREX4dYcO0n4gJ0/fxmWr78doyGAn+ds
S8HDyrFula0/oVYUmQXYBBVlvTFoWdAKDkqh6Myxtckhx25FBUijHPk9sp9tNGO7
XqDuhymgDQu53Ik6u6hVKcbAYV9ZPJ9kU5tNxxZ7oQ6L//rx4Etyd5VV6B+PIxsG
zH3mypqzwiZJfsD435tA1LLtX1ltOvhlANKvQ8emCFdvU6CUMHapsjtqYNAhUTJa
mCYI5gYmg6k+rGnZg7aKTy2frzY6x911mkTsz1UDl2Xt4PfsBED6Y53pUBbyOPDU
hLv4HoI8RySTFNeY77F8Q1ZBiH+8zHWanIwJPvf13U/5iqg5N/1LcLbKeJ1jpj2b
O8m/qFNnXV8ZqYpdmknTB4U/xlzAlUrPNK9iNdhXaPB1elU0cAtCJ5tuzR1PGUgP
8RzQSuQ1ajL/mHqiq6la3O1cKYWTQq0G7XyQbxAgPVVS7RQND6o82ZNdOyIx8gbK
HcnJtGZy3jGYWY0zqrQdiJaNDUTZ1XthEo1VjXUKysZ9JBC+NNjJ29TF3pK4DaoK
kHhXS3CnceEEeJySHT9eIOkeqMPsbqEHiF1sNkQdR/gs8xZpuXE=
=+vax
-----END PGP SIGNATURE-----

--9PUMVuy7PPaOLvQu2qcbKyKclR4fGB79Y--

