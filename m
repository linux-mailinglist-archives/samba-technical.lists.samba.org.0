Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A2969E43D
	for <lists+samba-technical@lfdr.de>; Tue, 27 Aug 2019 11:31:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=sE1s0GaYiq3wRQGMtNHa09NoJMjfaZwvp61bQ6lTZxM=; b=29WB0QE5X/1/VqUb9KUd+nKMmc
	w6wqpdvcwccIB6nN04uvJMYQfOKkRrK4NJ9Xzh+rAioGIMxbUOZXlcN562332yFJwtMnunywxpyX/
	9rLggq4y6vGAv6Zw1DeNSDYTfzTrTrt6pu3u83sbtX5+VIdLGHWAkYpL723VdecOs3DhDgg2YpWsi
	RnMOS53TdIXNPBBaUITivo7nD86XnPvNCKukgxo5LVVmWeykmtB7s3DxllV3pj1h7D5tST+9oqb+W
	hfoUhlJ4M/Vq9nTPNj4hAi0QMG9LBS2dM2JEHo/FjzHv2rZrbc1D2iEDpAvmSNLd6sc9aLLK70fMo
	D5Owu3pA==;
Received: from localhost ([::1]:31738 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1i2XoP-008fLN-0B; Tue, 27 Aug 2019 09:30:49 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:35798) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1i2XoG-008fJx-1B; Tue, 27 Aug 2019 09:30:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Message-ID:To:From:Date:CC;
 bh=sE1s0GaYiq3wRQGMtNHa09NoJMjfaZwvp61bQ6lTZxM=; b=AXHemb+gc/w1jQ8qrO5c3B9Z7L
 DdQYNIDc5YkyJcNGcjDEgTozi4cX8SM6ONUvo2L9BiAKLxO+e1qmy5n2mr/lcCsg9/glKOaUPh/HK
 W3rWUVkm8mTgvQURJQ8qjOb5cAzbdz4LrDpdmQjaYTaAZb9fdEAZQjpIyfSuM5syu9ZQ=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1i2XoF-0008L4-N7; Tue, 27 Aug 2019 09:30:39 +0000
Date: Tue, 27 Aug 2019 11:30:38 +0200
To: samba-announce@lists.samba.org, samba@lists.samba.org,
 samba-technical@lists.samba.org
Subject: [Announce] Samba 4.9.12 Available for Download
Message-ID: <20190827093036.GA10303@carrie2>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="fdj2RfSjLxBAspz7"
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


--fdj2RfSjLxBAspz7
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
			"Predicting rain doesn't count.
			 Building arks does."

			 Warren Buffett
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D


Release Announcements
---------------------

This is the latest stable release of the Samba 4.9 release series.


Changes since 4.9.11:
---------------------

o  Michael Adam <obnox@samba.org>
   * BUG 13972: vfs:glusterfs_fuse: Different Device Id for GlusterFS FUSE =
mount
     is causing data loss in CTDB cluster.
   * BUG 14010: vfs:glusterfs_fuse: Unable to create or rename file/directo=
ry
     inside shares configured with vfs_glusterfs_fuse module.

o  Bj=C3=B6rn Baumbach <bb@sernet.de>
   * BUG 13973: samba-tool: Add 'import samba.drs_utils' to fsmo.py.

o  Tim Beale <timbeale@catalyst.net.nz>
   * BUG 14008: dsdb: Handle DB corner-case where PSO container doesn't exi=
st.
   * BUG 14021: s4/libnet: Fix joining a Windows pre-2008R2 DC.

o  Ralph Boehme <slow@samba.org>
   * BUG 14015: vfs_catia: Pass stat info to synthetic_smb_fname().
   * BUG 14033: Samba 4.9 doesn't build with libtevent 0.9.39.

o  Alexander Bokovoy <ab@samba.org>
   * BUG 14091: lookup_name: Allow own domain lookup when flags =3D=3D 0.

o  Isaac Boukris <iboukris@gmail.com>
   * BUG 11362: Add PrimaryGroupId to group array in DC response.

o  Anoop C S <anoopcs@redhat.com>
   * BUG 14035: vfs_glusterfs: Enable profiling for file system operations.

o  Stefan Metzmacher <metze@samba.org>
   * BUG 13915: DEBUGC and DEBUGADDC doesn't print into a class specific log
     file.=20
   * BUG 13949: Request to keep deprecated option "server schannel", VMWare
     Quickprep requires "auto".
   * BUG 13967: dbcheck: Fallback to the default tombstoneLifetime of 180 d=
ays.
   * BUG 13969: dnsProperty fails to decode values from older Windows versi=
ons.
   * BUG 13973: samba-tool: fsmo transfer is not reliable for the dns relat=
ed
     partitions role transfer.

o  Christof Schmitt <cs@samba.org>
   * BUG 14032: vfs_gpfs: Fix NFSv4 ACL for owner with IDMAP_TYPE_BOTH.

o  Rafael David Tinoco <rafaeldtinoco@ubuntu.com>
   * BUG 14017: ctdb-config: Depend on /etc/ctdb/nodes file.


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

        https://www.samba.org/samba/history/samba-4.9.12.html

Our Code, Our Bugs, Our Responsibility.
(https://bugzilla.samba.org/)

                        --Enjoy
                        The Samba Team

--fdj2RfSjLxBAspz7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQQlQWgAwvkyRy78FZYoaL1+KxeTUQUCXWT4OQAKCRAoaL1+KxeT
UUfmAJ9HxhENagQQuyMUKQUIptRybDY4fQCeIdOCfGmm9TmBJmicqHovkv6blc4=
=kuDE
-----END PGP SIGNATURE-----

--fdj2RfSjLxBAspz7--

