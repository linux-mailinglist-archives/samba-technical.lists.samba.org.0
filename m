Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 9143D2B384F
	for <lists+samba-technical@lfdr.de>; Sun, 15 Nov 2020 20:09:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=edur0oCXX9Sg5I70SRZveXxWS45bzSGtOu5ohdaNalY=; b=z41bL8Ta8fz66XK+gbwtmBWrWe
	2O9HB2/H1fSdpUzjszFgC69yQLYBj+CMlliRj3LscvH2omNA/AiYN5tE5U0Ncxmhb3dOU32LvSkBM
	8N2mtorSn67Ocj3xDF20b1aUgf+gVduoqFLCpmov/DKGoPdwOXgEFALv5pHwFLPS7SGerXT8omxbW
	c8SNIckwLi2zBwTSUbd/jmdNOpFCyQOplVfJ8yq7IHGdWAC1dobHKMBlXIdX29b+8X32Vb5DyZeUq
	x4Fras/08/yHQc2fohOfOVjpvn/iF8iaUKi7q+95R5METfJ5mkdoLrALDrg4YAPGzuIZ3u1NPp4lB
	4EfpcZZw==;
Received: from ip6-localhost ([::1]:32882 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1keNOQ-001MQY-9U; Sun, 15 Nov 2020 19:08:54 +0000
Received: from mailout01.agenturserver.de ([185.15.192.32]:35390) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1keNOK-001MQR-GY
 for samba-technical@lists.samba.org; Sun, 15 Nov 2020 19:08:51 +0000
Received: from mail03.agenturserver.de (mail03.internal [192.168.51.40])
 by mailout01.agenturserver.de (Postfix) with ESMTP id C8DA7C30EA
 for <samba-technical@lists.samba.org>; Sun, 15 Nov 2020 19:49:46 +0100 (CET)
Received: from XXX.XXX.XXX.XXX (XXXXX.XX [XXX.XXX.XXX.XXX])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: p23908p464)
 by mail.agenturserver.de (Postfix) with ESMTPSA id 71BD6432D3
 for <samba-technical@lists.samba.org>; Sun, 15 Nov 2020 19:49:46 +0100 (CET)
Subject: ctdb errors after update to 4.12.10-10
To: samba-technical@lists.samba.org
Organization: Forum Ziviler Friedensdienst e.V.
Message-ID: <4694450d-bb2a-a3b2-85a9-0ffcd43be95f@forumZFD.de>
Date: Sun, 15 Nov 2020 19:49:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
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
From: =?utf-8?q?Benedikt_Kale=C3=9F_via_samba-technical?=
 <samba-technical@lists.samba.org>
Reply-To: =?UTF-8?Q?Benedikt_Kale=c3=9f?= <benedikt.kaless@forumZFD.de>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Dear all,

we updated to 4.12.10-10 using the sernet packages.

After approx. 30 minutes I obtainted the following messages in syslog:

root@ctdb-ho-2:~# journalctl -f
-- Logs begin at Wed 2020-11-11 08:53:27 CET. --
Nov 13 13:00:18 ctdb-ho-2 smbd[30956]: [2020/11/13 13:00:18.616823,  0]
../../source3/smbd/close.c:1150(close_directory)
Nov 13 13:00:18 ctdb-ho-2 smbd[30956]:   close_directory: Could not get
share mode lock for <dir>
Nov 13 13:00:18 ctdb-ho-2 smbd[30956]: [2020/11/13 13:00:18.693375,  0]
../../source3/smbd/close.c:1150(close_directory)
Nov 13 13:00:18 ctdb-ho-2 smbd[30956]:   close_directory: Could not get
share mode lock for <dir>
Nov 13 13:00:21 ctdb-ho-2 smbd[30956]: [2020/11/13 13:00:21.693555,  0]
../../source3/smbd/close.c:1150(close_directory)
Nov 13 13:00:21 ctdb-ho-2 smbd[30956]:   close_directory: Could not get
share mode lock for <dir>
Nov 13 13:00:30 ctdb-ho-2 smbd[30397]: [2020/11/13 13:00:30.228536,  0]
../../source3/smbd/close.c:1150(close_directory)
Nov 13 13:00:30 ctdb-ho-2 smbd[30397]:   close_directory: Could not get
share mode lock for <dir>
Nov 13 13:00:43 ctdb-ho-2 smbd[30397]: [2020/11/13 13:00:43.044771,  0]
../../source3/smbd/close.c:1150(close_directory)
Nov 13 13:01:24 ctdb-ho-2 smbd[30956]: [2020/11/13 13:01:24.766861,  0]
../../source3/smbd/close.c:1150(close_directory)
Nov 13 13:01:24 ctdb-ho-2 smbd[30956]:   close_directory: Could not get
share mode lock for 6 Finanzen/B Ausgangsrechnungen bearbeiten/10
Ausgangsrechnung erstellen/2 Kaffee u Material
Nov 13 13:01:26 ctdb-ho-2 smbd[30956]: [2020/11/13 13:01:26.458690,  0]
../../source3/locking/share_mode_lock.c:448(share_mode_data_store)
Nov 13 13:01:26 ctdb-ho-2 smbd[30956]:   PANIC: assert failed at
../../source3/locking/share_mode_lock.c(448): !share_entries_exist
Nov 13 13:01:26 ctdb-ho-2 smbd[30956]: [2020/11/13 13:01:26.460269,  0]
../../source3/lib/util.c:830(smb_panic_s3)
Nov 13 13:01:26 ctdb-ho-2 smbd[30956]:   PANIC (pid 30956): assert
failed: !share_entries_exist
Nov 13 13:01:26 ctdb-ho-2 smbd[30956]: [2020/11/13 13:01:26.462161,  0]
../../lib/util/fault.c:265(log_stack_trace)
Nov 13 13:01:26 ctdb-ho-2 smbd[30956]:   BACKTRACE: 32 stack frames:
Nov 13 13:01:26 ctdb-ho-2 smbd[30956]:    #0
/usr/lib/x86_64-linux-gnu/samba/libsamba-util.so.0(log_stack_trace+0x30)
[0x7f0fc8ed1dde]
Nov 13 13:01:26 ctdb-ho-2 smbd[30956]:    #1
/usr/lib/x86_64-linux-gnu/samba/libsmbconf.so.0(smb_panic_s3+0x24)
[0x7f0fc894f05f]
Nov 13 13:01:26 ctdb-ho-2 smbd[30956]:    #2
/usr/lib/x86_64-linux-gnu/samba/libsamba-util.so.0(smb_panic+0x2c)
[0x7f0fc8ed1ee1]
Nov 13 13:01:26 ctdb-ho-2 smbd[30956]:    #3
/usr/lib/x86_64-linux-gnu/samba/libsmbd-base-samba4.so(+0x9142e)
[0x7f0fc8bc842e]
Nov 13 13:01:26 ctdb-ho-2 smbd[30956]:    #4
/usr/lib/x86_64-linux-gnu/samba/libtalloc.so.2(_talloc_free+0x2d2)
[0x7f0fc8af1b6c]
Nov 13 13:01:26 ctdb-ho-2 smbd[30956]:    #5
/usr/lib/x86_64-linux-gnu/samba/libsmbd-base-samba4.so(+0x1bf57a)
[0x7f0fc8cf657a]
Nov 13 13:01:26 ctdb-ho-2 smbd[30956]:    #6
/usr/lib/x86_64-linux-gnu/samba/libsmbd-base-samba4.so(+0x1c0a17)
[0x7f0fc8cf7a17]
Nov 13 13:01:26 ctdb-ho-2 smbd[30956]:    #7
/usr/lib/x86_64-linux-gnu/samba/libsmbd-base-samba4.so(create_file_default+0x46c)
[0x7f0fc8cfa62c]
Nov 13 13:01:26 ctdb-ho-2 smbd[30956]:    #8
/usr/lib/x86_64-linux-gnu/samba/libsmbd-base-samba4.so(+0x150073)
[0x7f0fc8c87073]
Nov 13 13:01:26 ctdb-ho-2 smbd[30956]:    #9
/usr/lib/x86_64-linux-gnu/samba/libsmbd-base-samba4.so(smb_vfs_call_create_file+0x73)
[0x7f0fc8d01178]
Nov 13 13:01:26 ctdb-ho-2 smbd[30956]:    #10
/usr/lib/x86_64-linux-gnu/samba/libsmbd-base-samba4.so(smbd_smb2_request_process_create+0x1029)
[0x7f0fc8d333f1]
Nov 13 13:01:26 ctdb-ho-2 smbd[30956]:    #11
/usr/lib/x86_64-linux-gnu/samba/libsmbd-base-samba4.so(smbd_smb2_request_dispatch+0x1466)
[0x7f0fc8d2879d]
Nov 13 13:01:26 ctdb-ho-2 smbd[30956]:    #12
/usr/lib/x86_64-linux-gnu/samba/libsmbd-base-samba4.so(+0x1f3501)
[0x7f0fc8d2a501]
Nov 13 13:01:26 ctdb-ho-2 smbd[30956]:    #13
/usr/lib/x86_64-linux-gnu/samba/libtevent.so.0(tevent_common_invoke_fd_handler+0x84)
[0x7f0fc8b18dcd]
Nov 13 13:01:26 ctdb-ho-2 smbd[30956]:    #14
/usr/lib/x86_64-linux-gnu/samba/libtevent.so.0(+0xd378) [0x7f0fc8b1f378]
Nov 13 13:01:26 ctdb-ho-2 smbd[30956]:    #15
/usr/lib/x86_64-linux-gnu/samba/libtevent.so.0(+0xafc8) [0x7f0fc8b1cfc8]
Nov 13 13:01:26 ctdb-ho-2 smbd[30956]:    #16
/usr/lib/x86_64-linux-gnu/samba/libtevent.so.0(_tevent_loop_once+0xa2)
[0x7f0fc8b185e0]
Nov 13 13:01:26 ctdb-ho-2 smbd[30956]:    #17
/usr/lib/x86_64-linux-gnu/samba/libtevent.so.0(tevent_common_loop_wait+0x21)
[0x7f0fc8b187db]
Nov 13 13:01:26 ctdb-ho-2 smbd[30956]:    #18
/usr/lib/x86_64-linux-gnu/samba/libtevent.so.0(+0xaf76) [0x7f0fc8b1cf76]
Nov 13 13:01:26 ctdb-ho-2 smbd[30956]:    #19
/usr/lib/x86_64-linux-gnu/samba/libtevent.so.0(_tevent_loop_wait+0xa)
[0x7f0fc8b18837]
Nov 13 13:01:26 ctdb-ho-2 smbd[30956]:    #20
/usr/lib/x86_64-linux-gnu/samba/libsmbd-base-samba4.so(smbd_process+0x909)
[0x7f0fc8d17b3b]
Nov 13 13:01:26 ctdb-ho-2 smbd[30956]:    #21 /usr/sbin/smbd(+0xccc3)
[0x561a1989ccc3]
Nov 13 13:01:26 ctdb-ho-2 smbd[30956]:    #22
/usr/lib/x86_64-linux-gnu/samba/libtevent.so.0(tevent_common_invoke_fd_handler+0x84)
[0x7f0fc8b18dcd]
Nov 13 13:01:26 ctdb-ho-2 smbd[30956]:    #23
/usr/lib/x86_64-linux-gnu/samba/libtevent.so.0(+0xd378) [0x7f0fc8b1f378]
Nov 13 13:01:26 ctdb-ho-2 smbd[30956]:    #24
/usr/lib/x86_64-linux-gnu/samba/libtevent.so.0(+0xafc8) [0x7f0fc8b1cfc8]
Nov 13 13:01:26 ctdb-ho-2 smbd[30956]:    #25
/usr/lib/x86_64-linux-gnu/samba/libtevent.so.0(_tevent_loop_once+0xa2)
[0x7f0fc8b185e0]
Nov 13 13:01:26 ctdb-ho-2 smbd[30956]:    #26
/usr/lib/x86_64-linux-gnu/samba/libtevent.so.0(tevent_common_loop_wait+0x21)
[0x7f0fc8b187db]
 Nov 13 13:01:26 ctdb-ho-2 smbd[30956]:    #27
/usr/lib/x86_64-linux-gnu/samba/libtevent.so.0(+0xaf76) [0x7f0fc8b1cf76]
Nov 13 13:01:26 ctdb-ho-2 smbd[30956]:    #28
/usr/lib/x86_64-linux-gnu/samba/libtevent.so.0(_tevent_loop_wait+0xa)
[0x7f0fc8b18837]
Nov 13 13:01:26 ctdb-ho-2 smbd[30956]:    #29
/usr/sbin/smbd(main+0x1d21) [0x561a1989eb66]
Nov 13 13:01:26 ctdb-ho-2 smbd[30956]:    #30
/lib/x86_64-linux-gnu/libc.so.6(__libc_start_main+0xeb) [0x7f0fc7fd609b]
Nov 13 13:01:26 ctdb-ho-2 smbd[30956]:    #31
/usr/sbin/smbd(_start+0x2a) [0x561a1989712a]
Nov 13 13:01:26 ctdb-ho-2 smbd[30956]: [2020/11/13 13:01:26.470485,  0]
../../source3/lib/util.c:842(smb_panic_s3)
Nov 13 13:01:26 ctdb-ho-2 smbd[30956]:   smb_panic(): calling panic
action [/usr/share/samba/scripts/panic-action 30956]
Nov 13 13:01:26 ctdb-ho-2 smbd[30956]: [2020/11/13 13:01:26.487612,  0]
../../source3/lib/util.c:850(smb_panic_s3)
Nov 13 13:01:26 ctdb-ho-2 smbd[30956]:   smb_panic(): action returned
status 127
Nov 13 13:01:26 ctdb-ho-2 smbd[30956]: [2020/11/13 13:01:26.487771,  0]
../../source3/lib/dumpcore.c:315(dump_core)
Nov 13 13:01:26 ctdb-ho-2 smbd[30956]:   dumping core in
/var/log/samba/cores/smbd


A ctdb status showed that every node was in status OK.

But users got an "Permission denied" when they open folders or a share,
permissions are lost or not correctly parsed by a client.

With 4.10.9 we didn't had these kind of issues.

Best regards
Bene
-- 
forumZFD
Entschieden für Frieden|Committed to Peace

Benedikt Kaleß
Leiter Team IT|Head team IT

Forum Ziviler Friedensdienst e.V.|Forum Civil Peace Service
Am Kölner Brett 8 | 50825 Köln | Germany

Tel 0221 91273233 | Fax 0221 91273299 |
http://www.forumZFD.de

Vorstand nach § 26 BGB, einzelvertretungsberechtigt|Executive Board:
Oliver Knabe (Vorsitz|Chair), Sonja Wiekenberg-Mlalandle, Alexander Mauz
VR 17651 Amtsgericht Köln

Spenden|Donations: IBAN DE37 3702 0500 0008 2401 01 BIC BFSWDE33XXX



-- 
forumZFD
Entschieden für Frieden|Committed to Peace

Benedikt Kaleß
Leiter Team IT|Head team IT

Forum Ziviler Friedensdienst e.V.|Forum Civil Peace Service
Am Kölner Brett 8 | 50825 Köln | Germany

Tel 0221 91273233 | Fax 0221 91273299 |
http://www.forumZFD.de

Vorstand nach § 26 BGB, einzelvertretungsberechtigt|Executive Board:
Oliver Knabe (Vorsitz|Chair), Sonja Wiekenberg-Mlalandle, Alexander Mauz
VR 17651 Amtsgericht Köln

Spenden|Donations: IBAN DE37 3702 0500 0008 2401 01 BIC BFSWDE33XXX

