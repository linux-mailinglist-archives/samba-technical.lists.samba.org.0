Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id DE1D2587354
	for <lists+samba-technical@lfdr.de>; Mon,  1 Aug 2022 23:27:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=Gs/v9zgQQJb/6Wflsz//W0Sl+4mjBKun2gdkLOzJmCg=; b=SgKDd8PK+Br4+cCqvGqgU0pZ75
	cZnnpaumgw3GbpFv7gK8XNbpJ5MGFJF/vKVJDfrilEImeQLNhIs0bpeW0Xn6F2irr/msCc+W7zHCy
	bzqItfBzAplJ2+Vu+K31J+w/fDUqLcR+/hYFHNHzUViwfScsDkCmdY/oaY7RntRglcjs2+g//JEOK
	R09Oqqo+KMOq1QYaPtUDYRPAHkxMooNOS7zskiFQE30meR5V2M277JI0jpvlmON6smzDDJgiJINLv
	y71GyMVfIYdzjbEFBhpbc/cGYj5z4v4Zj7Pt37QaJqp4biaLJSY6AZLooRt2j9rEmjTAU7vZB7Jps
	IikGi2CQ==;
Received: from ip6-localhost ([::1]:30466 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1oIcwL-004rje-LA; Mon, 01 Aug 2022 21:27:05 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:14728) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1oIcwF-004rjV-96
 for samba-technical@lists.samba.org; Mon, 01 Aug 2022 21:27:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=AKKRLvxt7secbaCVJjm89lqP2+hP4veaumNKnZ6kvic=; b=KSD0Hqk2QTH0+XD8Q/L6fGg3pV
 K+zlsITj5rTF8skLL10WHRBZPZ4X64rue3uhE4esnKFpHYoW4nXUblBPokTwyjQnIMaPUvPMowjV6
 c6NQvU8b3Qg9zIoHt6i5g0t+7HUNAu7WWqwphub/O0Zb2A3dmQmxsCU4x2LMXqeSK5OSvObpZJUFd
 /B2uqSfKo9CYwltsdyWzIDfxebv1y1ddxZ5ZNhrghkIyjr0FUrUTLY4yYgeU+Ue0IEAuOpZEfC/z8
 vcOGIru2s24XwO0zuE5sbFEcAOqDirANqqp6q0rStaK45pbLswqNnO7+jyRMwRU/KsMy/v8BF0Ty4
 cOb0TRiQDqu9a+YAMCabhrLqCyPcrz8YuWrUaqmD2EIglX1SZSLgAnICI1A/pAtCQcTy2/Kf7zU0m
 ENyix74F0fR+3MIDBpedT0wWvu4S89TS+0W/lCKx9xWiYyAjqnS6gX3elYwxqdRlIvhVgAXU5PaWl
 UVCPFAd0xgDah3oqemHaXeOS;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1oIcwA-007drI-DP; Mon, 01 Aug 2022 21:26:55 +0000
Message-ID: <87d82860e9aa830a51ba853474bbc6857f9819cf.camel@samba.org>
Subject: Re: running only selected tests in samba sources
To: Michael Tokarev <mjt@tls.msk.ru>, samba-technical
 <samba-technical@lists.samba.org>
Date: Tue, 02 Aug 2022 09:26:48 +1200
In-Reply-To: <587ebe9d-3f91-7389-5ad1-c6d96e435b99@msgid.tls.msk.ru>
References: <587ebe9d-3f91-7389-5ad1-c6d96e435b99@msgid.tls.msk.ru>
User-Agent: Evolution 3.36.5-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
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
From: Andrew Bartlett via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andrew Bartlett <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Mon, 2022-08-01 at 17:35 +0300, Michael Tokarev via samba-technical
wrote:
> Hi!
> Is there a way, after successful build of samba source, to run just
> selected testswithout running whole testsuite, *and* without
> (re)building everything with the--enable-selftest option?
> Many tests do not require this option to be enabled. For a very
> simple example,consider lib/ldb/ tests - when ldb is built from its
> own separate sourcetarball, it's easy to run its tests. But when it
> is built as part of whole sambasource, an attempt to run ldb tests -
> even by providing the right test selection -still fails due to main
> samba wscript checking if --enable-selftest has been enabled.
> In Debian we used to build libldb from its own source, and running a
> testsuite therehas been useful. But now we build it from main samba
> source tree and we can't runthe testsuite anymore.
> Many more other tests can be useful without --enable-selftest too.
> I'm about to patch wscript to omit checks for --enable-selftest
> options in wscripts..

Currently this isn't possible, but in theory the tests that run in the
'none' environment could operate without --enable-selftest as these
would not typically require socket_wrapper et al.
Also socket_wrapper is an LD_PRELOAD these days, so much of the system
might work.
The key is that in third_party/wscript we have:
    if
conf.CONFIG_GET('ENABLE_SELFTEST'):        conf.RECURSE('socket_wrapper
')        conf.RECURSE('nss_wrapper')        conf.RECURSE('resolv_wrapp
er')        conf.RECURSE('uid_wrapper')        if
Options.options.with_pam:            conf.RECURSE('pam_wrapper')
and in selftest/wscript we have:
    if (not CONFIG_SET(opt, 'NSS_WRAPPER') or        not
CONFIG_SET(opt, 'UID_WRAPPER') or        not CONFIG_SET(opt,
'SOCKET_WRAPPER')):        print("ERROR: You must use --enable-selftest 
to enable selftest")        sys.exit(1)
Therefore it would be reasonable to propose a patch for --enable-
production-selftest that does not build the NTVFS file server nor
enables the other C code changes (which are small), but allows most
tests to operate by building the wrapper code.
Andrew Bartlett


-- 
Andrew Bartlett (he/him)       https://samba.org/~abartlet/Samba Team Member (since 2001) https://samba.orgSamba Team Lead, Catalyst IT   https://catalyst.net.nz/services/samba
Samba Development and Support, Catalyst IT - Expert Open SourceSolutions
