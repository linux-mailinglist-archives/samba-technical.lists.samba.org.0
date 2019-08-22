Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 8833698DBD
	for <lists+samba-technical@lfdr.de>; Thu, 22 Aug 2019 10:32:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=IUqrepXrssR4H2oLkvE7+WffzRhILFSIE/CI33mkCsI=; b=1FpsG5vnGUo3h08WV/L4aS89PG
	ExpJDujlfjqoq0yU3eGnGUKRx77q5sDYooS9ridVZpSNQiAnKJwoxPCt09yYogebqRJpD9O2+nxZP
	2N4lsdDVEiCUPAYBCNx0WJi+Mlr13alscgX9ya4Y5rN5CcxbVYF0+eyrYhkFarRE+YFaRxA14DPhk
	3+zta4an/z8RTsqY0jla4LrpmwyEs8bqRla8NL31B/npttFZhZm2eLoijsg8uRIv7KJPIIaaY+iTK
	xTizV+ztorYQpLN7AVPp24a0lrbTNIUgDrrC1/DLPWiNhMS2FfikZSMLRcFSSJbskVoDSGglTJe/U
	u9RJnyZQ==;
Received: from localhost ([::1]:25820 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1i0iVL-007WhZ-FN; Thu, 22 Aug 2019 08:31:35 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:10216) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1i0iV8-007Wgt-Go; Thu, 22 Aug 2019 08:31:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Message-ID:To:From:Date:CC;
 bh=IUqrepXrssR4H2oLkvE7+WffzRhILFSIE/CI33mkCsI=; b=D4wyr6S3SPB1BYJnRP1Pyo7JJF
 7IzeX5NeR9jAqRLNqMmh1a5uAGq+KaT8OBDZhIYjBR8GrbppExt6XmnX6Dg0psEbVvXzfB2pJEmDv
 vKub3ClxH7sylTMyCv4pP0m9bFH5AZnfrn6U5dxfmCoNaO+IZ3xsxEsXm1YZzkkJ5hOA=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1i0iUy-0004o3-25; Thu, 22 Aug 2019 08:31:12 +0000
Date: Thu, 22 Aug 2019 10:31:10 +0200
To: samba-announce@lists.samba.org, samba@lists.samba.org,
 samba-technical@lists.samba.org
Subject: [Announce] Samba 4.10.7 Available for Download
Message-ID: <20190822083109.GA9759@carrie2>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="HlL+5n6rz5pIUxbD"
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


--HlL+5n6rz5pIUxbD
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
			"If I had to live my life again,
			 I'd make the same mistakes,
			 only sooner."

			 Tallulah Bankhead
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D


Release Announcements
---------------------

This is the latest stable release of the Samba 4.10 release series.


Changes since 4.10.6:
---------------------

o  Michael Adam <obnox@samba.org>
   * BUG 14010: Unable to create or rename file/directory inside shares
     configured with vfs_glusterfs_fuse module.

o  Andrew Bartlett <abartlet@samba.org>
   * BUG 13844: build: Allow build when '--disable-gnutls' is set.

o  Bj=C3=B6rn Baumbach <bb@sernet.de>
   * BUG 13973: samba-tool: Add 'import samba.drs_utils' to fsmo.py.

o  Tim Beale <timbeale@catalyst.net.nz>
   * BUG 14008: Fix 'Error 32 determining PSOs in system' message on old DB
     with FL upgrade.
   * BUG 14021: s4/libnet: Fix joining a Windows pre-2008R2 DC.
   * BUG 14046: join: Use a specific attribute order for the DsAddEntry
     nTDSDSA object.

o  Ralph Boehme <slow@samba.org>
   * BUG 14015: vfs_catia: Pass stat info to synthetic_smb_fname().

o  Alexander Bokovoy <ab@samba.org>
   * BUG 14091: lookup_name: Allow own domain lookup when flags =3D=3D 0.

o  Gary Lockyer <gary@catalyst.net.nz>
   * BUG 13932: s4 librpc rpc pyrpc: Ensure tevent_context deleted last.

o  Stefan Metzmacher <metze@samba.org>
   * BUG 13915: DEBUGC and DEBUGADDC doesn't print into a class specific log
     file.
   * BUG 13949: Request to keep deprecated option "server schannel",=20
     VMWare Quickprep requires "auto".
   * BUG 13967: dbcheck: Fallback to the default tombstoneLifetime of 180 d=
ays.
   * BUG 13969: dnsProperty fails to decode values from older Windows versi=
ons.
   * BUG 13973: samba-tool: Use only one LDAP modify for dns partition fsmo
     role transfer.

o  Andreas Schneider <asn@samba.org>
   * BUG 13960: third_party: Update waf to version 2.0.17.

o  Garming Sam <garming@catalyst.net.nz>
   * BUG 14051: netcmd: Allow 'drs replicate --local' to create partitions.

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

        https://www.samba.org/samba/history/samba-4.10.7.html

Our Code, Our Bugs, Our Responsibility.
(https://bugzilla.samba.org/)

                        --Enjoy
                        The Samba Team

--HlL+5n6rz5pIUxbD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQQlQWgAwvkyRy78FZYoaL1+KxeTUQUCXV5SygAKCRAoaL1+KxeT
UR3gAJ9b0vsPTSecMYMg0cH+oeU+Ca10+QCgnmaxOeEQKpbjWlQ4hGCi1Gft/CE=
=PEG8
-----END PGP SIGNATURE-----

--HlL+5n6rz5pIUxbD--

