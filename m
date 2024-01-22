Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id F1DCB835F04
	for <lists+samba-technical@lfdr.de>; Mon, 22 Jan 2024 11:04:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=9YFkFXUM/L4HKt/R4pWmA+aTG0iBsmfOLOSabI7PkZ8=; b=ts/p6IzuHmDGYCB/hceeoAo+Pn
	0yazvOvIMqmPGPEgNXh4EsOMBjChjTVvR/rKx9NBqAiuaV/oWHuMn9M0x8BrVEr0skT8OK5uUMmsP
	xONhLc6N6t9f5Y4FKpbbWmYf7hMQLfdVVFSrsiJwx71OX2wXqq8xFkuylHZwKRX2BejPC5U3SNtLF
	FldPWu/q6GdPQ/JfrthPYSrywtw6jLq1iEHrOxAnatnlrVL3GPUW+5WmLUKgHpvMa4aT9ufG3bbe3
	D6n6myBQlAjFrO0vV7aW6SSWCBsQSYhCnLoO0FQR6Cow3L7vctJqrv8/iH+2+9HFjaUX9pT0+ZAdz
	3sJZv4QA==;
Received: from ip6-localhost ([::1]:52762 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1rRrA1-004AsR-4V; Mon, 22 Jan 2024 10:04:09 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:58448) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rRr9v-004AsK-Ac
 for samba-technical@lists.samba.org; Mon, 22 Jan 2024 10:04:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=9YFkFXUM/L4HKt/R4pWmA+aTG0iBsmfOLOSabI7PkZ8=; b=RtqYEEr+gktSBrcPppkMIySHTG
 z7Yx2vlRWOGXgSRPyhQ+qajymaPpB0nGAREGeBgFvU1hFKm7TWyRPUMILjKy+9DCJ3umUob7kKpV9
 u9Ri/3+BOSkUZ48C57ku6UzodRaGVlIzNFonhyWvXnh0fyluKjejhWjE55R1wjQb1nMSflJ1xVefH
 MxgUojtMxoiN8P5fGnVkkRCFi8fzFXWV2N5Xruast/TtsLbNvl+8MB/wW6SEXJznxfmHmQr/Wsysf
 +DS1o7DN0jn+8+DY/C/oMOvEoLkaWjXMfZZqYny3w9QIzDPycgmXun9bKxpbhWjMuWBzmGHxZ1qRs
 xnTglrP7itBjObXC98zIkyH+HyyRhOND0yP/V8LK2qjP3d5IIwXHsnANNYQsjubnu2u49zyG29sUn
 bBngEBZrWjnmaJrDpBLZsvW/MJCEUnzmoprboFo9GQ69B+arHpeHKSoq3CFQ/xkLDNWcSpOVbYlAH
 IQET9LrKeGBm2he+4rWdzNNV;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rRr9t-0099jh-2O; Mon, 22 Jan 2024 10:04:02 +0000
To: Jeremy Allison <jra@samba.org>
Subject: Re: Leak Sanitizer in Samba
Date: Mon, 22 Jan 2024 11:04:00 +0100
Message-ID: <6014782.lOV4Wx5bFT@magrathea>
In-Reply-To: <ZasZOEEanBukpq5e@jeremy-HP-Z840-Workstation>
References: <2330326.ElGaqSPkdT@magrathea>
 <ZasZOEEanBukpq5e@jeremy-HP-Z840-Workstation>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
From: Andreas Schneider via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andreas Schneider <asn@samba.org>
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Saturday, 20 January 2024 01:52:08 CET Jeremy Allison wrote:
> On Thu, Oct 26, 2023 at 09:58:56AM +0200, Andreas Schneider via samba-
technical wrote:
> >Hi,
> >
> >you might already know AddressSanitizer. AddressSanitizer also has a
> >LeakSanitizer built it, however it is disabled in Samba. I'm trying to get
> >it working as we have memory leaks probably in Winbind and rpcd-lsa. So
> >the last days I fixed issues which prevented to actually run 'make
> >testenv'. In case you want to help fixing memory leaks you can use this
> >branch:
> >
> >https://git.samba.org/?p=asn/samba.git;a=shortlog;h=refs/heads/asn-lsan
> >
> >I'm currently stuck with memcache and smbpasswd.
> >
> >The AD DC testenv already starts. It finds tfork leaks on shutdown. It
> >would be great if someone could fix those ...
> 
> This looks like a fun hobby :-). Any more leaks to look at ?
> 
> Can you maybe post ones you find here ?

Fixes for memory leaks are here:
https://gitlab.com/samba-team/samba/-/merge_requests/3411


In case you want to fix a few. Here is a current report of ad_member env which 
doesn't start yet.

Direct leak of 12 byte(s) in 1 object(s) allocated from:
#0 0x7f81f7a841f8 in strdup (/lib64/libasan.so.8+0x841f8) (BuildId: 
55873bde3d5976c9777063d3c9cd474324265789)
#1 0x7f81f6d853ea in smb_xstrdup ../../lib/util/util.c:752
#2 0x56074bfc5b2d in rpc_trustdom_establish ../../source3/utils/net_rpc.c:6591
#3 0x56074c027de7 in net_run_function ../../source3/utils/net_util.c:464
#4 0x56074bfb12d9 in rpc_trustdom ../../source3/utils/net_rpc.c:7483
#5 0x56074c027de7 in net_run_function ../../source3/utils/net_util.c:464
#6 0x56074bfd3be8 in net_rpc ../../source3/utils/net_rpc.c:8413
#7 0x56074c027de7 in net_run_function ../../source3/utils/net_util.c:464
#8 0x56074bf7f599 in main ../../source3/utils/net.c:1372
#9 0x7f81f2a281af in __libc_start_call_main ../sysdeps/nptl/
libc_start_call_main.h:58

Direct leak of 12 byte(s) in 1 object(s) allocated from:
#0 0x7f81f7a841f8 in strdup (/lib64/libasan.so.8+0x841f8) (BuildId: 
55873bde3d5976c9777063d3c9cd474324265789)
#1 0x7f81f6d853ea in smb_xstrdup ../../lib/util/util.c:752
#2 0x56074bfc5a41 in rpc_trustdom_establish ../../source3/utils/net_rpc.c:6569
#3 0x56074c027de7 in net_run_function ../../source3/utils/net_util.c:464
#4 0x56074bfb12d9 in rpc_trustdom ../../source3/utils/net_rpc.c:7483
#5 0x56074c027de7 in net_run_function ../../source3/utils/net_util.c:464
#6 0x56074bfd3be8 in net_rpc ../../source3/utils/net_rpc.c:8413
#7 0x56074c027de7 in net_run_function ../../source3/utils/net_util.c:464
#8 0x56074bf7f599 in main ../../source3/utils/net.c:1372
#9 0x7f81f2a281af in __libc_start_call_main ../sysdeps/nptl/
libc_start_call_main.h:58

=================================================================
==10879==ERROR: LeakSanitizer: detected memory leaks

Direct leak of 208 byte(s) in 13 object(s) allocated from:
#0 0x7f65b6edc03f in malloc (/lib64/libasan.so.8+0xdc03f) (BuildId: 
55873bde3d5976c9777063d3c9cd474324265789)
#1 0x7f65b69a1723 in tfork_create ../../lib/util/tfork.c:766
#2 0x7f65b15d669e in prefork_fork_master ../../source4/samba/
process_prefork.c:252
#3 0x7f65b15d72de in prefork_new_task ../../source4/samba/process_prefork.c:
858
#4 0x7f65b6b4583e in task_server_startup ../../source4/samba/service_task.c:
127
#5 0x7f65b6b42549 in server_service_init ../../source4/samba/service.c:70
#6 0x7f65b6b42549 in server_service_startup ../../source4/samba/service.c:107
#7 0x55c7d85c2201 in binary_smbd_main ../../source4/samba/server.c:952
#8 0x55c7d85c28a8 in main ../../source4/samba/server.c:996
#9 0x7f65b2c281af in __libc_start_call_main ../sysdeps/nptl/
libc_start_call_main.h:58

SUMMARY: AddressSanitizer: 208 byte(s) leaked in 13 allocation(s).

=================================================================
==11341==ERROR: LeakSanitizer: detected memory leaks

Direct leak of 472 byte(s) in 1 object(s) allocated from:
#0 0x7fef754dba17 in calloc (/lib64/libasan.so.8+0xdba17) (BuildId: 
55873bde3d5976c9777063d3c9cd474324265789)
#1 0x7fef7217c7e5 in krb5_init_context_profile krb/init_ctx.c:202
#2 0x7fef741ebaa9 in smb_krb5_init_context_basic ../../source4/auth/kerberos/
krb5_init_context.c:690
#3 0x7fef741ebc8a in smb_krb5_init_context ../../source4/auth/kerberos/
krb5_init_context.c:789
#4 0x7fef6fa589d8 in mitkdc_task_init ../../source4/kdc/kdc-service-mit.c:266
#5 0x7fef74fe7736 in task_server_callback ../../source4/samba/service_task.c:
102
#6 0x7fef6fa86cb8 in standard_new_task ../../source4/samba/process_standard.c:
525
#7 0x7fef74fe783e in task_server_startup ../../source4/samba/service_task.c:
127
#8 0x7fef74fe4549 in server_service_init ../../source4/samba/service.c:70
#9 0x7fef74fe4549 in server_service_startup ../../source4/samba/service.c:107
#10 0x55894f946201 in binary_smbd_main ../../source4/samba/server.c:952
#11 0x55894f9468a8 in main ../../source4/samba/server.c:996
#12 0x7fef710281af in __libc_start_call_main ../sysdeps/nptl/
libc_start_call_main.h:58

Indirect leak of 128 byte(s) in 1 object(s) allocated from:
#0 0x7fef754dc03f in malloc (/lib64/libasan.so.8+0xdc03f) (BuildId: 
55873bde3d5976c9777063d3c9cd474324265789)
#1 0x7fef71d54c3b in k5_buf_init_dynamic /usr/src/debug/krb5-1.21.2/src/util/
support/k5buf.c:128

Indirect leak of 40 byte(s) in 1 object(s) allocated from:
#0 0x7fef754dc03f in malloc (/lib64/libasan.so.8+0xdc03f) (BuildId: 
55873bde3d5976c9777063d3c9cd474324265789)
#1 0x7fef721ab750 in profile_init_flags ../../util/profile/prof_init.c:174

Indirect leak of 24 byte(s) in 1 object(s) allocated from:
#0 0x7fef754dc03f in malloc (/lib64/libasan.so.8+0xdc03f) (BuildId: 
55873bde3d5976c9777063d3c9cd474324265789)
#1 0x7fef721a8a1b in profile_open_file ../../util/profile/prof_file.c:179

SUMMARY: AddressSanitizer: 664 byte(s) leaked in 4 allocation(s).
-----------------------------------------------------
Suppressions used:
count      bytes template
20      27785 libpython3.*.so.*
-----------------------------------------------------


=================================================================
==10893==ERROR: LeakSanitizer: detected memory leaks

Direct leak of 48 byte(s) in 3 object(s) allocated from:
#0 0x7f65b6edc03f in malloc (/lib64/libasan.so.8+0xdc03f) (BuildId: 
55873bde3d5976c9777063d3c9cd474324265789)
#1 0x7f65b69a1723 in tfork_create ../../lib/util/tfork.c:766
#2 0x7f65b15d669e in prefork_fork_master ../../source4/samba/
process_prefork.c:252
#3 0x7f65b15d72de in prefork_new_task ../../source4/samba/process_prefork.c:
858
#4 0x7f65b6b4583e in task_server_startup ../../source4/samba/service_task.c:
127
#5 0x7f65b6b42549 in server_service_init ../../source4/samba/service.c:70
#6 0x7f65b6b42549 in server_service_startup ../../source4/samba/service.c:107
#7 0x55c7d85c2201 in binary_smbd_main ../../source4/samba/server.c:952
#8 0x55c7d85c28a8 in main ../../source4/samba/server.c:996
#9 0x7f65b2c281af in __libc_start_call_main ../sysdeps/nptl/
libc_start_call_main.h:58

SUMMARY: AddressSanitizer: 48 byte(s) leaked in 3 allocation(s).

=================================================================
==10916==ERROR: LeakSanitizer: detected memory leaks

Direct leak of 144 byte(s) in 9 object(s) allocated from:
#0 0x7f65b6edc03f in malloc (/lib64/libasan.so.8+0xdc03f) (BuildId: 
55873bde3d5976c9777063d3c9cd474324265789)
#1 0x7f65b69a1723 in tfork_create ../../lib/util/tfork.c:766
#2 0x7f65b15d669e in prefork_fork_master ../../source4/samba/
process_prefork.c:252
#3 0x7f65b15d72de in prefork_new_task ../../source4/samba/process_prefork.c:
858
#4 0x7f65b6b4583e in task_server_startup ../../source4/samba/service_task.c:
127
#5 0x7f65b6b42549 in server_service_init ../../source4/samba/service.c:70
#6 0x7f65b6b42549 in server_service_startup ../../source4/samba/service.c:107
#7 0x55c7d85c2201 in binary_smbd_main ../../source4/samba/server.c:952
#8 0x55c7d85c28a8 in main ../../source4/samba/server.c:996
#9 0x7f65b2c281af in __libc_start_call_main ../sysdeps/nptl/
libc_start_call_main.h:58

SUMMARY: AddressSanitizer: 144 byte(s) leaked in 9 allocation(s).

=================================================================
==10897==ERROR: LeakSanitizer: detected memory leaks

Direct leak of 80 byte(s) in 5 object(s) allocated from:
#0 0x7f65b6edc03f in malloc (/lib64/libasan.so.8+0xdc03f) (BuildId: 
55873bde3d5976c9777063d3c9cd474324265789)
#1 0x7f65b69a1723 in tfork_create ../../lib/util/tfork.c:766
#2 0x7f65b15d669e in prefork_fork_master ../../source4/samba/
process_prefork.c:252
#3 0x7f65b15d72de in prefork_new_task ../../source4/samba/process_prefork.c:
858
#4 0x7f65b6b4583e in task_server_startup ../../source4/samba/service_task.c:
127
#5 0x7f65b6b42549 in server_service_init ../../source4/samba/service.c:70
#6 0x7f65b6b42549 in server_service_startup ../../source4/samba/service.c:107
#7 0x55c7d85c2201 in binary_smbd_main ../../source4/samba/server.c:952
#8 0x55c7d85c28a8 in main ../../source4/samba/server.c:996
#9 0x7f65b2c281af in __libc_start_call_main ../sysdeps/nptl/
libc_start_call_main.h:58

Direct leak of 48 byte(s) in 3 object(s) allocated from:
#0 0x7f65b6edc03f in malloc (/lib64/libasan.so.8+0xdc03f) (BuildId: 
55873bde3d5976c9777063d3c9cd474324265789)
#1 0x7f65b69a1723 in tfork_create ../../lib/util/tfork.c:766
#2 0x7f65b15d603a in prefork_fork_worker ../../source4/samba/
process_prefork.c:753
#3 0x7f65b15d721a in prefork_fork_master ../../source4/samba/
process_prefork.c:453
#4 0x7f65b15d72de in prefork_new_task ../../source4/samba/process_prefork.c:
858
#5 0x7f65b6b4583e in task_server_startup ../../source4/samba/service_task.c:
127
#6 0x7f65b6b42549 in server_service_init ../../source4/samba/service.c:70
#7 0x7f65b6b42549 in server_service_startup ../../source4/samba/service.c:107
#8 0x55c7d85c2201 in binary_smbd_main ../../source4/samba/server.c:952
#9 0x55c7d85c28a8 in main ../../source4/samba/server.c:996
#10 0x7f65b2c281af in __libc_start_call_main ../sysdeps/nptl/
libc_start_call_main.h:58

SUMMARY: AddressSanitizer: 128 byte(s) leaked in 8 allocation(s).

=================================================================
==10925==ERROR: LeakSanitizer: detected memory leaks

Direct leak of 192 byte(s) in 12 object(s) allocated from:
#0 0x7f65b6edc03f in malloc (/lib64/libasan.so.8+0xdc03f) (BuildId: 
55873bde3d5976c9777063d3c9cd474324265789)
#1 0x7f65b69a1723 in tfork_create ../../lib/util/tfork.c:766
#2 0x7f65b15d669e in prefork_fork_master ../../source4/samba/
process_prefork.c:252
#3 0x7f65b15d72de in prefork_new_task ../../source4/samba/process_prefork.c:
858
#4 0x7f65b6b4583e in task_server_startup ../../source4/samba/service_task.c:
127
#5 0x7f65b6b42549 in server_service_init ../../source4/samba/service.c:70
#6 0x7f65b6b42549 in server_service_startup ../../source4/samba/service.c:107
#7 0x55c7d85c2201 in binary_smbd_main ../../source4/samba/server.c:952
#8 0x55c7d85c28a8 in main ../../source4/samba/server.c:996
#9 0x7f65b2c281af in __libc_start_call_main ../sysdeps/nptl/
libc_start_call_main.h:58

SUMMARY: AddressSanitizer: 192 byte(s) leaked in 12 allocation(s).

=================================================================
==10933==ERROR: LeakSanitizer: detected memory leaks

Direct leak of 224 byte(s) in 14 object(s) allocated from:
#0 0x7f65b6edc03f in malloc (/lib64/libasan.so.8+0xdc03f) (BuildId: 
55873bde3d5976c9777063d3c9cd474324265789)
#1 0x7f65b69a1723 in tfork_create ../../lib/util/tfork.c:766
#2 0x7f65b15d669e in prefork_fork_master ../../source4/samba/
process_prefork.c:252
#3 0x7f65b15d72de in prefork_new_task ../../source4/samba/process_prefork.c:
858
#4 0x7f65b6b4583e in task_server_startup ../../source4/samba/service_task.c:
127
#5 0x7f65b6b42549 in server_service_init ../../source4/samba/service.c:70
#6 0x7f65b6b42549 in server_service_startup ../../source4/samba/service.c:107
#7 0x55c7d85c2201 in binary_smbd_main ../../source4/samba/server.c:952
#8 0x55c7d85c28a8 in main ../../source4/samba/server.c:996
#9 0x7f65b2c281af in __libc_start_call_main ../sysdeps/nptl/
libc_start_call_main.h:58

Direct leak of 48 byte(s) in 3 object(s) allocated from:
#0 0x7f65b6edc03f in malloc (/lib64/libasan.so.8+0xdc03f) (BuildId: 
55873bde3d5976c9777063d3c9cd474324265789)
#1 0x7f65b69a1723 in tfork_create ../../lib/util/tfork.c:766
#2 0x7f65b15d603a in prefork_fork_worker ../../source4/samba/
process_prefork.c:753
#3 0x7f65b15d721a in prefork_fork_master ../../source4/samba/
process_prefork.c:453
#4 0x7f65b15d72de in prefork_new_task ../../source4/samba/process_prefork.c:
858
#5 0x7f65b6b4583e in task_server_startup ../../source4/samba/service_task.c:
127
#6 0x7f65b6b42549 in server_service_init ../../source4/samba/service.c:70
#7 0x7f65b6b42549 in server_service_startup ../../source4/samba/service.c:107
#8 0x55c7d85c2201 in binary_smbd_main ../../source4/samba/server.c:952
#9 0x55c7d85c28a8 in main ../../source4/samba/server.c:996
#10 0x7f65b2c281af in __libc_start_call_main ../sysdeps/nptl/
libc_start_call_main.h:58

SUMMARY: AddressSanitizer: 272 byte(s) leaked in 17 allocation(s).

=================================================================
==10901==ERROR: LeakSanitizer: detected memory leaks

Direct leak of 80 byte(s) in 5 object(s) allocated from:
#0 0x7f65b6edc03f in malloc (/lib64/libasan.so.8+0xdc03f) (BuildId: 
55873bde3d5976c9777063d3c9cd474324265789)
#1 0x7f65b69a1723 in tfork_create ../../lib/util/tfork.c:766
#2 0x7f65b15d669e in prefork_fork_master ../../source4/samba/
process_prefork.c:252
#3 0x7f65b15d72de in prefork_new_task ../../source4/samba/process_prefork.c:
858
#4 0x7f65b6b4583e in task_server_startup ../../source4/samba/service_task.c:
127
#5 0x7f65b6b42549 in server_service_init ../../source4/samba/service.c:70
#6 0x7f65b6b42549 in server_service_startup ../../source4/samba/service.c:107
#7 0x55c7d85c2201 in binary_smbd_main ../../source4/samba/server.c:952
#8 0x55c7d85c28a8 in main ../../source4/samba/server.c:996
#9 0x7f65b2c281af in __libc_start_call_main ../sysdeps/nptl/
libc_start_call_main.h:58

SUMMARY: AddressSanitizer: 80 byte(s) leaked in 5 allocation(s).

=================================================================
==10930==ERROR: LeakSanitizer: detected memory leaks

Direct leak of 192 byte(s) in 12 object(s) allocated from:
#0 0x7f65b6edc03f in malloc (/lib64/libasan.so.8+0xdc03f) (BuildId: 
55873bde3d5976c9777063d3c9cd474324265789)
#1 0x7f65b69a1723 in tfork_create ../../lib/util/tfork.c:766
#2 0x7f65b15d669e in prefork_fork_master ../../source4/samba/
process_prefork.c:252
#3 0x7f65b15d72de in prefork_new_task ../../source4/samba/process_prefork.c:
858
#4 0x7f65b6b4583e in task_server_startup ../../source4/samba/service_task.c:
127
#5 0x7f65b6b42549 in server_service_init ../../source4/samba/service.c:70
#6 0x7f65b6b42549 in server_service_startup ../../source4/samba/service.c:107
#7 0x55c7d85c2201 in binary_smbd_main ../../source4/samba/server.c:952
#8 0x55c7d85c28a8 in main ../../source4/samba/server.c:996
#9 0x7f65b2c281af in __libc_start_call_main ../sysdeps/nptl/
libc_start_call_main.h:58

SUMMARY: AddressSanitizer: 192 byte(s) leaked in 12 allocation(s).

=================================================================
==10886==ERROR: LeakSanitizer: detected memory leaks

Direct leak of 48 byte(s) in 3 object(s) allocated from:
#0 0x7f65b6edc03f in malloc (/lib64/libasan.so.8+0xdc03f) (BuildId: 
55873bde3d5976c9777063d3c9cd474324265789)
#1 0x7f65b69a1723 in tfork_create ../../lib/util/tfork.c:766
#2 0x7f65b15d603a in prefork_fork_worker ../../source4/samba/
process_prefork.c:753
#3 0x7f65b15d721a in prefork_fork_master ../../source4/samba/
process_prefork.c:453
#4 0x7f65b15d72de in prefork_new_task ../../source4/samba/process_prefork.c:
858
#5 0x7f65b6b4583e in task_server_startup ../../source4/samba/service_task.c:
127
#6 0x7f65b6b42549 in server_service_init ../../source4/samba/service.c:70
#7 0x7f65b6b42549 in server_service_startup ../../source4/samba/service.c:107
#8 0x55c7d85c2201 in binary_smbd_main ../../source4/samba/server.c:952
#9 0x55c7d85c28a8 in main ../../source4/samba/server.c:996
#10 0x7f65b2c281af in __libc_start_call_main ../sysdeps/nptl/
libc_start_call_main.h:58

Direct leak of 32 byte(s) in 2 object(s) allocated from:
#0 0x7f65b6edc03f in malloc (/lib64/libasan.so.8+0xdc03f) (BuildId: 
55873bde3d5976c9777063d3c9cd474324265789)
#1 0x7f65b69a1723 in tfork_create ../../lib/util/tfork.c:766
#2 0x7f65b15d669e in prefork_fork_master ../../source4/samba/
process_prefork.c:252
#3 0x7f65b15d72de in prefork_new_task ../../source4/samba/process_prefork.c:
858
#4 0x7f65b6b4583e in task_server_startup ../../source4/samba/service_task.c:
127
#5 0x7f65b6b42549 in server_service_init ../../source4/samba/service.c:70
#6 0x7f65b6b42549 in server_service_startup ../../source4/samba/service.c:107
#7 0x55c7d85c2201 in binary_smbd_main ../../source4/samba/server.c:952
#8 0x55c7d85c28a8 in main ../../source4/samba/server.c:996
#9 0x7f65b2c281af in __libc_start_call_main ../sysdeps/nptl/
libc_start_call_main.h:58

SUMMARY: AddressSanitizer: 80 byte(s) leaked in 5 allocation(s).

=================================================================
==10922==ERROR: LeakSanitizer: detected memory leaks


=================================================================
Direct leak of 176 byte(s) in 11 object(s) allocated from:
==10908==ERROR: LeakSanitizer: detected memory leaks

Direct leak of 112 byte(s) in 7 object(s) allocated from:
#0 0x7f65b6edc03f in malloc (/lib64/libasan.so.8+0xdc03f) (BuildId: 
55873bde3d5976c9777063d3c9cd474324265789)
#1 0x7f65b69a1723 in tfork_create ../../lib/util/tfork.c:766
#2 0x7f65b15d669e in prefork_fork_master ../../source4/samba/
process_prefork.c:252
#3 0x7f65b15d72de in prefork_new_task ../../source4/samba/process_prefork.c:
858
#4 0x7f65b6b4583e in task_server_startup ../../source4/samba/service_task.c:
127
#5 0x7f65b6b42549 in server_service_init ../../source4/samba/service.c:70
#6 0x7f65b6b42549 in server_service_startup ../../source4/samba/service.c:107
#7 0x55c7d85c2201 in binary_smbd_main ../../source4/samba/server.c:952
#8 0x55c7d85c28a8 in main ../../source4/samba/server.c:996
#9 0x7f65b2c281af in __libc_start_call_main ../sysdeps/nptl/
libc_start_call_main.h:58

SUMMARY: AddressSanitizer: 176 byte(s) leaked in 11 allocation(s).
#0 0x7f65b6edc03f in malloc (/lib64/libasan.so.8+0xdc03f) (BuildId: 
55873bde3d5976c9777063d3c9cd474324265789)
#1 0x7f65b69a1723 in tfork_create ../../lib/util/tfork.c:766
#2 0x7f65b15d669e in prefork_fork_master ../../source4/samba/
process_prefork.c:252
#3 0x7f65b15d72de in prefork_new_task ../../source4/samba/process_prefork.c:
858
#4 0x7f65b6b4583e in task_server_startup ../../soc (/lib64/libasan.so.
8+0xdc03f) (BuildId: 55873bde3d5ocated from:
#0 0x7f65b6edc03f in malloc (/lib64/libasan.so.8+0xdc03f) (Buil)



-- 
Andreas Schneider                      asn@samba.org
Samba Team                             www.samba.org
GPG-ID:     8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D



