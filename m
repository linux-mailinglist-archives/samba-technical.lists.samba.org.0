Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 52AC49A21FA
	for <lists+samba-technical@lfdr.de>; Thu, 17 Oct 2024 14:16:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=mmqgQKb2awtM26oGcxUChLt4RMp69iLKn5gWuBgTyCs=; b=D0vITuqiZtT6tiEfQ1Rin7wYXg
	4J6keM2G8HvD6OVLjmH87b70jqQJAEemv/FVfnpEEux0t+A02ipW3KQrsbcvQyEBn8qdBGI3wTVIk
	5iosNVyYf3r80U539P9eaiLIXZg1NTOn0B/wzZ4Rv2G4Nu+ru0K1OiGaLMtWrD/XW9Eb3ZiGfcnUT
	kcdesysSfuhUBIHyOzpruNawew4CEGAIuIhQPBTMh8zKEuogTmFd4THsL3iTNV19+fUxP+02ug6bV
	yBt0u+xTIPkdXBGm7W8nA8bUkFDpazc7eVwbiWJC2mPoAx6HgClFgu0WwJARbboQkAr6sp6GeuCzr
	+rce0oJw==;
Received: from ip6-localhost ([::1]:56438 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1t1PQP-004DjJ-JQ; Thu, 17 Oct 2024 12:16:17 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:13836) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1t1PQF-004Dic-N4; Thu, 17 Oct 2024 12:16:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=mmqgQKb2awtM26oGcxUChLt4RMp69iLKn5gWuBgTyCs=; b=kqQuAofBJa00q0Ufndcqq1QVe4
 PuHT3ULJTq/szXqXtbwT8MeawzyxFtqGI15vicJNzmxkezRTdNFmDnVYHA1SHxorFFzFSX1NC5NyR
 AHRganEFttXloQZ9kTkEQRul7M6BBU3sgKBKf7EeoOJ5Bn2lqcbkeklV4pnfDOazxgGwaNqgTJ+qU
 +OSBbLAJiTuecxv5/UprUTc3YrT7sSxNcCRctPJzWdHtxpe/9SIh2Cgfh5TA1UA2N5UWaGmtcBF9f
 WPcFxL9maJT5dAcHZ2GGqT11btnF4zE2kmyICIfdHLypK5WDZRisI0aewJzZ2BGenGlRA4doOq6Ne
 D/iEb7IA3bMXI4VKAEiZFPZ7T++hrjMiQIglp69la3ojEx5aQEuUjyahJ8t6J3pyYNfW1AkCKFFx5
 VantVQVSVS5w+76qVUF53fn/cxvzyFShdudU+qhCnbyJegmtYFhaBUXKzRWKoCfhtgWldjxE2pKz6
 f/upLhsjqmgn/Y0QporIaX+U;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1t1PQF-005Gib-0i; Thu, 17 Oct 2024 12:16:07 +0000
Message-ID: <97b4f1c9-f963-40f1-a27c-4bb2d59477e4@samba.org>
Date: Thu, 17 Oct 2024 14:16:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: de-DE
To: samba-announce@lists.samba.org, samba@lists.samba.org,
 samba-technical@lists.samba.org
Subject: [Announce] Samba 4.19.9 Available for Download
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

This is the latest stable release of the Samba 4.19 release series.


Changes since 4.19.8
--------------------

o  Douglas Bagnall <douglas.bagnall@catalyst.net.nz>
    * BUG 15590: libldb: performance issue with indexes (ldb 2.8.2 is 
already
      released).

o  Ralph Boehme <slow@samba.org>
    * BUG 15624: DH reconnect error handling can lead to stale sharemode 
entries.

o  David Disseldorp <ddiss@samba.org>
    * BUG 15699: Incorrect FSCTL_QUERY_ALLOCATED_RANGES response when 
truncated.

o  Stefan Metzmacher <metze@samba.org>
    * BUG 15280: irpc_destructor may crash during shutdown.
    * BUG 15624: DH reconnect error handling can lead to stale sharemode 
entries.
    * BUG 15696: Compound SMB2 requests don't return
      NT_STATUS_NETWORK_SESSION_EXPIRED for all requests, confuses
      MacOSX clients.

o  Shachar Sharon <ssharon@redhat.com>
    * BUG 15700: Crash when readlinkat fails.


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

         https://www.samba.org/samba/history/samba-4.19.9.html


If you are building/using ldb from a system library, you'll
also need the related updated ldb tarball, otherwise you can ignore it.
The uncompressed ldb tarballs have been signed using GnuPG (ID 
4793916113084025).
The ldb source code can be downloaded from:

https://download.samba.org/pub/ldb/ldb-2.8.2.tar.gz


Our Code, Our Bugs, Our Responsibility.
(https://bugzilla.samba.org/)

                         --Enjoy
                         The Samba Team


