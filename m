Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C8594E215
	for <lists+samba-technical@lfdr.de>; Fri, 21 Jun 2019 10:43:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=AkyYIKvAxFPA9a6z1qBT+/NbYM7T+wkAZ3yxNsB94+0=; b=CDgAGaxR31PVwGLmXEFlHpJzJ8
	3KdgQmmmRRauNTuFThAIJEIpDwJ/m+BWVS/dkNUJVtn4YraxPqTSPLIO9eLHIRmKob5RltittqX1c
	ewcoa9dAPsub85zkbUQEkyxAUcGQAzbdGsL0rFD2TDcSTKwGixIyhit47XooOtpP7uFOsR2ATuplU
	HcFGt8Q+P8ora8ZUbJRpIiztRZGdm/9nh2KIAmsaClBBZsmh1Uw1Yie6El3nc0yec1/JopGHDBwEb
	CWWdGcC+cEnqjEefIu3Cqn8ALndkpm44b5TavPAaHRbO9KwF+Z9QJdnPpAwkPl0ALGwQ4a6+7uEA3
	vOwKgYXA==;
Received: from localhost ([::1]:19016 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1heF8E-000uSr-1N; Fri, 21 Jun 2019 08:42:50 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:28514) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1heF86-000uSk-8R
 for samba-technical@lists.samba.org; Fri, 21 Jun 2019 08:42:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Date:Message-ID:From:Cc:To;
 bh=AkyYIKvAxFPA9a6z1qBT+/NbYM7T+wkAZ3yxNsB94+0=; b=fveXkqPr5WpvZ8g8/Wod3JX766
 1Y/os5i7+qOmb2keu+fglv2pqnImE5UUjNpSvdIxZzdBbEu3UOWbMzRdoP+Eo9pPLQ19Po7ZkSoLX
 +RtR/+L4fAo9YDsDXc6WJcbDIkj+dJECkzoTQhdoJ4HhBeJGvG1HRTC5Dq5UbquWeG2g=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1heF85-0000z7-74; Fri, 21 Jun 2019 08:42:41 +0000
Subject: Re: Document GitLab as the only way to contribute to Samba?
To: Andrew Bartlett <abartlet@samba.org>
References: <1561079117.28284.21.camel@samba.org>
 <20190621111436.342f713e@martins.ozlabs.org>
 <1561082290.28284.28.camel@samba.org>
 <0278c810-0cd8-5ad8-3a39-ab1e7fc70b8f@samba.org>
 <41b3968e83cfbd74a060b7f51f4c719be4ddab58.camel@samba.org>
 <290c2679-895e-9be4-a7d4-03a5ab8bd265@samba.org>
 <c313657a3ccb56499bbae330bfd93690764cceea.camel@samba.org>
Message-ID: <841218bf-e99e-b346-5240-2122fa491a24@samba.org>
Date: Fri, 21 Jun 2019 09:42:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <c313657a3ccb56499bbae330bfd93690764cceea.camel@samba.org>
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

On 21/06/2019 09:30, Andrew Bartlett wrote:
> On Fri, 2019-06-21 at 09:01 +0100, Rowland penny via samba-technical
> wrote:
>> On 21/06/2019 08:44, Andrew Bartlett wrote:
>>> On Fri, 2019-06-21 at 08:13 +0100, Rowland penny via samba-technical
>>> wrote:
>>>> Sorry, but I do not think it is 'wrong' to not want to use git-lab.
>>>> Perhaps we should 'prefer' people to use git-lab, but we definitely
>>>> shouldn't tell anybody off for sending a patch directly to samba-technical.
>>>>
>>> G'Day Rowland,
>>>
>>> Can you elaborate a bit more?  Can you explain a bit more why?  Can I
>>> help you set up your account?
>>>
>>> It would be really good to have you on-board.
>>>
>>> Thanks,
>>>
>>> Andrew Bartlett
>> I wasn't actually thinking of myself.
> ..
>> I was thinking of other potential users.
>>
>> Rowland
> Thanks Rowland.
>
> I would say that is the same for me.
>
> So, for those other potential users, I think we both want to guide
> users to the path of most likely success, right?
>
> The problem as I see it is that sending the patches to samba-technical
> risks them simply being lost, particularly if folks are not 'told off'
> and re-directed to GitLab.
>
> Quite bluntly, I don't review patches sent here.  I simply don't have
> the time to spend on it, and on the flip side the merge requests
> page[1] is a great TODO list for me.
>
> Now, thankfully, I'm not the only reviewer, but it makes me feel sad if
> we document methods with a lower chance of success alongside the way
> that works better for both reviewer and submitter.
>
> If the submitter doesn't send the patch to GitLab CI, someone else
> needs to, and then be the human messenger when it fails etc.  (This
> leaves less time to review patches, which is why I don't do that any
> more.)
>
> It makes me sad because I feel for our contributors, and I want them to
> feel that if they follow our advise, their patches will be well
> considered.
>
> Given that, do you see the advantage in having a single, uniform,
> 'right' way to submit patches?  Is there anything more I can to to help
> you support, or at least not object to, my proposal?
Are you telling me that you do not read patches any more and rely on any 
potential patches passing the git-lab tests ?
>
> Finally, I would encourage you to try out GitLab, it is much easier to
> support something you have used, and my offer still stands.

No thanks, being told your programming is crap once, was enough for myself.

Rowland


>   
>
> Thanks,
>
> Andrew Bartlett
>
> [1] https://gitlab.com/samba-team/samba/merge_requests



