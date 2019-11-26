Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 66206109D38
	for <lists+samba-technical@lfdr.de>; Tue, 26 Nov 2019 12:46:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=BTdFGpcVWJoD6RkBpDg/hPtEKEIzmdeMeH6fwuj3PbE=; b=4oBzKHn1vldSy4CdHhJiPqyigr
	qU51TScShvJOO0YTAN4ru0Z8416TM6zJQIzm3tIU2fZxI4wfN/vkfQG1u19vrlK96MQPigvGEhtHG
	Yu7Y0421jtd9lU3oJMxPvMyOXbO98YPnzw9aSCwSJunzuCPnUXBCHU75+SoNzGyfqRZkY0/VQzzUc
	IUJkGQGdCzM+4d+8dSMNzGG+X3UadWFC4kJvjmtGkU21Mh10FihYqYKj0YWvw9cHWg292J0BRnTte
	0oG2fgb0bi+OGTsT4ZE2D+5iaVqrtsU+EdoMXCqapkEhMNEb/MIKaRDbRdLgxOYwOwdAba99SQheC
	Us6yZHaw==;
Received: from localhost ([::1]:33758 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iZZHy-002PeU-0E; Tue, 26 Nov 2019 11:45:50 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:13778) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iZZHt-002PeN-JV
 for samba-technical@lists.samba.org; Tue, 26 Nov 2019 11:45:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:Cc:To;
 bh=BTdFGpcVWJoD6RkBpDg/hPtEKEIzmdeMeH6fwuj3PbE=; b=i7o9xHUrdnfa500eS+R9jUjEIl
 SQCWUyJ45uS4ImPqDfpemqUrFC5orlELkNARX+hxNN/7AGz8psceW1eYSHGjDGgy2ju6NGxRJrISZ
 vYguSAjFDHtjE1p6bQvzNze5V0jay67DcmCs+xMeHnOM7CMAzrXIdOhXyAtq++o/r9RRoov+HB8Jt
 BjPmIpYcovPBgzYSeqnmssTmtL99tfeNXoBzwLHCSH+33/JJVk4zymJXTt27t5gqBYNfl1QkbKxiU
 RLA6urSEUPDMzt6pQNZGqvB/9tMoUUnss98fD6wyiL14LO3vT/cievtBH7molZBQhJUi+UWybfRhU
 xzg7IpWKYSyt4Oyr0gyfYpg+E6/4m/PdpU0AVN0Ssu6MIv9QIBlWz7WtH5Iil5TDD+xzS+R4SIGGb
 3G65sZbLp+2JPLCE2FbywQUY6rIgUNBzjemZO7VzXT212NHnHBX1o4Oxb/0jtdjw4b7DwQpBoUeQn
 FRrw1+cp0tq4EF3Df73U9+lP;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iZZHr-0005HR-VW; Tue, 26 Nov 2019 11:45:44 +0000
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
Message-ID: <e09044be-713a-f074-ed2f-e41168646d81@samba.org>
Date: Tue, 26 Nov 2019 12:45:43 +0100
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
Cc: Stefan Metzmacher <metze@samba.org>, David Mulder <david.mulder@suse.com>,
 samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi Noel,

On 11/22/19 4:27 PM, Noel Power wrote:
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
> support negotiation of SMB1.

These won't work in make test. You need at least IP addresses.

But worse is that these 18 additional envs may severely impact load on
sn-devel. Remember, on sn-devel all this stuff runs on one machine, not
on seperate containers spread across a datacenter.

The good new is, that I don't believe we need all those new envs.

> I added 2 new CI jobs to run the tests that
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

This looks promising.

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

ok.

>   There are quite a few tests in the skip file that really are SMB1 only
> tests,   in this case
>       a) move the test from '_smb1' env to '_smb1_done' env

Just beware of tests where SMB1 is just the transport and the test tests
FSA layer logic, eg unlink.

>   In both cases the skip_smb1_fail file is updated with comments saying
> the test
>   has been processed
> 
> Currently ~70 tests have been 'processed' trivially in that branch. I
> fear that the work there might be wasted (if the wrong approach is being
> followed) so really it would be great to get this nailed down before
> more complex changes happen

Stepping back a little I think we only need the following:

1. The file with the list of failing tests should not be used as a skip
list. Just maintain a private branch with the changes needed to generate
the list. The list can go into master as eg selftest/smb1-todo or
similarily named.

Ideally the commit that adds the list also included instructions and the
patchset as file that is needed to regenerate the list on sn-devel.

2. Don't disable SMB1 in the ad_dc_ntvfs fileserver. This also applies
when generating the todo list in step 1.

3. Reduce the number of envs that use the s4 NTVFS fileserver. This will
get us rid of a few failing tests from the list. I'm currently running
pipeplines with patches that implement this:

https://gitlab.com/samba-team/devel/samba/pipelines/98598769
https://gitlab.com/samba-team/devel/samba/commits/slow-ad_dc_ntvfs

With 2 and 3 together ~200 test will be removed from the list:

$ egrep 'ad_dc_ntvfs|ad_dc_default|ad_dc_slowtest|chgdc'
selftest/skip_smb1_fails  | wc -l
199

4. Add three new envs that support smb1: ad_dc_smb1, ad_member_smb1,
fileserver_smbd1, maybe more if featurewise required.

5. Add correspondong _smb1_done alias envs.

6. Go through the todo list, either
   a) just fixing the test if it should genuinely
      work with smb2 => remove test from todo list
   b) convert failing smb1 tests to use the
      envs from 4 => update used test env in todo list

   Step 6 can be spread across volunteers.

7. When the list is fully processed and all remaining tests on the todo
list that still need smb1 use one of the new _smb1 envs, disable smb1 in
all other envs except ad_dc_ntvfs and s4member.

8. Again go through the todo list and convert the test to work with
smb1, updating the todo list with an env name change _smb1 -> smb1_done.

Steps 6 and 8 can be intertwined.

metze, does this sound like what we discussed? Did I miss anything?

-slow

-- 
Ralph Boehme, Samba Team                https://samba.org/
Samba Developer, SerNet GmbH   https://sernet.de/en/samba/
GPG-Fingerprint   FAE2C6088A24252051C559E4AA1E9B7126399E46

