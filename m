Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C173110108
	for <lists+samba-technical@lfdr.de>; Tue,  3 Dec 2019 16:18:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=Lsl7ZTcH6p13nfOQS2EGVGfcyZ4WUnXUi6msOuLCFhE=; b=oDruyD1RHHtarCpZD6oP6gnpgD
	docEOhWy5VwwUQd6lWGqRVuYmJnQ9Iyx6PM5n4RaggqtVkmI1X6PJlKgGU++gXWuD40TvOI9nHRiq
	YRFISI4aKVxrUMIXv0r6d/usdwzfDm3Dh9/CCVUuW16C30nw/I4zQB2IYLIRZrPjN4xKuDCGogqEZ
	DyXh/f/WgwQajcYJhtY1fRJYoeVw1soW7QdZ15gyUf/IDPPhthjMUen/qA6VKfBl2HOXEz+e7MIY1
	iwUhKVMsKu11NVMddbEByiWjmN+nYtCYj0fIyi2bz3lSnuDdlglUF5YxQ4csBCK3MNj+jEyFDgF9n
	5pAXK8Qg==;
Received: from localhost ([::1]:54272 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ic9wN-005rzA-60; Tue, 03 Dec 2019 15:18:15 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:18622) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ic9wI-005rz3-CB
 for samba-technical@lists.samba.org; Tue, 03 Dec 2019 15:18:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:Cc:To;
 bh=Lsl7ZTcH6p13nfOQS2EGVGfcyZ4WUnXUi6msOuLCFhE=; b=P8d6nGiITF0ZXvszv8DgmcIeXP
 1n6Qj8pmHUpVygcOsHpJVQpJlL/y2l5SQamMnefxPDf1x4xlQDnMGY/4uLm2KITt+9UZFu/AOE5JL
 FSooTkPxVdOu4ruqlhf+X35AlHCt047GNz7ISxx8lg3ItXvKqFMnuGebcKZny624uI0lz1ONBG/+5
 H7lIBdnqQr/JDlij3AAyToJYb56yL6xB8mk78+7dQXQyxDCHziKyOAp4rkxsoR6Yh5rdqYuqniUyu
 EmqhJMIW9dlD4R7hf/xjuuMdTgBNw3kKDNl7J/21j/wZiG3PesrcfCJlc658vip/NRhjk1h12DpzM
 Z+dRZCGjbRgXyM0+03zBTEiuml3qCkD/j4vwns5OVkI+b95iRzeWD0vvUQVVUlSi8DaAdUdADiH2X
 CfknRP7SeY6dWYZkrHcjaIYWSoHnWSwS2hcfDQ3tMAkFdYMBYRKSWmJ7cku5bCcAO320OguYdIE5o
 yvhKDCXMJTLA//dLcd2jdfgA;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ic9wH-0005L1-Ag; Tue, 03 Dec 2019 15:18:09 +0000
Subject: Re: Converting SMB1 tests to SMB2
To: noel.power@suse.com, Noel Power <NoPower@suse.com>,
 npower <npower@samba.org>
References: <f0f71737-cd07-b361-1c26-58116e6e8ed8@suse.com>
 <0981db46-93bf-f153-c98f-15d5cf404353@suse.com>
 <ed7eb92f-46a7-758e-f3b5-185d71b8b98a@samba.org>
 <002434db-63ef-edad-d091-76e3efe783d1@samba.org>
 <15dfbaf6-c774-debe-b61e-c3ef4e7f9727@samba.org>
 <d9625941-c85a-a686-2162-30c80a2e84b3@samba.org>
 <fa464ebe-cfe7-1d6e-7435-c896e2cc188e@samba.org>
 <f479113c-7a74-8259-823e-4ae1c4a713c6@samba.org>
 <47fef5d6-7fb6-b054-a8c5-7a28b63e97c8@samba.org>
 <9cc9d402-57fb-3568-29e6-12284d6ccd98@samba.org>
 <f5970612-2998-cef1-dcca-40188c7a176f@suse.de>
 <361f5a38-66fb-e18c-7858-c5db6e93424e@samba.org>
 <dc95f81c-90ba-a368-9b3e-ccdcf067edaa@suse.com>
 <c25ed441eedb2a864429c0154859f2afe95f38cb.camel@samba.org>
 <f3fcbb1f-a25c-f7cb-4023-fdef68e208a8@suse.com>
 <a146e395-f9ca-12d0-2cab-ca52e8209706@suse.com>
 <f7229830-b844-a509-ed31-9707e0101666@suse.com>
 <e09044be-713a-f074-ed2f-e41168646d81@samba.org>
 <7a86b0cd-9eea-d077-69ac-9077d0cc12c8@suse.com>
 <70b3cc00-1f71-4f17-f9c4-8fd72b41543f@suse.de>
Message-ID: <150ed4fe-84d7-f1b4-18aa-5443e063a355@samba.org>
Date: Tue, 3 Dec 2019 16:18:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <70b3cc00-1f71-4f17-f9c4-8fd72b41543f@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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
From: Ralph Boehme via samba-technical <samba-technical@lists.samba.org>
Reply-To: Ralph Boehme <slow@samba.org>
Cc: Stefan Metzmacher <metze@samba.org>, David Mulder <david.mulder@suse.com>,
 samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi Noel,

On 11/27/19 11:58 PM, Noel Power wrote:
> Hi Ralph & *
> 
> Some observations
> 
> On 26/11/2019 16:09, Noel Power wrote:
>> Hi Ralph
>>
>> On 26/11/2019 11:45, Ralph Boehme via samba-technical wrote:
> [...]
>>> Stepping back a little I think we only need the following:
>>>
>>> 1. The file with the list of failing tests should not be used as a skip
>>> list. Just maintain a private branch with the changes needed to generate
>>> the list. The list can go into master as eg selftest/smb1-todo or
>>> similarily named.
>>>
>>> Ideally the commit that adds the list also included instructions and the
>>> patchset as file that is needed to regenerate the list on sn-devel.
>> currently the skip file is effectively documentation, the commits around
>> this at the start of the patch set are just to prove it was a valid list
>> (after migrating the envs to default only negotiate >= SMB2)
>>
>> There are no 'changes' to generate the the list of skip tests other than
>> making all envs by default not negotiate SMB1 and then trying to see
>> what fails (and unfortunately this isn't as straight forward as running
>> the tests with FAIL_IMMEDIATELY=0 as some tests hang etc.
>>
>> So I am not sure which changes you mean should be in a private branch. I
>> guess I misunderstand what you mean
> 
> ok, I poked around a bit with this again today, with the ad_dc_ntvfs
> changes the landscape of errors seems a little different and my
> impression is not as many now hang. So maybe such instructions could be
> 
>   + apply a small patch to the existing skip file [1]
> 
>   + apply patches we have already to make the envs default not negotiate
> SMB1 (with the exception of ad_dc_ntvfs)
> 
>   + run autobuild or submit to gitlab and scrape the stdout logs with [2]
> 
> That should suffice for (re)creating a skip file
> 
> skip file at
> 
> https://gitlab.com/samba-team/devel/samba/commits/npower_with_smb2_ntvfs
> 
> was generated using above steps, verified here
> 
> https://gitlab.com/samba-team/devel/samba/pipelines/99046676

Looking much better.

Many, many torture test really could be run only against one env instead
of ad_dc and nt4_dc, eg

samba3.base -> fileserver (and then fileserver_smb1)
samba3.raw -> dito

But that is probably a lot of work only saving one smb1 env.

>>> 5. Add correspondong _smb1_done alias envs.
>>>
>>> 6. Go through the todo list, either
>>>    a) just fixing the test if it should genuinely
>>>       work with smb2 => remove test from todo list
>>>    b) convert failing smb1 tests to use the
>>>       envs from 4 => update used test env in todo list
>> I guess this answers my question above wrt. above
> 
> It would be great to know what environments are perhaps suitable
> alternatives to problematic ones especially if there is a need to keep
> the number of new environments at  minimum.
> 
> Looking even at existing tests that already are already split between
> SMB1 & >= SMB2 the following environments are affected
> 
> e.g. The following are just a few examples of legitimate tests (that
> don't need porting) that currently would fail if run against
> environments that cannot negotiate SMB1
> 
> samba3.blackbox.acl_xattr.NT1\(fileserver\)

remove this one, only run the SMB3 variant.

> samba3.blackbox.inherit_owner.default.NT1\(fileserver\)

dito. Also likely true for all the other blackbox tests that run NT1 and
SMB3. BUt again please make micro commits so we can review and test
individually.

> samba3.blackbox.smbclient_basic.NT1\(nt4_dc_schannel\)

remove it.

> samba3.blackbox.smbclient_large_file -mNT1 -e NTLM\(nt4_dc:local\)

remove it.

> there are many more, plus tests than need to be split (because they
> currently mix SMB1 & SMB2 tests in the same test driver script file)
> 
> quickly scanning the following tests involved use the following environments
> 
>     fileserver, nt4_dc, nt4_member, nt4_dc_schannel, fl2000dc,
> maptoguest, s4member, ad_member, ad_dc
> 
> There are quite a few environments here, certainly more than the 3, any
> advice on substitutions ?

See my previous mail.

> 
> Additionally there are quite a few tests that  use smbclient4 (and other
> s4 clients, e.g. cifsdd, locktest etc.) and these all will fail because
> they afaics cannot handle smb2. Could we replace use of smbclient4 with
> s3 smbclient in these tests?

Oh, that's a good question. :) I guess at least the
samba4.blackbox.kinit tests could use smbclient from s3.

> what is the plan for smbclient4, it doesn't
> seem fully featured, is it really used outside the tests, is it worth
> investing time to convert it to use smb2 ?

No.

> I see cifsdd is part of the
> samba suite so this one needs adjusting to be able to use >= SMB2

If feel like removing it, but maybe someone want to convert it. Until
then the test uses ad_dc_ntvfs env, so it can stay as it is.

> What about s4member? (and other envs that are dependant on ad_dc_ntvfs)
> should these be additionally treated the same as ad_dc_ntvfs and allow
> SMB1 also ?

Iirc s4member still uses the NTVFS s4 fileserver in my branch, so yes,
iirc my idea was that all those should keep smb1.

> it seems strange to set up an environment which is going to
> have communication issues because half it can talk SMB1 and the other
> half can't
> 
>>>    Step 6 can be spread across volunteers.
>>>
>>> 7. When the list is fully processed and all remaining tests on the todo
>>> list that still need smb1 use one of the new _smb1 envs, disable smb1 in
>>> all other envs except ad_dc_ntvfs and s4member.
>> I don't like that disabling smb1 by default for the 'normal'
>> environments is now a final step, that isn't as nice as starting from an
>> initial point where we can clearly see what runs >=SMB2 and what
>> doesn't, not only see but actually know (because the default env setup
>> would prevent any accidently SMB1 usage) and similarly when you port a
>> test you know it isn't still using some SMB1 that you didn't notice.
>>
>> I wonder how far off we would be if I merged your slow-ad_dc_ntvfs in
>> terms of what extra (if any) envs are needed, I will try
> 
> well current 13 envs appear in the latest skip file
> 
> ad_dc
> ad_dc_default
> ad_member
> chgdcpass
> fileserver
> fl2000dc
> maptoguest
> nt4_dc
> nt4_dc_schannel
> nt4_member
> rpc_proxy
> s4member
> simpleserver
> 
> btw I opened https://gitlab.com/samba-team/samba/merge_requests/947 for
> some prep work to split tests so they can be divided across envs that
> are SMB2 only and still support SMB1 (if we ever get to that point :->>>>)

I'll take a look tomorrow!

Thanks!
-slow

-- 
Ralph Boehme, Samba Team                https://samba.org/
Samba Developer, SerNet GmbH   https://sernet.de/en/samba/
GPG-Fingerprint   FAE2C6088A24252051C559E4AA1E9B7126399E46

