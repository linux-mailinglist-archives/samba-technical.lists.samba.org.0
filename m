Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 17E56B501EB
	for <lists+samba-technical@lfdr.de>; Tue,  9 Sep 2025 17:54:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=EL0NnergDVTV1SMJHWSs3lRbrE8O+heWV7ZNEyHYaws=; b=cb4IUj4Ir26PN/5URbSSJDNia5
	W6YTXAtOiuTLxfV+jalEzj/UPr87ye8TLWUlD2dLlt8X82zUs5XqrOpjtX+Af9Fv/0ryVKdQp8JsF
	/zgNXnqm03ndgPEG7Iw7bYp0XlrsLRZKAGBeub+EB/oQq5ToJvWKvp+lk8efAOKulcK+JL2IL45nD
	Q1+CbIfLkLvENBmZ2mMdxsysNnsL8DgUrcht3kcgf8Q+2L+RRvpdB5C5udvXFbuYxOMK9mjT2H171
	T/6KqNsIjEq3pt5ojlrdXXFA/f97feyx7Hm3reEEWSjrTfsvCe3RlFU+Dz33RaDSB6ByUFFK+eFpu
	lDeA8wGg==;
Received: from ip6-localhost ([::1]:35408 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uw0ez-003Nvn-Vr; Tue, 09 Sep 2025 15:53:34 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:13276) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uw0er-003Nv1-W5; Tue, 09 Sep 2025 15:53:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=EL0NnergDVTV1SMJHWSs3lRbrE8O+heWV7ZNEyHYaws=; b=x5bFtP4cmaWO1Z1Qv53ymlZJOB
 M+i3OxBWXkbq7bX78l0WI6YW9NXOwiclkf221akz24JhQjNtapZrNOGDafBzXumL6hUaTg4EV/Oiv
 HE4wQA0hTg5asKrEPbM/xB0qgnHRTBY5trEEe0Q1Gfb3t8TBbXAMsv7H2td23XJ4gghKxcHvLZsLC
 74ouM3KLu+zRNAPdrk3B7A1wCp+XRg1cWN6VmICJwG298oM3MlgWJ9D5LCPW3xMNok+vhpgtE6OWy
 oCjVT/LpnfIaD+g9aEviRI51x13yvtGN0JviHtptAuwhEwhGR17eo+JGelhwXfyaa3gstoi6hw0Lp
 r9D4ZuCcBNXhG5exDiD1EvpdGsBmp8gL/cPhLb/zCmXHYe0sJMxgQNRudbCU72TH2A31WQSSKWD+G
 eLF4XjdrqPVIT0ZemuZl4Bfxd5am4LNmCjxZMbRMT5WY+fDjBdr2Svs8iK6psDOUQhS6oGALGXuYq
 4V8p8FqzPBRjP/hiAJCgsYbc;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uw0er-003FNo-12; Tue, 09 Sep 2025 15:53:25 +0000
Message-ID: <6b2d7999-1c0a-42a8-b63d-faff3b702006@samba.org>
Date: Tue, 9 Sep 2025 17:53:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: de-DE
To: samba-announce@lists.samba.org, samba@lists.samba.org,
 samba-technical@lists.samba.org
Subject: [Announce] Samba 4.21.8 Available for Download
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


Changes since 4.21.7
--------------------

o  Ralph Boehme <slow@samba.org>
    * BUG 14981: netr_LogonSamLogonEx returns NR_STATUS_ACCESS_DENIED with
      SysvolReady=0.
    * BUG 15844: getpwuid does not shift to new DC when current DC is down.
    * BUG 15876: Windows security hardening locks out schannel'ed 
netlogon dc
      calls like netr_DsRGetDCName.

o  Günther Deschner <gd@samba.org>
    * BUG 15840: kinit command is failing with Missing cache Error.

o  Pavel Filipenský <pfilipensky@samba.org>
    * BUG 15891: Figuring out the DC name from IP address fails and breaks
      fork_domain_child().

o  Volker Lendecke <vl@samba.org>
    * BUG 15892: Delayed leader broadcast can block ctdb forever.

o  Stefan Metzmacher <metze@samba.org>
    * BUG 14981: netr_LogonSamLogonEx returns NR_STATUS_ACCESS_DENIED with
      SysvolReady=0.

o  MikeLiu <mikeliu@qnap.com>
    * BUG 15900: 'net ads group' failed to list domain groups.

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

         https://www.samba.org/samba/history/samba-4.21.8.html

Our Code, Our Bugs, Our Responsibility.
(https://bugzilla.samba.org/)

                         --Enjoy
                         The Samba Team

