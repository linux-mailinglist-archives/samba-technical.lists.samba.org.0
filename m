Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::443:1])
	by mail.lfdr.de (Postfix) with ESMTPS id 27CC71C34A
	for <lists+samba-technical@lfdr.de>; Tue, 14 May 2019 08:32:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=Qvwo7b72NFSRcSgJLvGnQLcVWAGus2XCewxMq9t7FDg=; b=YIC1OLVC7qRWNGtyjKUr5rOQ/L
	bTQEy/xAtjQ5fkhoXIGf+VDHUV++DMnYgAdwCB68flbOnUcskwcQm0P6b7LlBr7UqGtCxWxF4yO6Z
	1vDvZvr6ABD2A11b3eL/ioKFwxCpewK4cS6jXc3B58/aDeCEjR0eOXBRJYWzRN3eAifQcoAagIMrP
	6AtSH31XNcQGDZbL7VKk4peo7HycacabAKX19RYEVIRYltox1cPYhjeUfYi+X5DPZoUSSj97wCfy0
	TCAfqzVVXCc4USeiG/4tacLBk+izLxSDn3PZxhiI34iXBX8A88D5MOb4bre2O/e7ueTBlzWV7OtHN
	iAolYVlg==;
Received: from localhost ([::1]:61708 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hQQz0-003S2B-S3; Tue, 14 May 2019 06:32:15 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::147:1]:23986) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hQQyB-003S1K-97; Tue, 14 May 2019 06:31:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Message-ID:To:From:Date:CC;
 bh=Qvwo7b72NFSRcSgJLvGnQLcVWAGus2XCewxMq9t7FDg=; b=bXtOU+2xwyFnwJ8P+cb5WkYRLZ
 mDTyHGhnEPeLA454zy0h6iw5LL/RLWXh4S/3aujuEd18rVL4F8XFalzivhDmBdYdHZTTl/LRM29RQ
 k7ZF8V3v+wdozC5SAIK9sEvo68eW86O6vcxERaRgTft6LGZlrXk+PMaAoH0JNltg2JDU=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1hQQyA-0002FG-Lf; Tue, 14 May 2019 06:31:22 +0000
Date: Tue, 14 May 2019 08:31:20 +0200
To: samba-announce@lists.samba.org, samba@lists.samba.org,
 samba-technical@lists.samba.org
Subject: [Announce] Samba 4.10.3, 4.9.8 and 4.8.12 Security Releases Available
Message-ID: <20190514063117.GA5913@carrie2>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="LQksG6bCIzRHxTLp"
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
X-BeenThere: samba-technical@lists.samba.org
X-Mailman-Version: 2.1.23
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


--LQksG6bCIzRHxTLp
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Release Announcements
---------------------

These are a security releases in order to address the following defect:

o  CVE-2018-16860 (Samba AD DC S4U2Self/S4U2Proxy unkeyed checksum)


=3D=3D=3D=3D=3D=3D=3D
Details
=3D=3D=3D=3D=3D=3D=3D

o  CVE-2018-16860:
   The checksum validation in the S4U2Self handler in the embedded Heimdal =
KDC
   did not first confirm that the checksum was keyed, allowing replacement =
of
   the requested target (client) principal.

For more details and workarounds, please refer to the security advisory.


Changes:
--------

o  Isaac Boukris <iboukris@gmail.com>=20
   * BUG 13685: CVE-2018-16860: Heimdal KDC: Reject PA-S4U2Self with unkeyed
     checksum.


#######################################
Reporting bugs & Development Discussion
#######################################

Please discuss this release on the samba-technical mailing list or by
joining the #samba-technical IRC channel on irc.freenode.net.

If you do report problems then please try to send high quality
feedback. If you don't provide vital information to help us track down
the problem then you will probably be ignored.  All bug reports should
be filed under the "Samba 4.1 and newer" product in the project's Bugzilla
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

        https://www.samba.org/samba/history/samba-4.10.3.html
        https://www.samba.org/samba/history/samba-4.9.8.html
        https://www.samba.org/samba/history/samba-4.8.12.html

Our Code, Our Bugs, Our Responsibility.
(https://bugzilla.samba.org/)

                        --Enjoy
                        The Samba Team

--LQksG6bCIzRHxTLp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQQlQWgAwvkyRy78FZYoaL1+KxeTUQUCXNpgsgAKCRAoaL1+KxeT
Ub/AAKCTzyGoybMVpEJqseL9ed38xvvSAQCeO8ICJTAJiGwNXl7F/I+uErvejN8=
=XLOz
-----END PGP SIGNATURE-----

--LQksG6bCIzRHxTLp--

