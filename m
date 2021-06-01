Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B46CA396E5A
	for <lists+samba-technical@lfdr.de>; Tue,  1 Jun 2021 09:56:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=WV0iwhesCO4vFCpGmkut2Nr54gTBg2lPEC8OKNNVXwM=; b=d+pNzE47WVXLpuzs+zsIYmUFO8
	HM0AFHCP4DgtTGAR6Yy22ts3Hyascm3+ySS69d+GOYRI3K2omlUUyPYMBSleyUBZx06IRxRVv24ZH
	2tAKYGg2/ZByaVqzRTVbepwADo+yHsoiokJkJw7wJ9KJ7qOPCGCrH4zgUlAQoYTxQReNiTOV1z173
	kDVbZJmL5anfPIo386MjK4/EjOi9GEO34sR6VruPL6hpqz2VImXRpTPnYG9kk4HZZiHHziXJUU76x
	3i1idYtoAhuCg7q5B4Y9bfeJ67WEL81IMjKXyX1gR7hDhTXQdwxJ1lD34CmR2QCwVg1tIBYlZORpg
	l0lQ65uw==;
Received: from ip6-localhost ([::1]:41922 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lnzFU-0028Ra-Gu; Tue, 01 Jun 2021 07:55:40 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:44742) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lnzF0-0028QJ-Np; Tue, 01 Jun 2021 07:55:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:To:From:Date:CC;
 bh=WV0iwhesCO4vFCpGmkut2Nr54gTBg2lPEC8OKNNVXwM=; b=1dFbqakqiYjUwbgrGJOPxmKP0b
 sXZOtE7/hwgzwjHkTQljnpPZgdClOmaqX2lkOosjfT/58qXIeg28aRcGT+l9R9UtmfJwgAnvXi/0q
 CKuIvAx2KLBGziW3pKdWFaKee+lmwgtwXltoooV7J8EnVLwMCWcCDD1rynod0ierfaFQzgc4MWSoW
 Vx8HdAjgCYzYuHcp9LWn1lLfU2VZgGiVTmCah5UeTqhbWMFOpwgjiw4LKLb98aEAtXeO6x+pD/hdY
 oCpKhN6/BFg93+FaBpboz3OwqwC/E/w46CZSin3zC6rjnAYRsF+mgOeUApT2pKikuvyguqdcZ/oX8
 kBiEPr34ElZHuCu+/EArQAyIu06ihnMPmDM3nhhmAlU+CjikVOTytIgwgp2HJWP7kkBRau6CK0uru
 591iyYpefB9foFI8umnh2BTXL8mNAMnNNv3Gdn9STps61925HXEXfKmW/DJEw9UvGI4Thi39o/8/l
 WN5Ik3WA2H/pyhjWR9/aTxAz;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1lnzF0-00016X-4O; Tue, 01 Jun 2021 07:55:10 +0000
Date: Tue, 1 Jun 2021 09:55:07 +0200
To: samba-announce@lists.samba.org, samba@lists.samba.org,
 samba-technical@lists.samba.org
Subject: [Announce] Samba 4.14.5 Available for Download
Message-ID: <20210601075505.GA13108@carrie2.fritz.box>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="oyUTqETQ0mS9luUI"
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


--oyUTqETQ0mS9luUI
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Release Announcements
---------------------

This is the latest stable release of the Samba 4.14 release series.


Changes since 4.14.4
--------------------

o  Jeremy Allison <jra@samba.org>
   * BUG 14696: s3: smbd: SMB1 SMBsplwr doesn't send a reply packet on succ=
ess.
   * BUG 14708: s3: smbd: Ensure POSIX default ACL is mapped into returned
     Windows ACL for directory handles.
   * BUG 14721: s3: smbd: Fix uninitialized memory read in
     process_symlink_open() when used with vfs_shadow_copy2().

o  Andrew Bartlett <abartlet@samba.org>
   * BUG 14689: docs: Expand the "log level" docs on audit logging.

o  Ralph Boehme <slow@samba.org>
   * BUG 14714: smbd: Correctly initialize close timestamp fields.

o  G=C3=BCnther Deschner <gd@samba.org>
   * BUG 14699: Fix gcc11 compiler issues.

o  Pavel Filipensk=C3=BD <pfilipen@redhat.com>
   * BUG 14718: docs-xml: Update smbcacls manpage.
   * BUG 14719: docs: Update list of available commands in rpcclient.

o  Volker Lendecke <vl@samba.org>
   * BUG 14475: ctdb: Fix a crash in run_proc_signal_handler().

o  Andreas Schneider <asn@samba.org>
   * BUG 14695: s3:winbind: For 'security =3D ADS' require realm/workgroup =
to be
     set.
   * BUG 14699: lib:replace: Do not build strndup test with gcc 11 or newer.


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

        https://www.samba.org/samba/history/samba-4.14.5.html

Our Code, Our Bugs, Our Responsibility.
(https://bugzilla.samba.org/)

                        --Enjoy
                        The Samba Team

--oyUTqETQ0mS9luUI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQQlQWgAwvkyRy78FZYoaL1+KxeTUQUCYLXn1wAKCRAoaL1+KxeT
UV79AKCm0P3ZFGzGmeN6/gVlcCFxBXiSqwCgs9Pq8JQP+K5bJM724pGVK2uQdJU=
=gpMt
-----END PGP SIGNATURE-----

--oyUTqETQ0mS9luUI--

