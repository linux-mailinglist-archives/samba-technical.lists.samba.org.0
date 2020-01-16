Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 80DD013FC20
	for <lists+samba-technical@lfdr.de>; Thu, 16 Jan 2020 23:22:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=TJqaEI/U6YdTmkCygHmZDA2cGqNydO4aCO5/bHOmtqs=; b=F/EBiE0iCU+etzGZ7KHIkBL1N/
	rG6pQ9XlIRjy23N0NzE0NmXwOW+zx89hiFWgLG0ck+3pKrlf8Xg9VBY03XPP2De8nSUBmP2kcvu4P
	Q7YbzhgHxiMkOmfYhEsoHfPZCxE6/zrdO3XZWKu7EVpimXNgdxyGOcauSe5zA4rnZCOtZNH3oqLNd
	vxlTyXmIJsBzdMfNb7ewyha+Glezb7Y5huj+kgR5g5fdR29MSuyqMTpkMroBXfL1HEm9zzcZZK9D5
	dIkxiAhWXOpVFqlm/FImIWJj7T91U/MNzrBOkPHrGQHQbcZQQpKBu8FAbi5FgYboN8JrQZxoZCueq
	+X6X1rqg==;
Received: from localhost ([::1]:57984 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1isDWZ-003hN7-Ew; Thu, 16 Jan 2020 22:21:59 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:19652) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1isDWV-003hN0-7h
 for samba-technical@lists.samba.org; Thu, 16 Jan 2020 22:21:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=TJqaEI/U6YdTmkCygHmZDA2cGqNydO4aCO5/bHOmtqs=; b=irAl64TX4QJdCtHAd8YI23SUgc
 XdxkIqdVj/C72QWbJEA+vVMGgD1fWZd/Z73T25iZ0gFLAhiTuMnE0nxQElHOZuQU9y0C2w7bbp4Rs
 8AHptDAlwLksI6JD3IFjC2qduCDuAbOa08CMa4Du+S0vf26Gw+Mq7rX6gqEdX2mwuZan/KBIUM9Sr
 oXVjE35FlRgBUSxltjf4L+umkxv7w+kSOMEvHHago65kx2ZGof7o5OUUTsLPEK+ZPCDxYbY4dzoWY
 ug40REC49AnMesxCtqRFcvOo7jlo8fs6B2jAqtPEtDE22UtQOVYDkm8vwdGsk1s221XYfIeuHYaH1
 yAXUceJBy1ANVLMvTIl7bFbizkvlRqh31aOjTXr18W/oG/NlpgqXhOU3+XrP7zl2GFxNzhA520iGk
 oAmZ6fQpg/Tz6M4ZGXVydVqHUlnZRlhrWlnJHMXpInBx1VMQZiF3JMRNmw5OnRJPZZuQIWhula1yl
 N5rvMVj0rQT3On7iiwAUMfHi;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1isDWU-0004bv-K3; Thu, 16 Jan 2020 22:21:54 +0000
To: David Mulder <dmulder@suse.com>,
 samba-technical <samba-technical@lists.samba.org>
References: <fc2075c1-a01a-91e3-32f4-af13496f0c81@suse.com>
Subject: Re: negnowait test for smb2
Message-ID: <211ef3bb-834f-8d32-2208-ea640f73a2fd@samba.org>
Date: Thu, 16 Jan 2020 23:21:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <fc2075c1-a01a-91e3-32f4-af13496f0c81@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="xPzuHWJdqK3f78ZvBERESKWN4uICNolPs"
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
--xPzuHWJdqK3f78ZvBERESKWN4uICNolPs
Content-Type: multipart/mixed; boundary="OhM7AO3nzA1Ik7mEwXuyFO05buPEFwWW5";
 protected-headers="v1"
From: Stefan Metzmacher <metze@samba.org>
To: David Mulder <dmulder@suse.com>,
 samba-technical <samba-technical@lists.samba.org>
Message-ID: <211ef3bb-834f-8d32-2208-ea640f73a2fd@samba.org>
Subject: Re: negnowait test for smb2
References: <fc2075c1-a01a-91e3-32f4-af13496f0c81@suse.com>
In-Reply-To: <fc2075c1-a01a-91e3-32f4-af13496f0c81@suse.com>

--OhM7AO3nzA1Ik7mEwXuyFO05buPEFwWW5
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Am 16.01.20 um 16:45 schrieb David Mulder via samba-technical:
> I converted the base.negnowait test to smb2, but it seems that this tes=
t is meaningless in smb2. The server never seems to grant more than 1 cre=
dit during a negotiate, so we almost immediately run out of credits and b=
reak from the loop.
>=20
> It seems to me that I should just ignore this old test and move on. Doe=
s anyone disagree? Maybe I could run this differently somehow?

Yes, that's an smb1 only test.

A more useful test might be checking what happens on a tcp connection
1. without any request at all.
2. without finished session setup

metze


--OhM7AO3nzA1Ik7mEwXuyFO05buPEFwWW5--

--xPzuHWJdqK3f78ZvBERESKWN4uICNolPs
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEfFbGo3YXpfgryIw9DbX1YShpvVYFAl4g4f4ACgkQDbX1YShp
vVblexAAroHVrG5Ej5VhpbkOkYLhpbsbQDmlOuWnkpixhMtjCy0dLx5vFPFGAdfO
zfe/E5RaECbsVpnRNHHyi9jlTnPG8hTML0UAmrgE9FhXjxEl7g6Evwg5q3elwL7A
qKFgUxhHnv5oE9jZ+/3NuU7BFDG+cim/BVLVEjwdIgU6AjGbOY/ZziANX2gg0fUl
1HmjJml8LoX6aOY1b4Hzl97lot1XPzjwtAclpMUqbqf7Q5xR24pttIC4F4aRcJM8
ZodI23z10sboJit7qMKzbR6WV3VKYRqMyiOivGoEzklSq7B8WmopnNX/8w3eZ3oD
0CZAz83rr5Pf0esGcVDMEvExkBt3cBaINcpc61pOXYTxvrMwFwU/EjJ6v3euTXOa
PimFaSaQcEEk4Aa12sHx68dYS9xnU3PlRxOhoJp6Igm513zuVpXyYp6IlyvDM5w5
mrTuHvK5RMo/1UoWQJIYcJHWUxaakg7rz7QigfPgysso3ji+bar++qxia5WbP3zc
+mTIX0uEzCmgxcVw0G6093B4IhrsgTyXT9FZoprO6qvt/vHemc3N42iz3VNTWTHR
95ZIpNPTxpzcnwc+PY6YRDRpWAU/w8jS5jzjAhyGuLmigMHZ2JrsBFc8gxCf3p2B
/mJqkOJPy3KRV0bEM7JwexzpmsHAAoKmRKWaNNiQzq3pUQhYwVI=
=o/AT
-----END PGP SIGNATURE-----

--xPzuHWJdqK3f78ZvBERESKWN4uICNolPs--

