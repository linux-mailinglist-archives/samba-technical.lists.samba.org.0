Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B2E9414261
	for <lists+samba-technical@lfdr.de>; Wed, 22 Sep 2021 09:12:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=byJ3g6tDJtPaYlRovVYBPQsJGlXNfa+lagmMOlniRjA=; b=6DPRxYPcfmn7F8MwUHi7JfBfRt
	IFnTKaktM9QIqI8guD6KR1GDGz8A6NF4wRB1jpCYDvcawoQDzRfZwT+N2k6vyb211g8dtRwsXQRCv
	63sRZs1XSwtHeW/oBpoAlAF9zV3Y1epCnbgpR3zZVyyfagltjvJ8qf1eMSwVudESLQmZpff9jR0NG
	O0PDoKFClXgD3OnGCC/jq3Tk061UrV3KqtQJgW5adWaRo1SMy7KZjuw1VAVByBFAReXDFqB18vv08
	enwXLblHnZgebLph2p55boGphMyqCQGOD3/qPG92Blc8UQc21G5nySoFrbpjuBqcGJSxiItaxB/SK
	mzMw5fUA==;
Received: from ip6-localhost ([::1]:49576 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1mSwPz-00GOFa-2C; Wed, 22 Sep 2021 07:11:47 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:30526) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1mSwPp-00GOFE-HG; Wed, 22 Sep 2021 07:11:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=byJ3g6tDJtPaYlRovVYBPQsJGlXNfa+lagmMOlniRjA=; b=ecDMrU73hDm7xlWDbCM5m85xBm
 iILWx1qxevO3+9//OPdpGhTFjeHslU+VnNT3aJ5WTl8cI7aAYE4mEf5trl/ocDwNvM7OOG5WNThhV
 1ZJTAWtiwNAb6EI+IBnzJnxMOmB1PdtXO35anNGqaoGCKCssT5awPHhMMO6i2u9S3rEj7PuagOTf4
 n7DzEGBtCIdJSqzCHlGfH3JL5CMe2170uOOZU835gsLqDnzu+0xEbfj/qNDSfOjMx/3yEz4T9aaYi
 D05zvBhGFJtQ7FpzP+aX/9CVAUWc9ZKheYo6O659P9nmh5ipwyDFCL7LyWHC+a4+6AgyOpiBiN8GF
 8n6kDQpb/Rk4T4KgHEyY5Hmr8MIO8BAfq+PMBpEvTPJ6PFbCw2qMMjkP2oWotxpc/RaXR5ytw53AV
 C944GzydH2h4ILuQMhp/okU6dx55n+o1EpW21f3VSKw2j+55/MmAkKZZaaFk7fWHmYDzfXiMVzQ3D
 FCwbVEWzlc1pQxXSqfTJHKsV;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1mSwPo-007Hlo-Vj; Wed, 22 Sep 2021 07:11:37 +0000
To: samba-announce@lists.samba.org, samba@lists.samba.org,
 samba-technical@lists.samba.org
Subject: [Announce] Samba 4.13.12 Available for Download
Message-ID: <2f9c7876-18c0-0c7a-96b6-6993862df125@samba.org>
Date: Wed, 22 Sep 2021 09:11:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: de-DE
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

This is the latest stable release of the Samba 4.13 release series.


Changes since 4.13.11
---------------------

o  Andrew Bartlett <abartlet@samba.org>
    * BUG 14806: Address a signifcant performance regression in database 
access
      in the AD DC since Samba 4.12.
    * BUG 14807: Fix performance regression in 
lsa_LookupSids3/LookupNames4 since
      Samba 4.9 by using an explicit database handle cache.
    * BUG 14817: An unuthenticated user can crash the AD DC KDC by 
omitting the
      server name in a TGS-REQ.
    * BUG 14818: Address flapping samba_tool_drs_showrepl test.
    * BUG 14819: Address flapping dsdb_schema_attributes test.

o  Björn Baumbach <bb@sernet.de>
    * BUG 14817: An unuthenticated user can crash the AD DC KDC by 
omitting the
      server name in a TGS-REQ

o  Luke Howard <lukeh@padl.com>
    * BUG 14817: An unuthenticated user can crash the AD DC KDC by 
omitting the
      server name in a TGS-REQ.

o  Volker Lendecke <vl@samba.org>
    * BUG 14817: An unuthenticated user can crash the AD DC KDC by 
omitting the
      server name in a TGS-REQ.

o  Gary Lockyer <gary@catalyst.net.nz>
    * BUG 14817: An unuthenticated user can crash the AD DC KDC by 
omitting the
      server name in a TGS-REQ.

o  Stefan Metzmacher <metze@samba.org>
    * BUG 14817: An unuthenticated user can crash the AD DC KDC by 
omitting the
      server name in a TGS-REQ.

o  Andreas Schneider <asn@samba.org>
    * BUG 14817: An unuthenticated user can crash the AD DC KDC by 
omitting the
      server name in a TGS-REQ.

o  Martin Schwenke <martin@meltin.net>
    * BUG 14784: Fix CTDB flag/status update race conditions.

o  Joseph Sutton <josephsutton@catalyst.net.nz>
    * BUG 14817: An unuthenticated user can crash the AD DC KDC by 
omitting the
      server name in a TGS-REQ.


#######################################
Reporting bugs & Development Discussion
#######################################

Please discuss this release on the samba-technical mailing list or by
joining the #samba-technical IRC channel on irc.freenode.net.

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

         https://www.samba.org/samba/history/samba-4.13.12.html

Our Code, Our Bugs, Our Responsibility.
(https://bugzilla.samba.org/)

                         --Enjoy
                         The Samba Team

