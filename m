Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id C99AEB2FE91
	for <lists+samba-technical@lfdr.de>; Thu, 21 Aug 2025 17:37:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=mrmx+E52FG98hg2/THO/lddJSk834HJfb5z+oxwCpdE=; b=arzAEEuRMN7/37ysRrjb3cOIs/
	4htQsUeTT0zhi8pUASiqmI8DSgmlKHoepL3hS1sni/7BTRhy8Zv9b3g1IdJui+ZbAJN6Cm1Fx1iZU
	2pRpTiUXkzjCFit8R4tWg3vx92v1OFz5LxTvDsTBLEo8lTosrQbhUR+T7GMupPEypgyclft6FT+Kj
	To259zrLaCkjRSQGIdIECpt1//zGtz9HRVj92wE/u9Tgbf73AKkh6h/l38E0clR3gWQthndn7d5Lr
	f0LPwmyY7KAhub8dMQfj05skeWsmBEdF/QH+nGTGAomO/XDs+4PoyhkfjJcviLuy/d9bG8TN7Y+8d
	q/7N4Jzg==;
Received: from ip6-localhost ([::1]:18372 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1up7Ls-0003QB-S8; Thu, 21 Aug 2025 15:37:21 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:52878) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1up7Li-0003PM-TZ; Thu, 21 Aug 2025 15:37:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=mrmx+E52FG98hg2/THO/lddJSk834HJfb5z+oxwCpdE=; b=2b38vxw3Wop89l6ZnMcquVsOA/
 0fA63Ep24/ZNorivg6V8Qx4mPosZ8qNojyLjmIEK/NsVG0ysvhTbVqyK6yhoW3wp1nEurtV2LPJdS
 B2UBOq7/MgeMIklP5cz2S155W12VvqfiEEGmp8Pj/BDciM5ZCmL+WkOjZ5ewdtqUIQ+Mb5e3raNIQ
 ottsMf1MqINwZ5HNwx3wokMR5Kg/JW18rbNurdQNO8QwTAnEQiayRqfFX+oh/vjYrBm/3NPBOcUy+
 SZtuE5BwlOnqXARW5j0cs/nqB3RAVQJQ2CDDQLfbNWeorDyE+LF8UBwFTv+3IjyErgt8VCRFrhm9T
 zPSJDU2Q9je9WZRoi/hyvk40WndlqEeoRgK/cg4ZhYDvgqUTQ2LcbKh9xGLf4BA9PTYBpKtCwI0pk
 /8XgZENHb+0l67efOXWaDaDdEF3pFmDsx8PFbGs0MdV7L+/xxQtkhBi5VmOQ6DTzYzPvWviYEdvaJ
 JTDNEqPhSyv5xOb/9bdaU0SY;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1up7Li-00074e-1R; Thu, 21 Aug 2025 15:37:10 +0000
Message-ID: <8ff6a324-552a-4d8c-ba4a-82830d5054fd@samba.org>
Date: Thu, 21 Aug 2025 17:37:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: de-DE
To: samba-announce@lists.samba.org, samba@lists.samba.org,
 samba-technical@lists.samba.org
Subject: [Announce] Samba 4.22.4 Available for Download
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

This is the latest stable release of the Samba 4.22 release series.


Changes since 4.22.3
--------------------

o  Ralph Boehme <slow@samba.org>
    * BUG 14981: netr_LogonSamLogonEx returns NR_STATUS_ACCESS_DENIED with
      SysvolReady=0.
    * BUG 15844: getpwuid does not shift to new DC when current DC is down.
    * BUG 15876: Windows security hardening locks out schannel'ed 
netlogon dc
      calls like netr_DsRGetDCName-
    * BUG 15881: Unresponsive second DC can cause idmapping failure when 
using
      idmap_ad-

o  Günther Deschner <gd@samba.org>
    * BUG 15840: kinit command is failing with Missing cache Error.

o  Pavel Filipenský <pfilipensky@samba.org>
    * BUG 15891: Figuring out the DC name from IP address fails and breaks
      fork_domain_child().

o  Volker Lendecke <vl@samba.org>
    * BUG 15816: vfs_streams_depot fstatat broken.
    * BUG 15892: Delayed leader broadcast can block ctdb forever.

o  Stefan Metzmacher <metze@samba.org>
    * BUG 14981: netr_LogonSamLogonEx returns NR_STATUS_ACCESS_DENIED with
      SysvolReady=0.

o  Rabinarayan Panigrahi <rapanigr@redhat.com>
    * BUG 15663: Apparently there is a conflict between shadow_copy2 
module and
      virusfilter (action quarantine).

o  Aleksandr Sharov <asharov@redhat.com>
    * BUG 15877: Fix handling of empty GPO link.

o  Srinivas Rao V <Srinivas.Rao.V@ibm.com>
    * BUG 15880: SMB ACL inheritance doesn't work for files created.


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

         https://www.samba.org/samba/history/samba-4.22.4.html

Our Code, Our Bugs, Our Responsibility.
(https://bugzilla.samba.org/)

                         --Enjoy
                         The Samba Team

