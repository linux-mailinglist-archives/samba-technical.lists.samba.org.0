Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A8EE34830C
	for <lists+samba-technical@lfdr.de>; Wed, 24 Mar 2021 21:44:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=7uP8jFioLCO0S6Y5S7GG1oxfhHHm6hyNhdR3RliSUPo=; b=ukrGgLA/5YId5eNJUY/FGyLc5U
	w2ogx8Oxo6mHRgg0BT8R3gQRAIF0G80S9YVb9lHvW8VBOh0rv4ygo0XMkd+qT3pruolAuRLod/EHQ
	TK8hMUu2TA2Gn9vCDeNwFe2T3NgReTj1DA6hWgP2L7iWxEAkSRN59B8MfRJfkkU1Cvvf5g6Qza4zd
	xoEaJCTev+izglninEClpABdSVjbrU0jMxx3ls412jXMmsw4rsY6gPREb/yVBAZ+fiHuTY9dy8/MC
	EjfurMIXMNytgSClvnytgDt4i8Nbj7H0TzAMmfG8h202o+1h/xwYCniprJxzeSpzdJH5A6xvIBnXc
	p715NpGg==;
Received: from ip6-localhost ([::1]:54708 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lPAMM-006elz-DE; Wed, 24 Mar 2021 20:44:10 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:34476) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lPAMH-006els-Hy
 for samba-technical@lists.samba.org; Wed, 24 Mar 2021 20:44:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=7uP8jFioLCO0S6Y5S7GG1oxfhHHm6hyNhdR3RliSUPo=; b=038ZHg6XRvKgQrx6q4d3ZiwezA
 dyJSilt0oUdoD9Pt9KRdAG7/t5JZ9/0UCbFk153aGnPKLWjTDbetD+dYk558q/j0gru8Z8k+KKqyq
 CU0Mr7x6cDHgztzA7Kx59rBExZJqkLgWYhiDWfV5R/xOp2CP76CSxLKt7Zyve1D2+8abAHdbLuSiz
 3oNbFpFcZBXAHKktWVy964srNjLoDRl4a1Cr19y1S2czApE7RYRifuUsH7APawDEQ3iRibQI6ORW/
 +EDOSvz8Ipy3YZukmp35l6vQh3dk6gLAydKrKQkd4UUJTosCXbhEmVpIxR1nYY9cq5M9dP8Ds26eH
 HvdtHxDSPDNzHCdQ83FwgZky5vnPWorBhXGINoPdN45tWie9NZ4Skrkv3sljkRoKIR6nz7Vq695S0
 ydRiSGzWULsy3jBeHY94sLXnRclqx6dtCSKXD9Hcz+NfVVW6Ubg1o/CC1Pl70e8KElO2nNJZ9wZ9h
 HCVj2+bdmATwF1n7/oEwY05O;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lPAMG-0008T8-Dc; Wed, 24 Mar 2021 20:44:04 +0000
Subject: Re: Drop NIS support
To: Andrew Bartlett <abartlet@samba.org>, Ralph Boehme <slow@samba.org>,
 samba-technical@lists.samba.org
References: <4045140.l1vqqZ3lm0@magrathea>
 <20210324161244.GB818616@jeremy-acer>
 <3742e07eba544478383ae1a7e9e56197beb12616.camel@samba.org>
 <359f492d-7dbd-2e95-1c8c-3178d9e51344@samba.org>
 <5f50518b-d317-f5ff-d9dd-a34497c21873@samba.org>
 <4e8cd599-96e5-361d-28c7-ff26082a7644@samba.org>
 <190c273a00fe5b37f6dd494d4296acfcceb2ca2b.camel@samba.org>
Message-ID: <eae366ce-7751-27bd-bb7b-fe4b7c5bc286@samba.org>
Date: Wed, 24 Mar 2021 20:44:03 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <190c273a00fe5b37f6dd494d4296acfcceb2ca2b.camel@samba.org>
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

On 24/03/2021 20:23, Andrew Bartlett wrote:
> On Wed, 2021-03-24 at 20:16 +0000, Rowland penny via samba-technical
> wrote:
>> On 24/03/2021 20:11, Ralph Boehme wrote:
>>> Am 3/24/21 um 6:57 PM schrieb Rowland penny via samba-technical:
>>>> On 24/03/2021 17:52, Andrew Bartlett via samba-technical wrote:
>>>>> On Wed, 2021-03-24 at 09:12 -0700, Jeremy Allison via samba-
>>>>> technical
>>>>> wrote:
>>>>>> On Wed, Mar 24, 2021 at 05:10:15PM +0100, Andreas Schneider
>>>>>> via
>>>>>> samba-technical wrote:
>>>>>>> Hi,
>>>>>>>
>>>>>>> could we drop NIS support for Samba 4.15?
>>>>>>>
>>>>>>> This means getting rid of lib/replace/system/nis.h and
>>>>>>> yp_*() ...
>>>>>> +1 from me. Let's see if anyone else is still
>>>>>> using it.
>>>>>>
>>>>>> So the current list for 4.15 will be Tru64, HPUX, NIS.
>>>>>>
>>>>>> Any more for any more ?
>>>>> Just to be clear to others, this is not the so-called NIS
>>>>> support in
>>>>> the AD DC which at one point helped Active Directory Users and
>>>>> Computers managed the rfc2307 user attributes.
>>>>>
>>>>> I'm happy for the real NIS support to go.
>>>>>
>>>>> In terms of other things to trim, what about some of the
>>>>> printing
>>>>> modes?
>>>>>
>>>>> Andrew Bartlett
>>>>>
>>>> How about idmap_hash ? The one that says 'DO NOT USE THIS
>>>> BACKEND' at
>>>> the top of its manpage.
>>> ...unless you know what you're doing.
>>>
>>> There are folks out there using this at scale so removing this is
>>> not
>>> really something we should consider.
>>>
>>> -slow
>>>
>> Well according to the manpage 'DO NOT USE THIS BACKEND', they
>> shouldn't
>> be using it, you cannot have it both ways.
> Rowland, the 'on new installations' is silent, but implied.


It might be to you, but to a normal user it isn't readily known.

>
>> Either it shouldn't be used,
>> or those warnings need to be removed from the manpage.
> The world is not always so black and white (and would be far more
> boring if it was).


You are entering into dangerous waters there, you are not supposed to 
mention what you mentioned 😂

>
> Andrew Bartlett
>

OK, how about this, I rewrite the idmap_hash manpage to say that it is 
only retained for existing users but must not be used for new installations.

Rowland



