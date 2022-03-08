Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 35ACA4D1B58
	for <lists+samba-technical@lfdr.de>; Tue,  8 Mar 2022 16:08:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=Fa7p3bDXYDQcIqiT2hCyWnOfmeyRet34Ma+hfScRY+8=; b=UEuA2X3ce9oLvEZibCv+t7GfCJ
	aFOQm30owxwFGxhMgZGQp8LrDoiGDDVWn+TiQXirA6UnWMF+WoOHcjacJaafo1+JUAIqgWyotaEIR
	uM6Kh+LjDFOQpkhEnJLLWrcP/Jr/QZrMExXegoorX10fb+Ybbd0VpQTfRjo0sISi75Gf1OhWY8VzI
	DcQfAaOG3MEk+yA2doLs5KiJ7d7eI7QNrhOTIbFEYRwihH0zlSBp84GmTjdv5smojdZhv/qAC3KLc
	IAh+SDyj+alGrUz5bwxeC5ClyRGORftNrY4SbW1NbNycsRwoxGnvFsIfpxZUWndpij6bOZCbyuhHd
	zEhL2PSQ==;
Received: from ip6-localhost ([::1]:45606 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nRbRR-000QGW-EU; Tue, 08 Mar 2022 15:08:01 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:37390) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nRbRG-000QFa-Bw; Tue, 08 Mar 2022 15:07:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=Fa7p3bDXYDQcIqiT2hCyWnOfmeyRet34Ma+hfScRY+8=; b=Vpm6uirBE24slgF9frQe0o68F9
 yedcHlcH8/9n/MMv5KYODlsP1gxNm+ef9Gb8F+McLf/IYX1YCTd4uAFHfCJGzQEumuGVTmvVwibym
 M4xBegYoPvOLx73ZBc7uIVMmz/TD54QJ8gD8miK0t1ppVFsChgnYsqYJrEUOGu5HNobp1ejA22TtE
 YIbkf0UGIOZ103cRDbzYFHGwTKMJk0DMz/M7j1goAmeCH29NEWG/EhRh71MrEhSWDm9cNCkmXKxMq
 OxERfWDXoDVidchP9gEy/1dHAtu8sc2pBnVA7T8itPG2y/IL14qtinGojzz/t6qzb/LSBwUnTpEOO
 OwN+El0Nva1jeW4tSV4u2RVi5VNtDSJPwSVhcAwipXmwBa84DpfYae0lE60z95rsm/dHTYQBCNt2l
 uol1vUFVnXHeep6aeiuGD/fyCWKG3kja1KsFwrWmjy8JtJGGIXwXogFuWWtwzOCgYVnt822kSFc9E
 Tk2taLCKTyEeyZqnGtsQvETD;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1nRbRF-000Mi0-Ib; Tue, 08 Mar 2022 15:07:49 +0000
Message-ID: <4dd5299d-8fac-a8d8-9b03-753a629902cb@samba.org>
Date: Tue, 8 Mar 2022 16:07:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: de-DE
To: samba-announce@lists.samba.org, samba@lists.samba.org,
 samba-technical@lists.samba.org
Subject: [Announce] Samba 4.16.0rc5 Available for Download
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

This is the fifth release candidate of Samba 4.16.  This is *not*
intended for production environments and is designed for testing
purposes only.  Please report any defects via the Samba bug reporting
system at https://bugzilla.samba.org/.

Samba 4.16 will be the next version of the Samba suite.


UPGRADING
=========


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

SMB1 CORE and LANMAN1 protocol wildcard copy, unlink and rename removed
=======================================================================

In preparation for the removal of the SMB1 server, the unused
SMB1 command SMB_COM_COPY (SMB1 command number 0x29) has been
removed from the Samba smbd server. In addition, the ability
to process file name wildcards in requests using the SMB1 commands
SMB_COM_COPY (SMB1 command number 0x2A), SMB_COM_RENAME (SMB1 command
number 0x7), SMB_COM_NT_RENAME (SMB1 command number 0xA5) and
SMB_COM_DELETE (SMB1 command number 0x6) have been removed.

This only affects clients using MS-DOS based versions of
SMB1, the last release of which was Windows 98. Users requiring
support for these features will need to use older versions
of Samba.

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
joining the #samba-technical IRC channel on irc.freenode.net.

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

https://download.samba.org/pub/samba/rc/samba-4.16.0rc5.WHATSNEW.txt

Our Code, Our Bugs, Our Responsibility.
(https://bugzilla.samba.org/)

                         --Enjoy
                         The Samba Team

