Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4383DB545E1
	for <lists+samba-technical@lfdr.de>; Fri, 12 Sep 2025 10:49:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=zKrpPnT/wkmnkP6F7kjotPKCQUCOXhZcST95QJZhD5M=; b=mAJ2N7qQDHZmKM0Fm22v9D7b6W
	3oVXZs4aZoMHg/ocugYprIdR2QUDHesHcxHybzhzY8bfu2a0flA9IX+hDKTzYG01oYdXPZL7eRvls
	gjqCkwx4VbUzHFRUwLwU76EXmgo8qVDVfsWET+a4I8uY2oKZp95oGXkZH971OBK0RFoP7JvUlPfvK
	4V+F+rNegfHqMTPDKz02NswE/Z4Uk1vRDWg3Ml25cEuLaXRIXow0pZif39ICjopxP254B2S58pTRy
	Xcw2REDg/jKsurGA67wJztCVUCZHkC0JOy+D9FGuNk1pzK25CZJ79AZzSUReUBaglUJ5F8VMpXPqz
	aU4aSbBQ==;
Received: from ip6-localhost ([::1]:33562 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uwzSd-003cPX-Hm; Fri, 12 Sep 2025 08:48:51 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:23002) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uwzSU-003cOn-PM; Fri, 12 Sep 2025 08:48:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=zKrpPnT/wkmnkP6F7kjotPKCQUCOXhZcST95QJZhD5M=; b=lkJ9sCyBhyqdIOSIAKPL+48SSj
 AmIYba4q4hmk1k2PD8CJ7nNAOoRO2uFVBosVD5tQyAHcp78XNRM3cgEFgqncY/cJozHlhthrkd+pp
 Pq7a4QFNNaIiJGC0fzmXAfVPiz6BtjxWxNWY0ruGVpI2WLWKCHPM4thVNnBtBcHBATJo6QnEeUvCC
 OMenUzGSieJEqF8q8QPBdoF0vJI4eE68crXLiZX2Xu1w5swGLy9bBiw230WiaDCkHQd0rS1EO/Q+Y
 hG1iPrgmQnOENCmi4f+pcuyfbtk1ygvregur63W+txxu8WnornpMhLCIOifwj8xdLSbGVvakVApR1
 i8NgBG+Rmfa6UwIhVXIdGAvR9QKUN6647udObxk9GgIBiG/agd3ZrvbGbz050nWBM4z7aNITNSl/5
 o9Q3aXVgCr5vhU07bSbii6Etw5uBeUJ1D23kp1iY4ndCcqc73T56BeI5Jc4okqO9Hi+aIUZHJWF1x
 jjqr5ABG5OYek+JWrBiSAx/7;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uwzSU-003lQq-1t; Fri, 12 Sep 2025 08:48:42 +0000
Message-ID: <60f445a0-1f1e-4886-b0ee-94dd05775108@samba.org>
Date: Fri, 12 Sep 2025 10:48:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: samba-announce@lists.samba.org, samba@lists.samba.org,
 samba-technical@lists.samba.org
Subject: [Announce] Samba 4.23.0 Available for Download
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

This is the first stable release of the Samba 4.23 release series.
Please read the release notes carefully before upgrading.


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


CHANGES SINCE 4.23.0rc4
=======================

o  Douglas Bagnall <douglas.bagnall@catalyst.net.nz>
    * BUG 15911: samba.tests.safe_tarfile fails on Python 3.13 with 
additional
      security fixes for tarfile support.

o  Alexander Bokovoy <ab@samba.org>
    * BUG 15904: CTDB does not support PCP 7.0.0.

o  Pavel Filipenský <pfilipensky@samba.org>
    * BUG 15905: samba-4.21 fails to join AD when multiple DCs are returned.

o  Volker Lendecke <vl@samba.org>
    * BUG 15908: Uninitialized read leads to hanging rpcd_spoolss.

o  Andreas Schneider <asn@samba.org>
    * BUG 15905: samba-4.21 fails to join AD when multiple DCs are returned.
    * BUG 15907: Stack buffer overflow in samba3.smb2.dirlease.fileserver.


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

================
Download Details
================

The uncompressed tarballs and patch files have been signed
using GnuPG (ID AA99442FB680B620).  The source code can be downloaded
from:

         https://download.samba.org/pub/samba/stable/

The release notes are available online at:

         https://www.samba.org/samba/history/samba-4.23.0.html

Our Code, Our Bugs, Our Responsibility.
(https://bugzilla.samba.org/)

                         --Enjoy
                         The Samba Team


