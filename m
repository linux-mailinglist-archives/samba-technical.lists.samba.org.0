Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D5D39025DF
	for <lists+samba-technical@lfdr.de>; Mon, 10 Jun 2024 17:43:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=HNX2QlnP2Djb83iKRXVISxGyy+qE+FVTGm4KD75ZseY=; b=TpXEMYuwMNPcXzNscLEVMgv2IC
	U9R3Jxb6GstfCWYKBFnSsc2gaUc0SSf5UFFh77Le2vFrgSfr44UwkVFM8F1O7amM6/348CWt3eJGU
	HkuZOnkWFTuB1oUwAZ2B0TdfPGIh9P2WB9R/3XSkCjuXMiUvnHZslYjayFuLfIo7hYfoVxWyKICBX
	O08657yAq9flEJBgtBEMQib+9uQMKgb/nMhT/hXdUyimzBl1SE/e/DFmgv1NU/mpkAPey0gEknScm
	NPh9xIsyOYAlLq5p/fRmuSqf3fJWWNlPktl6KKUoWm6MgvcxD6QBtALYI5u2vaVJwh8KtC/lbmIz2
	dOsPu8Kg==;
Received: from ip6-localhost ([::1]:60210 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1sGhAX-00DNRB-6y; Mon, 10 Jun 2024 15:42:49 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:53556) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1sGhAN-00DNQS-Fh; Mon, 10 Jun 2024 15:42:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=HNX2QlnP2Djb83iKRXVISxGyy+qE+FVTGm4KD75ZseY=; b=3TjFPgQeIvpjE4lZ8wGMEFEFu7
 FWrlau2bQDrncj+Z498D9TwSV/0X0cnlKu68RZtadIew99tw+VYB1kCngdJar0Rk5hBVImbRxkVjP
 s/t2yd84HFtokDF7lqIsU+LOyQRI2yGBhiBvzIXicXtAG1C1d8oPE4OUwZA+XJM/evuZiN720d6j/
 h5zhZ559cqSjCSZf3PqFcLQ1iABXB13x0+ctxGupU3cv6GkTw3RaPg/mbSErXjqRez5bTyUmGWccp
 BPTA/cEeKBWWY+iIyjysj+9tRp9Yg46LeABsjV/w2ft1tYZr9dtpVGuXSqGjYgk8CWKMI3lgzC5n9
 u+HhwG9BaLu9mMIHasIGYhx7AfuIpbBOAhAcTA8tmsvhMIuG34IKgQm3pZOboaPlGRb42QMlvPjBh
 LOggZIBO/M42rL+BPZo/vdcl31PtEcUZIMXYqksplOYtqCbW6X6rV+m5oGCzAEC7DGWEOnI1USgER
 n5YCgRAE7xomUIc3ZWp2HI+1;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1sGhAN-00FzR4-01; Mon, 10 Jun 2024 15:42:39 +0000
Message-ID: <efc3606d-23f0-442c-a994-46fb374b7bc3@samba.org>
Date: Mon, 10 Jun 2024 17:42:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: de-DE
To: samba-announce@lists.samba.org, samba@lists.samba.org,
 samba-technical@lists.samba.org
Subject: [Announce] Samba 4.19.7 Available for Download
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


Changes since 4.19.6
--------------------

o  Douglas Bagnall <douglas.bagnall@catalyst.net.nz>
    * BUG 15569: ldb qsort might r/w out of bounds with an intransitive 
compare
      function (ldb 2.8.1 is already released).
    * BUG 15625: Many qsort() comparison functions are non-transitive, 
which can
      lead to out-of-bounds access in some circumstances (ldb 2.8.1 is 
already
      released).

o  Andrew Bartlett <abartlet@samba.org>
    * BUG 15638: Need to change gitlab-ci.yml tags in all branches to 
avoid CI
      bill.

o  Stefan Metzmacher <metze@samba.org>
    * BUG 14981: netr_LogonSamLogonEx returns NR_STATUS_ACCESS_DENIED with
      SysvolReady=0.
    * BUG 15412: Anonymous smb3 signing/encryption should be allowed 
(similar to
      Windows Server 2022).
    * BUG 15573: Panic in dreplsrv_op_pull_source_apply_changes_trigger.
    * BUG 15642: winbindd, net ads join and other things don't work on 
an ipv6
      only host.

o  Anna Popova <popova.anna235@gmail.com>
    * BUG 15636: Smbcacls incorrectly propagates inheritance with 
Inherit-Only
      flag.

o  Noel Power <noel.power@suse.com>
    * BUG 15611: http library doesn't support  'chunked transfer encoding'.


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

         https://www.samba.org/samba/history/samba-4.19.7.html


If you are building/using ldb from a system library, you'll
also need the related updated ldb tarball, otherwise you can ignore it.
The uncompressed ldb tarballs have been signed using GnuPG (ID 
4793916113084025).
The ldb source code can be downloaded from:


https://download.samba.org/pub/ldb/ldb-2.8.1.tar.gz


Our Code, Our Bugs, Our Responsibility.
(https://bugzilla.samba.org/)

                         --Enjoy
                         The Samba Team



