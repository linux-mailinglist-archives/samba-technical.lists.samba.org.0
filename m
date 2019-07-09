Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E6FF763423
	for <lists+samba-technical@lfdr.de>; Tue,  9 Jul 2019 12:21:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=e4yc1HiWzSdsXUefrC3gfmc+ALg4aIiVnwDCeKSpyYI=; b=2cLso9MkQkzPrAsrBBJxECnKHH
	ytwn5SLAXaFcU36q1M/FTyk9BVbxrrawpawo947QvASQIvVzdfE7KaFBL7+U8i9sRgQC1VTrw6CbY
	DqFKZ0IL2MxKmOhyMedQdnAMvS1GyjW7extMfwgN0eZrb2cLQLVFeB4nSgzr5QtkoSRL7HbAvTyb0
	415HdTRnsTCj7/p9arO04wFbzHML/+B2gKPdybNvsCdJVxW8+YYJ/aOYIzaoNfIfv+Qy4OTmeIbjr
	sZ0EXrQJRVqEVciLPgRJBbWgyaLzs3PiW2JhXhHAifA2hHLHRcKO86MycZ6hrnovgpSSlVPbBC3co
	Yx33s2ZQ==;
Received: from localhost ([::1]:18086 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hknF8-0061Da-FH; Tue, 09 Jul 2019 10:21:02 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:42652) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hknEs-0061Cu-Ff; Tue, 09 Jul 2019 10:20:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Message-ID:To:From:Date:CC;
 bh=e4yc1HiWzSdsXUefrC3gfmc+ALg4aIiVnwDCeKSpyYI=; b=RM5kry+jVec+lhrRz8Myrmj0kF
 pcsior8ZXvbJYSw7fULt8/Rz0M2ouo/vJinuSgYFrNMerVRezjN2MPrCLApKvaCyOphyYsJlX43I9
 AVGTlAFjqNZEG/5FjLGuyh/l/MBazIkTLzlaYaD7qMxamgoaXcn87O0bzj4ho5rQwXaU=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1hknEr-0001vy-PC; Tue, 09 Jul 2019 10:20:45 +0000
Date: Tue, 9 Jul 2019 12:20:44 +0200
To: samba-announce@lists.samba.org, samba@lists.samba.org,
 samba-technical@lists.samba.org
Subject: [Announce] Samba 4.11.0rc1 Available for Download
Message-ID: <20190709102041.GA17245@carrie2>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="EVF5PPMfhYS0aIcm"
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


--EVF5PPMfhYS0aIcm
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Release Announcements
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

This is the first release candidate of Samba 4.11.  This is *not*
intended for production environments and is designed for testing
purposes only.  Please report any defects via the Samba bug reporting
system at https://bugzilla.samba.org/.

Samba 4.11 will be the next version of the Samba suite.


UPGRADING
=3D=3D=3D=3D=3D=3D=3D=3D=3D

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
also support the --option argument to overwrite smb.conf options,
e.g. --option=3D'client min protocol=3DNT1' might be useful.

As Microsoft no longer installs SMB1 support in recent releases
or uninstalls it after 30 days without usage, the Samba Team
tries to get remove the SMB1 usage as much as possible.

SMB1 is officially deprecated and might be removed step by step
in the following years. If you have a strong requirement for SMB1
(except for supporting old Linux Kernels), please file a bug
at https://bugzilla.samba.org and let us know about the details.

NEW FEATURES/CHANGES
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

Default samba process model
---------------------------

The default for the --model argument passed to the samba executable has cha=
nged
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

Authentication Logging.
-----------------------

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

The version of the JSON Authentication messages has been changed to 1.2 fro=
m 1.1

LDAP referrals
--------------

The scheme of returned LDAP referrals now reflects the scheme of the origin=
al
request, i.e. referrals received via ldap are prefixed with "ldap://"
and those over ldaps are prefixed with "ldaps://"

Previously all referrals were prefixed with "ldap://"

Bind9 logging
-------------

It is now possible to log the duration of DNS operations performed by Bind9
This should aid future diagnosis of performance issues, and could be used to
monitor DNS performance. The logging is enabled by setting log level to
"dns:10" in smb.conf

The logs are currently Human readable text only, i.e. no JSON formatted out=
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

It is now possible to set the lmdb map size (The maximum permitted
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

        https://download.samba.org/pub/samba/rc/

The release notes are available online at:

        https://download.samba.org/pub/samba/rc/samba-4.11.0rc1.WHATSNEW.txt

Our Code, Our Bugs, Our Responsibility.
(https://bugzilla.samba.org/)

                        --Enjoy
                        The Samba Team

--EVF5PPMfhYS0aIcm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQQlQWgAwvkyRy78FZYoaL1+KxeTUQUCXSRqdgAKCRAoaL1+KxeT
UeDRAJ0R6cfVgNPdUzWnxaPzjz3jHdaIwACfdQBNGwFi9JjEz8g8ic+54qiETpQ=
=Kzg2
-----END PGP SIGNATURE-----

--EVF5PPMfhYS0aIcm--

