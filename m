Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 6343CAFB8E0
	for <lists+samba-technical@lfdr.de>; Mon,  7 Jul 2025 18:46:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=y16w85xMnQSH4AegtVUsfuGfG/cXhRP7DFBAXhYNHo0=; b=yChX1Sklslxb41qTnKBRUE5B+o
	KcYZUk699DhJ3iAtFRt/DhB1d6wIcMPYI9+G2Y7l8wwHfg/c9syHyVkxyTZQowUduIdCrp38vKhjs
	SncD/w5KDOgR68ug0eMqbOUdKXWAupoCQQVqdkNlarQULcCANkVHF1vhl8YXNXLaYrPkVOZTVW2eV
	cCeYEQKVmy1Gnnv0Q3EldxSOq10VeqhcS/3jb+L/5rUJmVDuqFTFPGeFXsZpwqoW+TE2YHuceVFRP
	w6MNG/YQ5uUfUiNAQ8WSTGc0jUvj35oDP2WCJcNpd/NlRuX/heWRjxEuSJdriQV3iPUTwjaCvAAqv
	sxrqwGCA==;
Received: from ip6-localhost ([::1]:20038 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uYoye-00Al73-NO; Mon, 07 Jul 2025 16:46:01 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:13522) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uYoxA-00Akd3-AD; Mon, 07 Jul 2025 16:44:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=y16w85xMnQSH4AegtVUsfuGfG/cXhRP7DFBAXhYNHo0=; b=KU+5qfl0L8yV8C8Gw69kz7+jNJ
 wesKn+fTGbWM+A8E/ULahfd4Ity1TMlBZTVYuMLsyf050Yo8lkaCgOf8CSTVAM5GCa0Jb83zWhXj0
 VAwNEL7PAb1/FhDXKoZf7pafM+b5MX0bsJj8ewmKiB/WUnmYwzfrzcNlS0V6mWl/6N7DVwAG1VHUP
 cq0DGpN6Gu+6+Q/OMmRZx8aViwG1s5ES0/3Q5ATEghpL2DXIIQ4nv6ul8bRnIgGxwkHPhh0EkVk3T
 64dvnYdJ/PZqo4xtVAJsZRJtiRIAjkLts4Js7+nQ/lko5cSkF+bhoxhQXN9R9U8Pc4cSj6HJNa/v3
 TNmh8qL2N5AcTg6+UD6FxyThXUyBR5zRRwNCv5rDF8LA/fmYUxZPZEeRHThee6cCkukhBkmPw0qHw
 L7NORlHBC+AiMWbr2AQPl09GIbdI2a6+Eyfm6rq+RUDXwSzh79s5c3JNYeuovBob4nRywr0sCrNYQ
 wcmWbi9NdY/W6Fzst3VHL1fC;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uYoxA-00EM4f-0D; Mon, 07 Jul 2025 16:44:28 +0000
Message-ID: <c3ffe117-e527-4741-ba54-a51a73de9967@samba.org>
Date: Mon, 7 Jul 2025 18:44:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: de-DE
To: samba-announce@lists.samba.org, samba@lists.samba.org,
 samba-technical@lists.samba.org
Subject: [Announce] Samba 4.22.3 Available for Download
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


Changes since 4.22.2
--------------------

o  Douglas Bagnall <douglas.bagnall@catalyst.net.nz>
    * BUG 15854: samba-tool cannot add user to group whose name is 
exactly 16
      characters long.

o  Günther Deschner <gd@samba.org>
    * BUG 15876: Windows security hardening locks out schannel'ed 
netlogon dc
      calls like netr_DsRGetDCName.

o  Stefan Metzmacher <metze@samba.org>
    * BUG 15876: Windows security hardening locks out schannel'ed 
netlogon dc
      calls like netr_DsRGetDCName.

o  Andreas Schneider <asn@samba.org>
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

         https://www.samba.org/samba/history/samba-4.22.3.html

Our Code, Our Bugs, Our Responsibility.
(https://bugzilla.samba.org/)

                         --Enjoy
                         The Samba Team

