Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 49AE87BFF87
	for <lists+samba-technical@lfdr.de>; Tue, 10 Oct 2023 16:46:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=vsxhYj+aStmhUBCiMBJbBYEYmFzdLBzIEDdM3j9QdRs=; b=BUUZR6f8mw/4O9qmcRFYzZMoKR
	5FIQRDRUIdF3vZXRlj386kPPV9ZNLD9Jq3LhSOnMHyFwnbygJubnWvLtc4v69R0mJF9HI0BDljcXp
	hZMsCe03wKvKFv3/GpBUP/9867CdAuTOy8qufIqSd9gWECxAMc5gse8xtKa4y/3jsxnfDdToVRL1r
	21Cu8/k/RFbv3/BWj1Miid4/Zyzi4hKMrxO4mtWNl+JLJlUopoGiivKu1H4tvNLHZcZcs8j7eI0B4
	QfD2Z4G8BtPn6/XVe7jJzzzdFW2A7B4WqeuAm28ankY+wpcgLq7obLOcWOCF0lMb+tijEWzEC5Qar
	8aP/NW/w==;
Received: from ip6-localhost ([::1]:64436 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1qqDzm-000s77-Te; Tue, 10 Oct 2023 14:46:03 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:36396) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1qqDz5-000s60-Fh; Tue, 10 Oct 2023 14:45:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=vsxhYj+aStmhUBCiMBJbBYEYmFzdLBzIEDdM3j9QdRs=; b=uO4GxSv5pwb3TPDPrgifA6gX+P
 lKgjVCzsiw+KxuVnDUbi+1DwtoI5D60L6S+TjuuinqWQpedkETIaXDkYRgD0NjVyUzEGepbH4xW49
 GAPgWSvBuHTMhWYO1VRttBEUsGY1gpTwI6ACv2IA8HCe8Jsn/jxneonAvrN0jbp0uE27cpbgnXqh9
 kK6zzjgMBGDfqf6yLGlxc/waSenBS1taJ2zs4VRJSY0ETc2My8z6oVZcuslOveag3w5HUYG40evI1
 Lv9x1lQiFxPquzobJS2qVeVkgPekrexVLIzo/lN/I7WkkWGoA+DmlPEveK/kD9CecU349KL6uvx4o
 V7V0HkPgYg52KP4Ij9Kc7ozArL4tx+4rF6gsqXBFZOoZLwfaoswhSneVpCfOccfEvOLKQ5Wba8sFu
 UsmEJ4Kx8Is6uP0Qln4lAdkuh6HYmRwocjpvlRYMj0yGrspj149/pp7Smw0pmNIrDPoJkM+eHxIIT
 Reuux2FutNy2PxA+E1ZXm6qn;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1qqDz2-0006en-39; Tue, 10 Oct 2023 14:45:17 +0000
Message-ID: <c07cdbd1-9c8a-400d-b885-63e3862c3150@samba.org>
Date: Tue, 10 Oct 2023 16:45:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: de-DE, en-US
To: samba-announce@lists.samba.org, samba@lists.samba.org,
 samba-technical@lists.samba.org
Subject: Samba 4.19.1, 4.18.8 and 4.17.12 Security Releases are available for
 Download
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

This is a security release in order to address the following defects:


o CVE-2023-3961:  Unsanitized pipe names allow SMB clients to connect as 
root to
                   existing unix domain sockets on the file system.
https://www.samba.org/samba/security/CVE-2023-3961.html

o CVE-2023-4091:  SMB client can truncate files to 0 bytes by opening 
files with
                   OVERWRITE disposition when using the acl_xattr Samba VFS
                   module with the smb.conf setting
                   "acl_xattr:ignore system acls = yes"
https://www.samba.org/samba/security/CVE-2023-4091.html

o CVE-2023-4154:  An RODC and a user with the GET_CHANGES right can view all
                   attributes, including secrets and passwords. 
Additionally,
                   the access check fails open on error conditions.
https://www.samba.org/samba/security/CVE-2023-4154.html

o CVE-2023-42669: Calls to the rpcecho server on the AD DC can request 
that the
                   server block for a user-defined amount of time, denying
                   service.
https://www.samba.org/samba/security/CVE-2023-42669.html

o CVE-2023-42670: Samba can be made to start multiple incompatible RPC
                   listeners, disrupting service on the AD DC.
https://www.samba.org/samba/security/CVE-2023-42670.html


Changes
-------

o  Jeremy Allison <jra@samba.org>
    * BUG 15422: CVE-2023-3961.

o  Andrew Bartlett <abartlet@samba.org>
    * BUG 15424: CVE-2023-4154.
    * BUG 15473: CVE-2023-42670.
    * BUG 15474: CVE-2023-42669.

o  Ralph Boehme <slow@samba.org>
    * BUG 15439: CVE-2023-4091.


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

         https://www.samba.org/samba/history/samba-4.19.1.html
         https://www.samba.org/samba/history/samba-4.18.8.html
         https://www.samba.org/samba/history/samba-4.17.12.html

Our Code, Our Bugs, Our Responsibility.
(https://bugzilla.samba.org/)

                         --Enjoy
                         The Samba Team


