Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id F32C3B49CF
	for <lists+samba-technical@lfdr.de>; Tue, 17 Sep 2019 10:49:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=bRpzDc67+37hLMyl8WlgTMzdgWkWp/tBd2V5Y5pxQ3s=; b=rgo1JoVSDaw6sle7CsnYLJRHqN
	mDF/guHBH+pSD14khnkeSUmLKTvG8pN7HABMYBJgyFjmm5hflibxewSARlbshd953o0Y0hh25amG5
	uWzwo7/tiSl9oTospBwrjVzTPYKvf9xuzFlibBCN7HUFf9hOSmyjs3QEzBUON3OOv7+RtFd8+k3XT
	T9S+y0SYroWT2ZHht/+tePohs+UuFhonnfTXgvbwnwwTyMo/WGHXO5DrRm5xrP1+Bsx9cCJ1ZZjil
	dvA5mjIAiJud7svpHmLVg1iPnqN9FDcZ/ERIfByceV+9IApV7ZtYZ2OTDfEs9smr/BeiacKW9qc5M
	r6cpNDnQ==;
Received: from localhost ([::1]:18692 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iA9AA-0069Bd-TS; Tue, 17 Sep 2019 08:48:42 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:43864) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iA9A2-0069As-Dy; Tue, 17 Sep 2019 08:48:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Message-ID:To:From:Date:CC;
 bh=bRpzDc67+37hLMyl8WlgTMzdgWkWp/tBd2V5Y5pxQ3s=; b=lKmV5acX2T/1apjkJN6jMosLRu
 QP2YX/zlcQBJD7lDA2YKBK2OaFyHOzyIh5EzB2Niomn2c1KNpExTfEtxRu+1+9b6kWL+qVEXWsRvF
 SES54yyU3yx4h4HNiMyx5pFR7Bz4iHZOret3zTw4WeNogqlyQ4W+7biYMgD+IbYxuzp4=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1iA9A2-0001RB-10; Tue, 17 Sep 2019 08:48:34 +0000
Date: Tue, 17 Sep 2019 10:48:32 +0200
To: samba-announce@lists.samba.org, samba@lists.samba.org,
 samba-technical@lists.samba.org
Subject: [Announce] Samba 4.11.0 Available for Download
Message-ID: <20190917084831.GA10700@carrie2>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="BXVAT5kNtrzKuDFl"
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


--BXVAT5kNtrzKuDFl
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
			  "Moonlight is sculpture."

			   Nathaniel Hawthorne
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D


Release Announcements
---------------------
	=09
This is the first stable release of the Samba 4.11 release series.
Please read the release notes carefully before upgrading.


UPGRADING
=3D=3D=3D=3D=3D=3D=3D=3D=3D

AD Database compatibility
-------------------------

Samba 4.11 has changed how the AD database is stored on disk. AD users shou=
ld
not really be affected by this change when upgrading to 4.11. However, AD
users should be extremely careful if they need to downgrade from Samba 4.11=
 to
an older release.

Samba 4.11 maintains database compatibility with older Samba releases. The
database will automatically get rewritten in the new 4.11 format when you
first start the upgraded samba executable.

However, when downgrading from 4.11 you will need to manually downgrade the=
 AD
database yourself. Note that you will need to do this step before you insta=
ll
the downgraded Samba packages. For more details, see:
https://wiki.samba.org/index.php/Downgrading_an_Active_Directory_DC

When either upgrading or downgrading, users should also avoid making any
database modifications between installing the new Samba packages and starti=
ng
the samba executable.

SMB1 is disabled by default
---------------------------

The defaults of 'client min protocol' and 'server min protocol'
have been changed to SMB2_02.

This means clients without support for SMB2 or SMB3 are no longer
able to connect to smbd (by default).

It also means client tools like smbclient and other,
as well as applications making use of libsmbclient are no longer
able to connect to servers without SMB2 or SMB3 support (by default).

It's still possible to allow SMB1 dialects, e.g. NT1, LANMAN2
and LANMAN1 for client and server, as well as CORE and COREPLUS on
the client.

Note that most commandline tools e.g. smbclient, smbcacls and others
also support the '--option' argument to overwrite smb.conf options,
e.g. --option=3D'client min protocol=3DNT1' might be useful.

As Microsoft no longer installs SMB1 support in recent releases
or uninstalls it after 30 days without usage, the Samba Team
tries to get remove the SMB1 usage as much as possible.

SMB1 is officially deprecated and might be removed step by step
in the following years. If you have a strong requirement for SMB1
(except for supporting old Linux Kernels), please file a bug
at https://bugzilla.samba.org and let us know about the details.

LanMan and plaintext authentication deprecated
----------------------------------------------

The "lanman auth" and "encrypt passwords" parameters are deprecated
with this release as both are only applicable to SMB1 and are quite
insecure.  NTLM, NTLMv2 and Kerberos authentication are unaffected, as
"encrypt passwords =3D yes" has been the default since Samba 3.0.0.

If you have a strong requirement for these authentication protocols,
please file a bug at https://bugzilla.samba.org and let us know about
the details.

BIND9_FLATFILE deprecated
-------------------------

The BIND9_FLATFILE DNS backend is deprecated in this release and will
be removed in the future.  This was only practically useful on a single
domain controller or under expert care and supervision.

This release therefore deprecates the "rndc command" smb.conf
parameter, which is used to support this configuration.  After writing
out a list of DCs permitted to make changes to the DNS Zone "rndc
command" is called with reload to tell the 'named' server if a DC was
added/removed to to the domain.


NEW FEATURES/CHANGES
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

Default samba process model
---------------------------

The default for the '--model' argument passed to the samba executable has c=
hanged
=66rom 'standard' to 'prefork'. This means a difference in the number of sa=
mba
child processes that are created to handle client connections. The previous
default would create a separate process for every LDAP or NETLOGON client
connection. For a network with a lot of persistent client connections, this
could result in significant memory overhead.  Now, with the new default of
'prefork', the LDAP, NETLOGON, and KDC services will create a fixed number =
of
worker processes at startup and share the client connections amongst these
workers. The number of worker processes can be configured by the 'prefork
children' setting in the smb.conf (the default is 4).

Authentication Logging
----------------------

Winbind now logs PAM_AUTH and NTLM_AUTH events, a new attribute "logonId" h=
as
been added to the Authentication JSON log messages.  This contains a random
logon id that is generated for each PAM_AUTH and NTLM_AUTH request and is p=
assed
to SamLogon, linking the windbind and SamLogon requests.

The serviceDescription of the messages is set to "winbind", the authDescrip=
tion
is set to one of:
   "PASSDB, <command>, <pid>"
   "PAM_AUTH, <command>, <pid>"
   "NTLM_AUTH, <command>, <pid>"
where:
   <command> is the name of the command makinmg the winbind request i.e. wb=
info
   <pid>     is the process id of the requesting process.

The version of the JSON Authentication messages has been changed from 1.1 to
1.2.

LDAP referrals
--------------

The scheme of returned LDAP referrals now reflects the scheme of the origin=
al
request, i.e. referrals received via ldap are prefixed with "ldap://"
and those over ldaps are prefixed with "ldaps://".

Previously all referrals were prefixed with "ldap://".

Bind9 logging
-------------

It is now possible to log the duration of DNS operations performed by Bind9.
This should aid future diagnosis of performance issues and could be used to
monitor DNS performance. The logging is enabled by setting log level to
"dns:10" in smb.conf.

The logs are currently human readable text only, i.e. no JSON formatted out=
put.

Log lines are of the form:

    <function>: DNS timing: result: [<result>] duration: (<duration>)
    zone: [<zone>] name: [<name>] data: [<data>]

    durations are in microseconds.

Default schema updated to 2012_R2
---------------------------------

Default AD schema changed from 2008_R2 to 2012_R2.  2012_R2 functional level
is not yet available.  Older schemas can be used by provisioning with the
'--base-schema' argument.  Existing installations can be updated with the
samba-tool command "domain schemaupgrade".

Samba's replication code has also been improved to handle replication
with the 2012 schema (the core of this replication fix has also been
backported to 4.9.11 and will be in a 4.10.x release).

For more about how the AD schema relates to overall Windows compatibility,
please read:
https://wiki.samba.org/index.php/Windows_2012_Server_compatibility

GnuTLS 3.2 required
-------------------

Samba is making efforts to remove in-tree cryptographic functionality,
and to instead rely on externally maintained libraries.  To this end,
Samba has chosen GnuTLS as our standard cryptographic provider.

Samba now requires GnuTLS 3.2 to be installed (including development
headers at build time) for all configurations, not just the Samba AD
DC.

NOTE WELL: The use of GnuTLS means that Samba will honour the
system-wide 'FIPS mode' (a reference to the US FIPS-140 cryptographic
standard) and so will not operate in many still common situations if
this system-wide parameter is in effect, as many of our protocols rely
on outdated cryptography.

A future Samba version will mitigate this to some extent where good
cryptography effectively wraps bad cryptography, but for now that above
applies.

samba-tool improvements
-----------------------

A new "samba-tool contact" command has been added to allow the
command-line manipulation of contacts, as used for address book
lookups in LDAP.

The "samba-tool [user|group|computer|group|contact] edit" command has been
improved to operate more pleasantly on international character sets.

100,000 USER and LARGER Samba AD DOMAINS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

Extensive efforts have been made to optimise Samba for use in
organisations (for example) targeting 100,000 users, plus 120,000
computer objects, as well as large number of group memberships.

Many of the specific efforts are detailed below, but the net results
is to remove barriers to significantly larger Samba deployments
compared to previous releases.

Reindex performance improvements
--------------------------------

The performance of samba-tool dbcheck --reindex has been improved,
especially for large domains.

join performance improvements
-----------------------------

The performance of samba-tool domain join has been improved,
especially for large domains.

LDAP Server memory improvements
-------------------------------

The LDAP server has improved memory efficiency, ensuring that large
LDAP responses (for example a search for all objects) is not copied
multiple times into memory.

Setting lmdb map size
---------------------

It is now possible to set the lmdb map size (the maximum permitted
size for the database).  "samba-tool" now accepts the
"--backend-store-size" i.e. --backend-store-size=3D4Gb.  If not
specified it defaults to 8Gb.

This option is avaiable for the following sub commands:
 * domain provision
 * domain join
 * domain dcpromo
 * drs clone-dc-database

LDB "batch_mode"
----------------

To improve performance during batch operations i.e. joins, ldb now
accepts a "batch_mode" option.  However to prevent any index or
database inconsistencies if an operation fails, the entire transaction
will be aborted at commit.

New LDB pack format
-------------------

On first use (startup of 'samba' or the first transaction write)
Samba's sam.ldb will be updated to a new more efficient pack format.
This will take a few moments.

New LDB <=3D and >=3D index mode to improve replication performance
---------------------------------------------------------------

As well as a new pack format, Samba's sam.ldb uses a new index format
allowing Samba to efficiently select objects changed since the last
replication cycle.  This in turn improves performance during
replication of large domains.

https://wiki.samba.org/index.php/LDB_Greater_than_and_Less_than_indexing

Improvements to ldb search performance
--------------------------------------

Search performance on large LDB databases has been improved by
reducing memory allocations made on each object.

Improvements to subtree rename performance
------------------------------------------

Improvements have been made to Samba's handling of subtree renames,
for example of containers and organisational units, however large
renames are still not recommended.

CTDB changes
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

* nfs-linux-kernel-callout now defaults to using systemd service names

  The Red Hat service names continue to be the default.

  Other distributions should patch this file when packaging it.

* The onnode -o option has been removed

* ctdbd logs when it is using more than 90% of a CPU thread

  ctdbd is single threaded, so can become saturated if it uses the
  full capacity of a CPU thread.  To help detect this situation, ctdbd
  now logs messages when CPU utilisation exceeds 90%.  Each change in
  CPU utilisation over 90% is logged.  A message is also logged when
  CPU utilisation drops below the 90% threshold.

* Script configuration variable CTDB_MONITOR_SWAP_USAGE has been removed

  05.system.script now monitors total memory (i.e. physical memory +
  swap) utilisation using the existing CTDB_MONITOR_MEMORY_USAGE
  script configuration variable.

CephFS Snapshot Integration
---------------------------

CephFS snapshots can now be exposed as previous file versions using the new
ceph_snapshots VFS module. See the vfs_ceph_snapshots(8) man page for detai=
ls.


REMOVED FEATURES
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

Web server
----------

As a leftover from work related to the Samba Web Administration Tool (SWAT),
Samba still supported a Python WSGI web server (which could still be turned=
 on
=66rom the 'server services' smb.conf parameter). This service was unused a=
nd has
now been removed from Samba.

samba-tool join subdomain
-------------------------

The subdomain role has been removed from the join command.  This option did
not work and has no tests.

Python2 support
---------------

Samba 4.11 will not have any runtime support for Python 2.

If you are building Samba using the '--disable-python' option
(i.e. you're excluding all the run-time Python support), then this
will continue to work on a system that supports either python2 or
python3.

To build Samba with python2 you *must* set the 'PYTHON' environment
variable for both the 'configure' and 'make' steps, i.e.
   'PYTHON=3Dpython2 ./configure'
   'PYTHON=3Dpython2 make'
This will override the python3 default.

Except for this specific build-time use of python2, Samba now requires
Python 3.4 as a minimum.

smb.conf changes
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

  Parameter Name                     Description                Default
  --------------                     -----------                -------

  allocation roundup size            Default changed/           0
                                     Deprecated
  client min protocol                Changed default            SMB2_02
  server min protocol                Changed default            SMB2_02
  mangled names                      Changed default            illegal
  web port                           Removed
  fruit:zero_file_id                 Changed default            False
  debug encryption                   New: dump encryption keys  False
  rndc command                       Deprecated
  lanman auth                        Deprecated
  encrypt passwords                  Deprecated


CHANGES SINCE 4.11.0rc4
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D


CHANGES SINCE 4.11.0rc3
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

o  Douglas Bagnall <douglas.bagnall@catalyst.net.nz>
   * BUG 14049: ldb: Don't try to save a value that isn't there.
   * ldb_dn: Free dn components on explode failure.
   * ldb: Do not allow adding a DN as a base to itself.

o  Andrew Bartlett <abartlet@samba.org>
   * ldb: Release ldb 2.0.7.
   * BUG 13695: ldb: Correct Pigeonhole principle validation in
     ldb_filter_attrs().
   * BUG 14049: Fix ldb dn crash.
   * BUG 14117: Deprecate "lanman auth =3D yes" and "encrypt passwords =3D =
no".

o  Ralph Boehme <slow@samba.org>
   * BUG 14038: Fix compiling ctdb on older systems lacking POSIX robust
     mutexes.
   * BUG 14121: smbd returns bad File-ID on filehandle used to create a fil=
e or
     directory.

o  Poornima G <pgurusid@redhat.com>
   * BUG 14098: vfs_glusterfs: Use pthreadpool for scheduling aio operation=
s.

o  Stefan Metzmacher <metze@samba.org>
   * BUG 14055: Add the target server name of SMB 3.1.1 connections as a hi=
nt to
     load balancers or servers with "multi-tenancy" support.
   * BUG 14113: Fix byte range locking bugs/regressions.

o  Swen Schillig <swen@linux.ibm.com>
   * ldb: Fix mem-leak if talloc_realloc fails.

o  Evgeny Sinelnikov <sin@altlinux.org>
   * BUG 14007: Fix join with don't exists machine account.

o  Martin Schwenke <martin@meltin.net>
   * BUG 14085: ctdb-recoverd: Only check for LMASTER nodes in the VNN map.


CHANGES SINCE 4.11.0rc2
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

o  Michael Adam <obnox@samba.org>
   * BUG 13972: Different Device Id for GlusterFS FUSE mount is causing data
     loss in CTDB cluster.

o  Jeremy Allison <jra@samba.org>
   * BUG 14035: CVE-2019-10197: Permissions check deny can allow user to es=
cape
     from the share.

o  Andrew Bartlett <abartlet@samba.org>
   * BUG 14059: ldb: Release ldb 2.0.6 (log database repack so users know w=
hat
     is happening).
   * BUG 14092: docs: Deprecate "rndc command" for Samba 4.11.

o  Tim Beale <timbeale@catalyst.net.nz>
   * BUG 14059: ldb: Free memory when repacking database.

o  Ralph Boehme <slow@samba.org>
   * BUG 14089: vfs_default: Use correct flag in vfswrap_fs_file_id.
   * BUG 14090: vfs_glusterfs: Initialize st_ex_file_id, st_ex_itime and
     st_ex_iflags.

o  Anoop C S <anoopcs@redhat.com>
   * BUG 14093: vfs_glusterfs: Enable profiling for file system operations.

o  Aaron Haslett <aaronhaslett@catalyst.net.nz>
   * BUG 14059: Backport sambadowngradedatabase for v4.11.

o  Stefan Metzmacher <metze@samba.org>
   * BUG 14035: CVE-2019-10197: Permissions check deny can allow user to es=
cape
     from the share.

o  Christof Schmitt <cs@samba.org>
   * BUG 14032: vfs_gpfs: Implement special case for denying owner access to
     ACL.

o  Martin Schwenke <martin@meltin.net>
   * BUG 14084: Avoid marking a node as connected before it can receive pac=
kets.
   * BUG 14086: Fix onnode test failure with ShellCheck >=3D 0.4.7.
   * BUG 14087: ctdb-daemon: Stop "ctdb stop" from completing before freezi=
ng
     databases.


KNOWN ISSUES
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

https://wiki.samba.org/index.php/Release_Planning_for_Samba_4.11#Release_bl=
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

        https://www.samba.org/samba/history/samba-4.11.0.html

Our Code, Our Bugs, Our Responsibility.
(https://bugzilla.samba.org/)

                        --Enjoy
                        The Samba Team

--BXVAT5kNtrzKuDFl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQQlQWgAwvkyRy78FZYoaL1+KxeTUQUCXYCd3AAKCRAoaL1+KxeT
UfXJAKCdeAi+COboBvogmI2IiCdXQenWRQCfaeH15qA2WDurPYa9ESZnbiLol88=
=1mTz
-----END PGP SIGNATURE-----

--BXVAT5kNtrzKuDFl--

