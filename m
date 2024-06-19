Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A45090F0F2
	for <lists+samba-technical@lfdr.de>; Wed, 19 Jun 2024 16:42:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=fJF3euKWOtkak2syiTrAmeyvOqXI9O5veBY6962GsMg=; b=ah0AdYpEzM6mzhdjL55il9Ukpv
	D39tyUxiD0oyclac+dtYPsF0UpS+fwuYc0eFIwwZSarTz1lz/oNsFrS9myQdD0yYm618H3M1OcHKh
	1FxQt8vuvJyQ6ZVG10o8OUc+Gagtr71oNGxj3xpRxxPDMPAsHVkRvRpvYVECzDzprK07UM4AsZmr6
	WF2nG9zGUGVpWVyHUwU6xkbTCWnCkucRLBpQ6wUjsiai19Ab9b2lmB/W31iiDlzmPrL0cTmFmz4hk
	3eRaLGSTS2cLcYv5CMWQYEqCdt2Q0woKn4+f6B0TCJPBNqQV698Dj2AaPWtaTsrwhVZtX7CSHzojH
	YJHr9ZiQ==;
Received: from ip6-localhost ([::1]:47836 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1sJwV3-00EVPX-HY; Wed, 19 Jun 2024 14:41:25 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:21188) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1sJwUu-00EVOl-Gp; Wed, 19 Jun 2024 14:41:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=fJF3euKWOtkak2syiTrAmeyvOqXI9O5veBY6962GsMg=; b=oYeDWWsCP8+LgBcRVhXXtmTSF2
 Ae+t5whgQ/1ZcD7onMLLWnlHqRTM1RJRbO7X+oUx71lu0d9jlRuURY8QrJh84B8xnyXPbKynYcOAP
 gfPyCX4Dafs0sfdltTRi6MYhj71RHHPN9HPW5C6F+x20qJVJLgydia/XybFinaDM2e6o5Oe3QViBO
 NwwZxLKEr0hDiEZnLFpqea001UO96UW/1xWO+IyknA5P/kLTycLp8ExBAz2UK8Spj6C1cvNMQNtPw
 J6u968WW4aEEhy3rsWvbCOoN0QQidGdeqZo/mUc4JpBd/1Y1m3+PVWdkgcrZByk/P7QdKQ9cHEaNW
 csm+lyYjRvVCzYjEU0CPIgR0bPvpaQA2C5aaPR0MrmeMW63xON8dvide+iAXWCpnGvSObsXHxrAMl
 eRGio1+j57YS/eBiCbVwYkvHyFzcqpHO8x5GpZ42Pj4+pNJSVLVgSKV7BkT/u7e6X3e1InQ47TU6p
 4nBtHkb7nlIqtH8se6LIAfc9;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1sJwUt-00Hahs-35; Wed, 19 Jun 2024 14:41:16 +0000
Message-ID: <7ee75954-5781-4cdb-a448-42d20a5013b8@samba.org>
Date: Wed, 19 Jun 2024 16:41:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: de-DE
To: samba-announce@lists.samba.org, samba@lists.samba.org,
 samba-technical@lists.samba.org
Subject: [Announce] Samba 4.20.2 Available for Download
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


Changes since 4.20.1
--------------------

o  Jeremy Allison <jra@samba.org>
    * BUG 15662: vfs_widelinks with DFS shares breaks case insensitivity.

o  Douglas Bagnall <douglas.bagnall@catalyst.net.nz>
    * BUG 13213: Samba build is not reproducible.
    * BUG 15569: ldb qsort might r/w out of bounds with an intransitive 
compare
      function.
    * BUG 15625: Many qsort() comparison functions are non-transitive, 
which can
      lead to out-of-bounds access in some circumstances.

o  Andrew Bartlett <abartlet@samba.org>
    * BUG 15638: Need to change gitlab-ci.yml tags in all branches to 
avoid CI
      bill.
    * BUG 15654: We have added new options --vendor-name and --vendor-patch-
      revision arguments to ./configure to allow distributions and 
packagers to
      put their name in the Samba version string so that when debugging 
Samba the
      source of the binary is obvious.

o  Günther Deschner <gd@samba.org>
    * BUG 15665: CTDB RADOS mutex helper misses namespace support.

o  Stefan Metzmacher <metze@samba.org>
    * BUG 13019: Dynamic DNS updates with the internal DNS are not working.
    * BUG 14981: netr_LogonSamLogonEx returns NR_STATUS_ACCESS_DENIED with
      SysvolReady=0.
    * BUG 15412: Anonymous smb3 signing/encryption should be allowed 
(similar to
      Windows Server 2022).
    * BUG 15573: Panic in dreplsrv_op_pull_source_apply_changes_trigger.
    * BUG 15620: s4:nbt_server: does not provide unexpected handling, so 
winbindd
      can't use nmb requests instead cldap.
    * BUG 15642: winbindd, net ads join and other things don't work on 
an ipv6
      only host.
    * BUG 15659: Segmentation fault when deleting files in vfs_recycle.
    * BUG 15664: Panic in vfs_offload_token_db_fetch_fsp().
    * BUG 15666: "client use kerberos" and --use-kerberos is ignored for the
      machine account.

o  Noel Power <noel.power@suse.com>
    * BUG 15435: Regression DFS not working with widelinks = true.

o  Andreas Schneider <asn@samba.org>
    * BUG 15633: samba-gpupdate - Invalid NtVer in 
netlogon_samlogon_response.
    * BUG 15653: idmap_ad creates an incorrect local krb5.conf in case 
of trusted
      domain lookups.
    * BUG 15660: The images don't build after the git security release 
and CentOS
      8 Stream is EOL.


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

         https://www.samba.org/samba/history/samba-4.20.2.html

If you are building/using ldb from a system library, you'll
also need the related updated ldb tarball, otherwise you can ignore it.
The uncompressed ldb tarballs have been signed using GnuPG (ID 
4793916113084025).
The ldb source code can be downloaded from:

https://download.samba.org/pub/ldb/ldb-2.9.1.tar.gz


Our Code, Our Bugs, Our Responsibility.
(https://bugzilla.samba.org/)

                         --Enjoy
                         The Samba Team


