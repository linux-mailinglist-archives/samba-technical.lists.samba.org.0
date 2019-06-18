Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BA514A444
	for <lists+samba-technical@lfdr.de>; Tue, 18 Jun 2019 16:44:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=tFnT3ZdAQHVUKcvGX0A+t6+hERmax4xpSDbrZEH6T3E=; b=rT5cWL5UJfeUXY0ZoSUZojxs4d
	d1shL8/XbrjA+aQtPjOGb9x8JnkgIvYhq3zD0tgaLeBHMn87+n+fztFJdofe2WsW6+MdHOGYpcXld
	k0R7LJ3QHnyu2a0Yxhq2yXCqFADGAtNgvqcofF4HYa7KMZJW6qShx0nTldv0s7AgGjEn+atB6qa9w
	uyfJ4XrvWffGsQnfAL9+SLf6RMmEehKSmivyLeEuWgcIiYKbARvJ6k6+vcrbzceWh7oh0asRZdz5l
	YM2F4Rw266fmwBtzqt7bV0viP+WWNXW+O6ynDsjr26Y2/WtItUlva7g5zFBoMShMkac1Q6EZzwWiV
	yFXybs7A==;
Received: from localhost ([::1]:64596 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hdFLA-00028f-Gf; Tue, 18 Jun 2019 14:44:04 +0000
Received: from mail.sernet.de ([2a0a:a3c0:0:25::217:2]:44713) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hdFL6-000285-CC
 for samba-technical@lists.samba.org; Tue, 18 Jun 2019 14:44:02 +0000
Received: from intern.SerNet.DE by mail.SerNet.DE with esmtps (Exim 4.92 #3)
 for samba-technical@lists.samba.org
 id 1hdFL4-0004wj-LS; Tue, 18 Jun 2019 16:43:58 +0200
Received: by intern.sernet.de
 id 1hdFL4-0007hU-IH; Tue, 18 Jun 2019 16:43:58 +0200
Received: from bjacke by pell.sernet.de with local (Exim 4.90_1)
 (envelope-from <bjacke@sernet.de>) id 1hdFL4-0001s0-BV
 for samba-technical@lists.samba.org; Tue, 18 Jun 2019 16:43:58 +0200
Date: Tue, 18 Jun 2019 16:43:58 +0200
To: samba-technical@lists.samba.org
Subject: RFC: deprecate allocation roundup size
Message-ID: <20190618144358.GA6800@sernet.de>
Mail-Followup-To: samba-technical@lists.samba.org
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="wRRV7LY7NUeQGEoC"
Content-Disposition: inline
X-Q: Die Schriftsteller koennen nicht so schnell schreiben, wie die
 Regierungen Kriege machen; denn das Schreiben verlangt Denkarbeit. - Brecht
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
From: =?utf-8?q?Bj=C3=B6rn_JACKE_via_samba-technical?=
 <samba-technical@lists.samba.org>
Reply-To: =?iso-8859-1?Q?Bj=F6rn?= JACKE <bj@SerNet.DE>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>


--wRRV7LY7NUeQGEoC
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

I was debugging a problem with strict allocate =3D yes and our current defa=
ult of
"allocation roundup size", which is 1MB. While I understand that a large
allocation roundup size was supposed to the a performance tuning for old SM=
B1
clients, this has the side effect that with "strict allocate =3D yes" this =
makes
even small files take at least 1MB on the disk, because smbd allocates that
ammount of disk space which is given back by smb_roundup. This is an issue =
for
some setups, because the extra ammount of needed disk space can be huge
actually.

To work around the issue, I tested to remove the smb_roundup in places wher=
ere
disk space allocation is being done so that the allocation roundup size val=
ue
is only used to announce this 1MB "block size" to the clients. I'm not sure=
 if
there can be other negative side effect thought if we announce that large b=
lock
size but behave with the actual space allocation with out normal small block
size.

As this performance trick is not needed for modern SMB clients any more, it
might also be be better idea to just reset the value of "allocation roundup
size" to 4k again, deprecate the option and remove it with one of the next
releases completely to behave more windows standard conforming and to just =
cut
off this source of irritation.

Bj=F6rn

--wRRV7LY7NUeQGEoC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRTh3WYB8ykhrzLAI8xQwafzsNCPwUCXQj4qgAKCRAxQwafzsNC
P/mVAP99s2iuA/tc+9J/xiaBUEBurnZYzXPwUpse7u4qNjhKWQD8Cb/J3VGv49bZ
Uou7ngRVseInqaznsMP0FkQeLnHURgY=
=fCo5
-----END PGP SIGNATURE-----

--wRRV7LY7NUeQGEoC--

