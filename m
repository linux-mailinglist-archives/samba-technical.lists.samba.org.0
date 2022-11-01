Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id C73276147A0
	for <lists+samba-technical@lfdr.de>; Tue,  1 Nov 2022 11:22:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=pQbIu7wiD9XmbIQ00We2+2L1AVOJuaQiR2SP1Q1Unxc=; b=LTz48e+otqJ9jflA95oyV706im
	iQIyC+HyqXxjs0/OO+URNWbQlekH1FfM/vZ0/9GIQXXLKpwJs8dImswJrmsAfkgXIP/3M1yhA5+Ax
	4lPOlZ1dkOf/6c9E1h2y2O7N93y/JutjkRoraK6LZOU2EUHeFCz0LICVktYxvua/sa2EBRsKsu9vy
	qu102JY2sbvxLvRzsGyi7Whhc9FHtG1oNu7jrA56yxbHtIWjIQVXsX+OQkEbvTLaxiFIuwPEf95hl
	Jco0RfE2hVq2cJtxiAoshtnjCG9RzCsX+hvP6Uv1xzoRq4+Ra1ZdHyyG2qWf98I8Xm6XIHNa10mB2
	X4cgx8sQ==;
Received: from ip6-localhost ([::1]:50360 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1opoPE-009pCp-Nh; Tue, 01 Nov 2022 10:22:04 +0000
Received: from isrv.corpit.ru ([86.62.121.231]:58485) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1opoP8-009pCe-Kd
 for samba-technical@lists.samba.org; Tue, 01 Nov 2022 10:22:01 +0000
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 01D0D40175;
 Tue,  1 Nov 2022 13:21:55 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id 024B73D3;
 Tue,  1 Nov 2022 13:21:59 +0300 (MSK)
Message-ID: <29df69a5-e95a-1235-ded8-c0ed56bcf635@msgid.tls.msk.ru>
Date: Tue, 1 Nov 2022 13:21:55 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: samba-libs: Possible policy violation (now with unnecessary
 soname bump libndr.so.2 => libndr.so.3)
Content-Language: en-US
To: Ralph Boehme <slow@samba.org>, Michael Stone <mstone@debian.org>,
 1013259@bugs.debian.org, Andrew Bartlett <abartlet@samba.org>,
 =?UTF-8?Q?Pavel_Filipensk=c3=bd?= <pfilipen@redhat.com>,
 Andreas Schneider <asn@samba.org>,
 samba-technical <samba-technical@lists.samba.org>
References: <165571437894.409869.15645128981524194043.reportbug@dhcp-1.rz.nm-ict.de>
 <d5dbe20a-592d-11ed-a0b8-0dc32809422e@msgid.mathom.us>
 <21220e0e-8c2c-f9ed-402f-6d95f1489d0b@msgid.tls.msk.ru>
 <C5F51D22-A00B-4165-966E-EA4724984304@debian.org>
 <165571437894.409869.15645128981524194043.reportbug@dhcp-1.rz.nm-ict.de>
 <d5341d49-8d32-9ec2-b78e-8fa2ab4ea0f0@msgid.tls.msk.ru>
 <3c737677-d905-2657-bad5-d00deaa73043@tls.msk.ru>
 <8753e50d-5041-ae56-8b94-acee48afd32a@msgid.tls.msk.ru>
 <a7bc19e7-ba95-8d9f-3d0e-69efeabb4b9f@samba.org>
In-Reply-To: <a7bc19e7-ba95-8d9f-3d0e-69efeabb4b9f@samba.org>
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

01.11.2022 13:14, Ralph Boehme wrote:
> On 11/1/22 09:15, Michael Tokarev via samba-technical wrote:
>> Control: tag -1 + upstream
>>
>> Original context was at http://bugs.debian.org/1013259 , but whole
>> thing *now* has is about completely unnecessary soname bump of libndr
>> in 4.17 due to debugging refinements.
> 
> to me this looks like a packaging bug.

It indeed is, I fixed it already.

The question remains though: why the .3 bump happened in the first
place, due to a change just in a debug helper routine, which was
trivial to avoid (like I've shown in the patches just posted to
the list).

The problem here is that there are just too many interdependencies
between various libraries, and to me anyway, it is important to
keep sonames when possible (and easy to do like in this case!).
For example: libndr.so NEEDED libgenrand-samba4.so which is
an internal samba library. So you can't easily provide *two*
libndr.so.2 and libndr.so.3 on the system, unless you *also*
install two different sets of internal libs. So on any soname
bump, a real recompile of all users is needed. That's the
reason to be more careful when doing soname bumps..

Thanks,

/mjt

