Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id F1F6162A468
	for <lists+samba-technical@lfdr.de>; Tue, 15 Nov 2022 22:46:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=GorzhNlLy2CUnSttD6xN3ZKm2l+jCnTou1wfGA33enc=; b=s6CnJiAVY8XIWV2biEKcI3cClh
	PlZdVl4HgUAAjT4V+0vN0AjtXSN/WtYO4QSmbuLt1NBl6b94DTropiFeDsr0AmhAYcX7MnqeK95Bj
	AqSwiGAIn1e7MkBpVsGKafY3/02z6rRNS/WnzIqtyO9eBN0tFP9/OUMFSB4cCjnRU2B2rYf6GxmGP
	Ura3byKztvt3oXfStCuNPxRpv74n6SKoNQt2S9X7cqiYNoyvo4T5SQ0jGn/1ZX5u4rGF89pXlQcf1
	nnc0QX3bGbgICaSf7ncnI0u6rQ9q/AsJeIK70KiiJ7acS1qhtiHMYXo0zJqFuFbeX8iSdXuAFCuKp
	hPNEi+NA==;
Received: from ip6-localhost ([::1]:51118 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ov3kS-00E2Sq-6r; Tue, 15 Nov 2022 21:45:40 +0000
Received: from isrv.corpit.ru ([86.62.121.231]:49435) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ov3kM-00E2O3-OI
 for samba-technical@lists.samba.org; Tue, 15 Nov 2022 21:45:36 +0000
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id EC9B940199;
 Wed, 16 Nov 2022 00:45:32 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id 886E53D3;
 Wed, 16 Nov 2022 00:45:30 +0300 (MSK)
Message-ID: <e26f27be-382d-2f1c-6df8-7768e75ee467@msgid.tls.msk.ru>
Date: Wed, 16 Nov 2022 00:45:30 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: failing tests in the testsuite on debian
Content-Language: en-US
To: Jeremy Allison <jra@samba.org>, samba-technical@lists.samba.org
References: <4197c161-ef1e-3710-f50e-7631ddaf5f3f@msgid.tls.msk.ru>
 <de87d255-95d0-ac34-1544-fa0aac441f4b@msgid.tls.msk.ru>
 <66781199-ab84-1c05-3224-ed65cb9b12bc@msgid.tls.msk.ru>
 <Y3PPjghJzwYBPlAN@jeremy-acer>
 <1f00b2cd-2368-b6a5-ef70-b917dd42794c@msgid.tls.msk.ru>
 <Y3P3m2FJToHADDcF@jeremy-acer> <Y3QEifrtj+5RHwjA@jeremy-acer>
In-Reply-To: <Y3QEifrtj+5RHwjA@jeremy-acer>
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

16.11.2022 00:28, Jeremy Allison via samba-technical wrote:
..
>> Yes, the DOS attributes are stored in an EA.
>>
>> Tests that create EA's should be run against a share
>> using vfs objects including vfs_xattr_tdb so they
>> don't depend on the underlying filesystem for EA
>> support.
>>
>> I see the bug. The definition of [tmpenc]
>> has:
>>
>> vfs objects = dirsort
>>
>> It should be:
>>
>> vfs objects = dirsort xattr_tdb
>>
>> as you're running it against a filesystem
>> (tmpfs) that doesn't support EAs.

Yes, it fixes the failure on a filesystem which does not support
user EAs (tmpfs is one of them, it supports system EAs but not user).

> Try this patch. Let me know if it fixes it and
> I'll try it in a ci-build.

Yes, I already gave it a try right after your previous email.
It immediately fixed the first out of 4 issues I wrote about in
the same email above.

I was more concerned about the other failures, and once again tried
to address these, now once you gave me some clues about where things
are defined (the thing to search was "[tmpenc]", so I found
selftest/target/Samba3.pm file.

So yes, this one is fixed by using xattr_tdb.  And I can't dig there
anymore today to see where the other 4 tests are failing -- I'm just
too tired now, need some rest.

I'll try to find out why the other 3 are failing tomorrow, hopefully.

Thank you for the support!

/mjt

