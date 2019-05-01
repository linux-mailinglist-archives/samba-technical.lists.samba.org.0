Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::443:1])
	by mail.lfdr.de (Postfix) with ESMTPS id E343C10571
	for <lists+samba-technical@lfdr.de>; Wed,  1 May 2019 08:22:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=43pzTr4GZs7lEWHyXcqAYnEt/egsJDeQNTimh9Q8wWA=; b=llS7XuEnPotJMV5uAt/WFhCAWa
	Zj0Kdy9nu5zRUc7zFEp42FSRgWkzcQ3BdoSSJla2nSo2dFpsnbV69Ck8hdEqSErji/CW8Tg0uECOh
	4s4ppd8tLlAAx+55pI0iyRCjxRFkeh+j0Ba6W7Cmrjowc5ym/p8o60Du/i4h5b0cMaTMPlcCf4YrL
	c/SbhDN1afnelD9dryMRclTn2xtN41V+y7Gg81QjxWLYRBJIbHXRNILmJmVGrMXu/bO2NTWLyPuUa
	pkE2hDse6psflPrbeJg9DHUEQ1ZjLQElqh/pSHHBsAt9oo8PPsCnQ3pL615zWaTIOZ3oi6b59slJl
	P1zmK4TQ==;
Received: from localhost ([::1]:41094 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hLicx-001lLo-4U; Wed, 01 May 2019 06:21:59 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::147:1]:31914) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hLico-001lL8-Do; Wed, 01 May 2019 06:21:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Message-ID:To:From:Date:CC;
 bh=43pzTr4GZs7lEWHyXcqAYnEt/egsJDeQNTimh9Q8wWA=; b=WS1GWXlJ3t7zqJROx039RF9ZO8
 cUlnXAP7xuVqvo7RKdCFlX6U7v5jRsTsCpe3+ZdEMF/iMMtxYPLd+1leWjMhqEuVu8cZibyiltyiu
 T/raapqNbb675L2rHgXa5D4HDMD2XnpoaCVVBXfcgNJ5DDsMuwbDXXtveI2DkGHITd1U=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1hLicm-0004T2-A5; Wed, 01 May 2019 06:21:48 +0000
Date: Wed, 1 May 2019 08:21:44 +0200
To: samba-announce@lists.samba.org, samba@lists.samba.org,
 samba-technical@lists.samba.org
Subject: [Announce] Samba 4.9.7 Available for Download
Message-ID: <20190501062142.GA7618@carrie2>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="jRHKVT23PllUwdXP"
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
X-BeenThere: samba-technical@lists.samba.org
X-Mailman-Version: 2.1.23
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


--jRHKVT23PllUwdXP
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
			"Tomorrow is often the busiest
			 day of the week."

			 Spanish proverb
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D


Release Announcements
---------------------

This is the latest stable release of the Samba 4.9 release series.


Changes since 4.9.6:
--------------------

o  Douglas Bagnall <douglas.bagnall@catalyst.net.nz>
   * BUG 13837: py/kcc_utils: py2.6 compatibility.
   * BUG 13882: py/provision: Fix for Python 2.6.

o  Andrew Bartlett <abartlet@samba.org>
   * BUG 13840: regfio: Update code near recent changes to match README.Cod=
ing.

o  G=C3=BCnther Deschner <gd@samba.org>
   * BUG 13861: 'net ads join' to child domain fails when using
     "-U admin@forestroot".

o  David Disseldorp <ddiss@samba.org>
   * BUG 13858: vfs_snapper: Drop unneeded fstat handler.
   * BUG 13896: vfs_ceph: Explicitly enable libcephfs POSIX ACL support.

o  Philipp Gesang <philipp.gesang@intra2net.com>
   * BUG 13869: libcli: Permit larger values of DataLength in
     SMB2_ENCRYPTION_CAPABILITIES of negotiate response.

o  Michael Hanselmann <public@hansmi.ch>
   * BUG 13840: regfio: Improve handling of malformed registry hive files.

o  Amitay Isaacs <amitay@samba.org>
   * BUG 13895: ctdb-common: Avoid race between fd and signal events.

o  Volker Lendecke <vl@samba.org>
   * BUG 13813: Fix idmap cache pollution with S-1-22- IDs on winbind hicku=
p.

o  Marcos Mello <marcosfrm@gmail.com>
   * BUG 11568: Send status to systemd on daemon start.

o  Stefan Metzmacher <metze@samba.org>
   * BUG 10097: s3:smbd: Handle IO_REPARSE_TAG_DFS in
     SMB_FIND_FILE_FULL_DIRECTORY_INFO.
   * BUG 10344: smb2_tcon: Avoid STATUS_PENDING completely on tdis.
   * BUG 12844: smb2_tcon: Avoid STATUS_PENDING responses for tree connect.
   * BUG 12845: smb2_sesssetup: Avoid STATUS_PENDING responses for session
     setup.
   * BUG 13698: smb2_tcon: Avoid STATUS_PENDING responses for tree connect.
   * BUG 13796: smb2_sesssetup: Avoid STATUS_PENDING responses for session
     setup.
   * BUG 13816: dbcheck in the middle of the tombstone garbage collection c=
auses
     replication failures.
   * BUG 13818: ndr_spoolss_buf: Fix out of scope use of stack variable in
     NDR_SPOOLSS_PUSH_ENUM_OUT().
   * BUG 13862: vfs_default: Fix vfswrap_offload_write_send()
     NT_STATUS_INVALID_VIEW_SIZE check.
   * BUG 13863: smb2_server: Grant all 8192 credits to clients.

o  Noel Power <noel.power@suse.com>
   * python/samba: extra ndr_unpack needs bytes function

o  Anoop C S <anoopcs@redhat.com>
   * BUG 13872: s3/vfs_glusterfs[_fuse]: Dynamically determine NAME_MAX.

o  Christof Schmitt <cs@samba.org>
   * passdb: Update ABI to 0.27.2.
   * BUG 13813: lib/winbind_util: Add winbind_xid_to_sid for --without-winb=
ind.
   * BUG 13865: memcache: Increase size of default memcache to 512k.

o  Andreas Schneider <asn@samba.org>
   * BUG 13823: lib:util: Move debug message for mkdir failing to log level=
 1.
   * BUG 13832: Printing via smbspool backend with Kerberos auth fails.
   * BUG 13847: s4:librpc: Fix installation of Samba.
   * BUG 13848: s3:lib: Fix the debug message for adding cache entries.
   * BUG 13853: s3:waf: Fix the detection of makdev() macro on Linux.
   * BUG 13857: docs: Update smbclient manpage for --max-protocol.
   * BUG 13861: 'net ads join' to child domain fails when using
     "-U admin@forestroot".

o  Zhu Shangzhong <zhu.shangzhong@zte.com.cn>
   * BUG 13839: ctdb: Initialize addr struct to zero before reparsing as IP=
V4.

o  Martin Schwenke <martin@meltin.net>
   * BUG 13838: ctdb package should not own system library directory.
   * BUG 13860: CTDB restarts failed NFS RPC services by hand, which is
     incompatible with systemd.
   * BUG 13888: ctdb-daemon: Revert "We can not assume that just because we
     could complete a TCP handshake".


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

        https://www.samba.org/samba/history/samba-4.9.7.html

Our Code, Our Bugs, Our Responsibility.
(https://bugzilla.samba.org/)

                        --Enjoy
                        The Samba Team

--jRHKVT23PllUwdXP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQQlQWgAwvkyRy78FZYoaL1+KxeTUQUCXMk68wAKCRAoaL1+KxeT
Uc30AJwKP/xK1G/rHBXdn16oX7UaIctoMgCfRMLc6joJrcZXbvKqCCa0TKSYUAI=
=VyKm
-----END PGP SIGNATURE-----

--jRHKVT23PllUwdXP--

