Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 06DCD11000C
	for <lists+samba-technical@lfdr.de>; Tue,  3 Dec 2019 15:21:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=5xzkeLxfPGSUboDkG9k8cFid1UufimS1GBz9+TCF52Y=; b=lcUDK+VONJ9PaPG7Cx/4w7lurO
	/pZS+cOTXXPT8KkYTZiQgvFi2J+qYE+2GKvJngxOMjhudZXOhpRejCbMvzfZ5DtfvkNyipZ/MDWbt
	/lWv3mAIWhL7AlT3+rUIN6b5YANc6Yx+z0x0JhfN6SyZ9wyPirI3nMFZUtO69Qk+/ynx64JY91nN+
	X02JCq8Q28RgV/ys0Q5nDwdIlb3twfVnsTKHsD54rZz6BAz1/Rt5cQVMq548ExElRKGsnXo9F4cLZ
	z6/Xc5EuCR2FadashImqRxNMAr5oJYGQ0Lo+mwCz/IjccJRy3uQct3FIqGTu9X1qS/fcOFO+xhrjJ
	oh6+ChJQ==;
Received: from localhost ([::1]:39464 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ic92g-005pk4-0W; Tue, 03 Dec 2019 14:20:42 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:51974) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ic92V-005pjS-Lx
 for samba-technical@lists.samba.org; Tue, 03 Dec 2019 14:20:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:Cc:To:From;
 bh=5xzkeLxfPGSUboDkG9k8cFid1UufimS1GBz9+TCF52Y=; b=o7YREcjy5RpqanZn2cj4XbGZYe
 o7mL1Cqb/ixvsAurQH6kCHAYzIPx+lZUmjRPvTWdDKcaRyvwrbJUEJ0QowtYoMgvIi039pXlRMDDT
 iSdPWK4ttbvhFzVatgvL9lxoHilhk8gXf/4TJ4SHlmSY9cnGPge9U4GbUR8C+ryenXstAaEk9//Hw
 gJXHom2zSs8A2ttTYZuvzQIhBE4u0G59DUFcdB9QLGQ4gjOcbpjq0LjUOLMI/igsBbFbjlVaN+IM7
 dSzRNKWXsZXF7men+Q2F6u8nSwyHAt16vWoyQpGqAJdZc6wLbCLEMI2Hk27NiYnjgQ22ojcUAoNE0
 +JTjXYt1kFFckv0jG3Ky/hysnKjPdYtck8IGV2ug+GCYhrqlrRii10azQYh/EzT2EPJvEGfY0DR+P
 JFlH0/8IByP00KnFUlZOpE0sjuJ9HXn9Bdy80zYHuIsvK5e3v70wnfYTjJezDTBedMtX8OYKalXKb
 ccFKKSLoWDwV0nsX3/wTCgjg;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ic92U-0004mT-Ev; Tue, 03 Dec 2019 14:20:30 +0000
Subject: Re: Converting SMB1 tests to SMB2
To: Noel Power <NoPower@suse.com>, npower <npower@samba.org>
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
 <e09044be-713a-f074-ed2f-e41168646d81@samba.org>
 <7a86b0cd-9eea-d077-69ac-9077d0cc12c8@suse.com>
Message-ID: <eefa22c5-b0cf-b9e5-3d20-2fe171c53980@samba.org>
Date: Tue, 3 Dec 2019 15:20:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <7a86b0cd-9eea-d077-69ac-9077d0cc12c8@suse.com>
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

Hi Noel,

sorry for late reply, but I've got my head wrapped in
<https://gitlab.com/samba-team/samba/merge_requests/937>.

On 11/26/19 5:09 PM, Noel Power wrote:
> On 26/11/2019 11:45, Ralph Boehme via samba-technical wrote:
>> On 11/22/19 4:27 PM, Noel Power wrote:
>>> With this in mind I only create 'shallow copies' of the test envs that
>>> have tests that fail against the new default environments which don't
>>> support negotiation of SMB1.
>> These won't work in make test. You need at least IP addresses.
> 
> yes that is true, however I am not sure even if these days make test
> normally will work (or if anyone actually even use it instead of autobuild)
> 
> certainly during the python3 transition I am sure make test couldn't
> work as tests in the same job even were interfering with each other
> resulting in some tests split across various jobs. I would nearly bet
> there are currently tests that if all run together with a 'raw' make
> test would fail, I'd try it except I never ever had make test work for
> me anyway.

as pointed out by Andrew as well: we need to keep this working or at
least now make it worse. :)

>>>   There are quite a few tests in the skip file that really are SMB1 only
>>> tests,   in this case
>>>       a) move the test from '_smb1' env to '_smb1_done' env
>> Just beware of tests where SMB1 is just the transport and the test tests
>> FSA layer logic, eg unlink.
>
> ? not entirely sure what you mean here, I guess what I was referring to
> there are many tests in the skip file that already have both SMB1 & >=
> SMB2 tests where the test name just differs in some indicator of the
> protocol used e.g. test.something.NT1 & test.something.SMB2, in these
> cases nothing needs to be happen other than just mark the test done

ok, looks like I misunderstood your initial statement so just ignore my
comment.

>>>   In both cases the skip_smb1_fail file is updated with comments saying
>>> the test
>>>   has been processed
>>>
>>> Currently ~70 tests have been 'processed' trivially in that branch. I
>>> fear that the work there might be wasted (if the wrong approach is being
>>> followed) so really it would be great to get this nailed down before
>>> more complex changes happen
>> Stepping back a little I think we only need the following:
>>
>> 1. The file with the list of failing tests should not be used as a skip
>> list. Just maintain a private branch with the changes needed to generate
>> the list. The list can go into master as eg selftest/smb1-todo or
>> similarily named.
>>
>> Ideally the commit that adds the list also included instructions and the
>> patchset as file that is needed to regenerate the list on sn-devel.
> 
> currently the skip file is effectively documentation, the commits around
> this at the start of the patch set are just to prove it was a valid list
> (after migrating the envs to default only negotiate >= SMB2)

Ah, sorry, I missed the 'Revert "selftest: exclude SMB1 tests that fail
from tests"' commit.

> 
> There are no 'changes' to generate the the list of skip tests other than
> making all envs by default not negotiate SMB1 and then trying to see
> what fails (and unfortunately this isn't as straight forward as running
> the tests with FAIL_IMMEDIATELY=0 as some tests hang etc.

Sure. Btw, how did you figure out which tests hang? Do you have a list
of those? I imagine only a few tests will hang, luckily most of them
because it's in one of the AD DC envs where we don't have to disable
SMB1 as discussed in MR

https://gitlab.com/samba-team/samba/merge_requests/941

Ideally we can make the skiplist a knownfail list. Then every commit
that moves a failing test to a new *_smb1 env can comment out the list
entry.

> So I am not sure which changes you mean should be in a private branch. I
> guess I misunderstand what you mean

Nevermind. I was referring at changes like disabling smb1 in the envs.

>> 2. Don't disable SMB1 in the ad_dc_ntvfs fileserver. This also applies
>> when generating the todo list in step 1.
>>
>> 3. Reduce the number of envs that use the s4 NTVFS fileserver. This will
>> get us rid of a few failing tests from the list. I'm currently running
>> pipeplines with patches that implement this:
>>
>> https://gitlab.com/samba-team/devel/samba/pipelines/98598769
>> https://gitlab.com/samba-team/devel/samba/commits/slow-ad_dc_ntvfs
>>
>> With 2 and 3 together ~200 test will be removed from the list:
> 
> I know you mentioned previously ignoring for the moment ad_dc_ntvfs
> tests but I had already identified the ones failing already so I didn't
> see the harm in having them in the skip file (and having the environment
> to run them) as they need to be dealt with eventually.
>
> However If it helps to reduce environments then of course removing them
> entirely makes sense.

Yep. :)

> Removing ad_dc_ntvfs from the mix afaics removes ~10 environments e.g.
> 
> directly dependant
> 
> ad_dc_default
> ad_dc_slowtests
> s4member
> rpc_proxy
> vampire_dc
> 
> indirectly dependant
> 
> chgdcpass
> s4member
> fl2000dc
> fl2003dc
> fl2008r2d

of these only ad_dc_ntvfs, s4member and rpc_proxy should still use the
s4 NTVFS fileserver, all other should use s3 smbd. Alongside, these
three envs will remain with smb1 enabled.

And most tests that fail against any of the other environments with smb1
disabled needs checking why this happens and not just be moved to a
*_smb1 env. Eg "samba4.blackbox.kinit_trust(fl2008r2dc_smb1:local)"
seems to check some kerberos stuff, so this shouldn't be affected by
disabling smb1. As there are only a few of those test failing in these
envs, we should investigate this upfront.

>> $ egrep 'ad_dc_ntvfs|ad_dc_default|ad_dc_slowtest|chgdc'
>> selftest/skip_smb1_fails  | wc -l
>> 199
>>
>> 4. Add three new envs that support smb1: ad_dc_smb1, ad_member_smb1,
>> fileserver_smbd1, maybe more if featurewise required.
> 
> when you say adding envs do you mean just 'shallow' copies or do we
> really need to try and go the extra mile to make these new environments
> properly independent (my previous attempt failed and it looked like
> perhaps alot of changes could ripple from trying this for little gain
> since the environments will be removed)

yes, just normal/full envs.

> also afaics instead of 3 we probably need 8 unless you mean some tests
> can be moved from existing envs to one of the above

Yes, we should move/consolidate as much as possible.

I'd start with the smbtorture tests and move the in a microcommits fashion.

Running make -j test TESTS=".*smb1" > tests.log 2>&1
on your branch from MR902 on sn-devel and processing the log to see
which smb1 envs are used, I get

$ cat tests.log | sed 's/.*(\(.*\)).*/\1/' tests.txt | \
  sed s/:local// | sed s/:client// | sort -u
ad_dc_default_smb1
ad_dc_ntvfs_smb1
ad_dc_slowtests_smb1
ad_dc_smb1
ad_member_smb1
chgdcpass_smb1
fileserver_smb1
fl2000dc_smb1
fl2003dc_smb1
fl2008r2dc_smb1
maptoguest_smb1
nt4_dc_schannel_smb1
nt4_dc_smb1
nt4_member_smb1
rpc_proxy_smb1
s4member_smb1
simpleserver_smb1
vampire_dc_smb1

Of these only

ad_dc_smb1
ad_member_smb1
fileserver_smb1

are really needed plus possibly nt4_dc_smb1 to avoid many changes to
tests.py

As for the other ones, given my MR to tweask the AD DC envs gets merged:

ad_dc_default_smb1 -> should be an alias to ad_dc_smb1
ad_dc_ntvfs_smb1 -> not needed, ad_dc_ntvfs has smb1 enabled
ad_dc_slowtests_smb1 ->  not needed, failing tests must be fixed upfront
chgdcpass_smb1 ->  not needed, failing tests must be fixed upfront
fl2000dc_smb1 ->  not needed, failing tests must be fixed upfront
fl2003dc_smb1 ->  not needed, failing tests must be fixed upfront
fl2008r2dc_smb1 ->  not needed, failing tests must be fixed upfront
maptoguest_smb1 ->  not needed, failing tests must be fixed upfront
nt4_dc_schannel_smb1 ->  not needed, failing tests must be fixed upfront
nt4_member_smb1 -> fix tests upfront
rpc_proxy_smb1 -> not needed, still has smb1
s4member_smb1 -> dito
simpleserver_smb1 -> move tests to fileserver env
vampire_dc_smb1 -> fix tests upfront


>> 5. Add coresspondong _smb1_done alias envs.
>>
>> 6. Go through the todo list, either
>>    a) just fixing the test if it should genuinely
>>       work with smb2 => remove test from todo list
>>    b) convert failing smb1 tests to use the
>>       envs from 4 => update used test env in todo list
> I guess this answers my question above wrt. above
>>    Step 6 can be spread across volunteers.
>>
>> 7. When the list is fully processed and all remaining tests on the todo
>> list that still need smb1 use one of the new _smb1 envs, disable smb1 in
>> all other envs except ad_dc_ntvfs and s4member.
> 
> I don't like that disabling smb1 by default for the 'normal'
> environments is now a final step, 

yeah, that's true, but I see no other way. We must split
e50b9b9ebddef304caf232c92b8fc83bc1003b1e into pieces, so I don't see a
way without breaking bisectabiliry having smb1 disabled in the envs
causing test failures in the commit series.


> that isn't as nice as starting from an
> initial point where we can clearly see what runs >=SMB2 and what
> doesn't, not only see but actually know (because the default env setup
> would prevent any accidently SMB1 usage) and similarly when you port a
> test you know it isn't still using some SMB1 that you didn't notice.

Well, we'll notice at the end and are forces to fixup then anyway.

The test

samba4.ldap.vlv.python(ad_dc_slowtests)_smb1(ad_dc_slowtests_smb1)

is another example of a test failure that must be investigated instead
of adding a new env.

-slow

-- 
Ralph Boehme, Samba Team                https://samba.org/
Samba Developer, SerNet GmbH   https://sernet.de/en/samba/
GPG-Fingerprint   FAE2C6088A24252051C559E4AA1E9B7126399E46



