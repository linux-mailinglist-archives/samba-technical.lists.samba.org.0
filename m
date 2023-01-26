Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 03F7167D3B1
	for <lists+samba-technical@lfdr.de>; Thu, 26 Jan 2023 19:01:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=xxeEXWsEKrkZczF0rPIiY9fMRfyzQrOXRb43Imt0ES0=; b=buffM180UJXEc0IFmDkYYmH4xC
	vzDVVXBSamhQfRT59jsA11kxvWLLjUaUJ3kt/e2NiOhozLxZ0ZtdooHimKDSQV6By1Irt0n3tlzg2
	P1Tufsg8/HDyJV5SIMfT4hdXYu45f2VucFLaza8T89xz/WUjKNQk+uOu2px97FpvLLo51ma7Ztokn
	bD3jfgOPX4wmO73XpUQM+3l6fT/FqZAGinn1e6kNNdw4jpYKfwrswxI8ciodPfZA96icRbLlKOIMJ
	UIc2YjAypUYhs4N4j7kLzNwJxsYXlxckrJc7VMs+B7het5Lek4JVcJ+58Dz9s9CsO1imjjT2/NBjs
	ft5EMh+A==;
Received: from ip6-localhost ([::1]:43194 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pL6Ye-003Hs1-O6; Thu, 26 Jan 2023 18:01:08 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:42362) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1pL6YU-003Hr3-Nu; Thu, 26 Jan 2023 18:01:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=xxeEXWsEKrkZczF0rPIiY9fMRfyzQrOXRb43Imt0ES0=; b=j6cPM268j2EfAe1LZhpyf12ifE
 8B/K3e0Lk9cHJwo5dVtUtrdJZHxd8gJxrjH+WwaWMfmsJgTE2n8/WkMjTvivFQoYIqBsFm4nKtP/l
 dxIbDY6mycJsyzGNdlaJHWgZ71JIH4A3/QM9QQbtgWs8CCVh+vCU3qg8LiUO7JEb5R6+mHG/hL5I+
 lIOdbe9CbgQqnInEYOy4t8UOYR1/fYUJoUgHZByhNByqb/Td4nm2aFX0+iviT1s9vrCLhCa3SPG1z
 W83VkgmPYMhImaeCwBe9ZuQtXHBfHistU5ow3OHPaLxevWl9omD2tIkbLu6cNj9OoXuDyJd1lKQ/X
 9lOTXeO+LByCrHrvmqm1ie/nm9ZQMENG+38RpL1apr9Yu4gfh1EAfGmrNOgAfbsfwv+bTdYds0S5f
 WlZIbahFUaavGSjNvQmu3NcEoh9YbzG9ln5dIeKSOeBcHtlmqqSD9k9ckghY3VVIQxC4l13x8ns6M
 dkUQQ0YuE9PWUZApQXC1UasD;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1pL6YU-00APSR-4n; Thu, 26 Jan 2023 18:00:58 +0000
Message-ID: <2a85aebf-14d4-8b8f-05eb-3d818c3f3a3b@samba.org>
Date: Thu, 26 Jan 2023 19:00:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Content-Language: de-DE
To: samba-announce@lists.samba.org, samba@lists.samba.org,
 samba-technical@lists.samba.org
Subject: [Announce] Samba 4.17.5 Available for Download
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

This is the latest stable release of the Samba 4.17 release series.


Changes since 4.17.4
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
    * BUG 15277: DFS links don't work anymore on Mac clients since 4.17.
    * BUG 15283: vfs_virusfilter segfault on access, directory edgecase
      (accessing NULL value).

o  Samuel Cabrero <scabrero@samba.org>
    * BUG 15240: CVE-2022-38023 [SECURITY] Samba should refuse RC4 (aka md5)
      based SChannel on NETLOGON (additional changes).

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

o  Jones Syue <jonessyue@qnap.com>
    * BUG 15282: smbstatus leaking files in msg.sock and msg.lock.

o  Andrew Walker <awalker@ixsystems.com>
    * BUG 15164: Leak in wbcCtxPingDc2.
    * BUG 15265: Access based share enum does not work in Samba 4.16+.
    * BUG 15267: Crash during share enumeration.
    * BUG 15271: rep_listxattr on FreeBSD does not properly check for 
reads off
      end of returned buffer.

o  Florian Weimer <fweimer@redhat.com>
    * BUG 15281: Avoid relying on C89 features in a few places.


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

https://www.samba.org/samba/history/samba-4.17.5.html

Our Code, Our Bugs, Our Responsibility.
(https://bugzilla.samba.org/)

                         --Enjoy
                         The Samba Team



