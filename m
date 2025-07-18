Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id DA055B0A5AE
	for <lists+samba-technical@lfdr.de>; Fri, 18 Jul 2025 15:58:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=D6xxVmcBulOQbgJjrkTJ8mGLEJcZh8Sh3bQPVDhbkDc=; b=jfgXUQthhh6LgdN9P/xZBzC4Q1
	P1emgqblKt+MLvv12P7+gXsflSPQGy01o8UoY5pY8MJUyx+AC3Xp5JsA0d3/YnHTEBB8B7G0SK6Gm
	dB9sQz5J8gMX55Yd68bv+jl4UYOoiZC5fvKrAucrQbZ1B+Aot3EK1Oa3WmAJ24y6cEXnlH3ybNbB+
	DzKsZ/ECejkatShdO903oD5EffKbbzDHmAGoXgLjqituQwCAXBFP75GaZpXbc8yB3wVKjPIuU5/tk
	d6mIBcru1zbNbx5Rmi39nBA5XX085pd95Dj0UPQjRkrGLGBobU3yFLYmysvyIB39KKad+lVYLE3CM
	ZSlKmAkQ==;
Received: from ip6-localhost ([::1]:62288 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uclb6-00BSwt-Dn; Fri, 18 Jul 2025 13:58:00 +0000
Received: from isrv.corpit.ru ([212.248.84.144]:33911) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uclb1-00BSwm-J8
 for samba-technical@lists.samba.org; Fri, 18 Jul 2025 13:57:58 +0000
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 4399B1383B4;
 Fri, 18 Jul 2025 16:57:42 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id 3CC4724A07D;
 Fri, 18 Jul 2025 16:57:52 +0300 (MSK)
Message-ID: <bffae926-a38e-4446-acd3-017bcd20dadd@tls.msk.ru>
Date: Fri, 18 Jul 2025 16:57:52 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: growth of smbXsrv_session_global.tdb
To: Ralph Boehme <slow@samba.org>, samba-technical@lists.samba.org
References: <57f12264-b359-4057-b5f9-41464debeb8d@tls.msk.ru>
 <19974c0b-cdb2-4325-a7ce-7fce9a283605@samba.org>
Content-Language: en-US, ru-RU
In-Reply-To: <19974c0b-cdb2-4325-a7ce-7fce9a283605@samba.org>
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

18.07.2025 15:45, Ralph Boehme пишет:
> On 7/18/25 1:43 PM, Michael Tokarev via samba-technical wrote:
>> How one can remedy the underlying problem?
> 
> debug the open records leak.

I'll try that next.

> You might be able to use
> 
> net serverid wipedbs

This one is interesting.

On a small server with just DFS referrals, soon after restart
so the session file is not yet large, but definitely larger than
it should be (there are just 11 sessions there at the time):

miranda:~# smbstatus -p | wc -l ; ll -h /run/samba/smbXsrv_session_global.tdb
11
-rw------- 1 root root 9.5M Jul 18 16:49 /run/samba/smbXsrv_session_global.tdb
miranda:~# net serverid wipedbs
Found 14 serverids, 14 alive and 0 disconnected
Found 14 sessions, 14 alive and 0 disconnected, cleaned up 0 of 0 entries
Found 14 tcons, 14 alive and 0 disconnected, cleaned up 0 of 0 entries
Found 0 opens, 0 alive, 0 disconnected and 0 timed out, cleaned up 0 of 0 entries
miranda:~# ll -h /run/samba/smbXsrv_session_global.tdb
-rw------- 1 root root 9.5M Jul 18 16:49 /run/samba/smbXsrv_session_global.tdb

So this command basically does nothing about the size of that file
(and no, this file does not contain gaps, - du shows the same size).

And on a busier server (samba 4.21 though; it is also soon'ish after restart
so 745M is not unusual; after longer run it grows up to 2G):

infra-ekis:~# smbstatus -p | wc -l ; ll -h /run/samba/smbXsrv_session_global.tdb
1499
-rw------- 1 root root 745M Jul 18 16:49 /run/samba/smbXsrv_session_global.tdb
infra-ekis:~# net serverid wipedbs
net: source3/utils/net_serverid.c:138: wipedbs_traverse_sessions: Assertion `session->num_channels == 1' failed.
===============================================================
INTERNAL ERROR: Signal 6: Aborted in net () () pid 3324896 (4.21.6-Debian-4.21.6+dfsg-1~~mjt+deb12)
If you are running a recent Samba version, and if you think this problem is not yet fixed in the latest versions, please consider reporting this bug, 
see https://wiki.samba.org/index.php/Bug_Reporting
===============================================================
PANIC (pid 3324896): Signal 6: Aborted in 4.21.6-Debian-4.21.6+dfsg-1~~mjt+deb12
BACKTRACE: 26 stack frames:
  #0 /usr/lib/x86_64-linux-gnu/samba/libgenrand-private-samba.so.0(log_stack_trace+0x2e) [0x7fd2b37335be]
  #1 /usr/lib/x86_64-linux-gnu/samba/libgenrand-private-samba.so.0(smb_panic+0x9) [0x7fd2b3733859]
  #2 /usr/lib/x86_64-linux-gnu/samba/libgenrand-private-samba.so.0(+0x28f1) [0x7fd2b37338f1]
  #3 /lib/x86_64-linux-gnu/libc.so.6(+0x3c050) [0x7fd2b31ed050]
  #4 /lib/x86_64-linux-gnu/libc.so.6(+0x8aeec) [0x7fd2b323beec]
  #5 /lib/x86_64-linux-gnu/libc.so.6(gsignal+0x12) [0x7fd2b31ecfb2]
  #6 /lib/x86_64-linux-gnu/libc.so.6(abort+0xd3) [0x7fd2b31d7472]
  #7 /lib/x86_64-linux-gnu/libc.so.6(+0x26395) [0x7fd2b31d7395]
  #8 /lib/x86_64-linux-gnu/libc.so.6(+0x34ec2) [0x7fd2b31e5ec2]
  #9 net(+0x78e6b) [0x55d5a975fe6b]
  #10 /usr/lib/x86_64-linux-gnu/samba/libsmbd-base-private-samba.so.0(+0xd4637) [0x7fd2b3c57637]
  #11 /lib/x86_64-linux-gnu/libsmbconf.so.0(+0x30b41) [0x7fd2b45e3b41]
  #12 /usr/lib/x86_64-linux-gnu/samba/libdbwrap-private-samba.so.0(+0x674c) [0x7fd2b385374c]
  #13 /lib/x86_64-linux-gnu/libtdb.so.1(+0x6e8d) [0x7fd2b4758e8d]
  #14 /lib/x86_64-linux-gnu/libtdb.so.1(tdb_traverse_read+0x3d) [0x7fd2b475901d]
  #15 /usr/lib/x86_64-linux-gnu/samba/libdbwrap-private-samba.so.0(+0x6b5e) [0x7fd2b3853b5e]
  #16 /usr/lib/x86_64-linux-gnu/samba/libdbwrap-private-samba.so.0(dbwrap_traverse_read+0x7) [0x7fd2b3850fd7]
  #17 /lib/x86_64-linux-gnu/libsmbconf.so.0(+0x2fad9) [0x7fd2b45e2ad9]
  #18 /usr/lib/x86_64-linux-gnu/samba/libdbwrap-private-samba.so.0(dbwrap_traverse_read+0x7) [0x7fd2b3850fd7]
  #19 /usr/lib/x86_64-linux-gnu/samba/libsmbd-base-private-samba.so.0(smbXsrv_session_global_traverse+0x55) [0x7fd2b3c5b015]
  #20 net(+0x78f0b) [0x55d5a975ff0b]
  #21 net(net_serverid+0xc8) [0x55d5a9760478]
  #22 net(main+0xbfe) [0x55d5a970f06e]
  #23 /lib/x86_64-linux-gnu/libc.so.6(+0x2724a) [0x7fd2b31d824a]
  #24 /lib/x86_64-linux-gnu/libc.so.6(__libc_start_main+0x85) [0x7fd2b31d8305]
  #25 net(_start+0x21) [0x55d5a970f2b1]
call_panic_action: Calling panic action [/usr/share/samba/panic-action 3324896]
call_panic_action: action returned status 0
Can not dump core: corepath not set up


I'll get around the panic later, hopefully today.

Thanks,

/mjt

