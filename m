Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 5205F4E109
	for <lists+samba-technical@lfdr.de>; Fri, 21 Jun 2019 09:14:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=LQFwOv++5p86A+W01uV/6Byph8KgfSoaRkltyv9+2q4=; b=5NR8/zsbLL6ozclvur5WPgrLWK
	JDfb/TTN896lVf3+bvUCYAgJyCRs+qKgJEC5iMob0eP5Fh+6iLbafv48aC6Pg5FmEWjndeasW9JkP
	LqR+rWxZyU7O217OiMWcWvpE1L8+ec6MTw1AFmUyAsUrEzr+L2l2xcIGVh7QNepclZtPhTgIhx6M9
	Feec6yuJREpbdpRoDD6db7YL1/RK+yLhHXX8YlAaKe5I21m5DdOJkE3KmCPz0B4PTHvi9iusBL4WH
	m+II7mol7ly+EdSV04e+Z9aExE+11QnPzCJmHVutVgjZnD9sb9c3MR+XPrW+EoS86oB6zN2ZmzAdw
	ZdBlxB2w==;
Received: from localhost ([::1]:54656 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1heDkM-000sdy-Cm; Fri, 21 Jun 2019 07:14:06 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:26562) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1heDkE-000sdr-Pu
 for samba-technical@lists.samba.org; Fri, 21 Jun 2019 07:14:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Date:Message-ID:From:To:CC;
 bh=LQFwOv++5p86A+W01uV/6Byph8KgfSoaRkltyv9+2q4=; b=qN63ka6lkBxROsLg8JptTjsBAJ
 rFOOUVc9djgSoaDzZw3gicqo0O0aLWOXqMrsmlGotPZ1AluAI4LRvJg9vvQo9ZN5ce5lF/GE2RaW+
 5HbCkNoX6IvQQQa1fVl7Hh72avic6k7/8HLd/Sq5LEurUjqvichq1QVWEuqmBnz5RRBg=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1heDkD-0007rc-El
 for samba-technical@lists.samba.org; Fri, 21 Jun 2019 07:13:57 +0000
Subject: Re: Document GitLab as the only way to contribute to Samba?
To: samba-technical@lists.samba.org
References: <1561079117.28284.21.camel@samba.org>
 <20190621111436.342f713e@martins.ozlabs.org>
 <1561082290.28284.28.camel@samba.org>
Message-ID: <0278c810-0cd8-5ad8-3a39-ab1e7fc70b8f@samba.org>
Date: Fri, 21 Jun 2019 08:13:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1561082290.28284.28.camel@samba.org>
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

On 21/06/2019 02:58, Andrew Bartlett via samba-technical wrote:
> On Fri, 2019-06-21 at 11:14 +1000, Martin Schwenke via samba-technical
> wrote:
>> On Fri, 21 Jun 2019 13:05:17 +1200, Andrew Bartlett via samba-technical
>> <samba-technical@lists.samba.org> wrote:
>>
>>> I gave a talk at SambaXP about our first year with GitLab, and one
>>> point I made is that it is *not OK* to have public contribution
>>> documentation that does not match our actual practice.
>>> So, I would like to propose this.  That given the practice of the Samba
>>> Team and almost all contributors is to contribute via a merge request
>>> against https://gitlab.com/samba-team/samba that we document this, and
>>> only this, as how to contribute to new patches to Samba.
>>>
>> I don't think it is the practice of the whole Samba Team.  I haven't
>> managed to get into the GitLab workflow, though I have used it.
>>
>> Perhaps I'm the only one, but I don't think we should be mandating this
>> (yet?)...
> G'Day Martin,
>
> Thanks for the feedback.  I should have checked rather than working on
> a 'gut feel' and I see you are still using samba-technical a fair
> bit[1].
>
> I would say that aside from your patches, the vast majority of the
> patch flow has moved to GitLab.
>
> To help us present a clear process, do you think you could embrace
> GitLab, if not for the benefits to you, but for the sake of our new
> contributors?
>
> The alternatives are (to my mind):
>   - Contributors get ignored on samba-technical (both because the
> patches are not known-good and because they are not on a clear to-do
> list)
>   - Contributors other than yourself keep getting told off for doing it
> 'wrong'.
>
> What do you think?
>
> Christof,
>
> You are the other person I still using samba-technical much at all to
> submit patches.  Is there anything I can do to help you make the move
> to GitLab, or is there anything stopping you?
>
> Thanks,
>
> Andrew Bartlett
>
> [1] Attached is the histogram of patches on samba-technical from April
> -> June, for the curious.
>
Sorry, but I do not think it is 'wrong' to not want to use git-lab. 
Perhaps we should 'prefer' people to use git-lab, but we definitely 
shouldn't tell anybody off for sending a patch directly to samba-technical.

Rowland


