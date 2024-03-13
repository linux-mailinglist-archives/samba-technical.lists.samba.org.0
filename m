Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E6E2F87AAEA
	for <lists+samba-technical@lfdr.de>; Wed, 13 Mar 2024 17:07:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=s51r1yGfm8unm6GGhVRp15sPw8F4Y60vFqxj5EEZAGE=; b=QUYBaLpLPOxGlx/UxObUDZkT+F
	WbpJiRKhEWfzjJGqJxDhuU9bMGqGky47cnI/WcC2eZBohZhLOt3w95hQiQ1SaVCnNHd4UUSPKW1o3
	W9sogWlsEoc5N0Zu4rohC0KGGCaGSwO647G2m0vrMOE8QLfulyo1rHPKTYLBjfXzRnbPM1NDDMO6H
	RL7wQrm/2Qx6w98BieFpAG6uR/K80F8T1CCbxULhCaFwymOmgfczlFAVx1hQ7Bf6iK7H3BR8GC0Wv
	x5EKT6b2FcwjHQqF9Lz7rqAQMDLjxavqwwHDg9xfaAkA2/JqkJP/EEX76UeN/SVWalV7h94fkxtms
	kUYky9dw==;
Received: from ip6-localhost ([::1]:54220 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1rkR8O-000ILq-PN; Wed, 13 Mar 2024 16:07:17 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:28800) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rkR8E-000IL8-P6; Wed, 13 Mar 2024 16:07:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=s51r1yGfm8unm6GGhVRp15sPw8F4Y60vFqxj5EEZAGE=; b=l7liz8EbZ0ee2IuccgncmeycYc
 5jEsAG+fOPf/YG4/j4UVRj2KA33qz7jeq9tKem2enOF41URjl7hOq1KQrMt5nZxMHoaiC8O4RApk5
 Wwi0trTzwvyVDIZyQX1yjS75vzIGUlkhIOz/FZ/zDJJKqRMiETI1FiTSqp7H8xfcYiGhW+X51N+3U
 wbBA7aAOIqSj5kIWrE0aUBHl/S7XYT6VxA3QuM4UA942OHFtYKttt3cmyB/+OgKDxSEwPnqLM2r5f
 vIqSmQtWnxQ9qQ5CfLQk6p1r+JPk2H/lU02I5Co1DS9fVBGIXqKyTf72em0GjL8UdA5idFXGY5sqn
 doe+bK7KgtiQ+Z4afOyAyPJlUdsIN4KuDRtP/VL5Lq2TUQE1ua8Rns2wMmQOk8W7YVLS2lxMyazem
 kePWCPUOrWN1dzb5bgYgEm0mQFy5ETQSITiE1+AY2Z7icTuSfZamnmpJ20s9HJdIvKXtgbzjCXDHr
 FpMeXi7H/2m+oYwM+Uz7usPc;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rkR85-000hxm-0y; Wed, 13 Mar 2024 16:06:57 +0000
Message-ID: <d4deb33b-c78d-4be7-a6c8-1ae9654fdcd5@samba.org>
Date: Wed, 13 Mar 2024 17:06:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: de-DE
To: samba-announce@lists.samba.org, samba@lists.samba.org,
 samba-technical@lists.samba.org
Subject: [Announce] Samba 4.18.11 Available for Download
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

This is the latest stable release of the Samba 4.18 release series.
There will be security releases only beyond this point.


Changes since 4.18.10
---------------------

o  Martin Schwenke <mschwenke@ddn.com>
    * BUG 15580: Packet marshalling push support missing for
      CTDB_CONTROL_TCP_CLIENT_DISCONNECTED and
      CTDB_CONTROL_TCP_CLIENT_PASSED


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

         https://www.samba.org/samba/history/samba-4.18.11.html

Our Code, Our Bugs, Our Responsibility.
(https://bugzilla.samba.org/)

                         --Enjoy
                         The Samba Team

