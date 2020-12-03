Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id CC8772CD160
	for <lists+samba-technical@lfdr.de>; Thu,  3 Dec 2020 09:39:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=QOxFH7LY9aZUWphUxBN0j6euHZtL7S59VamXGysthfc=; b=inSdXqdK8Y+UzxHf25J+ySTgIO
	jdKj5A9/W96IykZM39oymfLfCrm77sLk0z8gMnSfZLgwxFo4xV1EaMFhkKZA2NVNXinsQrmapdNAD
	Yq4VrH/2a6+q5+S8cbSnJmp26/G/m+HPA8CFnsVIKPoMgR87ttXuljz6kwypeFnU13UBIoK3Shvet
	7R7Wzg/5KT9qAWbYi7xvs3xtHpdu2dQ7vEpzhQqzUxrVrX8+G9EUzWjYrKmHAa2FPfU7t8349FO73
	6WTZlC6w+zOi2i6iI9C/broTfO0WPtmsEr0UXtG3Hd/eynZspHqlPxkSch+tMP3OxDEqNVEbRyF5b
	zM6TPZOw==;
Received: from ip6-localhost ([::1]:57160 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kkk8H-000Gnn-7D; Thu, 03 Dec 2020 08:38:33 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:12138) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kkk85-000Gn7-3l; Thu, 03 Dec 2020 08:38:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:To:From:Date:CC;
 bh=QOxFH7LY9aZUWphUxBN0j6euHZtL7S59VamXGysthfc=; b=IBc+TOCY7r7HM3r5nQWb2bGO7h
 ucjBuIr2glf6zlV7nljPPYbCjfY18bHbKhbX9hKmTkoKIZ+Hv/HWrOVvkSNpzJESS7xqG1/MocSzd
 5nByISm6UtS6bDJJ3z3FX3fS5vJ15yFbvVwMxfthmlomENfOQN6RoxMEXxErVErBM1YnHhEIIWSXf
 HTAsk7PJ4lBvZYvVqrmZl16VjHvIOiCXRQDkZmJAdRi9SBW4/5D/2iBH0WCnBchBT47KcLjjiYWvt
 WKoZNr5FK7Zr5paxNfeAlmsQZSt66gZNO4SNyIRPDtwOjf8PBtoQlAysAQr4dtx2boo279XMtMNqI
 ofTodujflsQDhvxq6mthAaTcfjY8KikzQbTAbJzP0yVJEwLqqT/jFG+hk2p4YTJUpntVCUdXrd9HY
 XkFm5+bqnzircBPZM23hdu5EcwUH4Pg9/gpSi1D+8F0nfxhycD64WZgBZW5ju9CmSjFyUFCbS/wsI
 OkgAGruFseR91U6tozZX8hI+;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1kkk84-0007Kp-EY; Thu, 03 Dec 2020 08:38:20 +0000
Date: Thu, 3 Dec 2020 09:38:18 +0100
To: samba-announce@lists.samba.org, samba@lists.samba.org,
 samba-technical@lists.samba.org
Subject: [Announce] Samba 4.11.17 Available for Download
Message-ID: <20201203083817.GA4828@carrie2.fritz.box>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="LZvS9be/3tNcYl/X"
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
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
From: Karolin Seeger via samba-technical <samba-technical@lists.samba.org>
Reply-To: kseeger@samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>


--LZvS9be/3tNcYl/X
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Release Announcements
---------------------

This is an extraordinary release of the Samba 4.11 release series to fix a
regression introduced with Samba 4.11.16.


Changes since 4.11.16
---------------------

o  Jeremy Allison <jra@samba.org>
   * BUG 14486: s3: vfs_glusterfs: Fix the error in preventing talloc leaks=
 from
     a function.

o  G=C3=BCnther Deschner <gd@samba.org>
   * BUG 14486: s3-vfs_glusterfs: Always disable write-behind translator.

o  Anoop C S <anoopcs@samba.org>
   * BUG 14486: manpages/vfs_glusterfs: Mention silent skipping of write-be=
hind
     translator.


#######################################
Reporting bugs & Development Discussion
#######################################

Please discuss this release on the samba-technical mailing list or by
joining the #samba-technical IRC channel on irc.freenode.net.

If you do report problems then please try to send high quality
feedback. If you don't provide vital information to help us track down
the problem then you will probably be ignored.  All bug reports should
be filed under the Samba 4.1 and newer product in the project's Bugzilla
database (https://bugzilla.samba.org/).


=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=3D=3D Our Code, Our Bugs, Our Responsibility.
=3D=3D The Samba Team
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D



=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Download Details
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

The uncompressed tarballs and patch files have been signed
using GnuPG (ID 6F33915B6568B7EA).  The source code can be downloaded
=66rom:

        https://download.samba.org/pub/samba/stable/

The release notes are available online at:

        https://www.samba.org/samba/history/samba-4.11.17.html

Our Code, Our Bugs, Our Responsibility.
(https://bugzilla.samba.org/)

                        --Enjoy
                        The Samba Team

--LZvS9be/3tNcYl/X
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQQlQWgAwvkyRy78FZYoaL1+KxeTUQUCX8ij9gAKCRAoaL1+KxeT
UWnrAKDBiT4OdN9mLHi3gYVsErSEyN5WiQCgg4wdvYlNz9QMh24lTJl27mkfYqA=
=VPDw
-----END PGP SIGNATURE-----

--LZvS9be/3tNcYl/X--

