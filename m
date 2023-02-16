Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A30B3699A7F
	for <lists+samba-technical@lfdr.de>; Thu, 16 Feb 2023 17:51:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=v2k7J7gTqrUPNrrCYJwrLdsbViDM/5NuhaVqm07SvZk=; b=vcCqsJCcnb26+m6d50yv9I4c0+
	I9+noPY/OYJtksuy/5F/ldQXwGkl/JVzCXSzg8lX2ziKH8TQtrHabw7YidG4/hgIuOucCvqxDZtDd
	dNZOxv92a6e3N0i/KwiOGVblG2RWm1fTWU1WRUmpLY4s6/AQWNtlDHZMZml408igukoT+OUyOHjW3
	CSBk9pPKJ6xeyGlyWcwtkQIQQoHVtrk0stvZAztCfCdZrwC8/EXshQloVf9F3EIFgMtqJ7+D9poNE
	7G5h//pZfZkH0MxYeNpy64w7YYEvDMyXKM979fl15cVu0UIB7R2GacD8WK9EwnnpxHUCG+6LTFC0X
	W5Q71h0Q==;
Received: from ip6-localhost ([::1]:47408 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pShTj-00CjC2-DG; Thu, 16 Feb 2023 16:51:27 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:15764) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1pShTY-00CjB6-Gh; Thu, 16 Feb 2023 16:51:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=v2k7J7gTqrUPNrrCYJwrLdsbViDM/5NuhaVqm07SvZk=; b=FgRNw1pIijOUE2MlwWILftQcdN
 MfvyCFeAZ4jEe9dbvUE/SWkSPitWgKy9gSpSyHrrcoeXKa734txn3uNqV2VYNgVbI2huEW+1qgI/5
 XNwl4L+QexHKymv/WcL6LveuqHXjRXCGEQlnuEAjIJwNxrk9M4As/X8pknXd/GNWEGDHAYwdmilMT
 npcSikaksese9XkTMHJ3VWxivwtXI6gifN7bH0ODbug+TrzIh7Ss+vXWa2iH8iV20BUGsc9S2ixRH
 1rwBh490q+lw6TOFdvnxqHaxVi4MnlZ9WwT9MJfhV5BYcxoMuKTOlnMNoV8joVJjYCsQWIriO/m9L
 Y3zQTtaIKntkS2rBd9egVbHLjv5bw4Ooeq0mSblOJHTQms8poHaP3rEfMHM+ZrmKq0CVrEr+91p3Y
 4aFCLSKIlvGUhly4wkdbDrn7yBwog3BSmj2MUWbBqqdKLBrOJ8ybbIkxSu6z17xBkKb9718ceR54W
 kgwZs96QtruKz2W7qyLb/ZrH;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1pShTY-00EB3v-1f; Thu, 16 Feb 2023 16:51:16 +0000
Message-ID: <fb8dfb5b-7c3a-204f-0037-6496bcf291a8@samba.org>
Date: Thu, 16 Feb 2023 17:51:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Content-Language: de-DE
To: samba-announce@lists.samba.org, samba@lists.samba.org,
 samba-technical@lists.samba.org
Subject: [Announce] Samba 4.16.9 Available for Download
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


Changes since 4.16.8
--------------------

o  Jeremy Allison <jra@samba.org>
    * BUG 14808: smbc_getxattr() return value is incorrect.
    * BUG 15172: Compound SMB2 FLUSH+CLOSE requests from MacOSX are not 
handled
      correctly.
    * BUG 15210: synthetic_pathref AFP_AfpInfo failed errors.
    * BUG 15226: samba-tool gpo listall fails IPv6 only - finddcs() 
fails to find
      DC when there is only an AAAA record for the DC in DNS.
    * BUG 15236: smbd crashes if an FSCTL request is done on a stream 
handle.

o  Ralph Boehme <slow@samba.org>
    * BUG 15299: Spotlight doesn't work with latest macOS Ventura.

o  Samuel Cabrero <scabrero@suse.de>
    * BUG 15240: CVE-2022-38023 [SECURITY] Samba should refuse RC4 (aka md5)
      based SChannel on NETLOGON.

o  Volker Lendecke <vl@samba.org>
    * BUG 15243: %U for include directive doesn't work for share listing
      (netshareenum).
    * BUG 15266: Shares missing from netshareenum response in samba 4.17.4.
    * BUG 15269: ctdb: use-after-free in run_proc.

o  Stefan Metzmacher <metze@samba.org>
    * BUG 15243: %U for include directive doesn't work for share listing
      (netshareenum).
    * BUG 15266: Shares missing from netshareenum response in samba 4.17.4.
    * BUG 15280: irpc_destructor may crash during shutdown.
    * BUG 15286: auth3_generate_session_info_pac leaks wbcAuthUserInfo.

o  Andreas Schneider <asn@samba.org>
    * BUG 15268: smbclient segfaults with use after free on an optimized 
build.

o  Andrew Walker <awalker@ixsystems.com>
    * BUG 15164: Leak in wbcCtxPingDc2.
    * BUG 15265: Access based share enum does not work in Samba 4.16+.
    * BUG 15267: Crash during share enumeration.
    * BUG 15271: rep_listxattr on FreeBSD does not properly check for 
reads off
      end of returned buffer.


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

         https://www.samba.org/samba/history/samba-4.16.9.html

Our Code, Our Bugs, Our Responsibility.
(https://bugzilla.samba.org/)

                         --Enjoy
                         The Samba Team

