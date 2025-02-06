Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id AC784A2A91C
	for <lists+samba-technical@lfdr.de>; Thu,  6 Feb 2025 14:09:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=MO6mLrLoDzJtXDnDvuKSkq88A4LMs8YS8qsBRTh9U+I=; b=YJ5KAwWNWbLKlR6/cTSwn3GtKG
	OREVvp/NcmwJLmN9cajEZR4kzBK8rLQX1paVREa1zWFvncuvhm4OPCDJPUpj/JJLNsxsQp2npUaZB
	n52gw1KzQtqMAbvL1Dfix1MYcGC6+Kh2Ud+xdsGmjyPogOW2qnG4pjl/HJoEdRtsOkfWszY1KAWHY
	182WqHjaKtV6VwhIFWv9WMUpOsV7AsC432eA0hV5VKQtdBOOuQ0eW7VEP/XI+fXhwkit4KL4QCEyP
	Ehmt6s4K/VY1pDwGUuert+J3mYwEE1LkOjibZ6izvCMfQ6Qtf2QbTySxHc6w/pJtOqZSCPhpzZidf
	rmGMK5fA==;
Received: from ip6-localhost ([::1]:53818 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1tg1cS-00BtpA-7a; Thu, 06 Feb 2025 13:08:36 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:57928) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1tg1cJ-00BtoQ-KB; Thu, 06 Feb 2025 13:08:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=MO6mLrLoDzJtXDnDvuKSkq88A4LMs8YS8qsBRTh9U+I=; b=B766CnjQRuNIx6n9dzv1dO4vCQ
 ojCNrugSnIv9LwSxQ8dKE2hQEgZFSun1SOoNl2kXvg6RkJnQbKWOWAH1wErqYqSZIKbBaUkj9aprG
 FzEMwsBY5qagkyrFYeaoNOBBwTPO1jSTbz+wgRTc45Xh0DEHFI0wOAa3ev0ogenZrfZS/Xw5GSovw
 pqLYsq/V5BfY61ZaWc6uWH4gr2lTITuIpnEeFiz0LsoJMw0KSbiO4ZObIeAIGYJCuZ5OsvYcSvpL9
 FFlpEFt9ooDwJqlrjfmaYG4Ta4f7j0ZPfxjW+BTKdnjOhzYkNuHkwoHc1GPYcRl3Tz8ATm0rL9sfd
 D7bABC8fNicMT3pCDsfGlbIf30LCggep3HwqOHqf2zhr0li8MsQVPubvglOmlJ2zE+5t2jf8ceRWz
 xserAff3DuJRicgdc5YBB5RDbxk0rE5btnaowsHcboPHdAYbI+pTAI2L2iIyX1vGhIlMAzcFnCEzi
 ZjlRI8Y4KbImmoCli4lK8QPy;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1tg1cJ-001MBS-0B; Thu, 06 Feb 2025 13:08:27 +0000
Message-ID: <5f8a1298-bf5b-4d41-a7f5-5c298944d41b@samba.org>
Date: Thu, 6 Feb 2025 14:08:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: de-DE
To: samba-announce@lists.samba.org, samba@lists.samba.org,
 samba-technical@lists.samba.org
Subject: [Announce] Samba 4.22.0rc1 Available for Download
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

This is the first release candidate of Samba 4.22.  This is *not*
intended for production environments and is designed for testing
purposes only.  Please report any defects via the Samba bug reporting
system at https://bugzilla.samba.org/.

Samba 4.22 will be the next version of the Samba suite.


UPGRADING
=========


NEW FEATURES/CHANGES
====================

SMB3 Directory Leases
---------------------

Starting with Samba 4.22 SMB3 Directory Leases are supported. The new global
option "smb3 directory leases" controls whether the feature is enabled or
not. By default, SMB3 Directory Leases are enabled on non-clustered 
Samba and
disabled on clustered Samba, based on the "clustering" option. See man 
smb.conf
for more details.

SMB3 Directory Leases allow clients to cache directory listings and, 
depending
on the workload, result in a decent reduction in SMB requests from clients.

Netlogon Ping over LDAP and LDAPS
---------------------------------

Samba must query domain controller information via simple queries on
the AD rootdse's netlogon attribute. Typically this is done via
connectionless LDAP, using UDP on port 389. The same information is
also available via classic LDAP rootdse queries over TCP. Samba can
now be configured to use TCP via the new "client netlogon ping
protocol" parameter to enable running in environments where firewalls
completely block port 389 or UDP traffic to domain controllers.

REMOVED FEATURES
================

The "nmbd proxy logon" feature was removed. This was used before
Samba4 acquired a NBT server.

The parameter "cldap port" has been removed. CLDAP runs over UDP port
389, we don't see a reason why this should ever be changed to a
different port. Moreover, we had several places in the code where
Samba did not respect this parameter, so the behaviour was at least
inconsistent.

fruit:posix_rename
------------------

This option of the vfs_fruit VFS module that could be used to enable POSIX
directory rename behaviour for OS X clients has been removed as it could 
result
in severe problems for Windows clients.

As a possible workaround it is possible to prevent creation of .DS_Store 
files
(a Finder thingy to store directory view settings) on network mounts by 
running

   $ defaults write com.apple.desktopservices DSDontWriteNetworkStores true

on the Mac.


smb.conf changes
================

   Parameter Name                          Description     Default
   --------------                          -----------     -------
   smb3 directory leases                   New             Auto
   vfs mkdir use tmp name                  New             Auto
   client netlogon ping protocol           New             cldap
   fruit:posix_rename                      Removed
   cldap port                              Removed

KNOWN ISSUES
============

https://wiki.samba.org/index.php/Release_Planning_for_Samba_4.22#Release_blocking_bugs


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

https://download.samba.org/pub/samba/rc/samba-4.22.0rc1.WHATSNEW.txt

Our Code, Our Bugs, Our Responsibility.
(https://bugzilla.samba.org/)

                         --Enjoy
                         The Samba Team

