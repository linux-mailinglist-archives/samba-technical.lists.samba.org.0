Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C93128F95A
	for <lists+samba-technical@lfdr.de>; Thu, 15 Oct 2020 21:23:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=gJiVPW12LKcDFBvvOsdVwIsWEjxE+qLXX355yfrsdKE=; b=qrmDtilloMjoxA9FMmQL4OW53M
	SlCtT4Rqrz+L11tgw8cLLRG6QwSWN0+BJS+Tt7g+Ai/Q+7TEFxVMn1Qcd52Kr1FLuMdnyGCCsIs8B
	2E/85IEzaugJF2mLmNX+alg353QSqLTSJjnjdsxsLo1l33mpIh8W62Qqnrw/IIuew80WgA202iKNW
	gwrnHMAa9w7ZdRQUVH5wRP60gOhamIjavTdhDOc/UcBq0ac2a//q2KZI/DFmA/O3JRsBm/xfqi5dz
	KYpOLEG7BJvavuQHllfhgVxmih5z3yyjCOJyAENCjyXUaYr8F0Qnin0ZkXvdrOOx+TaGgMnMCckFR
	JnjfbsbQ==;
Received: from ip6-localhost ([::1]:60962 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kT8q1-00CJNW-8K; Thu, 15 Oct 2020 19:22:57 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:48258) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kT8pw-00CJNP-8b
 for samba-technical@lists.samba.org; Thu, 15 Oct 2020 19:22:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=gJiVPW12LKcDFBvvOsdVwIsWEjxE+qLXX355yfrsdKE=; b=u0SutUHq+NzsIBAGgtzXOVIS8q
 QgLFyBOw+2KePv8qhqKfOakwBI+RICkYl+SPU0tFr8n83UcS/IbRZmAFibTQjEfhGl+BB2JA88JEN
 YBYgGOlZfP5S5wcfM6uYZY25eOf1RPBcwRtKkz0VvOae3lGGtCnY/fieiL4q25JgEHJuEE9NUtqCe
 ktHAgegMJqBYiO2PdXynrheT70qiobCMkn3ghVEtitzZ3z4AmvAPhnoiE6MNnV/q0o3YcGv5Oz5Uj
 VdPIoVnx8X82PBOo0BLPMwhtU3/mYL7bwWG0sxMyjFcjrhnynzIPN5I1IxhkiNBupLwEDsjWWQBZu
 jMjhpNzfjPWUUcbyjIOe+t5edGRhnTgQ0YQHo8t0Jr0tf2e7YP9z2C6woklkKqTLCVjVtgIL0wtMd
 uYpCK7jQYHDC9Eefo0g+wkVu5Emy1oQ9j43X7EP8Nng+TVFNikDDCbMiVO2+BJmUMfRCdve2pWijP
 wEdDsoRH7DXGtF0MORQSWLcW;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kT8pv-0003T7-OD; Thu, 15 Oct 2020 19:22:51 +0000
Subject: Re: [PATCH] Documentation: Rename Samba's DCO to Samba Contributor
 Representation
To: Simo Sorce <idra@samba.org>, samba-technical@lists.samba.org
References: <87mu0nidll.fsf@ebb.org> <20201015180510.GE3769001@jeremy-acer>
 <2231b5de-fa06-db61-feb0-08ad0374673e@samba.org>
 <f70291dc95eb0eae98e23c2897cbcfa9376e90e9.camel@samba.org>
Message-ID: <f488fa4d-4b8f-3323-ec1b-d3cf54819fac@samba.org>
Date: Thu, 15 Oct 2020 20:22:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <f70291dc95eb0eae98e23c2897cbcfa9376e90e9.camel@samba.org>
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

On 15/10/2020 20:14, Simo Sorce via samba-technical wrote:
> [Resending as originally sent from wrong address and bounced]
>
> On Thu, 2020-10-15 at 19:14 +0100, Rowland penny via samba-technical
> wrote:
>> On 15/10/2020 19:05, Jeremy Allison via samba-technical wrote:
>>> On Thu, Oct 15, 2020 at 10:49:26AM -0700, Bradley M. Kuhn via
>>> samba-technical wrote:
>>>> Samba Developers,
>>>>
>>>> As you know, it's rare that Conservancy offers specific patches
>>>> upstream to
>>>> our projects, but I've submitted a merge request here:
>>>>           
>>>> https://gitlab.com/samba-team/samba/-/merge_requests/1609
>>>> and I've also attached the patch here.
>>>>
>>>> As many of you may know, Jeremy Allison originally requested that
>>>> the
>>>> Samba's Contributor Representation be named DCO as a tribute to
>>>> Linux and
>>>> its DCO.
>>>>
>>>> But, for a variety of reasons, I (with this patch) recommend to
>>>> change the
>>>> name.  Also included is some cleanup work regarding the copyright
>>>> and
>>>> license on the DCO text itself.
>>> Sorry Bradley,
>>>
>>> I guess I screwed up in calling our Samba contributor
>>> agreement a "DCO" as that's what Linux uses, but ours
>>> is different from theirs.
>>>
>>> In my defense I just thought that's what such things
>>> were supposed to be called.
>>>
>>> Plus I didn't notice the original text was copyrighted
>>> and under a CC-By-SA license, so we should certainly
>>> fix that.
>>>
>>> Sorry :-(.
>>>
>>> RB+ from me.
>>>
>>> Jeremy.
>>>
>>>>   From 2f011583294626e9919db7d8ddc7961a2f177f4a Mon Sep 17
>>>> 00:00:00 2001
>>>> From: "Bradley M. Kuhn" <bkuhn@sfconservancy.org>
>>>> Date: Thu, 15 Oct 2020 07:52:21 -0700
>>>> Subject: [PATCH] Rename Samba's DCO to Samba Contributor
>>>> Representation
>>>>
>>>> In an effort to reduce perceived confusion about the quite
>>>> necessary
>>>> differences between the Samba DCO and the Linux DCO, and as a
>>>> favor
>>>> to the Linux community, rename the Samba DCO to the Samba
>>>> Contributor
>>>> Representation.
>>>>
>>>> Additionally, note that the text is copyrighted and add notice
>>>> for
>>>> compliance with the text's license, CC-By-SA.
>>>>
>>>> Signed-off-by: Bradley M. Kuhn <bkuhn@sfconservancy.org>
>>>> ---
>>>>    README.contributing | 13 +++++++++++--
>>>>    1 file changed, 11 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/README.contributing b/README.contributing
>>>> index 2a44e37f9e8..c4a0c7f4bc9 100644
>>>> --- a/README.contributing
>>>> +++ b/README.contributing
>>>> @@ -48,7 +48,7 @@ your employer, simply email a copy of the
>>>> following text
>>>>    from your corporate email address to contributing@samba.org
>>>>    
>>>>    ------------------------------------------------------------
>>>> -Samba Developer's Certificate of Origin. Version 1.0
>>>> +Samba Contributor Representation, Version 1.0
>>>>    
>>>>    By making a contribution to this project, I certify that:
>>>>    
>>>> @@ -95,7 +95,7 @@ above, add a line that states:
>>>>    Signed-off-by: Random J Developer <random@developer.example.org
>>>>    
>>>>    using your real name and the email address you sent the
>>>> original email
>>>> -you used to send the Samba Developer's Certificate of Origin to
>>>> us
>>>> +you used to send the Samba Contributor Representation to us
>>>>    (sorry, no pseudonyms or anonymous contributions.)
>>>>    
>>>>    That's it ! Such code can then quite happily contain changes
>>>> that have
>>>> @@ -113,3 +113,12 @@ Have fun and happy Samba hacking !
>>>>    
>>>>    The Samba Team.
>>>>    
>>>> +
>>>> +The "Samba Contributor Representation, Version 1.0" is:
>>>> +  (C) 2013 Software Freedom Conservancy, Inc.
>>>> +  (C) 2005 Open Source Development Labs, Inc.
>>>> +
>>>> +licensed under Creative Commons Attribution-ShareAlike 4.0
>>>> License as found
>>>> +at https://creativecommons.org/licenses/by-sa/4.0/legalcode and
>>>> based on
>>>> +"Developer's Certificate of Origin 1.1" as found at
>>>> +
>>>> http://web.archive.org/web/20070306195036/http://osdlab.org/newsroom/press_releases/2004/2004_05_24_dco.html
>>>> -- 
>>>> 2.26.1
>>>>
>>>> -- 
>>>> Bradley M. Kuhn - he/him
>>>> Policy Fellow & Hacker-in-Residence at Software Freedom
>>>> Conservancy
>>>> =================================================================
>>>> =======
>>>> Become a Conservancy Supporter today:
>>>> https://sfconservancy.org/supporter
>> Hang on, what is wrong with calling it a 'DCO' ?
> The original license for DCO 1.0 did not permit it, this[1] is the only
> reference I can still find.
>
>        If you modify you must use a name or title distinguishable from
>        "Developer's Certificate of Origin" or "DCO" or any confusingly
>        similar name.
>
>
> The current DCO (1.1), in contrast, does not permit modifications at
> all.
>
>> With 'DCO' (Developer's Certificate of Origin), even I (a total
>> thicko) can understand what it means,
> Maybe you really do, but to me it never meant anything until explained
> anyway. The first time I saw the name I wondered why they want to know
> where *I* am from.
Well possibly, but then I have read the 'Linux Foundations' DCO
>
>>   I have no idea what 'Contributor Representation' means.
> That's why you read the text and figure it out, it is just a name and
> is as good as the original in terms of clarity IMO.
>
> HTH,
> Simo.
>
> [1]
> https://web.archive.org/web/20060524185355/http://www.osdlab.org/newsroom/press_releases/2004/2004_05_24_dco.htm

I will accept your non working link and raise you a working one:

https://developercertificate.org/

Yes it does say:

Everyone is permitted to copy and distribute verbatim copies of this
license document, but changing it is not allowed.

So, if we use that, we *cannot* change its name.

Rowland




