Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B6B3733721F
	for <lists+samba-technical@lfdr.de>; Thu, 11 Mar 2021 13:11:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=I30GCCkQj7v7vreDVR7uS2XL3QPl9IsObojVhz9dhvI=; b=4hRPOHHYZ2VWnGwOChqe6mrajd
	sP6bXcFDqAsWm+B8elDvkF57gqS6jgKdvLRI9vkdFoZi5Rler+UC8ej46/OA+D+4XD48OmYrWZ9zu
	1DNvZs7DyCtoO2SbHq6Jx4cNM+LeCw3pZhFMENyTKnZrBjaMtL+ppWEXgV5LWZ1+q9S/E3B5kBsLG
	8UteVszXkAdZ7QLZBNPRPz47/ybGdzkuHC/xC52DltlvTdB3v4s9varPtzbctAbMCKwN5J9oQlffb
	R0QOVFzNO/2KGhVdv9kZSPZfWxsjzlvmjTwXpH8Hj1l22mytYYj88Ys1rLl2IrR6Y0HsE9fxQzd0c
	OD0kJLuA==;
Received: from ip6-localhost ([::1]:39694 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lKK9m-004ue5-3A; Thu, 11 Mar 2021 12:11:10 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:15436) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lKK9W-004udM-7V; Thu, 11 Mar 2021 12:11:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:To:From:Date:CC;
 bh=I30GCCkQj7v7vreDVR7uS2XL3QPl9IsObojVhz9dhvI=; b=qXBo6doT5g0WXA0h4oy4UKGFQD
 2iBEmO9n9gBvtIhDHMfjt1ZqQkazZQetUh8fru/nDin/acRizIQKFSzTqFaX5GqYa1DTCdALBt6zB
 NOv8MO+2L8e8iDBskGPWBwPL/n4bdnOPdcJhhhQOBo7Ah5c0Cob1r/q5zP4PusjrAMt1uZfWC0+A1
 APdGtjsLdkPIoZLEZGyej7bkZ9kiHso+SmgNEVuQ16gw0BYRsaDqsAVcDWLrCyUqGoCRYiMS83M5O
 oMmFPdBK4CnlYLrweI9LDuwRNhazv/pm6YPUpH8KI6TP/5Rg8TxwzGI9od7ErTeM+WasIXbY4hK8D
 b7unm7OSB64z1WZhOLVKJTU7eC3DxJvdd0vrXd/AzKOmRfR75XFRWNWJpkYqspGtWCzNmnOJuRaiU
 etgKmaLht+mFB8h0vkeUjLxjJMRyyFLbWqrRCk/dwHYpqDTKTO3uJW4ylwqNfAXS7tje8IS5rGY4/
 QvRuYeP2FirhQwKoTDy+ji3V;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1lKK9L-0002j3-J2; Thu, 11 Mar 2021 12:10:43 +0000
Date: Thu, 11 Mar 2021 13:10:36 +0100
To: samba-announce@lists.samba.org, samba@lists.samba.org,
 samba-technical@lists.samba.org
Subject: [Announce] Samba 4.12.12 Available for Download
Message-ID: <20210311121029.GA17347@carrie2.fritz.box>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="xHFwDpU9dbj6ez1V"
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


--xHFwDpU9dbj6ez1V
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Release Announcements
---------------------

This is the latest stable release of the Samba 4.12 release series.
Please note that this will be the last bugfix release of the Samba 4.12 rel=
ease
series. There will be Security Releases only beyond this point.


New GPG key                                                                =
    =20
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D                                          =
                          =20
                                                                           =
    =20
The GPG release key for Samba releases changed from:                       =
    =20
                                                                           =
    =20
pub   dsa1024/6F33915B6568B7EA 2007-02-04 [SC] [expires: 2021-02-05]       =
    =20
      Key fingerprint =3D 52FB C0B8 6D95 4B08 4332  4CDC 6F33 915B 6568 B7E=
A     =20
uid                 [  full  ] Samba Distribution Verification Key <samba-b=
ugs@samba.org>
sub   elg2048/9C6ED163DA6DFB44 2007-02-04 [E] [expires: 2021-02-05]        =
    =20
                                                                           =
    =20
to the following new key:                                                  =
    =20
                                                                           =
    =20
pub   rsa4096/AA99442FB680B620 2020-12-21 [SC] [expires: 2022-12-21]       =
    =20
      Key fingerprint =3D 81F5 E283 2BD2 545A 1897  B713 AA99 442F B680 B62=
0     =20
uid                 [ultimate] Samba Distribution Verification Key <samba-b=
ugs@samba.org>
sub   rsa4096/97EF9386FBFD4002 2020-12-21 [E] [expires: 2022-12-21]        =
    =20
                                                                           =
    =20
Starting from Jan 21th 2021, all Samba releases will be signed with the new=
 key.
                                                                           =
    =20
See also GPG_AA99442FB680B620_replaces_6F33915B6568B7EA.txt


Changes since 4.12.11
---------------------

o  Trever L. Adams <trever.adams@gmail.com>
   * BUG 14634: s3:modules:vfs_virusfilter: Recent talloc changes cause inf=
inite
     start-up failure.

o  Jeremy Allison <jra@samba.org>
   * BUG 13992: SAMBA RPC share error.
   * BUG 14612: s3: smbd: Add call to conn_setup_case_options() to
     create_conn_struct_as_root().

o  Ralph Boehme <slow@samba.org>
   * BUG 14602: s3/auth: Implement "winbind:ignore domains".
   * BUG 14612: build: Remove smbd_conn private library.

o  Peter Eriksson <pen@lysator.liu.se>
   * BUG 14648: s3: VFS: nfs4_acls. Add missing TALLOC_FREE(frame) in error
     path.

o  Bj=C3=B6rn Jacke <bj@sernet.de>
   * BUG 14624: classicupgrade: Treat old never expires value right.

o  Volker Lendecke <vl@samba.org>
   * BUG 1463: g_lock: Fix uninitalized variable reads.

o  Stefan Metzmacher <metze@samba.org>
   * BUG 13898: s3:pysmbd: Fix fd leak in py_smbd_create_file().
   * BUG 14607: Work around special SMB2 IOCTL response behavior of NetApp
     Ontap 7.3.7.

o  Andreas Schneider <asn@samba.org>
   * BUG 14625: Fix smbd share mode double free crash.

o  Paul Wise <pabs3@bonedaddy.net>
   * BUG 12505: HEIMDAL: krb5_storage_free(NULL) should work.


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

        https://www.samba.org/samba/history/samba-4.12.12.html

Our Code, Our Bugs, Our Responsibility.
(https://bugzilla.samba.org/)

                        --Enjoy
                        The Samba Team

--xHFwDpU9dbj6ez1V
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQQlQWgAwvkyRy78FZYoaL1+KxeTUQUCYEoIsgAKCRAoaL1+KxeT
UUzmAJ9qUrzH5lIhXj3JT7ft0xk1Paj3GgCeJCH12hwdrAbDMbnHHk85GTpu/s8=
=7CJK
-----END PGP SIGNATURE-----

--xHFwDpU9dbj6ez1V--

