Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 70569422804
	for <lists+samba-technical@lfdr.de>; Tue,  5 Oct 2021 15:35:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=gU5pImpvheWGuPZhdJD/6sZcJx/C9aH4RZEwB9LBO/s=; b=c1l6SkkIYjO+HQbumvYu1QxP1g
	clokoTkzhAx22kJzOkmD1HVgKNRHbO9Ycfs0zEf/g6RxkVI3PKodtNwNUI5yFxieFCaLENygnaYW5
	C4kO4LcLleVEPefV4KDtLStjdcDSRW/uF4TZkBM+ALsO9u8Wspm4WfM0mnB0LtA3ztTqIpUeKPAoT
	il30td/W/0lCPDVUnzvRKiUnnVPwtrNhyHDM9L5i2l4UWWzCLthhyPzW79HVGRQl9awLaelz7kbYe
	w+4Q3OEOVejjJlHZKsH4Yy0uR4MmcCxpGw8CnrsO26dAJYpzAHARiLpHvNHqs0zQupYP3mvtBJgLl
	0OXal8qA==;
Received: from ip6-localhost ([::1]:33002 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1mXkaT-0048OB-Uf; Tue, 05 Oct 2021 13:34:30 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:62650) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1mXkaN-0048Ns-UJ; Tue, 05 Oct 2021 13:34:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=gU5pImpvheWGuPZhdJD/6sZcJx/C9aH4RZEwB9LBO/s=; b=nPZrRAd17VFfBgJAEh6XHmfdWK
 GMXeWCs6MDdHvA2mJrYrIKCYkFOKl8w7lRvFShSuPjJ/MDXCpf9R/AN4q9tk3wCGSIOAegEsIMfgY
 gYeTkWM3DIzD19yoS8HB9Z0vVOSQ9Xf0ImaHPJUR2TKFnI/NFe6ddiLXLyXLyyuG/BMpeKSbFbgqC
 XtO6S4HrViOQYXVZmq1MRZrUcbPxb+zK+Y6OSKBjH1ScbKc9ZrRSKeLFXjGFaWqsBZME81YjoF4vv
 /oJ8jbXjAlopagnIDSYy/vdTXMOIi9QUeyU5U073kqR9dPU0i3qP/JAuCwpxGxVQo5sajTM+rV9QA
 lc/i+nPC8nxz4v9iHshgZOJhCOKMs2YYm9av/1TZpMzV0uZyIaWMdKFmeJ8++WgNESgWlXVlFR5cb
 USPcuYGBTN0WCKwwZq2axfob8zhVxrqNpf/u+V54n7WvZN5tTndzdATnr8Yubg5V6Qp9YVWxvGkGi
 0EMFtXp9K46IO/mnGhdmdE6t;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1mXkaN-001e6T-9w; Tue, 05 Oct 2021 13:34:23 +0000
To: samba-announce@lists.samba.org, samba@lists.samba.org,
 samba-technical@lists.samba.org
Subject: [Announce] Samba 4.14.8 Available for Download
Message-ID: <fccfb161-5af6-c978-fa23-938b68bd31be@samba.org>
Date: Tue, 5 Oct 2021 15:34:23 +0200
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

This is the latest stable release of the Samba 4.14 release series.


Changes since 4.14.7
--------------------

o  Jeremy Allison <jra@samba.org>
    * BUG 14742: Python ldb.msg_diff() memory handling failure.
    * BUG 14805: OpenDir() loses the correct errno return.
    * BUG 14809: Shares with variable substitutions cause core dump upon
      connection from MacOS Big Sur 11.5.2.
    * BUG 14816: Fix pathref open of a filesystem fifo in the DISABLE_OPATH
      build.

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
    * BUG 14841: Samba CI runs can now continue past the first error if
      AUTOBUILD_FAIL_IMMEDIATELY=0 is set.
    * BUG 14854: samldb_krbtgtnumber_available() looks for incorrect string.

o  Ralph Boehme <slow@samba.org>
    * BUG 14771: Some VFS operations on pathref (O_PATH) handles fail on 
GPFS.
    * BUG 14783: smbd "deadtime" parameter doesn't work anymore.
    * BUG 14787: net conf list crashes when run as normal user.
    * BUG 14790: vfs_btrfs compression support broken.
    * BUG 14804: winbindd can crash because idmap child state is not fully
      initialized.

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
    * BUG 14771: Some VFS operations on pathref (O_PATH) handles fail on 
GPFS.
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
    * BUG 14836: Python ldb.msg_diff() memory handling failure.


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

         https://www.samba.org/samba/history/samba-4.14.8.html

Our Code, Our Bugs, Our Responsibility.
(https://bugzilla.samba.org/)

                         --Enjoy
                         The Samba Team

