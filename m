Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id BB6FCDC448
	for <lists+samba-technical@lfdr.de>; Fri, 18 Oct 2019 14:01:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=VbzpBZYkrtsijBPV69OlnxVPO566iaC6ehBcCLP9Ur0=; b=bEipYliQVVEwqDEFwEHx/5MlHT
	y1qKvBydjAMc0T1hBO1c9zM9u6pdx3CeCWkhBF/+LUnu709ASlLoN5k1M0yuPfomVCsnckp0KGpNU
	0qh8HEaxQOvjh0HrMErq3hoJbmgu3/ULzPzenNa915F/aBFfMwKrTlxqDJ12bhgycNXsx/2Esdnbg
	5IHLWRFZ8gpCXxcyiwM3jXyByi20PXWLqpwl2M9pmHOGgFVP7Z0cTpmh2A3FB00tyxBZSw0P28yUa
	kw54SB9n9FAJKhbpOJ4mqhK5aUJfzKd9gvl+Vs6rfYH7feHcK4ueYWEqCu7FzAbcxBsjTeRMzkhKx
	uEQeVmYw==;
Received: from localhost ([::1]:46432 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iLQwE-000H7S-SS; Fri, 18 Oct 2019 12:00:58 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:62940) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iLQwA-000H6w-SX
 for samba-technical@lists.samba.org; Fri, 18 Oct 2019 12:00:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:Cc:To:From;
 bh=VbzpBZYkrtsijBPV69OlnxVPO566iaC6ehBcCLP9Ur0=; b=FHUXrDJKR4Hhz6DkVMBzqda+d6
 M+UNmCNt4Ova8qzIsCtDY6M9i3a7H9r/WBBxPN+89dderdYKU18/+IbzD9hTPvCk2ICrg8ToxNxg2
 frdRCjhjYRdJvKsLKwoifK1y1F6FOV+//snVBm8VWhViUa1iaTRiT9Dr+TcF232hGUtuKpGLxko3C
 4odMTje0LcwVAT0mygtRuIAZXSmY17QQ3YvPfSY4prfjmuyR8w5yEps20WvHfVnkleyUxDM84ogeZ
 Vw6eyMh0hFbINpSJV6a3QpFIj5L/GNPZ01cwf57ybJchUd33rBamyuvI4dA9js8ruIRDh9Iiy1rIk
 PuC82cWYGfKlYt0YTqttpWTpdQXZ085VY20g67XmeEch+HvTqCSFDKQ8FEaHnj7e7dGGYWfyBJp9m
 PJXMgW1h25n3qan5NydeogQtvmRx+wDFk785XTxIy7uXCVF2xx0I+tJBZ3VCTObtjx7Kc1RHcJdB2
 gQRgWHqoqvjwx1UuImixbomt;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iLQw9-0004g3-R6; Fri, 18 Oct 2019 12:00:53 +0000
Subject: Re: Converting SMB1 tests to SMB2
To: noel.power@suse.com
References: <f0f71737-cd07-b361-1c26-58116e6e8ed8@suse.com>
 <be6770e5-5bf0-4665-4a88-3e4182e4c82e@samba.org>
 <0981db46-93bf-f153-c98f-15d5cf404353@suse.com>
Message-ID: <ed7eb92f-46a7-758e-f3b5-185d71b8b98a@samba.org>
Date: Fri, 18 Oct 2019 14:00:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <0981db46-93bf-f153-c98f-15d5cf404353@suse.com>
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

On 10/17/19 10:14 PM, Noel Power wrote:
> So as a first step I tried (via brute force) e.g. changing the min
> protocol definitions in the generated conf files for the test
> environments, running the tests and seeing what was failing. I then
> disabled (and/or) deleted tests to get to a point where all running
> tests pass with 'min protocol = SMB2_02'. The intention here was to
> enumerate the tests involve

I guess I would put all failing tests into selftest/knownfail.d/smb1

I'd try to generate the list with

<https://git.samba.org/?p=slow/samba.git;a=commitdiff;h=0fa5ae9d30546e46a5db9ecf7936768f69a1e957>

then running autobuild-private-security.sh on sn-devel.

Then with grep UNEXPECTED *.stdout you get a first (but incomplete) list:

<https://git.samba.org/?p=slow/samba.git;a=commitdiff;h=4e2788f7d494b6e402784d217f37c08b985f3d7a>

I noticed a crash in smbtorture is triggered by a test, so there's
likely some iterations needed to manually filter out tests that induce
crashes.

> 
> I tried to list the tests for each environment (with/without) the
> changes, I am attaching the diff of tests here (sorted by test env) be
> aware there maybe some minor errors in there, the diffs were ugly and
> needed to be tweaked by hand and I most likely made some minor
> mistakes.  The build (with brute force changes) to do this can be found 
> https://gitlab.com/samba-team/devel/samba/commits/squash-smb2-only
> 
> My plan is to first move all of these tests identified above to suitable
> smb1 environments (e.g. nt4_dc_smb1) etc. So we
> 
> a) can clearly see the tests that need to be deleted/ported/fixed

I guess I would take the knownfail list as basis to for fixing stuff.
Whenever commits change/fix things you also update the knownfail list,
so make test always passes with each commit.

I don't think the additional work of letting the tests use a different
testenv really helps. We'll just have to go through the knownfail list
and look at each failing test to see what's needed to fix it.

> 
> b) we can immediately delineate the smb1 vs >= smb2 tests  and be sure
> we don't lose anything along the way
> 
> I've started as a proof of concept
> https://gitlab.com/samba-team/devel/samba/commits/separate-smb1-tests to
> migrate tests
> 
> Does this make sense? I expect it will be a bit time consuming to
> separate the tests (when some may be just deleted) so I wonder do others
> think it is worth it (personally I do) But I'd like some other opinions
> before continuing down that road :-)
> 
> In the end I suppose the tests that fail will fall into 1 of the
> categories below
> 
> a) a test that tess > SMB1 only functionality or messages (probably these
> can be just deleted)

yes.

> b) a test that tests SMB1 functionality but doesn't and should test the
> same functionality  >=SMB2 (needs porting)

yes.

> c) A test that maybe isn't essentially SMB1 or greater but that perhaps
> fails with the new defaults for some reason. For example;
> 
>    + a blackbox test scripts might have some parts working with e.g. NT1
> mixed with other bits that are using >= SMB2 (needs rewriting)
> 
>    + a python test may have mixed SMB1 & >=SMB2 tests in the same test
> module (needs rewriting)
> 
>    + some test you would expect should pass with the new min protocol
> but doesn't (therefore needs investigation)

Do we have such beasts? Heavens!

> So, if anyone can immediately identify say any tests we can just delete
> or port from the attached list of test diffs, that would be useful :-)
> Could save us some time digging.

I guess one of the first things I'd look as is all the torture tests
that run against both nt4_dc and ad_dc. I guess for most it's ok to just
run them against either one.

Everything else probably has to be assessed one by one.

Note that tests ported from smb1 to smb2 must also pass against Windows.

Fwiw, once you get to the base.delaywrite tests be warned, that Windows
behaviour is different between Windows 2003 (which is what Samba
implements) and Windows 2008 or newer. It's also different between SMB1
and 2, see

https://bugzilla.samba.org/show_bug.cgi?id=13594

-slow

-- 
Ralph Boehme, Samba Team                https://samba.org/
Samba Developer, SerNet GmbH   https://sernet.de/en/samba/
GPG-Fingerprint   FAE2C6088A24252051C559E4AA1E9B7126399E46



