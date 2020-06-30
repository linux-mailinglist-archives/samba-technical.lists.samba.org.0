Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A6B520F28E
	for <lists+samba-technical@lfdr.de>; Tue, 30 Jun 2020 12:22:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=vO6Nf2nxCESYqS1CvKOErwYFRcCP1j27A6bdWMxKpzk=; b=WOpXoIwZve+syR4qXt/7S62CWf
	BqKOxvnPwYs24YYlXrPQSCnlsI/WrGjk0ZlJYGWtqf2UCUrA0JfDpeQ3htdr1OLaGQU3MMxiyvNx+
	k4f6TUtm/+UC9YRXj9V/+UJXIS3J8c5umzdnxfmmA+ljb4cXSPbYgmYHCXBw6eIgyTdvOE2iB3Zm1
	cTqD9k67SHbXdsNutMjgT1TH/MgEcS99ljDzTjzjvPgY+9XYcr9fuOn3/kWUlqRNQJ/QjYHc1iFmf
	6jIjoTY9AXlJ6SG4gSQuEQH7Ll2ffX87add+iGJOzsJoLOZv7Hpj2ef29jB+CAAD+UxCK4EUPqxW9
	VQw9fB0g==;
Received: from localhost ([::1]:46748 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jqDPB-002fWG-QH; Tue, 30 Jun 2020 10:22:21 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:18324) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jqDOv-002fVZ-2T; Tue, 30 Jun 2020 10:22:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:To:From:Date:CC;
 bh=vO6Nf2nxCESYqS1CvKOErwYFRcCP1j27A6bdWMxKpzk=; b=MFP6b74k6ITWghoWHMxnpqR17S
 kciH9AQwPe1eeDjJ2uZ+bZdmaARG1QFkRofcPqHZizWVKXog5U31zPSy82ZZ65VGNyOrQzeVccVZ8
 LXxIsVheWrw+PKbGS8nUcGOrcB+h7WbKf+CHMxcAByRo//O6VlEn7nIZS3qnDRNIQBZcFyEpvvhsP
 RI/yWstsrZabQ8C2CZOzjSD7xNErnpTIDQUyJ+wqo7q7yP6NpZkuaXiAGsaRPZazz9PvimJvDOnGe
 wcmHE7J1Vj8kVVA5dDPinKCC7HgTKuXgfOYf1bvRVJx3I24NDNo+4+6G7/CmANpacTrAALjHsUXyf
 /M7uuEQvkATwIQ7piINXoRTs/TMhJus14aXkJ+PM96tmpXpEkscIgsrYUlLm6eyjBMvBnl8MC99qC
 yiBzFo6u2LSIpHqEKjsKKxpzXO1ptIisJlFVVXU4awcRlPwHE9ID/SNwy6cZvjiQikv4JkaoNIMxM
 nJkPe6sdYjht+IwLPp5ouPmh;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1jqDOu-00078W-Kd; Tue, 30 Jun 2020 10:22:04 +0000
Date: Tue, 30 Jun 2020 12:22:03 +0200
To: samba-announce@lists.samba.org, samba@lists.samba.org,
 samba-technical@lists.samba.org
Subject: [Announce] Samba 4.11.10 Available for Download
Message-ID: <20200630102201.GA31415@carrie2>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="vkogqOf2sHV7VnPd"
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


--vkogqOf2sHV7VnPd
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Release Announcements
---------------------

This is the latest stable release of the Samba 4.11 release series.


Changes since 4.11.9
--------------------

o  Jeremy Allison <jra@samba.org>
   * BUG 14374: Fix segfault when using SMBC_opendir_ctx() routine for share
     folder that contains incorrect symbols in any file name.

o  Ralph Boehme <slow@samba.org>
   * BUG 14350: vfs_shadow_copy2 doesn't fail case looking in snapdirsevery=
where
     mode.

o  Alexander Bokovoy <ab@samba.org>
   * BUG 14413: ldb_ldap: Fix off-by-one increment in lldb_add_msg_attr.

o  Volker Lendecke <vl@samba.org>
   * BUG 14366: Malicous SMB1 server can crash libsmbclient.
   * BUG 14382: winbindd: Fix a use-after-free when winbind clients exit.

o  Gary Lockyer <gary@catalyst.net.nz>
   * BUG 14330: ldb: Bump version to 2.0.11, LMDB databases can grow without
     bounds.

o  Andreas Schneider <asn@samba.org>
   * BUG 14358: docs-xml: Fix usernames in pam_winbind manpages.
   * BUG 14370: Client tools are not able to read gencache anymore.


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

        https://www.samba.org/samba/history/samba-4.11.10.html

Our Code, Our Bugs, Our Responsibility.
(https://bugzilla.samba.org/)

                        --Enjoy
                        The Samba Team

--vkogqOf2sHV7VnPd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQQlQWgAwvkyRy78FZYoaL1+KxeTUQUCXvsSRQAKCRAoaL1+KxeT
UQ7tAJ9UzeibxrSvmB5VrVvpIJqzRvqWtgCgjkUpBQbmpaEskbOpTVvpKuC+B/4=
=Ft1t
-----END PGP SIGNATURE-----

--vkogqOf2sHV7VnPd--

