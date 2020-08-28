Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DB562557D0
	for <lists+samba-technical@lfdr.de>; Fri, 28 Aug 2020 11:38:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=B0TXBuZkPxgq93hbHc1Vk2fva34dEswJEqTMgOmiw8w=; b=m/9AqsdGljWBbjNNYblD+IOj2S
	gBjLXdMNwt4K+mThMQRjBjBFcoxfq/eM6X6aGfQcMs5TMOSU8HKWTDwLe825s6CwR5Fjn5XdDV7U4
	YQRPcqTypMo1z/uDiS5XiQoFzUM9PuI25CmIL3Pzky0nS6LpuBW3SbR04fvKhd/qLJH3S+rgsHezU
	gRp2ks1cPpZ+Y07MLIIiUQsF2JxEq/J7sw/6ZS6y3SphPKKv+m2oVOyFNvhap2F5lCOigKxWg5WV1
	J0/6MCD47JQNkVIZ0V5vJYdf5rDItavhRixGx3rldhR8f0jbxPVqtgm0ozMswDy4JttD/laK0vOdW
	5pFu9X5A==;
Received: from localhost ([::1]:51592 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kBapy-0016xD-EX; Fri, 28 Aug 2020 09:38:22 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:52844) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kBapm-0016wV-4Y; Fri, 28 Aug 2020 09:38:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:To:From:Date:CC;
 bh=B0TXBuZkPxgq93hbHc1Vk2fva34dEswJEqTMgOmiw8w=; b=qHPApDW+BM+qNlG4a0umXA15o6
 Mmn+J6Wiz5s2rie30Wwd76kZ+TEQLyy9wDnU6DiuNN5/VclZcPxzifphGLtK1HdsBqFGpuRmvOrCM
 e9V66A4g5I1e3vSdz34n14TIwb2GfSlZsFxrOyAD0dFxWzeATuY2jJkNKrl/zous/veFrH5We4svS
 aBZqTOsnnd16HQzo3qRr9xfsY5uc0WSflZMuVIWvlxrVc57+x34Gnlb1jeURAi1pK41Cpoo0w8c6u
 2AVhbpStQpsFO/Dk7pIFb793KLyeItPNKRNd5VTQD/d2/Tm51r+uQnvhOkp9o3hzEvhiv1tSCtF2T
 OJuZnfU97ThSx2ACyxdSl6utHUrQ0vyuHDWXQsZXQBG1EKdLxYbjlB7VlU81OfSYvaZX2aXhfDFeS
 6FuAv7Yvg/VidhLjkcNRUhaI6XZ8twVzg+NLKoY/JSVu6Q9eq3HfOBcIVagcO5hZz8Qqh16GJpzyT
 zMZMP8R400K+SHoh5IA05yPt;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1kBapl-00032A-QT; Fri, 28 Aug 2020 09:38:09 +0000
Date: Fri, 28 Aug 2020 11:38:07 +0200
To: samba-announce@lists.samba.org, samba@lists.samba.org,
 samba-technical@lists.samba.org
Subject: [Announce] Samba 4.13.0rc3 Available for Download
Message-ID: <20200828093805.GA12808@carrie2>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="/9DWx/yDrRhgMJTb"
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


--/9DWx/yDrRhgMJTb
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Release Announcements
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

This is the third release condidate of Samba 4.13.  This is *not*
intended for production environments and is designed for testing
purposes only.  Please report any defects via the Samba bug reporting
system at https://bugzilla.samba.org/.

Samba 4.13 will be the next version of the Samba suite.


UPGRADING
=3D=3D=3D=3D=3D=3D=3D=3D=3D


NEW FEATURES/CHANGES
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

Python 3.6 Required
-------------------

Samba's minimum runtime requirement for python was raised to Python
3.5 with samba 4.12.  Samba 4.13 raises this minimum version to Python
3.6 both to access new features and because this is the oldest version
we test with in our CI infrastructure.

(Build time support for the file server with Python 2.6 has not
changed)

wide links functionality
------------------------

For this release, the code implementing the insecure "wide links =3D yes"
functionality has been moved out of the core smbd code and into a separate
VFS module, vfs_widelinks. Currently this vfs module is implicitly loaded
by smbd as the last but one module before vfs_default if "wide links =3D ye=
s"
is enabled on the share (note, the existing restrictions on enabling wide
links around the SMB1 "unix extensions" and the "allow insecure wide links"
parameters are still in force). The implicit loading was done to allow
existing users of "wide links =3D yes" to keep this functionality without
having to make a change to existing working smb.conf files.

Please note that the Samba developers recommend changing any Samba
installations that currently use "wide links =3D yes" to use bind mounts
as soon as possible, as "wide links =3D yes" is an inherently insecure
configuration which we would like to remove from Samba. Moving the
feature into a VFS module allows this to be done in a cleaner way
in future.

A future release to be determined will remove this implicit linkage,
causing administrators who need this functionality to have to explicitly
add the vfs_widelinks module into the "vfs objects =3D" parameter lists.
The release notes will be updated to note this change when it occurs.

NT4-like 'classic' Samba domain controllers
-------------------------------------------

Samba 4.13 deprecates Samba's original domain controller mode.

Sites using Samba as a Domain Controller should upgrade from the
NT4-like 'classic' Domain Controller to a Samba Active Directory DC
to ensure full operation with modern windows clients.

SMBv1 only protocol options deprecated
--------------------------------------

A number of smb.conf parameters for less-secure authentication methods
which are only possible over SMBv1 are deprecated in this release.

REMOVED FEATURES
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

The deprecated "ldap ssl ads" smb.conf option has been removed.

smb.conf changes
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

  Parameter Name                     Description                Default
  --------------                     -----------                -------
  ldap ssl ads                       removed
  smb2 disable lock sequence checking				No
  domain logons                      Deprecated                 no
  raw NTLMv2 auth                    Deprecated                 no
  client plaintext auth              Deprecated                 no
  client NTLMv2 auth                 Deprecated                 yes
  client lanman auth                 Deprecated                 no
  client use spnego                  Deprecated                 yes


CHANGES SINCE 4.13.0rc2
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

o  Andrew Bartlett <abartlet@samba.org>
   * BUG 14460: Deprecate domain logons, SMBv1 things.

o  G=C3=BCnther Deschner <gd@samba.org>
   * BUG 14318: docs: Add missing winexe manpage.

o  Christof Schmitt <cs@samba.org>
   * BUG 14166: util: Allow symlinks in directory_create_or_exist.

o  Martin Schwenke <martin@meltin.net>
   * BUG 14466: ctdb disable/enable can fail due to race condition.


CHANGES SINCE 4.13.0rc1
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

o  Andrew Bartlett <abartlet@samba.org>
   * BUG 14450: dbcheck: Allow a dangling forward link outside our known NC=
s.

o  Isaac Boukris <iboukris@gmail.com>
   * BUG 14462: Remove deprecated "ldap ssl ads" smb.conf option.

o  Volker Lendecke <vl@samba.org>
   * BUG 14435: winbind: Fix lookuprids cache problem.

o  Stefan Metzmacher <metze@samba.org>
   * BUG 14354: kdc:db-glue: Ignore KRB5_PROG_ETYPE_NOSUPP also for
     Primary:Kerberos.

o  Andreas Schneider <asn@samba.org>
   * BUG 14358: docs: Fix documentation for require_membership_of of
     pam_winbind.conf.

o  Martin Schwenke <martin@meltin.net>
   * BUG 14444: ctdb-scripts: Use nfsconf as a last resort get nfsd thread
     count.


KNOWN ISSUES
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

https://wiki.samba.org/index.php/Release_Planning_for_Samba_4.13#Release_bl=
ocking_bugs


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

        https://download.samba.org/pub/samba/rc/

The release notes are available online at:

        https://download.samba.org/pub/samba/rc/samba-4.13.0rc3.WHATSNEW.txt

Our Code, Our Bugs, Our Responsibility.
(https://bugzilla.samba.org/)

                        --Enjoy
                        The Samba Team

--/9DWx/yDrRhgMJTb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQQlQWgAwvkyRy78FZYoaL1+KxeTUQUCX0jQeQAKCRAoaL1+KxeT
UeQiAKChoO2xZfhfNYFvJ500CiL6fQS9fQCgic7GaAVhHxEbh/SlCbVm3SvxaTQ=
=N3f3
-----END PGP SIGNATURE-----

--/9DWx/yDrRhgMJTb--

