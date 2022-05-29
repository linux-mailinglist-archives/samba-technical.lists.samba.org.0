Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 856325372D7
	for <lists+samba-technical@lfdr.de>; Mon, 30 May 2022 00:49:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=vxSYzq3T7QPS1qOmXIjfEVP/XGlEnND3SoBFfAmy4Js=; b=G9An4QQm7wwcneUPAmcGtr/9Ts
	Kc2GjUyYqmSpD3vzIk0R6oWIIZrBwCWvBcWjV0aRjKkfoi5JaMzqsCO7BCH3lmG+Yop+CyWyvidCz
	0P0zmBrJCnmPi/RysaVIA/LEI6w7GHb89Kd6tX6cZVIbE/l0pgpgd58+SQJcU2lwDyXdu0sDJ9t9G
	mPWSR+Q9KJxiKVR5LaCND4np9zGSrbgvfdHUEbvTH6LXVFVIOBFwTr02uz45+hqkOhYZEBdhnlql6
	89xRWc7gobeIKIBVDfsxAkP8/6Cwx54yNI2UOe6W8iDH3F6E9CHgOrZVe5RgQ6HsIzPuLF6TPc3x7
	SMzhFpuQ==;
Received: from ip6-localhost ([::1]:60364 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nvRhy-003jzi-8d; Sun, 29 May 2022 22:48:26 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:61868) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nvRhr-003jzZ-8M
 for samba-technical@lists.samba.org; Sun, 29 May 2022 22:48:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Cc:To:From:Message-ID;
 bh=vxSYzq3T7QPS1qOmXIjfEVP/XGlEnND3SoBFfAmy4Js=; b=EbJswYoqisxLwkwK8tcxpcHbF4
 LNF3729EvmeWzq/XY7iXOx2joHv/0haQq6AgqiWeapFRZT7XJ3nsOJiC2UFp57W7xfvfvkJoFWxlO
 DnlRvbGjFYcbaQP1CDebSscEDtDmRpaYWhGRjWTw88VTOJfPRaD9S8k5hySAi+uCW2cvkLZQxxrEk
 SpxETOAsqyvcrJzUY5C5dadDWDxR2qj3q0BiAmuadEwnu+xC+ZGJdxjgV08tD5XAylAHPhyMZB/gH
 /qP1eGm6tIQXFSEuXUKl/GAEQ37YRJKbpipb1RURiTDUiM+rSgPYzZ64gQwYscQmYbE3Pu9FdP4EG
 JIUCza0purhYsHXSb4OJ6NssusXvnPIylAv92w9giKerVjAUtJ2HjPaRvcJEYJTjXafBWlvIp0+O4
 IxbOOP80o1q+sHN7AVaVHS4n1NVYxvJ129VSdMR1qRPJ7FDLeBdYG9EK8YydiC0HHITdo+jxPl3uz
 /K0GZd/lmLCu8H26nx527knX;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1nvRhp-00362s-JS; Sun, 29 May 2022 22:48:18 +0000
Message-ID: <ef350519d999afb7e2ba44b90744150a691777a5.camel@samba.org>
Subject: internal backtrace support - libunwind or backtrace_symbols?
To: Michael Tokarev <mjt@tls.msk.ru>
Date: Mon, 30 May 2022 10:48:12 +1200
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5-0ubuntu1 
MIME-Version: 1.0
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
From: Andrew Bartlett via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andrew Bartlett <abartlet@samba.org>
Cc: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>,
 Fco Javier Felix <ffelix@inode64.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Michael,

You mentioned that you didn't get a backtrace until buidling debian
packages with libunwind.  Can you double-check?  The reason I ask is
that when I disabled libunwind with this MR, I get the
backtrace_symbols one, and I need to know if this isn't working in the
'real world'.

https://gitlab.com/samba-team/samba/-/merge_requests/2534

To the list more generally:

I'm trying to merge the above MR from Fco Javier Felix and have been
doing some testing.

We currently prefer the extra library libunwind for backtraces, but the
backtrace on modern linux (Ubuntu 20.04) is actually better from
backtrace_symbols():

backtrace_symbols:
 #0 bin/shared/libsamba-util.so.0(log_stack_trace+0x32)
[0x7f038a9ba096]
 #1 bin/shared/libsamba-util.so.0(smb_panic_log+0x1b5) [0x7f038a9ba013]
 #2 bin/shared/libsamba-util.so.0(smb_panic+0x1c) [0x7f038a9ba032]
 #3 bin/shared/libsamba-util.so.0(+0x10b36) [0x7f038a9b9b36]
 #4 bin/shared/libsamba-util.so.0(+0x10b4f) [0x7f038a9b9b4f]
 #5 /lib/x86_64-linux-gnu/libpthread.so.0(+0x14420) [0x7f038a51f420]
 #6 /lib/x86_64-linux-gnu/libc.so.6(epoll_wait+0x1a) [0x7f038a43842a]
 #7 bin/shared/private/libtevent-samba4.so(+0x12e96) [0x7f038ab0fe96]
 #8 bin/shared/private/libtevent-samba4.so(+0x13864) [0x7f038ab10864]
 #9 bin/shared/private/libtevent-samba4.so(+0xff1d) [0x7f038ab0cf1d]
 #10 bin/shared/private/libtevent-samba4.so(_tevent_loop_once+0x126)
[0x7f038ab038c8]
 #11 bin/shared/private/libtevent-
samba4.so(tevent_common_loop_wait+0x29) [0x7f038ab03c32]
 #12 bin/shared/private/libtevent-samba4.so(+0xffc3) [0x7f038ab0cfc3]
 #13 bin/shared/private/libtevent-samba4.so(_tevent_loop_wait+0x2f)
[0x7f038ab03cd9]
 #14 samba: root process(+0x784e) [0x5631fbd6a84e]
 #15 samba: root process(main+0x76) [0x5631fbd6a911]
 #16 /lib/x86_64-linux-gnu/libc.so.6(__libc_start_main+0xf3)
[0x7f038a33d083]
 #17 samba: root process(_start+0x2e) [0x5631fbd67f4e]

libunwind:
 #0 log_stack_trace + 0x3b [ip=0x7f272f0de0ff] [sp=0x7ffc2818af20]
 #1 smb_panic_log + 0x1b5 [ip=0x7f272f0de073] [sp=0x7ffc2818b830]
 #2 smb_panic + 0x1c [ip=0x7f272f0de092] [sp=0x7ffc2818b850]
 #3 fault_report + 0x91 [ip=0x7f272f0ddb96] [sp=0x7ffc2818b870]
 #4 sig_fault + 0x19 [ip=0x7f272f0ddbaf] [sp=0x7ffc2818b920]
 #5 funlockfile + 0x60 [ip=0x7f272ec43420] [sp=0x7ffc2818b940]
 #6 epoll_wait + 0x1a [ip=0x7f272eb5c42a] [sp=0x7ffc2818bfd8]
 #7 epoll_event_loop + 0xd2 [ip=0x7f272f233e96] [sp=0x7ffc2818bfe0]
 #8 epoll_event_loop_once + 0x13c [ip=0x7f272f234864]
[sp=0x7ffc2818c040]
 #9 std_event_loop_once + 0x60 [ip=0x7f272f230f1d] [sp=0x7ffc2818c090]
 #10 _tevent_loop_once + 0x126 [ip=0x7f272f2278c8] [sp=0x7ffc2818c0d0]
 #11 tevent_common_loop_wait + 0x29 [ip=0x7f272f227c32]
[sp=0x7ffc2818c110]
 #12 std_event_loop_wait + 0x60 [ip=0x7f272f230fc3] [sp=0x7ffc2818c140]
 #13 _tevent_loop_wait + 0x2f [ip=0x7f272f227cd9] [sp=0x7ffc2818c180]
 #14 binary_smbd_main + 0x12a5 [ip=0x55ee8b8c284e] [sp=0x7ffc2818c1a0]
 #15 main + 0x76 [ip=0x55ee8b8c2911] [sp=0x7ffc2818c480]
 #16 __libc_start_main + 0xf3 [ip=0x7f272ea61083] [sp=0x7ffc2818c4b0]
 #17 _start + 0x2e [ip=0x55ee8b8bff4e] [sp=0x7ffc2818c580]

The reason for the current order is apparently IA-64, which is pretty
dead now, and perhaps has been fixed anyway.

Does anybody know/care about the IA-64 situation these days, or which
of libunwind or whatever backtrace_symbols() is likely to be on our
most important platforms would give?

I'm thinking we should:
 - invert the priority (prefer backtace_symbols if available)
 - only use/require libunwind (and have the option for --without-
libunwind) if backtrace_symbols is not present (typically in libc).

What do folks think?

Andrew Bartlett

-- 
Andrew Bartlett (he/him)       https://samba.org/~abartlet/
Samba Team Member (since 2001) https://samba.org
Samba Team Lead, Catalyst IT   https://catalyst.net.nz/services/samba

Samba Development and Support, Catalyst IT - Expert Open Source
Solutions


