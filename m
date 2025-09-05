Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id AAF4EB4563E
	for <lists+samba-technical@lfdr.de>; Fri,  5 Sep 2025 13:24:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=0OgInf7Se6Swu0nBdo/FN6zfH/VIJCMAbT0ThPK6WQM=; b=jdh19C5FgJbgZ8xq6M6MvEWrN5
	a3S4WerQn58c7NLvMLwazRHzLZpA9HQA8uSqXeMbj66KNtrQnV031u0LvtcdarSNvcIizudvSKlWB
	xE/1hKUiUla7lgU7I4TFBCn650mNoNNdUitBs8L2Wz169zjTeHITfoKTAuRuLcnXU/YbUfMjYZZsE
	5fMZZQCn542Q98SDZfCl56LfJYxtioasUE60LB8wb/R0U5pa0uVqMb9ASCMEI+5x1sz3UfDjKDcJo
	La/lN68/0aZEDjpnYAkTrkfSjfD8kOQxSXa/GLJdID1mUD7nZJ7YvLgqsRxx6VOnGhU8hF8QaytvA
	olTj4glA==;
Received: from ip6-localhost ([::1]:24276 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uuUXL-0036kD-Sm; Fri, 05 Sep 2025 11:23:23 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:50030) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uuUXC-0036jQ-QZ; Fri, 05 Sep 2025 11:23:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=0OgInf7Se6Swu0nBdo/FN6zfH/VIJCMAbT0ThPK6WQM=; b=VW58Q31UJdO/Rz7KI1SI31vrn+
 THeM6Q3E8wM4+0myt3aTAFPnSfuQQma+VkPYp6JyHnRi3VsBTd8MiONMpzXYDBBTN+S50hM2jtfh5
 UOVJfy73eCHXyHBhsQofofPtzz946iMB/9Ib0XvHYKi88GvHunlFj8W3cgcF4jex6NZGEdZUrSwh3
 n7JZg3yPWPCslj7h/0QzzX9+aQRn6opUMumnZcleUp7z7sE82rX0KVVZ4FGvXJqFvWACI60EFSxaH
 s8hU0ReIP0cE0zj8AtLaKpd4rBRzZBE/nqRYv045a6kHyG4bYq0Q3EfS7Zs55BgxxdKFu2ByvdwbY
 5024sjtRp7sG9vjEPP6AP2YOGCbyE+aezO5u/TyDmajMsZhyLPIhrZ0tpjr4yP5gH0Q+lkVnBOnHa
 zYj+v7JyVJMAbTKQEsPnRVALBpyzWsEiIvXybkzfa/V6kfO0u4ZBNWT9dv5Uabz3ALGR8zjuMVURS
 GcXl1erg1+QeaPWN5XnJ7eeZ;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uuUXC-002Ygh-17; Fri, 05 Sep 2025 11:23:14 +0000
Message-ID: <3677bffd-df6c-4074-9278-bbc11e8fb786@samba.org>
Date: Fri, 5 Sep 2025 13:23:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: de-DE
To: samba-announce@lists.samba.org, samba@lists.samba.org,
 samba-technical@lists.samba.org
Subject: [Announce] Samba 4.23.0rc4 Available for Download
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

This is the fourth release candidate release of Samba 4.23.  This is *not*
intended for production environments and is designed for testing
purposes only.  Please report any defects via the Samba bug reporting
system at https://bugzilla.samba.org/.

Samba 4.23 will be the next version of the Samba suite.


UPGRADING
=========


NEW FEATURES/CHANGES
====================

Enable SMB3 Unix Extensions by default
--------------------------------------
Starting with Samba 4.23, the SMB3 UNIX Extensions are enabled by
default. These extensions provide first-class support for POSIX semantics
over SMB3, allowing UNIX and Linux clients to access file services with
features such as proper POSIX permissions, symlink handling, hardlinks,
and special file types.

Enabling this feature by default improves interoperability for UNIX/Linux
clients without requiring additional configuration. Windows clients that
do not support the extensions will continue to function normally, by
using standard SMB3 behavior.

Add support for SMB3 over QUIC
------------------------------
The new "client smb transports" and "server smb transport"
allow a more flexible configuration for the used tcp
sockets.

It also got the ability specify "quic" as possible transport.
If quic should be used in addition to the defaults something
like "server smb transports = +quic" can be used.

For the client quic only works with name based uncs,
ip address based uncs are not supported.

Note for the server 'quic' requires the quic.ko kernel module
for Linux from https://github.com/lxin/quic (tested with Linux 6.14).
Future Linux versions may support it natively, here's the
branch that will hopefully accepted upstream soon:
https://github.com/lxin/net-next/commits/quic/

For the client side there's a fallback to the userspace ngtcp2
library if the quic kernel module is not available.

Check the smb.conf manpage for additional hints
about the "client smb transports" and "server smb transport"
options and interactions with tls related options.

Modern write time update logic
------------------------------
Samba 4.23 changes file timestamp handling to match modern Windows servers.
Earlier releases used delayed write time updates, where last_write_time was
only refreshed after a short idle period. Now Samba applies immediate
timestamp updates consistent with modern Windows 10/Server 2016 or newer.

Initial version of smb_prometheus_endpoint
------------------------------------------
Samba 4.23 introduces the smb_prometheus_endpoint utility, which exports
Samba server metrics in Prometheus-compatible format. This enables seamless
integration of Samba performance and status monitoring into existing
Prometheus and Grafana environments. For usage and configuration details,
refer to the new smb_prometheus_endpoint man page.

samba-tool domain backup --no-secrets avoids confidential attributes
--------------------------------------------------------------------
The --no-secrets option creates a back-up without secret attributes
(e.g. passwords), suitable for use in a lab domain. Until now it could
still contain confidential attributes, including BitLocker recovery
data and KDS root keys. Objects in the classes msKds-ProvRootKey,
msFVE-RecoveryInformation, and msTPM-InformationObject will now be
entirely removed from the backup, as these objects are required by
schema to have confidential attributes and are no use without them.

CTDB changes
------------
CTDB now supports loading tunables from
/etc/ctdb/tunables.d/*.tunables, in addition to the standard
/etc/ctdb/tunables.conf.  See the ctdb-tunables(7) manual page for
more details.  Note that the above locations are examples - the
actual location of these files will depend on compile time
configuration.

It isn't expected that many users will require a directory of tunables
files, since most users do not need to change tunables from their
default values.  However, this allows vendors to ship their required
tunables settings (for example, in one or more files marked "do not
edit") while still allowing local administrators to add their own
tunables settings (in one or more separate files).

Per-share profiling stats
-------------------------
Starting with Samba 4.23, users can collect profile counters at a
per-share level. This feature requires building Samba with profiling
data enabled and adding an appropriate `smb.conf` parameter for
specific shares. It's particularly useful for deployments with a large
number of active shares, allowing administrators to monitor individual
share activity and identify potential bottlenecks or hot-spots. When
enabled, users can inspect current per-share profile information
("Extended Profile") using the standard `smbstatus` utility.

Currently, this functionality is supported only by the default and
`ceph_new` VFS modules.


REMOVED FEATURES
================


smb.conf changes
================

   Parameter Name                          Description     Default
   --------------                          -----------     -------
   smbd profiling share                    New             no
   client smb transports                   New             tcp, nbt
   server smb transports                   New             tcp, nbt
   winbind varlink service                 New             no


CHANGES SINCE 4.23.0rc3
=======================

o  Alexander Bokovoy <ab@samba.org>
    * BUG 15902: Regression in gssproxy support in 4.23.rc1+.

o  MikeLiu <mikeliu@qnap.com>
    * BUG 15900: 'net ads group' failed to list domain groups.


CHANGES SINCE 4.23.0rc2
=======================

o  Ralph Boehme <slow@samba.org>
    * BUG 15843: macOS Finder client DFS broken on 4.22.0.

o  Stefan Metzmacher <metze@samba.org>
    * BUG 15899: Self-signed certificates don't have X509v3 Subject 
Alternative
      Name for DNS.

o  Andreas Schneider <asn@samba.org>
    * BUG 15893: Improve handling of principals and realms in client tools.


CHANGES SINCE 4.23.0rc1
=======================

o  Björn Baumbach <bb@sernet.de>
    * BUG 15896: libquic build fixes.

o  Ralph Boehme <slow@samba.org>
    * BUG 15844: getpwuid does not shift to new DC when current DC is down.
    * BUG 15876: Windows security hardening locks out schannel'ed 
netlogon dc
      calls like netr_DsRGetDCName.

o  Gary Lockyer <gary@catalyst.net.nz>
    * BUG 15896: libquic build fixes.


KNOWN ISSUES
============

https://wiki.samba.org/index.php/Release_Planning_for_Samba_4.23#Release_blocking_bugs


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

https://download.samba.org/pub/samba/rc/samba-4.23.0rc4.WHATSNEW.txt

Our Code, Our Bugs, Our Responsibility.
(https://bugzilla.samba.org/)

                         --Enjoy
                         The Samba Team


