Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E1532A7B6F
	for <lists+samba-technical@lfdr.de>; Thu,  5 Nov 2020 11:12:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=IrcmqWd/pw/NHbRr5EMePiI/3xMiATYGi8OgozCT60w=; b=Tz1wd2DN+Sw1UqBIqtukB4DvQn
	zNkQGg3uzQwOIz8d+EmkWMg+ffpEU5aQgY6NJrpOFMc4tubRGnxSvhBnQVgTlY7JLSe2JJE98e7Db
	bif7xVVwrAqxO0Z2b9CGitqSobKNueder2DblVpIhQrGuC/b24wUvwn+t4jViYLK3t+0ZAHJrVNKb
	CSAHTaaGMzPrFw2FiaKgdvb6uqnHipI+TyV77czw5BfS55ZiRiEXUQQ7LVJe1g/cDEFRn9iIPCCNl
	wEZA6pJ0pz9Vhf/v0BhvoM5FaTm5TGVkBTFglbyBj4ejmcKOX+QkdGU9FKrGGLFxzWlXEg9sZ3T9Y
	LahXDdSg==;
Received: from ip6-localhost ([::1]:46460 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kacEz-00HadC-68; Thu, 05 Nov 2020 10:11:37 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:40748) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kacEn-00HacV-Vl; Thu, 05 Nov 2020 10:11:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:To:From:Date:CC;
 bh=IrcmqWd/pw/NHbRr5EMePiI/3xMiATYGi8OgozCT60w=; b=VcUcUs0QQaNjELUmRK0qxo6Ifk
 9liQA1yL57pNxy00nyWRzYKIFg1v0kg6rcl1QXl4evSftjh95HBcuYwVm7j0AGrBGC0dRf5Ye9Lle
 ykzr/0jMKaNEGl1MMwHmM+IKrqt6KMvHYhKWCY6BtlNuEKNTmUHkz7kjC4gUXf2N8cT6hI4n+uWkN
 IYg/AAr6JaAZlk2kNin/BsqoOxeHjpb1LIQr9qESF3kEJHG/1ibaS8ZBwGc9InDZICv5UpIOU5NTC
 KIDB+2WNTDtgVHrE9zaLOIdhSvY2QPc28w1Gg3D7Is4Pxmb5YNxkOaJIvuZa8HM7xowEQlFT3Ps+9
 gHLVM62wdXL4aTqyixgOB/CcgjLtfE+tmHK4pA55an1++TBIInaV3ZaFUJdGG0i0eDY1fg17kW4yr
 EwKF9AQ+8qpyQbNW5w7G2B6iKlqjmlCLfYqxNK6okJ7dF1dGEf8PI7RwIkesbti9bj3r0zYwY8rnU
 SiuSoi0tWlkWC0NG8cyIajA+;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1kacEn-0001Xv-Cq; Thu, 05 Nov 2020 10:11:25 +0000
Date: Thu, 5 Nov 2020 11:11:22 +0100
To: samba-announce@lists.samba.org, samba@lists.samba.org,
 samba-technical@lists.samba.org
Subject: [Announce] Samba 4.12.10 Available for Download
Message-ID: <20201105101120.GA15186@carrie2.fritz.box>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="Qxx1br4bt0+wmkIi"
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


--Qxx1br4bt0+wmkIi
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Release Announcements
---------------------

This is the latest stable release of the Samba 4.12 release series.

Major enhancements include:

  o BUG 14537: ctdb-common: Avoid aliasing errors during code optimization.
  o BUG 14486: vfs_glusterfs: Avoid data corruption with the write-behind
               translator.


=3D=3D=3D=3D=3D=3D=3D
Details
=3D=3D=3D=3D=3D=3D=3D

The GlusterFS write-behind performance translator, when used with Samba, co=
uld
be a source of data corruption. The translator, while processing a write ca=
ll,
immediately returns success but continues writing the data to the server in=
 the
background. This can cause data corruption when two clients relying on Samb=
a to
provide data consistency are operating on the same file.

The write-behind translator is enabled by default on GlusterFS.
The vfs_glusterfs plugin will check for the presence of the translator and
refuse to connect if detected. Please disable the write-behind translator f=
or
the GlusterFS volume to allow the plugin to connect to the volume.


Changes since 4.12.9
--------------------

o  Jeremy Allison <jra@samba.org>
   * BUG 14486: s3: modules: vfs_glusterfs: Fix leak of char
     **lines onto mem_ctx on return.

o  Ralph Boehme <slow@samba.org>
   * BUG 14471: RN: vfs_zfsacl: Only grant DELETE_CHILD if ACL tag is speci=
al.

o  Alexander Bokovoy <ab@samba.org>
   * BUG 14538: smb.conf.5: Add clarification how configuration changes
     reflected by Samba.

o  G=C3=BCnther Deschner <gd@samba.org>
   * BUG 14486: s3-vfs_glusterfs: Refuse connection when write-behind xlato=
r is
     present.
   * winexe:: Add configure option to control whether to build it
     (default: auto).

o  Amitay Isaacs <amitay@gmail.com>
   * BUG 14487: Latest version of Bind9 is now 9.20.
   * BUG 14537: ctdb-common: Avoid aliasing errors during code optimization.

o  Stefan Metzmacher <metze@samba.org>
   * BUG 14531: s4:dsdb:acl_read: Implement "List Object" mode feature.

o  Sachin Prabhu <sprabhu@redhat.com>
   * BUG 14486: docs-xml/manpages: Add warning about write-behind translato=
r for
     vfs_glusterfs.

o  Khem Raj <raj.khem@gmail.com>
   * nsswitch/nsstest.c: Avoid nss function conflicts with glibc nss.h.

o  Martin Schwenke <martin@meltin.net>
   * BUG 14513: ctdb disable/enable can still fail due to race condition.

o  Andrew Walker <awalker@ixsystems.com>
   * BUG 14471: RN: vfs_zfsacl: Only grant DELETE_CHILD if ACL tag is speci=
al.


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
using GnuPG (ID 6F33915B6568B7EA).  The source code can be downloaded
=66rom:

        https://download.samba.org/pub/samba/stable/

The release notes are available online at:

        https://www.samba.org/samba/history/samba-4.12.10.html

Our Code, Our Bugs, Our Responsibility.
(https://bugzilla.samba.org/)

                        --Enjoy
                        The Samba Team

--Qxx1br4bt0+wmkIi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQQlQWgAwvkyRy78FZYoaL1+KxeTUQUCX6PPxQAKCRAoaL1+KxeT
UW4JAKDMdb6AknPs7QLhVvY+OzHj1ZWRFgCfWrQpCcdchdHg5nh0GkZ78U+qoOc=
=VqGl
-----END PGP SIGNATURE-----

--Qxx1br4bt0+wmkIi--

