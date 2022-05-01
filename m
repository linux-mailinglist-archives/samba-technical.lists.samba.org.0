Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 6568351679F
	for <lists+samba-technical@lfdr.de>; Sun,  1 May 2022 22:02:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=FwZ1rNOvQDHYkpGC1If1h+FyJFcEJbSwYGjJl9hTDIg=; b=TuWxclD3RDc3ughSPbcnB9lgUa
	23iVkDLmGJ231nR/gbxUSuzPAFOfOaB992iMu1MkFsGI+00MYf+bzZyzXAQ33OBsW4zaj20D5br9x
	6CDe3JlBYlMBSzMlnf4A5LMlSg0VW/VuEBYBcsH19hw0/fXels7toNAfcQEreSYu+d1D/KeUIpyuj
	tzlh0b72aKDe8Q93qzXWEU6YK2UM0d3gisO3tMlsh63Yoiwuc/pbUKqDkpcil6BOKnmCpvl8sk6GL
	Ari1e7D0bBYNj2Jnk/P1zvRkyMSjGvwDaIY25C5C2kRBlGfboXISe+7C1h8cjLlCbxaIzQqrj1SBi
	ne/MO7eA==;
Received: from ip6-localhost ([::1]:21484 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nlFkl-005SkG-R4; Sun, 01 May 2022 20:01:11 +0000
Received: from isrv.corpit.ru ([86.62.121.231]:51455) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nlFke-005Sk7-74
 for samba-technical@lists.samba.org; Sun, 01 May 2022 20:01:09 +0000
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 0F6A64001E
 for <samba-technical@lists.samba.org>; Sun,  1 May 2022 23:01:06 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id C48B310C
 for <samba-technical@lists.samba.org>; Sun,  1 May 2022 22:55:46 +0300 (MSK)
Message-ID: <eec55602-46e4-4561-2aa3-108f789289a1@msgid.tls.msk.ru>
Date: Sun, 1 May 2022 23:01:00 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-US
To: samba-technical <samba-technical@lists.samba.org>
Subject: tevent test failures on debian
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
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi!

I'm seeing somewhat strange, to my taste, tevent test failures on
debian salsa-ci, without an apparent reason, which is quite puzzling.

The change which triggers the failures seems to be quite innocent.
It is the debian tevent binary package build procedure, which is done
in a form of makefile (named debian/rules), with a help of a set of
"debhelper" tools.  Here's the commit which immediately triggers the
failure:

--- a/debian/rules
+++ b/debian/rules
@@ -35,2 +35,5 @@ override_dh_auto_build: bin/config-stamp

+override_dh_auto_test:
+       ${MAKE} -j2 test
+
  override_dh_auto_install:

what is going on there. debhelper which is used to build this package,
runs override_dh_auto_build target, which builds the package
(${MAKE} all). Next, if there's no override_dh_auto_test target
in d/rules, it runs dh_auto_test, which by default runs this:

   make -j2 test VERBOSE=1

which turns into

  PYTHONHASHSEED=1 WAF_MAKE=1  `PATH=buildtools/bin:../../buildtools/bin:$PATH which waf` test

and this one succeeds.

Now I'd love to experiment with the test target, to make it verbose.
So I override dh_auto_test target and run ${MAKE} directly just like
dh_auto_test does, as per the above diff.  This target is now being
run instead of the default dh_auto_test, and it gives:

   debian/rules override_dh_auto_test
make[1]: Entering directory '/builds/samba-team/tevent/debian/output/source_dir'
/usr/bin/make -j1 test
make[2]: Entering directory '/builds/samba-team/tevent/debian/output/source_dir'
PYTHONHASHSEED=1 WAF_MAKE=1  `PATH=buildtools/bin:../../buildtools/bin:$PATH which waf` test
test: test_fd_tag
success: test_fd_tag
test: test_timer_tag
success: test_timer_tag
test: test_signal_tag
success: test_signal_tag
test: test_immediate_tag
success: test_immediate_tag
test: test_trace_event_fd__loop
failure: test_trace_event_fd__loop [
tctx->before_handler
../../tests/test_tevent_trace.c:398: error: Failure!
]
...

it *seems* to be doing exactly the same thing (minus the VERBOSE=1),
I even added the same -j2 just out of curiocity (it fails without -j too).
But the test fails.

What is this particular test about, anyway?  There's one more test
failing in the same way:

test: test_trace_event_fd__free_in_handler
failure: test_trace_event_fd__free_in_handler [
tctx->before_handler
../../tests/test_tevent_trace.c:491: error: Failure!
]

(which is also about before_handler).

What this particular failure means?

The logs:

https://salsa.debian.org/samba-team/tevent/-/jobs/2666368 -- build ok
https://salsa.debian.org/samba-team/tevent/-/jobs/2666380 -- test fails

Help?

Thank you!

/mjt

