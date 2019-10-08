Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 99607CF51D
	for <lists+samba-technical@lfdr.de>; Tue,  8 Oct 2019 10:37:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=orfiIsq/7sjHQIm5dYCWAbEM4uQp5PqcJoWoBA9i3eA=; b=o2uXxbMCYDArERIrvHPsxqPvFP
	+4Hbwv+X/8fo3URnFRsYtSGCoEA41fDqFF7zZ/qfc5o2DP58m8OCsNgO+SvP90m2yb22MKqI3kxOT
	aXr76wDTRQQ/Ya/fPFo5yxj/EVUZLIhiRw6ssrEbA4w/LQFMZorRBrCZu/1LYWKFrYLzygqD2Iupu
	15Q2Q8BQlzx/6QpsXUPdk9s4qYsOT2/QcDPI43OxbdQytmX3GUscIxUGdDtu1CqVRFlz3d7OmdJmQ
	odo8H2RideTnTSvJJ17ijFfZgtFRJe6dV9hNzE8LpxTwDU/L8FzyTdoyKbaOZ0eu4KeEqLbXF5sEg
	fAGGXFqQ==;
Received: from localhost ([::1]:38682 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iHkzO-0022X1-9w; Tue, 08 Oct 2019 08:37:02 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:53638) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iHkzJ-0022Wu-5N
 for samba-technical@lists.samba.org; Tue, 08 Oct 2019 08:36:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Date:Message-ID:From:Cc:To;
 bh=orfiIsq/7sjHQIm5dYCWAbEM4uQp5PqcJoWoBA9i3eA=; b=ba4ifNGLBLDqlF6HyCsT/rIrKn
 LODzTQ/ZJ86HXoN4f/NKB+mQQAf8p+T66SM+vlwFP0ROxJkoSCG1tHZByxPLt3eOshaYz1ocMBSV9
 oC99CkAQxXC1oqHMQ98y7vq9FuR63arN8W/NJV15uM87dAufBMV9sG8gs9v+SWPj+Y5o=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iHkzI-0004RN-Cv; Tue, 08 Oct 2019 08:36:56 +0000
Subject: Re: Implementing SMB_VFS_FCNTL in Samba
To: Anoop C S <anoopcs@cryptolab.net>, samba-technical@lists.samba.org
References: <7024afc6236a656134f867288cdb37579425e3ee.camel@cryptolab.net>
 <20190923153107.GA4325@jeremy-ThinkPad-X1>
 <98add807a4ac55e5f401522fbdfd47ddf2358d16.camel@cryptolab.net>
 <e9469e1d026b34cf46c0012a463a2fbe610ffd17.camel@cryptolab.net>
 <a71d6def280a3c6125009f3d1eafff54f8f059b4.camel@cryptolab.net>
 <cb57dbab50e84cd24fdccd75530d11d5dbd002ed.camel@cryptolab.net>
 <67b7870a-faed-78bd-8651-6e3226142e70@samba.org>
 <58c5330f19d13a00c107a7d4ddb4c365abb5e067.camel@cryptolab.net>
Message-ID: <67e71164-5e7d-18ee-7cd7-c8c8cb441514@samba.org>
Date: Tue, 8 Oct 2019 10:36:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <58c5330f19d13a00c107a7d4ddb4c365abb5e067.camel@cryptolab.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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
From: Ralph Boehme via samba-technical <samba-technical@lists.samba.org>
Reply-To: Ralph Boehme <slow@samba.org>
Cc: Jeremy Allison <jra@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 10/4/19 11:47 AM, Anoop C S wrote:
> On Fri, 2019-10-04 at 10:38 +0200, Ralph Boehme via samba-technical
> wrote:
>> On 10/3/19 3:20 PM, Anoop C S via samba-technical wrote:
>>> On Thu, 2019-10-03 at 18:43 +0530, Anoop C S via samba-technical
>>> wrote:
>>>> OK. This should be it. I hope attached patch covers the missing
>>>> part
>>>> where recent fcntl() commands are detected during configure. A
>>>> pipeline
>>>> has been completed successfully for the attached patches.
>>>>
>>>> https://gitlab.com/samba-team/devel/samba/pipelines/86263033
>>>>
>>>> Reviews are appreciated.
>>>
>>> Please ignore the previous version which had a typo in checking
>>> HAVE_XX_XX inside vfs_default. Attaching the patches after
>>> correction.
>>
>> nice addition, thanks!
>>
>> One nitpick and one general question.
>>
>> Please don't do function calls in if expressions:
>>
>> if ((val = SMB_VFS_FCNTL(fsp, F_GETFL, 0)) == -1) {
>>     return -1;
>> }
>>
>> Instead:
>>
>> val = SMB_VFS_FCNTL(fsp, F_GETFL, 0);
>> if (val == -1) {
>>     return -1;
>> }
> 
> Right. I was also skeptical in putting it that way(frankly speaking it
> is a copy of current set_blocking() function). :-)
> 
> Please see the new patch set attached.
> 
>> Then, I wonder why you make a copy of va_args in the time_audit and
>> full_audit VFS modules before calling the NEXT function. Can't we
>> just pass the va_list on to the NEXT function?
> 
> Two reasons:
> 
> * Both SMB_VFS_FCNTL and SMB_VFS_NEXT_FCNTL invoke same
> smb_vfs_call_fcntl() function which does a va_start() on the received
> variable arguments.

doh!, of course. Pushed.

Thanks!
-slow

-- 
Ralph Boehme, Samba Team                https://samba.org/
Samba Developer, SerNet GmbH   https://sernet.de/en/samba/
GPG-Fingerprint   FAE2C6088A24252051C559E4AA1E9B7126399E46

