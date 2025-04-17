Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AB36A92410
	for <lists+samba-technical@lfdr.de>; Thu, 17 Apr 2025 19:31:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=ceu91s9wwPgg3/e6kjJKu33O4qijsvI9wH8L+qDQVbs=; b=ykkxaqGs0Z4VJFxHhBLUGsBf9S
	D0u6wQ9SqsLpWzucu5XstovoFrnsaVEqgEAfatiScDEgQ+dtEz6xpIzMq2c7pmU6BoOU7ccPiOSol
	JykuRSFhx6xoQ5L6XpphNyhJRKljTZe5mFZcAeHmVsKJuZzl/DkECDbo2TWHVU8ZdG6sOW3NwRbMj
	q9lFzBEKyzJqkNrPlUMVZ+soa0br4BfEhNiVi8ga3TCuOCgFrfS1g4UTtqISdwTH1Yh2Klzm9YpTH
	OyMsQpXuzGj0KV+65zXKirH2d7SmnPDAMmgmioKbZnS3raiQzW+YKoLsMyjol7+aHB1rSxx6Qy+3f
	4ioRWPlQ==;
Received: from ip6-localhost ([::1]:41400 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1u5T4n-00092h-EI; Thu, 17 Apr 2025 17:31:01 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:34290) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1u5T4f-000920-4n; Thu, 17 Apr 2025 17:30:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=ceu91s9wwPgg3/e6kjJKu33O4qijsvI9wH8L+qDQVbs=; b=CGFfwXOc/WoORsjgVZcek9V2Q6
 GBbu4vWdnjrKJSRqhLt08wGyI3EKiCPYm4uPsERagMKlvB8Cr/UljIfsfjrsBpYlqDx8Vq58L2Xwa
 e87Ap4XYyHzuqZjPN5O17jwmzmj3A/H63JzC0wMbyCSXyg2Swy9B5otUuzl1tsu3NBTRvA4bIEyRN
 sE/7pn35ojqdvsdpcMxHgvKcFIYcAchnruAjpoyxFHDnrXP1oKjE27CFrL+7OwWGsq4zdlEah/B1p
 CxbRoafdwXtttybuIpDfXhZN770A+OP8gCgXQVTO9ZkoYRRsbt+S+r9dypZtVoWS4k8lf/rH3URUU
 CId3m77J7px97wxylhDSYIuT6lOJuOiOp1Qr750qmiUDvUXw8oKdujfJpsOiS6Achpdv8eTU9Kj3/
 gAuECKvSC8nSQlyBGxESAoWbP21m1HJ8Y85V2Mxh5XFHdR4t8yaxa00qcCW/0jyBxH7iGJn2pJdXs
 wQgQz3skUTJin+CLn/GurOEz;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1u5T4S-000OZT-1g; Thu, 17 Apr 2025 17:30:40 +0000
Message-ID: <76603547-77af-4fad-854a-2c46a83ccf16@samba.org>
Date: Thu, 17 Apr 2025 19:30:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: de-DE
To: samba-announce@lists.samba.org, samba@lists.samba.org,
 samba-technical@lists.samba.org
Subject: [Announce] Samba 4.22.1 Available for Download
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

This is the latest stable release of the Samba 4.22 release series.


Changes since 4.22.0
--------------------

o  Douglas Bagnall <douglas.bagnall@catalyst.net.nz>
    * BUG 15774: Running "gpo manage motd set" twice fails with backtrace.
    * BUG 15829: samba-tool gpo backup creates entity backups it can't read.
    * BUG 15839: gp_cert_auto_enroll_ext.py has problem unpacking GUIDs with
      prepended 0's.

o  Ralph Boehme <slow@samba.org>
    * BUG 15767: Deadlock between two smbd processes.
    * BUG 15823: Subnet based interfaces definition not listening on all 
covered
      IP addresses.
    * BUG 15836: PANIC: assert failed at source3/smbd/smb2_oplock.c(156):
      sconn->oplocks.exclusive_open>=0.

o  Pavel Filipenský <pfilipensky@samba.org>
    * BUG 15727: net ad join fails with "Failed to join domain: failed 
to create
      kerberos keytab".

o  Andreas Hasenack <andreas.hasenack@canonical.com>
    * BUG 15774: Running "gpo manage motd set" twice fails with backtrace.

o  Xavi Hernandez <xhernandez@redhat.com>
    * BUG 15822: Enable support for cephfs case insensitive behavior.

o  Volker Lendecke <vl@samba.org>
    * BUG 15791: Remove of file or directory not possible with vfs_acl_tdb.
    * BUG 15841: Wide link issue in samba 4.22.

o  Stefan Metzmacher <metze@samba.org>
    * BUG 15767: Deadlock between two smbd processes.
    * BUG 15845: NT_STATUS_INVALID_PARAMETER: Can't create folders on 
share of an
      exfat file system.
    * BUG 15849: Lease code is not endian-safe.

o  Anoop C S <anoopcs@samba.org>
    * BUG 15818: vfs_ceph_new module does not work with other modules for
      snapshot management.
    * BUG 15834: vfs_ceph_new: Add path based fallback for SMB_VFS_FCHOWN,
      SMB_VFS_FCHMOD and SMB_VFS_FNTIMES.

o  Shachar Sharon <ssharon@redhat.com>
    * BUG 15810: Add async io API from libcephfs to ceph_new VFS module.


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

         https://www.samba.org/samba/history/samba-4.22.1.html

Our Code, Our Bugs, Our Responsibility.
(https://bugzilla.samba.org/)

                         --Enjoy
                         The Samba Team

-- 
Jule Anger
Release Manager Samba Team  samba.org
SerNet Samba Team           sernet.de


