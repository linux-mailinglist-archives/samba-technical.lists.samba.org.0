Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 8085E91D6FC
	for <lists+samba-technical@lfdr.de>; Mon,  1 Jul 2024 06:28:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=JNZ9FrtaQETUpdZowvZ+IcNui9daqHf3AAK8Su4qRRg=; b=CFgRxVTJ9OgxTCMhR2+vJx+Vzg
	L7K9brLvQMJDGe4VNhtOsfEU1DlKIggbkl4TLe8dSYdJDLnnfo2obkaZfWUgNQs69TqyWBRnW35/y
	lyfM5GEmzu/2P+T20qkyeBMkOnAz0wQzbojVaRd75+hpZtMEfZ+Yyg9q7bi+8VdYCWMMaRBPOtJw0
	cZskqjXvwN2jVwQiiFeWmKqUUBFsiU7sTpAKJ6AAd28vK0Wy2PRgj5Mx7UZLz2poSnSHNUzJZ9VM0
	uFa93g8YCSpj5QeNG6q+/sTMlag1G6LTdWz1YNq5GvOoxvnRnd7FnOERNLucl+SCVl6wzdGEUJqiA
	gdyg5lpg==;
Received: from ip6-localhost ([::1]:38346 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1sO8dX-002x7v-UZ; Mon, 01 Jul 2024 04:27:32 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:31720) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1sO8dT-002x7n-2Z
 for samba-technical@lists.samba.org; Mon, 01 Jul 2024 04:27:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:Cc:To:Date:Message-ID;
 bh=JNZ9FrtaQETUpdZowvZ+IcNui9daqHf3AAK8Su4qRRg=; b=TD3Z7SdxlqX6BDVtC1Lbd+A2mk
 RvDZCEssWBMPcCfv2Yw3sgA6x1DoMbuAGeEU4cmRKL3fHmX0u3+eUkcpfCz4NCXnibR81gupVP3M1
 yijYTq2jWXGTQk4Sv35S86+UXAu8qyiSmJHTsVsJ6s9iCpOiP/Fp+DdR+OYLqkIivdc7rjZ1foofc
 XkZsGWunn6tKjfwGQqZ/ykZGWWGpNCgFQYWVIC/NRy+qR83RuYlq1RyaW2PLQ5Ic8R1DrKMsLd8Gf
 Ba3R1GVeeW4aJgeF2bxyr7hrOIi8Bnj6mmUCTmA6bkor/t9B5KwvapKq4dbWj/sfQ2GLk6nCOldGU
 uPgWb9MPRDoRHImNLKFyG17DD3Qlort27Oo5un5wtJFIiKpBciOAf/+o8htTZ8UmP8lRAbmTeQz7H
 yH30LtOcReNZSVh5/Xk6JloCFIgQU2MIYavdt40lOSAN0WdBJxanMm+VXjq8xD0u+6pXrtbLulmv1
 XKBYereTc5cYhu5K49eZbyYd;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1sO8dR-001jSH-2N; Mon, 01 Jul 2024 04:27:26 +0000
Message-ID: <e7c529cf-6b3b-47d5-b438-d4e96eed33ee@samba.org>
Date: Mon, 1 Jul 2024 16:27:17 +1200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Announce] Samba 4.19.7 Available for Download
To: samba-technical@lists.samba.org
References: <efc3606d-23f0-442c-a994-46fb374b7bc3@samba.org>
Content-Language: en-GB
In-Reply-To: <efc3606d-23f0-442c-a994-46fb374b7bc3@samba.org>
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
From: Jo Sutton via samba-technical <samba-technical@lists.samba.org>
Reply-To: Jo Sutton <jsutton@samba.org>
Cc: Jule Anger <janger@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 11/06/24 3:42 am, Jule Anger via samba-technical wrote:
> Release Announcements
> ---------------------
> 
> This is the latest stable release of the Samba 4.19 release series.
> 
> 
> Changes since 4.19.6
> --------------------
> 
> o  Douglas Bagnall <douglas.bagnall@catalyst.net.nz>
>     * BUG 15569: ldb qsort might r/w out of bounds with an intransitive 
> compare
>       function (ldb 2.8.1 is already released).
>     * BUG 15625: Many qsort() comparison functions are non-transitive, 
> which can
>       lead to out-of-bounds access in some circumstances (ldb 2.8.1 is 
> already
>       released).
> 
> o  Andrew Bartlett <abartlet@samba.org>
>     * BUG 15638: Need to change gitlab-ci.yml tags in all branches to 
> avoid CI
>       bill.
> 
> o  Stefan Metzmacher <metze@samba.org>
>     * BUG 14981: netr_LogonSamLogonEx returns NR_STATUS_ACCESS_DENIED with
>       SysvolReady=0.
>     * BUG 15412: Anonymous smb3 signing/encryption should be allowed 
> (similar to
>       Windows Server 2022).
>     * BUG 15573: Panic in dreplsrv_op_pull_source_apply_changes_trigger.
>     * BUG 15642: winbindd, net ads join and other things don't work on 
> an ipv6
>       only host.
> 
> o  Anna Popova <popova.anna235@gmail.com>
>     * BUG 15636: Smbcacls incorrectly propagates inheritance with 
> Inherit-Only
>       flag.
> 
> o  Noel Power <noel.power@suse.com>
>     * BUG 15611: http library doesn't support  'chunked transfer encoding'.
> 
> 
> #######################################
> Reporting bugs & Development Discussion
> #######################################
> 
> Please discuss this release on the samba-technical mailing list or by
> joining the #samba-technical:matrix.org matrix room, or
> #samba-technical IRC channel on irc.libera.chat.
> 
> If you do report problems then please try to send high quality
> feedback. If you don't provide vital information to help us track down
> the problem then you will probably be ignored.  All bug reports should
> be filed under the Samba 4.1 and newer product in the project's Bugzilla
> database (https://bugzilla.samba.org/).
> 
> 
> ======================================================================
> == Our Code, Our Bugs, Our Responsibility.
> == The Samba Team
> ======================================================================
> 
> 
> 
> ================
> Download Details
> ================
> 
> The uncompressed tarballs and patch files have been signed
> using GnuPG (ID AA99442FB680B620).  The source code can be downloaded
> from:
> 
>          https://download.samba.org/pub/samba/stable/
> 
> The release notes are available online at:
> 
>          https://www.samba.org/samba/history/samba-4.19.7.html
> 
> 
> If you are building/using ldb from a system library, you'll
> also need the related updated ldb tarball, otherwise you can ignore it.
> The uncompressed ldb tarballs have been signed using GnuPG (ID 
> 4793916113084025).
> The ldb source code can be downloaded from:
> 
> 
> https://download.samba.org/pub/ldb/ldb-2.8.1.tar.gz
> 
> 
> Our Code, Our Bugs, Our Responsibility.
> (https://bugzilla.samba.org/)
> 
>                          --Enjoy
>                          The Samba Team
> 
> 
> 

Hi, I’m not sure if this is the right place to report this, but a recent 
Samba 4.19 CI pipeline gave me the following error:

2024-07-01 03:59:51,858 samba-def-build: [check-clean-tree] Running cd 
/tmp/samba-testbase/samba-def-build && script/clean-source-tree.sh in 
'/tmp/samba-testbase/samba-def-build/.'
The tree has 1 new uncommitted files!!! see stderr
==> /builds/samba-team/devel/samba/samba-def-build.stderr <==
The tree has 1 new uncommitted files!!!
git clean -n
Would remove lib/ldb/ABI/pyldb-util-2.8.1.sigs
2024-07-01 03:59:52,263 samba-def-build: [check-clean-tree] failed 'cd 
/tmp/samba-testbase/samba-def-build && script/clean-source-tree.sh' with 
status 1

It appears that the file lib/ldb/ABI/pyldb-util-2.8.1.sigs is missing 
from the release?

Cheers,
Jo (she/her)

