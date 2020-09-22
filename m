Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DC112743D6
	for <lists+samba-technical@lfdr.de>; Tue, 22 Sep 2020 16:07:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=0CgI5NXnIgbY67TYY87pfFzynGWeQ+CeqefVNSLUWNo=; b=j8R3n/Zb/ihR+6O+RiAXNWIhCB
	C7bDFoNjRYx3SpLXvfC1zBhmjQz6btbLgFgHFU4tlNCdnfjRwhxCcW8uAEsuShloY2YTHUPHf9POM
	zZqbsJ2cdyF8mfbIq/kor1IbouLXJdP/WruhnTrngHKcGhnx6HDPCmNCevv9Uuj77UVL24rsZU5t0
	ndwJNI+a0CsbrQCNU56cdRhCwzHHDz8MqTs5EGE7o/b6GLYFtijcPtq8j+uU9HzhsW3WvcA03JZrW
	RxJd+v05boVpiHgvxxkWxh/THrj4iRhk3LUs8Plem149GgYYpFhPFPCgX6F1cWcFobYOfeFOEcG9a
	IA/1ycLw==;
Received: from localhost ([::1]:38582 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kKiwW-006g6h-Ik; Tue, 22 Sep 2020 14:06:52 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:49784) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kKiwB-006g5y-Vf; Tue, 22 Sep 2020 14:06:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:To:From:Date:CC;
 bh=0CgI5NXnIgbY67TYY87pfFzynGWeQ+CeqefVNSLUWNo=; b=t/TIVvElttoT31W3dXjOxkaE7M
 5W4MdkTJbHUbN08KhirgtsWTk60YjePI6F6dpXHwqI2D15FVnuXfcNMj0bWbaj2zs8G0UrP28Hbk+
 KH3yzrDJz72eN1XPWwF6DENX7djTnnt/pGwilINSjARYMieXPUc4Ctxd5xM/qzCMM7qg7r2YQNBik
 i4Gr7/ohiklJc4uCV6DL5pEGjfs2ukT+6lQ7odNklixUJo/ibc4tVsCFj1WO9IRRIdKQvdMpqEcJi
 0+RQJz3oHb1qa4i4fE9pid3gSGohLoy60Hcyx92YZuNQjUt8GplEQt1VOlvf0L2J6wSs8FUC/fsI5
 KZ8uPT5cuMBGGNUkT/Tx4AdiDbEcCvKWyVtoHxa4XQJx4K8d6Yw/CEHXNjMYIisX0tL8nxcuyE8xd
 Ea2s0wutpeb4qrgOL4RpFSyoTHwbsikcbz5zoOiQ1nW9HID5Kh/P5yuLbw7zdxZkycSvEN6A4OikE
 60cStlN47SUqBXEI8p1lfkcJ;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1kKiw5-0008LP-50; Tue, 22 Sep 2020 14:06:25 +0000
Date: Tue, 22 Sep 2020 16:06:23 +0200
To: samba-announce@lists.samba.org, samba@lists.samba.org,
 samba-technical@lists.samba.org
Subject: [Announce] Samba 4.13.0 Available for Download
Message-ID: <20200922140620.GA16336@carrie2>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="envbJBWh7q8WU6mo"
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


--envbJBWh7q8WU6mo
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Release Announcements
---------------------

This is the first stable release of the Samba 4.13 release series.
Please read the release notes carefully before upgrading.


ZeroLogon
=3D=3D=3D=3D=3D=3D=3D=3D=3D

Please avoid to set "server schannel =3D no" and "server schannel=3D auto" =
on all
Samba domain controllers due to the wellknown ZeroLogon issue.

For details please see
https://www.samba.org/samba/security/CVE-2020-1472.html.


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

The deprecated "server schannel" smb.conf option will very likely
removed in the final 4.13.0 release.


smb.conf changes
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

  Parameter Name                      Description                Default
  --------------                      -----------                -------
  ldap ssl ads                        Removed
  smb2 disable lock sequence checking Added                      No
  smb2 disable oplock break retry     Added                      No
  domain logons                       Deprecated                 no
  raw NTLMv2 auth                     Deprecated                 no
  client plaintext auth               Deprecated                 no
  client NTLMv2 auth                  Deprecated                 yes
  client lanman auth                  Deprecated                 no
  client use spnego                   Deprecated                 yes
  server schannel                     To be removed in 4.13.0
  server require schannel:COMPUTER    Added


CHANGES SINCE 4.13.0rc5
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

o  Jeremy Allison <jra@samba.org>
   * BUG 14497: CVE-2020-1472(ZeroLogon): s3:rpc_server/netlogon: Protect
     netr_ServerPasswordSet2 against unencrypted passwords.

o  G=C3=BCnther Deschner <gd@samba.org>
   * BUG 14497: CVE-2020-1472(ZeroLogon): s3:rpc_server/netlogon: Support
     "server require schannel:WORKSTATION$ =3D no" about unsecure configura=
tions.

o  Gary Lockyer <gary@catalyst.net.nz>
   * BUG 14497: CVE-2020-1472(ZeroLogon): s4 torture rpc: repeated bytes in
     client challenge.

o  Stefan Metzmacher <metze@samba.org>
   * BUG 14497: CVE-2020-1472(ZeroLogon): libcli/auth: Reject weak client
     challenges in netlogon_creds_server_init()
     "server require schannel:WORKSTATION$ =3D no".


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

        https://download.samba.org/pub/samba/stable/

The release notes are available online at:

        https://www.samba.org/samba/history/samba-4.13.0.html

Our Code, Our Bugs, Our Responsibility.
(https://bugzilla.samba.org/)

                        --Enjoy
                        The Samba Team

--envbJBWh7q8WU6mo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQQlQWgAwvkyRy78FZYoaL1+KxeTUQUCX2oE2AAKCRAoaL1+KxeT
UZPCAKCS12cy2t0PU3HcfEU7MfpMp4jRQACfSfpGGwKcvSwIhlleIxhvnebv5S4=
=j+Db
-----END PGP SIGNATURE-----

--envbJBWh7q8WU6mo--

