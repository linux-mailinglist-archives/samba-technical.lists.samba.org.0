Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E08CA8B9652
	for <lists+samba-technical@lfdr.de>; Thu,  2 May 2024 10:21:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=Ibh49++6/KJqUt3OEbKKuu32xctARWjsmaJttFojfmI=; b=zcTLiUwq7vafg0lNWXXSCD9cHz
	GPYTmSjdJO/NnFDPRexjpmbv4kZL8t+fvZCqFvQ8hoDqNAZjtZnUHBRb9P/bRlupcUsuTJzvTSEZF
	8m/T2GIylQIg4aKdeFzimI4NtCMyYZP/qJ07iBU9m7zlCHAsB20qiNKoyK0w4T0ygIPocNXooY/oV
	MxO+igq1qZN4PldpaTdbNiM8eY22YZgZSVvoPS4w2upLWbib2lWJhT04B5c01RQib4ipBDbGCm86u
	SOslHIOCf3AsrL1zDJnUEZVIspdkQV3eUbjkBLaPPl39CV540sNXf+d5QZ7pjl5MbJF74Scr4eKPf
	HQEMoqqA==;
Received: from ip6-localhost ([::1]:36054 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1s2RgV-0082gu-6a; Thu, 02 May 2024 08:20:55 +0000
Received: from mail.tranquil.it ([2001:bc8:392f:101::20]:51498) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1s2RgO-0082gn-Ei
 for samba-technical@lists.samba.org; Thu, 02 May 2024 08:20:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tranquil.it; s=mail;
 t=1714638025;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5FnwAjJGEb3jViQalgRT0HKbjZaTVvD0qxQmyRysWCA=;
 b=SweOPcxFb42Soq6NhQQXLXr/BvPVuvZnsToF4gjg7HdZuTtOTtKB/e6lOIy1R9XFr6BQk9
 LuEF0pKQstuDvpZEEGH0CJXW7xM2CyuFrV9EZnYYA9GRRO1W3P1Psg/OhEE+yJc4WwoyGU
 hQZc92vCCkW2MjrEa0r5sSy4OycusuKoZVPlsWOiQjQq0lN+Fqg/B25D7hSvY0eMXlv22I
 ffwB5AM4YrVblw7hAj7LMI3rNNXp7cAatBI/UitdYnDOEO+3awElIRfNxomM9rVvDmXRaH
 DssQKGhL8U0tTlY9dzwMP7WZ3Fr5ofDANdjdZa4bHkPqmJAWLcAigli/cLOOXw==
Message-ID: <b59a1955-884f-4010-a3b9-27455dccdc57@tranquil.it>
Date: Thu, 2 May 2024 10:20:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Fwd: Regression: ldb performance with indexes
To: Andrew Bartlett <abartlet@samba.org>, Andreas Schneider <asn@samba.org>,
 samba-technical@lists.samba.org
References: <4856178.OV4Wx5bFTl@magrathea>
 <b7669c93-fb36-4949-bea0-c295836ebd27@tranquil.it>
 <f09a03b8f405c2cc9a2e97df5576a927eb823cdd.camel@samba.org>
 <2680239.lGaqSPkdTl@magrathea>
 <594a2d2acd1adc9fe9a14214d1f9acdd9548b422.camel@samba.org>
Content-Language: fr
In-Reply-To: <594a2d2acd1adc9fe9a14214d1f9acdd9548b422.camel@samba.org>
X-Spamd-Result: default: False [0.91 / 25.00]; URI_COUNT_ODD(1.00)[19];
 MIME_GOOD(-0.10)[multipart/alternative,text/plain];
 XM_UA_NO_VERSION(0.01)[]; ARC_NA(0.00)[]; FROM_HAS_DN(0.00)[];
 MIME_TRACE(0.00)[0:+,1:+,2:~];
 ASN(0.00)[asn:3215, ipnet:90.115.0.0/17, country:FR];
 RCVD_COUNT_ZERO(0.00)[0]; MID_RHS_MATCH_FROM(0.00)[];
 NEURAL_HAM(-0.00)[-0.975]; FROM_EQ_ENVFROM(0.00)[];
 TO_DN_SOME(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 DKIM_SIGNED(0.00)[tranquil.it:s=mail]; RCPT_COUNT_FIVE(0.00)[5]
X-Rspamd-Action: no action
X-Rspamd-Server: mail.tranquil.it
X-Spamd-Bar: /
X-Rspamd-Queue-Id: 5A115832FC
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
From: =?utf-8?q?Andr=C3=A9as_LEROUX_via_samba-technical?=
 <samba-technical@lists.samba.org>
Reply-To: =?UTF-8?Q?Andr=C3=A9as_LEROUX?= <aleroux@tranquil.it>
Cc: yalemu@tranquil.it, Denis CARDON <dcardon@tranquil.it>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>


Le 01/05/2024 à 02:42, Andrew Bartlett a écrit :
> On Wed, 2024-04-17 at 15:53 +0200, Andreas Schneider wrote:
>> On Friday, 22 March 2024 21:35:27 GMT+2 Andrew Bartlett via samba-technical
>> wrote:
>>> Firstly, these are very impressive improvements.
>> Hi Andréas,
>> I agree, this is great work.
>>   
>>> Thanks so much for your work debugging this and getting to the root of
>>> the problem, this is very much appreciated.
>>> Do you have any data on how much of the improvement is due to ldb
>>> patch, and how much is due to each of the other patches?
>>> Did you happen to use Brendan Greg's FlameGraph tool for the debugging
>>> (this is what we often use), and if so, can you share the graphs?  I
>>> want to understand if perhaps we need to consider restructuring the
>>> caller.
>>> https://www.brendangregg.com/FlameGraphs/cpuflamegraphs.html#Instructions
>>> <https://www.brendangregg.com/FlameGraphs/cpuflamegraphs.html#Instructions> 
>>>
>>> For this series if you could please:
>>>   - send in a send in a Samba Developer Declaration per
>>> https://www.samba.org/samba/devel/copyright-policy.html
>>> <https://www.samba.org/samba/devel/copyright-policy.html>
>>>   - create a gitlab account
>>>   - let me know the username
>>> Once I give you access to the devel repo, so you can run the full
>>> testsuite under our quota, please follow our contribution steps here:
>>> https://wiki.samba.org/index.php/Contribute#Subsequent_Merge_Requests_(and_c
>>> <https://wiki.samba.org/index.php/Contribute#Subsequent_Merge_Requests_(and_c> 
>>>
>>> omplex_first_requests)
>> I didn't see a merge request so far? Any update on that?
> Andréas,
> Thanks for creating a GitLab account and following up on our 
> paperwork. I can see your MR for the tdb_find patches, but it would be 
> awesome if you could raise one for the LDB in-memory-TDB change also.
>
> In the meantime Douglas is running a performance test on our test 
> server to confirm things, but it would be great to move this along so 
> our users can benefit.
>
> Make sure to include your Signed-off-by and
>
> BUG:https://bugzilla.samba.org/show_bug.cgi?id=15590
> Thanks,
> Andrew Bartlett

Hi,

Sorry for the time we are taking to make the MR for these patches, but 
we encountered something weird.

The LDB patch does indeed reduce the schema upgrade time on redhat 7/8/9 
(from about 3 days to one hour) and the LMDB one avoid getting 
MDB_TXN_FULL on large nested transaction. However, with the patches we 
attached the following repro.sh output showing great performances:

|[root@srvads1-bl1cw ~]# bash repro.sh 20000 indexes Added 2 records 
successfully Added 20000 records successfully
| real 0m0.536s user 0m0.798s sys 0m0.105s

But this speedup is only on centos 7. We tried the same patchset on 
alma8/9 but no performance change there and we can't find the reason. 
This improvement was a total side effect because our target was the 
schemaupgrade 2019 (LDB patch) and functionalprep 2016 on large domains 
(LMDB patch).
 From what I saw when debugging, the LDB patch does not affect the flow 
of the repro.sh script, neither does the LMDB patch. So I assume it 
comes from my tdb_find optimization but we can't tell why.

Understanding this may help increase the performances on other 
distributions and, more important, ensure it doesn't have bad side effects.

Thanks,
Andréas Leroux
