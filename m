Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E058952E2D
	for <lists+samba-technical@lfdr.de>; Thu, 15 Aug 2024 14:18:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=XX/MereiGBqi6CBzUDT8aW0/AacbcS4khTwSZNyHlEk=; b=aipiEB/gmK0f+PXmfCCKcR/OfJ
	BH4Qx2mE142goBTe/64vxaQBqrvSmjULi4eUVy/TyqLyaREsfamJh50J+TiE/gD7KhyihELxRERfn
	J0qvu+/SpilsAVxgp18gnnz45kAjWOuet356JDHYM4cVkblT4DULujcUHmiNSBacr5IDMdKv4eBtt
	hJ3uD0jCq1dNG/23YknAODVv4UY+g3fu4pPYfqTDtAzQgwBdR7Xv1X9smiQpg436Xg+v636ppu720
	7eZdBBqvwUkshCPVCO/8oanPBWhjPYr1dDjnQXt9CCHQcyQJZXFG2JQwzFpyFKzC85IeOt3CB8Xth
	FZPJ2OZQ==;
Received: from ip6-localhost ([::1]:62952 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1seZQs-004g4z-2B; Thu, 15 Aug 2024 12:18:22 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:23844) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1seZQk-004g4J-9m; Thu, 15 Aug 2024 12:18:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=XX/MereiGBqi6CBzUDT8aW0/AacbcS4khTwSZNyHlEk=; b=y2aLPZ+yte6NGF1ApCGogDFJn0
 NLnQt1ACD5LOJi0R4Hsg1Br/LausY9Gd1PYAo/DVSGsQdsIM3ZS5AHuCshsXTfPWCaA3zbQxNbD0T
 xEh6L6rzG6F0VSLwSn5dDOt5AZ3Vw4GTKVTXSuYzjlIoyGdriurbm15UwNQVOAB7o8ZD8UvdiS4m8
 kp+CQN0AOSI1TeoKi3o3lB8tv9ZHJfJnQee76kGjsDTW8U28BWtYTKUewtDMY3kJr2I23xsy4ULmK
 zKjuX2gg8VmaR8e+YOC79/ityDrLjuZZxkjGUWC4TVRIeDnCeqlq2wqvudnAIp62PJywc9Ratc86E
 yU42ydYX6gDNYpRndxea7Hdji4tRRtIZlRwegqx+Xacv9EfPJmCNm2Azasl/VDDZzRYz/uMpBeAwG
 kHC2KFAiYfN4uitsO4Fn3X7bxV1wrXl2tge5+a86VH2zMR1CHA4/1KYvCq90QP6Xot4QPd+Y5mnzm
 oYwgIC2j4cfLDgNpF5Lp+C6/;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1seZQk-006YS2-04; Thu, 15 Aug 2024 12:18:14 +0000
Message-ID: <2ef02462-ce30-4236-a530-653afc107b38@samba.org>
Date: Thu, 15 Aug 2024 14:18:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: de-DE
To: samba-announce@lists.samba.org, samba@lists.samba.org,
 samba-technical@lists.samba.org
Subject: [Announce] Samba 4.19.8 Available for Download
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


Changes since 4.19.7
--------------------

o  Douglas Bagnall <douglas.bagnall@catalyst.net.nz>
    * BUG 15671: Invalid client warning about command line passwords.
    * BUG 15672: Version string is truncated in manpages.
    * BUG 15673: --version-* options are still not ergonomic, and they 
reject
      tilde characters.
    * BUG 15674: cmdline_burn does not always burn secrets.
    * BUG 15685: Samba doesn't parse SDDL found in 
defaultSecurityDescriptor in
      AD_DS_Classes_Windows_Server_v1903.ldf.

o  Andrew Bartlett <abartlet@samba.org>
    * BUG 15654: We have added new options --vendor-name and --vendor-patch-
      revision arguments to ./configure to allow distributions and 
packagers to
      put their name in the Samba version string so that when debugging 
Samba the
      source of the binary is obvious.
    * BUG 15655: When claims enabled with heimdal kerberos, unable to 
log on to a
      Windows computer when user account need to change their own
      password.

o  Ralph Boehme <slow@samba.org>
    * BUG 15676: Fix clock skew error message and memory cache clock skew
      recovery.

o  Günther Deschner <gd@samba.org>
    * BUG 15665: CTDB RADOS mutex helper misses namespace support.

o  Pavel Filipenský <pfilipensky@samba.org>
    * BUG 15660: The images don't build after the git security release 
and CentOS
      8 Stream is EOL.

o  Xavi Hernandez <xhernandez@redhat.com>
    * BUG 15678: Fix unnecessary delays in CTDB while processing 
requests under
      high load.

o  Stefan Metzmacher <metze@samba.org>
    * BUG 13019: Dynamic DNS updates with the internal DNS are not working.
    * BUG 15620: s4:nbt_server: does not provide unexpected handling, so 
winbindd
      can't use nmb requests instead cldap.
    * BUG 15660: The images don't build after the git security release 
and CentOS
      8 Stream is EOL.
    * BUG 15664: Panic in vfs_offload_token_db_fetch_fsp().
    * BUG 15666: "client use kerberos" and --use-kerberos is ignored for the
      machine account.

o  Noel Power <noel.power@suse.com>
    * BUG 15435: Regression DFS not working with widelinks = true.

o  Andreas Schneider <asn@samba.org>
    * BUG 15660: The images don't build after the git security release 
and CentOS
      8 Stream is EOL.
    * BUG 15673: --version-* options are still not ergonomic, and they 
reject
      tilde characters.

o  Jo Sutton <josutton@catalyst.net.nz>
    * BUG 15655: When claims enabled with heimdal kerberos, unable to 
log on to a
      Windows computer when user account need to change their own
      password.

o  Joseph Sutton <josephsutton@catalyst.net.nz>
    * BUG 15655: When claims enabled with heimdal kerberos, unable to 
log on to a
      Windows computer when user account need to change their own
      password.

o  Jones Syue <jonessyue@qnap.com>
    * BUG 15677: ntlm_auth make logs more consistent with length check.


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

         https://www.samba.org/samba/history/samba-4.19.8.html

Our Code, Our Bugs, Our Responsibility.
(https://bugzilla.samba.org/)

                         --Enjoy
                         The Samba Team

