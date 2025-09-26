Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 115A4BA4051
	for <lists+samba-technical@lfdr.de>; Fri, 26 Sep 2025 16:03:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=kurXWYRF62+Viggxxcx9Iwgtte8V3H2sXtLj0aEnLkk=; b=zADD3rZOjvfKERS5KzH3S8lYK5
	wcmAxOpLZZlm2QZ2tddDK0sn3dtj2MPkO2sFNpc181FufShtc/4+49ylqUtfiUBOcZ23MPp0yJHHS
	0pUBQiz0L6OjYUW9dU3EqAiInbcP3y+Rzag57J+auFMDChMP9OTVk8IRos8hSTqflJBJ3tPRmfRrU
	xrp2SWcVYlU2JkunEVHSUWitjctPeR1yNhBRaliqzsJjagqwiiJPTuPUE3OgNZHBJOiKwmbReEnjj
	m2uqNLRX32uyu0V8WsbF1JkY3OU2K/DyHKklcFhZoYs58jm8UYYsWQT4yxMHZebgKHuSSQiuHjfGr
	RS+msCPg==;
Received: from ip6-localhost ([::1]:19408 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1v292n-004orw-Pz; Fri, 26 Sep 2025 14:03:29 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:61172) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1v292e-004oqb-B7; Fri, 26 Sep 2025 14:03:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=kurXWYRF62+Viggxxcx9Iwgtte8V3H2sXtLj0aEnLkk=; b=yueYVdH452WaDu1T2sr6hgJlmf
 tXJy0dOOTthorrMLufc5+WJA0uCKvt9ULN6U80GhgYOFiuEElSLPjVlA3v+7jb7QlPeEHIGyHhM7M
 5eDSm1Lia+/pL/XFQHro9VpXyCud3EHfPPJjNvd9yM+o0REYK7kieU95JBGwRgGEYXgHL5J8zaCbs
 PQU8PqXpOWeEois9WjRQILaJsEAlTOtNH9wfxRSTo8hlXjyeC/fuFxVqr2bRmycqRCq3aJxt+h3e7
 a2IvBA5RBlKB7Oo53SNQ2OWE/dl9ztipBb2ZVKeyibg7+C5GI0syiUPJzDhPj0nmoouB96hujVS+I
 ZzgjJJMD8uVPV+fRyetiBLscBaN91nKX/PM0VT1ou8mMEDWHIB0d8EkI4tXhL1esyA5udl+4alntv
 QoTdbu9vZibQ7qFqai2TKW46igia9i4X6HUAGrYj1okBYNL4RI1PZqxA4CiW3wS8h0XqQe2zqLgST
 K82j/T2Ses3OMnavx/CSGVkO;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1v292d-0068jo-2h; Fri, 26 Sep 2025 14:03:19 +0000
Message-ID: <ad710738-fd90-4611-8870-c5841f510741@samba.org>
Date: Fri, 26 Sep 2025 16:03:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: de-DE
To: samba-announce@lists.samba.org, samba@lists.samba.org,
 samba-technical@lists.samba.org
Subject: [Announce] Samba 4.23.1 Available for Download
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

This is the latest stable release of the Samba 4.23 release series.


Changes since 4.23.0
--------------------

o  Alexander Bokovoy <ab@samba.org>
    * BUG 15920: Incomplete bind configuration causes DLZ plugin to crash.

o  Volker Lendecke <vl@samba.org>
    * BUG 15914: winbind can crash at startup.

o  Anoop C S <anoopcs@samba.org>
    * BUG 15919: vfs_ceph_new should not use 
ceph_ll_nonblocking_readv_writev for
      fsync_send.

o  Andreas Schneider <asn@samba.org>
    * BUG 15904: CTDB does not support PCP 7.0.0.

o  Martin Schwenke <mschwenke@ddn.com>
    * BUG 15921: CTDB_SOCKET can be used even when CTDB_TEST_MODE is not 
set.

o  Shachar Sharon <ssharon@redhat.com>
    * BUG 15919: vfs_ceph_new should not use 
ceph_ll_nonblocking_readv_writev for
      fsync_send.


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

         https://www.samba.org/samba/history/samba-4.23.1.html

Our Code, Our Bugs, Our Responsibility.
(https://bugzilla.samba.org/)

                         --Enjoy
                         The Samba Team

