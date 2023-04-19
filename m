Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A03016E7779
	for <lists+samba-technical@lfdr.de>; Wed, 19 Apr 2023 12:33:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=JmTBerqrR23PrXodEbT9+L4wic24ZSjBdy2/hVjjMQA=; b=Pm58xNAG/Od9fgIasDH9MInGOR
	XdHiHeyy/4NI36rgdRP07p4BR0685t9YqtyZ04KhAGZPsP8Ktiryl6GxVoR9MmT1/tA26mrCVBp/X
	upHhvllRJBlpz/BSEvDSqIINcEas+leIJ/WgqB+5an3xu1+dCYYoQ917sS7861jB6pO9cltLFCFrM
	Aqx5/c8dk5pei1qTkI/GGZ1aEkkfsC7b8tnAr4q1e5Z0sCwZbMkGMGMWlEL8VRUMlSxEglb+2QV7R
	Gc13PGd3gHaL0fb42QRP0oYqyvf1kWx+KcUQi0J0xIjw1iInlMSM/bNqZRwMlV5LqMdkUb9FM8j4x
	nsc1wOqg==;
Received: from ip6-localhost ([::1]:61324 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pp57V-002hRz-Th; Wed, 19 Apr 2023 10:33:01 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:57376) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1pp57L-002hR1-4n; Wed, 19 Apr 2023 10:32:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=JmTBerqrR23PrXodEbT9+L4wic24ZSjBdy2/hVjjMQA=; b=INIo+dSglx3tY/e7G8pm3zIJXA
 YVgWpyLJh6UB7tTJ2IQQynDEmYMjvJZ15bOUhArdyXUOUh6EZmXxYPKKL3X+UOOAxvr8GICdlUOl5
 jaRASvAQMbj5xitwnj3MqKpxnodcZsZYSqiju5ifuDr5Lz3R/N02r1JRONt0zMrxGbdswx1yQgPrH
 WZsCCp/RWpcdNCLDMdKAaERjWJjrY6rfUgvRVm9rCaKCfZ3m2RLe5vEzGW8PoOwif74+4h/mVA2Gq
 Z2OtDZK5GKPpLqemELbLUsDkHe02RFT17uwI9PTKLZ++l7WShKz2gjU7CD/BSRxTvotNyzFB/DDHb
 HQer3P9ET6qUs3kLE6kFoDauecgY/KZkCtP7EidqoH+RRnx1idKAg01cq00EIw/r2vSh/cPakTvl/
 C6i0bmmgsFDRWursbT4j7lu21+F5uNOOjO91XU0l3LcIfjJ9ngxzlpOtI2phJTkic3pPq15Fm2IYl
 3K8AriapQg8JjbCcFGL0Z1Kb;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1pp57K-0020OH-Er; Wed, 19 Apr 2023 10:32:50 +0000
Message-ID: <5087dd7c-cf73-1aa1-6a3f-883bd9d9af23@samba.org>
Date: Wed, 19 Apr 2023 12:32:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: de-DE
To: samba-announce@lists.samba.org, samba@lists.samba.org,
 samba-technical@lists.samba.org
Subject: [Announce] Samba 4.18.2 Available for Download
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


Changes since 4.18.1
--------------------

o  Jeremy Allison <jra@samba.org>
    * BUG 15302: Log flood: smbd_calculate_access_mask_fsp: Access denied:
      message level should be lower.
    * BUG 15306: Floating point exception (FPE) via cli_pull_send at
      source3/libsmb/clireadwrite.c.

o  Andrew Bartlett <abartlet@samba.org>
    * BUG 15328: test_tstream_more_tcp_user_timeout_spin fails 
intermittently on
      Rackspace GitLab runners.
    * BUG 15329: Reduce flapping of ridalloc test.
    * BUG 15351: large_ldap test is unreliable.

o  Ralph Boehme <slow@samba.org>
    * BUG 15143: New filename parser doesn't check veto files smb.conf 
parameter.
    * BUG 15354: mdssvc may crash when initializing.

o  Volker Lendecke <vl@samba.org>
    * BUG 15313: large directory optimization broken for non-lcomp path 
elements.
    * BUG 15357: streams_depot fails to create streams.
    * BUG 15358: shadow_copy2 and streams_depot don't play well together.

o  Rob van der Linde <rob@catalyst.net.nz>
    * BUG 15316: Flapping tests in samba_tool_drs_show_repl.py.

o  Stefan Metzmacher <metze@samba.org>
    * BUG 15317: winbindd idmap child contacts the domain controller 
without a
      need.
    * BUG 15318: idmap_autorid may fail to map sids of trusted domains 
for the
      first time.
    * BUG 15319: idmap_hash doesn't use ID_TYPE_BOTH for reverse mappings.
    * BUG 15323: net ads search -P doesn't work against servers in other 
domains.
    * BUG 15353: Temporary smbXsrv_tcon_global.tdb can't be parsed.

o  Joseph Sutton <josephsutton@catalyst.net.nz>
    * BUG 15316: Flapping tests in samba_tool_drs_show_repl.py.
    * BUG 15343: Tests use depricated and removed methods like
      assertRegexpMatches.


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

         https://www.samba.org/samba/history/samba-4.18.2.html

Our Code, Our Bugs, Our Responsibility.
(https://bugzilla.samba.org/)

                         --Enjoy
                         The Samba Team


