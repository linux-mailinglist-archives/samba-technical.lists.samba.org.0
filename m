Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CF1E2AF0F
	for <lists+samba-technical@lfdr.de>; Mon, 27 May 2019 08:59:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=Qst4ELpe/RVVlrwSeu0pnvqlbU+reryJzyd+2UfA+YA=; b=1Hh4sRQmoo3/bO/cEOzLRJpgmB
	ZfBVcZvdY5JdkRLhOFQSVFtWBvIbi8j2YxiFK/hOaqbI0A86BmJyzXO6bPTwG8hYnv2qqeoCiks/y
	3tntHfH0sLn/IIVcw9Xwz0uQ+KZTttUickiZ6egTVS50unYTPLgSqmOg5VFDh3Ee7SAPdedPaM+Gz
	fAS7jxiLxjXpHmOh7yvM6YyAhriQJHCz/1B7Ejay5YMnIWfqYLAmPf9s2MHc8dMQWyDbqP3HTsvoz
	nD+DnxnekrxvtSNFes5sN9YVJtJvhuJrPUugWlUXtYLSG7EMtpPdLt7XT+0PiN+tPVXi8fDTq6o/M
	8IE/GQJg==;
Received: from localhost ([::1]:28750 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hV9bl-0025e8-5N; Mon, 27 May 2019 06:59:45 +0000
Received: from [2a01:4f8:192:486::147:1] (port=39050 helo=hr2.samba.org) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hV9be-0025e1-Eh
 for samba-technical@lists.samba.org; Mon, 27 May 2019 06:59:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Date:Message-ID:From:To:CC;
 bh=Qst4ELpe/RVVlrwSeu0pnvqlbU+reryJzyd+2UfA+YA=; b=FpP8xzgCdk2tv2iYFlueW053Sh
 PhhDE1k/F5HdZJxYedyTPPEv+UjxocX/5okoX2vKx/Dzrqzm/3nA+X/hTsCHtCiNpvdsez60YJulj
 /nGdlV2qKGBXmZirckOTVqPjl+WT4EVUP6bkPPDkpx2At70LCc6xlRgDdNWc8hvlXuPQ=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1hV9bY-0003fZ-Vu; Mon, 27 May 2019 06:59:33 +0000
Subject: Re: [PATCH] Re: samba-tool fsmo transfer - uncaught exception
To: Douglas Bagnall <douglas.bagnall@catalyst.net.nz>,
 samba-technical@lists.samba.org, =?UTF-8?Q?Julien_Rop=c3=a9?=
 <jrope@linagora.com>
References: <642f86fb-36b6-e647-ec52-e6e93bab2950@linagora.com>
 <b2b6f46b-c819-c917-37f7-ead663bf4cf4@samba.org>
 <1c97651b-c97b-6f38-249b-aff5a091b24e@linagora.com>
 <4f70f827-6b7d-ff57-beaa-6519a8d80633@samba.org>
 <c636364e-f0d9-5c50-4d8e-dddfdda43a67@catalyst.net.nz>
 <9e8c741c-e144-0cdf-2136-d72b8764f2a3@samba.org>
 <228e33ff-1224-fb1e-2f30-60d8934d5675@catalyst.net.nz>
Message-ID: <1e16699e-5067-325a-ba19-eb05013ffd5d@samba.org>
Date: Mon, 27 May 2019 07:59:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <228e33ff-1224-fb1e-2f30-60d8934d5675@catalyst.net.nz>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 27/05/2019 02:28, Douglas Bagnall wrote:
> On 26/05/19 11:22 PM, Rowland penny wrote:
>
>> How do you test for something that works on some computers, but not on
>> others ?
> With Gitlab CI.
>
>> Which is correct, it working, or it not working ?
> Well, when I go
>
> PYTHONPATH=bin/python python3 -c 'import samba; samba.drs_utils.drsException'
>
> I get "module 'samba' has no attribute 'drs_utils'".
>
> Maybe Python 2 was different.
>
>> If you have a problem with the test, take it up with Andrew, I initially
>> created the script following his advice, he later 'improved' it, obviously
>> not enough ;-)
> Yes. It only tests 'samba-tool fsmo show', not 'seize' and 'transfer'.
That is what Andrew wanted at the time, feel free to extend the test.
>
>> Anyway, NACK to your patch, but only because you haven't remove the
>> 'import samba' line.
> OK, though I don't it would work with the line removed.
> For example, it would break
>
>          forest_dn = samba.dn_from_dns_name(samdb.forest_dns_name())
>
> and it *might* break other things too because, as discussed, Python
> imports can be a bit weird with unexpected side-effects.
>
> cheers,
> Douglas

So how do you propose to test for this ? When having just 'import samba' 
fails for 'samba.drs_utils' but works for 'samba.dn_from_dns_name' ? To 
me, this looks like a bug in python.

Rowland


