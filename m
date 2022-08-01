Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 16B015872B9
	for <lists+samba-technical@lfdr.de>; Mon,  1 Aug 2022 23:06:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=JJI9PV+kh1cLngl5pV5gO1tvIXxqzQwUrQI+WRc3b3E=; b=F/gzxhA3PCTO96NRpHVix3+oQC
	fnoPIoElg55fwnoPIn9jGCVXr3ucwxChKjzP+rcuNRMss/eCqKKzs7fgsj5L8Jw+LxmTfpdAxYsMQ
	FS4tNGmg9AgGWg6UXtej8meVhRmmwQ3tZSojgjNLxSO6uAleNcTlmqz1bW/f0UkfmWgWFg5YlZxtR
	35w6gPjUsXMXpEQ1QAEGDOBmBHIw0Mr08GYoCGr6rrSV3PPSRvnGUwrQ05JtJY2RN8epEizgmnJF2
	0ajdlCJXT0LRwqMoRDpCfuoNdOrB2idcFsSOPEPpd1pCf/GZ9uc1yCC9kc5PEKRh5/4Y3IGdS2gFS
	lLRygnbg==;
Received: from ip6-localhost ([::1]:29798 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1oIcb0-004rO1-Mg; Mon, 01 Aug 2022 21:05:02 +0000
Received: from isrv.corpit.ru ([86.62.121.231]:48443) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1oIcau-004rNs-DB
 for samba-technical@lists.samba.org; Mon, 01 Aug 2022 21:04:59 +0000
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id E3FF840237;
 Tue,  2 Aug 2022 00:04:53 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id 574952A;
 Tue,  2 Aug 2022 00:04:52 +0300 (MSK)
Message-ID: <77541840-870d-b74b-7b46-99475b499bba@msgid.tls.msk.ru>
Date: Tue, 2 Aug 2022 00:04:52 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: running only selected tests in samba sources
Content-Language: en-US
To: Jeremy Allison <jra@samba.org>
References: <587ebe9d-3f91-7389-5ad1-c6d96e435b99@msgid.tls.msk.ru>
 <YugLlNwmCwmWDfPG@jeremy-acer>
In-Reply-To: <YugLlNwmCwmWDfPG@jeremy-acer>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

01.08.2022 20:21, Jeremy Allison via samba-technical wrote:
> On Mon, Aug 01, 2022 at 05:35:15PM +0300, Michael Tokarev via samba-technical wrote:
>> Hi!
>>
>> Is there a way, after successful build of samba source, to run just selected tests
>> without running whole testsuite, *and* without (re)building everything with the
>> --enable-selftest option?
>>
>> Many tests do not require this option to be enabled. For a very simple example,
>> consider lib/ldb/ tests - when ldb is built from its own separate source
>> tarball, it's easy to run its tests. But when it is built as part of whole samba
>> source, an attempt to run ldb tests - even by providing the right test selection -
>> still fails due to main samba wscript checking if --enable-selftest has been enabled.
>>
>> In Debian we used to build libldb from its own source, and running a testsuite there
>> has been useful. But now we build it from main samba source tree and we can't run
>> the testsuite anymore.
>>
>> Many more other tests can be useful without --enable-selftest too.
>>
>> I'm about to patch wscript to omit checks for --enable-selftest options in wscripts..
> 
> make test TESTS=(wildcard test name)

Thank you for the answer Jeremy.

Nope, this is exactly what I tried before thinking about patching the main wscript.

/build/pkg/samba-4.16.4+dfsg$ make test TESTS=ldb*
PYTHONHASHSEED=1 WAF_MAKE=1  ./buildtools/bin/waf test
'test' finished successfully (0.039s)
Waf: Entering directory `/build/pkg/samba-4.16.4+dfsg/bin/default'
	Selected embedded Heimdal build
Waf: Leaving directory `/build/pkg/samba-4.16.4+dfsg/bin/default'
'build' finished successfully (5.712s)
ERROR: You must use --enable-selftest to enable selftest
make: *** [Makefile:16: test] Error 1

Any value for TEST= causes the main selftest/wscript to be run
which, in turn, verifies that --enable-selftest has been enabled
at configure time.  And this is exactly the place I want to patch
out in order to enable *any* test to be run at all.

Thanks,

/mjt

