Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C0CD212726
	for <lists+samba-technical@lfdr.de>; Thu,  2 Jul 2020 16:57:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=MiS9MqmNfNpO1GYGQJ1ylNMXEGGLPE/rAVVAn7BM3aE=; b=dvaomtgFEaKRCdQPIC/RG6hMaf
	zDVQDi0cVPkaqIA904cqxBmRmPeYcwPjNKBmkGUFQFtr4Ux3AatEm6t9wnkV+JUJrzMq8EUwzDa2A
	X3sxI71HdgbEn6LbmSPY012Y0jqk4Qmw31p9Ij+/0WsG+amku47IE/I/YPZkbmVpDRJq4EFVTZafv
	eePld5vyDDMCN2+DolIPDqdUmtTQvcwozeHrwRnJfFhLiGxUI7CUBV8zWAGCbT4x0nq/F051U3dgI
	fk1Xp3jSdst6x7h3a8/cf4n32Zu5qzbtYFO9Io0y6vfGC5rBwr/omJdhIYfItlG7sHi1AiFhvTjGR
	vrZx74cg==;
Received: from localhost ([::1]:48162 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jr0e3-0055xG-9S; Thu, 02 Jul 2020 14:56:59 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:11760) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jr0dm-0055wZ-Ha; Thu, 02 Jul 2020 14:56:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:To:From:Date:CC;
 bh=MiS9MqmNfNpO1GYGQJ1ylNMXEGGLPE/rAVVAn7BM3aE=; b=ZtBtuM/fwAjuVBNH2tGuWGR+JB
 wDMyvfxLj4UZhDIvAhIEfKeg90hEpJv/UW9gCrK22xxLIQIz+OHG3IyZOTG/F5JCGGeMeEZKff0LA
 4iqHw37TTtJ7UjteZrDx8lXeg+a+ok8yP8UWBd7NUg32hcwLvXimhpWwlA/9RhmYaam8F6KDjvZrH
 4KTvxlN2ObsWvGPkKRmPD8z5rCfh4xke1vGjI9F71hiOAyXFWq7f+BQtaXbjL8nNX0C9Zsq+rPoN3
 YbEIO2kgwaE9pxeS/EcWOkgQSy0VIBTre96LVerB4EP58MCcCpuzmfeDnt0pM0M9REEdOv9vekaL1
 3yQFyXPpTZu/ZI1/EIhYro0mALsG7x763w9vYXh9te4J+SuKsQAue7IG3nwJAK+UEAWUfXK0q1mXN
 iH2t/NDW1G5qZYps6ysTXLyMt1WFQBCtDviCVujIRrT6Jr8yavtIwtYMWbsDXlB4kPNviO9ZA/IXa
 Uzr1raeaWi/bCcD3PW5gjEsX;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1jr0dm-0008Fm-23; Thu, 02 Jul 2020 14:56:42 +0000
Date: Thu, 2 Jul 2020 16:56:40 +0200
To: samba-announce@lists.samba.org, samba@lists.samba.org,
 samba-technical@lists.samba.org
Subject: [Announce] Samba 4.12.5 Available for Download
Message-ID: <20200702145638.GA3373@carrie2.fritz.box>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="pf9I7BMVVzbSWLtt"
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


--pf9I7BMVVzbSWLtt
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Release Announcements
---------------------


This is the latest stable release of the Samba 4.12 release series.


Changes since 4.12.4
--------------------

o  Jeremy Allison <jra@samba.org>
   * BUG 14301: Fix smbd panic on force-close share during async io.
   * BUG 14374: Fix segfault when using SMBC_opendir_ctx() routine for share
     folder that contains incorrect symbols in any file name.
   * BUG 14391: Fix DFS links.

o  Andrew Bartlett <abartlet@samba.org>
   * BUG 14310: Can't use DNS functionality after a Windows DC has been in
     domain.

o  Alexander Bokovoy <ab@samba.org>
   * BUG 14413: ldapi search to FreeIPA crashes.

o  Isaac Boukris <iboukris@gmail.com>
   * BUG 14396: Add net-ads-join dnshostname=3Dfqdn option.
   * BUG 14406: Fix adding msDS-AdditionalDnsHostName to keytab with Window=
s DC.

o  Bj=C3=B6rn Jacke <bj@sernet.de>
   * BUG 14386: docs-xml: Update list of posible VFS operations for
     vfs_full_audit.

o  Volker Lendecke <vl@samba.org>
   * BUG 14382: winbindd: Fix a use-after-free when winbind clients exit.

o  Andreas Schneider <asn@samba.org>
   * BUG 14370: Client tools are not able to read gencache anymore.


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

        https://www.samba.org/samba/history/samba-4.12.5.html

Our Code, Our Bugs, Our Responsibility.
(https://bugzilla.samba.org/)

                        --Enjoy
                        The Samba Team

--pf9I7BMVVzbSWLtt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQQlQWgAwvkyRy78FZYoaL1+KxeTUQUCXv31ogAKCRAoaL1+KxeT
UZnYAJ4ypdJrGVllycB4eD/zAMj/91oepQCgmnJnhN7WrPCzowl4GQfZ6nH/a3Y=
=MHws
-----END PGP SIGNATURE-----

--pf9I7BMVVzbSWLtt--

