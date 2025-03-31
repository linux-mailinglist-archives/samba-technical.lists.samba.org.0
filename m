Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A55DA76936
	for <lists+samba-technical@lfdr.de>; Mon, 31 Mar 2025 17:05:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=2SHkW09+B8CMRg+2G5KGtKT2zNs6isBGndyEMo6bwPE=; b=Zg2e86YKGMXK1jQHBXdSGsPj8R
	/8eWgXWM2HJxlnCpDHFJMdcpnRur4rn5I2+NsNIgY7RmWKeBUbHGmU5acAsQRnQECz8s4RVktv0sN
	kK5+bvPe5qb1ZXSa1BaqCbPPnitQG3Hte7tfe8MTjGf0gL59+baSsfEulIEheNJSpQfav87EDyHq2
	Fzd+0uHmPByvnwcD6q7BOVuj2BqrEqh8nNv4l5+DaGZJvgjNz5j4JOeNm2bk48bmY9iP4825GwsG1
	GT2LYCS2TMneNaD8SL5UZO4Yzb32EfbR/hcU5Q6lAllwVbqup4KhsaFXPLUI33DJ3gJg4Qp5QBo6Q
	Kfy86Xmg==;
Received: from ip6-localhost ([::1]:37804 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1tzGhC-00HCt4-Mw; Mon, 31 Mar 2025 15:05:02 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:58136) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1tzGh3-00HCrz-Je; Mon, 31 Mar 2025 15:04:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=2SHkW09+B8CMRg+2G5KGtKT2zNs6isBGndyEMo6bwPE=; b=S+8ZFb4cKjqLJw8nQKW6sb5MPV
 7ohpHoxbUit3UO2iqhxGPGzLE2775x7CEs23P0vEMCxnPpJ60QJ9UpvlvbrHh/qJYxbPrSXR/nHdl
 ldkPdOJ/FxymrYJ45i8TYZUMcEHZcQpBMrunwyQsc6drxzikqx3HpMOoSLd/0aK08HlLZWw9lVKuh
 jSpA66cwkpzs9a17v3dejvZizo1srqGpaZqJUBGw04D+uWsKSItCNr04eOnjRYBcm2JxuMVjr02Jk
 cGOHAz/UTG5oBT7nYeskRi0iZct+n394PjRPEnIJhF3iY0IDTc3X5abVB2w8y0zjcEGhH1mviKoLR
 eP7Yiqa0e6NH7Rn+sCqcW70QJJqfqMkuO5WZji1NR6si66BaFlvt6+ADL08UZO8CIDF5+xAgMXAVz
 z4BxDrjBwToF7+95BQoPa7BlpPLq0aZjkEm7YPSPMzpLKXuUscYuzVrnjypFVdpqIV9xKArPxNadi
 PgM2ItS5hEArOJ1kBguFFvgd;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1tzGgr-007W21-06; Mon, 31 Mar 2025 15:04:41 +0000
Message-ID: <289c4143-7fac-4d93-8d5d-5d0ee8772af6@samba.org>
Date: Mon, 31 Mar 2025 17:04:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: de-DE
To: samba-announce@lists.samba.org, samba@lists.samba.org,
 samba-technical@lists.samba.org
Subject: [Announce] Samba 4.21.5 Available for Download
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

This is the latest stable release of the Samba 4.21 release series.


Changes since 4.21.4
--------------------

o  Douglas Bagnall <douglas.bagnall@catalyst.net.nz>
    * BUG 15795: ldb index cache is too small on known large transactions
      (schemaupgrade, provision).

o  Ralph Boehme <slow@samba.org>
    * BUG 15822: Enable support for cephfs case insensitive behavior.
    * BUG 15823: Subnet based interfaces definition not listening on all 
covered
      IP addresses.

o  Pavel Filipenský <pfilipensky@samba.org>
    * BUG 15727: net ad join fails with "Failed to join domain: failed 
to create
      kerberos keytab".

o  Xavi Hernandez <xhernandez@redhat.com>
    * BUG 15822: Enable support for cephfs case insensitive behavior.

o  Volker Lendecke <vl@samba.org>
    * BUG 15791: Remove of file or directory not possible with vfs_acl_tdb.

o  Andréas Leroux <aleroux@tranquil.it>
    * BUG 15795: ldb index cache is too small on known large transactions
      (schemaupgrade, provision).

o  Anoop C S <anoopcs@samba.org>
    * BUG 15797: Unable to connect to CephFS subvolume shares with
      vfs_shadow_copy2.
    * BUG 15810: Add async io API from libcephfs to ceph_new VFS module.
    * BUG 15818: vfs_ceph_new module does not work with other modules for
      snapshot management.
    * BUG 15822: Enable support for cephfs case insensitive behavior.
    * BUG 15834: vfs_ceph_new: Add path based fallback for SMB_VFS_FCHOWN,
      SMB_VFS_FCHMOD and SMB_VFS_FNTIMES.

o  Martin Schwenke <mschwenke@ddn.com>
    * BUG 15820: Incorrect FSF address in ctdb pcp scripts.

o  Shachar Sharon <ssharon@redhat.com>
    * BUG 15810: Add async io API from libcephfs to ceph_new VFS module.

o  Andrea Venturoli <ml@netfence.it>
    * BUG 15804: "samba-tool domain backup offline" hangs.


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

         https://www.samba.org/samba/history/samba-4.21.5.html

Our Code, Our Bugs, Our Responsibility.
(https://bugzilla.samba.org/)

                         --Enjoy
                         The Samba Team

