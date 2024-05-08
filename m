Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A7F18BF851
	for <lists+samba-technical@lfdr.de>; Wed,  8 May 2024 10:18:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=MacAX+VO+LGa4569/huQWGFBeRVz/HPUfhvB7PjLU60=; b=Owraqfng031P3gjjBPeMt+ZNxW
	tYB0AQXas+TPl0TlQ6+jIPA/Cf5a5s0tOSElZpgEfcEDxO47zuVxjeHolqBzPhwT1wPMQKz50Z0tl
	xHsqXyFNmff62Lq+D4JA2sk0ASiejo3M8ElaErf5CjuznoE9Ik97IRgr0/q2q3po+n18NsAXu1Cgw
	WYN1NejUJjbYcq1rDFJMON0vRQqVE52Kx+58N9bdtY+8OWhfRQKYAVpuF64oLEoL3EudnUwrkcY0m
	PtIgmW+4okhqcRI/xhk1gl4YH8vJBhdm9CCqNu3bGEoCdg7iWFEBlVJtiwRMiGNvCjO0Bp3RBi8wZ
	+f6a7Big==;
Received: from ip6-localhost ([::1]:26470 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1s4cUt-008UJE-F8; Wed, 08 May 2024 08:17:55 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:30186) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1s4cUk-008UIX-CO; Wed, 08 May 2024 08:17:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=MacAX+VO+LGa4569/huQWGFBeRVz/HPUfhvB7PjLU60=; b=ibMPWFpGlxbtFpP6cJi1hZdiVO
 Mkagu6t6Fkrr1yLTOB/zA3RTP31sa/4mWyS0LpDoLKgi4jlvQCtS8fHGy/d6pxmwEGli+p55BUIN8
 bY0yl5TUcrqY8HYQRS6x2Q2nbn0ncTXJNyVbjRYeu6EWTBvvhFQW3mL2Fh5jD4vvaOcdzEw9IOgE0
 eX+UJY3x8J9yIzNLvWpGw7dVOZBvNkRQnPvJCTupLU28/CnSjtKN7aZyVnkJy5x+6iyVU7JkCKvBs
 LPXXGsZfjOH4HdOMl2uHLUmNWl2gU8oS55bin+QlOMNeq3akATyvwCU94yVymd7yRBBKstqBMm+G+
 Hn95zbD3PBc/QEmD3lz++hfps57kBp+sxHPPVwFg3B+J2RsAdSytuMdACIXZMRxrVKsXAegkdhUK0
 PjycylESNXDl8vH23E2Izk0cKVZsPDuoXmjImwEVWsesxlo62jpkQiil8xnIvdgCsrISfFxedFMdV
 URMn3FimG+dysQi+Fr/N5/h4;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1s4cUj-00AORP-2Y; Wed, 08 May 2024 08:17:45 +0000
Message-ID: <3fca632b-f1b4-4826-9411-29a75f318c11@samba.org>
Date: Wed, 8 May 2024 10:17:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: de-DE
To: samba-announce@lists.samba.org, samba@lists.samba.org,
 samba-technical@lists.samba.org
Subject: [Announce] Samba 4.20.1 Available for Download
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

This is the latest stable release of the Samba 4.20 release series.


Changes since 4.20.0
--------------------

o  Douglas Bagnall <douglas.bagnall@catalyst.net.nz>
    * BUG 15630: dns update debug message is too noisy.

o  Alexander Bokovoy <ab@samba.org>
    * BUG 15635: Do not fail PAC validation for RFC8009 checksums types.

o  Pavel Filipenský <pfilipensky@samba.org>
    * BUG 15605: Improve performance of lookup_groupmem() in idmap_ad.

o  Anna Popova <popova.anna235@gmail.com>
    * BUG 15636: Smbcacls incorrectly propagates inheritance with 
Inherit-Only
      flag.

o  Noel Power <noel.power@suse.com>
    * BUG 15611: http library doesn't support 'chunked transfer encoding'.

o  Andreas Schneider <asn@samba.org>
    * BUG 15600: Provide a systemd service file for the background queue 
daemon.


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

         https://www.samba.org/samba/history/samba-4.20.1.html

Our Code, Our Bugs, Our Responsibility.
(https://bugzilla.samba.org/)

                         --Enjoy
                         The Samba Team


