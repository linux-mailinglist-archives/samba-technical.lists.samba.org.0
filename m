Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 94D4261DDD5
	for <lists+samba-technical@lfdr.de>; Sat,  5 Nov 2022 20:43:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=xrIhzyCH7q4vhb6WVZccCc0oQYOUb/G6q2OgrWjQjqI=; b=gBGFqiogpjQ6VTx9jkvVluStFn
	cb3KW/igK3Opat951HPnBn36J6GHBgW+hK/crRc++VB8PFRf1hYkKemv5g7H0bh73UdFD2KL+ocYK
	PLBvpT8rKY0eDxJImLrgDq+x6/77S9u+ZICfnwHYuvF/1SRhuOcLAyeUJ6zZbswvqx6EH48FJgfg6
	LoUEClHWBqkdZKjFbi0jRuCMO1eiIwwPSYSU3pYSUiWfxmb90RKvfMSL2ObQqebN0Uf/tFUTZODCk
	UeCI8uKGf/QQjk9UMK3GrkU/D5BcCR8P/oii5W9zy6PeeBwa76Nc8O7T2iol8DM4chOTvpBMpwHPi
	+TbH1Vyg==;
Received: from ip6-localhost ([::1]:59106 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1orP3k-00B2NI-Pb; Sat, 05 Nov 2022 19:42:28 +0000
Received: from isrv.corpit.ru ([86.62.121.231]:41499) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1orP3g-00B2N9-52
 for samba-technical@lists.samba.org; Sat, 05 Nov 2022 19:42:26 +0000
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 1756C40547;
 Sat,  5 Nov 2022 22:42:22 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id E32D63D3;
 Sat,  5 Nov 2022 22:42:24 +0300 (MSK)
Message-ID: <c966ec75-7a6f-796a-7c4f-e46c9acf082e@msgid.tls.msk.ru>
Date: Sat, 5 Nov 2022 22:42:18 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: building all targets in samba for install?
Content-Language: en-US
To: Andrew Bartlett <abartlet@samba.org>, samba-technical@lists.samba.org
References: <07424568-38ce-8f3d-4bd4-b0e9bd0e6532@msgid.tls.msk.ru>
 <19170baa4c6e96304aa37e7df24de324a14b3fb5.camel@samba.org>
In-Reply-To: <19170baa4c6e96304aa37e7df24de324a14b3fb5.camel@samba.org>
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

05.11.2022 22:21, Andrew Bartlett via samba-technical wrote:
> On Sat, 2022-11-05 at 21:29 +0300, Michael Tokarev via samba-technical
> wrote:
...
>> In order to overcome this, I currently use `make install'
>> twice: the first time, as the build user, to install things
>> into a scratch throw-away place, - just to force all things
>> to be built.  Next I remove the installed files, and perform
>> install once again, now as root, into proper place with
>> proper file ownership.
>>
>> Is there a way to eliminate this middle fake install step?
> 
> Not currently, but you could use the fake install step as your main
> build step if you wanted to.

Yeah, that's what I do, as I wrote above.
It's just too ugly, but ok, and it works :)

Thank you!

/mjt


