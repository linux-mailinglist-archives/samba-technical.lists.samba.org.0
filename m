Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 0174E3C8402
	for <lists+samba-technical@lfdr.de>; Wed, 14 Jul 2021 13:42:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=MrETce7hRAfxyPKoF3PWbkeHhzqCV03/blDRaZIM918=; b=njoSyQ9isCilyUPYi6Z46lr3n+
	+hnuL8jJQ0tSkch9iEd7vHIerEUoMBr9Y0SiswvcSXL73TH4DlO2mmmlpPOajA709sWE6SCU14zJi
	6A91uYIDQAMc/Tv3pTpQlC7zsmKE3gcP1hg/XNu8LrSmcait8CnazUTM5Tb7KUGcqbGIVoDow7ig4
	b5v2WmZ3p1hczOXnkB9coWo+nRzEPbHGKnYF/KFQTNJ0ywCkTGlhIQhu+R2GKLCjVVXmzVX2ruUNf
	Bz8eSoFmWi62mt9eTwL2c6RnFsWKvLNnx0qfLkHQsRyHbkBLzUskWnpIxoK95c//fcf4hEyPRYyIP
	VVFrZ4sQ==;
Received: from ip6-localhost ([::1]:54416 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1m3dGy-00DM9E-Cq; Wed, 14 Jul 2021 11:41:52 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:20112) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1m3dGl-00DM8F-91; Wed, 14 Jul 2021 11:41:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:To:From:Date:CC;
 bh=MrETce7hRAfxyPKoF3PWbkeHhzqCV03/blDRaZIM918=; b=gkJ61tkYRxqtWT+GyuzmJfME8R
 DMtzBJqOYFw/ZBoYN5q91nK4AS8bCgUAYJg2NVhkObx2nDYD2OkDy8mvgzDrwa7RIdI9AF3PA1V6k
 WoA22+Fx0KRFi4dXR2OstrH3IDrkfE5XdAydLGso9qa4PfRQjLk3SedAD0m98zPj7k/8JLTiBEFps
 w7MX9gzQB20D2BD/8WSdpSD9XQigghp/r7citkBQlQqV1u20jpbA2UI9iWh8ffRWJ/vklwSNqTdpC
 N0cFjwIcZ6VAj85UQShDnnebGzShExczeMrfL0OfvMfwP0vs7JlMollF3EBk9/TDQt5ahgbW+Nu1Z
 YiiOQYge4OKQy+40/wnYwMKGb7FbOUSn9eedRZB2cGox+TAC8OyS9mDUf2RmEO6F5yf46/8VweY61
 KKUQuD6BjsLtMbCyxwKhrbbMUKTl7ZDNKclHAHzPSlIshLUSY48EgNMiDBeiXNU8JA0CxVcEEB/gK
 Yv5r6Kg6+YUuTIEiGm1m4dDD;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1m3dGk-0000Hd-Kd; Wed, 14 Jul 2021 11:41:38 +0000
Date: Wed, 14 Jul 2021 13:41:36 +0200
To: samba-announce@lists.samba.org, samba@lists.samba.org,
 samba-technical@lists.samba.org
Subject: [Announce] Samba 4.13.10 Available for Download
Message-ID: <20210714114134.GA19296@carrie2.fritz.box>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="gBBFr7Ir9EOA20Yy"
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


--gBBFr7Ir9EOA20Yy
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Release Announcements
---------------------

This is the latest stable release of the Samba 4.13 release series.


Changes since 4.13.9
--------------------

o  Jeremy Allison <jra@samba.org>
   * BUG 14708: s3: smbd: Ensure POSIX default ACL is mapped into returned
     Windows ACL for directory handles.
   * BUG 14721: Take a copy to make sure we don't reference free'd memory.
   * BUG 14722: s3: lib: Fix talloc heirarcy error in parent_smb_fname().
   * BUG 14736: s3: smbd: Remove erroneous TALLOC_FREE(smb_fname_parent) in
     change_file_owner_to_parent() error path.

o  Andrew Bartlett <abartlet@samba.org>
   * BUG 14575: samba-tool: Give better error information when the
     'domain backup restore' fails with a duplicate SID.

o  Ralph Boehme <slow@samba.org>
   * BUG 14714: smbd: Correctly initialize close timestamp fields.
   * BUG 14740: Spotlight RPC service doesn't work with vfs_glusterfs.

o  Volker Lendecke <vl@samba.org>
   * BUG 14475: ctdb: Fix a crash in run_proc_signal_handler().

o  Stefan Metzmacher <metze@samba.org>
   * BUG 14750: gensec_krb5: Restore ipv6 support for kpasswd.
   * BUG 14752: smbXsrv_{open,session,tcon}: Protect
     smbXsrv_{open,session,tcon}_global_traverse_fn against invalid records.

o  Joseph Sutton <josephsutton@catalyst.net.nz>
   * BUG 14027: samba-tool domain backup offline doesn't work against bind =
DLZ
     backend.
   * BUG 14669: netcmd: Use next_free_rid() function to calculate a SID for
     restoring a backup.


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
using GnuPG (ID AA99442FB680B620).  The source code can be downloaded
=66rom:

        https://download.samba.org/pub/samba/stable/

The release notes are available online at:

        https://www.samba.org/samba/history/samba-4.13.10.html

Our Code, Our Bugs, Our Responsibility.
(https://bugzilla.samba.org/)

                        --Enjoy
                        The Samba Team

--gBBFr7Ir9EOA20Yy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQQlQWgAwvkyRy78FZYoaL1+KxeTUQUCYO7NagAKCRAoaL1+KxeT
UY0zAJ4phWnpj4GJy7Ug8HkUvDjzPsr4KgCeLVvbnf+Bw6NsV/qoffqYKMLh0+4=
=9+hD
-----END PGP SIGNATURE-----

--gBBFr7Ir9EOA20Yy--

