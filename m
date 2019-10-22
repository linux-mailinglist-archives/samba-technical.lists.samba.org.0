Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 06744E0098
	for <lists+samba-technical@lfdr.de>; Tue, 22 Oct 2019 11:23:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=JvMX/lXDUOWIR5q+Cr2vce4yKF1oZYR3RjrTrD0pUrU=; b=vFueaSXiOTGRybOBYiPGwEn4nS
	zXIe2ZggOvgQ7vObUP5x+J0l5hQRg8qs2PyjD9/yJY1c618djcM2QOufx/sWi1WPCbZBMyXCg8i1W
	ylOk3UTdELY6hNfF9jEnaK7gwZa3Jzn4w1n6NTQ9K1JDEjwd17hKkcbSpTYg8fdMPfsPuLOnqNxmG
	3wtVPx3GcMRtosA+6vEz1Mh1I/VP6Nh82xeAs5f/xwINOjkl6g6a9kaneyBu8GqOoc/sjEcKWPPJj
	UagN19jKCkPuqHp9X29o5Iv9J37tMvhzeh7Rbuq2j/9XXvMCBgIqWux394t+jIFet6ilCVsfN99+X
	Vr9nvtpQ==;
Received: from localhost ([::1]:36870 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iMqN9-001KVv-U4; Tue, 22 Oct 2019 09:22:35 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:27480) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iMqN2-001KVF-LM; Tue, 22 Oct 2019 09:22:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:To:From:Date:CC;
 bh=JvMX/lXDUOWIR5q+Cr2vce4yKF1oZYR3RjrTrD0pUrU=; b=yWY98MUtFVIL3U7E28MHL3yEn+
 70DAN9REK60eAeS3irA7s8KngU8TX4KZGL8rUgxjXLNTAfnLJ8CXahh4RPtS21hPUMsUhRUxMaZ0C
 WYEOyk0aDgRYdpiVOPu6gJuV+UPQ6Au2p2Ah2QEDTUvVDBYKdh1zlxBTS2gj9IYE6baYwkkIzStQG
 qynM9r5t3kedWu0yFFTXxPRiMA3kaUyoL2zRqDJFegZ3cRoqcyVSfRp7A9ZwTtL5x2siGTW4w0SgS
 7KI504s0HD1iACWRllbMzW0f2ZK8ziMui5wCQV2IcndncrMt37QDzcWTGGlI4tkA6Um8ZzuhxKpk9
 gg6TEhPmLQtWF5wEAm5Sg97y2uFL8Cv5EdBsyinaOQgNbZtPuR6MF7e/BggN8OO7QEk+jJLGJguDs
 7pofarIcnHoRRuh9H0vbQUNnkCRAQVQcOjETt7yJwMt08fhQfUbfFwNHb0ee+CUhiY47jkOf/CWvt
 i7HJbtkSyBgN09xmBqER87T0;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1iMqN1-0002QR-Nj; Tue, 22 Oct 2019 09:22:28 +0000
Date: Tue, 22 Oct 2019 11:22:26 +0200
To: samba-announce@lists.samba.org, samba@lists.samba.org,
 samba-technical@lists.samba.org
Subject: [Announce] Samba 4.9.14 Available for Download
Message-ID: <20191022092224.GA25362@carrie2>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="XsQoSWH+UP9D9v3l"
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


--XsQoSWH+UP9D9v3l
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
			"Be thankful we're not getting
			 all the government we're paying
			 for."

			 Will Rogers
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D


Release Announcements
---------------------

This is the last bugfix release of the Samba 4.9 release series. There will=
 be
security releases only beyond this point.


Changes since 4.9.13:
---------------------

o  Jeremy Allison <jra@samba.org>
   * BUG 14094: smbc_readdirplus() is incompatible with smbc_telldir() and
     smbc_lseekdir().

o  Douglas Bagnall <douglas.bagnall@catalyst.net.nz>
   * BUG 13978: s4/scripting: MORE py3 compatible print functions.

o  Andrew Bartlett <abartlet@samba.org>
   * ldb: release ldb 1.4.8
   * BUG 13959: ldb_tdb fails to check error return when parsing pack forma=
ts.
   * BUG 13978: undoguididx: Add "or later" to warning about using tools fr=
om
     Samba 4.8.

o  Ralph Boehme <slow@samba.org>
   * BUG 14038: ctdb: Fix compilation on systems with glibc robust mutexes.

o  Isaac Boukris <iboukris@gmail.com>
   * BUG 14106: Fix spnego fallback from kerberos to ntlmssp in smbd server.

o  Poornima G <pgurusid@redhat.com>
   * BUG 14098: vfs_glusterfs: Use pthreadpool for scheduling aio operation=
s.

o  Aaron Haslett <aaronhaslett@catalyst.net.nz>
   * BUG 13977: ldb: baseinfo pack format check on init.
   * BUG 13978: sambaundoguidindex is untested and py2-only.

o  Amitay Isaacs <amitay@gmail.com>
   * BUG 14147: ctdb-vacuum: Process all records not deleted on a remote no=
de.

o  Bj=C3=B6rn Jacke <bj@sernet.de>
   * BUG 14139: Fault.c: Improve fault_report message text pointing to our =
wiki.

o  Stefan Metzmacher <metze@samba.org>
   * BUG 14055: libcli/smb: send SMB2_NETNAME_NEGOTIATE_CONTEXT_ID.

o  Martin Schwenke <martin@meltin.net>
   * BUG 14084: ctdb-tcp: Mark node as disconnected if incoming connection =
goes
     away.
   * BUG 14087: 'ctdb stop' command completes before databases are frozen.
   * BUG 14129: Exit code of ctdb nodestatus should not be influenced by de=
leted
     nodes.

o  Evgeny Sinelnikov <sin@altlinux.org>
   * BUG 14007: s3:ldap: Fix join with don't exists machine account.


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

        https://www.samba.org/samba/history/samba-4.9.14.html

Our Code, Our Bugs, Our Responsibility.
(https://bugzilla.samba.org/)

                        --Enjoy
                        The Samba Team

--XsQoSWH+UP9D9v3l
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQQlQWgAwvkyRy78FZYoaL1+KxeTUQUCXa7KTQAKCRAoaL1+KxeT
UUQrAJ9LE+Fo+OrJHQRAjTLmutfwchGPQQCfVVSSz4qsDWNlNJyWKT++2G6VZPk=
=UCVi
-----END PGP SIGNATURE-----

--XsQoSWH+UP9D9v3l--

