Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id C1F109D28C8
	for <lists+samba-technical@lfdr.de>; Tue, 19 Nov 2024 16:00:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=Bny6N+hqPufZkhr+78++6zriQAYp+L6WcdQ8971giBA=; b=zizvr3PiXJWyOr0q2/o7AdVgEA
	Xa/Hx/T1nZqbxUFojsJgXnyvg9KGJR2XHYpybdVSrOeBGEK67rdxNC3JS8/W5qZxSMB3inl7OVwll
	li3qc9YpNmq4yHACghNbkMmH3u2joqbe4KSQXmhDn46bWXP1TTTU/Q+zc8qWUp1ijY3P0Mt0wDReQ
	IAv8+HQb/2XliwmNc6u/2vK4XbQ0vduEx+4HzJcz6FOv6YZ/5zl3Np+RORJJqVERezn1AwU+F20kN
	cBIFc3NnagIQzUJlfaA6rX1NqSDCjAiFEsG52iTQywtaD4iBamp37hQRaXCORwkjD3Lxhthb/khn+
	E/oBIU3w==;
Received: from ip6-localhost ([::1]:30196 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1tDPi8-000Esg-CX; Tue, 19 Nov 2024 15:00:12 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:10484) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1tDPhu-000Erw-Co; Tue, 19 Nov 2024 15:00:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=Bny6N+hqPufZkhr+78++6zriQAYp+L6WcdQ8971giBA=; b=t+lWxvxa8hQ/S8e8Qtq9dpXsgh
 7Xr8hFoW7zkVmatFSQyIrboI64SMEDucmTGCLShD26xbAWzWbVQLXsICUqQ1kBDlIWhcID/WNSVLE
 Vz8BaI8selYtcPebeG5H9EPud24/V174GZuxpDwr8t7VCa/w8QL3ocg3AlVXYOwWd2YM0W3cC5s7l
 /NMu4INmBbL9NI1W50kMRlPDbSjlggNi3NGottDhlIxQEahltQCTNbLRNtNRUNksN5PzVRtMlfVxy
 CRgoXwrC97vefSDA0cs9e/FVF01mlDpqYXXjh3iQkhOXJTZe83P7Bx49W1bmORlsuQ7V7zAyOIKO3
 ITF64xEhz4CR3+RqnzcR+HwZmp0jIZukSnlJsVIEDvp/ZFWq0ATKXqE4nMc2vxrAIwuUpIYYjplOM
 g3NTaArzfXpoMvLlHEQISrXvpFJev8tSE6cty1TkBIcApMQuCxXaALKBpu3kHk0VlZ3GnLXTdgWVD
 2NUZGsHdgIg/hH5sAS0b2v3F;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1tDPht-000Vzw-2q; Tue, 19 Nov 2024 14:59:57 +0000
Message-ID: <9eb23c4d-343b-42ed-b386-a7c25eb658bd@samba.org>
Date: Tue, 19 Nov 2024 15:59:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: de-DE
To: samba-announce@lists.samba.org, samba@lists.samba.org,
 samba-technical@lists.samba.org
Subject: [Announce] Samba 4.20.6 Available for Download
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


Changes since 4.20.5
--------------------

o  Douglas Bagnall <douglas.bagnall@catalyst.net.nz>
    * BUG 15590: libldb: performance issue with indexes (ldb 2.9.2 is 
already
      released).

o  Ralph Boehme <slow@samba.org>
    * BUG 15624: DH reconnect error handling can lead to stale sharemode 
entries.
    * BUG 15732: smbd fails to correctly check sharemode against OVERWRITE
      dispositions.

o  Andréas Leroux <aleroux@tranquil.it>
    * BUG 15692: Missing conversion for msDS-UserTGTLifetime, msDS-
      ComputerTGTLifetime and msDS-ServiceTGTLifetime on "samba-tool
      domain auth policy modify".

o  Stefan Metzmacher <metze@samba.org>
    * BUG 14356: Protocol error - Unclear debug message "pad length 
mismatch" for
      invalid bind packet.
    * BUG 15280: irpc_destructor may crash during shutdown.
    * BUG 15425: NetrGetLogonCapabilities QueryLevel 2 needs to be 
implemented.
    * BUG 15624: DH reconnect error handling can lead to stale sharemode 
entries.
    * BUG 15649: Durable handle is not granted when a previous OPEN 
exists with
      NoOplock.
    * BUG 15651: Durable handle is granted but reconnect fails.
    * BUG 15708: Disconnected durable handles with RH lease should not 
be purged
      by a new non conflicting open.
    * BUG 15740: gss_accept_sec_context() from Heimdal does not imply
      GSS_C_MUTUAL_FLAG with GSS_C_DCE_STYLE.
    * BUG 15749: winbindd should call process_set_title() for locator child.

o  Christof Schmitt <cs@samba.org>
    * BUG 15730: VFS_OPEN_HOW_WITH_BACKUP_INTENT  breaks shadow_copy2.

o  Jones Syue <jonessyue@qnap.com>
    * BUG 15706: Consistent log level for sighup handler.


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

         https://www.samba.org/samba/history/samba-4.20.6.html


If you are building/using ldb from a system library, you'll
also need the related updated ldb tarball, otherwise you can ignore it.
The uncompressed ldb tarballs have been signed using GnuPG (ID 
4793916113084025).
The ldb source code can be downloaded from:

https://download.samba.org/pub/ldb/ldb-2.9.2.tar.gz


Our Code, Our Bugs, Our Responsibility.
(https://bugzilla.samba.org/)

                         --Enjoy
                         The Samba Team

