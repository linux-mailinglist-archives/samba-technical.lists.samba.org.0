Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D485120994
	for <lists+samba-technical@lfdr.de>; Mon, 16 Dec 2019 16:24:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=U7oNQUnIqY1XCjmkpJWesC1tfOJoJsLO1+iu3+XTN0s=; b=BYIGcS6ACsLN6NuMq/rY2Ggb0z
	Agn+l01oO0uL5SkUwn7jXnAJeuJyHVni5zOpF+YBr846YdEvVKAD0JfRZ5KVUE1s3F19SGcYyPFK4
	U7PCIs8LJLSuIjm/+MuE+nI+C92Qyu1iJJC3+Mc+RVGoJ8rrEBI2bQOvibwpgnC3yAxQB/GK/d2Rl
	4roJ4U9ydfoavlgfoQy2md91BKI2HH0UUWFw3IdKR3r2mqYebDhod4rpv0EzJD/7Cygh36R+sXS79
	EENJ8lygLDMvfXpaOjsJU31W5D6lHJa61c8gqjDzG2s7oD442UsupdheZVQhYdtsZGLJw3kRtk1pL
	E7CQExnA==;
Received: from localhost ([::1]:64630 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1igsDi-007PO8-N8; Mon, 16 Dec 2019 15:23:38 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:45810) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1igsDY-007PNR-NE; Mon, 16 Dec 2019 15:23:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:To:From:Date:CC;
 bh=U7oNQUnIqY1XCjmkpJWesC1tfOJoJsLO1+iu3+XTN0s=; b=hSE2Y8jJIYHT/NjVwCPqhXJd2P
 D0qQC/vONaZkCWN0xybIIbHNDc3TrPgH2ZVYEHXsKhNehbZkLJq249HfA7Uf6KIGemAILogxPEZ24
 wKHzkIt+wC3q9a118w1U30Vf3c2LrZhzgbsTp5jPlN2pzNegIO5aFPe79bD2q1iVTsIBZmpuD3yJH
 NK9NVQhJOJQkeCF4fEv7LyaDBFvPWsFo7t1OPbV+6BpVAD/XrsPsG2bU7ivjHDaSHnSSE+Vc7PuMe
 r372huAp48aTMQXo6Hiv+qDCmeAJ994fTl29HnhHsJdkNf5YBYZMiip5LF8FUuNcDU6whEA2cY/t/
 horMlBzPblsTN5XR9MZsOToreb1tvIIlXALPOIcbDe0GrDY3FDkxhqZTqbhGNL5huo+cDmXms4TpT
 3znROaWB/iDRiIfSUBA80AdfM8fs3nwtMVG8voHPL11/HLOyKH38ag2U35bIR+y1nlVM+AHHilT6o
 esEtIGl6Zp2AHumVh6KVXja+;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1igsDY-0007J3-F7; Mon, 16 Dec 2019 15:23:28 +0000
Date: Mon, 16 Dec 2019 16:23:26 +0100
To: samba-announce@lists.samba.org, samba@lists.samba.org,
 samba-technical@lists.samba.org
Subject: [Announce] Samba 4.11.4 Available for Download
Message-ID: <20191216152323.GA6845@carrie2>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="YiEDa0DAkWCtVeE4"
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


--YiEDa0DAkWCtVeE4
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
			"Tell me and I forget.
			 Teach me and I remember.
			 Involve me and I learn."

			 Benjamin Franklin
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D


Release Announcements
---------------------

This is the latest stable release of the Samba 4.11 release series.


Changes since 4.11.3:
---------------------

o  Jeremy Allison <jra@samba.org>
   * BUG 14161: s3: libsmb: Ensure SMB1 cli_qpathinfo2() doesn't return an =
inode
     number.
   * BUG 14174: s3: utils: smbtree. Ensure we don't call cli_RNetShareEnum()
     on an SMB1 connection.
   * BUG 14176: NT_STATUS_ACCESS_DENIED becomes EINVAL when using SMB2 in
     SMBC_opendir_ctx.
   * BUG 14189: s3: smbd: SMB2 - Ensure we use the correct session_id if
     encrypting an interim response.
   * BUG 14205: Prevent smbd crash after invalid SMB1 negprot.

o  Ralph Boehme <slow@samba.org>
   * BUG 13745: s3:printing: Fix %J substition.
   * BUG 13925: s3: Remove now unneeded call to cmdline_messaging_context().
   * BUG 14069: Incomplete conversion of former parametric options.
   * BUG 14070: Fix sync dosmode fallback in async dosmode codepath.
   * BUG 14171: vfs_fruit returns capped resource fork length.

o  Isaac Boukris <iboukris@gmail.com>
   * BUG 14116: libnet_join: Add SPNs for additional-dns-hostnames entries.

o  Volker Lendecke <vl@samba.org>
   * BUG 14211: smbd: Increase a debug level.

o  Stefan Metzmacher <metze@samba.org>
   * BUG 14153: Prevent azure ad connect from reporting discovery errors:
     reference-value-not-ldap-conformant.

o  Christof Schmitt <cs@samba.org>
   * BUG 14179: krb5_plugin: Fix developer build with newer heimdal system
     library.

o  Andreas Schneider <asn@samba.org>
   * BUG 14168: replace: Only link libnsl and libsocket if requrired.

o  Martin Schwenke <martin@meltin.net>
   * BUG 14175: ctdb: Incoming queue can be orphaned causing communication
     breakdown.

o  Uri Simchoni <uri@samba.org>
   * BUG 13846: ldb: Release ldb 2.0.8. Cross-compile will not take
     cross-answers or cross-execute.
   * BUG 13856: heimdal-build: Avoid hard-coded /usr/include/heimdal in
     asn1_compile-generated code.


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

        https://www.samba.org/samba/history/samba-4.11.4.html

Our Code, Our Bugs, Our Responsibility.
(https://bugzilla.samba.org/)

                        --Enjoy
                        The Samba Team

--YiEDa0DAkWCtVeE4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQQlQWgAwvkyRy78FZYoaL1+KxeTUQUCXfehaQAKCRAoaL1+KxeT
UcUuAKDG3M3OvnDjr9u5L44As1jF0GuxTgCfT5+LJ0Gl3UFhtUSmarCp/n3Rh28=
=yFgO
-----END PGP SIGNATURE-----

--YiEDa0DAkWCtVeE4--

