Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id EBD38AF5EB
	for <lists+samba-technical@lfdr.de>; Wed, 11 Sep 2019 08:36:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=SqzKlEfbLGAgrhv1uO673kpn7u+N6lR5EGp7X038CJk=; b=IwalH66eFklec/qRn/38Ucjvxs
	glbkhN+Z3M9KYLTUUIWG1EWWu7fkV2ReSrjYZgEYIhqCvLZEF3lpcHJY7WegopLyLV88w/GymCp8u
	wtyarZPECFRUYcac+v5f10AcBnVeTTI8TS/HR3O/Q+FmpPh6qP3OY2B5/a3rI3SNLeIB9FQbTvFgx
	jnhRcJmof5yG+WWof6T9V3ktQHj7/RodsCsQBgwbDiFn/0iXraaES15TxchLUnltU+ERAe1gWP0E3
	NgOjUft9As0MLpNdmCvVEipcZa4pgFLsgYB7qsO9Gl2IA/GivFTFYE3hG34diDtMu1upBRDGBTj6L
	/zvmgonQ==;
Received: from localhost ([::1]:54592 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1i7wDv-004fJi-2K; Wed, 11 Sep 2019 06:35:27 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:64786) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1i7wDa-004fJb-2m
 for samba-technical@lists.samba.org; Wed, 11 Sep 2019 06:35:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Date:Message-ID:From:To:CC;
 bh=SqzKlEfbLGAgrhv1uO673kpn7u+N6lR5EGp7X038CJk=; b=R3qGln8ncyJz0oZyCdXTnHPmpU
 +1CF1OLcQfUP9lMG8yVSMkC9AdVYkSB02bXGeLyGXCE20tcZ5dkafenomI4k6KGv5pt9Us9fA7jEP
 lt3ereiVI9rqFS7j6pHIYI4tPQJT5KX4jE6W2xKt87Auw1ldzxSSog6ZHu6ojolBYTdU=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1i7wDX-0006pd-RF
 for samba-technical@lists.samba.org; Wed, 11 Sep 2019 06:35:03 +0000
Subject: Re: Document GitLab as the only way to contribute to Samba?
To: samba-technical@lists.samba.org
References: <1561082290.28284.28.camel@samba.org>
 <0278c810-0cd8-5ad8-3a39-ab1e7fc70b8f@samba.org>
 <41b3968e83cfbd74a060b7f51f4c719be4ddab58.camel@samba.org>
 <290c2679-895e-9be4-a7d4-03a5ab8bd265@samba.org>
 <c313657a3ccb56499bbae330bfd93690764cceea.camel@samba.org>
 <CAN05THS1tH7H2pMgUfsjo1QNY=zrYMgBqKLcoqP6MsAvxKRPpw@mail.gmail.com>
 <f1fb9b192f5b9e88244b84166106474f31f8ee88.camel@samba.org>
 <20190627223100.GB32415@samba.org> <1567745657.20732.13.camel@samba.org>
 <20190911113418.5475ad27@martins.ozlabs.org>
 <20190911031728.GA31067@jeremy-acer>
 <20190911142409.6bc6b7cf@martins.ozlabs.org>
Openpgp: preference=signencrypt
Organization: Samba Team
Message-ID: <c922b659-b9f4-5b62-256e-a07aa47653ac@samba.org>
Date: Wed, 11 Sep 2019 08:35:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190911142409.6bc6b7cf@martins.ozlabs.org>
Content-Type: text/plain; charset=utf-8
Content-Language: de-DE
Content-Transfer-Encoding: 8bit
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
From: Karolin Seeger via samba-technical <samba-technical@lists.samba.org>
Reply-To: Karolin Seeger <kseeger@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi,

Am 11.09.19 um 06:24 schrieb Martin Schwenke via samba-technical:
> On Tue, 10 Sep 2019 20:17:28 -0700, Jeremy Allison <jra@samba.org>
> wrote:
> 
>> On Wed, Sep 11, 2019 at 11:34:18AM +1000, Martin Schwenke via samba-technical wrote:
>>> On Fri, 06 Sep 2019 16:54:17 +1200, Andrew Bartlett via samba-technical  
>>>> I would document it as (roughly):
>>>>
>>>> - GitLab is the strongly perferred method to contribute to Samba. 
>>>> - Patches mailed to the mailing list may still be considered, but
>>>> require additional work on the part of Samba Team members so are
>>>> discouraged. 
>>>>
>>>> If you are interested in reviewing patches submitted to Samba, please
>>>> ensure you have a gitlab.com account and are watching our public gitlab
>>>> repository.   
>>>
>>> Sorry, but NACK.
>>>
>>> Samba is a Free Software project.  While that is true we must not
>>> mandate a proprietary platform as the only way of contributing.  Nor
>>> should we discourage contributions that are not made via a proprietary
>>> platform.
>>>
>>> There are many reasons why a new contributor may be unable to use
>>> GitLab, including:
>>>
>>> * They may not agree with the terms of service
>>>
>>> * They may not wish to take the time to setup an account and be added
>>>   to the required project
>>>
>>> * They may find the user interface unusable
>>>
>>> * They may not have (reliable) web access
>>>
>>> They may still be able to make very worthwhile contributions.
>>>
>>> Ironically, Git - and, therefore, GitLab - exists because the founder of
>>> the Samba project did not think it reasonable for a proprietary product
>>> to be mandated for development on another project.
>>>
>>> More pragmatically, GitLab may go away, so we should keep our options
>>> not only open but also active.
>>>
>>> We should continue to encourage this mailing list as an option for
>>> contributing to Samba.  If a reviewer prefers seeing a GitLab CI
>>> pipeline pass before they look at code then, if a mailing list
>>> contribution sounds interesting, they can save the patch, run "git am"
>>> and push the resulting branch to GitLab GI in less than a minute or 2.
>>> They can then reply to the contributor saying "looks interesting,
>>> waiting for GitLab CI pipeline <url> to complete".  This mailing list
>>> isn't so busy that hand-processing a few contributions will swamp any
>>> reviewer's time.
>>>
>>> Sorry, mate!  This is a hill I'm willing to die on...  
>>
>> So if you feel so strongly about this (and I'm sympathetic
>> to the web UI being just "someone else's computer" issues :-),
>> is it the wording of:
>>
>> "Patches mailed to the mailing list may still be considered, but
>> require additional work on the part of Samba Team members so are
>> discouraged."
>>
>> you really object to ?
> 
> Yes.  That wording says that if you post to the mailing list then you
> might be wasting your time.
> 
> The subject line is the original attempt to make GitLab "the only way
> to contribute to Samba" and I also object to that.
> 
>> The mailing list isn't going anywhere, as it's the primary technical
>> discussion list.
> 
> OK.
> 
>> How about we re-word this such that we encourage contributors
>> to use gitlab if they prefer or are used to this interface (as
>> many new developers are), but still encourage patches on
>> any medium - including the mailing list ?
> 
> Sounds like a plan.  Thanks for suggesting it!
> 
>> We're not so developer-rich that we can afford to turn away
>> help given by any means :-).
>>
>> I think the "require(s) additional work on the part of Samba
>> Team members so is discouraged." is a statement of fact on
>> Andrew's behalf. It may not be the case for all Team developers
>> of course.
> 
> Very true.  I like GitLab's automatic CI pipelines but I find that
> everything else takes more time using GitLab.  I do not poll the web
> interface for merge requests but depend on notifications that come into
> the same mail folder as samba-technical.
> 
>> Can you suggest alternative wording that would work for you ?
>>
>> We do want people who are used to gitlab to feel comfortable
>> using it to contribute, semi-proprietary though it is:
>>
>> https://akr.am/blog/posts/gitlab-isnt-really-open-source
>>
>> But we obviously still want to encourage pure Free Software methods
>> of collaboration.
>>
>> Would that work for you Martin ?
> 
> Definitely.  How about the following?
> 
> There are 2 main ways of contributing to Samba:
> 
> * GitLab
> 
>   GitLab is an integrated web site for collaborating on code.  This
>   includes continuous integration testing, merge requests and tracking
>   of versions of patch sets.  The GitLab workflow is preferred by some
>   [many? is it time for a poll?] Samba team members.
> 
>   See Samba's GitLab process <url> for more details.
> 
> * samba-technical mailing list
> 
>   This mailing list requires minimal up-front investment from drive-by
>   contributors.
> 
>   See the samba-technical process <url> for more details.
> 
> I really think we should not push mailing list contributors to GitLab.

I like this approach, thanks Martin! Contribution via samba-technical
should still be possible (enough reasons have been mentioned before).

> I cringe when I see this done.  As I have said, we can reply saying
> that we're running a pipeline and point them to it.  We can then even
> open a merge and point them at that too.  If they like what they see
> then they might look at the GitLab process and make their next
> contribution that way.  The only problem is if they don't have a GitLab
> account then we do need to follow up on the list because they won't see
> notifications.  It would be awesome if GitLab allowed you to add email
> addresses of additional people to notify of updates.

Karolin

-- 
Karolin Seeger			https://samba.org/~kseeger/
Release Manager Samba Team	https://samba.org
Team Lead Samba SerNet		https://sernet.de

