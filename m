Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id DC712285A92
	for <lists+samba-technical@lfdr.de>; Wed,  7 Oct 2020 10:35:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=SDUtwFhqfCurmcwrTXccku/LRx1kD1ijMyQRsBsY7Yg=; b=M/lYK0jFKOzUwu53qHY2bccI8Z
	iSnwUSqhvYuiSiO/TFH0CpZI9vXhSpWe1L1XXEJVEh1eqcSIMd4DZcsQAGN+V3jmcxAhtuzklvwFp
	mL66LyFMdfNOcd9MpV0NlQABcU/7LfthE4RemUTxtJwkxB+2sVDixcPx2CLfqQaOyVdxJDN6lrrq5
	Ej/r9GwR+pohy9iO7wMq6rVa3hjCGphYmaFw8oOAiL7m8BZ01t5EbBZR0gSpqbHhYXc+SfEVy5wGx
	4quQCvjoSikEDIccldZD1v8k3Wk5qlFgWOClhhoblphcWXvqaFACuKDYQ1wZsq0Jop4YuwDJ9ygLq
	kj3FMC5Q==;
Received: from ip6-localhost ([::1]:31388 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kQ4tr-00B58s-3i; Wed, 07 Oct 2020 08:34:15 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:27428) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kQ4te-00B58B-Im; Wed, 07 Oct 2020 08:34:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:To:From:Date:CC;
 bh=SDUtwFhqfCurmcwrTXccku/LRx1kD1ijMyQRsBsY7Yg=; b=n9WeswfRg+Ag+lGd0/VFo+Eqis
 ZRKuJ4QDN1Ta/5WYK6U6iUwCxA3NlXXTnCi+KvKTnwGsudDrNV81tz7R/AE7FavKHbmLwJSp66A0B
 QII1VQwtiHMmEmj16pXzzbUaIdpac23Wn66YaYye9GyvJnvL7V1B3KPwM78coMGYfVWC8VE3fioQQ
 DJrAebN2/I0xXGLyf9jyKQN283zwsWnrWVAHo1R/59ssPTvCfnuIXEJkSmo4YlerEtNMBBK4dGjqy
 kJxKK2ZiTBp5lNmTY1B5oKNKd+OwZgbChaypJyDdJEQnJGssM1actizzPcKZTzLpCTshBnYDJhs1C
 /Sb/PL86Aq3iNFcf8uoMkBjT/Bqz6Unw25kY8gbnUL7nD6qjG7/rWiQey7NP5iC3+gsp4m2xXHpM3
 M5JeTlAttOnpkHxv18QfgfE/MfXzgs1BDAoX0DZTxxhlNpFh1ZaLSUd1P/7HGpgWPSA8oRIKC+WHk
 3DusuWKhoi2+cwV9pFCC7Nxs;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1kQ4td-0001lh-T4; Wed, 07 Oct 2020 08:34:01 +0000
Date: Wed, 7 Oct 2020 10:34:00 +0200
To: samba-announce@lists.samba.org, samba@lists.samba.org,
 samba-technical@lists.samba.org
Subject: [Announce] Samba 4.12.8 Available for Download
Message-ID: <20201007083358.GA23519@carrie2>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="huq684BweRXVnRxX"
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


--huq684BweRXVnRxX
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Release Announcements
---------------------

This is the latest stable release of the Samba 4.12 release series.


Changes since 4.12.7
--------------------

o  G=C3=BCnther Deschner <gd@samba.org>
   * BUG 14318: docs: Add missing winexe manpage.

o  Volker Lendecke <vl@samba.org>
   * BUG 14465: idmap_ad does not deal properly with a RFC4511 section 4.4.1
     response.

o  Laurent Menase <laurent.menase@hpe.com>
   * BUG 14388: winbind: Fix a memleak.

o  Stefan Metzmacher <metze@samba.org>
   * BUG 14465: idmap_ad does not deal properly with a RFC4511 section 4.4.1
     response.
   * BUG 14482: Compilation of heimdal tree fails if libbsd is not installe=
d.

o  Christof Schmitt <cs@samba.org>
   * BUG 14166: util: Allow symlinks in directory_create_or_exist.

o  Andreas Schneider <asn@samba.org>
   * BUG 14399: waf: Only use gnutls_aead_cipher_encryptv2() for GnuTLS >
     3.6.14.
   * BUG 14467: s3:smbd: Fix %U substitutions if it contains a domain name.

o  Martin Schwenke <martin@meltin.net>
   * BUG 14466: ctdb disable/enable can fail due to race condition.


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

        https://www.samba.org/samba/history/samba-4.12.8.html

Our Code, Our Bugs, Our Responsibility.
(https://bugzilla.samba.org/)

                        --Enjoy
                        The Samba Team

--huq684BweRXVnRxX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQQlQWgAwvkyRy78FZYoaL1+KxeTUQUCX319cwAKCRAoaL1+KxeT
UWfrAJ9pmLCPJwIPB4TlAJs+0t6u6swpUgCgsLIPL+I3LkNwFAt1/peINlhKn1w=
=Yq22
-----END PGP SIGNATURE-----

--huq684BweRXVnRxX--

