Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id BED48348476
	for <lists+samba-technical@lfdr.de>; Wed, 24 Mar 2021 23:20:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=pKmt+r82+pUb4U/YNguQTkZi8O8qABOsxqfkrvUbgtE=; b=xfTbyaalN9TM25EOthIFgBl7SG
	YsM3of597lBb/i3g59PSt2Yht0Y4+I17tbdcKpVaEDeMbz67NMr27yOcV1+HsN4HSN+af5hXLbtrP
	eB7tayxIHctCg/YcIFbdlWpjeVUJaDdtNdq75gy289e/T/LEGGv13/ETWgGJlhWUacKeK1JJ6+wT3
	l2pqvMcActd4OhP2ZBlGUeBeijf7RvNO1s7j0SBflC5rMe6sRYM4y+rGdVCt1SDJAIHU60k13Uj60
	RnrhxWGaXebyqYiep7iQZnPB0NsmD4hkY/JOOp+S0tG4vDi/5T7xNqwb6yzjgvQAGSY2pWr5ai83X
	ulA2ZFRg==;
Received: from ip6-localhost ([::1]:61454 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lPBrA-006fme-MZ; Wed, 24 Mar 2021 22:20:04 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:62156) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lPBr5-006fmX-U2
 for samba-technical@lists.samba.org; Wed, 24 Mar 2021 22:20:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=pKmt+r82+pUb4U/YNguQTkZi8O8qABOsxqfkrvUbgtE=; b=EK7ycuBACYjZvDpldPsJHk5v6s
 6DvT4aYEbUTTA4QgxvKYDZ73Ipiekxy7jNJNNWF4elvDGbiqwbUKJ1AFivpbnqIYtk+KUk5o9MgFC
 i4PkenQZlG4djgQ9UaDmy3UEWmQa9GmnC3FGh6l/Dc5VZO5HyZc5PSq2yuFjuNaJTakYRRMjjFpBd
 kJ2RNWdi/kO8SZZlkF3CdIuw4FDGJExmgp31CY9QN7XSDaDE9OkAGw2E1aLoOGyQUYhvFDb4yS9l0
 +/mDrIBxfz0L/+5C0AHWUFJ3I9HAWDytgPc01KrupygZi6aDEd8ad6rMOJ01Lm5g8Qk6RyMcC25jg
 afi+E//D+5AG/6mq8vhCtzstETtL2QKaoXzjQPkcsdN9YSLqMyzybPOzg17zUfCx0a28BoOiGS3xm
 A8xb0DBFQL1t0Cymo3vu6vO1jKN9YKDJKIOg0XnHejmaGr4ACT5dE+haRZtH2kycxQyqR4eHJXXmZ
 2YMbYxyxGI3aFbB/yEznyjB9;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lPBr4-0000oj-PA; Wed, 24 Mar 2021 22:19:58 +0000
Subject: Re: Drop NIS support
To: Ralph Boehme <slow@samba.org>, Andrew Bartlett <abartlet@samba.org>,
 samba-technical@lists.samba.org
References: <4045140.l1vqqZ3lm0@magrathea>
 <20210324161244.GB818616@jeremy-acer>
 <3742e07eba544478383ae1a7e9e56197beb12616.camel@samba.org>
 <359f492d-7dbd-2e95-1c8c-3178d9e51344@samba.org>
 <5f50518b-d317-f5ff-d9dd-a34497c21873@samba.org>
 <4e8cd599-96e5-361d-28c7-ff26082a7644@samba.org>
 <190c273a00fe5b37f6dd494d4296acfcceb2ca2b.camel@samba.org>
 <eae366ce-7751-27bd-bb7b-fe4b7c5bc286@samba.org>
 <a76c4d92-4b3a-0d42-15eb-aea8951781da@samba.org>
Message-ID: <d38770d4-0665-efc1-1ab4-6d41f3868497@samba.org>
Date: Wed, 24 Mar 2021 22:19:58 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <a76c4d92-4b3a-0d42-15eb-aea8951781da@samba.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
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

On 24/03/2021 21:29, Ralph Boehme wrote:
> Am 3/24/21 um 9:44 PM schrieb Rowland penny:
>> On 24/03/2021 20:23, Andrew Bartlett wrote:
>>> On Wed, 2021-03-24 at 20:16 +0000, Rowland penny via samba-technical
>>> wrote:
>>>> On 24/03/2021 20:11, Ralph Boehme wrote:
>>>>> Am 3/24/21 um 6:57 PM schrieb Rowland penny via samba-technical:
>>>>>> On 24/03/2021 17:52, Andrew Bartlett via samba-technical wrote:
>>>>>>> On Wed, 2021-03-24 at 09:12 -0700, Jeremy Allison via samba-
>>>>>>> technical
>>>>>>> wrote:
>>>>>>>> On Wed, Mar 24, 2021 at 05:10:15PM +0100, Andreas Schneider
>>>>>>>> via
>>>>>>>> samba-technical wrote:
>>>>>>>>> Hi,
>>>>>>>>>
>>>>>>>>> could we drop NIS support for Samba 4.15?
>>>>>>>>>
>>>>>>>>> This means getting rid of lib/replace/system/nis.h and
>>>>>>>>> yp_*() ...
>>>>>>>> +1 from me. Let's see if anyone else is still
>>>>>>>> using it.
>>>>>>>>
>>>>>>>> So the current list for 4.15 will be Tru64, HPUX, NIS.
>>>>>>>>
>>>>>>>> Any more for any more ?
>>>>>>> Just to be clear to others, this is not the so-called NIS
>>>>>>> support in
>>>>>>> the AD DC which at one point helped Active Directory Users and
>>>>>>> Computers managed the rfc2307 user attributes.
>>>>>>>
>>>>>>> I'm happy for the real NIS support to go.
>>>>>>>
>>>>>>> In terms of other things to trim, what about some of the
>>>>>>> printing
>>>>>>> modes?
>>>>>>>
>>>>>>> Andrew Bartlett
>>>>>>>
>>>>>> How about idmap_hash ? The one that says 'DO NOT USE THIS
>>>>>> BACKEND' at
>>>>>> the top of its manpage.
>>>>> ...unless you know what you're doing.
>>>>>
>>>>> There are folks out there using this at scale so removing this is
>>>>> not
>>>>> really something we should consider.
>>>>>
>>>>> -slow
>>>>>
>>>> Well according to the manpage 'DO NOT USE THIS BACKEND', they
>>>> shouldn't
>>>> be using it, you cannot have it both ways.
>>> Rowland, the 'on new installations' is silent, but implied.
>>
>>
>> It might be to you, but to a normal user it isn't readily known.
>>
>>>
>>>> Either it shouldn't be used,
>>>> or those warnings need to be removed from the manpage.
>>> The world is not always so black and white (and would be far more
>>> boring if it was).
>>
>>
>> You are entering into dangerous waters there, you are not supposed to 
>> mention what you mentioned 😂
>>
>>>
>>> Andrew Bartlett
>>>
>>
>> OK, how about this, I rewrite the idmap_hash manpage to say that it 
>> is only retained for existing users but must not be used for new 
>> installations.
>
>
> nah, it can be used for new installations just fine. I'll try to look 
> into this tomorrow and discuss a better wording with metze.
>
> -slow
>

You might want to read this thread from 2017:

https://lists.samba.org/archive/samba-technical/2017-February/118705.html

Rowland



