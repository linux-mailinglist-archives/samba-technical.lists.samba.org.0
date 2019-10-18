Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 25AEFDCC5B
	for <lists+samba-technical@lfdr.de>; Fri, 18 Oct 2019 19:11:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=xzWPf7ZrGXT+iH4KwQREHzB3FjB3q6YgqRV3IhUXpRA=; b=kMhWEMPKRHFKCQ2lXPuh1Ge3/n
	2ESpIyuXwRZuh/NnA66zrgmp0BWioRjZdXj2YCkuy1bFcv9ReVAAX2s2hOE6t/xC6duqqiUW23sj7
	BVHW7e+WoeHqEedhP6f4pqDu98gDGG4JtSyDoRCo/9pz/zA7qAmnNPGX21Mo2qQ9ThX2aZlcmx/Hb
	USxmacVIbqZPqx0X2CQjQogAi8fNetSF3p/qPnBrwGPIs4L3+tguBIy/f6CYKkuCUuGYYDO/TSyG8
	1ccV4RLaxHLofkNQ6N6qznVsmpz+PCCFFRAGFiPNwAK2+nK0SKLuNi76jGK1nbYnQWrDdG6jx02Js
	KTqcs6ug==;
Received: from localhost ([::1]:28414 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iLVmG-000Mfv-Ol; Fri, 18 Oct 2019 17:11:00 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:32790) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iLVmC-000Mfn-KU
 for samba-technical@lists.samba.org; Fri, 18 Oct 2019 17:10:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:Cc:To;
 bh=xzWPf7ZrGXT+iH4KwQREHzB3FjB3q6YgqRV3IhUXpRA=; b=deh8wN7MT8SUE+4YOOeNL9V2lc
 e5+GvB1APoeDg8h8rim3kAlJfLxEmkkPsZM7zUy4/WiT/Ugq9OYQnHPUfCT/SxNaIUxcwomEmb28G
 jvRNA+1XkhfoRrqIOYVavk57xPiTldNW1FaMLb3WkjdVIVhxf+0Mlb2IGL+51UoVLgVKaoFnCoD81
 B+pXdq6tJkbELS2yN+AfuM+ruZqTnO1n+dimSnZzy7ukPihRGrHncQdC3C50kcz8J+sfpaitutqK3
 74u39l2AgUsvnXW4Zr722oaSeTnOe+P+LGTyMlfrJ77NB8zyF9EpOZPHSqccy7FBQckhLLK4qO1cu
 1jar4IVwHsveuuXOBXjBwhOzQa5e5k59qO8CXWuCqHf/vOxYdJORq669RuZe6npFxiXu74q1jr/X9
 cm54wZCAXwjIwKt7UOdDmix6feYKFSf2Y/YmNhQ97os9wOReRuc0Z5ZkdNgreygZDsOHNpNFgUdYb
 U78iMQW49bZ0Nk6ZwY2e9hUK;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iLVmA-0007i7-Th; Fri, 18 Oct 2019 17:10:55 +0000
Subject: Re: Converting SMB1 tests to SMB2
To: npower <npower@samba.org>, noel.power@suse.com
References: <f0f71737-cd07-b361-1c26-58116e6e8ed8@suse.com>
 <be6770e5-5bf0-4665-4a88-3e4182e4c82e@samba.org>
 <0981db46-93bf-f153-c98f-15d5cf404353@suse.com>
 <ed7eb92f-46a7-758e-f3b5-185d71b8b98a@samba.org>
 <002434db-63ef-edad-d091-76e3efe783d1@samba.org>
Message-ID: <15dfbaf6-c774-debe-b61e-c3ef4e7f9727@samba.org>
Date: Fri, 18 Oct 2019 19:10:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <002434db-63ef-edad-d091-76e3efe783d1@samba.org>
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

On 10/18/19 6:12 PM, npower wrote:
> Hi Ralph,
> 
> On 18/10/2019 13:00, Ralph Boehme wrote:
>> Hi Noel,
>>
>> On 10/17/19 10:14 PM, Noel Power wrote:
>>> So as a first step I tried (via brute force) e.g. changing the min
>>> protocol definitions in the generated conf files for the test
>>> environments, running the tests and seeing what was failing. I then
>>> disabled (and/or) deleted tests to get to a point where all running
>>> tests pass with 'min protocol = SMB2_02'. The intention here was to
>>> enumerate the tests involve
>> I guess I would put all failing tests into selftest/knownfail.d/smb1
> I initially thought about doing this but ran into problems (see below)
>>
>> I'd try to generate the list with
>>
>> <https://git.samba.org/?p=slow/samba.git;a=commitdiff;h=0fa5ae9d30546e46a5db9ecf7936768f69a1e957>
>>
>> then running autobuild-private-security.sh on sn-devel.
>>
>> Then with grep UNEXPECTED *.stdout you get a first (but incomplete) list:
>>
>> <https://git.samba.org/?p=slow/samba.git;a=commitdiff;h=4e2788f7d494b6e402784d217f37c08b985f3d7a>
>>
>> I noticed a crash in smbtorture is triggered by a test, so there's
>> likely some iterations needed to manually filter out tests that induce
>> crashes.
> 
> not only crashes but also hangs. There seems to be a whole pile of tests
> that hang (with the min protocol changes I did) this and the crashes
> kindof put me off trying to use a knownfail (because the for that to
> work you need the tests to run and complete)  So for the problematic
> tests you are left then with the choice of removing them from set of
> running tests (I really don't like that) or fix the hangs and crashes
> which are more than likely happening in SMB1 tests we will throw away :/

well, I guess we need an initial list of all those tests in
selftest/skip-smb1 and  something like this

env.OPTIONS += " --mitkrb5 --exclude=${srcdir}/selftest/skip-smb1"

in selftest/wscript.

And then figure we have to figure out why they crash or hang. Once we
know that, we can fix or remove the test.

> However if we just want to generate a list well I'd say I probably can
> do better than I did maybe using autobuild-private-security.sh in
> combination with/without the changes I already have.

I think we need a complete list *before* doing any changes.

>>> So, if anyone can immediately identify say any tests we can just delete
>>> or port from the attached list of test diffs, that would be useful :-)
>>> Could save us some time digging.
>> I guess one of the first things I'd look as is all the torture tests
>> that run against both nt4_dc and ad_dc. I guess for most it's ok to just
>> run them against either one.
>
> not sure I get what you mean here, what is the significance of tests
> that run against these environments (I realise this is probably
> obvious... but not to me :-))))

I guess that's just historical practice. Look at s3/selftest/tests.py,
the final else for the block that sets up the smbtorture test is

else:
    plansmbtorture4testsuite(t, "nt4_dc", '//$SERVER_IP/tmp \
       -U$USERNAME%$PASSWORD')
    plansmbtorture4testsuite(t, "ad_dc", '//$SERVER/tmp \
        -U$USERNAME%$PASSWORD')

For most tests this is not needed and it bloats your list of failing tests.


>>
>> Everything else probably has to be assessed one by one.
>>
>> Note that tests ported from smb1 to smb2 must also pass against Windows.
>>
>> Fwiw, once you get to the base.delaywrite tests be warned, that Windows
>> behaviour is different between Windows 2003 (which is what Samba
>> implements) and Windows 2008 or newer. It's also different between SMB1
>> and 2, see
>>
>> https://bugzilla.samba.org/show_bug.cgi?id=13594
>
> I'm afraid to look, sounds awful

Just remember to come back to me when you start working on this.
Hopefully by then I know what's going on.

-slow

-- 
Ralph Boehme, Samba Team                https://samba.org/
Samba Developer, SerNet GmbH   https://sernet.de/en/samba/
GPG-Fingerprint   FAE2C6088A24252051C559E4AA1E9B7126399E46

