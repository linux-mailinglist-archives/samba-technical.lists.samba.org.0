Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D5F516F8E2
	for <lists+samba-technical@lfdr.de>; Wed, 26 Feb 2020 09:02:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=Sr29S8/VdXpg+xzJW34FdaEesLZQf1N5cIH7ukAyAn8=; b=IBfsQMfIDFivbL6uyorrXjqS3e
	Kyy41uZ6MXEGN6dit/gpTN53wgbH711XvHGXcYR8leWYbSuTM1blO9POq5QGZGyy/0J9T8YoRe8yt
	an8NhehKP2os3XojBCXUkZ6sLmvvoYmOId++lQpuCXCBczJOrRP+6caIjY7YL+Mgej9c08nt9uyA5
	b6yhUsPKhNiCMZPeHSSLXwhbIlaxEV/6qQWl+TKbO0s0RUCgTqkdBQEqqxynz4h72Cg00gzSOBCyr
	6saEVjVG0/JDrT78bem3mYhClr1P7CAHz8JQf2TeDE+7rNlRZzNwpKoRiUZSzF3Evz66xhyenectb
	KMJS6wqQ==;
Received: from localhost ([::1]:22622 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1j6rdj-00BioL-JQ; Wed, 26 Feb 2020 08:01:55 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:21480) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1j6rdQ-00Binf-3I; Wed, 26 Feb 2020 08:01:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:To:From:Date:CC;
 bh=Sr29S8/VdXpg+xzJW34FdaEesLZQf1N5cIH7ukAyAn8=; b=WNfpScOVszfuRzv1/u35lXlpZJ
 TOH0p8+GLstS2ITN9e44a65xmLqlDTLj/q+ce900Kd/KpPz9ugV7he8XiitswoR+9HfgdVqXdVvt4
 K8eOiUWwYmaWvgoYcACHq/bM744QZvtBt+zCMl4E+7JFS1gbe04ieVdeVhcTZaH8QdeSzGbozMg+g
 t4afUhhBtQr79Poe0tzBFVCIeVmsYJ2lEgGElfJrZl/hdkeUuB1YRejB0/GiBPbOyAho3b9KK6ev/
 xiE8tkTWTOVEKqPuEvK/XAeGlkTGAcADh4KqkpIcdIzu4qUp5z+p1Ta8698791gfXhjb8bV1q38e+
 N5A8O+uAg0kCmpZJyZwFjlXkTtlklzO78l/DhzqbNZUQNkwtfca0w7l6NLTGrru22+Hj1E26iop3E
 j5dI6/g8KKj6fKKaxpMSjVohR82XS987UDX3XSeSzNPMXeY9e5hFx5za5wc8MZYaGwwz15l/sRihg
 XIF3i8XGio8RtCR8iBif1Phn;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1j6rdP-0004iI-Ko; Wed, 26 Feb 2020 08:01:35 +0000
Date: Wed, 26 Feb 2020 09:01:34 +0100
To: samba-announce@lists.samba.org, samba@lists.samba.org,
 samba-technical@lists.samba.org
Subject: [Announce] Samba 4.12.0rc4 Available for Download
Message-ID: <20200226080132.GA11231@carrie2>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="liOOAslEiF7prFVr"
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


--liOOAslEiF7prFVr
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Release Announcements
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

This is the fourth release candidate of Samba 4.12.  This is *not*
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

zlib library is now required to build Samba
-------------------------------------------

Samba no longer includes a local copy of zlib in our source tarball.
By removing this we do not need to ship (even where we did not
build) the old, broken zip encryption code found there.

New Spotlight backend for Elasticsearch
---------------------------------------

Support for the macOS specific Spotlight search protocol has been enhanced
significantly. Starting with 4.12 Samba supports using Elasticsearch as sea=
rch
backend. Various new parameters have been added to configure this:

  spotlight backend =3D noindex | elasticsearch | tracker
  elasticsearch:address =3D ADDRESS
  elasticsearch:port =3D PORT
  elasticsearch:use tls =3D BOOLEAN
  elasticsearch:index =3D INDEXNAME
  elasticsearch:mappings =3D PATH
  elasticsearch:max results =3D NUMBER

Samba also ships a Spotlight client command "mdfind" which can be used to s=
earch
any SMB server that runs the Spotlight RPC service. See the manpage of mdfi=
nd
for details.

Note that when upgrading existing installations that are using the previous
default Spotlight backend Gnome Tracker must explicitly set "spotlight back=
end =3D
tracker" as the new default is "noindex".

'net ads kerberos pac save' and 'net eventlog export'
-----------------------------------------------------

The 'net ads kerberos pac save' and 'net eventlog export' tools will
no longer silently overwrite an existing file during data export.  If
the filename given exits, an error will be shown.

Fuzzing
-------

A large number of fuzz targets have been added to Samba, and Samba has
been registered in Google's oss-fuzz cloud fuzzing service.  In
particular, we now have good fuzzing coverage of our generated NDR
parsing code.

A large number of issues have been found and fixed thanks to this
effort.

'samba-tool' improvements add contacts as member to groups
----------------------------------------------------------

Previously 'samba-tool group addmemers' can just add users, groups and
computers as members to groups. But also contacts can be members of
groups. Samba 4.12 adds the functionality to add contacts to
groups. Since contacts have no sAMAccountName, it's possible that
there are more than one contact with the same name in different
organizational units. Therefore it's necessary to have an option to
handle group members by their DN.

To get the DN of an object there is now the "--full-dn" option available
for all necessary commands.

The MS Windows UI allows to search for specific types of group members
when searching for new members for a group. This feature is included
here with the new samba-tool group addmembers "--object-type=3DOBJECTYPE"
option. The different types are selected accordingly to the Windows
UI. The default samba-toole behaviour shouldn't be changed.

Allow filtering by OU or subtree in samba-tool
----------------------------------------------

A new "--base-dn" and "--member-base-dn" option is added to relevant
samba-tool user, group and ou management commands to allow operation
on just one part of the AD tree, such as a single OU.

VFS
=3D=3D=3D

SMB_VFS_NTIMES
--------------

Samba now uses a sentinel value based on utimensat(2) UTIME_OMIT to denote
to-be-ignored timestamp variables passed to the SMB_VFS_NTIMES() VFS functi=
on.

VFS modules can check whether any of the time values inside a struct
smb_file_time is to be ignored by calling is_omit_timespec() on the value.

'io_uring' vfs module
---------------------

The module makes use of the new io_uring infrastructure
(intruduced in Linux 5.1), see https://lwn.net/Articles/776703/

Currently this implements SMB_VFS_{PREAD,PWRITE,FSYNC}_SEND/RECV
and avoids the overhead of the userspace threadpool in the default
vfs backend. See also vfs_io_uring(8).

In order to build the module you need the liburing userspace library
and its developement headers installed, see
https://git.kernel.dk/cgit/liburing/

At runtime you'll need a Linux kernel with version 5.1 or higher.
Note that 5.4.14 and 5.4.15 have a regression that breaks the Samba
module! The regression was fixed in Linux 5.4.16 again.

MS-DFS changes in the VFS
-------------------------

This release changes set getting and setting of MS-DFS redirects
on the filesystem to go through two new VFS functions:

SMB_VFS_CREATE_DFS_PATHAT()
SMB_VFS_READ_DFS_PATHAT()

instead of smbd explicitly storing MS-DFS redirects inside
symbolic links on the filesystem. The underlying default
implementations of this has not changed, the redirects are
still stored inside symbolic links on the filesystem, but
moving the creation and reading of these links into the VFS
as first-class functions now allows alternate methods of
storing them (maybe in extended attributes) for OEMs who
don't want to mis-use filesystem symbolic links in this
way.


CTDB changes
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

* The ctdb_mutex_fcntl_helper periodically re-checks the lock file

  The re-check period is specified using a 2nd argument to this
  helper.  The default re-check period is 5s.

  If the file no longer exists or the inode number changes then the
  helper exits.  This triggers an election.


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

vfs_netatalk: The netatalk VFS module has been removed.
-------------------------------------------------------

The netatalk VFS module has been removed. It was unmaintained and is not ne=
eded
any more.

BIND9_FLATFILE deprecated
-------------------------

The BIND9_FLATFILE DNS backend is deprecated in this release and will
be removed in the future.  This was only practically useful on a single
domain controller or under expert care and supervision.

This release removes the 'rndc command' smb.conf parameter, which
supported this configuration by writing out a list of DCs permitted to
make changes to the DNS Zone and nudging the 'named' server if a new
DC was added to the domain.  Administrators using BIND9_FLATFILE will
need to maintain this manually from now on.


smb.conf changes
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

  Parameter Name                     Description                Default
  --------------                     -----------                -------

  elasticsearch:address              New                        localhost
  elasticsearch:port                 New                        9200
  elasticsearch:use tls              New                        No
  elasticsearch:index                New                        _all
  elasticsearch:mappings             New                        DATADIR/ela=
sticsearch_mappings.json
  elasticsearch:max results          New                        100
  nfs4:acedup                        Changed default            merge
  rndc command                       Removed
  write cache size                   Removed
  spotlight backend		     New			noindex


CHANGES SINCE 4.12.0rc3
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

o  Jeremy Allison <jra@samba.org>
   * BUG 14269: s3: DFS: Don't allow link deletion on a read-only share.

o  Douglas Bagnall <douglas.bagnall@catalyst.net.nz>
   * BUG 14284: pidl/wscript: configure should insist on Parse::Yapp::Drive=
r.

o  Andrew Bartlett <abartlet@samba.org>
   * BUG 14270: ldb: Fix search with scope ONE and small result sets.=20
   * BUG 14284: build: Do not check if system perl modules should be bundle=
d.

o  Volker Lendecke <vl@samba.org>
   * BUG 14285: smbd fails to handle EINTR from open(2) properly.

o  Stefan Metzmacher <metze@samba.org>
   * BUG 14270: ldb: version 2.1.1.


CHANGES SINCE 4.12.0rc2
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

o  Jeremy Allison <jra@samba.org>
   * BUG 14282: Set getting and setting of MS-DFS redirects on the filesyst=
em
     to go through two new VFS functions SMB_VFS_CREATE_DFS_PATHAT() and
     SMB_VFS_READ_DFS_PATHAT().

o  Andrew Bartlett <abartlet@samba.org>
   * BUG 14255: bootstrap: Remove un-used dependency python3-crypto.

o  Volker Lendecke <vl@samba.org>
   * BUG 14247: Fix CID 1458418 and 1458420.
   * BUG 14281: lib: Fix a shutdown crash with "clustering =3D yes".

o  Stefan Metzmacher <metze@samba.org>
   * BUG 14247: Winbind member (source3) fails local SAM auth with empty do=
main
     name.
   * BUG 14265: winbindd: Handle missing idmap in getgrgid().
   * BUG 14271: Don't use forward declaration for GnuTLS typedefs.
   * BUG 14280: Add io_uring vfs module.

o  Andreas Schneider <asn@samba.org>
   * BUG 14250: libcli:smb: Improve check for gnutls_aead_cipher_(en|de)cry=
ptv2.


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

        https://download.samba.org/pub/samba/rc/samba-4.12.0rc4.WHATSNEW.txt

Our Code, Our Bugs, Our Responsibility.
(https://bugzilla.samba.org/)

                        --Enjoy
                        The Samba Team

--liOOAslEiF7prFVr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQQlQWgAwvkyRy78FZYoaL1+KxeTUQUCXlYl2gAKCRAoaL1+KxeT
UWScAJ0W4pzzC4AqbisFymLmi3XtjQY1EgCdEBy3/HytH3yDeCEBa6ABUUCUTOY=
=yCB/
-----END PGP SIGNATURE-----

--liOOAslEiF7prFVr--

