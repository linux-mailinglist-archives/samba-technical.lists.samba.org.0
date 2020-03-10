Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 487B817F4F9
	for <lists+samba-technical@lfdr.de>; Tue, 10 Mar 2020 11:22:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=1RCbp8Qltn/d55cpMaixvOHMLKCBW1UfvXDPY4WdpW8=; b=Rhe55Hv8NKKGuH3ubu0lKUbiCj
	ZopK11NtyJtEuKfbULHoXSVSuOfppK6hqv2KpYyNDzamxaZYvumM+eNG7sZAu0TO0enDf2agKvSyR
	F64tyT2UoeoQ6TLa9Coc4mqIi8U+YXauilHkG/a06R84Gme9d2esiGUOuRqb2gm3OBvhHtBT23gGe
	+ce5qkRg9ZVbru05UlRw5Y55QjWQrYDCBxkyDOvwwQugCBmbR5K7iVCvbo8Wnir9SdPQekFbB7dWb
	zQEBVaDXOp8hSuNrOn6pRAeFsUY6Nvkb1SgZEtGv0LwMYhwMlDUmjPF8G5F44xvdM+tZPxbG+DawJ
	A+7IrEFg==;
Received: from ip6-localhost ([::1]:54128 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jBc1i-00Ff2Z-78; Tue, 10 Mar 2020 10:22:18 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:27402) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jBc1Q-00Fex2-LK; Tue, 10 Mar 2020 10:22:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:To:From:Date:CC;
 bh=1RCbp8Qltn/d55cpMaixvOHMLKCBW1UfvXDPY4WdpW8=; b=ynGukenR35nNfKQCwXGrGERip8
 33SvpRnRPVTumjFgo0A0zdO7EL6MFwGXJltUkgupOXNmgVSCnojG58edmZ5NNuW5z9ss5r7zhl9Vd
 Tkj9Q27vCYnENmCpZgOCmliwli2969Jj/4jnk4IPj65cjXb3XIjwDjjn9TsEKYjFrIE5VBYqIojVg
 uVI6Gudef9/GwRPcBa04cHm31cLvbTfhLT4qtmS0cq8et8RX4JMXyPnknEululDEsQhPJN2lWPkpO
 PadtL/73DyJh0gyfvYbEKuPeuET2rKssZRIRSe6vP5NHo7QyyaqbHq7HUjEp1EVdpzvS2K7ghS/Ne
 vvicv2eusdHxFMu/r038cdirHViQoxIx2QD2gtqKq//5U5llXhg8FViteMKc7w1pYidhGM8eWxy9W
 Amewkiid6R3/3HIN9oA791VPpBZQpzJwIoyjRruxr/AtEesHPlEzkVhOJuBrqbg0bLbjYJYHjBh4I
 Cm/8out3eEjHhA79DJjrrCRh;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1jBc1Q-0006xx-CM; Tue, 10 Mar 2020 10:22:00 +0000
Date: Tue, 10 Mar 2020 11:21:59 +0100
To: samba-announce@lists.samba.org, samba@lists.samba.org,
 samba-technical@lists.samba.org
Subject: [Announce] Samba 4.11.7 Available for Download
Message-ID: <20200310102157.GA27623@carrie2>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="VS++wcV0S1rZb1Fb"
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


--VS++wcV0S1rZb1Fb
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Release Announcements
---------------------

This is the latest stable release of the Samba 4.11 release series.


Changes since 4.11.6:
---------------------

o  Jeremy Allison <jra@samba.org>
   * BUG 14239: s3: lib: nmblib. Clean up and harden nmb packet processing.
   * BUG 14283: s3: VFS: full_audit. Use system session_info if called from=
 a
     temporary share definition.

o  Andrew Bartlett <abartlet@samba.org>
   * BUG 14258: dsdb: Correctly handle memory in objectclass_attrs.
   * BUG 14270: ldb: version 2.0.9, Samba 4.11 and later give incorrect res=
ults
     for SCOPE_ONE searches.

o  Volker Lendecke <vl@samba.org>
   * BUG 14247: auth: Fix CIDs 1458418 and 1458420 Null pointer dereference=
s.
   * BUG 14285: smbd: Handle EINTR from open(2) properly.

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

        https://www.samba.org/samba/history/samba-4.11.7.html

Our Code, Our Bugs, Our Responsibility.
(https://bugzilla.samba.org/)

                        --Enjoy
                        The Samba Team

--VS++wcV0S1rZb1Fb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQQlQWgAwvkyRy78FZYoaL1+KxeTUQUCXmdqQgAKCRAoaL1+KxeT
UcSvAKDIaiZLc1GBcDm9GMkXAC9d81/p8gCeKNswgS9I3wbgYS2Irr9PGh5Tdmc=
=LTLP
-----END PGP SIGNATURE-----

--VS++wcV0S1rZb1Fb--

