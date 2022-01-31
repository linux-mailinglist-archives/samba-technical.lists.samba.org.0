Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CED54A47B9
	for <lists+samba-technical@lfdr.de>; Mon, 31 Jan 2022 14:05:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=WvuhKkyzNrrw94quaI7JhV4i87grPxUOjAI9nNWKxqc=; b=H4uSg3VcinDO8p0uyniLTkB1C+
	LWSG+cuZvjoHRMiwhUhijtzJ8HrAuM79RVmxWuqNfJV/Pxjd8sjFeIy3hB48npFJRNCUoaiWmDWGg
	NFWrwGAd+JTF0FxY09fREX7DQC+Nr9gwrGhqKwJoOZ3fsh6I6heuXwdDrRMpldtqfwmWkcV098RIt
	e3WdSpvhrYcNj0bF7/P1H86s4Rm/yP3LO6x1bySNQ337WREatVJ6J/GA9S3588f3rWB73W9orbikh
	XB0H24dV0dlXNS1KShE1eIp7MBm8y/0ahJ6IiHJl21U3AOiHIBik/UnmSsM8zavEBUjuM00whxS0k
	p6WrZg3A==;
Received: from ip6-localhost ([::1]:56560 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nEWMX-002fW0-Mq; Mon, 31 Jan 2022 13:04:53 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:48566) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nEWMK-002fV3-PZ; Mon, 31 Jan 2022 13:04:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=To:From:Date:Message-ID:CC;
 bh=WvuhKkyzNrrw94quaI7JhV4i87grPxUOjAI9nNWKxqc=; b=kjhs6VbhYGt+KH/C7C8qZxWieT
 5wdu+Db6dahYdlmRRvsgORXr+Dxb4Qxt29/Nbd+zdPL8N/B1amA9dUl4GApopTc0lf9H+zwv6BPM9
 eg7k10EW+ePuCauZtMVTnHT2Bn/aXQfYhvnGwoe27ObP+LbJhG/WJkADjdfvtTzh6IMR5Cc2SUd9+
 8E1RQvormeQvQKOoJmw5pzue9r0Rc/Gvk7lkOjGBiLMxwx2ZY7anl/MFaMxe2ZCS2ZHaUfR6Vk3tD
 uRNSo4ijrSEdXEL8q/XEcdS6nPbKWp5ARBrXAlZIPW32Yy1jBT0IifS6stwQYBHAfyJ6qmwNKDgEX
 2T2eFCYG63US2QZyzeG6sn+fRNzCOkaSJ9hUSdsnd1DzfZuiYawJmyMpExnTs2qgVsIDfY1ya4v+c
 DLtZFoTzwJSjT3pI97gBNTWZIlxDMFQ/XIRwWGNOJKQSO7IgKyBCDMm/Xe4RWY28M1zxQQtMbQ21A
 gd9b+pch/alYmgQZrdo5qzYR;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1nEWMJ-001W1L-VV; Mon, 31 Jan 2022 13:04:40 +0000
Message-ID: <03e7e46f-ec16-b06c-ba75-f3a65fd1ef55@samba.org>
Date: Mon, 31 Jan 2022 14:04:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: de-DE
Subject: [Announce] Samba 4.15.5, 4.14.12, 4.13.17 Security Releases are
 available for Download
To: samba-announce@lists.samba.org, samba@lists.samba.org,
 samba-technical@lists.samba.org
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

These are security releases in order to address the following defects:

o CVE-2021-44141: UNIX extensions in SMB1 disclose whether the outside 
target
                   of a symlink exists.
https://www.samba.org/samba/security/CVE-2021-44141.html

o CVE-2021-44142: Out-of-Bound Read/Write on Samba vfs_fruit module.
https://www.samba.org/samba/security/CVE-2021-44142.html

o CVE-2022-0336:  Re-adding an SPN skips subsequent SPN conflict checks.
https://www.samba.org/samba/security/CVE-2022-0336.html


Changes
-------

o  Jeremy Allison <jra@samba.org>
    * BUG 14911: CVE-2021-44141

o  Ralph Boehme <slow@samba.org>
    * BUG 14914: CVE-2021-44142

o  Joseph Sutton <josephsutton@catalyst.net.nz>
    * BUG 14950: CVE-2022-0336


#######################################
Reporting bugs & Development Discussion
#######################################

Please discuss this release on the samba-technical mailing list or by
joining the #samba-technical IRC channel on irc.libera.chat or the
#samba-technical:matrix.org matrix channel.

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

         https://www.samba.org/samba/history/samba-4.15.5.html
         https://www.samba.org/samba/history/samba-4.14.12.html
https://www.samba.org/samba/history/samba-4.13.17.html

Our Code, Our Bugs, Our Responsibility.
(https://bugzilla.samba.org/)

                         --Enjoy
                         The Samba Team

