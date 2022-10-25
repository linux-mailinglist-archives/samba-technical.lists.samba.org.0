Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 0827060C7C2
	for <lists+samba-technical@lfdr.de>; Tue, 25 Oct 2022 11:17:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=kY1TeW5Hjy3NXiGzvbm1P3uWVGYz5Zoxno2j07oLzvQ=; b=pfSAV+EEwcgtFiPoPoLOjDRf5r
	Kn+RoQ6aOUNelBIhW9NyXLG3hexNW1Uu+0zNhRdKVC5K+fpjUKe57LZPNmRI5CAuSequO790t6AFd
	GFSVUco7oD7KmWSBt8anuEaJFmT1iLMGy4QK9s4g3K0BFcmuY1+aTXnMeJD4MUnWIMMsNHuPfCn30
	o0bhyHmP0jl79tJ14KfsLgU37W6M24/FmhfzjX3LSIxAeh1YAGZYmV3+kaXbsWH5LJ2sNzCcFRPT1
	ZTbXKt82zTFVpuxKV4w0ikErDaXxxrP8+CatG0Fymz+jwKXHETbPmgGj2YKD8l11V2C3FKaw3AX62
	SlUi0IlA==;
Received: from ip6-localhost ([::1]:46066 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1onG35-005nyx-0C; Tue, 25 Oct 2022 09:16:39 +0000
Received: from isrv.corpit.ru ([86.62.121.231]:44177) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1onG30-005nxM-BW
 for samba-technical@lists.samba.org; Tue, 25 Oct 2022 09:16:36 +0000
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 375C140D93;
 Tue, 25 Oct 2022 12:16:31 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id 5CA1513A;
 Tue, 25 Oct 2022 12:16:34 +0300 (MSK)
Message-ID: <7fc71093-524a-2936-32c6-c41d83777569@msgid.tls.msk.ru>
Date: Tue, 25 Oct 2022 12:16:30 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: running only selected tests in samba sources
Content-Language: en-US
To: Andreas Schneider <asn@samba.org>,
 samba-technical <samba-technical@lists.samba.org>
References: <587ebe9d-3f91-7389-5ad1-c6d96e435b99@msgid.tls.msk.ru>
 <5854748.lOV4Wx5bFT@magrathea>
In-Reply-To: <5854748.lOV4Wx5bFT@magrathea>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
From: Michael Tokarev via samba-technical <samba-technical@lists.samba.org>
Reply-To: Michael Tokarev <mjt@tls.msk.ru>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

[Rehashing a relatively old thread]

19.08.2022 09:40, Andreas Schneider via samba-technical wrote:
> On Monday, 1 August 2022 16:35:15 CEST Michael Tokarev via samba-technical
> wrote:
>> Hi!
> 
> Hi Michael,
>   
>> Is there a way, after successful build of samba source, to run just selected
>> tests without running whole testsuite, *and* without (re)building
>> everything with the --enable-selftest option?
> 
> you can find documentation in our wiki here:
> 
> https://wiki.samba.org/index.php/Writing_Torture_Tests#Running_tests

All this applies to a build with --enable-selftest. My question was how
it is possible to run certain tests (like ldb selftests for example)
without building whole thing with --enable-selftest.

> Improvements are welcome :-)

I'd love to if I knew how to do that ;)

/mjt

