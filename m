Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 7672314B31A
	for <lists+samba-technical@lfdr.de>; Tue, 28 Jan 2020 11:57:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=wKoat79cZioZq35X95EvfOh4+PSFV6uFrwp9n6wlUP8=; b=ndJlieGSOc1zmgee2t6WzFa9Yx
	+T9eCLpP8xA+W6Ab2TqakdtbmYuUoPO9g2TN1CDMUxID+4u9UGIYXxjaCvCzBbMI++0W2yZNnUkUB
	1tQIzJnAYW7J7/6OY94CfS2uDRydJInDN71Z3ev5ys9GLfNxX8uAhb8xUTR9fnpYveE0b+zIeiSZs
	vJLT7w3Ws8DtGvbnfcSe/bcZH9O4aKijzxbIHWH/Qr1nTWWqksrxUt9voGljCyGYZ0lIOWAwkTUzW
	zU/fI3TynXZcrgiiIp2wF2E0ITmTb6XxGumVw/jsRtRDOio3yq2YXITbcUZ3zw79HkwgMYVVim2rF
	zrgsnbTw==;
Received: from localhost ([::1]:46916 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iwOYD-005554-5U; Tue, 28 Jan 2020 10:56:57 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:58416) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iwOY0-00554N-SL; Tue, 28 Jan 2020 10:56:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:To:From:Date:CC;
 bh=wKoat79cZioZq35X95EvfOh4+PSFV6uFrwp9n6wlUP8=; b=fhXoLGS5HMcsgnVMtKHTuWAFUm
 h5UGG4myNCnX6WWoHPPq9u7wfGSE1DDuAS8TG9wIaN2qSaQBeslVydGbNd75Dh7/NdN/xTtOeATRB
 L+oYBwMMLCCkLlBosSG4wz5eGvn//DqJ2G9ESvxKGZ4ujVNUjmK2D9bm9dqhOJI3099EV5oc0HHro
 hVusytigPKhKIiH6mWJldUlHTBJVmEJxpeJXsYQ8iqmwZGTOW1U/mJ9gN5UU7i9nIMIIIdfDQDK6a
 Q3sBbvUrUJepFZxyUSfLEoeIIpRDnUfnmDWL0tv1xrNqXzrjFlcEI7SKlYoAOQGHg4l2OT9308Qcq
 Klc30/eJMBXKTWyM+kKb4/LsC8+lH61E9NHqv9MyhZDQSVMwn9kqzO562prPZbayDV5CGHU2swzp8
 S3QutQ/llIJAErwND/XMpDYKHtPlkUpASEuLZxNLk3Fa+LLEx1cl8cnXIltkxkzAZzluR6WgLbtJK
 BClxuOjHnpV6OSQVVyyQAkI0;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1iwOY0-0002qU-Dn; Tue, 28 Jan 2020 10:56:44 +0000
Date: Tue, 28 Jan 2020 11:56:43 +0100
To: samba-announce@lists.samba.org, samba@lists.samba.org,
 samba-technical@lists.samba.org
Subject: [Announce] Samba 4.11.6 Available for Download
Message-ID: <20200128105641.GA23769@carrie2>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="7JfCtLOvnd9MIVvH"
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


--7JfCtLOvnd9MIVvH
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Release Announcements
---------------------


This is the latest stable release of the Samba 4.11 release series.


Changes since 4.11.5:
---------------------

o  Douglas Bagnall <douglas.bagnall@catalyst.net.nz>
   * BUG 14209: pygpo: Use correct method flags.

o  David Disseldorp <ddiss@samba.org>
   * BUG 14216: vfs_ceph_snapshots: Fix root relative path handling.

o  Torsten Fohrer <torsten.fohrer@sbe.de>
   * BUG 14209: Avoiding bad call flags with python 3.8, using METH_NOARGS
     instead of zero.

o  Fabrice Fontaine <fontaine.fabrice@gmail.com>
   * BUG 14218: source4/utils/oLschema2ldif: Include stdint.h before cmocka=
=2Eh.

o  Bj=C3=B6rn Jacke <bjacke@samba.org>
   * BUG 14122: docs-xml/winbindnssinfo: Clarify interaction with idmap_ad =
etc.

o  Volker Lendecke <vl@samba.org>
   * BUG 14251: smbd: Fix the build with clang.

o  Gary Lockyer <gary@catalyst.net.nz>
   * BUG 14199: upgradedns: Ensure lmdb lock files linked.

o  Anoop C S <anoopcs@redhat.com>
   * BUG 14182: s3: VFS: glusterfs: Reset nlinks for symlink entries during
     readdir.

o  Andreas Schneider <asn@samba.org>
   * BUG 14101: smbc_stat() doesn't return the correct st_mode and also the
     uid/gid is not filled (SMBv1) file.
   * BUG 14219: librpc: Fix string length checking in
     ndr_pull_charset_to_null().

o  Martin Schwenke <martin@meltin.net>
   * BUG 14227: ctdb-scripts: Strip square brackets when gathering connecti=
on
     info.


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

        https://www.samba.org/samba/history/samba-4.11.6.html

Our Code, Our Bugs, Our Responsibility.
(https://bugzilla.samba.org/)

                        --Enjoy
                        The Samba Team

--7JfCtLOvnd9MIVvH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQQlQWgAwvkyRy78FZYoaL1+KxeTUQUCXjATZgAKCRAoaL1+KxeT
UUL+AJ4oVLjhCeEHCQ0lv3gq8uLwcu6jXwCfafZwiUydvqv1+eouSQlTI+3jdZw=
=SFx5
-----END PGP SIGNATURE-----

--7JfCtLOvnd9MIVvH--

