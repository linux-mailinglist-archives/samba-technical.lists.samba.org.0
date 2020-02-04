Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 07A951518BA
	for <lists+samba-technical@lfdr.de>; Tue,  4 Feb 2020 11:22:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=LhCeF8toWJwUSbg3nKbejZZR5Q2KxV4ZVO7EsQt3HKg=; b=3kpCD3SUhsNVDjAQGFxQkOEi0w
	xZ5b3mLlFBkddYYGvnP0G29Scxf2LBETgLPSs0FkHX4kteBwKV/QquKCKJM9fUrd8df7i6gbl79/o
	2WYuffU7oZmBHseNufMQ3y2PbRCWKXTni9QOHAw2N06kBO3X0LvrZQOxEcWP9i0kNTRYFx4vEM4ik
	H2tQTfuuZGqATFudz4APblD1FJBrsfpJ5yfdwOzkEvrW8iKTetRZ7cvnO+kRE+bp2bijpotc0Td/Q
	QRsANKDxVXcUtwi8X8oV/62rAr4e6H+bnoPNN+r+/Qsdmlm68KjSGuWvxBTz8qV3x5Qcb0JZZBBAH
	lPT9QMgw==;
Received: from localhost ([::1]:61436 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iyvLX-0085GB-Td; Tue, 04 Feb 2020 10:22:20 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:62932) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iyvLP-0085FT-BS; Tue, 04 Feb 2020 10:22:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:To:From:Date:CC;
 bh=LhCeF8toWJwUSbg3nKbejZZR5Q2KxV4ZVO7EsQt3HKg=; b=e9wxbQu/P0RBH0S2vEfSmrQN0u
 ytKEHVtmr6VEYS+pEOaZK3/0vb8VBV6Js8v91xi7RLzajnNjzW+vlnuYs+eHyAgmQkfESM3Vj0zQG
 VrenangH53mMdaTzCl+H58bSohttS7myiNahdHS+wwGIH91Oc84GF83jvurm94QOCyebNlVpnwvf4
 sVzSmIp6ihmOIw9fv/IXEHd9AH75Q8r/Cp40jKysKdonReSDfKikIiOCq1MBX5DdrlAb+EZGegn0A
 LaEaCvFv25dr5E7vZP2WcyjQtCdzji6glLXAvGQrCC1coy9nJoONFjj2+iHZD2sK6JwxWrHzJEJvF
 xEtXpnJKF6C6gNUf41zgGrpVCYbxGtMVv0gyipT1A4sKUVMKU9s9CheRCc4T52y4jlgqkE+fhA5hS
 z0/sCyOQybtQPOQODbyZTVTj4GuJfFGW1le8SbFAfLahtLf6GXfnkVyTaciZ4Ahs5JyGZxcnHnKzQ
 58fNwM6C1i7I74BVjtU0oQqt;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1iyvLO-0004y4-VN; Tue, 04 Feb 2020 10:22:11 +0000
Date: Tue, 4 Feb 2020 11:22:09 +0100
To: samba-announce@lists.samba.org, samba@lists.samba.org,
 samba-technical@lists.samba.org
Subject: [Announce] Samba 4.12.0rc2 Available for Download
Message-ID: <20200204102207.GA10576@carrie2>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="Qxx1br4bt0+wmkIi"
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


--Qxx1br4bt0+wmkIi
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Release Announcements
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

This is the second release candidate of Samba 4.12.  This is *not*
intended for production environments and is designed for testing
purposes only.  Please report any defects via the Samba bug reporting
system at https://bugzilla.samba.org/.

Samba 4.12 will be the next version of the Samba suite.


UPGRADING
=3D=3D=3D=3D=3D=3D=3D=3D=3D


NEW FEATURES/CHANGES
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

Python 3.5 Required
-------------------

Samba's minimum runtime requirement for python was raised to Python
3.4 with samba 4.11.  Samba 4.12 raises this minimum version to Python
3.5 both to access new features and because this is the oldest version
we test with in our CI infrastructure.

(Build time support for the file server with Python 2.6 has not
changed)

Removing in-tree cryptography: GnuTLS 3.4.7 required
----------------------------------------------------

Samba is making efforts to remove in-tree cryptographic functionality,
and to instead rely on externally maintained libraries.  To this end,
Samba has chosen GnuTLS as our standard cryptographic provider.

Samba now requires GnuTLS 3.4.7 to be installed (including development
headers at build time) for all configurations, not just the Samba AD
DC.

Thanks to this work Samba no longer ships an in-tree DES
implementation and on GnuTLS 3.6.5 or later Samba will include no
in-tree cryptography other than the MD4 hash and that
implemented in our copy of Heimdal.

Using GnuTLS for SMB3 encryption you will notice huge performance and copy
speed improvements. Tests with the CIFS Kernel client from Linux Kernel 5.3
show a 3x speed improvement for writing and a 2.5x speed improvement for re=
ads!

NOTE WELL: The use of GnuTLS means that Samba will honour the
system-wide 'FIPS mode' (a reference to the US FIPS-140 cryptographic
standard) and so will not operate in many still common situations if
this system-wide parameter is in effect, as many of our protocols rely
on outdated cryptography.

A future Samba version will mitigate this to some extent where good
cryptography effectively wraps bad cryptography, but for now that above
applies.


"net ads kerberos pac save" and "net eventlog export"
-----------------------------------------------------

The "net ads kerberos pac save" and "net eventlog export" tools will
no longer silently overwrite an existing file during data export.  If
the filename given exits, an error will be shown.

VFS
=3D=3D=3D

SMB_VFS_NTIMES
--------------

Samba now uses a sentinel value based on utimensat(2) UTIME_OMIT to denote
to-be-ignored timestamp variables passed to the SMB_VFS_NTIMES() VFS functi=
on.

VFS modules can check whether any of the time values inside a struct
smb_file_time is to be ignored by calling is_omit_timespec() on the value.

REMOVED FEATURES
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

The smb.conf parameter "write cache size" has been removed.

Since the in-memory write caching code was written, our write path has
changed significantly. In particular we have gained very flexible
support for async I/O, with the new linux io_uring interface in
development.  The old write cache concept which cached data in main
memory followed by a blocking pwrite no longer gives any improvement
on modern systems, and may make performance worse on memory-contrained
systems, so this functionality should not be enabled in core smbd
code.

In addition, it complicated the write code, which is a performance
critical code path.

If required for specialist purposes, it can be recreated as a VFS
module.

BIND9_FLATFILE deprecated
-------------------------

The BIND9_FLATFILE DNS backend is deprecated in this release and will
be removed in the future.  This was only practically useful on a single
domain controller or under expert care and supervision.

This release removes the "rndc command" smb.conf parameter, which
supported this configuration by writing out a list of DCs permitted to
make changes to the DNS Zone and nudging the 'named' server if a new
DC was added to the domain.  Administrators using BIND9_FLATFILE will
need to maintain this manually from now on.


Retiring DES encryption types in Kerberos.
------------------------------------------
With this release, support for DES encryption types has been removed from
Samba, and setting DES_ONLY flag for an account will cause Kerberos
authentication to fail for that account (see RFC-6649).

Samba-DC: DES keys no longer saved in DB.
-----------------------------------------
When a new password is set for an account, Samba DC will store random keys
in DB instead of DES keys derived from the password.  If the account is bei=
ng
migrated to Windbows or to an older version of Samba in order to use DES ke=
ys,
the password must be reset to make it work.

Heimdal-DC: removal of weak-crypto.
-----------------------------------
Following removal of DES encryption types from Samba, the embedded Heimdal
build has been updated to not compile weak crypto code (HEIM_WEAK_CRYPTO).

CTDB changes
------------

* The ctdb_mutex_fcntl_helper periodically re-checks the lock file

  The re-check period is specified using a 2nd argument to this
  helper.  The default re-check period is 5s.

  If the file no longer exists or the inode number changes then the
  helper exits.  This triggers an election.


smb.conf changes
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

  Parameter Name                     Description                Default
  --------------                     -----------                -------

  nfs4:acedup                        Changed default            merge
  rndc command                       Removed
  write cache size                   Removed


CHANGES SINCE 4.12.0rc1
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

o  Jeremy Allison <jra@samba.org>
   * BUG 14239: s3: lib: nmblib. Clean up and harden nmb packet processing.

o  Andreas Schneider <asn@samba.org>
   * BUG 14253: lib:util: Log mkdir error on correct debug levels.


KNOWN ISSUES
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

https://wiki.samba.org/index.php/Release_Planning_for_Samba_4.12#Release_bl=
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

        https://download.samba.org/pub/samba/rc/samba-4.12.0rc2.WHATSNEW.txt

Our Code, Our Bugs, Our Responsibility.
(https://bugzilla.samba.org/)

                        --Enjoy
                        The Samba Team

--Qxx1br4bt0+wmkIi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQQlQWgAwvkyRy78FZYoaL1+KxeTUQUCXjlFzAAKCRAoaL1+KxeT
UWs4AKCUNUsMfbtK5CjEarr4NWKb/OOPEwCaA40v2Whv9liBrEZVkQI3fv/kmlQ=
=kO52
-----END PGP SIGNATURE-----

--Qxx1br4bt0+wmkIi--

