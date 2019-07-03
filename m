Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 8724C5E35E
	for <lists+samba-technical@lfdr.de>; Wed,  3 Jul 2019 14:01:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=U9y0THSTpGi45feNQOsrqEDcm+HNxtmnU6QAMP1GKRQ=; b=LcQ3ZGgpDRA0ImMv7b//H+WkIO
	a7V2XDhmbqzrh4w0lYrU00tNh9TnOzbGazYgGmJfiYTboMxZYl7Xi2nw+yn1P7EMxg1W2w5+nenyu
	Qva366wAjVooELCJKSbchLhxAVypFISAiaqRQ19KgE486umngES6ExhdXysGn545Pdg3Itklg13iI
	PAaA/eRt0jPethS1XAYWuJNTKzG5bVQQRfctMcbxYoPsyx0RIBSVYNsAXZTO4z2Ktwo1+iXPvMngs
	ba1oQfoqfDs7Vhc1NcCrFAu1s5ZEAK+0Y5SddGdiFoy7AC810mnd+KjddEOFxupRjcrOM4293yjOR
	eqHO/mMg==;
Received: from localhost ([::1]:64220 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hidx4-004sfv-G0; Wed, 03 Jul 2019 12:01:30 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:44304) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hidww-004seu-Gw; Wed, 03 Jul 2019 12:01:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Message-ID:To:From:Date:CC;
 bh=U9y0THSTpGi45feNQOsrqEDcm+HNxtmnU6QAMP1GKRQ=; b=ZHGbX73RUiyaJv2I+HJDK8KpqE
 6de+7YrmKB6QJnAHwHVlzXxxmFnvnWT0MuXxMEKJkEDobZhm4wpjTlPD9b6CfrFgJzW/S5XCuqA+D
 vNKoGlbGWjliSF4hmdHNCnZ/scYpMCSiyXQrhYF6fy4bsKLtIN6U8NfQLwtw5wqqJ5QA=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1hidww-0005X9-74; Wed, 03 Jul 2019 12:01:22 +0000
Date: Wed, 3 Jul 2019 14:01:20 +0200
To: samba-announce@lists.samba.org, samba@lists.samba.org,
 samba-technical@lists.samba.org
Subject: [Announce] Samba 4.9.11 Available for Download
Message-ID: <20190703120118.GA2242@carrie2>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="d6Gm4EdcadzBjdND"
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


--d6Gm4EdcadzBjdND
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
			"Success is not final, failure
			 is not fatal: it is the courage
			 to continue that counts."

			 Winston Churchill
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D


Release Announcements
---------------------

This is the latest stable release of the Samba 4.9 release series.

In yesterday's Samba 4.9.10 release, LDAP_REFERRAL_SCHEME_OPAQUE was added =
to
db_module.h in order to fix bug #12478. Unfortunately, the ldb version was =
not
raised. Samba >=3D 4.9.10 is no longer able to build with ldb 1.4.6. This v=
ersion
includes the new ldb version. Please note that there are just the version b=
umps
in ldb and Samba, no code change. If you don't build Samba with an external=
 ldb
library, you can ignore this release and keep using 4.9.11.


Changes since 4.9.10:
---------------------

o  Stefan Metzmacher <metze@samba.org>
   * BUG 12478: ldb: Release ldb 1.4.7.


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

        https://www.samba.org/samba/history/samba-4.9.11.html

Our Code, Our Bugs, Our Responsibility.
(https://bugzilla.samba.org/)

                        --Enjoy
                        The Samba Team

--d6Gm4EdcadzBjdND
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQQlQWgAwvkyRy78FZYoaL1+KxeTUQUCXRyZDAAKCRAoaL1+KxeT
UYhuAKCHFLHWhdRDzvzWUuqiKJRDpgacZQCfQYZfCJlca3sAE1X+mOqVJ+kmbLs=
=j9rd
-----END PGP SIGNATURE-----

--d6Gm4EdcadzBjdND--

