Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 63F4E107507
	for <lists+samba-technical@lfdr.de>; Fri, 22 Nov 2019 16:39:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=PGUl0rkDuDy8HZssVvTilHAeKyMDGMYSXdM+6YJN00Q=; b=T3GK4IiaaOiY/PvadY4ddwMpHE
	SG3vLBk2jfBtcToFZF/Dy2eBWNWrDQAtKvHAmPni6oZ9VxrIHReD5ijT9QPS+eIE63rA79PfhphBz
	H9ZYUQ0wl87nKeZVHUAhGk/bI5s7jaq0otcurxfOcrxGpI+Ox+g4sqk8BH+87xaG0AgaAj8dB5/Zp
	P9pxnnxxhF3MLiaX/4FDjwXCdHOPGSTFpOR6Ebb3LPQh9M9PBO44KvNbFU6SWOM55Lz1WM6XOSCWa
	WTd5KDR7a0sah119KDNeY8lSYtosIppJ0C8vLw9auDhqlHyiS7fbgEx+RCtSianDBnXkvjyZaq1tC
	OV5dpcfQ==;
Received: from localhost ([::1]:37646 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iYB1L-0026AH-Ds; Fri, 22 Nov 2019 15:38:55 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:43186) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iYB1G-0026AA-Ak
 for samba-technical@lists.samba.org; Fri, 22 Nov 2019 15:38:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:Cc:To;
 bh=PGUl0rkDuDy8HZssVvTilHAeKyMDGMYSXdM+6YJN00Q=; b=uR9cCMp4pUX6N+UU9J2x+hlstq
 A8S0NWa8VhDK0UlJfH8TSmDIJGaKg2aI9lLEX3NbNLbqsZSY9i/XPqa2YFnzU2AShiTHeXiA4U6iN
 IJ876Nvb2++J2Hq629rV5TxzibkAapC9MZiBCI+oEocOv+ntZgFjYfuMdJE72CaEY9rGUTmT2nOVC
 9ALHmts+Z19iLwWjQ4UWDM4AfoCyK1upXZVtqSDrhz4AhKyEXayMcgHJEfXM7w84y2nALlWAXjTeF
 goq69Ag553j5Cjrw9kh1NeBYS7GYOF0XfWeXil6O0/XEC0I48HycZrQu5cueR0e5z35LGuU2hgXEi
 AFaexvAS/ysQ7OULJXsO+D1M647BFmZB5W1sZNs/werpxdapA005Lzsz3HqCHxNmRwXKs3XumaA1b
 nGkRVuG33t1MDCMeB3ww4XKcv5j7gx32rT6dB0Ol2kKcTG7W4yHvZAblo6KYwA0lF22Si8GcZkqlr
 6sRe9IJ+Ri2BFTswMlNPdXS9;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iYB1E-0005kk-Q4; Fri, 22 Nov 2019 15:38:49 +0000
Subject: Re: Converting SMB1 tests to SMB2
To: Noel Power <NoPower@suse.com>, Andrew Bartlett <abartlet@samba.org>,
 npower <npower@samba.org>
References: <f0f71737-cd07-b361-1c26-58116e6e8ed8@suse.com>
 <be6770e5-5bf0-4665-4a88-3e4182e4c82e@samba.org>
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
Message-ID: <fc8ebc97-7cca-3274-2f1a-712052b8d5c8@samba.org>
Date: Fri, 22 Nov 2019 16:38:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <f7229830-b844-a509-ed31-9707e0101666@suse.com>
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
Cc: David Mulder <david.mulder@suse.com>,
 samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hey Noel,

thanks for all your hard work so far!

I'll try to wrap my head around this next Monday, so we can chat Monday
or Tuesday.

If others are faster, feel free of course. :)

Thanks!
-slow

On 11/22/19 4:27 PM, Noel Power wrote:
> Hi Ralph & all
> 
> I really need help with
> https://gitlab.com/samba-team/samba/merge_requests/902
> 
> Currently it is marked WIP as I hoped there could be some
> discussion/agreement as to the approach outlined there. In summary this
> merge request imo satisfies the general discussions we had about the
> approach to providing a way to iteratively push ported smb1 tests into
> the codebase. As mentioned I didn't have much luck trying to make the
> '_smb1' test environments fully independent, in the end it seemed this
> would probably require more work than it was worth (afterall in the end
> we will get rid of the smb1 tests and associated envs).
> 
> With this in mind I only create 'shallow copies' of the test envs that
> have tests that fail against the new default environments which don't
> support negotiation of SMB1. I added 2 new CI jobs to run the tests that
> only run in environments that can negotiate SMB1. This passes CI currently
> 
> I'd really like to get this (with whatever changes are needed) upstream
> so we can start on the porting proper. David is currently starting to
> try and port some of the base tests and I started going through the
> skip_smb1_fail list we have to split tests that mix SMB1 & >= SMB2, fix
> tests that should run against SMB2 but dont't etc.
> 
> I also wanted to go through the motions of porting a test, marking it as
> ported/done etc. Ralph, you had the idea of using alias environments
> '_done' that I liked so I created a new branch
> 
> https://gitlab.com/samba-team/devel/samba/commits/npower_smb1_with_porting
> 
> This branch also includes the changes from
> https://gitlab.com/samba-team/samba/merge_requests/902, on top of those
> changes it
> 
> * creates alias '_smb1_done' envs that a test can be moved to when
> 'processed'
> * fixes or splits tests that currently only run in a test env that can
> negotiate SMB1
>   e.g. where a test that mixes testing SMB1 & >=SMB2 protocols then the
> test is modified so it can take a param to run either protocol, then
> existing test is;
>       a) modified to provide param to run SMB1 & test moved from '_smb1'
> env to '_smb1_done' env
>       b) copied & modified to provide a param to run >= SMB2 and test
> now additionally runs against appropriate non '_smb1' env
> 
>   There are quite a few tests in the skip file that really are SMB1 only
> tests,   in this case
>       a) move the test from '_smb1' env to '_smb1_done' env
> 
>   In both cases the skip_smb1_fail file is updated with comments saying
> the test
>   has been processed
> 
> Currently ~70 tests have been 'processed' trivially in that branch. I
> fear that the work there might be wasted (if the wrong approach is being
> followed) so really it would be great to get this nailed down before
> more complex changes happen
> 
> Noel
> 
> On 14/11/2019 12:12, Noel Power wrote:
>> Just FYI
>>
>> I opened https://gitlab.com/samba-team/samba/merge_requests/902
>>
>> This branch is a return to the plan of just using some independent CI
>> jobs to run the SMB1 tests (and tests failing in environments where SMB1
>> can't be negotiated). These new jobs use simple 'shallow' copies of the
>> existing environments.
>>
>> I returned to this approach due to the ever increasing amount of changes
>> (and I admit failure) trying to create proper independent test
>> environments (as described below)
>>
>> Maybe we can try with the approach outlined in the merge request and
>> continue the discussion there. The sooner we have something in place
>> upstream the sooner we can start chipping away at the tests :-)
>>
>> Noel
>>
>> On 08/11/2019 14:03, Noel Power via samba-technical wrote:
>>> Hi All,
>>>
>>> On 06/11/2019 17:44, Andrew Bartlett via samba-technical wrote:
>>>> On Fri, 2019-11-01 at 18:31 +0000, Noel Power via samba-technical
>>>> wrote:
>>>>> Hi All
>>>>>
>>>>> Just thought I summarize what we (myself & Ralph) discussed, for my own
>>>>> benefit and the benefit of others.
>>>> Thanks for writing this out.  I see in the rest of the thread that you
>>>> have made some progress,
>>> well yes and no :-)
>>>
>>> so, I did try and fix the ip uniqueness thing but...
>>>
>>> unique ips made some difference however there were more things, more
>>> changes needed
>>>
>>> a) need to pass down a unique server name in order that the unique ip
>>> can be created (there is a name -> interface_num hash)
>>> b) but... we have alot of fake _smb1 envs and the number of interfaces
>>> we have  breaks the current MAX_WRAPPED_INTERFACES limit, need to modify
>>> this in third_party/socket_wrapper/socket_wrapper.c
>>> c) missing certs for various tests which needed some new directories
>>> (and content) setting up in various dirs under
>>> selftest/manage-ca/CA-samba.example.com/DCs/
>>> e) there is another problem, there is still interference between the
>>> environments because an additional realm_to_ip_mappings where the realm
>>> associated with the servername (and where the servername in turn is used
>>> to get the ip address)
>>> f) I then tried to use different realms with the smb1 environments who
>>> should have entries in the table but this also was not enough, still
>>> tests fail (I presume because lots of test data, database entries etc.
>>> depend on the existing 'realms' used (this is speculation)
>>>
>>> So  CI still doesn't pass, at this point I just got too disheartened,
>>> been going around in circles, don't know enough about the test setup (or
>>> samba ad) to figure out (at least easily). I get the impression this is
>>> a piece of string I could pull for a long time :-) and the only thing
>>> that will be unravelled is my sanity
>>>
>>> The current errors with this approach can be seen here
>>> https://gitlab.com/samba-team/devel/samba/pipelines/94064858
>>>
>>>>  but wanted to say that if you get really stuck
>>>> again then I can certainly be of assistance. 
>>> thanks, appreciated!!, I wonder would you think or agree that rather
>>> than go down the rathole above that reverting to my backup plan which
>>> just added 2 new smb1 jobs is a far easier route, we don't need the
>>> runaway changes to the '_smb1' environments as above. ip uniqueness for
>>> example should not be an issue as we run those tests in isolation in
>>> their own CI job/container, these jobs/environments will go away when
>>> SMB1 disappears anyway. Hopefully using such 'shallow' copy versions of
>>> the environments isn't an issue or a stumbling block ? [1]
>>>
>>> But... there still remains the problem that in the last attempt a number
>>> of tests were failing mysteriously in the new separate smb1 CI jobs. I
>>> scratched my head on this, again I tried to reproduce the problems
>>> locally, in docker and on sn-devel without success (everything passes
>>> outside of CI). So, I returned to running just a single failing test on
>>> CI (now with lots of DEBUG) and found for example that with the
>>> samba3.unix.info2 test that immediately after creating a file with (0
>>> bytes allocated) that STAT returns st_ex_blocks with a positive value.
>>> Clearly this is something happening at the host os or filesystem level.
>>> Comparing with passing tests in master the only difference is the
>>> passing tests run on rackspace runners and with the failing case, the
>>> tests run on shared runners. Changing the new smb1 jobs to run on
>>> rackspace solves the problem
>>>
>>> see https://gitlab.com/samba-team/devel/samba/pipelines/94604792
>>>
>>> so...
>>>
>>> 1st can anyone enlighten me as to what is different with the rackspace
>>> runners?
>>> 2nd can we agree that adding the 2 new jobs is the simplest and easiest
>>> way forward, once upstream this will allow us to iteratively tackle the
>>> SMB1 failing tests
>>>
>>> thanks,
>>>
>>> Noel
>>>
>>>
>>> [1] One potential problem is that the default 'make test' from source
>>> will fail because of the mix or xyz & xyz_smb1 environments. However
>>>   + personally I doubt that 'make test' reliably will succeed anyway
>>> these days, we certainly don't test a full make test anywhere anymore,
>>> imo the only reliable way to run tests is via gitlab CI (or autobuild)
>>>   + with the python3 port there were jobs that were completely
>>> unreliable until they were separated into python/python-3 jobs. There
>>> were certainly a number of tests that couldn't be run multiple time in
>>> the same env (due to destructive nature of the tests) so I think we have
>>> already done this before
>>>
>>>


-slow

-- 
Ralph Boehme, Samba Team                https://samba.org/
Samba Developer, SerNet GmbH   https://sernet.de/en/samba/
GPG-Fingerprint   FAE2C6088A24252051C559E4AA1E9B7126399E46

