Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 75D39844942
	for <lists+samba-technical@lfdr.de>; Wed, 31 Jan 2024 21:57:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=aRpN/YZxkvA/36ExP6HIIzPLjMZXPoilH+2Yqt5+J7g=; b=gcPbemhCnz10GcJVyki1mx5TwT
	Vr0kNQf0LQ36tXG0kuGREh4d84TVboReFWrglZMGXGb4MMXA4e5SztLfd1O2GX+uYEGH30JWKZCPD
	rnZihF3l3PqGV3Cne1j6GwRe84dWG8Lb9Iuoeqcgx6DIPwhENbdvc+iUvbHQ/hLsMDCNrjiDD3zK+
	Sc2Yt7Mjuuu2fyMopucGzX1n/Ck8W8x/rLpPFi4WANtHOFWisSPn2ZvJ8RUqjoBwEEmiLR2snGbii
	B3VS+yhshRHFbSdoXholCYje7ukIWQcedJC0XWPoOcbAovmP075vnHRScmciaYPxAW3rs3HfnQwoQ
	yZI4HkbQ==;
Received: from ip6-localhost ([::1]:38222 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1rVHdh-005KzD-HX; Wed, 31 Jan 2024 20:56:57 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:16312) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rVHdY-005KyX-CX; Wed, 31 Jan 2024 20:56:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=aRpN/YZxkvA/36ExP6HIIzPLjMZXPoilH+2Yqt5+J7g=; b=2kOQLqwn/0wGUbE5CJ+kGEbRQO
 Xyfo+6fsHX1xeN3HUplEmfn0WdM4+hVPq3BKb9U1ZG27lemXFBqljoS9fjh/xJ9w40z04v0T2gOiR
 We5fzp9bmzgx/9I2oO+yEJSXqYaAeVMUUdILjqmXss3L+2+it+EJI6nMLz4h0fjwVqUtUu6m/ZZMD
 9CjbZ2hV4czuMv7+w6UvVGnhgLLtQ7QM64SLU3mQVPd6qS97HDtX5fQdN3WxADETMRe2DuEhyzw0G
 Pr3ocWJvyFuBEtXs+hWc5AXyXtmNSlfpSdwYb9xxcCOA2aSScykQ0GvwY7EKym5WhrexzM4JFWqHj
 Jit4t4Jaxe/gYwu1DwUTJzQxVpeiVD0LbNbVIQUOQCLDOPAukexvRr0HnqROdUTP5Ahtcd55TIiyD
 OUI94ERQDMHFozjCcPwRvYz3SQhPmHER5JBmHB+3rXURHJZjXOoTOlVbctghv5KOJQgLePH5J+sF5
 oQfe1nwZwFwovLYIx0ffkuIb;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rVHdX-00At3M-2Y; Wed, 31 Jan 2024 20:56:47 +0000
Message-ID: <d7bf09c9-b83e-46c6-8c41-1adc4ca31ef6@samba.org>
Date: Wed, 31 Jan 2024 21:56:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: de-DE
To: samba-announce@lists.samba.org, samba@lists.samba.org,
 samba-technical@lists.samba.org
Subject: [Announce] Samba 4.18.10 Available for Download
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

This is the latest stable release of the Samba 4.18 release series.


Changes since 4.18.9
--------------------

o  Ralph Boehme <slow@samba.org>
    * BUG 13688: Windows 2016 fails to restore previous version of a 
file from a
      shadow_copy2 snapshot.
    * BUG 15549: Symlinks on AIX are broken in 4.19 (and a few version 
before
      that).

o  Samuel Cabrero <scabrero@samba.org>
    * BUG 13577: net changesecretpw cannot set the machine account 
password if
      secrets.tdb is empty.

o  Bjoern Jacke <bj@sernet.de>
    * BUG 12421: Fake directory create times has no effect.

o  Björn Jacke <bjacke@samba.org>
    * BUG 15540: For generating doc, take, if defined, env 
XML_CATALOG_FILES.
    * BUG 15541: Trivial C typo in nsswitch/winbind_nss_netbsd.c.
    * BUG 15542: vfs_linux_xfs is incorrectly named.
    * BUG 15550: ctime mixed up with mtime by smbd.

o  Volker Lendecke <vl@samba.org>
    * BUG 15523: ctdb RELEASE_IP causes a crash in release_ip if a 
connection to
      a non-public address disconnects first.
    * BUG 15544: shadow_copy2 broken when current fileset's directories are
      removed.

o  Stefan Metzmacher <metze@samba.org>
    * BUG 15523: ctdb RELEASE_IP causes a crash in release_ip if a 
connection to
      a non-public address disconnects first.
    * BUG 15534: smbd does not detect ctdb public ipv6 addresses for 
multichannel
      exclusion.

o  Martin Schwenke <mschwenke@ddn.com>
    * BUG 15523: ctdb RELEASE_IP causes a crash in release_ip if a 
connection to
      a non-public address disconnects first.

o  Shachar Sharon <ssharon@redhat.com>
    * BUG 15440: Unable to copy and write files from clients to Ceph 
cluster via
      SMB Linux gateway with Ceph VFS module.

o  Jones Syue <jonessyue@qnap.com>
    * BUG 15547: Multichannel refresh network information.
    * BUG 15555: smbpasswd reset permissions only if not 0600.


#######################################
Reporting bugs & Development Discussion
#######################################

Please discuss this release on the samba-technical mailing list or by
joining the #samba-technical:matrix.org matrix room, or
#samba-technical IRC channel on irc.libera.chat.

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

         https://www.samba.org/samba/history/samba-4.18.10.html

Our Code, Our Bugs, Our Responsibility.
(https://bugzilla.samba.org/)

                         --Enjoy
                         The Samba Team

