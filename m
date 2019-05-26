Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id CEE442A961
	for <lists+samba-technical@lfdr.de>; Sun, 26 May 2019 13:23:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=ph9FNaNYClt5BfXltGulRtJAwaaNlqXZa96SHw1Noo4=; b=s2fmUXc5N+MSTodKrMKFmRuCiP
	qPXtxWj99ErcRQDer405Pz+MEfSEsaui/+12IsVgBbhlCV5sxaWzqs5zE3Tk8Tdy3Vo+uRb7aUWXE
	WCZMBUP0QgNmDUygpXsmVOhh8+MbnC8fbNtA5G7EVSQjDA5XziokoKIV4eZlf/5vDfwnkZRvXg8Ll
	xRUeNU0A4apnOA3uLemQnlJruku4por58b/XAopalc6h652uHd+NexkMXqOgM1Qxtt/khHmTrt3bC
	K2b9mHztcgTt/P8G3K7eTtsFe/sjnArfnI9vURlPf14XJnzGVJLQVh2PhTyJt9OCRMetKoll3JDfv
	UHyhCwvQ==;
Received: from localhost ([::1]:21184 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hUrEg-001uIb-Ql; Sun, 26 May 2019 11:22:42 +0000
Received: from [2a01:4f8:192:486::147:1] (port=56414 helo=hr2.samba.org) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hUrEc-001uIU-9S
 for samba-technical@lists.samba.org; Sun, 26 May 2019 11:22:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Date:Message-ID:From:To:CC;
 bh=ph9FNaNYClt5BfXltGulRtJAwaaNlqXZa96SHw1Noo4=; b=AvqkTGSz371pmx5H21JfCVdXOu
 7/gzZbmz7WyxGksrA5+4qch/gs/VVduBesUqkTYn1qJQF6XWNJShmYtCk0tsYz96Fz9x/CGsVXNbo
 mnk9E1lTdBB9zWyzjJXzx1X9UmezhkZFojeS/qkZt5GWXj2x3fxUISDspYls+Zpq4AAk=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1hUrEV-0006Mj-JX; Sun, 26 May 2019 11:22:31 +0000
Subject: Re: [PATCH] Re: samba-tool fsmo transfer - uncaught exception
To: Douglas Bagnall <douglas.bagnall@catalyst.net.nz>,
 samba-technical@lists.samba.org, =?UTF-8?Q?Julien_Rop=c3=a9?=
 <jrope@linagora.com>
References: <642f86fb-36b6-e647-ec52-e6e93bab2950@linagora.com>
 <b2b6f46b-c819-c917-37f7-ead663bf4cf4@samba.org>
 <1c97651b-c97b-6f38-249b-aff5a091b24e@linagora.com>
 <4f70f827-6b7d-ff57-beaa-6519a8d80633@samba.org>
 <c636364e-f0d9-5c50-4d8e-dddfdda43a67@catalyst.net.nz>
Message-ID: <9e8c741c-e144-0cdf-2136-d72b8764f2a3@samba.org>
Date: Sun, 26 May 2019 12:22:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <c636364e-f0d9-5c50-4d8e-dddfdda43a67@catalyst.net.nz>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-BeenThere: samba-technical@lists.samba.org
X-Mailman-Version: 2.1.23
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

On 26/05/2019 11:59, Douglas Bagnall wrote:
> Rowland Penny  wrote:
>>> Transferring other roles doesn't cause an issue, but as I understand,
>>> only the DNS-related roles require the drs_utils module.
>>>
>>>
>>> Note that the transfer seems to be effective in the end, as shown with
>>> the command "samba-tool fsmo show". But this exception makes me think
>>> that something did not complete.
>>>
>>>
>> It seems to be failing whilst trying to replicate the changes, which
>> shouldn't be a big problem, because normal replication should do it.
>>
>> What I am struggling to get my head around is, why does 'import samba'
>> fail when 'import samba.drs_utils' doesn't ?
> Because Python imports are strange like that. The samba module is not
> actually a "module", it is a "package".
>
>
> Earlier Julien Ropé wrote:
>> These show the error was found in 4.5, 4.6 and 4.7.
>>
>> Each time, the solution was to modify the file "[samba]/lib/python27/site-packages/samba/netcmd/fsmo.py", by adding the line "import samba.drs_utils".
>> I have verified that this fixes the issue for me.
>>
>>
>> I understand the problem is not seen in every environment, but it still seems to be there for some users.
>> If this issue is known and the fix is so easy, why isn't it applied?
> Probably because nobody supplied the change in a patch format, or if
> somebody did, they weren't persuasive enough. Perhaps they didn't open
> bugzilla bugs.
>
>> If this is because there is something wrong with the environments of the people that see it, what should they (we) do to fix it? Is editing the code ourselves a good solution, or does that hide something else we should look at in our environment?
> The real fault is in python/samba/tests/samba_tool/fsmo.py which
> *should* test this but does not.
>
> cheers,
> Douglas

How do you test for something that works on some computers, but not on 
others ?

Which is correct, it working, or it not working ?

If you have a problem with the test, take it up with Andrew, I initially 
created the script following his advice, he later 'improved' it, 
obviously not enough ;-)

Anyway, NACK to your patch, but only because you haven't remove the 
'import samba' line.

Rowland


