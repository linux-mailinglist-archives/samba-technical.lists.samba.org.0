Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id C496DC40272
	for <lists+samba-technical@lfdr.de>; Fri, 07 Nov 2025 14:38:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=QfIvPF1jY+ERdGxWctG9B9wSuqGhq6UOGeEDcbPkNOg=; b=MZYBuemVwKDz5WSXTtyDmUZOkW
	r421RZixr73KwH2V/l6CxntmUjPaiCttyA3WGJMJbHEW+Yl6HODQ0KDBgJSyfUpJa+5IxTIKW2Ssu
	wYi1Jk5/9YHi1wmIV+TU6K8jaEAJTqpQYXyFcn0IFgf97cjMDVIH6lwy5Mp888UZVlDgrTIiQZZ3Y
	FJsssgehXqaW0KRrG9xNBJusReaUGcV7ybp9MSpSGyRNgIcW00zj6qHgVuytWElHbxiv3Es7xkS05
	aLuFYC98bGKicn1UTbdR3ORFMyPrhiL3k+pH9x7sVqMSSmCPVPWcWbMj5CzNb2u140zgV3KG0aGfg
	I696Ojcw==;
Received: from ip6-localhost ([::1]:36284 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vHMfO-00Big1-6v; Fri, 07 Nov 2025 13:38:14 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:12394) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vHMfF-00BifL-SU; Fri, 07 Nov 2025 13:38:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=QfIvPF1jY+ERdGxWctG9B9wSuqGhq6UOGeEDcbPkNOg=; b=DjdyNIzBpg0nZ5LScSI7vQb7VW
 dXOLWs00/c1atXl2dLWfQf64fYFQ5T8oECR+L0gxL8PSRPeEl35/7CYVI9Q/KotqqJMtli73C9EcK
 Iqkh7k5fpHLSkpcmacqyW1RCdhr69rtZbJGdMd4oX36AqgQIvOfyujFvGaYekP8TKZHmyFd0Bfpf3
 a4TAzCsUY/ESCcqDA87T84qK16Ib7jip8rbP+dPXhxfiUCCY3WWWEf9FkQ6FHoDh282B3Sa4p/v2U
 iaFMLNbBkkzPbeA9sO2efgWIYc4Pkin8+pILbORikDSA2raV8pTRuN3kQNzYrWgHGJ9O2YZ4eV+Nz
 QxnLrUW1zEwAL6Ica/0f3RnFkqE9KDWqgvoPS4AJReOv3zgCoOiSXzzp7007tgN3gYZ7LZ4aK//lN
 8GqVpDB3CZnxJwPJMk82k8YnDfmeqrBJb7R3ZBgSJI7KQIo7HNycxkpLMArNH9uKjpcgH2ILLLNS9
 IzBtal6g9bCucHNuZ0UnK5x+;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vHMfF-00D7MS-0x; Fri, 07 Nov 2025 13:38:05 +0000
Message-ID: <affff965-1b91-4da0-9101-f3af8e5adfac@samba.org>
Date: Fri, 7 Nov 2025 14:38:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: de-DE
To: samba-announce@lists.samba.org, samba@lists.samba.org,
 samba-technical@lists.samba.org
Subject: [Announce] Samba 4.23.3 Available for Download
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


Changes since 4.23.2
--------------------

o  Ralph Boehme <slow@samba.org>
    * BUG 15926: Samba 4.22 breaks Time Machine.
    * BUG 15927: Spotlight search restriction for shares incomplete and 
default
      search searches in too many attributes.
    * BUG 15930: Searching for numbers doesn't work with Spotlight.
    * BUG 15931: rpcd_mdssvc may crash because name mangling is not 
initialized.
    * BUG 15933: Only increment lease epoch if a lease was granted.

o  Pavel Filipenský <pfilipensky@samba.org>
    * BUG 15940: vfs_recycle does not update mtime.
    * BUG 15943: samba-log-parser fails with UnicodeDecodeError: 'utf-8' 
codec
      can't decode byte.

o  Martin Schwenke <mschwenke@ddn.com>
    * BUG 15935: Crash in ctdbd on failed updateip.


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

         https://www.samba.org/samba/history/samba-4.23.3.html

Our Code, Our Bugs, Our Responsibility.
(https://bugzilla.samba.org/)

                         --Enjoy
                         The Samba Team

