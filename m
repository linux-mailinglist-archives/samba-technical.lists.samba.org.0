Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id DA927B31FA2
	for <lists+samba-technical@lfdr.de>; Fri, 22 Aug 2025 17:54:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=kYb8j/VsoVP0C75kb1EL3mn0rdnu9+6r4mWeaH9OYA4=; b=GR80GyW1V4Mxd1r+y7rUXBpjul
	DHrL2kGl+h31amXNdl+DppL90w63kbhhGL31RJ0XqhxaZrqQc5pSHmewtzLyAEjduuqjFSqYR40Ns
	APbN2gf8TAs8ln/FlGfkdctF9wAPT1Z0wZmxY8yu6LaTK1sgRwQBSzNDPeMTQCEYVav84jkXYQbNh
	U212ba3lRlHVZtE8MJhirKEeTtDuS6/vkmgb3Z0vtEKgBoKGRV4NXxdzMVIBQdPPiCtnR2QM6EufR
	usV/pOm8NgqgctWILLJMVnVGKJID9irp9d/DeMl66ayGvMG2jcdoaaCIkFweQZJm/KfCHXmoEzHCe
	+kPvEXtA==;
Received: from ip6-localhost ([::1]:64970 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1upU5B-0009jN-69; Fri, 22 Aug 2025 15:53:37 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:63914) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1upU52-0009ia-4J; Fri, 22 Aug 2025 15:53:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=kYb8j/VsoVP0C75kb1EL3mn0rdnu9+6r4mWeaH9OYA4=; b=0EMXx5ZNwL1qC2OWwBdoco6DtS
 FY0f772Gdavop46dLbxbOihCegbKOYukuNYvMPcoDqnS2VZfOF/CWbnR0FQIsqOYdNURE5GLiEsb5
 E0yKNoAamQGRz6q0nvVz2+WRFgnncOoFpvPei2KMLrpNnUUibBih6DLkfTIUUFA3gTMczF2pK7lPO
 TS0wWcKkF6du2NbrA5MrIgwn38zp1hSjfs2uy/BTGHqESihzkeMd24sLVPE8xtBlr4TUY3MNLKg0H
 M5U+LgupJ9MhlcSyuRDunMkWZvhx8WcwprJDSOEMZUM2oId1XGjU22w+HH3wY9/myEmGuFeDy11Jm
 icZ8ECfenp1SFCYJ12eynqTsX3SH35wQkhWBUR/D1rzWF+WhThxV41CQ8+X0pCt9o4XVEgRWconc5
 J2nolPltt3wVkPU+yBhkYVZX5lmAyaTK4eG2H9Ev8EwYHAdPv71pcGjMtobAagzzrAjSLhpQCzpHF
 aMQU5g4hokAdj4IJfBScKH4T;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1upU51-000HuY-25; Fri, 22 Aug 2025 15:53:27 +0000
Message-ID: <2542d53d-a6b9-4b73-bb37-b66e5af5a239@samba.org>
Date: Fri, 22 Aug 2025 17:53:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: de-DE
To: samba-announce@lists.samba.org, samba@lists.samba.org,
 samba-technical@lists.samba.org
Subject: [Announce] Samba 4.23.0rc2 Available for Download
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

This is the second release candidate release of Samba 4.23.  This is *not*
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
todo

Add support for SMB3 over QUIC
------------------------------
todo

Modern write time update logic
------------------------------
todo

Initial version of smb_prometheus_endpoint
------------------------------------------
todo

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

* CTDB now supports loading tunables from
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

https://download.samba.org/pub/samba/rc/samba-4.23.0rc2.WHATSNEW.txt

Our Code, Our Bugs, Our Responsibility.
(https://bugzilla.samba.org/)

                         --Enjoy
                         The Samba Team

