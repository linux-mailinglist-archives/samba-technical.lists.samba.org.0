Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 81F2AE174F
	for <lists+samba-technical@lfdr.de>; Wed, 23 Oct 2019 12:05:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=F1saoU5cNTDwtp0Y/PNTjLzh+nACdb5SoOt0LjxXGpE=; b=B/u/i9E2ejZGd+leBvfiCfeOjd
	GvIa97cRfzQxE1SJ/Gw12DCX6G2NsLLIJyLfThoSDQlqpz0oiwaz2j4/MCY/r/WqJO3eaNyPK9M2Y
	wnV6DXOovaIJNTdp7p8iNyHRImOPen3WcS2mjyY+dzOjtquCeLsh1QYQqWzFgDNxvktIx8v+gBjCy
	X1Q3VAas//vr6PRHxRH8fYP3mrH33A7XCLWUbQ6qa2ANmRNbhnTupN06VHeIoxkUf+saeJjeSSly7
	ENRchj4F4h1+jEIRPmBybT735mIpfzrDFYfRgSLCaCmp8sM9X0xXu5kC0A+4sCFM1RyiDJ+A3dXKD
	4X5ohv7Q==;
Received: from localhost ([::1]:51268 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iNDW5-001drE-Pv; Wed, 23 Oct 2019 10:05:21 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:40510) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iNDVz-001dr7-8E
 for samba-technical@lists.samba.org; Wed, 23 Oct 2019 10:05:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:Cc:To;
 bh=F1saoU5cNTDwtp0Y/PNTjLzh+nACdb5SoOt0LjxXGpE=; b=TXyDFo5uXR1Mu0br+Wqyme0BKy
 lKlPipPDpxFan/7JV6QnOU6jf6eJPqAFMga6fwcHC4k35Sx40zIaQoocePLt7jxjqXpeWvwrpIodC
 hURXo4vidu6YNtXHLg5b3jWptH7yW9qFZrmmTBnwra1D+o7XgdOxdB0u2DzsO5nhVWBeiY8M9vaSa
 xd/fAyKtrMSMjMa4KZyke4m67u0HwkRzwbj+QMAqJJI1d0LpKrE5HdukDDyw4sne3rqZsv4r3DL5D
 hvp21/lxhb5AKRBzo/Y65zI/6e7G4unv3Ew283KdSbyqMxb7V5NRCovGuqAC73B3kJ9zyNNoeWR9w
 09Zwdc+CKXd61zLrqax279c8m2SYOmmIVBO7+9QP3yzoMcMi+5lcX2vInN/lNGQ+vFyTP9qDDwSaz
 3ushFokx1/TDip7ak4onsai0ULvzYZEzWFYRnubv/fJlu/AqM1mRrlW+T5CSzklutIorwguImA9Q6
 fq/UzDUvZO5WG/bH8uDCNW6b;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iNDVw-0008I1-GU; Wed, 23 Oct 2019 10:05:12 +0000
Subject: Re: Converting SMB1 tests to SMB2
To: npower <npower@samba.org>
References: <f0f71737-cd07-b361-1c26-58116e6e8ed8@suse.com>
 <be6770e5-5bf0-4665-4a88-3e4182e4c82e@samba.org>
 <0981db46-93bf-f153-c98f-15d5cf404353@suse.com>
 <ed7eb92f-46a7-758e-f3b5-185d71b8b98a@samba.org>
 <002434db-63ef-edad-d091-76e3efe783d1@samba.org>
 <15dfbaf6-c774-debe-b61e-c3ef4e7f9727@samba.org>
 <d9625941-c85a-a686-2162-30c80a2e84b3@samba.org>
Message-ID: <fa464ebe-cfe7-1d6e-7435-c896e2cc188e@samba.org>
Date: Wed, 23 Oct 2019 12:05:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <d9625941-c85a-a686-2162-30c80a2e84b3@samba.org>
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

On 10/23/19 11:56 AM, npower wrote:
> On 18/10/2019 18:10, Ralph Boehme wrote:
>> env.OPTIONS += " --mitkrb5 --exclude=${srcdir}/selftest/skip-smb1"
> why do we need to add  '--mitkrb5' ?

oh, sorry, copy/paste mistake. We don't need that. :)

>>>>> So, if anyone can immediately identify say any tests we can just delete
>>>>> or port from the attached list of test diffs, that would be useful :-)
>>>>> Could save us some time digging.
>>>> I guess one of the first things I'd look as is all the torture tests
>>>> that run against both nt4_dc and ad_dc. I guess for most it's ok to just
>>>> run them against either one.
>>> not sure I get what you mean here, what is the significance of tests
>>> that run against these environments (I realise this is probably
>>> obvious... but not to me :-))))
>> I guess that's just historical practice. Look at s3/selftest/tests.py,
>> the final else for the block that sets up the smbtorture test is
>>
>> else:
>>     plansmbtorture4testsuite(t, "nt4_dc", '//$SERVER_IP/tmp \
>>        -U$USERNAME%$PASSWORD')
>>     plansmbtorture4testsuite(t, "ad_dc", '//$SERVER/tmp \
>>         -U$USERNAME%$PASSWORD')
>>
>> For most tests this is not needed and it bloats your list of failing tests.
> 
> ok, I probably will need help to figure out when this is needed or not
> (or some recipe to determine that) and same for lots of other things,
> but.... lets not worry about that for now, there must be plenty of low
> hanging fruit to start with (low hanging fruit == "smb1 tests that have
> smb2 equivalents) that could be removed. My current WIP branch (with a
> skip approach) is
> https://gitlab.com/samba-team/devel/samba/commits/npower_exclude_smb1failures
> 
> This branch sets the test envs with 'min protocol = SMB2_02' and
> provides a skip file with the current list of failing tests. The skip
> file inclusion and test environment manipulation are *not* optional in
> this branch (effectively this branch hardcodes SMB2 only)
> 
> The question now is how to proceed with this in a workable way, I am
> presuming that we can't just switch over to SMB2 and leave a whole pile
> of effectively disabled tests :-) and this is where I was coming from
> with the idea of moving the failing tests to smb1 environments (the
> intention was then to create some new test jobs to run the failing tests
> with these environments). Since we now have a list of tests in a skip
> file, the same file could also be used as a test list source [2] we just
> need some scaffolding in the test code to adjust the test environment
> 'min protocol' settings bases on some switch, flag, env variable or
> whatever.
> 
> In otherwords I'd like to
> 
> a) make the tests use 'min protocol = SMB2_02' by default and
> additionally use the skip file
> 
> b) run the tests defined in the skip file in new jobs [3] where the
> existing environments somehow get the *old* 'min protocol' values.

Why? Sorry, but I don't understand why you want to do that. Once we have
the skiplist with failing tests, we just have to get down and dirty and
work our way through the list one item at a time.

For each item we:

- check is the *same* test already exists as a SMB2 tests

- if no: rewrite test as smb2 test

- remove smb1 test, remove entry from skip list

Am I missing something?

Thanks!
-slow

-- 
Ralph Boehme, Samba Team                https://samba.org/
Samba Developer, SerNet GmbH   https://sernet.de/en/samba/
GPG-Fingerprint   FAE2C6088A24252051C559E4AA1E9B7126399E46

