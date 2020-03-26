Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id C74E8193BD1
	for <lists+samba-technical@lfdr.de>; Thu, 26 Mar 2020 10:28:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=jYlk4mWkWbW8r6v9y+oyEWWKGMXQXotIjdmQdcxcpxM=; b=kwqW7/T2kxWijWxaSob0MUsVqu
	iqmvAMKJ3asTfTCZ2MUwfc3wjorSiiPayGLCv+LaZUrNzbSr/tn3sK5oPPerlqcGpsxDM4ozUpsaT
	+jSZ7wns35jxg8g6upJzqpafmliR48MMYDqOC0yFZDojUk4NlKxoiIk+j2KySNB7d4WRaZUzhm2gJ
	SwEITyxFBnWHbAq2wbHTxrfG9qBluXYCT9VLpd0GZmijJrI6MwqAR9syWSmALCjKj3HfBLY8AvSii
	Veb/Jc5CL7FRsxz4dtZWMRwdGnK0AFu2uvSYYTbQXFFs1CudEbexRj+euhamMb8BX+7FmX728h0WP
	+8ndGLNQ==;
Received: from localhost ([::1]:64772 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jHOoE-000ldY-Lp; Thu, 26 Mar 2020 09:28:18 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:31186) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jHOo4-000lcr-AJ; Thu, 26 Mar 2020 09:28:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:To:From:Date:CC;
 bh=jYlk4mWkWbW8r6v9y+oyEWWKGMXQXotIjdmQdcxcpxM=; b=taWPqCHmfJJnXcWi2iqSIT3smZ
 W+psZ0vjp34kACsQhWBLT9QBtGURBPh3XCNdcwcVDqKqtueVhfVM4qyJbKYrgAt5Ga72iGrbbZ7Fg
 DUkncnN2You4r/XMO7/x67DQjxh754YXf10hvqlU0iaLZoa9aWGFsEqoBM32jdYxRoBOOQ9l/eThE
 w1X2O2psWJ7QDepwmIISYgbOHgo5lrZf2QJar5rTRvdrATNxj0VUNi17aiXNf1YZlLKFaoRGxbWHv
 EImDBPX4RAHMYRsV9V90WgVBzyrw5wRI3xmvuOXSkiu3taQPB5w/QOBbSpm2yOnrbiXhaB31h3o6t
 Td+AMrjZwlDlenmIwA+PLz/PcrNbAdNbPM4tHsukWN7OTBX+z95uM5KW7k3QCxRHCLDzGaEgMThay
 beYUhUW8knhyt/VKFL18T+V7S1Y49MdP7R86ritHL1QDjyjAAzC+rbJg8PkEWvxAF711xZd2dawBc
 TicxIErsSApVmLi3G2xcrmW+;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1jHOo3-0000bO-R6; Thu, 26 Mar 2020 09:28:08 +0000
Date: Thu, 26 Mar 2020 10:28:06 +0100
To: samba-announce@lists.samba.org, samba@lists.samba.org,
 samba-technical@lists.samba.org
Subject: [Announce] Samba 4.10.14 Available for Download
Message-ID: <20200326092804.GA10920@carrie2>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="5mCyUwZo2JvN/JJP"
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


--5mCyUwZo2JvN/JJP
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Release Announcements
---------------------

This is the last bugfix release of the Samba 4.10 release series. There wil=
l be
security releases only beyond this point.


Changes since 4.10.13
---------------------

o  Jeremy Allison <jra@samba.org>
   * BUG 14239: s3: lib: nmblib. Clean up and harden nmb packet processing.
   * BUG 14283: s3: VFS: full_audit. Use system session_info if called from=
 a
     temporary share definition.

o  Douglas Bagnall <douglas.bagnall@catalyst.net.nz>
   * BUG 20193: nmblib: Avoid undefined behaviour in handle_name_ptrs().

o  Andrew Bartlett <abartlet@samba.org>
   * BUG 14258: dsdb: Correctly handle memory in objectclass_attrs.

o  Volker Lendecke <vl@samba.org>
   * BUG 14247: auth: Fix CID 1458418 Null pointer dereferences (REVERSE_IN=
ULL),
     auth: Fix CID 1458420 Null pointer dereferences (REVERSE_INULL).

o  Stefan Metzmacher <metze@samba.org>
   * BUG 14247: winbind member (source3) fails local SAM auth with empty do=
main
     name.
   * BUG 14265: winbindd: Handling missing idmap in getgrgid().

o  Andreas Schneider <asn@samba.org>
   * BUG 14253: lib:util: Log mkdir error on correct debug levels.
   * BUG 14266: wafsamba: Do not use 'rU' as the 'U' is deprecated in
     Python 3.9.

o  Martin Schwenke <martin@meltin.net>
   * BUG 14274: ctdb-tcp: Make error handling for outbound connection
     consistent.
   * BUG 14295: Starting ctdb node that was powered off hard before results=
 in
     recovery loop.


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

        https://www.samba.org/samba/history/samba-4.10.14.html

Our Code, Our Bugs, Our Responsibility.
(https://bugzilla.samba.org/)

                        --Enjoy
                        The Samba Team

--5mCyUwZo2JvN/JJP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQQlQWgAwvkyRy78FZYoaL1+KxeTUQUCXnx1ogAKCRAoaL1+KxeT
UXOQAJ9AgUnjzZFn5Qv85ljEtSZ5Ob2voACfXjTzz6lCxSJHa6qx4ycf7lIAdvQ=
=K8MN
-----END PGP SIGNATURE-----

--5mCyUwZo2JvN/JJP--

