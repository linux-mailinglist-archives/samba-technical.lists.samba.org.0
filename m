Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EBDC2A4554
	for <lists+samba-technical@lfdr.de>; Tue,  3 Nov 2020 13:38:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=PfsASs1Vr20hajfH7L3bv0oGM5OPmhsz5TuO7cSFhAI=; b=utgxcV8flpfONfyrx/3wSq83p0
	VAdKe/RTel+WPbQzuODJkMWEjVzvxr7Ko2LKv32xQfBhcMfH50ROnxBIYkUT/oKi+zXsRYmyH/39s
	DqYuInUNWQGaT9+kLOA8DzMCduaBKkPGUKVtC8lb1TcdmjZFAILUTn7/H0CpVrSG1dYRru824kJeG
	X54ZugZH16mZV+yoVzJIUz6jjmpqHMrMYrz7lAAAIlqQBok3gIGnsMGezTeRTc8UIgob/Pp3ilYan
	1uCvuBtG2yGUned3mmxvygmqeXj1c5Gof7MYZ0UZkMhpss9xZVsouqqLEa4B2T5mowbteYMT2ZTwJ
	QzUYvzgg==;
Received: from ip6-localhost ([::1]:60336 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kZvZF-00H8o0-6N; Tue, 03 Nov 2020 12:37:41 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:39722) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kZvYx-00H8nI-Kp; Tue, 03 Nov 2020 12:37:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:To:From:Date:CC;
 bh=PfsASs1Vr20hajfH7L3bv0oGM5OPmhsz5TuO7cSFhAI=; b=V8p6x7jcONl2pRmLxU+bxvsbBN
 VoHC7aHyW1pWcRVT+1apIjwjBfcVgCFChZbn5v74InR69ULddFEJ3AdACrpeXFuhBzMLx/pAkCvXT
 GWYMJvn92FNEbvwg9wt/GehHd2jMd3HFC7dIYKfZO+WtmMr9z7xkN5dPTxR9uMSEvJYUtGKIRUc1E
 ZESJ0iR/ZvaBdk/KCfrtlMEZcRZykurhEoaM7/2avC3pha22YXOZ8VCXi8tYX6jtU1qZw4s4fLI2J
 ewVxmw7RTuDK7aJimfFn4AqoVajHfk4JeMZFXE2Ualut4leRawFJR+k82n3wxtPGee4cY37OcVxpR
 y379YsV6eouKNsF0R0sdmUNODT0sNZffSFxqBEknFfIOF45NWpmL62Dpttr3k+wQEpZBwWSjQ8QLY
 D6ebSV8fIMufrA4AThSXkLuAnnhS6IC6ygKPTouakUBRcyzXIyjsOl+S601mCJ++Svz4/NXpjpBdz
 qFyURLX/XxgK6qSGrQ8iNIPp;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1kZvYx-0001j0-2r; Tue, 03 Nov 2020 12:37:23 +0000
Date: Tue, 3 Nov 2020 13:37:17 +0100
To: samba-announce@lists.samba.org, samba@lists.samba.org,
 samba-technical@lists.samba.org
Subject: [Announce] Samba 4.13.2 Available for Download
Message-ID: <20201103123715.GA31728@carrie2.fritz.box>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="BOKacYhQ+x31HxR3"
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


--BOKacYhQ+x31HxR3
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Release Announcements
---------------------

This is the latest stable release of the Samba 4.13 release series.

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


Changes since 4.13.1
--------------------

o  Jeremy Allison <jra@samba.org>
   * BUG 14486: s3: modules: vfs_glusterfs: Fix leak of char=20
     **lines onto mem_ctx on return.

o  Ralph Boehme <slow@samba.org>
   * BUG 14471: RN: vfs_zfsacl: Only grant DELETE_CHILD if ACL tag is speci=
al.

o  Alexander Bokovoy <ab@samba.org>
   * BUG 14538: smb.conf.5: Add clarification how configuration changes
     reflected by Samba.
   * BUG 14552: daemons: Report status to systemd even when running in
     foreground.
   * BUG 14553: DNS Resolver: Support both dnspython before and after 2.0.0.
=20
o  G=C3=BCnther Deschner <gd@samba.org>
   * BUG 14486: s3-vfs_glusterfs: Refuse connection when write-behind xlato=
r is
     present.

o  Amitay Isaacs <amitay@gmail.com>
   * BUG 14487: provision: Add support for BIND 9.16.x.
   * BUG 14537: ctdb-common: Avoid aliasing errors during code optimization.
   * BUG 14541: libndr: Avoid assigning duplicate versions to symbols.

o  Bj=C3=B6rn Jacke <bjacke@samba.org>
   * BUG 14522: docs: Fix default value of spoolss:architecture.

o  Laurent Menase <laurent.menase@hpe.com>
   * BUG 14388: winbind: Fix a memleak.

o  Stefan Metzmacher <metze@samba.org>
   * BUG 14531: s4:dsdb:acl_read: Implement "List Object" mode feature.

o  Sachin Prabhu <sprabhu@redhat.com>
   * BUG 14486: docs-xml/manpages: Add warning about write-behind translato=
r for
     vfs_glusterfs.

o  Khem Raj <raj.khem@gmail.com>
   * nsswitch/nsstest.c: Avoid nss function conflicts with glibc nss.h.

o  Anoop C S <anoopcs@samba.org>
   * BUG 14530: vfs_shadow_copy2: Avoid closing snapsdir twice.

o  Andreas Schneider <asn@samba.org>
   * BUG 14547: third_party: Update resolv_wrapper to version 1.1.7.
   * BUG 14550: examples:auth: Do not install example plugin.

o  Martin Schwenke <martin@meltin.net>
   * BUG 14513: ctdb-recoverd: Drop unnecessary and broken code.

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

        https://www.samba.org/samba/history/samba-4.13.2.html

Our Code, Our Bugs, Our Responsibility.
(https://bugzilla.samba.org/)

                        --Enjoy
                        The Samba Team

--BOKacYhQ+x31HxR3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQQlQWgAwvkyRy78FZYoaL1+KxeTUQUCX6FO+AAKCRAoaL1+KxeT
UYKjAJsHlaHkZMLCd57WNBAlsU1jsg+78wCeOaGB+pHUoOXfEQWiUpO/g5o0vV4=
=baMf
-----END PGP SIGNATURE-----

--BOKacYhQ+x31HxR3--

