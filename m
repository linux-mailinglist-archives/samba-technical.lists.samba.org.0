Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 01DF825F8F7
	for <lists+samba-technical@lfdr.de>; Mon,  7 Sep 2020 12:58:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=DKEBQu5h6U1oca+WV9wYT8jlE0y+aTdDXrJbHsJWM9g=; b=5Ic8FaeU+IcmK78txIvX9s4qm0
	9uzdBLaifzEjN+kuk1HmPa83GMe4bhqbcmE7jZCXPo6pCT7tPPP58wAgsItol/h0epUXfs7gRzS8H
	ljUHnHk8ra9naj7upwforpwf35Gf6yO0WXtLY9dhzE61RA9ml/9ZkkC6c+WwiqUdqb7zIBkyg13TF
	vf5NbgIDyOYe/00UJQBzNDgk7cKjo67V9hNI/FNXSH3sIQAAGOK2WVb27iiOGFNNDj13etMFamPPI
	dk+Ous/nGl/tjxSECBSC9je3rgcWeDB8rLCnp1Dyeq1OKVlnTIA3FkGysPRK0TMsWBh79jGt+8jQN
	xHACnD/Q==;
Received: from localhost ([::1]:41922 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kFEqS-004W59-LF; Mon, 07 Sep 2020 10:57:56 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:35598) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kFEqH-004W4M-DP; Mon, 07 Sep 2020 10:57:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:To:From:Date:CC;
 bh=DKEBQu5h6U1oca+WV9wYT8jlE0y+aTdDXrJbHsJWM9g=; b=jOQDHbTmwkb7jzXUPirmWKXzY8
 DpOpK6ec5eXJDruJZcj5DF14gqu2VKv9rW7xCLyy/jZwV25GcYfnrEL/xp8b3d414nksH4kXDM9mu
 cwHEjUsfM3Ys33mp8eK/RWVD/7FT14tGWb8gpzQDY5dWFUVeLH9PrcaWitn+8s833zmz98I+evmhN
 J/HUJeKTg2spIb/uhhhrRWRyLC/Yj8zFi+g3q7ocx2lhfnrmAqp2EHH0DdYmA+xa4/hRl3on8bYQR
 ipR1Ag6wEZdwjbWldJ8a2QYoCVYwwPOHdnZvvNEYbOHyWF4Jwtd1f7E3QFPdwcv0yC1SvQGv3SAOn
 Mduz6TMj5wQO5RHMPO+v7sgotQWJsNkiwF3qQSDlgXOuZpO6lEkkBpnTvT5Kow9lcLWU7O6pDYtvV
 k76yHFy77sYorXtKd6Lx+ryvAQRqqJg7dVp5ODPXnsZH0wcKrkF9fbx5IpmIcXwGjG6Me8zILNgCh
 e+ixkpTNhzsqAmsbKpEJb9Yk;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1kFEqH-0005Zs-2P; Mon, 07 Sep 2020 10:57:45 +0000
Date: Mon, 7 Sep 2020 12:57:40 +0200
To: samba-announce@lists.samba.org, samba@lists.samba.org,
 samba-technical@lists.samba.org
Subject: [Announce] Samba 4.13.0rc4 Available for Download
Message-ID: <20200907105735.GA18444@carrie2>
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
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

This is the fourth release condidate of Samba 4.13.  This is *not*
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


CHANGES SINCE 4.13.0rc3
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

o  David Disseldorp <ddiss@samba.org>
   * BUG 14437: build: Toggle vfs_snapper using "--with-shared-modules".

o  Volker Lendecke <vl@samba.org>
   * BUG 14465: idmap_ad does not deal properly with a RFC4511 section 4.4.1
     response.

o  Stefan Metzmacher <metze@samba.org>
   * BUG 14428: PANIC: Assert failed in get_lease_type().
   * BUG 14465: idmap_ad does not deal properly with a RFC4511 section 4.4.1
     response.


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

        https://download.samba.org/pub/samba/rc/samba-4.13.0rc4.WHATSNEW.txt

Our Code, Our Bugs, Our Responsibility.
(https://bugzilla.samba.org/)

                        --Enjoy
                        The Samba Team

--pf9I7BMVVzbSWLtt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQQlQWgAwvkyRy78FZYoaL1+KxeTUQUCX1YSHAAKCRAoaL1+KxeT
UTo0AKDDMqvwhjm5yK5pKArYvWUl9HhsjQCgmF8P2UICk8NnT6ymuKKsn6VFStk=
=dbbf
-----END PGP SIGNATURE-----

--pf9I7BMVVzbSWLtt--

