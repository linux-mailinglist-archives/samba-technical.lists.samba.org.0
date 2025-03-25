Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 3951FA70472
	for <lists+samba-technical@lfdr.de>; Tue, 25 Mar 2025 16:00:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=smnkGgemr8KXh5DH1FZQkhlm/sJrIHozQjjYHb0asOc=; b=4EnL9tliLkRA36J1Dc8N/rfsRD
	CmX0Tjt7sY4e+awRkfBJHxcadGy7Yx6eO1ugh4oC9ect03/TxA8x65kkYEuj+pYew/DcMNFet7Lab
	LElOvN/GmTIXQbpzwg3EHK6C0l8wpMQ+m4u09lbRC0LoVH0l4a6ZxkVztU1vPp9i8eI6SUr7zqdKl
	8aQGuPm2lRgq81uFe2e0SzEuKY/67CXojckHZY0LtMH3EgUQpT7LkL/NN0ZND+TkOWCIAIxWd0/Ec
	jxVir2lX/2IyvDdaNGX7Q9zOH1lMDlXibuPIu085llnbTYuH9cgCYPvWEf2DJkoK3EnQ3b4AQY6S/
	q8L1uGuw==;
Received: from ip6-localhost ([::1]:58742 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1tx5kj-00GpD9-2B; Tue, 25 Mar 2025 14:59:41 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:37856) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1tx5ka-00GpCS-UA; Tue, 25 Mar 2025 14:59:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=smnkGgemr8KXh5DH1FZQkhlm/sJrIHozQjjYHb0asOc=; b=G8txoANK4Ek8l52iDOGioyp1b0
 UoMrrwHPScrTH2UTul0G/rcgbyJPYkAx1hBhrvfHjZh0BZRmKbOVgwM8D0PQpbIYoU7y+zkm/F1st
 IRkqbi5wL5EnYokcptV3IbajcX4jQcIp3ELKy5CRIiOlPqpha5LOJsNN/Yt+F5wqwhBUxwTyNJlML
 lZDMyw3Kigf+eeY7qkKR6L0C1Sb0rv4DKoyn3UP498RB0u4u1eip0Ra4rueiTfyZ76epVaGfSw/Id
 2vRe6Tc8hH1JDSd/ArgUWwHgr/xfko691372wdSEIego5L6aY7Zgat0CnLZYhgi1cOIjKooA0eNZ2
 sB7vieAnecBwzC8tlnc3GO7fOXUyGep1dYe8EIC8vaJ3epMeR5EbiyJxfNlCy1lrzVDlXIyQts0yU
 fSvhbMl+JCwEFK4zC4N9cCtlEUcWdMTic8T4f4vDPagGk2QJgcMSqv+7Cd/9IPykjP10xpkCOQ8Ja
 /oySq6O0h95sKmJNpyIwU5u8;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1tx5kO-006epU-1T; Tue, 25 Mar 2025 14:59:20 +0000
Message-ID: <e3957a31-4413-4302-a5e8-117ff552944e@samba.org>
Date: Tue, 25 Mar 2025 15:59:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: de-DE
To: samba-announce@lists.samba.org, samba@lists.samba.org,
 samba-technical@lists.samba.org
Subject: [Announce] Samba 4.20.8 Available for Download
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

This is the latest stable release of the Samba 4.20 release series.


Changes since 4.20.7
--------------------

o  Jeremy Allison <jra@samba.org>
    * BUG 15782: winbindd shows memleak in kerberos_decode_pac.

o  Douglas Bagnall <douglas.bagnall@catalyst.net.nz>
    * BUG 15738: Creation of GPOs applicable to more than one group is 
impossible
      with Samba 4.20.0 and later.
    * BUG 15795: ldb index cache is too small on known large transactions
      (schemaupgrade, provision).

o  Ralph Boehme <slow@samba.org>
    * BUG 15151: vfs_gpfs silently garbles timestamps > year 2106.
    * BUG 15796: Spotlight search results don't show file size and 
creation date.

o  Guenther Deschner <gd@samba.org>
    * BUG 15703: General improvements for vfs_ceph_new module.

o  Andréas Leroux <aleroux@tranquil.it>
    * BUG 15795: ldb index cache is too small on known large transactions
      (schemaupgrade, provision).

o  Stefan Metzmacher <metze@samba.org>
    * BUG 14213: Windows Explorer crashes on S-1-22-* Unix-SIDs when 
accessing
      security tab.
    * BUG 15783: NETLOGON_NTLMV2_ENABLED is missing in the SamLogon* 
user_flags
      field.

o  Anoop C S <anoopcs@samba.org>
    * BUG 15703: General improvements for vfs_ceph_new module.
    * BUG 15797: Unable to connect to CephFS subvolume shares with
      vfs_shadow_copy2.

o  Martin Schwenke <mschwenke@ddn.com>
    * BUG 15820: Incorrect FSF address in ctdb pcp scripts.

o  Shachar Sharon <ssharon@redhat.com>
    * BUG 15703: General improvements for vfs_ceph_new module.

o  Shweta Sodani <ssodani@redhat.com>
    * BUG 15703: General improvements for vfs_ceph_new module.

o  Jo Sutton <josutton@catalyst.net.nz>
    * BUG 15634: unicodePwd cannot be modified over ldapi.

o  Andrea Venturoli <ml@netfence.it>
    * BUG 15804: "samba-tool domain backup offline" hangs.


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

         https://www.samba.org/samba/history/samba-4.20.8.html

Our Code, Our Bugs, Our Responsibility.
(https://bugzilla.samba.org/)

                         --Enjoy
                         The Samba Team

