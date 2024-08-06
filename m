Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id C9FF2948CF8
	for <lists+samba-technical@lfdr.de>; Tue,  6 Aug 2024 12:41:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=50X/Yyqe6MgW+6DILlJlltKbjLEqz0FHyfl/lOpDcUQ=; b=1ObC8HpjZe5nEuq+4UcUFJRvp3
	rGTJI6uBxVVI0gS6OrDRXyvsRSfWjY9krUbxa2LNKEy/B4E3WwJSXUGfjAoFaoz3KpYUWw4UwSpK7
	oJtTURELlwGP25Xr6gCnolI/8e5omaXwjnvaWux2biPobNof900ZNKDXLBOc/YhRudEE8L6SFsE3l
	f0K1OIlq5Pw4abeEknlP8BicREB43txSmr8kCpv04FUm5FtnQ0PDzShIF96I9Vog7dYzCFfSeHCiu
	nIMmCb/9T82x04dY9SNnMdiRE4t4YV+Hl5swMjd8B1g7ltqzuHCRl3c1YsmoyHPHs5RH4B5yfCPkf
	obd4FNYQ==;
Received: from ip6-localhost ([::1]:30734 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1sbHcf-0042Hd-L8; Tue, 06 Aug 2024 10:40:57 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:52102) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1sbHcU-0042Gw-Sw; Tue, 06 Aug 2024 10:40:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:To:From:Date:CC;
 bh=50X/Yyqe6MgW+6DILlJlltKbjLEqz0FHyfl/lOpDcUQ=; b=W7KnyxXImxeB/bLK8y+zJvJBO4
 6j2PvVSeZMi/6q1Bo17sy90NMuHspd/QOmrEFXylneeND6xCa6rT4h4z767Zu9fxaqSS2LN1zicWO
 V8uVONp/V94kd0XhPBII21EP0r/CGHdcyLUOZKLxqsbDfX8/gxe8eDvMChFCuryn6YkCRNtJJ/k0W
 DMxWu9k23WxXH8luabFHTLxN2zDT9wLhiCC90cftLCCjRKhyBC08dc3PaO/ZLu2JrzpyFebswZNOy
 ZQ1aLye5nncvg0ojoeuLsRUw4sntTgLtewkuNZV5gZ9DvMNjCran3hmsC3blobwEGkNWrRFiLqlMv
 riTGn69g6CqMD7yGFRWWY6BRiZwRKR6E3M+Fx3Z6VZJ6hOCph/Hec5kfwsYrKAru2xIlddGrcX3SH
 Jq4IikCfTueOUs85Opr6qadT5LC3ZREpPoKwC1oycmVBErefvidDsRKktGvTXpGdrAqg2FvTpuQav
 hKHpm9OEM6MrpGxIw6VVuUBK;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1sbHcU-005ALX-1y; Tue, 06 Aug 2024 10:40:46 +0000
Date: Tue, 6 Aug 2024 12:40:42 +0200
To: samba-announce@lists.samba.org, samba@lists.samba.org,
 samba-technical@lists.samba.org
Subject: [Announce] Samba 4.20.4 Available for Download
Message-ID: <ZrH9qj0/jjCY+NjD@SERNOX19>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
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
From: Stefan Metzmacher via samba-technical <samba-technical@lists.samba.org>
Reply-To: Stefan Metzmacher <metze@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Release Announcements
---------------------

This is the latest stable release of the Samba 4.20 release series.

Changes since 4.20.3
--------------------

This only fixes a regression in library version strings in Samba
4.20.3, see: https://bugzilla.samba.org/show_bug.cgi?id=15673

If you compiled Samba from the sources and don't have other
applications relying on Samba's public libraries, there's
no reason to upgrade from 4.20.3 to 4.20.4.

o  Andreas Schneider <asn@samba.org>
   * BUG 15673: --version-* options are still not ergonomic, and they reject
     tilde characters.

o  Stefan Metzmacher <metze@samba.org>
   * BUG 15673: --version-* options are still not ergonomic, and they reject
     tilde characters.


#######################################
Reporting bugs & Development Discussion
#######################################

Please discuss this release on the samba-technical mailing list or by
joining the #samba-technical:matrix.org matrix room, or
#samba-technical IRC channel on irc.libera.chat.

If you do report problems then please try to send high quality
feedback. If you don't provide vital information to help us track down
the problem then you will probably be ignored.  All bug reports should
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
using GnuPG (ID AA99442FB680B620).  The source code can be downloaded
from:

        https://download.samba.org/pub/samba/stable/

The release notes are available online at:

        https://www.samba.org/samba/history/samba-4.20.4.html

Our Code, Our Bugs, Our Responsibility.
(https://bugzilla.samba.org/)

                        --Enjoy
                        The Samba Team

