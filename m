Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A7BE26A6A1
	for <lists+samba-technical@lfdr.de>; Tue, 15 Sep 2020 15:57:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=52Q9+/DisPieMGp/HuCk9hA53o7iRDwUHMzDn3SaXbQ=; b=NXkQ+50WfYC28o5TjG8vLP9O55
	seMKC1k5ta745Dsf9BQbYxw+wj3SyhUdck68H8Pp9mDbVQyLRc/BU9nmqQXgmUigXbLgdtaPOICRm
	Ylm6kiz1fssYB6gIhHkYuVzPjE4d0wexSr1gTHwrL62G1+qnyCJpKVB368Hmus+uKNHTq9hyoVGRb
	6DEEQg5yWKop/kTnqY0o8XNHu/gudQMsgGXNNwhjY2KuEOwe/XiSwTHzBY+Lj32CsAbY8YTv1Rt9Z
	OKv4u3HtXHO+FSO8Rb+tH+F/eCh3wHcc+SR9Uc8GAXykj3dsB3d+rjHPzdUtyX9IW/Wr95mSzbfU4
	aQvsqvEQ==;
Received: from localhost ([::1]:22882 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kIBRs-005Uhg-71; Tue, 15 Sep 2020 13:56:44 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:61336) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kIBRh-005Uh0-2d; Tue, 15 Sep 2020 13:56:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:To:From:Date:CC;
 bh=52Q9+/DisPieMGp/HuCk9hA53o7iRDwUHMzDn3SaXbQ=; b=CMvOdBrcTONPffRoBYyQYENxzr
 SkD6TvkfPyBhaYiI5I5VnXSKbGerqqSVAV9bcb0Yd3h+khStfE+Ak+BUprTfS9UxGI+U9tn1kKKEz
 pq05bmV0d33KgMRPmFJSfnUn1ky6R0Cd2fspMRfb+8N9acPuj3+6ykjBXlayVq7QdmXrNypVCAXnS
 kARxGEAkSAXvSQeIegr4HKLyNDwyqLZQpPnJdumiPgelkeSc368pFFC4MfF/3q9m33+vKyzmCzGC0
 PGtHsXxi1hBDgMGxZxGZSUmWpHoQNEYn2AxubqPeWBg761jGt43twEq8Yd4jUnSKvO9HWYcsv6rJy
 BaQ0FLDXWt5ayo4gC8fYFM5sxr5h7cTw93kuVEvBGuOVNZDHBLOAcVuvXMROGP/kTy54M6VsYNiJ5
 bzxztWZZyfekvALkfNGrMZZdo0x3+ZijxiQsjvfDWA3jPCPQinsJD/V9CRJF8/+xceampL3+4z1H5
 dB7MaoyoRIgXmWmqDDfm7yi9;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1kIBRf-0000vY-Fs; Tue, 15 Sep 2020 13:56:31 +0000
Date: Tue, 15 Sep 2020 15:56:29 +0200
To: samba-announce@lists.samba.org, samba@lists.samba.org,
 samba-technical@lists.samba.org
Subject: [Announce] Samba 4.13.0rc5 Available for Download
Message-ID: <20200915135625.GA28940@carrie2>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="6c2NcOVqGQ03X4Wi"
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


--6c2NcOVqGQ03X4Wi
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Release Announcements
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

This is the fifth release condidate of Samba 4.13.  This is *not*
intended for production environments and is designed for testing
purposes only.  Please report any defects via the Samba bug reporting
system at https://bugzilla.samba.org/.

Samba 4.13 will be the next version of the Samba suite.


UPGRADING
=3D=3D=3D=3D=3D=3D=3D=3D=3D


NEW FEATURES/CHANGES
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

Python 3.6 or later required
----------------------------

Samba's minimum runtime requirement for python was raised to Python
3.5 with samba 4.12.  Samba 4.13 raises this minimum version to Python
3.6 both to access new features and because this is the oldest version
we test with in our CI infrastructure.

This is also the last release where it will be possible to build Samba
(just the file server) with Python versions 2.6 and 2.7.

As Python 2.7 has been End Of Life upstream since April 2020, Samba
is dropping ALL Python 2.x support in the NEXT release.

Samba 4.14 to be released in March 2021 will require Python 3.6 or
later to build.

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


CHANGES SINCE 4.13.0rc4
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

o  Andreas Schneider <asn@samba.org>
   * BUG 14399: waf: Only use gnutls_aead_cipher_encryptv2() for GnuTLS >
     3.6.14.
   * BUG 14467: s3:smbd: Fix %U substitutions if it contains a domain name.
   * BUG 14479: The created krb5.conf for 'net ads join' doesn't have a dom=
ain
     entry.

o  Stefan Metzmacher <metze@samba.org>
   * BUG 14482: Fix build problem if libbsd-dev is not installed.


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

        https://download.samba.org/pub/samba/rc/samba-4.13.0rc5.WHATSNEW.txt

Our Code, Our Bugs, Our Responsibility.
(https://bugzilla.samba.org/)

                        --Enjoy
                        The Samba Team

--6c2NcOVqGQ03X4Wi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQQlQWgAwvkyRy78FZYoaL1+KxeTUQUCX2DIBgAKCRAoaL1+KxeT
UdDBAJ0VNBKKrkkX+URw+vAc//Ibh+WxMwCfdBqINF82Ldx+LMvixqfB/MS5TfM=
=Ltt7
-----END PGP SIGNATURE-----

--6c2NcOVqGQ03X4Wi--

