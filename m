Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 50371A388B2
	for <lists+samba-technical@lfdr.de>; Mon, 17 Feb 2025 17:06:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=OatB0/Wx35PJ0Zq/I16j14aFPMk+GDDCsaCQu1nfYYY=; b=jLEL24whyiEBxqZXoXDvMv0WQe
	4g+Lhm33Iu1ZYlwkyFrsebVWWRWY5cesLB8jduFbinLBabVtMBjkJ2n5RFVkgAi2YQDimkES8Y025
	cI8PE9YLFMdRRD0nPdFLOEIJbbJgS4PYZXGCfaqO6i7Cx6V4NOlrt0Oonxg3xGSpsL9hWTl4/dWyA
	5abVCxjhR/0lWO930n0wKpy0akkUBUFBgXouDyiSA7a4m42Q8eExV0e4S57/mEMEEj4NUn7/UP9hR
	OpBxCsAw+XvK1g8FMHNtDbNXKAttW+Y+qsLxqq+SlGvXGOaPSSc79r1rsipN+1AhvTI7AIOObjA89
	bGzOBJcQ==;
Received: from ip6-localhost ([::1]:24176 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1tk3cq-00CdSw-BD; Mon, 17 Feb 2025 16:05:40 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:43746) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1tk3cg-00CdSE-IY; Mon, 17 Feb 2025 16:05:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=OatB0/Wx35PJ0Zq/I16j14aFPMk+GDDCsaCQu1nfYYY=; b=QvOWFOh7mXXSPrTw+ATwoJYr33
 k6wonatav4eZqoCKeeNQ01tB95/pqNGjrtvUCdaLU5Of6b8ll7mgh8wnd/Jgw7TwsYgSIvoRTYH7j
 uWqWDznwkxX6J/x7KsPjXZr1xVHMgIKydBGIyMUAJjtIg5mIG0TuqnG7GRhPJRSnMUFFibQmDuqDB
 IMdEQ5SrH1JFyio7BWE7a+2ensgqYYKHJUhDb6Y+gQheSy8n+mut5eyusLbIdXCHOV/ehD3bEjtwO
 UzTrscmcUmuIbh14tPYh5yBYjGJKK6Nz4h2qWheZYq/OHB/mue0+roFp92gWthBONwU7rD6hGyUE6
 VFzfCb/iIN1nPn6rhrdDUTA/K5bI+P/8tyzeszbYu7wTQt0pTi9JUdRVZm3rzRvQLRAjwzkZx/NTY
 A3e2sh1bxXt0KFiB3w+QqWGTn0hI9ivKMjIBuxWkgRcERUgBsg8Hso4bQPCrHbMBvAuGl2ogbyo0/
 k/H8NlgCf018KTSbcRS/5I6s;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1tk3cT-000lMh-09; Mon, 17 Feb 2025 16:05:17 +0000
Message-ID: <f2617fd1-ebd7-4e73-8f9f-60a7f93fc405@samba.org>
Date: Mon, 17 Feb 2025 17:05:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: de-DE
To: samba-announce@lists.samba.org, samba@lists.samba.org,
 samba-technical@lists.samba.org
Subject: [Announce] Samba 4.21.4 Available for Download
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


Changes since 4.21.3
--------------------

o  Vinit Agnihotri <vagnihot@redhat.com>
    * BUG 15780: Increasing slowness of sharesec performance with high 
number of
      registry shares.

o  Jeremy Allison <jra@samba.org>
    * BUG 15782: winbindd shows memleak in kerberos_decode_pac.

o  Douglas Bagnall <douglas.bagnall@catalyst.net.nz>
    * BUG 15738: Creation of GPOs applicable to more than one group is 
impossible
      with Samba 4.20.0 and later.
    * BUG 15756: Replace `crypt` module in
      python/samba/netcmd/user/readpasswords/common.py.

o  Ralph Boehme <slow@samba.org>
    * BUG 15151: vfs_gpfs silently garbles timestamps > year 2106.
    * BUG 15796: Spotlight search results don't show file size and 
creation date.

o  Guenther Deschner <gd@samba.org>
    * BUG 15703: General improvements for vfs_ceph_new module.
    * BUG 15777: net offlinejoin not working correctly.
    * BUG 15780: Increasing slowness of sharesec performance with high 
number of
      registry shares.

o  Pavel Filipenský <pfilipensky@samba.org>
    * BUG 15759: net ads create/join/winbind producing unix dysfunctional
      keytabs.

o  Stefan Metzmacher <metze@samba.org>
    * BUG 14213: Windows Explorer crashes on S-1-22-* Unix-SIDs when 
accessing
      security tab.
    * BUG 15769: The values from hresult_errstr_const and hresult_errstr are
      reversed in 4.20 and 4.21.
    * BUG 15778: Kerberos referral tickets are generated for principals 
in our
      domain if we have a trust to a top level domain.
    * BUG 15783: NETLOGON_NTLMV2_ENABLED is missing in the SamLogon* 
user_flags
      field.

o  Anoop C S <anoopcs@samba.org>
    * BUG 15703: General improvements for vfs_ceph_new module.

o  Andreas Schneider <asn@samba.org>
    * BUG 15784: Regression: stack-use-after-return in 
crypt_as_best_we_can().
    * BUG 15788: libreplace:readline: gcc 15 complains about 
incompatible pointer
      types.

o  Shachar Sharon <ssharon@redhat.com>
    * BUG 15703: General improvements for vfs_ceph_new module.

o  Shweta Sodani <ssodani@redhat.com>
    * BUG 15703: General improvements for vfs_ceph_new module.


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

         https://www.samba.org/samba/history/samba-4.21.4.html

Our Code, Our Bugs, Our Responsibility.
(https://bugzilla.samba.org/)

                         --Enjoy
                         The Samba Team

