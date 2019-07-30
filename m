Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id CD47E7A28D
	for <lists+samba-technical@lfdr.de>; Tue, 30 Jul 2019 09:51:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=v6udm8VmYY240V5XR5Cpn5pFvLjjPrxJLYuL4COSWmk=; b=2mGoKJ6f+rXcraLkzbvIHLmWDV
	BiUZzBgUM4O8mlHE0Wd0VJ0yqQtS33iRKK0RtHptyxP9EXNjfqNoRsJAm6ziPXMRQ6+E45JHx6Bgo
	9JP2W9wwJhLhO7eL8hCdFQC/v9fbIsIz8WzdnV3L1gS2iAnXGa24AqQu278dk+JFcQYPTVEIYfLTX
	KMajSeaY9tm9wYH78Z8GFYZH6mDb5u8rcz+4cdsLBDZbo5dWeOzXPYES4X8Vs8DXYuSbaXcZZzyea
	xHc1w1q5viRSw9UAfY6Vfky5sY5Rpm3UrAKKUsoyHJdXbrvu1Q3dsbtpKB/Ac62TQE1gg1fQ6+Iai
	TIHixxCw==;
Received: from localhost ([::1]:19040 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hsMuq-000tg8-MZ; Tue, 30 Jul 2019 07:51:24 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:29630) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hsMum-000tg1-2I
 for samba-technical@lists.samba.org; Tue, 30 Jul 2019 07:51:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Date:Message-ID:From:Cc:To;
 bh=v6udm8VmYY240V5XR5Cpn5pFvLjjPrxJLYuL4COSWmk=; b=q3Yuz6DGmgCVIlyTukf7HP0FB1
 2aCJS/Qquy0NzedRfu7ihYSiLy6waW5Cypb1wGl8GVUARhkYr2kLuzCQHhPQEiY6lO20YgmVAk3NR
 8rvjE5gU12E2HMEkepUDTj3/+n1euR+AstAgfHlhXK44uVVzDLrhZcqBe87Y9u2BfMvc=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1hsMuk-0008Uo-I2; Tue, 30 Jul 2019 07:51:18 +0000
To: Martin Schwenke <martin@meltin.net>, Noel Power <NoPower@suse.com>
References: <82e23c37-0bdc-e35a-373c-71b0591becd9@suse.com>
 <20190730100948.3e72f009@martins.ozlabs.org>
Openpgp: id=A3D192CE44EF412517BCED646A739B025C6B98D4
Subject: Re: RFC --picky-developer (for developer builds)
Message-ID: <1dfda6d3-27ec-3d05-4f82-9d4b8814ccaa@samba.org>
Date: Tue, 30 Jul 2019 09:51:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190730100948.3e72f009@martins.ozlabs.org>
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="4FEAb3fKK7eGXFFkYRnvmTEX73tqS60M0"
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
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--4FEAb3fKK7eGXFFkYRnvmTEX73tqS60M0
Content-Type: multipart/mixed; boundary="6v7rVV8rAVsbcIdT15KEQMNNyA7SOqYtN";
 protected-headers="v1"
From: Stefan Metzmacher <metze@samba.org>
To: Martin Schwenke <martin@meltin.net>, Noel Power <NoPower@suse.com>
Cc: samba-technical@lists.samba.org
Message-ID: <1dfda6d3-27ec-3d05-4f82-9d4b8814ccaa@samba.org>
Subject: Re: RFC --picky-developer (for developer builds)
References: <82e23c37-0bdc-e35a-373c-71b0591becd9@suse.com>
 <20190730100948.3e72f009@martins.ozlabs.org>
In-Reply-To: <20190730100948.3e72f009@martins.ozlabs.org>

--6v7rVV8rAVsbcIdT15KEQMNNyA7SOqYtN
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi Martin,

> I like the idea.  Those fancy options sometimes find bugs before the
> code gets merged.  ;-)
>=20
> It would be good if we could even go stronger.  I always try to build
> with CFLAGS=3D"-O3" and --picky-developer. However, with those options =
you
> can't build against bundled Heimdal Kerberos, because it is a roaring
> dumpster fire... and I don't think anyone has looked at fixing
> building against system Heimdal either...  :-(

Are you sure that's still the case?
It was the problem at the time I wrote the patches
~ 5 years ago.

But autobuild and gitlab-ci use that for quite some time now.

See https://gitlab.com/samba-team/samba/merge_requests/667
the pipeline works fine and we're running the O3 build on a lot of
distributions and never need to use --disable-warnings-as-errors.

metze




--6v7rVV8rAVsbcIdT15KEQMNNyA7SOqYtN--

--4FEAb3fKK7eGXFFkYRnvmTEX73tqS60M0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEfFbGo3YXpfgryIw9DbX1YShpvVYFAl0/9vIACgkQDbX1YShp
vVbqeA/+LKkYLXpg34w7d6o0vajTlRb1Y44TS63xuVaZduM4MYXQwm7xXAsnG3uM
tpy2iUVGLit0wNbOXyiY79wn9bQXn8DCQjeJ7x7zoUfuujHUN+vHYwjef6yZxZSf
k768XEcGDH1FNMp2mRwg0a9XBPWoaNk1hhW8WOugIwW3aZgfytRP28pgMBkuR09r
GIU7F3Z+atEBMKN0h6VfmkuT3uO/v0oNWU/nndoumkB3N5Kbf2WdFgAMdCUU4eHu
2xZ6OPAG1OyU1U2cowCBHKMWZ4/RocibMdYtBq/6unG6EMOUVQopBrvN0YjAB4EO
txZwuE72j8bZEnNQ4MNsUq6iyyGiL2FMkhLlVeNpfEVJGwr2ptKoM+va5YGftYPv
+BEBkmB49STF2yxkYZmHGuYyxvp0H4MjQpcbuqynE9pNEbLzVUO5ergq8r3LmbET
3phUz/emSI4K48U19u2oBhR/clAPeG4rztb7CkLJQBK6iU4HvknOT1gl5NJ/oDzg
6vEsWMvm6BxQ3P1eVpLPA6ZsxA9f52raJrLe2Weher8dL6w5+GnRPTQqCwLim9Hx
91ym8aOqgYlYkg7Pn6JykE/e+/YREoW9N/ZeTVrDrU5uKc5vSMpkKyWPvR0b6Eo/
VTshLUlJaUd1En6KFnr/oHee/PQReRxFuoEHPU7pwHBdoDxDNoU=
=TJN9
-----END PGP SIGNATURE-----

--4FEAb3fKK7eGXFFkYRnvmTEX73tqS60M0--

