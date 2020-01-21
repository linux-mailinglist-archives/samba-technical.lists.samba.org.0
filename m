Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 62C3314420A
	for <lists+samba-technical@lfdr.de>; Tue, 21 Jan 2020 17:21:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=B83TyqmtHrG/l1sneUIx/0pVjqmuodw9DsrMQFsDiu0=; b=u5wDXb8tw69sApZ4Pa36FocZMS
	6NYtZ8fxsHGI24LmNUEYBybJzbIUism/lfafcMna2Li5+PeLAhjSs73NclI7H5mMzUGfy9BZ8+v3m
	5pF+BXSSg9V4DRj5p6czmk/Us2KH/m+O7V2ZxHlTBNGBphjEl1nh32z5JvXPLBnyA3wfyqBPI5RKR
	KnnRyl/6UGiix4TCaUPgsTMi5EGjl10U++ILv6GXMxCftxyq77mR2YWJzLE3FD/GJei6RJFxiGXwQ
	UcasUul1Aj2A1UOu/mnvbmeycl9UW8OI6KjvMK1H7kbu3bf7sQGn8Il6N742vkTkeU0MbRyD5jIKE
	V7wZ8o9Q==;
Received: from localhost ([::1]:37584 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1itwHD-00452l-4S; Tue, 21 Jan 2020 16:21:15 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:46500) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1itwH2-004525-Kt; Tue, 21 Jan 2020 16:21:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:To:From:Date:CC;
 bh=B83TyqmtHrG/l1sneUIx/0pVjqmuodw9DsrMQFsDiu0=; b=k/YdIZF7+iqJ29pKCLe2mVIOUZ
 V4her2olU0U8L2u9BeBzjt/BgT16BFMRfOXk0lArdf7ONeaOm73pSSBcTalBT9hRb5gp+2RqVVl9a
 Iz1X2/Dr5jaBaDIMjnZu7OGo1SUOh/00zuM6h/qv0TO9mAezEg4/O9uXeGIi/xLMhPeojbXb0COlv
 wGZ1XJ3jjU5OSL9iAePltVcDfQNg1vjozNrr2KLqy+yzckG7q+cJ3Bf8Ibz035l789kIcmzhE1Fy1
 87WTjvfi2fJSbVA1Ng95kC3Mg0/6Ho6SpEb+wjGdtOBIc42E+PXRvw4XdhrJlNqbL8oZ6GKex8ZH5
 xZgsXxezr63RR3KS97yk/afliqB+QW70vEcR5cH0/0Yibt2JJUbfpcIiZIEBaz60hjj3X1WeVKhNQ
 rNsLAg3NDpmB/PL1a8FEItv5KDeQt/YEWkGGWXIaw87AgkmfTzHYPOmbsWaJuLKj+hqRxSzDfi7S0
 9XQLoVPR8LhVTR718ISp2ScJ;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1itwH2-00057c-BY; Tue, 21 Jan 2020 16:21:04 +0000
Date: Tue, 21 Jan 2020 17:20:57 +0100
To: samba-announce@lists.samba.org, samba@lists.samba.org,
 samba-technical@lists.samba.org
Subject: [Announce] Samba 4.12.0rc1 Available for Download
Message-ID: <20200121161918.GA16370@SERNOX19>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="rS8CxjVDS/+yyDmU"
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
From: Stefan Metzmacher via samba-technical <samba-technical@lists.samba.org>
Reply-To: Stefan Metzmacher <metze@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>


--rS8CxjVDS/+yyDmU
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Release Announcements
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

This is the first release candidate of Samba 4.12.  This is *not*
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

        https://download.samba.org/pub/samba/rc/samba-4.12.0rc1.WHATSNEW.txt

Our Code, Our Bugs, Our Responsibility.
(https://bugzilla.samba.org/)

                        --Enjoy
                        The Samba Team

--rS8CxjVDS/+yyDmU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEfFbGo3YXpfgryIw9DbX1YShpvVYFAl4nJNsACgkQDbX1YShp
vVZryQ//Wm+U/82M3fU4q5/MdstBAoWOAuZvdOe8iR3lS26TI9z0Nen5lkogajDe
L/8JDpIS5Rhg+WXJzo2IUFD5je2+0/wgBrd9a05C7mayb7TSW/yqdn0h4cphR5fa
PWAANSlWdOeVb3FdPOiRmCwFBX+kJmYG6aQfzBAG7rQbAeL+2UI32s8fFSWflVTW
jrdmR3BwleYEKiGJVvO8sU8UOJar5vU6DXpleZFj1qGTiOCeTMhlN48byUEwpTYD
BFm/aniniK3PcnOeQOAmrk1M/BmvxcdyvrTk3VPTHMsxvnlqPn1Ae0aUiZg7KYcz
o/clV3E7J22FVpDAKIXMHUhHRcVSsSLlkafylczCd8M5iCuPokXWZs62Ztdhw+pA
SMpKHTl6xipU6vrOwwwIIYJlV05AGYhCYzaIYvnDvtzu4t7zxtNka4R/w8/pE+lW
3X8JfGxpUeoND4/2peD0TKBkTRxDTGQuSkBrPyg1CfKG6q3+7nCrTYxCbigWiIlT
SjpYucNszPkEUjg20Kc8b/2ycbcpSMv2mxTxPq7XtL51AMELBeHABP+33X/ogq55
+LJ004wrqwkgBpSdappXb8U3z51KdRh4vfQKRLUpgWcds0oAMSW09twmjoiF6+F8
R3xcF3BvQPCuvs8ltSNbx0wkoi59YFzDh+HgpGI0rQ8VM99dkLM=
=Gwjm
-----END PGP SIGNATURE-----

--rS8CxjVDS/+yyDmU--

