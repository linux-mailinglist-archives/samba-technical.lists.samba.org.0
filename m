Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FEBB629D06
	for <lists+samba-technical@lfdr.de>; Tue, 15 Nov 2022 16:09:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=JSoJk4wmoMEMdbSfB5SDpWl+qbSP/HdfH208hG0XfUE=; b=nqm8LJdeAInpzRVflT9LKlzu84
	yDgMViUKLcm/tZVJECxgDe4LmPNhd001Q5oTsOv4NZQ9jw1FtnnVV4Fpa8z0+gzoNLw5aotfeykrN
	xO/0drssCuHRge8nFNRxACLnvYe7xty9P3MYZsyVLL9c1VauRZmBxrN/a3rYsb8rcjYdmbqTOgBYC
	ea3L8x/s5AWSwnb/+gFXNh++sP4hb+RgSwQ6H/qVENk4bavEGY1Yu9kUmpPBK2TAVMorzhvepLqve
	J89c9OKowBUOgEZDbHZP5GtBrBVCDGLd4nbYcJddIMFeHI8URZSRSptDUIBFHjPow/rrvN17wpnOs
	un4VT90w==;
Received: from ip6-localhost ([::1]:19464 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ouxZI-00Dp5E-Ui; Tue, 15 Nov 2022 15:09:45 +0000
Received: from isrv.corpit.ru ([86.62.121.231]:42753) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ouxZC-00Dp0h-LY
 for samba-technical@lists.samba.org; Tue, 15 Nov 2022 15:09:42 +0000
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 225D4402B5;
 Tue, 15 Nov 2022 18:09:28 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id 08F5410C;
 Tue, 15 Nov 2022 18:09:27 +0300 (MSK)
Message-ID: <6b2c8e12-d888-9230-2d18-aa73080c6967@msgid.tls.msk.ru>
Date: Tue, 15 Nov 2022 18:09:26 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: failing tests in the testsuite on debian
Content-Language: en-US
To: Ralph Boehme <slow@samba.org>, samba-technical@lists.samba.org
References: <4197c161-ef1e-3710-f50e-7631ddaf5f3f@msgid.tls.msk.ru>
 <de87d255-95d0-ac34-1544-fa0aac441f4b@msgid.tls.msk.ru>
 <dccabfb1-bc92-6c95-b45d-8cc69f650fb9@samba.org>
In-Reply-To: <dccabfb1-bc92-6c95-b45d-8cc69f650fb9@samba.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
From: Michael Tokarev via samba-technical <samba-technical@lists.samba.org>
Reply-To: Michael Tokarev <mjt@tls.msk.ru>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

15.11.2022 17:45, Ralph Boehme via samba-technical wrote:
> On 11/15/22 14:35, Michael Tokarev via samba-technical wrote:
>> I experimented with the tests some more. Thank you Jeremy for the
>> tip about escaping spaces in the knownfail files, - somehow I noticed
>> this is the case in other places but didnt' think about using escapes
>> in my "knownfails".
>>
>> But the thing, or a request for help actually, is still here.  I found
>> out that samba testsuite is unreliable.
> 
> sort of. It is just picky about choosing it's distro friends. :) A full pass can basically only be expected on the specific distribution that is used 
> on gitlab CI and our final git gatekeeper (that runs a final make test before doing a git ff push). Iirc we're still using Ubuntu 18.04 on the git 
> gatekeeper and the CI containers, cf:
> 
> <https://gitlab.com/samba-team/devel/samba/-/jobs/3324388385>

I never tried to run full testsuite, though I don't really understand
why it is supposed to fail.  But this is not a question.  I mentioned
several times

> Another thing that might cause issues is that you seem to be running waf directly while you should use the make wrapper as that sets some important 
> environment variables.

Please tell me all about it ;)
Not really, I might be the one who knows about it more than anyone else.
wafsamba now refuses to start if PYTHONHASHSEED is not set to 1.

A side note here: ./buildtools/bin/waf --help is the only way to know
how to run stuff and which options are there.  It's a large set already,
and for example, it is not obvious already how to specify more than one
test to run.  But when these options are wrapped by a Makefile, you have
to consult waf --help first, next you go to the Makefile to see how it is
translated into the make command line, and after spending more time trying
to figure it, forgetting which options you tried to use already, and finally
finding out it is not even implemented in the Makefile, you *have* to go
and run waf directly after all, after setting this PYTHONHASHSEED thing.
And this is the only thing which is documented *somehow* :)

> It seems your goal is running the full testsuite as part of packaging and I can only warn you that this likely a huge timesink. Eg some tests expect 
> certain filesystems, maybe it's a more reasonable approach to only run a subset of tests that we run in our -o3 runners, eg:

No, I never said this was my goal. I just want to run something quick
to verify I haven't screwed up something obvious, that's all, and not
even make it the default - just for me to be a bit more confident with
next packaging effort.

What I want to do is to figure out why a certain test is failing, and
how to make it work.  This does not seem to be filesystem-dependent,
at least by the test names.  This might serve as an example for me
about how to address it in the future, to learn, - since this whole
selftest thing is a big monster now, I just don't know from what
side to address it.

This rpc thing - why it is failing, this particular example - it looks
like the test is wrong somehow (due to the messages being produced),
or maybe there's some package missing.  This huge pipeline run by
waf with lots'a environment setting, socket_wrapper, all this stuff, -
I'd love to disassemble it just a little bit, - after trying to
read the sources, I gave up and just replicated what's been in
/proc/{pidoftestsuite.pl}/environ, - this one seems to work but
it fails later in a different way.

> https://gitlab.com/samba-team/devel/samba/-/jobs/3324388357
> 
> make test FAIL_IMMEDIATELY=1 TESTS='--exclude=selftest/slow-none --include-env=none'

Aha, it didn't occur to me one can use --options in TESTS=, it looked
like it is a list of foo,bar,baz tests to run. So it's not TESTS really,
it is TESTOPTIONS or something.

> or this one
> 
> https://gitlab.com/samba-team/devel/samba/-/jobs/3324388385
> 
> which includes more envs:
> 
> make testonly FAIL_IMMEDIATELY=1 TESTS='--include-env=fileserver --include-env=fileserver_smb1 --include-env=fileserver_smb1_done 
> --include-env=maptoguest --include-env=ktest'

Also I'd love to know which things do exist there - very basic overview.
I found out the "quick" list, which *looked* like it might be useful
during regular package build time, but it looks like it isn't maintained,
and includes things which shouldn't be there but does not include some
other but important things.

Thank you for the answer!

/mjt


