Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B1D4E9585E3
	for <lists+samba-technical@lfdr.de>; Tue, 20 Aug 2024 13:34:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=OuHPVT9QNHgDbInQEWMfaCNwoHbHl2V/wpHnLvHVWgQ=; b=NHaEHJTz0EoGAT2clFvrFPrvov
	RjncE4Uhbu5YQkN1cZUgZy8ROSf8ztAuWXqu5kc4cx/odI+FeIIydwmuOPbqa44k8Paouy3NQCxWi
	tWSWi4NSfqjaM5P7DwLq49YXdpb2Ogi+sx3J4Lw+pI8F9YfuiOQaJbX5oc+/nwq0BfwA9pmYUgPbf
	vAnSmttBCeQeUtHWQ7vGWhEDGf1VWAbeB0D+gIL9M/ZBmefVy00zbfknzFRI602DO5psQHixnph8q
	ry/TFfSJdRhyrQsDm3MU8A6NgFlcv397+AjjIiY0pRJVBVADy3ATJBKh5qr0ov09wuxd4IeIGk5xM
	GJVIQWNw==;
Received: from ip6-localhost ([::1]:47720 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1sgN7F-00548v-89; Tue, 20 Aug 2024 11:33:33 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:48596) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1sgN75-00548F-US; Tue, 20 Aug 2024 11:33:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=OuHPVT9QNHgDbInQEWMfaCNwoHbHl2V/wpHnLvHVWgQ=; b=aoJdDwT1i7ZBQ39jarBxSms2zU
 3G3Css0gCjByngV4pwlh1pEwvO8rqcU83bT8AM9p+VlyPkn5Uji21WE+Bz2VlVypIVTmq4BM1t7Lo
 tqzw9I70vTo6GjHbYj6q41BH+5yvv+NiIgQkM7IazaBjCnetgZDHfj1vxUsSwgFktz5jSO1rxvsze
 /UPz0rKYw6qCpRUZuoCYHgYPwy/bw/LpUWgGSAvvd6NMLBDykPQxrsiQo8iyywj+0PMSMeiIqWn4Q
 innSjehF1vevyMf29U2/3sHUagTrhfgmjnxjuHPd6Uuh50QciJwuqwwvp6WYflUe35dMmJoUa7zT3
 wF19OnyW/emOiDPRcQjg5Wnr6Iv0qAcb1eGhikkagcaTQ1amCRgYofutRDliSsMNDfzh9uTMjoY94
 QA9PYjGwn5T13wApwBqGCS/hzKbBz9TXsX7Bu56zmyFOPdtdvrHAzouOh8T69kPaa7dIDe0VfZQL/
 TBEYqkWHQKx4ZCrAuzVANEWr;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1sgN75-007GLi-0v; Tue, 20 Aug 2024 11:33:23 +0000
Message-ID: <10d751cc-c6f8-4af9-8d88-017e3ed5a824@samba.org>
Date: Tue, 20 Aug 2024 13:33:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: de-DE
To: samba-announce@lists.samba.org, samba@lists.samba.org,
 samba-technical@lists.samba.org
Subject: [Announce] Samba 4.21.0rc3 Available for Download
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
From: Jule Anger via samba-technical <samba-technical@lists.samba.org>
Reply-To: Jule Anger <janger@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Release Announcements
=====================

This is the third release candidate of Samba 4.21.  This is *not*
intended for production environments and is designed for testing
purposes only.  Please report any defects via the Samba bug reporting
system at https://bugzilla.samba.org/.

Samba 4.21 will be the next version of the Samba suite.


UPGRADING
=========

Hardening of "valid users", "invalid users", "read list" and "write list"
-------------------------------------------------------------------------

In previous versions of Samba, if a user or group name in either of the
mentioned options could not be resolved to a valid SID, the user (or group)
would be skipped without any notification. This could result in 
unexpected and
insecure behaviour. Starting with this version of Samba, if any user or 
group
name in any of the options cannot be resolved due to a communication 
error with
a domain controller, Samba will log an error and the tree connect will fail.
Non existing users (or groups) are ignored.

LDAP TLS/SASL channel binding support
-------------------------------------

The ldap server supports SASL binds with
kerberos or NTLMSSP over TLS connections
now (either ldaps or starttls).

Setups where 'ldap server require strong auth = allow_sasl_over_tls'
was required before, can now most likely move to the
default of 'ldap server require strong auth = yes'.

If SASL binds without correct tls channel bindings are required
'ldap server require strong auth = allow_sasl_without_tls_channel_bindings'
should be used now, as 'allow_sasl_over_tls' will generate a
warning in every start of 'samba', as well as '[samba-tool ]testparm'.

This is similar to LdapEnforceChannelBinding under
HKLM\SYSTEM\CurrentControlSet\Services\NTDS\Parameters
on Windows.

All client tools using ldaps also include the correct
channel bindings now.


NEW FEATURES/CHANGES
====================

LDB no longer a standalone tarball
----------------------------------

LDB, Samba's LDAP-like local database and the power behind the Samba
AD DC, is no longer available to build as a distinct tarball, but is
instead provided as an optional public library.

If you need ldb as a public library, say to build sssd, then use
  ./configure --private-libraries='!ldb'

This re-integration allows LDB tests to use the Samba's full selftest
system, including our knownfail infrastructure, and decreases the work
required during security releases as a coordinated release of the ldb
tarball is not also required.

This approach has been demonstrated already in Debian, which is already
building Samba and LDB is this way.

As part of this work, the pyldb-util public library, not known to be
used by any other software, is made private to Samba.

LDB Module API Python bindings removed
--------------------------------------

The LDB Modules API, which we do not promise a stable ABI or API for,
was wrapped in python in early LDB development.  However that wrapping
never took into account later changes, and so has not worked for a
number of years.  Samba 4.21 and LDB 2.10 removes this unused and
broken feature.

Some Samba public libraries made private by default
---------------------------------------------------

The following Samba C libraries are currently made public due to their
use by OpenChange or for historical reasons that are no longer clear.

  dcerpc-samr, samba-policy, tevent-util, dcerpc, samba-hostconfig,
  samba-credentials, dcerpc_server, samdb

The libraries used by the OpenChange client now private, but can be
made public (like ldb above) with:

  ./configure 
--private-libraries='!dcerpc,!samba-hostconfig,!samba-credentials,!ldb'

The C libraries without any known user or used only for the OpenChange
server (a dead project) may be made private entirely in a future Samba
version.

If you use a Samba library in this list, please be in touch with the
samba-technical mailing list.

Using ldaps from 'winbindd' and 'net ads'
-----------------------------------------

Beginning with Samba 3.0.22 the 'ldap ssl = start tls' option also
impacted LDAP connections to active directory domain controllers.
Using the STARTTLS operation on LDAP port 389 connections. Starting
with Samba 3.5.0 'ldap ssl ads = yes' was required in addition in
order let to 'ldap ssl = start tls' have any effect on those
connections.

'ldap ssl ads' was deprecated with Samba 4.8.0 and removed together
with the whole functionality in Samba 4.14.0, because it didn't support
tls channel bindings required for the sasl authentication.

The functionality is now re-added using the correct channel bindings
based on the gnutls based tls implementation we already have, instead
of using the tls layer provided by openldap. This makes it available
and consistent with all LDAP client libraries we use and implement on
our own.

The 'client ldap sasl wrapping' option gained the two new possible values:
'starttls' (using STARTTLS on tcp port 389)
and
'ldaps' (using TLS directly on tcp port 636).

If you had 'ldap ssl = start tls' and 'ldap ssl ads = yes'
before, you can now use 'client ldap sasl wrapping = starttls'
in order to get STARTTLS on tcp port 389.

As we no longer use the openldap tls layer it is required to configure the
correct certificate trusts with at least one of the following options:
'tls trust system cas', 'tls ca directories' or 'tls cafile'.
While 'tls verify peer' and 'tls crlfile' are also relevant,
see 'man smb.conf' for further details.

New DNS hostname config option
------------------------------

To get `net ads dns register` working correctly running manually or during a
domain join a special entry in /etc/hosts was required. This not really
documented and thus the DNS registration mostly didn't work. With the 
new option
the default is [netbios name].[realm] which should be correct in the 
majority of
use cases.

We will also use the value to create service principal names during a 
Kerberos
authentication and DNS functions.

This is not supported in samba-tool yet.

Samba AD will rotate expired passwords on smartcard-required accounts
---------------------------------------------------------------------

Traditionally in AD, accounts set to be "smart card require for logon"
will have a password for NTLM fallback and local profile encryption
(Windows DPAPI). This password previously would not expire.

Matching Windows behaviour, when the DC in a FL 2016 domain and the
msDS-ExpirePasswordsOnSmartCardOnlyAccounts attribute on the domain
root is set to TRUE, Samba will now expire these passwords and rotate
them shortly before they expire.

Note that the password expiry time must be set to twice the TGT lifetime for
smooth operation, e.g. daily expiry given a default 10 hour TGT
lifetime, as the password is only rotated in the second half of its
life.  Again, this matches the Windows behaviour.

Provided the default 2016 schema is used, new Samba domains
provisioned with Samba 4.21 will have this enabled once the domain
functional level is set to 2016.

NOTE: Domains upgraded from older Samba versions will not have this
set, even after the functional level preparation, matching the
behaviour of upgraded Windows AD domains.

Per-user and group "veto files" and "hide files"
------------------------------------------------

"veto files" and "hide files" can optionally be restricted to certain 
users and
groups. To apply a veto or hide directive to a filename for a specific 
user or
group, a parametric option like this can be used:
  hide files : USERNAME = /somefile.txt/
  veto files : GROUPNAME = /otherfile.txt/
For details consult the updated smb.conf manpage.

Automatic keytab update after machine password change
-----------------------------------------------------

When machine account password is updated, either by winbind doing regular
updates or manually (e.g. net ads changetrustpw), now winbind will also 
support
update of keytab entries in case you use newly added option
'sync machine password to keytab'.
The new parameter allows you to describe what keytabs and how should be 
updated.
 From smb.conf(5) manpage - each keytab can have exactly one of these 
four forms:

                account_name
                sync_spns
                spn_prefixes=value1[,value2[...]]
                spns=value1[,value2[...]]

The functionaity provided by the removed commands "net ads keytab
add/delete/add_update_ads" can be achieved via the 'sync machine password to
keytab' as in these examples:

"net ads keytab add  wurst/brot@REALM"

- this command is not adding <principal> to AD, so the best fit can be 
specifier
   "spns"
- add to smb.conf:
   sync machine password to keytab = 
/path/to/keytab1:spns=wurst/brot@REALM:machine_password
- run:
   "net ads keytab create"

"net ads keytab delete wurst/brot@REALM"

- remove the principal (or the whole keytab line if there was just one)
- run:
   "net ads keytab create"

"net ads keytab add_update_ads wurst/brot@REALM"

- this command was adding the principal to AD, so for this case use a keytab
   with specifier sync_spns
- add to smb.conf:
   sync machine password to keytab = 
/path/to/keytab2:sync_spns:machine_password
- run:
   "net ads setspn add  wurst/brot@REALM"  # this adds the principal to AD
   "net ads keytab create"  # this sync it from AD to local keytab


A new parameter 'sync machine password script' allows to specify 
external script
that will be triggered after the automatic keytab update. If keytabs 
should be
generated in clustered environments it is recommended to update them on all
nodes.  Check in smb.conf(5) the scripts winbind_ctdb_updatekeytab.sh and
46.update-keytabs.script in section 'sync machine password script' for 
details.

For detailed information check the smb.conf(5) and net(8) manpages.

New cephfs VFS module
---------------------
Introduce new vfs-to-cephfs bridge which uses libcephfs low-level APIs 
(instead
of path-based operations in the existing module). It allows users to pass
explicit user-credentials per call (including supplementary groups), as 
well as
faster operations using inode and file-handle caching on the Samba side.
Configuration is identical to existing module, but using 'ceph_new' 
instead of
'ceph' for the relevant smb.conf entries. This new module is expected to
deprecate and replace the old one in next major release.


REMOVED FEATURES
================

Following commands are removed:

net ads keytab add <principal>
net ads keytab delete <principal>
net ads keytab add_update_ads


smb.conf changes
================

   Parameter Name                          Description     Default
   --------------                          -----------     -------
   client ldap sasl wrapping               new values
   client use spnego principal             removed
   ldap server require strong auth         new values
   tls trust system cas                    new
   tls ca directories                      new
   dns hostname                            client dns name [netbios 
name].[realm]
   valid users                             Hardening
   invalid users                           Hardening
   read list                               Hardening
   write list                              Hardening
   veto files                              Added per-user and per-group 
vetos
   hide files                              Added per-user and per-group 
hides
   sync machine password to keytab         keytabs
   sync machine password script            script


CHANGES SINCE 4.21.0rc2
=======================

o  Pavel Filipenský <pfilipensky@samba.org>
    * BUG 15689: Can't add/delete special keys to keytab for nfs, cifs, 
http etc.

o  Stefan Metzmacher <metze@samba.org>
    * BUG 15696: Compound SMB2 requests don't return
      NT_STATUS_NETWORK_SESSION_EXPIRED for all requests, confuses
      MacOSX clients.

o  Anoop C S <anoopcs@samba.org>
    * BUG 15689: Can't add/delete special keys to keytab for nfs, cifs, 
http etc.


CHANGES SINCE 4.21.0rc1
=======================

o  Andreas Schneider <asn@samba.org>
    * BUG 15673: --version-* options are still not ergonomic, and they 
reject
      tilde characters.

o  Anoop C S <anoopcs@samba.org>
    * BUG 15686: Add new vfs_ceph module (based on low level API)

o  Douglas Bagnall <douglas.bagnall@catalyst.net.nz>
    * BUG 15673: --version-* options are still not ergonomic, and they 
reject
      tilde characters.

o  Jo Sutton <josutton@catalyst.net.nz>
    * BUG 15690: ldb_version.h is missing from ldb public library

o  Pavel Filipenský <pfilipensky@samba.org>
    * BUG 15689: Can not add/delete special keys to keytab for nfs, 
cifs, http etc

o  Shachar Sharon <ssharon@redhat.com>
    * BUG 15686: Add new vfs_ceph module (based on low level API)

o  Stefan Metzmacher <metze@samba.org>
    * BUG 15673: --version-* options are still not ergonomic, and they 
reject
      tilde characters.
    * BUG 15687: undefined reference to winbind_lookup_name_ex
    * BUG 15688: per user veto and hide file syntax is to complex
    * BUG 15689: Can not add/delete special keys to keytab for nfs, 
cifs, http etc

o  Volker Lendecke <vl@samba.org>
    * BUG 15688: per user veto and hide file syntax is to complex


KNOWN ISSUES
============

https://wiki.samba.org/index.php/Release_Planning_for_Samba_4.21#Release_blocking_bugs


#######################################
Reporting bugs & Development Discussion
#######################################

Please discuss this release on the samba-technical mailing list or by
joining the #samba-technical:matrix.org matrix room, or
#samba-technical IRC channel on irc.libera.chat

If you do report problems then please try to send high quality
feedback. If you don't provide vital information to help us track down
the problem then you will probably be ignored.  All bug reports should
be filed under the Samba 4.1 and newer product in the project's Bugzilla
database (https://bugzilla.samba.org/).


======================================================================
== Our Code, Our Bugs, Our Responsibility.
== The Samba Team
======================================================================

================
Download Details
================

The uncompressed tarballs and patch files have been signed
using GnuPG (ID AA99442FB680B620).  The source code can be downloaded
from:

         https://download.samba.org/pub/samba/rc/

The release notes are available online at:

https://download.samba.org/pub/samba/rc/samba-4.21.0rc3.WHATSNEW.txt

Our Code, Our Bugs, Our Responsibility.
(https://bugzilla.samba.org/)

                         --Enjoy
                         The Samba Team

