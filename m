Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 5260F4E26C0
	for <lists+samba-technical@lfdr.de>; Mon, 21 Mar 2022 13:41:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=BCPCiQbqDSh7sduHAppvgmllZlz5Ips3WdgQXQOElVc=; b=fHGMMTHvk6F6E5KwMclzPnK0/A
	6a9BrFR0VvwZQBBM4uipUIXfQdWVFJ5rMjnhrd61J0qjO8haWkco5GzmaQJIFrk48eYHE6myqEm6q
	cgCuq+tIQoexY7F88xpUqrbupeyEAhWF01LaGN8Da+dAezcbE7QF7cFD+8AGmSdMYYEDnkbm5971U
	wE7HuDOkeog4jwQ/k3wLCkHGtOJcDZtqAdGIn5ysOxpjiAx2wZOnKxryakmLigR/1yUDGQhNDzJ3f
	YC8NuyTtAwh/J3ZdFYxxJ78x64gGOWx/leBXTM/yG5in6VQ/yjmngLm1wN1NJV8hF5abOjxZiBKdZ
	iLtt+Wcw==;
Received: from ip6-localhost ([::1]:19346 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nWHL4-003va1-KH; Mon, 21 Mar 2022 12:40:46 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:37746) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nWHKr-003vZ4-9w; Mon, 21 Mar 2022 12:40:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=To:From:Date:Message-ID:CC;
 bh=BCPCiQbqDSh7sduHAppvgmllZlz5Ips3WdgQXQOElVc=; b=DhgvYBtZjd2UPMY424A21zmtYO
 IduYYtyo6FmbhaTabZ9xZ8eO8J+qJWuZh3hc3xespgiNkD2/2ZpZQ0eJ8K3q7rGgmh5U+QhiKI8VL
 l28ZuOD0q+AriP/3kA6wXaKk4gU6TYM/v+gx4pwvQInXGtPm+meE7a12a0tdd4hyNWGfsUcJn/X+s
 8vhnYdeDDHqjJegf/IehLfpd2fGZFHS35K+yhnR+lDC7EGOkbzDWHTcYMkUikGtJt++fO+/iUK2aG
 qtuXszH8UI2K0JN4vxBRglY03aN6+c/dxBYWTEb0bB7lq4Vde67FDguJBFoyaZYm02+ZhET4afQ3M
 A62PIape+nK3jYbP0zfmPvsvhcf7fr6GtujBCf5A7SwPKhHkFdhstA+0iN+wJVvuDTaiCusAeneG1
 XzuC3Lly8RO0+jc3LMSKWWdZiNoiatlmDCbsqzhuU/dYkt3JhlV6HcjhZ0hPz9I4RlRaW+fge5RnK
 uw05QYJ/DR+W76KA19Fi/xGI;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1nWHKo-002dBZ-IS; Mon, 21 Mar 2022 12:40:31 +0000
Message-ID: <5e2f2d0c-a182-30e7-8e18-00b239042cb1@samba.org>
Date: Mon, 21 Mar 2022 13:40:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: de-DE
Subject: [Announce] Samba 4.16.0 Available for Download
To: samba-announce@lists.samba.org, samba@lists.samba.org,
 samba-technical@lists.samba.org
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
---------------------

This is the first stable release of the Samba 4.16 release series.
Please read the release notes carefully before upgrading.


NEW FEATURES/CHANGES
====================

New samba-dcerpcd binary to provide DCERPC in the member server setup
---------------------------------------------------------------------

In order to make it much easier to break out the DCERPC services
from smbd, a new samba-dcerpcd binary has been created.

samba-dcerpcd can be used in two ways. In the normal case without
startup script modification it is invoked on demand from smbd or
winbind --np-helper to serve DCERPC over named pipes. Note that
in order to run in this mode the smb.conf [global] section has
a new parameter "rpc start on demand helpers = [true|false]".
This parameter is set to "true" by default, meaning no changes to
smb.conf files are needed to run samba-dcerpcd on demand as a named
pipe helper.

It can also be used in a standalone mode where it is started
separately from smbd or winbind but this requires changes to system
startup scripts, and in addition a change to smb.conf, setting the new
[global] parameter "rpc start on demand helpers = false". If "rpc
start on demand helpers" is not set to false, samba-dcerpcd will
refuse to start in standalone mode.

Note that when Samba is run in the Active Directory Domain Controller
mode the samba binary that provides the AD code will still provide its
normal DCERPC services whilst allowing samba-dcerpcd to provide
services like SRVSVC in the same way that smbd used to in this
configuration.

The parameters that allowed some smbd-hosted services to be started
externally are now gone (detailed below) as this is now the default
setting.

samba-dcerpcd can also be useful for use outside of the Samba
framework, for example, use with the Linux kernel SMB2 server ksmbd or
possibly other SMB2 server implementations.

Heimdal-8.0pre used for Samba Internal Kerberos, adds FAST support
------------------------------------------------------------------

Samba has since Samba 4.0 included a snapshot of the Heimdal Kerberos
implementation.  This snapshot has now been updated and will closely
match what will be released as Heimdal 8.0 shortly.

This is a major update, previously we used a snapshot of Heimdal from
2011, and brings important new Kerberos security features such as
Kerberos request armoring, known as FAST.  This tunnels ticket
requests and replies that might be encrypted with a weak password
inside a wrapper built with a stronger password, say from a machine
account.

In Heimdal and MIT modes Samba's KDC now supports FAST, for the
support of non-Windows clients.

Windows clients will not use this feature however, as they do not
attempt to do so against a server not advertising domain Functional
Level 2012.  Samba users are of course free to modify how Samba
advertises itself, but use with Windows clients is not supported "out
of the box".

Finally, Samba also uses a per-KDC, not per-realm 'cookie' to secure part of
the FAST protocol.  A future version will align this more closely with
Microsoft AD behaviour.

If FAST needs to be disabled on your Samba KDC, set

  kdc enable fast = no

in the smb.conf.

The Samba project wishes to thank the numerous developers who have put
in a massive effort to make this possible over many years.  In
particular we thank Stefan Metzmacher, Joseph Sutton, Gary Lockyer,
Isaac Boukris and Andrew Bartlett.  Samba's developers in turn thank
their employers and in turn their customers who have supported this
effort over many years.

Certificate Auto Enrollment
---------------------------

Certificate Auto Enrollment allows devices to enroll for certificates from
Active Directory Certificate Services. It is enabled by Group Policy.
To enable Certificate Auto Enrollment, Samba's group policy will need to be
enabled by setting the smb.conf option `apply group policies` to Yes. Samba
Certificate Auto Enrollment depends on certmonger, the cepces certmonger
plugin, and sscep. Samba uses sscep to download the CA root chain, then uses
certmonger paired with cepces to monitor the host certificate templates.
Certificates are installed in /var/lib/samba/certs and private keys are
installed in /var/lib/samba/private/certs.

Ability to add ports to dns forwarder addresses in internal DNS backend
-----------------------------------------------------------------------

The internal DNS server of Samba forwards queries non-AD zones to one or 
more
configured forwarders. Up until now it has been assumed that these 
forwarders
listen on port 53. Starting with this version it is possible to 
configure the
port using host:port notation. See smb.conf for more details. Existing 
setups
are not affected, as the default port is 53.

CTDB changes
------------

* The "recovery master" role has been renamed "leader"

   Documentation and logs now refer to "leader".

   The following ctdb tool command names have changed:

     recmaster -> leader
     setrecmasterrole -> setleaderrole

   Command output has changed for the following commands:

     status
     getcapabilities

   The "[legacy] -> recmaster capability" configuration option has been
   renamed and moved to the cluster section, so this is now:

     [cluster] -> leader capability

* The "recovery lock" has been renamed "cluster lock"

   Documentation and logs now refer to "cluster lock".

   The "[cluster] -> recovery lock" configuration option has been
   deprecated and will be removed in a future version.  Please use
   "[cluster] -> cluster lock" instead.

   If the cluster lock is enabled then traditional elections are not
   done and leader elections use a race for the cluster lock.  This
   avoids various conditions where a node is elected leader but can not
   take the cluster lock.  Such conditions included:

   - At startup, a node elects itself leader of its own cluster before
     connecting to other nodes

   - Cluster filesystem failover is slow

   The abbreviation "reclock" is still used in many places, because a
   better abbreviation eludes us (i.e. "clock" is obvious bad) and
   changing all instances would require a lot of churn.  If the
   abbreviation "reclock" for "cluster lock" is confusing, please
   consider mentally prefixing it with "really excellent".

* CTDB now uses leader broadcasts and an associated timeout to
   determine if an election is required

   The leader broadcast timeout can be configured via new configuration
   option

     [cluster] -> leader timeout

   This specifies the number of seconds without leader broadcasts
   before a node calls an election.  The default is 5.


REMOVED FEATURES
================

Older SMB1 protocol SMBCopy command removed
-------------------------------------------

SMB is a nearly 30-year old protocol, and some protocol commands that
while supported in all versions, have not seen widespread use.

One of those is SMBCopy, a feature for a server-side copy of a file.
This feature has been so unmaintained that Samba has no testsuite for
it.

The SMB1 command SMB_COM_COPY (SMB1 command number 0x29) was
introduced in the LAN Manager 1.0 dialect and it was rendered obsolete
in the NT LAN Manager dialect.

Therefore it has been removed from the Samba smbd server.

We do note that a fully supported and tested server-side copy is
present in SMB2, and can be accessed with "scopy" subcommand in
smbclient)

SMB1 server-side wildcard expansion removed
-------------------------------------------

Server-side wildcard expansion is another feature that sounds useful,
but is also rarely used and has become problematic - imposing extra
work on the server (both in terms of code and CPU time).

In actual OS design, wildcard expansion is handled in the local shell,
not at the remote server using SMB wildcard syntax (which is not shell
syntax).

In Samba 4.16 the ability to process file name wildcards in requests
using the SMB1 commands SMB_COM_RENAME (SMB1 command number 0x7),
SMB_COM_NT_RENAME (SMB1 command number 0xA5) and SMB_COM_DELETE (SMB1
command number 0x6) has been removed.

SMB1 protocol has been deprecated, particularly older dialects
--------------------------------------------------------------

We take this opportunity to remind that we have deprecated and
disabled by default, but not removed, the whole SMB1 protocol since
Samba 4.11.  If needed for security purposes or code maintenance we
will continue to remove older protocol commands and dialects that are
unused or have been replaced in more modern SMB1 versions.

We specifically deprecate the older dialects older than "NT LM 0.12"
(also known as "NT LANMAN 1.0" and "NT1").

Please note that "NT LM 0.12" is the dialect used by software as old
as Windows 95, Windows NT and Samba 2.0, so this deprecation applies
to DOS and similar era clients.

We do reassure that that 'simple' operation of older clients than
these (eg DOS) will, while untested, continue for the near future, our
purpose is not to cripple use of Samba in unique situations, but to
reduce the maintaince burden.

Eventually SMB1 as a whole will be removed, but no broader change is
announced for 4.16.

In the rare case where the above changes cause incompatibilities,
users requiring support for these features will need to use older
versions of Samba.

No longer using Linux mandatory locks for sharemodes
====================================================

smbd mapped sharemodes to Linux mandatory locks. This code in the Linux 
kernel
was broken for a long time, and is planned to be removed with Linux 
5.15. This
Samba release removes the usage of mandatory locks for sharemodes and the
"kernel share modes" config parameter is changed to default to "no". The 
Samba
VFS interface is kept, so that file-system specific VFS modules can 
still use
private calls for enforcing sharemodes.


smb.conf changes
================

   Parameter Name                          Description     Default
   --------------                          -----------     -------
   kernel share modes                      New default     No
   dns forwarder                           Changed
   rpc_daemon                              Removed
   rpc_server                              Removed
   rpc start on demand helpers             Added           true


CHANGES SINCE 4.16.0rc5
=======================

o  Andrew Bartlett <abartlet@samba.org>
    * BUG 15000: Memory leak in FAST cookie handling.

o  Elia Geretto <elia.f.geretto@gmail.com>
    * BUG 14983: NT_STATUS_ACCESS_DENIED translates into EPERM instead 
of EACCES
      in SMBC_server_internal.

o  Stefan Metzmacher <metze@samba.org>
    * BUG 13879: Simple bind doesn't work against an RODC (with 
non-preloaded
      users).
    * BUG 14641: Crash of winbind on RODC.
    * BUG 15001: LDAP simple binds should honour "old password allowed 
period".
    * BUG 15002: S4U2Self requests don't work against servers without FAST
      support.
    * BUG 15003: wbinfo -a doesn't work reliable with upn names.
    * BUG 15005: A cross-realm kerberos client exchanges fail using KDCs 
with and
      without FAST.
    * BUG 15015: PKINIT: hdb_samba4_audit: Unhandled hdb_auth_status=9 =>
      INTERNAL_ERROR.

o  Garming Sam <garming@catalyst.net.nz>
    * BUG 13879: Simple bind doesn't work against an RODC (with 
non-preloaded
      users).

o  Andreas Schneider <asn@samba.org>
    * BUG 15016: Regression: create krb5 conf = yes doesn't work with a 
single
      KDC.

o  Joseph Sutton <josephsutton@catalyst.net.nz>
    * BUG 15015: PKINIT: hdb_samba4_audit: Unhandled hdb_auth_status=9 =>
      INTERNAL_ERROR.


CHANGES SINCE 4.16.0rc4
=======================

o  Jeremy Allison <jra@samba.org>
    * BUG 14737: Samba does not response STATUS_INVALID_PARAMETER when 
opening 2
      objects with same lease key.

o  Jule Anger <janger@samba.org>
    * BUG 14999: Listing shares with smbstatus no longer works.

o  Douglas Bagnall <douglas.bagnall@catalyst.net.nz>
    * BUG 14996: Fix ldap simple bind with TLS auditing.

o  Andrew Bartlett <abartlet@samba.org>
    * BUG 14995: Use Heimdal 8.0 (pre) rather than an earlier snapshot.

o  Volker Lendecke <vl@samba.org>
    * BUG 14989: Fix a use-after-free in SMB1 server.

o  Stefan Metzmacher <metze@samba.org>
    * BUG 14865: Uncached logon on RODC always fails once.
    * BUG 14984: Changing the machine password against an RODC likely 
destroys
      the domain join.
    * BUG 14993: authsam_make_user_info_dc() steals memory from its struct
      ldb_message *msg argument.
    * BUG 14995: Use Heimdal 8.0 (pre) rather than an earlier snapshot.

o  Joseph Sutton <josephsutton@catalyst.net.nz>
    * BUG 14995: Use Heimdal 8.0 (pre) rather than an earlier snapshot.


CHANGES SINCE 4.16.0rc3
=======================

o  Samuel Cabrero <scabrero@suse.de>
    * BUG 14979: Problem when winbind renews Kerberos.

o  Björn Jacke <bj@sernet.de>
    * BUG 13631: DFS fix for AIX broken.
    * BUG 14974: Solaris and AIX acl modules: wrong function arguments.
    * BUG 7239: Function aixacl_sys_acl_get_file not declared / coredump.

o  Andreas Schneider <asn@samba.org>
    * BUG 14967: Samba autorid fails to map AD users if id rangesize 
fits in the
      id range only once.

o  Martin Schwenke <martin@meltin.net>
    * BUG 14958: CTDB can get stuck in election and recovery.


CHANGES SINCE 4.16.0rc2
=======================

o  Jeremy Allison <jra@samba.org>
    * BUG 14169: Renaming file on DFS root fails with
      NT_STATUS_OBJECT_PATH_NOT_FOUND.
    * BUG 14938: NT error code is not set when overwriting a file during 
rename
      in libsmbclient.

o  Ralph Boehme <slow@samba.org>
    * BUG 14674: net ads info shows LDAP Server: 0.0.0.0 depending on 
contacted
      server.

o  Pavel Filipenský <pfilipen@redhat.com>
    * BUG 14971: virusfilter_vfs_openat: Not scanned: Directory or 
special file.

o  Volker Lendecke <vl@samba.org>
    * BUG 14900: Regression: Samba 4.15.2 on macOS segfaults intermittently
      during strcpy in tdbsam_getsampwnam.
    * BUG 14975: Fix a crash in vfs_full_audit - CREATE_FILE can free a 
used fsp.

o  Stefan Metzmacher <metze@samba.org>
    * BUG 14968: smb2_signing_decrypt_pdu() may not decrypt with
      gnutls_aead_cipher_decrypt() from gnutls before 3.5.2.

o  Andreas Schneider <asn@samba.org>
    * BUG 14960: SDB uses HDB flags directly which can lead to unwanted side
      effects.


CHANGES SINCE 4.16.0rc1
=======================

o  Jeremy Allison <jra@samba.org>
    * BUG 14911: CVE-2021-44141: UNIX extensions in SMB1 disclose 
whether the
      outside target of a symlink exists.

o  Ralph Boehme <slow@samba.org>
    * BUG 14914: CVE-2021-44142: Out-of-Bound Read/Write on Samba vfs_fruit
      module.
    * BUG 14961: install elasticsearch_mappings.json

o  FeRD (Frank Dana) <ferdnyc@gmail.com>
    * BUG 14947: samba-bgqd still notifying systemd, triggering log warnings
      without NotifyAccess=all.

o  Stefan Metzmacher <metze@samba.org>
    * BUG 14867: Printing no longer works on Windows 7 with 2021-10 monthly
      rollup patch.
    * BUG 14956: ndr_push_string() adds implicit termination for
      STR_NOTERM|REMAINING empty strings.

o  Joseph Sutton <josephsutton@catalyst.net.nz>
    * BUG 14950: CVE-2022-0336: Re-adding an SPN skips subsequent SPN 
conflict
      checks.


KNOWN ISSUES
============

https://wiki.samba.org/index.php/Release_Planning_for_Samba_4.16#Release_blocking_bugs


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

         https://download.samba.org/pub/samba/stable/

The release notes are available online at:

         https://www.samba.org/samba/history/samba-4.16.0.html

Our Code, Our Bugs, Our Responsibility.
(https://bugzilla.samba.org/)

                         --Enjoy
                         The Samba Team


