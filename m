Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FFF7604565
	for <lists+samba-technical@lfdr.de>; Wed, 19 Oct 2022 14:34:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=buePmKCEeOVZOViEyMb+uBQg4TWIfLVgNKMAO1qjpmo=; b=I5W38jjONWsQ1o3WoQFlMQOM1K
	Lpe9McRqCf21iU5gKAv8OEZ832tmAfLSYJKDRVNRJ5Z7vlDTw9oOdy6kxzw1gMlZNwwYCcrraWIuD
	Tm9Y0Qik+54e6CpyZWOD+yvk3pQZya9fExaUmRsdEIQvR+KHPnC02bjCo2EbdBbvBOwjxIpM4tPAN
	kUTo925QA3TxXTqEL2b6+x6/zZTB/Soch+TrAfSGutNPmUGIuk7n8ju7Sb1Jofla6ChfCYfuYULrM
	k/oqLT4rfhaDDB+wsmRgjexAVVE54wZMDymiRwFWurSXXkUSO5/HKM/pt9I745tKYvPb5dx9n5aC2
	E2WnxijA==;
Received: from ip6-localhost ([::1]:20626 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ol8HH-003XQq-9U; Wed, 19 Oct 2022 12:34:31 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:41284) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ol8H7-003XPs-1r; Wed, 19 Oct 2022 12:34:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=buePmKCEeOVZOViEyMb+uBQg4TWIfLVgNKMAO1qjpmo=; b=S5Tqdpq6j2ClVyH6D4gZ8V0nzD
 BlO24AVUHdTovUIo1a6x4pCX/PGlZPXwGafRTsKQk0NAMcs/xBqJN7hi+n4RmopwvfZL+IevSNL/K
 LIwuU3xVUlv8+3QCmEzFa9Bs5jZ6GhA8vhf+w+zYFAmuxUamN2zRY0cddRQ0coQuKWPUr3Dh0YnwJ
 kBbrVpASGzpNfg3r+dcXWyUqrZDDEEzrtUdK4ScNREUJFhbmls5+wHiRQo0XDyXYPvOyB+JiXGpe+
 hFpEszxOx0RtGiPLuQqjFAKqaY3Ha5QqRzKjWn/vqLd4bAvT2eqkB9S8ORl1OraDuUIik2o0qdJwl
 NZ+whj7JvNqNv0LEowj97xYdiML3t6frkpgIAmXzOW7KV8zN0NXZnJBDpVXcBV82nz5+fi4LA08MW
 tkYORu5wfaUgyTPPYbfq0xivoiY0N8fjpgnrvEVW+UzZ5NeVERr7SnTkaRzzSd3s6Dzu5RRymUw+n
 9mqnVMdfU8eFUIfnn+0pz7se;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1ol8H6-004sLy-H0; Wed, 19 Oct 2022 12:34:20 +0000
Message-ID: <4d449ae7-93bb-77a0-d3e6-529050f3907f@samba.org>
Date: Wed, 19 Oct 2022 14:34:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Content-Language: de-DE
To: samba-announce@lists.samba.org, samba@lists.samba.org,
 samba-technical@lists.samba.org
Subject: [Announce] Samba 4.17.1 Available for Download
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


Changes since 4.17.0
--------------------

o  Jeremy Allison <jra@samba.org>
    * BUG 14611: CVE-2021-20251 [SECURITY] Bad password count not 
incremented
      atomically.
    * BUG 15174: smbXsrv_connection_shutdown_send result leaked.
    * BUG 15182: Flush on a named stream never completes.
    * BUG 15195: Permission denied calling SMBC_getatr when file not exists.

o  Douglas Bagnall <douglas.bagnall@catalyst.net.nz>
    * BUG 15189: Samba 4.5 sometimes cannot be upgraded to Samba 4.6 or 
later
      over DRS: WERROR_DS_DRA_MISSING_PARENT due to faulty GET_ANC.
    * BUG 15191: pytest: add file removal helpers for TestCaseInTempDir.

o  Andrew Bartlett <abartlet@samba.org>
    * BUG 14611: CVE-2021-20251 [SECURITY] Bad password count not 
incremented
      atomically.
    * BUG 15189: Samba 4.5 sometimes cannot be upgraded to Samba 4.6 or 
later.
      over DRS: WERROR_DS_DRA_MISSING_PARENT due to faulty GET_ANC.

o  Ralph Boehme <slow@samba.org>
    * BUG 15182: Flush on a named stream never completes.

o  Volker Lendecke <vl@samba.org>
    * BUG 15151: vfs_gpfs silently garbles timestamps > year 2106.

o  Gary Lockyer <gary@catalyst.net.nz>
    * BUG 14611: CVE-2021-20251 [SECURITY] Bad password count not 
incremented
      atomically.

o  Stefan Metzmacher <metze@samba.org>
    * BUG 15200: multi-channel socket passing may hit a race if one of the
      involved processes already existed.
    * BUG 15201: memory leak on temporary of struct 
imessaging_post_state and
      struct tevent_immediate on struct imessaging_context (in
      rpcd_spoolss and maybe others).

o  Noel Power <noel.power@suse.com>
    * BUG 15205: Since popt1.19 various use after free errors using 
result of
      poptGetArg are now exposed.

o  Anoop C S <anoopcs@samba.org>
    * BUG 15192: Remove special case for O_CREAT in SMB_VFS_OPENAT from
      vfs_glusterfs.

o  Andreas Schneider <asn@samba.org>
    * BUG 15169: GETPWSID in memory cache grows indefinetly with each 
NTLM auth.

o  Joseph Sutton <josephsutton@catalyst.net.nz>
    * BUG 14611: CVE-2021-20251 [SECURITY] Bad password count not 
incremented
      atomically.


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

         https://www.samba.org/samba/history/samba-4.17.1.html

Our Code, Our Bugs, Our Responsibility.
(https://bugzilla.samba.org/)

                         --Enjoy
                         The Samba Team

