Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 048AD5375FC
	for <lists+samba-technical@lfdr.de>; Mon, 30 May 2022 09:52:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=cP5aqSmkSFzaMss4x6OchVMLEnHzmAUsac7qPlaaMtY=; b=fDe9wd4djo92QrldYqaKcPQUQu
	qnjuTFGsg7N5IZHIENzFshHM3KjyDKeaaxMjDFti0mReZUn6dDfjVEEt/AOAUmewwGjKDxzaO6YBX
	0RuFuOkpFWD3P8cIqKINYUNa+RVTxEocskoyamIlyYfACksDKtDdE3YmrVZUIVTI/DuA0oH1o9v+C
	grmkcWvscrLB+ylKDu5Qcvd3k+1XImOyh0QmGNAtE14KR447fz3yAjH4TqbxonrtpRfNGbup/vU2U
	nACgUcWHfzK74zdlWifFX8YXabTjgIJ0XhwcUg1uFIR+k/+6F4GDIMnWhpvTOvSX6unkVQ1qwP/PD
	e4X9/Wuw==;
Received: from ip6-localhost ([::1]:61086 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nvaAd-003lAw-5G; Mon, 30 May 2022 07:50:35 +0000
Received: from isrv.corpit.ru ([86.62.121.231]:60081) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nvaA1-003lAn-4B
 for samba-technical@lists.samba.org; Mon, 30 May 2022 07:50:02 +0000
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 1C3F140B45;
 Mon, 30 May 2022 10:49:54 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id 889C213A;
 Mon, 30 May 2022 10:49:53 +0300 (MSK)
Message-ID: <0bcbbf18-94b0-b859-7961-eb9c969b392a@msgid.tls.msk.ru>
Date: Mon, 30 May 2022 10:49:53 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: internal backtrace support - libunwind or backtrace_symbols?
Content-Language: en-US
To: Andrew Bartlett <abartlet@samba.org>
References: <ef350519d999afb7e2ba44b90744150a691777a5.camel@samba.org>
In-Reply-To: <ef350519d999afb7e2ba44b90744150a691777a5.camel@samba.org>
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
Cc: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>,
 Fco Javier Felix <ffelix@inode64.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

30.05.2022 01:48, Andrew Bartlett wrote:
> Michael,
> 
> You mentioned that you didn't get a backtrace until buidling debian
> packages with libunwind.  Can you double-check?  The reason I ask is

Well. I only wrote that I'm getting backtraces after enabling libunwind,
I didn't say I weren't getting them before enabling libunwind.

I just checked - and you're right, the backtraces are there without libunwind
too, here's an example (just sending SIGSEGV to smbd):

[2022/05/30 10:38:06.000715,  0] ../../lib/util/fault.c:173(smb_panic_log)
   INTERNAL ERROR: Signal 11: Segmentation fault in pid 340388 (4.16.1-Debian)
[2022/05/30 10:38:06.000754,  0] ../../lib/util/fault.c:177(smb_panic_log)
   If you are running a recent Samba version, and if you think this problem is not yet fixed in the latest versions, please consider reporting this 
bug, see https://wiki.samba.org/index.php/Bug_Reporting
[2022/05/30 10:38:06.000787,  0] ../../lib/util/fault.c:182(smb_panic_log)
   ===============================================================
[2022/05/30 10:38:06.000817,  0] ../../lib/util/fault.c:183(smb_panic_log)
   PANIC (pid 340388): Signal 11: Segmentation fault in 4.16.1-Debian
[2022/05/30 10:38:06.007755,  0] ../../lib/util/fault.c:287(log_stack_trace)
   BACKTRACE: 21 stack frames:
    #0 /usr/lib/x86_64-linux-gnu/libsamba-util.so.0(log_stack_trace+0x30) [0x7fddf44640f0]
    #1 /usr/lib/x86_64-linux-gnu/libsamba-util.so.0(smb_panic+0x9) [0x7fddf4464339]
    #2 /usr/lib/x86_64-linux-gnu/libsamba-util.so.0(+0xf3d1) [0x7fddf44643d1]
    #3 /lib/x86_64-linux-gnu/libpthread.so.0(+0x14140) [0x7fddf4292140]
    #4 /lib/x86_64-linux-gnu/libc.so.6(epoll_wait+0x16) [0x7fddf41810d6]
    #5 /usr/lib/x86_64-linux-gnu/libtevent.so.0(+0xde07) [0x7fddf4264e07]
    #6 /usr/lib/x86_64-linux-gnu/libtevent.so.0(+0xc087) [0x7fddf4263087]
    #7 /usr/lib/x86_64-linux-gnu/libtevent.so.0(_tevent_loop_once+0x94) [0x7fddf425de24]
    #8 /usr/lib/x86_64-linux-gnu/libtevent.so.0(tevent_common_loop_wait+0x1b) [0x7fddf425e10b]
    #9 /usr/lib/x86_64-linux-gnu/libtevent.so.0(+0xc027) [0x7fddf4263027]
    #10 /usr/lib/x86_64-linux-gnu/samba/libsmbd-base-samba4.so.0(smbd_process+0x818) [0x7fddf4746518]
    #11 /usr/sbin/smbd(+0xa161) [0x55be897c6161]
    #12 /usr/lib/x86_64-linux-gnu/libtevent.so.0(tevent_common_invoke_fd_handler+0x91) [0x7fddf425e9e1]
    #13 /usr/lib/x86_64-linux-gnu/libtevent.so.0(+0xdf47) [0x7fddf4264f47]
    #14 /usr/lib/x86_64-linux-gnu/libtevent.so.0(+0xc087) [0x7fddf4263087]
    #15 /usr/lib/x86_64-linux-gnu/libtevent.so.0(_tevent_loop_once+0x94) [0x7fddf425de24]
    #16 /usr/lib/x86_64-linux-gnu/libtevent.so.0(tevent_common_loop_wait+0x1b) [0x7fddf425e10b]
    #17 /usr/lib/x86_64-linux-gnu/libtevent.so.0(+0xc027) [0x7fddf4263027]
    #18 /usr/sbin/smbd(main+0x1c22) [0x55be897c39f2]
    #19 /lib/x86_64-linux-gnu/libc.so.6(__libc_start_main+0xea) [0x7fddf40a9d0a]
    #20 /usr/sbin/smbd(_start+0x2a) [0x55be897c3baa]
[2022/05/30 10:38:06.008228,  0] ../../source3/lib/dumpcore.c:315(dump_core)
   dumping core in /var/log/samba/cores/smbd

> that when I disabled libunwind with this MR, I get the
> backtrace_symbols one, and I need to know if this isn't working in the
> 'real world'.

It looks like it's the same here.

What happened here is that after issues which Dirk faced in another tread,
and your reply there, I *thought* backtraces does not work at all without
libunwind, but I didn't verify this, having no time to spare. I just enabled
libunwind for debian build and verified the backtrace is there *after* doing
so, - in a hope to become closer to understanding the problem which Dirk is
facing (which is quite bad experience).

Now I looked at the traces he's getting, and it looks like the prob there is
not the lack of a backtrace but a corrupt stack which can't be backtraced.

I'll disable libunwind on debian samba build now once things are clear.
And this mess is what I'm getting when trying to be just a bit helpful
but in a rush.  Please excuse me for the noise.  Unfortunately I still
don't know what to do with Dirk's case.

/mjt

