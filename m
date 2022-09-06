Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 85E845AED5B
	for <lists+samba-technical@lfdr.de>; Tue,  6 Sep 2022 16:31:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=dDaV3wI6xMgJsm3g3fRmflSVJNU6C06nJ/Cr6dw275c=; b=dQnxUhLOMQnefzYscaBIITql3E
	jQ+slwsYFolQqpeZY6RwCBy0TdFz0LWT/u8RxTGOm0FAkzEoUwVm+KIqnSOg84EoRUFioLPaLMbr2
	EXE/XCntLxBDTf57dWx8eA2piIcHBIW9YjvtBo4yleciltaHNVndFyFK2EIC6Ctn/Jgy8+SNdJP1N
	xMVIlyNAxM8sUnXo31eGdhVGmzaR7IY9vwySoNNMoPewdCHnGdir5ulSpPnKvxxYS9iPWi9EYwWPb
	HcThBEAyItXRalbUGKOiAACBWaABZug11vUzXpsrJGEctrNXa6ls8td97Vb4FH9+vnUQP2zGmoQZh
	YPWO0V9Q==;
Received: from ip6-localhost ([::1]:44426 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1oVZbR-005k01-KJ; Tue, 06 Sep 2022 14:31:01 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:51524) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1oVZbF-005jz5-S9; Tue, 06 Sep 2022 14:30:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=dDaV3wI6xMgJsm3g3fRmflSVJNU6C06nJ/Cr6dw275c=; b=RXqPwbi+tpGkfhZHKfelkb9cRL
 lrqxxclKPGX7X4/D++QK6+Xvb9zUkXo8FW+4/AS4GWBfVpd/HV2zxwzExf1VgJc6GN0HUZge0cAAz
 0nOB5qqMqh9JuVWzxiS73+KYNtT89Tne0qkbsyYRkdONlDmKtSSAbsxnKsK7tN2H4r3Re01K1Qk0W
 Y6PTixZDhG5c3oitbtq7Oozxu+PP6mHLVYar1Zd6+56+pp+wE+tcEclciwnJ3N4ff0SWtNAFrgQba
 MyxxFAzz54Tz4HmppzAFrTgWhatTeLCNKNN++L1a8/iQyC3j8xylQT+MSItoPsxF9jJDOuBiXDxbk
 eeT2EscziE1vaGhQ7Xvw5ql3uSl66B8jBuJmHxn5dJo3LaI/8B/otCFyBXyAMlRzrCuAkND2FaH9F
 /3l5SqzOv3tCVKqeM5X1Kw+cT3ak2dasLHReGjWjeWE20o0v/1LfXLYnsvUeYpAKGx4Kp3nV+p9sw
 4+EJwLxslO36q5+vfIxux7/O;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1oVZbF-003MUd-7R; Tue, 06 Sep 2022 14:30:49 +0000
Message-ID: <42cb0883-13f6-4317-fa86-b8d1761b4e91@samba.org>
Date: Tue, 6 Sep 2022 16:30:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: de-DE
To: samba-announce@lists.samba.org, samba@lists.samba.org,
 samba-technical@lists.samba.org
Subject: [Announce] Samba 4.17.0rc5 Available for Download
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

This is the fifth release candidate of Samba 4.17.  This is *not*
intended for production environments and is designed for testing
purposes only.  Please report any defects via the Samba bug reporting
system at https://bugzilla.samba.org/.

Samba 4.17 will be the next version of the Samba suite.


UPGRADING
=========


NEW FEATURES/CHANGES
====================

SMB Server performance improvements
-----------------------------------

The security improvements in recent releases
(4.13, 4.14, 4.15, 4.16), mainly as protection against symlink races,
caused performance regressions for meta data heavy workloads.

With 4.17 the situation improved a lot again:

- Pathnames given by a client are devided into dirname and basename.
   The amount of syscalls to validate dirnames is reduced to 2 syscalls
   (openat, close) per component. On modern Linux kernels (>= 5.6) smbd
   makes use of the openat2() syscall with RESOLVE_NO_SYMLINKS,
   in order to just use 2 syscalls (openat2, close) for the whole dirname.

- Contended path based operations used to generate a lot of unsolicited
   wakeup events causing thundering herd problems, which lead to masive
   latencies for some clients. These events are now avoided in order
   to provide stable latencies and much higher throughput of open/close
   operations.

Configure without the SMB1 Server
---------------------------------

It is now possible to configure Samba without support for
the SMB1 protocol in smbd. This can be selected at configure
time with either of the options:

--with-smb1-server
--without-smb1-server

By default (without either of these options set) Samba
is configured to include SMB1 support (i.e. --with-smb1-server
is the default). When Samba is configured without SMB1 support,
none of the SMB1 code is included inside smbd except the minimal
stub code needed to allow a client to connect as SMB1 and immediately
negotiate the selected protocol into SMB2 (as a Windows server also
allows).

None of the SMB1-only smb.conf parameters are removed when
configured without SMB1, but these parameters are ignored by
the smbd server. This allows deployment without having to change
an existing smb.conf file.

This option allows sites, OEMs and integrators to configure Samba
to remove the old and insecure SMB1 protocol from their products.

Note that the Samba client libraries still support SMB1 connections
even when Samba is configured as --without-smb1-server. This is
to ensure maximum compatibility with environments containing old
SMB1 servers.

Bronze bit and S4U support now also with MIT Kerberos 1.20
----------------------------------------------------------

In 2020 Microsoft Security Response Team received another Kerberos-related
report. Eventually, that led to a security update of the CVE-2020-17049,
Kerberos KDC Security Feature Bypass Vulnerability, also known as a ‘Bronze
Bit’. With this vulnerability, a compromised service that is configured 
to use
Kerberos constrained delegation feature could tamper with a service 
ticket that
is not valid for delegation to force the KDC to accept it.

With the release of MIT Kerberos 1.20, Samba AD DC is able able to 
mitigate the
‘Bronze Bit’ attack. MIT Kerberos KDC's KDB (Kerberos Database Driver) 
API was
changed to allow passing more details between KDC and KDB components. 
When built
against MIT Kerberos, Samba AD DC supports MIT Kerberos 1.19 and 1.20 
versions
but 'Bronze Bit' mitigation is provided only with MIT Kerberos 1.20.

In addition to fixing the ‘Bronze Bit’ issue, Samba AD DC now fully supports
S4U2Self and S4U2Proxy Kerberos extensions.

Note the default (Heimdal-based) KDC was already fixed in 2021,
see https://bugzilla.samba.org/show_bug.cgi?id=14642

Resource Based Constrained Delegation (RBCD) support
----------------------------------------------------

Samba AD DC built with MIT Kerberos 1.20 offers RBCD support now. With MIT
Kerberos 1.20 we have complete RBCD support passing Sambas S4U testsuite.

samba-tool delegation got the 'add-principal' and 'del-principal' 
subcommands
in order to manage RBCD.

To complete RBCD support and make it useful to Administrators we added the
Asserted Identity [1] SID into the PAC for constrained delegation. This is
available for Samba AD compiled with MIT Kerberos 1.20.

Note the default (Heimdal-based) KDC does not support RBCD yet.

[1] 
https://docs.microsoft.com/en-us/windows-server/security/kerberos/kerberos-constrained-delegation-overview

Customizable DNS listening port
-------------------------------

It is now possible to set a custom listening port for the builtin DNS 
service,
making easy to host another DNS on the same system that would bind to the
default port and forward the domain-specific queries to Samba using the 
custom
port. This is the opposite configuration of setting a forwarder in Samba.

It makes possible to use another DNS server as a front and forward to Samba.

Dynamic DNS updates may not be proxied by the front DNS server when 
forwarding
to Samba. Dynamic DNS update proxying depends on the features of the 
other DNS
server used as a front.

CTDB changes
------------

* When Samba is configured with both --with-cluster-support and
   --systemd-install-services then a systemd service file for CTDB will
   be installed.

* ctdbd_wrapper has been removed.  ctdbd is now started directly from
   a systemd service file or init script.

* The syntax for the ctdb.tunables configuration file has been
   relaxed.  However, trailing garbage after the value, including
   comments, is no longer permitted.  Please see ctdb-tunables(7) for
   more details.

Operation without the (unsalted) NT password hash
-------------------------------------------------

When Samba is configured with 'nt hash store = never' then Samba will
no longer store the (unsalted) NT password hash for users in Active
Directory.  (Trust accounts, like computers, domain controllers and
inter-domain trusts are not impacted).

In the next version of Samba the default for 'nt hash store' will
change from 'always' to 'auto', where it will follow (behave as 'nt
hash store = never' when 'ntlm auth = disabled' is set.

Security-focused deployments of Samba that have eliminated NTLM from
their networks will find setting 'ntlm auth = disabled' with 'nt hash
store = always' as a useful way to improve compliance with
best-practice guidance on password storage (which is to always use an
interated hash).

Note that when 'nt hash store = never' is set, then arcfour-hmac-md5
Kerberos keys will not be available for users who subsequently change
their password, as these keys derive their values from NT hashes. AES
keys are stored by default for all deployments of Samba with Domain
Functional Level 2008 or later, are supported by all modern clients,
and are much more secure.

Finally, also note that password history in Active Directory is stored
in nTPwdHistory using a series of NT hash values.  Therefore the full
password history feature is not available in this mode.

To provide some protection against password re-use previous Kerberos
hash values (the current, old and older values are already stored) are
used, providing a history length of 3.

There is one small limitation of this workaround: Changing the
sAMAccountName, userAccountControl or userPrincipalName of an account
can cause the Kerberos password salt to change.  This means that after
*both* an account rename and a password change, only the current
password will be recognised for password history purposes.

Python API for smbconf
----------------------

Samba's smbconf library provides a generic frontend to various
configuration backends (plain text file, registry) as a C library. A
new Python wrapper, importable as 'samba.smbconf' is available. An
additional module, 'samba.samba3.smbconf', is also available to enable
registry backend support. These libraries allow Python programs to
read, and optionally write, Samba configuration natively.

JSON support for smbstatus
--------------------------

It is now possible to print detailed information in JSON format in
the smbstatus program using the new option --json. The JSON output
covers all the existing text output including sessions, connections,
open files, byte-range locks, notifies and profile data with all
low-level information maintained by Samba in the respective databases.

Protected Users security group
------------------------------

Samba AD DC now includes support for the Protected Users security
group introduced in Windows Server 2012 R2. The feature reduces the
attack surface of user accounts by preventing the use of weak
encryption types. It also mitigates the effects of credential theft by
limiting credential lifetime and scope.

The protections are intended for user accounts only, and service or
computer accounts should not be added to the Protected Users
group. User accounts added to the group are granted the following
security protections:

    * NTLM authentication is disabled.
    * Kerberos ticket-granting tickets (TGTs) encrypted with RC4 are
      not issued to or accepted from affected principals. Tickets
      encrypted with AES, and service tickets encrypted with RC4, are
      not affected by this restriction.
    * The lifetime of Kerberos TGTs is restricted to a maximum of four
      hours.
    * Kerberos constrained and unconstrained delegation is disabled.

If the Protected Users group is not already present in the domain, it
can be created with 'samba-tool group add'. The new '--special'
parameter must be specified, with 'Protected Users' as the name of the
group. An example command invocation is:

samba-tool group add 'Protected Users' --special

or against a remote server:

samba-tool group add 'Protected Users' --special -H 
ldap://dc1.example.com -U Administrator

The Protected Users group is identified in the domain by its having a
RID of 525. Thus, it should only be created with samba-tool and the
'--special' parameter, as above, so that it has the required RID
to function correctly.


REMOVED FEATURES
================

LanMan Authentication and password storage removed from the AD DC
-----------------------------------------------------------------

The storage and authentication with LanMan passwords has been entirely
removed from the Samba AD DC, even when "lanman auth = yes" is set.


smb.conf changes
================

   Parameter Name                          Description     Default
   --------------                          -----------     -------
   dns port                                New default     53
   fruit:zero_file_id                      New default     yes
   nt hash store                           New parameter   always
   smb1 unix extensions                    Replaces "unix extensions"
   volume serial number                    New parameter   -1
   winbind debug traceid                   New parameter   no


CHANGES SINCE 4.17.0rc4
=======================

o  Ralph Boehme <slow@samba.org>
    * BUG 15126: acl_xattr VFS module may unintentionally use filesystem
      permissions instead of ACL from xattr.
    * BUG 15153: Missing SMB2-GETINFO access checks from MS-SMB2 3.3.5.20.1.
    * BUG 15161: assert failed: !is_named_stream(smb_fname)") at
      ../../lib/util/fault.c:197.

o  Volker Lendecke <vl@samba.org>
    * BUG 15126: acl_xattr VFS module may unintentionally use filesystem
      permissions instead of ACL from xattr.
    * BUG 15161: assert failed: !is_named_stream(smb_fname)") at
      ../../lib/util/fault.c:197.

o  Stefan Metzmacher <metze@samba.org>
    * BUG 15159: Cross-node multi-channel reconnects result in SMB2 
Negotiate
      returning NT_STATUS_NOT_SUPPORTED.

o  Noel Power <noel.power@suse.com>
    * BUG 15160: winbind at info level debug can coredump when processing
      wb_lookupusergroups.


CHANGES SINCE 4.17.0rc3
=======================

o  Anoop C S <anoopcs@samba.org>
    * BUG 15157: Make use of glfs_*at() API calls in vfs_glusterfs.


CHANGES SINCE 4.17.0rc2
=======================

o  Jeremy Allison <jra@samba.org>
    * BUG 15128: Possible use after free of connection_struct when iterating
      smbd_server_connection->connections.

o  Christian Ambach <ambi@samba.org>
    * BUG 15145: `net usershare add` fails with flag works with --long 
but fails
      with -l.

o  Ralph Boehme <slow@samba.org>
    * BUG 15126: acl_xattr VFS module may unintentionally use filesystem
      permissions instead of ACL from xattr.

o  Stefan Metzmacher <metze@samba.org>
    * BUG 15125: Performance regression on contended path based operations.
    * BUG 15148: Missing READ_LEASE break could cause data corruption.

o  Andreas Schneider <asn@samba.org>
    * BUG 15141: libsamba-errors uses a wrong version number.

o  Joseph Sutton <josephsutton@catalyst.net.nz>
    * BUG 15152: SMB1 negotiation can fail to handle connection errors.


CHANGES SINCE 4.17.0rc1
=======================

o  Jeremy Allison <jra@samba.org>
    * BUG 15143: New filename parser doesn't check veto files smb.conf 
parameter.
    * BUG 15144: 4.17.rc1 still uses symlink-race prone unix_convert()
    * BUG 15146: Backport fileserver related changed to 4.17.0rc2

o  Jule Anger <janger@samba.org>
    * BUG 15147: Manpage for smbstatus json is missing

o  Volker Lendecke <vl@samba.org>
    * BUG 15146: Backport fileserver related changed to 4.17.0rc2

o  Stefan Metzmacher <metze@samba.org>
    * BUG 15125: Performance regression on contended path based operations
    * BUG 15146: Backport fileserver related changed to 4.17.0rc2

o  Andreas Schneider <asn@samba.org>
    * BUG 15140: Fix issues found by coverity in smbstatus json code
    * BUG 15146: Backport fileserver related changed to 4.17.0rc2


KNOWN ISSUES
============

https://wiki.samba.org/index.php/Release_Planning_for_Samba_4.17#Release_blocking_bugs


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

https://download.samba.org/pub/samba/rc/samba-4.17.0rc5.WHATSNEW.txt

Our Code, Our Bugs, Our Responsibility.
(https://bugzilla.samba.org/)

                         --Enjoy
                         The Samba Team

