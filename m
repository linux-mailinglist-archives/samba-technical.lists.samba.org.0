Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 03F89A02C1B
	for <lists+samba-technical@lfdr.de>; Mon,  6 Jan 2025 16:50:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=PYfaEJmzmdP8xGzj6tEbz0wO8L6F11LOFLG7yhsZfNA=; b=1/iQ3lVeYTm7/ezEQtac2NkVA4
	e4TuI0NIrjMBagQCOlD6hR2IEwZ+CjInNi7Kxy9KkbyqP8cBzixw+UK9Z0nd8Ni1toZK8R6MnEnWH
	OTn+U6orGKlSi+3tWMhjzpmhS+63G+NDXLDCa1pWTdXw8Q2HCq3VEAHF4Ok2bFnKulWq+NpoP60g3
	5gtvhkYd6MBTp2HhZDEQkvUhJ0D3CCwJQTa1GyQYbB+MxDmSVcymEC7kyU36gyA96aBBtFOkWRn4V
	cYRg5IaQ1hpxHgZuqkzsESwPymPx2l+FzN3vaEsYow9dcOFfopceF11wxv9gjaMQEnzQf77P1wNH4
	PnGPJQow==;
Received: from ip6-localhost ([::1]:52804 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1tUpMw-007OmX-V1; Mon, 06 Jan 2025 15:50:19 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:48350) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1tUpMg-007OlT-6F; Mon, 06 Jan 2025 15:50:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=PYfaEJmzmdP8xGzj6tEbz0wO8L6F11LOFLG7yhsZfNA=; b=B161hZpdv/Gu/xHUbJ1X8PKNiI
 +l4A+771IT1FpeZCqDkX5HFOHBhPLLTLE9lqO59iG20u+BCP0Ozrye5MmF9z6Y4BscTSVjpon7+Le
 aB8X2E9ApFotRVZq91f9aV/Gq7FInWcMoooI5elIXJptvuOpIVaEat4a7d6coVhte4Pw0IWipf9Z5
 nANo0EEzzz/sWeR6fMD3IuS3Kur+JImeu0zpLGm9m2Ym+nwd6BH2oqmZwgLOZxdBd1XD2wxY6e2Au
 +/1T8NyGq30VllHBqplR3fJrjw0Qgvd+IqkryNmqOInfuyFj4zOIO1Xu0JyCcB9RdAIhfUmJxc5M4
 Nxnk27JxyEcbdP2eYr+5EeewfC/fyjcAQoS3fQJklwPzyYfSRjyJZrIfb4Z7vUcsGONh1z/s+be7S
 QjCT7YFF4GfBSaZE5TuIa8Y48OOoCb6r3QRuDETWeHdlwPzteEPA3RFQu3F6+FRfjEIJ+z31B/ZV1
 09NRtumbREg49f8TaUdxY/wX;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1tUpMf-005YPV-2T; Mon, 06 Jan 2025 15:50:01 +0000
Message-ID: <4ad510fc-c876-4ae1-a8e9-6753303514c4@samba.org>
Date: Mon, 6 Jan 2025 16:50:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: de-DE
To: samba-announce@lists.samba.org, samba@lists.samba.org,
 samba-technical@lists.samba.org
Subject: [Announce] Samba 4.21.3 Available for Download
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


Changes since 4.21.2
--------------------

o  Douglas Bagnall <douglas.bagnall@catalyst.net.nz>
    * BUG 15701: More possible replication loops against Azure AD.

o  Ralph Boehme <slow@samba.org>
    * BUG 15697: Compound rename from Mac clients can fail with
      NT_STATUS_INTERNAL_ERROR if the file has a lease.

o  Pavel Filipenský <pfilipensky@samba.org>
    * BUG 15724: vfs crossrename seems not work correctly.
    * BUG 6750: After 'machine password timeout' /etc/krb5.keytab is not 
updated.

o  Volker Lendecke <vl@samba.org>
    * BUG 15771: Memory leak wbcCtxLookupSid.

o  Stefan Metzmacher <metze@samba.org>
    * BUG 15765: Fix heap-user-after-free with association groups.

o  Andreas Schneider <asn@samba.org>
    * BUG 15758: Segfault in vfs_btrfs.

o  Martin Schwenke <mschwenke@ddn.com>
    * BUG 15755: Avoid event failure race when disabling an event script.

o  Jones Syue <jonessyue@qnap.com>
    * BUG 15724: vfs crossrename seems not work correctly.


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

         https://www.samba.org/samba/history/samba-4.21.3.html

Our Code, Our Bugs, Our Responsibility.
(https://bugzilla.samba.org/)

                         --Enjoy
                         The Samba Team

