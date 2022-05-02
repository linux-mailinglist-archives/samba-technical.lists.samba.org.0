Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DE8A51762F
	for <lists+samba-technical@lfdr.de>; Mon,  2 May 2022 19:58:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=OIhRKqrzl2CJj5vJ+Qs+TuX1sWdz0L6MjA+KjSN6gCE=; b=hjPKxOo2bPUTKCe5qKT4n1jeJC
	CKyeDbTgMyGn/BVTqlqLeSPqd5g1pqEoCtzSL969BdkKgsjTgjEIG73aI/AkM79Z+LZCSWD5AZP3H
	l0tEMetyOxjmfN2TM4capyQ51kbjFIGfgIcurGxG1hyeoAoTBuGMg3y4z67pywxPm9/pTzLWqPPS/
	DGqdz3TG6SZXAcnDeKorWHWEzuC3LEAMZWz/yPT9SA/HfB+41nsIoVWJZwDiDVRIPfknHTwqUhVNu
	B8AcXlVq7CbyWOuM8GrPrpjhzRPGv8cfWED403W7GuA61ZQflBkfUrAYCRAOaAwKmVwLXjN7MNWk4
	bga0lBRA==;
Received: from ip6-localhost ([::1]:45538 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nlaIb-005fE0-1q; Mon, 02 May 2022 17:57:29 +0000
Received: from isrv.corpit.ru ([86.62.121.231]:37025) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nlaIU-005fDr-9F
 for samba-technical@lists.samba.org; Mon, 02 May 2022 17:57:27 +0000
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 4199440124
 for <samba-technical@lists.samba.org>; Mon,  2 May 2022 20:57:26 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id 0EDED10C
 for <samba-technical@lists.samba.org>; Mon,  2 May 2022 20:52:05 +0300 (MSK)
Message-ID: <04c8092a-ccb9-4483-5fbb-1eace2bb2535@msgid.tls.msk.ru>
Date: Mon, 2 May 2022 20:57:18 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: tevent test failures on debian
Content-Language: en-US
To: samba-technical <samba-technical@lists.samba.org>
References: <eec55602-46e4-4561-2aa3-108f789289a1@msgid.tls.msk.ru>
In-Reply-To: <eec55602-46e4-4561-2aa3-108f789289a1@msgid.tls.msk.ru>
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

01.05.2022 23:01, Michael Tokarev via samba-technical wrote:
...
> /usr/bin/make -j1 test
> make[2]: Entering directory '/builds/samba-team/tevent/debian/output/source_dir'
> PYTHONHASHSEED=1 WAF_MAKE=1  `PATH=buildtools/bin:../../buildtools/bin:$PATH which waf` test
> test: test_fd_tag
> success: test_fd_tag
> test: test_timer_tag
> success: test_timer_tag
> test: test_signal_tag
> success: test_signal_tag
> test: test_immediate_tag
> success: test_immediate_tag
> test: test_trace_event_fd__loop
> failure: test_trace_event_fd__loop [
> tctx->before_handler
> ../../tests/test_tevent_trace.c:398: error: Failure!
> ]
> ...

This happens because debian's salsa-ci run whole thing with fd#0 *closed*.

And indeed, I can reproduce this by running

   ./bin/test_tevent_trace  0<&-

Looking at strace, it gets fd#0 for epoll_create().
Next in tevent_loop_one() it tries to add that one into its own fdset,
receives EINVAL, and *closes* fd0.  Wow.

Where it sets this before_handler to true I can't see.
It looks like this should be investigated. Because the callbacks
are *not* fired.

Now this is double fun. Because for one, salsa-ci should have a
reasonable environment, and for two, this test should not fail
in such a disgusting way :)

dh_auto_test run tests with redirecting fd#0 from /dev/null, this
is why it worked.

Thanks,

/mjt

