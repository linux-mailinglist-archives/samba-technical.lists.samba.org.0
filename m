Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 00904797124
	for <lists+samba-technical@lfdr.de>; Thu,  7 Sep 2023 11:11:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=g+J+zZlXtg1JRlEaVkMXkia7X4Zsbks/kBbHunA7sXE=; b=W8wEqfiUjHggtp2WXIzVFlohzU
	J+QEyEiUeQ2Ly1vB/WERgrpiZskZJqYqrbCPTi4BCwGwivpevDmFP3dPZ0MPAWmcZUgFgnxvdXWz3
	QssPnJjWsshjkYabOC2wk5yjJM2cHM+Lt0h0g/YMg11tZ9kF8ppPTbD2qTrfHjfrdxfV09boLRMkX
	v2gfzN266h+jef00A7Wg+kkgQxsy2SYg7CAJ2vYw+av/5U3/+9S3YqT4xDFfHogyVsCi+n9ogF89R
	jwXsqPtBfwbPKnZY3+SKbbftI9HAZWn53RDy6lqg0d65R0A6ixDySo2KByJIimEOX1sD+aE5xwpUR
	5xmBuhCw==;
Received: from ip6-localhost ([::1]:63366 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1qeB2G-001Ymo-EE; Thu, 07 Sep 2023 09:10:48 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:43428) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1qeB20-001Ylq-JS; Thu, 07 Sep 2023 09:10:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=g+J+zZlXtg1JRlEaVkMXkia7X4Zsbks/kBbHunA7sXE=; b=yEnxUorc19yoSR8uXQQ4sY+eS0
 tzgVSA232FOMZE05HdhLdiIocEK82HHF/8JlWG17wR0QwHkcUpK0eLbSrA976h0Q2BOpUWQj43663
 u7QPtEVeqr4qzbSPXfaHQPMqBjoOAy147JXSESgDxDdeduvBZX2lt1HN4cDqx+ZgQnwmdEW2wwAWP
 33d1az2TmuEOmkHywA10ylBgfmhr+xLV7gPF4CNNrZmh2k02VIwFHXJJYyDaOBJys67Ck59VAVFcn
 taCNrXPImBkvcs9Sd1bnFuXdc1v3f3jbM1o4XgPqVfROwgc30AGTjidgbfI+gf0TnU4+2+YzE2bgB
 AnUehiw4CIH3srTXZBayGTqiDuSzoyYVuBoGLmYnBzDf+7Gx8ZQtcy7F6hSdQhEYhczS7S9BKnI6e
 8LS3wTuySrK0bTSlTqYPiOPbcRhrB3yD5wo8xaRRU/mM0ICw8xALvbQOW/1icXkGVQqHcySGGfbU2
 B0QL4Ld9++YW8ZYJRpJPcEkD;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1qeB1z-00CIhB-2i; Thu, 07 Sep 2023 09:10:31 +0000
Message-ID: <6b3b348b-f0a8-e3bf-633a-bec9a5110ae1@samba.org>
Date: Thu, 7 Sep 2023 11:10:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Content-Language: de-DE
To: samba-announce@lists.samba.org, samba@lists.samba.org,
 samba-technical@lists.samba.org
Subject: [Announce] Samba 4.17.11 Available for Download
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

This is the latest stable release of the Samba 4.17 release series.


Changes since 4.17.10
---------------------

o  Jeremy Allison <jra@samba.org>
    * BUG 15419: Weird filename can cause assert to fail in
      openat_pathref_fsp_nosymlink().
    * BUG 15420: reply_sesssetup_and_X() can dereference uninitialized tmp
      pointer.
    * BUG 15430: Missing return in reply_exit_done().
    * BUG 15432: TREE_CONNECT without SETUP causes smbd to use uninitialized
      pointer.

o  Andrew Bartlett <abartlet@samba.org>
    * BUG 15401: Improve GetNChanges to address some (but not all "Azure AD
      Connect") syncronisation tool looping during the initial user sync 
phase.
    * BUG 15407: Samba replication logs show (null) DN.
    * BUG 9959: Windows client join fails if a second container 
CN=System exists
     somewhere.

o  Ralph Boehme <slow@samba.org>
    * BUG 15342: Spotlight sometimes returns no results on latest macOS.
    * BUG 15417: Renaming results in NT_STATUS_SHARING_VIOLATION if 
previously
      attempted to remove the destination.
    * BUG 15427: Spotlight results return wrong date in result list.
    * BUG 15463: macOS mdfind returns only 50 results.

o  Volker Lendecke <vl@samba.org>
    * BUG 15346: 2-3min delays at reconnect with 
smb2_validate_sequence_number:
      bad message_id 2.

o  Stefan Metzmacher <metze@samba.org>
    * BUG 15346: 2-3min delays at reconnect with 
smb2_validate_sequence_number:
      bad message_id 2.
    * BUG 15441: samba-tool ntacl get segfault if aio_pthread appended.
    * BUG 15446: DCERPC_PKT_CO_CANCEL and DCERPC_PKT_ORPHANED can't be 
parsed.

o  MikeLiu <mikeliu@qnap.com>
    * BUG 15453: File doesn't show when user doesn't have permission if
      aio_pthread is loaded.

o  Noel Power <noel.power@suse.com>
    * BUG 15384: net ads lookup (with unspecified realm) fails
    * BUG 15435: Regression DFS not working with widelinks = true.

o  Arvid Requate <requate@univention.de>
    * BUG 9959: Windows client join fails if a second container 
CN=System exists
     somewhere.

o  Martin Schwenke <mschwenke@ddn.com>
    * BUG 15451: ctdb_killtcp fails to work with --enable-pcap and libpcap ≥
      1.9.1.

o  Jones Syue <jonessyue@qnap.com>
    * BUG 15441: samba-tool ntacl get segfault if aio_pthread appended.
    * BUG 15449: mdssvc: Do an early talloc_free() in _mdssvc_open().


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

         https://www.samba.org/samba/history/samba-4.17.11.html

Our Code, Our Bugs, Our Responsibility.
(https://bugzilla.samba.org/)

                         --Enjoy
                         The Samba Team

