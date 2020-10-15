Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 45FAC28F83C
	for <lists+samba-technical@lfdr.de>; Thu, 15 Oct 2020 20:14:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=JNswzbTzx9l/Bf57AbPrOvYHoLr5xmJiihjVThwJJ+Y=; b=P4T4I8KWAZ2Fthv7bzXObVr1f3
	L3bEUILdMLsTIHofE90qKoB+G6JXj06W9xwEQFaqDZ6d7Gsdc9tPVEXVInAKzteU40oqSpTvDmZ0z
	9E188A4A70M0l8KfX0dzmRrN5Ubx4tBa5My1CPM5gLPfQd+5W/JJfUIjkA+8o0yKwyNRTZAawJL3v
	aQ9N6NWCmXrpFOglYlVk1gcdaZOd/lA11cJ5xdG3Kh+AH/wWUFUbJeUdMaBE6hMjQm3Gw9VV7Re2T
	ZtXcLD9vmmvMKVTmcGxX5obmqkUJnN2lQLKDPuseTRhD1jAxeo/9RT3bW9E2pAg9T9qVW9q3HHMID
	RDtF/nKw==;
Received: from ip6-localhost ([::1]:55098 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kT7lW-00CITm-Je; Thu, 15 Oct 2020 18:14:14 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:27264) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kT7lR-00CITf-4R
 for samba-technical@lists.samba.org; Thu, 15 Oct 2020 18:14:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:Cc:To;
 bh=JNswzbTzx9l/Bf57AbPrOvYHoLr5xmJiihjVThwJJ+Y=; b=2ReUziZmsIfehKCPf12FzEg3j2
 2ORNsNuw2f83g7xaXVez0YqieXZ7js2XxL6o0EKkBVkJp21BnzuIp4D+Z5SHwO+15v1B52rRUF8/z
 aL45H8UGb7hz5nk2ksDYHcNTDy/G9eoc7rOQ2HMaF3onoHg1j4pGfSp63hYml4Mq0XQ6uttoMI1gE
 Ev9kWCoveMIRujJtyqZ17qKjcfuQn0CUTWat7CmUv3BitKuDk4wxzpDNKfF3UJaPkSR5JjkUJYH3V
 Iv78PP9KN2Q+SXQgKso8iXfjHHYxYg6gHz/GeRC1NmnvSvUiL2cWKGcusy2rtPm4Se6QAlrMWITTT
 P2sClsM1RYMqsL/MUCRG1VRwHaw1BCqCLzDAe/dAeZiWUyF+gD0g57VzBEe/EpFQrW20xDLw4TSeB
 UPJ2WaLsHezTSIuDM/FXRrUUX3jCpowphvyGmaGO/PV61b4sgbDz3yAa/Rd26OVQAgGl616XB9R/S
 UlUi7bvGx2OyTqqRFnTCXRiq;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kT7lQ-0002UE-6f; Thu, 15 Oct 2020 18:14:08 +0000
Subject: Re: [PATCH] Documentation: Rename Samba's DCO to Samba Contributor
 Representation
To: Jeremy Allison <jra@samba.org>, "Bradley M. Kuhn" <bkuhn@sfconservancy.org>
References: <87mu0nidll.fsf@ebb.org> <20201015180510.GE3769001@jeremy-acer>
Message-ID: <2231b5de-fa06-db61-feb0-08ad0374673e@samba.org>
Date: Thu, 15 Oct 2020 19:14:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201015180510.GE3769001@jeremy-acer>
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
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 15/10/2020 19:05, Jeremy Allison via samba-technical wrote:
> On Thu, Oct 15, 2020 at 10:49:26AM -0700, Bradley M. Kuhn via samba-technical wrote:
>> Samba Developers,
>>
>> As you know, it's rare that Conservancy offers specific patches upstream to
>> our projects, but I've submitted a merge request here:
>>          https://gitlab.com/samba-team/samba/-/merge_requests/1609
>> and I've also attached the patch here.
>>
>> As many of you may know, Jeremy Allison originally requested that the
>> Samba's Contributor Representation be named DCO as a tribute to Linux and
>> its DCO.
>>
>> But, for a variety of reasons, I (with this patch) recommend to change the
>> name.  Also included is some cleanup work regarding the copyright and
>> license on the DCO text itself.
> Sorry Bradley,
>
> I guess I screwed up in calling our Samba contributor
> agreement a "DCO" as that's what Linux uses, but ours
> is different from theirs.
>
> In my defense I just thought that's what such things
> were supposed to be called.
>
> Plus I didn't notice the original text was copyrighted
> and under a CC-By-SA license, so we should certainly
> fix that.
>
> Sorry :-(.
>
> RB+ from me.
>
> Jeremy.
>
>>  From 2f011583294626e9919db7d8ddc7961a2f177f4a Mon Sep 17 00:00:00 2001
>> From: "Bradley M. Kuhn" <bkuhn@sfconservancy.org>
>> Date: Thu, 15 Oct 2020 07:52:21 -0700
>> Subject: [PATCH] Rename Samba's DCO to Samba Contributor Representation
>>
>> In an effort to reduce perceived confusion about the quite necessary
>> differences between the Samba DCO and the Linux DCO, and as a favor
>> to the Linux community, rename the Samba DCO to the Samba Contributor
>> Representation.
>>
>> Additionally, note that the text is copyrighted and add notice for
>> compliance with the text's license, CC-By-SA.
>>
>> Signed-off-by: Bradley M. Kuhn <bkuhn@sfconservancy.org>
>> ---
>>   README.contributing | 13 +++++++++++--
>>   1 file changed, 11 insertions(+), 2 deletions(-)
>>
>> diff --git a/README.contributing b/README.contributing
>> index 2a44e37f9e8..c4a0c7f4bc9 100644
>> --- a/README.contributing
>> +++ b/README.contributing
>> @@ -48,7 +48,7 @@ your employer, simply email a copy of the following text
>>   from your corporate email address to contributing@samba.org
>>   
>>   ------------------------------------------------------------
>> -Samba Developer's Certificate of Origin. Version 1.0
>> +Samba Contributor Representation, Version 1.0
>>   
>>   By making a contribution to this project, I certify that:
>>   
>> @@ -95,7 +95,7 @@ above, add a line that states:
>>   Signed-off-by: Random J Developer <random@developer.example.org>
>>   
>>   using your real name and the email address you sent the original email
>> -you used to send the Samba Developer's Certificate of Origin to us
>> +you used to send the Samba Contributor Representation to us
>>   (sorry, no pseudonyms or anonymous contributions.)
>>   
>>   That's it ! Such code can then quite happily contain changes that have
>> @@ -113,3 +113,12 @@ Have fun and happy Samba hacking !
>>   
>>   The Samba Team.
>>   
>> +
>> +The "Samba Contributor Representation, Version 1.0" is:
>> +  (C) 2013 Software Freedom Conservancy, Inc.
>> +  (C) 2005 Open Source Development Labs, Inc.
>> +
>> +licensed under Creative Commons Attribution-ShareAlike 4.0 License as found
>> +at https://creativecommons.org/licenses/by-sa/4.0/legalcode and based on
>> +"Developer's Certificate of Origin 1.1" as found at
>> +http://web.archive.org/web/20070306195036/http://osdlab.org/newsroom/press_releases/2004/2004_05_24_dco.html
>> -- 
>> 2.26.1
>>
>> -- 
>> Bradley M. Kuhn - he/him
>> Policy Fellow & Hacker-in-Residence at Software Freedom Conservancy
>> ========================================================================
>> Become a Conservancy Supporter today: https://sfconservancy.org/supporter
>
Hang on, what is wrong with calling it a 'DCO' ?

With 'DCO' (Developer's Certificate of Origin), even I (a total thicko) 
can understand what it means, I have no idea what 'Contributor 
Representation' means.

Rowland



