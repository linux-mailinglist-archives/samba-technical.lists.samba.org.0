Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B2D0548024
	for <lists+samba-technical@lfdr.de>; Mon, 13 Jun 2022 09:07:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=1M8ew69sN8kXrw4qXNVU8ACtp3SHFWdGiAALm993S6g=; b=yYH0CPbAwRW2QxM12DAvw3gwdH
	MOntbKbPZrEholLEtV/4H8aJeuDxDG+PaMn0KblAwPPOq5wzZxqhAqRFNGRGUlCEqlwIKvJUJqFnI
	S58Layl3bUntkPsgGRn6rhqPCBf+m+IOV986sCF/Wu5CceT2dycXDKLbVwTPVUkIqkP1TVQE9b0CU
	HpBP92wBVUm6OQsDKhhBHuMYM7qR7aXFt78hBsRjWQ+gcBZ6MqPZHU5iae/43r/BGwOJj8dGKj6ei
	zkwEHAikygiEPBBPZ9eCVkeLyeSfA2+jbYvwW0N4T3VyNAhP+56iN/Ts3e4EiEQFs6IuEPMZXoFnW
	uGcklwOQ==;
Received: from ip6-localhost ([::1]:42350 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1o0eAV-009sFe-G5; Mon, 13 Jun 2022 07:07:23 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:62282) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1o0e9V-009sAa-43; Mon, 13 Jun 2022 07:06:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=1M8ew69sN8kXrw4qXNVU8ACtp3SHFWdGiAALm993S6g=; b=NrV0Sd2iPGbfxD73Zgpn3uZVUL
 q/TJnocYTzAekL3LQFORC1LlU85VZUHYjPOe1Kbiuiey2OQql2wePmb+P7AjuNA9Kf+GQagw7sI3D
 N9abvL0rIDaccFkwM85TpaH4xupNSfNKjnoXM9Zi+Y7DnehfiJdyqDUAbzPMrgPj1vSpWViegFYox
 PKCIhe08mgN0g25GOoHvyPpckX3rd0g269v236QXGzA+FVI1ZHMcPmU7WAGnRVuNAfh2crCrrNNwz
 hTjDcTFv/0cCP2/M9B/m0WqDUuqi7MejQuaUjxHz7Vp8ygZRtr2Q5f7EbjSv1Ajlk2AOVVIP9I6z6
 Yls470dUubCBxIQwS5dBchUVH8IEZcFSCUeTKjwV9B7L1XGSYUj0e9HUsnqaH8M5idvhN1Gb3Lv9/
 /xXlEHZFDxIuG/9zhrK+9sY0oaxLvswRq/LnS1c9/qCySl1Yey3PbhQPWMhKKVqsf4eU1PRzKel/3
 zVSDylpQSh7S3ROVNl6lS5yO;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1o0e9U-005QTj-5V; Mon, 13 Jun 2022 07:06:20 +0000
Message-ID: <7f69ad0c-bfc6-6dd5-06d7-75e78e58fa38@samba.org>
Date: Mon, 13 Jun 2022 09:06:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Content-Language: de-DE
To: samba-announce@lists.samba.org, samba@lists.samba.org,
 samba-technical@lists.samba.org
Subject: [Announce] Samba 4.16.2 Available for Download
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

This is the latest stable release of the Samba 4.16 release series.


Changes since 4.16.1
--------------------

o  Jeremy Allison <jra@samba.org>
    * BUG 15042: Use pathref fd instead of io fd in 
vfs_default_durable_cookie.

o  Ralph Boehme <slow@samba.org>
    * BUG 15069: vfs_gpfs with vfs_shadowcopy2 fail to restore file if 
original
      file had been deleted.

o  Samuel Cabrero <scabrero@samba.org>
    * BUG 15087: netgroups support removed.

o  Samuel Cabrero <scabrero@suse.de>
    * BUG 14674: net ads info shows LDAP Server: 0.0.0.0 depending on 
contacted
      server.

o  Volker Lendecke <vl@samba.org>
    * BUG 15062: Update from 4.15  to 4.16 breaks discovery of [homes] on
      standalone server from Win and IOS.

o  Stefan Metzmacher <metze@samba.org>
    * BUG 15071: waf produces incorrect names for python extensions with 
Python
      3.11.

o  Noel Power <noel.power@suse.com>
    * BUG 15075: smbclient -E doesn't work as advertised.

o  Andreas Schneider <asn@samba.org>
    * BUG 15071: waf produces incorrect names for python extensions with 
Python
      3.11.
    * BUG 15081: The samba background daemon doesn't refresh the 
printcap cache
      on startup.

o  Robert Sprowson <webpages@sprow.co.uk>
    * BUG 14443: Out-by-4 error in smbd read reply max_send clamp..


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

         https://www.samba.org/samba/history/samba-4.16.2.html

Our Code, Our Bugs, Our Responsibility.
(https://bugzilla.samba.org/)

                         --Enjoy
                         The Samba Team

