Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 44D4A7584E
	for <lists+samba-technical@lfdr.de>; Thu, 25 Jul 2019 21:47:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=8c82UxTx83jyhhFLnHrZnDv3DQzBHaRPWruiUafhTVc=; b=CtWn0BOK2IQN0NVGyLgBc15ezu
	xTK9tK+yWIyPRM3eb/c5yqvDb/rqY6jQUcDDoSXTPHRhaRTFq0gOs1+vypeBcXwxRHafkZ6p2rKAV
	02zthlRvKR8oebPbzDcC3/Enso3w9p29nvq7ydysac0SwqWmouqv6j+m9OD1Hc7rf5GOKLKy3X/dX
	ONz7x5LlfmxhXq0zMJUPyd/2LU7d3GjCwOQ98298mnFLHlrV7iyy1I3lzekjJQpYV0a0LTfLg/TQL
	cqQuieQYNxvp/qtWCFPr6dYqgwXfItNdLrvJVl2hhImTZ33Qi//SdeJKKqyfNj2JrPCppKrNg8P6f
	2CtkMsJg==;
Received: from localhost ([::1]:22838 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hqjhN-000KfM-6A; Thu, 25 Jul 2019 19:46:45 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:59914) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hqjhI-000KfF-TC
 for samba-technical@lists.samba.org; Thu, 25 Jul 2019 19:46:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Date:Message-ID:From:Cc:To;
 bh=8c82UxTx83jyhhFLnHrZnDv3DQzBHaRPWruiUafhTVc=; b=YXZj78Snxbs2319e43Z/4BMz2Z
 QWlq+LHEHdr7Nh1RbYhJdA8sTMqS0Do7jghIKRMO5+P16MLusC+BatyX+eVAW/6x+V4suKDDAPb9k
 20uNN9Kr0mtW2CdJIjFCSRs4WLWlkjlhuJWmxBksLbAdGupCtuhOjXGyprltussJBtvs=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1hqjhI-0002xP-1o; Thu, 25 Jul 2019 19:46:40 +0000
Subject: Re: Turning off SMB1 make slashdot and theregister !
References: <20190710225121.GA142072@jra4>
 <CAN05THQ65himSVSYpzypUwDeJoaV6FPAhQpV4NEeCT3fRaBxFg@mail.gmail.com>
 <dc0d693a2caf311097cf9a0ef8df3add01117ba7.camel@samba.org>
 <4efb83c3-6df7-af2c-798d-b4ec681562ab@samba.org>
 <8219d257b2fe68717939d2f41566ae669fab8466.camel@samba.org>
To: Andrew Bartlett <abartlet@samba.org>
Message-ID: <38c34dd3-baef-308c-6d3c-5795d9715082@samba.org>
Date: Thu, 25 Jul 2019 20:46:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <8219d257b2fe68717939d2f41566ae669fab8466.camel@samba.org>
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
Cc: samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 25/07/2019 20:27, Andrew Bartlett wrote:
> On Thu, 2019-07-25 at 20:18 +0100, Rowland penny via samba-technical
> wrote:
>> On 25/07/2019 19:59, Andrew Bartlett via samba-technical wrote:
>>> We can't do that until we provide a reasonable way for SMB1 clients
>>> to
>>> connect, probably via a SMB1 -> SMB2 proxy based on the NTVFS file
>>> server (where we had such a prototype until very recently).
>>>
>>> It won't be perfect SMB1, but needs to be enough for basic
>>> operation.
>>>
>>> I'm quite convinced Samba and SMB1 are critical infrastructure in
>>> many
>>> places and while we may dislike SMB1 for good reasons the
>>> alternative
>>> is to force such installations to rely on what will in 2 years be
>>> an
>>> unsupported and therefore soon an insecure version.
>>>
>>> I'm not comfortable with that as an outcome, so we need to provide
>>> them
>>> a way forward.
>>>
>>> Andrew Bartlett
>>>
>> Andrew, why do we need to keep anything like SMBv1 around in the long
>> term ?
>>
>> If you do an internet search, you will find blogs from Microsoft
>> employees nearly begging people not to use SMBv1 and the fact that
>> new
>> Windows 10 installs have SMBv1 turned off by default, leads me to
>> think
>> that it wont be long before it is totally removed from windows.
>>
>> If SMBv1 is removed from windows, then the major user base will
>> disappear, so are you saying Samba should keep SMBv1 around just for
>> Unix users ?
> I'm more thinking about the DOS users, the OS/2 users and the Windows
> 3.11 users.

If people are prepared to use old programs such as these, then they are 
also probably using old OS versions and presumably will be prepared to 
use old versions of Samba.

I do not really know what you are planning, but if it has anything to do 
with SMBv1, then, in my opinion, it will be wasted effort, it is 
unlikely there will be anything modern that will talk SMBv1.

>
>> If you are considering the Network Browsing problem, then there are
>> other ways to do this.
> It isn't browsing.  Samba is the glue that holds a lot of things
> together.

Yes, glue made from water and flour i.e. not a very good glue.

I know your feelings on on keeping the old ways working, but there comes 
a time when you have to accept that keeping some things going isn't 
worth the effort and can hold other things back.

>
> I'm sure we will find out a little of this in a year or so, when 4.11
> starts to be seriously used in production.
>
> Andrew Bartlett
>
We already are, there are some very weird ways of doing things turning 
up, things that had to be done that particular because they couldn't be 
done any other way at the time. Things that could now be done easier 
with AD.

Rowland



