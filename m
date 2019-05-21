Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (unknown [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 17E9E24686
	for <lists+samba-technical@lfdr.de>; Tue, 21 May 2019 06:02:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=QwZWU1ACZT32v6ASbTDto+LXs5zvOmPVOQL8GCK4A2E=; b=0jQ3FTCQU0lbQo7LSFOAwsZY/D
	+k3TrmaQnXX18qNkx82zn598KakUv85JC0srshTsiXO605BZwX5oLLmjR9y4XX4GK+gF9U9TCdds0
	C5lF0fYSg0N9I2tNR9RhZAzCMrLTL48PoxslJZ3kaeuNszmz6jZ26QBTE3sRv7hb5KT3xjZkSKSXk
	ApGdEtrJHHdBl8Ygned3VuAt1Qk7KYuK7hcJUL0KX/pLt3jhcspKP26/WC1QVdtwdHApXjZskk1oB
	FoMYUHjnTDBbbSjSeTfFd4pa6Y3dbGvXxoprztnJq2S1f1fHJtQdwfVoSkU6uFkR5GKmzY9gRqWqz
	w/Vo/t3Q==;
Received: from localhost ([::1]:29954 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hSvym-000tVj-CW; Tue, 21 May 2019 04:02:20 +0000
Received: from cat-porwal-prod-mail1.catalyst.net.nz
 ([2404:130:4080::4]:47240) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hSvyg-000tVc-Qa
 for samba-technical@lists.samba.org; Tue, 21 May 2019 04:02:18 +0000
Received: from [IPv6:2404:130:0:1000:4936:606f:4f84:94dc] (unknown
 [IPv6:2404:130:0:1000:4936:606f:4f84:94dc])
 (Authenticated sender: gary@catalyst.net.nz)
 by cat-porwal-prod-mail1.catalyst.net.nz (Postfix) with ESMTPSA id DF6E881169; 
 Tue, 21 May 2019 16:02:06 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=catalyst.net.nz;
 s=catalyst; t=1558411327;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:openpgp:openpgp:autocrypt:autocrypt;
 bh=QwZWU1ACZT32v6ASbTDto+LXs5zvOmPVOQL8GCK4A2E=;
 b=TQOMegZr78DSgvAO49QL20r4a3NFHwRKDqt2hgSc/wCn9NrEmYJ14Mts4tHi4JeO6vwRhq
 RbAUDAalJSFdBeiZSX7qg2kgImlyAU63jtrMs5rFs7c4d2qsdUWpeuHFzrdXfnVFM5i17n
 gAJDxNhi9t241WJa/xTVYi9Os3DdA1k=
Subject: Re: dcerpc.bare test is a bit flappy
To: Tim Beale <timbeale@catalyst.net.nz>
References: <e538c255-9698-0464-f4c1-4116c2ed8c6d@catalyst.net.nz>
Openpgp: preference=signencrypt
Message-ID: <db3b1be6-b850-3ba5-58b7-1dfb0c5bdb8e@catalyst.net.nz>
Date: Tue, 21 May 2019 16:02:05 +1200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <e538c255-9698-0464-f4c1-4116c2ed8c6d@catalyst.net.nz>
Content-Type: text/plain; charset=utf-8
Content-Language: en-NZ
Content-Transfer-Encoding: 8bit
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=catalyst.net.nz;
 s=catalyst; t=1558411327;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:openpgp:openpgp:autocrypt:autocrypt;
 bh=QwZWU1ACZT32v6ASbTDto+LXs5zvOmPVOQL8GCK4A2E=;
 b=QF/nYKZz5wCvQ9vEqfY21Y8/sRGutW8aqYm3zpkCdMfUw3/esOSlSFVrIFARwJuTXqXm6W
 CqldPLQrJ5WIF12WLTd3KsT6mTDjMrgVW1Vao6jr6A+88Z+yminY4xycJ2QV3WFdbPrkGa
 LU+DQ83KAjLHW6oQlCwmIgRWPg8uFuo=
ARC-Seal: i=1; s=catalyst; d=catalyst.net.nz; t=1558411327; a=rsa-sha256;
 cv=none;
 b=SqgQaW2wTXKKPbhsnQ/NKlYxRhg1EitqVqbV6ipiW6OXHA7KfOfij+TmQk8yTHs849nEkW
 ejIKcYwnyJmkWeYKCTwwnLA9d31u67JwNe9ACfxQ8686Jx8RG0KRvhADfUczv/t0PnSX2A
 5VJKTSGP1uxd4/ZEMWWJ7L6A5DVNPCk=
ARC-Authentication-Results: i=1; ORIGINATING;
 auth=pass smtp.auth=gary@catalyst.net.nz smtp.mailfrom=gary@catalyst.net.nz
X-BeenThere: samba-technical@lists.samba.org
X-Mailman-Version: 2.1.23
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
From: Gary Lockyer via samba-technical <samba-technical@lists.samba.org>
Reply-To: Gary Lockyer <gary@catalyst.net.nz>
Cc: samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

I'll take a look at this, probably tomorrow. But running with
AddressSanitizer enabled I get
=================================================================
==10844==ERROR: AddressSanitizer: heap-use-after-free on address
0x612000008920 at pc 0x7f4c173d7a81 bp 0x7ffd153bdea0 sp 0x7ffd153bde90
READ of size 8 at 0x612000008920 thread T0
    #0 0x7f4c173d7a80 in _tevent_schedule_immediate
../../lib/tevent/tevent.c:670
    #1 0x7f4c173dbefc in tevent_req_post ../../lib/tevent/tevent_req.c:257
    #2 0x7f4c120c0a0e in tstream_bsd_disconnect_send
../../lib/tsocket/tsocket_bsd.c:2074
    #3 0x7f4c120badab in tstream_disconnect_send
../../lib/tsocket/tsocket.c:771
    #4 0x7f4c14d84a8a in dcerpc_shutdown_pipe
../../source4/librpc/rpc/dcerpc.c:2367
    #5 0x7f4c14d84a8a in dcerpc_connection_dead
../../source4/librpc/rpc/dcerpc.c:872
    #6 0x7f4c14d84e53 in dcerpc_connection_destructor
../../source4/librpc/rpc/dcerpc.c:118
    #7 0x7f4c17ee80e7 in _tc_free_internal ../../lib/talloc/talloc.c:1157
    #8 0x7f4c17ee80e7 in _tc_free_children_internal
../../lib/talloc/talloc.c:1666
    #9 0x7f4c17ee856d in _tc_free_internal ../../lib/talloc/talloc.c:1183
    #10 0x7f4c17ee856d in _tc_free_children_internal
../../lib/talloc/talloc.c:1666
    #11 0x7f4c17eed0b5 in _tc_free_internal ../../lib/talloc/talloc.c:1183
    #12 0x7f4c17eed0b5 in _talloc_free_internal
../../lib/talloc/talloc.c:1247
    #13 0x7f4c17eed0b5 in _talloc_free ../../lib/talloc/talloc.c:1789
    #14 0x7f4c063db898 in dcerpc_interface_dealloc
../../source4/librpc/rpc/pyrpc.c:322
    #15 0x5023b4  (/usr/bin/python3.6+0x5023b4)
    #16 0x502f3c  (/usr/bin/python3.6+0x502f3c)
    #17 0x506858 in _PyEval_EvalFrameDefault (/usr/bin/python3.6+0x506858)
    #18 0x504c27  (/usr/bin/python3.6+0x504c27)
    #19 0x501b2d in _PyFunction_FastCallDict (/usr/bin/python3.6+0x501b2d)
    #20 0x591460  (/usr/bin/python3.6+0x591460)
    #21 0x59ebbd in PyObject_Call (/usr/bin/python3.6+0x59ebbd)
    #22 0x507c16 in _PyEval_EvalFrameDefault (/usr/bin/python3.6+0x507c16)
    #23 0x504c27  (/usr/bin/python3.6+0x504c27)
    #24 0x501b2d in _PyFunction_FastCallDict (/usr/bin/python3.6+0x501b2d)
    #25 0x591460  (/usr/bin/python3.6+0x591460)
    #26 0x59ebbd in PyObject_Call (/usr/bin/python3.6+0x59ebbd)
    #27 0x54d4e1  (/usr/bin/python3.6+0x54d4e1)
    #28 0x5a730b in _PyObject_FastCallKeywords (/usr/bin/python3.6+0x5a730b)
    #29 0x503072  (/usr/bin/python3.6+0x503072)
    #30 0x506858 in _PyEval_EvalFrameDefault (/usr/bin/python3.6+0x506858)
    #31 0x504c27  (/usr/bin/python3.6+0x504c27)
    #32 0x501b2d in _PyFunction_FastCallDict (/usr/bin/python3.6+0x501b2d)
    #33 0x591460  (/usr/bin/python3.6+0x591460)
    #34 0x59ebbd in PyObject_Call (/usr/bin/python3.6+0x59ebbd)
    #35 0x507c16 in _PyEval_EvalFrameDefault (/usr/bin/python3.6+0x507c16)
    #36 0x504c27  (/usr/bin/python3.6+0x504c27)
    #37 0x501b2d in _PyFunction_FastCallDict (/usr/bin/python3.6+0x501b2d)
    #38 0x591460  (/usr/bin/python3.6+0x591460)
    #39 0x59ebbd in PyObject_Call (/usr/bin/python3.6+0x59ebbd)
    #40 0x54d4e1  (/usr/bin/python3.6+0x54d4e1)
    #41 0x5a730b in _PyObject_FastCallKeywords (/usr/bin/python3.6+0x5a730b)
    #42 0x503072  (/usr/bin/python3.6+0x503072)
    #43 0x506858 in _PyEval_EvalFrameDefault (/usr/bin/python3.6+0x506858)
    #44 0x504c27  (/usr/bin/python3.6+0x504c27)
    #45 0x501b2d in _PyFunction_FastCallDict (/usr/bin/python3.6+0x501b2d)
    #46 0x591460  (/usr/bin/python3.6+0x591460)
    #47 0x59ebbd in PyObject_Call (/usr/bin/python3.6+0x59ebbd)
    #48 0x507c16 in _PyEval_EvalFrameDefault (/usr/bin/python3.6+0x507c16)
    #49 0x504c27  (/usr/bin/python3.6+0x504c27)
    #50 0x501b2d in _PyFunction_FastCallDict (/usr/bin/python3.6+0x501b2d)
    #51 0x591460  (/usr/bin/python3.6+0x591460)
    #52 0x59ebbd in PyObject_Call (/usr/bin/python3.6+0x59ebbd)
    #53 0x54d4e1  (/usr/bin/python3.6+0x54d4e1)
    #54 0x5a730b in _PyObject_FastCallKeywords (/usr/bin/python3.6+0x5a730b)
    #55 0x503072  (/usr/bin/python3.6+0x503072)
    #56 0x506858 in _PyEval_EvalFrameDefault (/usr/bin/python3.6+0x506858)
    #57 0x504c27  (/usr/bin/python3.6+0x504c27)
    #58 0x501b2d in _PyFunction_FastCallDict (/usr/bin/python3.6+0x501b2d)
    #59 0x591460  (/usr/bin/python3.6+0x591460)
    #60 0x59ebbd in PyObject_Call (/usr/bin/python3.6+0x59ebbd)
    #61 0x507c16 in _PyEval_EvalFrameDefault (/usr/bin/python3.6+0x507c16)
    #62 0x504c27  (/usr/bin/python3.6+0x504c27)
    #63 0x501b2d in _PyFunction_FastCallDict (/usr/bin/python3.6+0x501b2d)
    #64 0x591460  (/usr/bin/python3.6+0x591460)
    #65 0x59ebbd in PyObject_Call (/usr/bin/python3.6+0x59ebbd)
    #66 0x54d4e1  (/usr/bin/python3.6+0x54d4e1)
    #67 0x5a730b in _PyObject_FastCallKeywords (/usr/bin/python3.6+0x5a730b)
    #68 0x503072  (/usr/bin/python3.6+0x503072)
    #69 0x506858 in _PyEval_EvalFrameDefault (/usr/bin/python3.6+0x506858)
    #70 0x502208  (/usr/bin/python3.6+0x502208)
    #71 0x502f3c  (/usr/bin/python3.6+0x502f3c)
    #72 0x506858 in _PyEval_EvalFrameDefault (/usr/bin/python3.6+0x506858)
    #73 0x502208  (/usr/bin/python3.6+0x502208)
    #74 0x502f3c  (/usr/bin/python3.6+0x502f3c)
    #75 0x506858 in _PyEval_EvalFrameDefault (/usr/bin/python3.6+0x506858)
    #76 0x504c27  (/usr/bin/python3.6+0x504c27)
    #77 0x501b2d in _PyFunction_FastCallDict (/usr/bin/python3.6+0x501b2d)
    #78 0x591460  (/usr/bin/python3.6+0x591460)
    #79 0x54b812  (/usr/bin/python3.6+0x54b812)
    #80 0x555420  (/usr/bin/python3.6+0x555420)
    #81 0x5a730b in _PyObject_FastCallKeywords (/usr/bin/python3.6+0x5a730b)
    #82 0x503072  (/usr/bin/python3.6+0x503072)
    #83 0x507640 in _PyEval_EvalFrameDefault (/usr/bin/python3.6+0x507640)
    #84 0x504c27  (/usr/bin/python3.6+0x504c27)
    #85 0x511ec9  (/usr/bin/python3.6+0x511ec9)
    #86 0x502d6e  (/usr/bin/python3.6+0x502d6e)
    #87 0x506858 in _PyEval_EvalFrameDefault (/usr/bin/python3.6+0x506858)
    #88 0x504c27  (/usr/bin/python3.6+0x504c27)
    #89 0x50253f  (/usr/bin/python3.6+0x50253f)
    #90 0x502f3c  (/usr/bin/python3.6+0x502f3c)
    #91 0x506858 in _PyEval_EvalFrameDefault (/usr/bin/python3.6+0x506858)
    #92 0x504c27  (/usr/bin/python3.6+0x504c27)
    #93 0x58659c  (/usr/bin/python3.6+0x58659c)
    #94 0x59ebbd in PyObject_Call (/usr/bin/python3.6+0x59ebbd)
    #95 0x63835a  (/usr/bin/python3.6+0x63835a)
    #96 0x639027 in Py_Main (/usr/bin/python3.6+0x639027)
    #97 0x4a6f0f in main (/usr/bin/python3.6+0x4a6f0f)
    #98 0x7f4c1c66eb96 in __libc_start_main
(/lib/x86_64-linux-gnu/libc.so.6+0x21b96)
    #99 0x5afa09 in _start (/usr/bin/python3.6+0x5afa09)

0x612000008920 is located 96 bytes inside of 312-byte region
[0x6120000088c0,0x6120000089f8)
freed by thread T0 here:
    #0 0x7f4c1d38fb40 in free
(/usr/lib/x86_64-linux-gnu/libasan.so.5+0xedb40)
    #1 0x7f4c17ee88ab in _tc_free_internal ../../lib/talloc/talloc.c:1221
    #2 0x7f4c17ee88ab in _tc_free_children_internal
../../lib/talloc/talloc.c:1666
    #3 0x7f4c17eed0b5 in _tc_free_internal ../../lib/talloc/talloc.c:1183
    #4 0x7f4c17eed0b5 in _talloc_free_internal
../../lib/talloc/talloc.c:1247
    #5 0x7f4c17eed0b5 in _talloc_free ../../lib/talloc/talloc.c:1789
    #6 0x7f4c063db898 in dcerpc_interface_dealloc
../../source4/librpc/rpc/pyrpc.c:322
    #7 0x5023b4  (/usr/bin/python3.6+0x5023b4)

previously allocated by thread T0 here:
    #0 0x7f4c1d38ff00 in __interceptor_malloc
(/usr/lib/x86_64-linux-gnu/libasan.so.5+0xedf00)
    #1 0x7f4c17ef532c in __talloc_with_prefix ../../lib/talloc/talloc.c:782
    #2 0x7f4c17ef532c in __talloc ../../lib/talloc/talloc.c:824
    #3 0x7f4c17ef532c in _talloc_named_const ../../lib/talloc/talloc.c:981
    #4 0x7f4c17ef532c in _talloc_zero ../../lib/talloc/talloc.c:2422
    #5 0x7f4c173d5e87 in tevent_context_init_ops
../../lib/tevent/tevent.c:487
    #6 0x7f4c173d5f59 in tevent_context_init_byname
../../lib/tevent/tevent.c:523
    #7 0x7f4c146d0977 in s4_event_context_init
../../source4/lib/events/tevent_s4.c:34
    #8 0x7f4c154007a0 in py_dcerpc_interface_init_helper
../../source4/librpc/rpc/pyrpc_util.c:222
    #9 0x7f4c063da5ba in dcerpc_interface_new
../../source4/librpc/rpc/pyrpc.c:388
    #10 0x5553b4  (/usr/bin/python3.6+0x5553b4)

SUMMARY: AddressSanitizer: heap-use-after-free
../../lib/tevent/tevent.c:670 in _tevent_schedule_immediate
Shadow bytes around the buggy address:
  0x0c247fff90d0: fd fd fd fd fd fd fd fd fd fa fa fa fa fa fa fa
  0x0c247fff90e0: fa fa fa fa fa fa fa fa fd fd fd fd fd fd fd fd
  0x0c247fff90f0: fd fd fd fd fd fd fd fd fd fd fd fd fd fd fd fd
  0x0c247fff9100: fd fd fd fd fd fd fd fd fd fd fd fd fd fd fa fa
  0x0c247fff9110: fa fa fa fa fa fa fa fa fd fd fd fd fd fd fd fd
=>0x0c247fff9120: fd fd fd fd[fd]fd fd fd fd fd fd fd fd fd fd fd
  0x0c247fff9130: fd fd fd fd fd fd fd fd fd fd fd fd fd fd fd fa
  0x0c247fff9140: fa fa fa fa fa fa fa fa 00 00 00 00 00 00 00 00
  0x0c247fff9150: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
  0x0c247fff9160: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 fa
  0x0c247fff9170: fa fa fa fa fa fa fa fa fd fd fd fd fd fd fd fd
Shadow byte legend (one shadow byte represents 8 application bytes):
  Addressable:           00
  Partially addressable: 01 02 03 04 05 06 07
  Heap left redzone:       fa
  Freed heap region:       fd
  Stack left redzone:      f1
  Stack mid redzone:       f2
  Stack right redzone:     f3
  Stack after return:      f5
  Stack use after scope:   f8
  Global redzone:          f9
  Global init order:       f6
  Poisoned by user:        f7
  Container overflow:      fc
  Array cookie:            ac
  Intra object redzone:    bb
  ASan internal:           fe
  Left alloca redzone:     ca
  Right alloca redzone:    cb
==10844==ABORTING


On 21/05/19 15:45, Tim Beale wrote:
> Hi Gary,
> 
> I noticed the dcerpc.bare test is a bit flappy. I've seen it fail both
> in gitlab CI and running it locally. Usually it just gives me an error like:
> 
> error:
> samba.tests.dcerpc.bare.samba.tests.dcerpc.bare.BareTestCase.test_two_contexts_tcp
> (samba.subunit.RemotedTestCase)(ad_dc_default:local) [
> Exception: was started but never finished!
> ]
> 
> Sometimes the python test itself produces a segmentation fault.
> 
> It seems like it might be related to commit d65b7641c84976c543d 's4
> librpc rpc pyrpc: Ensure tevent_context deleted last'. On master, the
> test fails maybe 1 in 4 times I run it. I reverted this commit and ran
> it 20+ times without problem.
> 
> To run the test locally, use:
> SELFTEST_TESTENV=ad_dc_default:local make testenv
> python3 -m samba.subunit.run  $LOADLIST samba.tests.dcerpc.bare 2>&1  |
> python3 /home/timbeale/code/samba/selftest/filter-subunit
> --fail-on-empty --prefix="samba.tests.dcerpc.bare."
> --suffix="(ad_dc_default:local)"
> 
> Cheers,
> Tim
> 

