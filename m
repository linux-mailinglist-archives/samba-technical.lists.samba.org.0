Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id CB5A13482B4
	for <lists+samba-technical@lfdr.de>; Wed, 24 Mar 2021 21:16:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=3m04rEJTWzCzCK3FJqfIIZXHfoHF/d+8ko4a0EyRsrY=; b=fTByNyC3p9WVCcyafX1I7TPO8B
	RWq2yZonCzugHtecemR/brZaUdnyBpznPhDy4b3JbXQKUBiWOCZLzzzzW5m4mha9ge66oHeUELnLV
	0ItQg/wjAhDqq8QZwAmX4am71cqQYY48uHdF3JAji7GURZTs2nqXehnJRlw+ozxt/+cBFFcdDLvOK
	jYKjRihXW/o/I1BM2rC++c1DanESnKn8kjOOVei+H8O31t4PQ0a0BHIau6bA3rrMsAoIyXYv4LVS9
	9ZD44n7KfFFAvBgx1dEpNDD4qfWCCSQLVh/rQvVD8mPR+UgLcYBVufvUoKyehgG06tQhFXiR3cBwy
	8lLV8AdQ==;
Received: from ip6-localhost ([::1]:51078 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lP9vR-006eGZ-Cd; Wed, 24 Mar 2021 20:16:21 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:26206) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lP9vM-006eGR-Ld
 for samba-technical@lists.samba.org; Wed, 24 Mar 2021 20:16:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=3m04rEJTWzCzCK3FJqfIIZXHfoHF/d+8ko4a0EyRsrY=; b=VQqNXSAQP4OO+Qtp3SjNel4G6k
 Yz8IaPR/wHhfPmMHW2PM3pLxZuZ4vsEuDrR4XiVfAun04Qsjvt9duiqG4RSpWcv0v2VsJIvIC+696
 tf0x9EVW4dV9ikljpJRifH34BgG64ypidOCSPd0wCVaPQoup9hYWKhimZaxPWQRzve8XiilFMoGKj
 O1cxX0elK3fSpRr6jCyHv8VQ2wBzWIp7i2WCn9OrSmsElpShpWciH38lSBxIyXS8dNiHwDgKv5NzQ
 g0TecaeeBYOUJFJowuRIKAF5+ajgxJiKhUbPzb3gqca2mKWKJIzbalqyHruKEaVpFK2A3M1bk8lJ6
 jFhs9csgtU2sIqyb8ge5LqARhS+FcPtASSdc+zgFFZK90xXLh6G7fq9ItE6KbzUIoyThaLCbDEPom
 yDw83P9InHFq8pdMQoQGIz0lzfgZFPT/nnXDMNraRyHrqoTUXJlXuUFoa0C0dgBfr+KuNsZyd/TbR
 Kic+p1V+dA1QP441hVPMxICk;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lP9vM-0008Bu-8t; Wed, 24 Mar 2021 20:16:16 +0000
Subject: Re: Drop NIS support
To: Ralph Boehme <slow@samba.org>, samba-technical@lists.samba.org
References: <4045140.l1vqqZ3lm0@magrathea>
 <20210324161244.GB818616@jeremy-acer>
 <3742e07eba544478383ae1a7e9e56197beb12616.camel@samba.org>
 <359f492d-7dbd-2e95-1c8c-3178d9e51344@samba.org>
 <5f50518b-d317-f5ff-d9dd-a34497c21873@samba.org>
Message-ID: <4e8cd599-96e5-361d-28c7-ff26082a7644@samba.org>
Date: Wed, 24 Mar 2021 20:16:15 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <5f50518b-d317-f5ff-d9dd-a34497c21873@samba.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
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
From: Rowland penny via samba-technical <samba-technical@lists.samba.org>
Reply-To: Rowland penny <rpenny@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 24/03/2021 20:11, Ralph Boehme wrote:
> Am 3/24/21 um 6:57 PM schrieb Rowland penny via samba-technical:
>> On 24/03/2021 17:52, Andrew Bartlett via samba-technical wrote:
>>> On Wed, 2021-03-24 at 09:12 -0700, Jeremy Allison via samba-technical
>>> wrote:
>>>> On Wed, Mar 24, 2021 at 05:10:15PM +0100, Andreas Schneider via
>>>> samba-technical wrote:
>>>>> Hi,
>>>>>
>>>>> could we drop NIS support for Samba 4.15?
>>>>>
>>>>> This means getting rid of lib/replace/system/nis.h and yp_*() ...
>>>> +1 from me. Let's see if anyone else is still
>>>> using it.
>>>>
>>>> So the current list for 4.15 will be Tru64, HPUX, NIS.
>>>>
>>>> Any more for any more ?
>>> Just to be clear to others, this is not the so-called NIS support in
>>> the AD DC which at one point helped Active Directory Users and
>>> Computers managed the rfc2307 user attributes.
>>>
>>> I'm happy for the real NIS support to go.
>>>
>>> In terms of other things to trim, what about some of the printing
>>> modes?
>>>
>>> Andrew Bartlett
>>>
>> How about idmap_hash ? The one that says 'DO NOT USE THIS BACKEND' at 
>> the top of its manpage.
>
> ...unless you know what you're doing.
>
> There are folks out there using this at scale so removing this is not 
> really something we should consider.
>
> -slow
>

Well according to the manpage 'DO NOT USE THIS BACKEND', they shouldn't 
be using it, you cannot have it both ways. Either it shouldn't be used, 
or those warnings need to be removed from the manpage.

Rowland



