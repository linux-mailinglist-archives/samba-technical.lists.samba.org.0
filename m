Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B32965780B3
	for <lists+samba-technical@lfdr.de>; Mon, 18 Jul 2022 13:28:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=nlGEsFFkczMcFx7e9Lt8fsF8MPMGFOXbibtkEIs/oew=; b=QDkQCAzfp+DKNFOubiRMrx5mbO
	FV2hgjhvn7vqR9GW9AAk2yhALqqG9psTRJohlYc8EfApxFFQc1SXCrIeqBiLQ+PazMYX7YlYwa6Q8
	ZM077fRpoBYSW4tOwQrpl1jlMQ0OsG3TiKJ5JTtUtU4VM5Ner3ma9a1DKhtxkZBt8FeQTRyUGpj9q
	hBnZAvR1YheyZEx29SNvsEhuxJscMYnMWSIu+scP7Iiyh/U9xv4+U7cx+EKKLEBxvsIsdVAiXGTsK
	ztEKHH0cqjDbU1ek/9O/hNsd3+7ijEpLpCl8+IHHXMw4hQVYYuMou5f1qkpVfvcghEKXolK31Ta73
	MRhmUhEA==;
Received: from ip6-localhost ([::1]:64468 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1oDOuj-000aQo-5Z; Mon, 18 Jul 2022 11:27:49 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:56810) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1oDOuY-000aPr-F6; Mon, 18 Jul 2022 11:27:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=nlGEsFFkczMcFx7e9Lt8fsF8MPMGFOXbibtkEIs/oew=; b=ApWf90Mub5daKb9RxgBfEkv5X1
 Nasma5yAxWMrykcTvQ/VC+IuCLhJcfs4D077VtsnrwT30xDUPm/E6CnBEl6K1IFsgmGnGMX6yZuKn
 eKcQSflhtq+Rc1Jti6tbNSljyhPqjvnk8GTT3g8uZPP2mFJCccjoOvYKokzI4U6HDEjPJUoNXTxLO
 jMDXSPc/ood2fEgjrx/NhWhJfDkL4fWsWUYTVwzz61Y7Y752OjIvRdSxjLnWRYQ4rs8kg3ZLbe+KG
 WUoLhmZ72BhMIirC7DTxm8iu57JKeYHN4b0dlA5zc1xVEr6D3LyiLMW2ZR3CSlH5L+K6PQ6VohaKq
 stXBchtUy7ygpJbhl4z2WdaiaXc3AyLvzQX35j8ymNzgKCcYHExg1GWTZVgdo/Oh5ZHSmFJhh2aBv
 shtI7FZkpZKPHAsWJajcPH4oO9mClAydlH0+Kr4V7votNf+6+6qkQaYdvpG1ddq/O26ysHw84/C0+
 KXEJYwQEhlMqvD2IPqlKekMG;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1oDOuX-005IZO-Ld; Mon, 18 Jul 2022 11:27:37 +0000
Message-ID: <5f40cb27-9fce-196a-8db0-ee9f831e0b01@samba.org>
Date: Mon, 18 Jul 2022 13:27:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: de-DE
To: samba-announce@lists.samba.org, samba@lists.samba.org,
 samba-technical@lists.samba.org
Subject: [Announce] Samba 4.16.3 Available for Download
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


Changes since 4.16.2
--------------------

o  Jeremy Allison <jra@samba.org>
    * BUG 15099: Using vfs_streams_xattr and deleting a file causes a panic.

o  Douglas Bagnall <douglas.bagnall@catalyst.net.nz>
    * BUG 14986: Add support for bind 9.18.
    * BUG 15076: logging dsdb audit to specific files does not work.

o  Samuel Cabrero <scabrero@samba.org>
    * BUG 14979: Problem when winbind renews Kerberos.
    * BUG 15095: Samba with new lorikeet-heimdal fails to build on gcc 
12.1 in
      developer mode.

o  Volker Lendecke <vl@samba.org>
    * BUG 15105: Crash in streams_xattr because fsp->base_fsp->fsp_name 
is NULL.
    * BUG 15118: Crash in rpcd_classic - NULL pointer deference in
      mangle_is_mangled().

o  Noel Power <noel.power@suse.com>
    * BUG 15100: smbclient commands del & deltree fail with
      NT_STATUS_OBJECT_PATH_NOT_FOUND with DFS.

o  Christof Schmitt <cs@samba.org>
    * BUG 15120: Fix check for chown when processing NFSv4 ACL.

o  Andreas Schneider <asn@samba.org>
    * BUG 15082: The pcap background queue process should not be stopped.
    * BUG 15097: testparm: Fix typo in idmap rangesize check.
    * BUG 15106: net ads info returns LDAP server and LDAP server name 
as null.
    * BUG 15108: ldconfig: /lib64/libsmbconf.so.0 is not a symbolic link.

o  Martin Schwenke <martin@meltin.net>
    * BUG 15090: CTDB child process logging does not work as expected.


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

         https://www.samba.org/samba/history/samba-4.16.3.html

Our Code, Our Bugs, Our Responsibility.
(https://bugzilla.samba.org/)

                         --Enjoy
                         The Samba Team

