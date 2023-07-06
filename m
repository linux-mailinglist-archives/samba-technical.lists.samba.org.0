Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B8E6749E98
	for <lists+samba-technical@lfdr.de>; Thu,  6 Jul 2023 16:07:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=Y0euIuOVnXAwScteRW6Qx/ST1UOR0tFuQNOOZrQrIIY=; b=pH03Zuf6RnaaL7+lrMBx9X2qPH
	7dE1hMAk6kuRpNQP6eo8HSJKh8HRp4GYdXXaQxY2XYmf4QfiVjmxzjX7+3nEf2mHP+4P9w7S71i7M
	BZhtGR4KLIcPUkrkC8hPnH5Fap1M96gnpINoljv/o9v7Y4/lHlwLXBVDmdCx6fA6cc/AR+5+W5int
	ixQVOvlKV2s8jgqvubuzTp20hdhWmMzRTTbepnYsZl3HgoSgMogio+xsYQQ4jBxEiJgRhoShR6kZQ
	Z9LM91fkvFKs+dkxxO16ByaDYoFxfMRG623PXDUC3hDeoh32RQMjNtMXhYNdxkCHAZLgqiT7Puj2X
	HiXS9nTw==;
Received: from ip6-localhost ([::1]:27030 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1qHPcq-000Y20-M4; Thu, 06 Jul 2023 14:06:28 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:22684) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1qHPcf-000Y14-MA; Thu, 06 Jul 2023 14:06:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=Y0euIuOVnXAwScteRW6Qx/ST1UOR0tFuQNOOZrQrIIY=; b=lrzmOi9Qb5AhadexL/X8GtEYvI
 w7v0m4Lar5Znt8p23HqSK+UlUa1Wm6JMCNo9fBvHiLLZkIgfB/W3tygw4wm27yRC7tLb2mMh4RhnR
 Gnsb51bdDHUscSzAThhY6h6l3yJNgqR5qo/5+5z4jEiT7gwIxSHTqoOdQqssQWuq7TjYWowI3nU4b
 9e/npWF8a/DQPA6ZEV4RrtkPVQ9qmC6IcnaQlaHHB3pgaX9vUJPWhS53B0S2VD65QVTGZfZ1AULt7
 co6QmLlIicAnmJzIN+Xj7/d6JhqLpVPzUU8cYyfMTymPz7Yj2bCgmL7ypS2A4FiqaecrrE64S/bxW
 YCA2djkjRRjrBDy6hiWcTtx52dOWAOlLAJN5MurOoq6+q8T1JwSEmJ/+/4Pf1SgfNCNlnafiC5pRL
 mqUFUoSxZHPnhC8qiCtII8hAWZXkS+cOHFgv7VcpJqvGsSTg/vjEYEP83KY091Kt7RhH58T54MJOx
 zzyGzG59HQlfvHRS7HjfHANS;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1qHPce-000SwP-2z; Thu, 06 Jul 2023 14:06:16 +0000
Message-ID: <b20c6072-4856-fa9c-7290-53bcd83cb6af@samba.org>
Date: Thu, 6 Jul 2023 16:06:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: de-DE, en-US
To: samba-announce@lists.samba.org, samba@lists.samba.org,
 samba-technical@lists.samba.org
Subject: [Announce] Samba 4.17.9 Available for Download
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


Changes since 4.17.8
--------------------

o  Douglas Bagnall <douglas.bagnall@catalyst.net.nz>
    * BUG 15404: Backport --pidl-developer fixes.

o  Ralph Boehme <slow@samba.org>
    * BUG 15275: smbd_scavenger crashes when service smbd is stopped.
    * BUG 15378: vfs_fruit might cause a failing open for delete.

o  Samuel Cabrero <scabrero@samba.org>
    * BUG 14030: named crashes on DLZ zone update.

o  Volker Lendecke <vl@samba.org>
    * BUG 15361: winbind recurses into itself via rpcd_lsad.
    * BUG 15382: cli_list loops 100% CPU against pre-lanman2 servers.
    * BUG 15391: smbclient leaks fds with showacls.

o  Stefan Metzmacher <metze@samba.org>
    * BUG 15374: aes256 smb3 encryption algorithms are not allowed in
      smb3_sid_parse().
    * BUG 15413: winbindd gets stuck on NT_STATUS_RPC_SEC_PKG_ERROR.

o  Jones Syue <jonessyue@qnap.com>
    * BUG 15403: smbget memory leak if failed to download files recursively.


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

         https://www.samba.org/samba/history/samba-4.17.9.html

Our Code, Our Bugs, Our Responsibility.
(https://bugzilla.samba.org/)

                         --Enjoy
                         The Samba Team


