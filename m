Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 74762AFB8DF
	for <lists+samba-technical@lfdr.de>; Mon,  7 Jul 2025 18:44:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=+Oon4MQMu7Fl3y3Ma9nCYQ2ZryhRY8rNAcfdU2Fq7Pc=; b=Y3L/OfNIEdsTBMaQrwV7+1IHKC
	s3rkSafaYBtmoHrLXMcTnWgVth/71O+ZzLkdRKfhk3uEL9tnz3SIqGlx3yACUr8AjRV1dMcZkiSYE
	0jaz2Hi0Dwt3hA7dJvVE/mqnCusMTXB9fumCrKzNDTJ5fVr1wOTb5q701UC3ABZh+7pKDvgbUhEo+
	K50brzwH3zzeT40FoQRWRF1GBjvcotN+42nIgjS0mhKfrsr9/lMSodhjdJidPF1F1L/fC9T/SE7oG
	w0W/ByvG3kvblJ/g3uTj0cDAi12gsy+NKuBczi2gfqouJ8FWtfAB2c3XMlUmZCy/ZyKIcPin62CN+
	WrbJ5rPQ==;
Received: from ip6-localhost ([::1]:18046 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uYowz-00Akb2-97; Mon, 07 Jul 2025 16:44:17 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:48782) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uYowp-00AkaM-As; Mon, 07 Jul 2025 16:44:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=+Oon4MQMu7Fl3y3Ma9nCYQ2ZryhRY8rNAcfdU2Fq7Pc=; b=YvLK1Bn5b0DN04vYt9O+I7Fb9h
 nNBKKOcEQkQ2lRs/ayNUpQvB8VeYxTuVwZskD0qudCpt2f96X0yJ69G+0kS9X4Yl9eH8gUA6zMsUd
 d9gWVBOhytgsL3IOP3kX0ZyQVtyFDUqKRetg7WdrlbCIH+N7n1Hlf+i53cGQStB9G9xJmjb+KczEn
 ZUMcGm6rbfFptTjfuJr+ESoA+yoYDNIy0y8dJo7Ei2uYLsRwbHWtChlk+77nU/P7Jx4vjFFLyUKAD
 GWbQBfMmk0YmyMqP1/zOm7qG5mNBHJ9zK9ajKacEfGlHB2P0CCOTcWvIKgt0OgFE9s8HcEcw8ZjWJ
 seSON432Pvd9srXMp5KH0RtoIttLWd0VAHaGrO2TAQ9MhS2ZIoynEBJ3MqgO11xGQF94gBXLbHYuq
 LRrJ4FW+3gZv2Az4B6qT0u0uJ8RXuSqyfFtRvkLcH9rqrjvHADdIuh4k6REyXWmKude8NvHLIqpE/
 71XyUovj34/+xiMeR51u02SM;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uYowo-00EM4K-2N; Mon, 07 Jul 2025 16:44:06 +0000
Message-ID: <fb23a966-3367-40c6-857b-0db5b548071c@samba.org>
Date: Mon, 7 Jul 2025 18:44:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: de-DE
To: samba-announce@lists.samba.org, samba@lists.samba.org,
 samba-technical@lists.samba.org
Subject: [Announce] Samba 4.21.7 Available for Download
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


Important Change in Upcoming Microsoft Update
---------------------------------------------

On 8th of July, Microsoft will release an important security update for
Active Directory Domain Controllers for Windows Server versions prior to
2025.

This update includes a change to the Microsoft RPC Netlogon protocol,
which improves security by tightening access checks for a set of RPC
requests. Samba running as domain members in these environments will be
impacted by this change if a specific configuration is used, see below
for which configuration is affected.

Windows Server version 2025 is already equipped with these specific
security hardenings, and Microsoft is now planning to deploy them to all
supported Windows Server versions down to Windows Server 2008.


Who is affected?

Samba installations acting as member servers in Windows AD domains will
be affected if they are configured to use the 'ad' idmapping backend.
Samba servers not using this configuration will not be affected by the
change – at least to our current knowledge and understanding of the
change – and no further action is required.

Current versions of Samba with the affected configuration will no longer
function correctly once the Microsoft update has been applied. Users
will not be able to connect to the SMB service provided by Samba for any
domain configured to use the 'ad' idmapping backend.

See https://bugzilla.samba.org/show_bug.cgi?id=15876.

Changes since 4.21.6
--------------------

o  Günther Deschner <gd@samba.org>
    * BUG 15876: Windows security hardening locks out schannel'ed 
netlogon dc
      calls like netr_DsRGetDCName.

o  Stefan Metzmacher <metze@samba.org>
    * BUG 15680: Trust domains are not created.
    * BUG 15876: Windows security hardening locks out schannel'ed 
netlogon dc
      calls like netr_DsRGetDCName.

o  Andreas Schneider <asn@samba.org>
    * BUG 15680: Trust domains are not created.
    * BUG 15869: Startup messages of rpc deamons fills /var/log/messages.


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

         https://www.samba.org/samba/history/samba-4.21.7.html

Our Code, Our Bugs, Our Responsibility.
(https://bugzilla.samba.org/)

                         --Enjoy
                         The Samba Team

