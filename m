Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 3308C3A7B6B
	for <lists+samba-technical@lfdr.de>; Tue, 15 Jun 2021 12:09:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=1x2BYH2HO6f9LEvJzIwh1Kk2ooeEiExeyKaRgJSCTTE=; b=AkxAtkmSIrOKSSOdRi4xKct1xL
	iL0erBjUW/IDFsKkbNPHr/NgHs6ePagR37AzF0for2sLzEl+xY8U7qpGzLRMAkpBGHvUBxc43Cptc
	2rvBQ1IcGD9lH6lD7UgU36eI/gyNHh5ox3VrUF1dC+Vwg8c6N/CDjqEKFs8k0V1RUCzghicbm6gq6
	60WRFJOaf6n1hmI4sGvoH/W82rq4t/QS9q9TxcXzJ30rHbaI/6TWuFKbwqELzwqFvwQVDhIcEjvvR
	rVXaDqYcIdcNHJLtbLCLd2Que3eG55NCmD8tDNluf/R0vyGKI6ayWBwsVb+644RB7u/+xRMEgvAtu
	8P9R+1yg==;
Received: from ip6-localhost ([::1]:52834 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lt5z3-005dBU-3m; Tue, 15 Jun 2021 10:07:49 +0000
Received: from mail.univention.de ([82.198.197.8]:9916) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1lt5yx-005dBL-Mz
 for samba-technical@lists.samba.org; Tue, 15 Jun 2021 10:07:46 +0000
Received: from localhost (localhost [127.0.0.1])
 by solig.knut.univention.de (Postfix) with ESMTP id 54DB3137368B6
 for <samba-technical@lists.samba.org>; Tue, 15 Jun 2021 12:07:40 +0200 (CEST)
Received: from mail.univention.de ([127.0.0.1])
 by localhost (solig.knut.univention.de [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OskJYH-gKRTj; Tue, 15 Jun 2021 12:07:38 +0200 (CEST)
Received: from braeda.localnet (p4fc05d0e.dip0.t-ipconnect.de [79.192.93.14])
 by solig.knut.univention.de (Postfix) with ESMTPSA id 2A1D613736864; 
 Tue, 15 Jun 2021 12:07:28 +0200 (CEST)
To: samba-technical@lists.samba.org
Subject: Re: migrate-samldb-from-tdb-to-mdb
Date: Tue, 15 Jun 2021 12:07:22 +0200
Message-ID: <6313078.2iPT33SAM4@braeda>
In-Reply-To: <13407703.MucGe3eQFb@braeda>
References: <13407703.MucGe3eQFb@braeda>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart4570979.KiezcSG77Q";
 micalg="pgp-sha256"; protocol="application/pgp-signature"
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
From: Arvid Requate via samba-technical <samba-technical@lists.samba.org>
Reply-To: Arvid Requate <requate@univention.de>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

--nextPart4570979.KiezcSG77Q
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Hi,

I've clean up the script a bit, defaulted to Python 3 and created a PR:

https://gitlab.com/samba-team/samba/-/merge_requests/2016

Cheers,
Arvid


On Montag, 14. Juni 2021 22:04:13 CEST Arvid Requate via samba-technical=20
wrote:
> Hi,
>=20
> I've written a small script to convert the sam.ldb database backend of a
> Samba/AD DC from TDB to LMDB. It just uses python-tdb and python-lmdb and
> treats the key/value content uninterpreted as blobs. Maybe it's a useful
> addition to the repository section example/scripts or I could turn it int=
o a
> subcommand of samba-tool, if anybody thinks that's a good idea.
>=20
> Cheers,
> Arvid


=2D-=20
Arvid Requate
Open Source Software Engineer

Univention GmbH
be open.
Mary-Somerville-Str.1
28359 Bremen
Tel. : +49 421 22232-52
=46ax : +49 421 22232-99

Gesch=C3=A4ftsf=C3=BChrer: Peter H. Ganten
HRB 20755 Amtsgericht Bremen
Steuer-Nr.: 71-597-02876
--nextPart4570979.KiezcSG77Q
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEzxtmXi4eIVe2j2uTH9EoIGRGfO4FAmDIe9oACgkQH9EoIGRG
fO7DLBAAjI/KFzw95vbmaG9MFG+6aELEi2b8a7BmVgEotcawuU9y9ZBhBwRE9b3o
QGLZ0t3YD+AEDNCTDnQkrwuvWZHTz9vZBz9JOYSk1oC6XfjwMdTrVLbheFI5ujg0
V3lvrDKTKXfk51cpetI0qb9VzCi4SpB6ESX1T1vByJBDTp1CfDlxWya9/W0BE/8p
8oXDBXFyFoMaVmVzYoO3bY4hathydDwZK0JMPzsPr11ohUkzRjAUdaunw+o3ArCm
Ak79ID7axKGx+H7WuwOnPowqFl8DAqeEcThhUmyqdE0qF+lXa8Cc+UpbXTbPAx18
mcAFytUjQUoSXVfMxL6Gq6BX7c9vY2cGhN7OCvhjuZzEGoxCHFuJeZ65zHkcK80Z
KtHWjx+OXitrHkNo/prPkuGauRFu1+Iw3C9jJkNMAPdSbKpVGwhsUR8HcK/a8ZXm
ieQujO3NNhrrQjlzyQfX8vkEqVYvc3y6sl9pbJjED8yaThOhvvrjrMSUBStx++Dh
5zlBGzzDeXQz0MYM5lCXGGJc8Es8RYLzXsIarrs59W5iHskug84AzRBtFQ62XANm
YeuH2SHxrX54SldkzL4pbPgL6hvwQnSy6YMirEdyRMIrNb4QqlhPrjWfTUtOku1r
e9HzZ4kg+RXpWa1+zTfLojzrb8gz87WlTib6AHkZIMcqf7FNkG0=
=qigl
-----END PGP SIGNATURE-----

--nextPart4570979.KiezcSG77Q--




