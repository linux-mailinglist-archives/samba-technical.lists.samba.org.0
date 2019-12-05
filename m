Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B8666114022
	for <lists+samba-technical@lfdr.de>; Thu,  5 Dec 2019 12:31:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=tyvGd/kwKxc1Rwgr7dIyhCk7W7RUIV2wigyizJx7Asg=; b=hgOVadHII+Mh7ClwE2TLC04N8f
	AiENQWx17oXFyQ9WmqMtot1ncVF2OQsu03u8bDXzdRNgrAP6zwSdt97ypceDJdcrra3QiWjK4cUb1
	oKNrv4QBM1/TnRQiy/iq3wQLiIAC9RaFFwHLIK2WXjUAoQESO9hwCvPtHuqpx4RsHvfjPG3WhdeQJ
	gkMHwmb7sQXPjITniA1Z5B/kn0gq6O23SfPuGV0GaUduSALAu4MLS8kely5viIwVy8M2kvbpRUUXF
	3TX6G9uUjyhVeGCB/TlgGjK5hm+hS4CUjX/8LL70XXz+lDtXprqiG5dRi9nyr2h97o12pAGlebl1x
	HBKqq+Jw==;
Received: from localhost ([::1]:43074 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1icpLO-006Bld-Ro; Thu, 05 Dec 2019 11:30:50 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:24878) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1icpLE-006BlW-Sl
 for samba-technical@lists.samba.org; Thu, 05 Dec 2019 11:30:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:Cc:To;
 bh=tyvGd/kwKxc1Rwgr7dIyhCk7W7RUIV2wigyizJx7Asg=; b=Qf4XkPM1na6HiAIO090uNyXnI1
 zofqAd97YLiptNYmvF0NYeBiBfjPVAtc+D3BFLva5K9KC8LWLgUif6VDVjAZRsiTOPW5XJDacQ+Bp
 9li4CpKYGVolzxVHlQeaaknT3IfarjH51RPbZMQLG6NtiK4wDR7fXScDhzpbFYOwWZj0Sg6V22RpB
 bHwnuVF9iXdN22/BwuuzQUU+ozumB/zdd9sdPX+WUwzvYhjxqp8tpjJgXDkpiOHBdwiHyyZX54064
 WYlefcqriblqxrrc/VFCt4Pjmq1NxetDHtxPqT7ek2WoHx+jst45AQ+GBqRsitkw/250OO7TOVro4
 gurN+wZIFyJKUE8vRfPxH9VYqyCMsUnLlHTBrF0DmLsZdKhNhi7GroNdLOBtUwdCCZm5nrI88lNlS
 EtoT4gKHBEyXLCEQkBjBxEYdvBrAivFLk70r/XjTjNNbJU7BIa9ePDAjVKbS14FOsbRZpDFllvwoP
 0D50KsCIZZ+xBfYjR7EkpYwT;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1icpLB-0002ff-KM; Thu, 05 Dec 2019 11:30:37 +0000
Subject: Re: Converting SMB1 tests to SMB2
To: Noel Power <NoPower@suse.com>, npower <npower@samba.org>
References: <f0f71737-cd07-b361-1c26-58116e6e8ed8@suse.com>
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
 <eefa22c5-b0cf-b9e5-3d20-2fe171c53980@samba.org>
 <c6375fc6-7670-56c6-e7fa-e14acd4a4c08@suse.com>
Message-ID: <757e29c2-54bd-74d4-ca66-b4a510404401@samba.org>
Date: Thu, 5 Dec 2019 12:30:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <c6375fc6-7670-56c6-e7fa-e14acd4a4c08@suse.com>
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

On 12/4/19 11:30 AM, Noel Power wrote:
> On 03/12/2019 14:20, Ralph Boehme wrote:
>> sorry for late reply, but I've got my head wrapped in
>> <https://gitlab.com/samba-team/samba/merge_requests/937>.
> understood
>>
>> Sure. Btw, how did you figure out which tests hang?
> Looking in the CI logs

ahh... :)

>>  Do you have a list
>> of those?
> In the last mail I sent, there were instructions for generating the list
> tests that fail when all the envs by default do not negotiate SMB1, part
> of the instructions included an initial skip list, that list was
> attached to the mail, 

yeah, I know, but I was not asking for the list of failing tests, but a
list with *only* the hanging tests.

I was just curious, if you don't have this, nevermind.

Btw, can you add a commit with the instructions and the script? Easier
to find then a mail in this thread... :)

this list also is the list of hanging tests. As
> mentioned my impression was the amount of hanging tests was greatly
> reduced by your ntvfs branch.

Oh, good.

>> https://gitlab.com/samba-team/samba/merge_requests/941
>>
>> Ideally we can make the skiplist a knownfail list. Then every commit
>> that moves a failing test to a new *_smb1 env can comment out the list
>> entry.
>
> well that would mean starting from a point where we have tests not
> running, I don't really like that

well, only starting at one point in the patchset where you disable smb1,
but at the end of the patchset all tests would be running again. My idea
was, that this would aid in having clear, simple, reviewable, CIable
commits.

>>>> $ egrep 'ad_dc_ntvfs|ad_dc_default|ad_dc_slowtest|chgdc'
>>>> selftest/skip_smb1_fails  | wc -l
>>>> 199
>>>>
>>>> 4. Add three new envs that support smb1: ad_dc_smb1, ad_member_smb1,
>>>> fileserver_smbd1, maybe more if featurewise required.
>>> when you say adding envs do you mean just 'shallow' copies or do we
>>> really need to try and go the extra mile to make these new environments
>>> properly independent (my previous attempt failed and it looked like
>>> perhaps alot of changes could ripple from trying this for little gain
>>> since the environments will be removed)
>> yes, just normal/full envs.
> I do believe (from my previous experience) that this is a can of worms,
> admittedly I may have been trying to do this the wrong way or just don't
> see the 'easy' solution, I'll try again

Let me know if you need help. 4a7ec5b7604 is an example how to add a s3
env. Just remember to also update get_realm_ip_mappings() when adding
new s4 DC envs.

-slow

-- 
Ralph Boehme, Samba Team                https://samba.org/
Samba Developer, SerNet GmbH   https://sernet.de/en/samba/
GPG-Fingerprint   FAE2C6088A24252051C559E4AA1E9B7126399E46

