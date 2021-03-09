Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 44CBF3325E2
	for <lists+samba-technical@lfdr.de>; Tue,  9 Mar 2021 13:56:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=YbKjf9uIsd3mwClmtlrc07QE6Tya16en1Sl3w2FHPvw=; b=5E0uLEhufY2QWwatuBgsoZZJuC
	8KkYiQ2qygHGJJf7ENQhVy4Bv8pduU0ZH8oB4UiS/+Ml8STJa9AWZdEwmKdwKn+TE2DD5PsYvUTzv
	r7caw3YqbrzvUkTe6wARz7LocY23/eVy0zhCPDeH9gERZmzub6T4Hv1Zvg+1nhIWFyQQ1jvbBaYjb
	3RTIZ5wcnkfOglTeIO2QS3911ErXgaJ9RnfBjQJgx+A9z02X3wTjnTG5DVxbs1eAP07wdJmPM14xk
	lHUDmuRaqWr2rvObS7qRGsETzm2YgKJTAOq66XfXGqwZqiKE1lV8KXegvsXnHbbzNcgQRBQwpN8v/
	LEyoYcrQ==;
Received: from ip6-localhost ([::1]:34580 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lJbtg-004cab-EA; Tue, 09 Mar 2021 12:55:36 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:23780) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lJbtR-004cZv-En; Tue, 09 Mar 2021 12:55:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:To:From:Date:CC;
 bh=YbKjf9uIsd3mwClmtlrc07QE6Tya16en1Sl3w2FHPvw=; b=oUMhjepTl/RWMBWld1NaITCoau
 c9DJIk1fGOAN9VQai0uWyfiuquGh5GWlz4/Ht1D0eUxD7F6j6kQ71P/X62+CnaLyJaem8Qcxggrqc
 qfOH3QxATGSWTFXjo8JpnwBT49H/Sq2XZUt8dWcfPrhH2L5XGdjM08Vbb6mqFkOJZs1kUmZD47uRQ
 3iAWg4826oSTDeIkTrDVgUIpnuhgKb/phsbEIE7otrVDZ98OdAsWMZo7YrNel2cJORRAaLaU4ZvRZ
 OMbWIwAO1txJfk/vA2Mw6BknWODSfLMUrGU/Zpsk1Xtlg36u9OjnNByMfE/lanj+85ImgH184ndQC
 GpndJDnnWb4A7vIvVE6+X43P6Sub4H9GlwIP3NaQKM1TI8mP5vLvyEnM4Ultr9IliwQwoR23x0mwM
 uD8xdQX9siZc7zyOv/DeXVJ0XI9MScpZhPJE+Mtn9rd34yxcdERBWE9zY0X9jNaVR/Z9BNAgujSLs
 3IcGNIP+F6tlqCslMTTNCNzd;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1lJbtQ-0000tW-3H; Tue, 09 Mar 2021 12:55:20 +0000
Date: Tue, 9 Mar 2021 13:55:18 +0100
To: samba-announce@lists.samba.org, samba@lists.samba.org,
 samba-technical@lists.samba.org
Subject: [Announce] Samba 4.14.0 Available for Download
Message-ID: <20210309125516.GA18745@carrie2.fritz.box>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="M9NhX3UHpAaciwkO"
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


--M9NhX3UHpAaciwkO
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Release Announcements
---------------------

This is the first stable release of the Samba 4.14 release series.
Please read the release notes carefully before upgrading.


New GPG key
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

The GPG release key for Samba releases changed from:

pub   dsa1024/6F33915B6568B7EA 2007-02-04 [SC] [expires: 2021-02-05]
      Key fingerprint =3D 52FB C0B8 6D95 4B08 4332  4CDC 6F33 915B 6568 B7EA
uid                 [  full  ] Samba Distribution Verification Key <samba-b=
ugs@samba.org>
sub   elg2048/9C6ED163DA6DFB44 2007-02-04 [E] [expires: 2021-02-05]

to the following new key:

pub   rsa4096/AA99442FB680B620 2020-12-21 [SC] [expires: 2022-12-21]
      Key fingerprint =3D 81F5 E283 2BD2 545A 1897  B713 AA99 442F B680 B620
uid                 [ultimate] Samba Distribution Verification Key <samba-b=
ugs@samba.org>
sub   rsa4096/97EF9386FBFD4002 2020-12-21 [E] [expires: 2022-12-21]

Starting from Jan 21th 2021, all Samba releases will be signed with the new=
 key.

See also GPG_AA99442FB680B620_replaces_6F33915B6568B7EA.txt


NEW FEATURES/CHANGES
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

Here is a copy of a clarification note added to the Samba code
in the file: VFS-License-clarification.txt.
--------------------------------------------------------------

A clarification of our GNU GPL License enforcement boundary within the Samba
Virtual File System (VFS) layer.

Samba is licensed under the GNU GPL. All code committed to the Samba
project or that creates a "modified version" or software "based on" Samba m=
ust
be either licensed under the GNU GPL or a compatible license.

Samba has several plug-in interfaces where external code may be called
=66rom Samba GNU GPL licensed code. The most important of these is the
Samba VFS layer.

Samba VFS modules are intimately connected by header files and API
definitions to the part of the Samba code that provides file services,
and as such, code that implements a plug-in Samba VFS module must be
licensed under the GNU GPL or a compatible license.

However, Samba VFS modules may themselves call third-party external
libraries that are not part of the Samba project and are externally
developed and maintained.

As long as these third-party external libraries do not use any of the
Samba internal structure, APIs or interface definitions created by the
Samba project (to the extent that they would be considered subject to the G=
NU
GPL), then the Samba Team will not consider such third-party external
libraries called from Samba VFS modules as "based on" and/or creating a
"modified version" of the Samba code for the purposes of GNU GPL.
Accordingly, we do not require such libraries be licensed under the GNU GPL
or a GNU GPL compatible license.

VFS
---

The effort to modernize Samba's VFS interface has reached a major milestone=
 with
the next release Samba 4.14.

For details please refer to the documentation at source3/modules/The_New_VF=
S.txt or
visit the <https://wiki.samba.org/index.php/The_New_VFS>.

Printing
--------

Publishing printers in AD is more reliable and more printer features are
added to the published information in AD. Samba now also supports Windows
drivers for the ARM64 architecture.

Client Group Policy
-------------------
This release extends Samba to support Group Policy functionality for Winbind
clients. Active Directory Administrators can set policies that apply Sudoers
configuration, and cron jobs to run hourly, daily, weekly or monthly.

To enable the application of Group Policies on a client, set the global
smb.conf option 'apply group policies' to 'yes'. Policies are applied on an
interval of every 90 minutes, plus a random offset between 0 and 30 minutes.

Policies applied by Samba are 'non-tattooing', meaning that changes can be
reverted by executing the `samba-gpupdate --unapply` command. Policies can =
be
re-applied using the `samba-gpupdate --force` command.
To view what policies have been or will be applied to a system, use the
`samba-gpupdate --rsop` command.

Administration of Samba policy requires that a Samba ADMX template be uploa=
ded
to the SYSVOL share. The samba-tool command `samba-tool gpo admxload` is
provided as a convenient method for adding this policy. Once uploaded, poli=
cies
can be modified in the Group Policy Management Editor under Computer
Configuration/Policies/Administrative Templates. Alternatively, Samba policy
may be managed using the `samba-tool gpo manage` command. This tool does not
require the admx templates to be installed.

Python 3.6 or later required
----------------------------

Samba's minimum runtime requirement for python was raised to Python
3.6 with samba 4.13.  Samba 4.14 raises this minimum version to Python
3.6 also to build Samba. It is no longer possible to build Samba
(even just the file server) with Python versions 2.6 and 2.7.

As Python 2.7 has been End Of Life upstream since April 2020, Samba
is dropping ALL Python 2.x support in this release.

Miscellaneous samba-tool changes
--------------------------------

The 'samba-tool' subcommands to manage AD objects (e.g. users, computers and
groups) now consistently use the "add" command when adding a new object to
the AD. The previous deprecation warnings when using the 'add' commands
have been removed. For compatibility reasons, both the 'add' and 'create'
commands can be used now.

Users, groups and contacts can now be renamed with the respective rename
commands.

Locked users can be unlocked with the new 'samba-tool user unlock' command.

The 'samba-tool user list' and 'samba-tool group listmembers' commands
provide additional options to hide expired and disabled user accounts
(--hide-expired and --hide-disabled).


CTDB CHANGES
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

* The NAT gateway and LVS features now uses the term "leader" to refer
  to the main node in a group through which traffic is routed and
  "follower" for other members of a group.  The command for
  determining the leader has changed to "ctdb natgw leader" (from
  "ctdb natgw master").  The configuration keyword for indicating that
  a node can not be the leader of a group has changed to
  "follower-only" (from "slave-only").  Identical changes were made
  for LVS.

* Remove "ctdb isnotrecmaster" command.  It isn't used by CTDB's
  scripts and can be checked by users with "ctdb pnn" and "ctdb
  recmaster".


smb.conf changes
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

  Parameter Name                     Description                Default
  --------------                     -----------                -------
  smb encrypt                        Removed
  async dns timeout                  New                        10
  client smb encrypt                 New                        default
  honor change notify privilege      New                        No
  smbd force process locks           New                        No
  server smb encrypt                 New                        default


CHANGES SINCE 4.14.0rc4
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

o  Trever L. Adams <trever.adams@gmail.com>
   * BUG 14634: s3:modules:vfs_virusfilter: Recent talloc changes cause inf=
inite
     start-up failure.

o  Peter Eriksson <pen@lysator.liu.se>
   * BUG 14648: s3: VFS: nfs4_acls. Add missing TALLOC_FREE(frame) in error
     path.

o  Volker Lendecke <vl@samba.org>
   * BUG 14636: g_lock: Fix uninitalized variable reads.


CHANGES SINCE 4.14.0rc3
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

o  Jeremy Allison <jra@samba.org>
   * BUG 14604: smbd: In conn_force_tdis_done() when forcing a connection c=
losed
     force a full reload of services.

o  Andrew Bartlett <abartlet@samba.org>
   * BUG 14593: dbcheck: Check Deleted Objects and reduce noise in reports =
about
     expired tombstones.

o  Ralph Boehme <slow@samba.org>
   * BUG 14619: vfs: Restore platform specific POSIX sys_acl_set_file()
     functions.
   * BUG 14620: Fix the build on AIX.
   * BUG 14629: smbd: Don't overwrite _mode if neither a msdfs symlink nor
     get_dosmode is requested.
   * BUG 14635: Fix printer driver upload.


CHANGES SINCE 4.14.0rc2
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

o  Bj=C3=B6rn Jacke <bj@sernet.de>
   * BUG 14624: classicupgrade: Treat old never expires value right.

o  Stefan Metzmacher <metze@samba.org>
   * BUG 13898: s3:pysmbd: fix fd leak in py_smbd_create_file().

o  Andreas Schneider <asn@samba.org>
   * BUG 14625: Fix smbd share mode double free crash.

o  Paul Wise <pabs3@bonedaddy.net>
   * BUG 12505: HEIMDAL: krb5_storage_free(NULL) should work.


CHANGES SINCE 4.14.0rc1
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

o  Jeremy Allison <jra@samba.org>
   * BUG 13992: Fix SAMBA RPC share error.

o  Ralph Boehme <slow@samba.org>
   * BUG 14602: "winbind:ignore domains" doesn't prevent user login from tr=
usted
     domain.
   * BUG 14617: smbd tries to delete files with wrong permissions (uses gue=
st
     instead of user from force user =3D).

o  Stefan Metzmacher <metze@samba.org>
   * BUG 14539: s3:idmap_hash: Reliably return ID_TYPE_BOTH.

o  Andreas Schneider <asn@samba.org>
   * BUG 14627: s3:smbd: Fix invalid memory access in
     posix_sys_acl_blob_get_fd().


KNOWN ISSUES
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

https://wiki.samba.org/index.php/Release_Planning_for_Samba_4.14#Release_bl=
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
using GnuPG (ID AA99442FB680B620).  The source code can be downloaded
=66rom:

        https://download.samba.org/pub/samba/stable/

The release notes are available online at:

        https://www.samba.org/samba/history/samba-4.14.0.html

Our Code, Our Bugs, Our Responsibility.
(https://bugzilla.samba.org/)

                        --Enjoy
                        The Samba Team

--M9NhX3UHpAaciwkO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQQlQWgAwvkyRy78FZYoaL1+KxeTUQUCYEdwMgAKCRAoaL1+KxeT
UcmsAJ4sZMO/RYgxeLaSNEdPYvJoRycSCwCdG8K6FyLZci+GeeLCozCi4eSu9dc=
=Nb7G
-----END PGP SIGNATURE-----

--M9NhX3UHpAaciwkO--

