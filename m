Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 271695F9CD1
	for <lists+samba-technical@lfdr.de>; Mon, 10 Oct 2022 12:35:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=KB1Ks824/+dfBNG4mCO+zziKLYUHFlsSy3HyeVjmhJY=; b=dQwdsLarJrlrpadkKsTfNjShb2
	b8P9MQy8T94SOKA2wrqc95mEM0e291xUnsdOl5A3R2vGV+iVvkn2g/GqUY+Io1iKjHLjeIHgQ9p6C
	4exYna2273UxoL5W2JKj4cONibL6BFnCQgzN+D57I9octlqknNk2sFPCmHaxK0GK0Ags6p1aQS/v9
	EgHX/oP4B+brxTrxyfhPEguUymIDvUtW5E7dgxVwPhn6HYHbU8R1+GBXXx+ZeO7hLl7U0/Vz2XWZw
	MMcr0xMSaKWgUIVoh+/+oQyb+9+8B6ubbvRDYfDwIuMHZBg8sRPI0zj40OmoOLpi+G+BUMk39465n
	e6kXUyIQ==;
Received: from ip6-localhost ([::1]:64114 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ohq7C-0018EK-W0; Mon, 10 Oct 2022 10:34:31 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:50632) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ohq77-0018EB-Dl
 for samba-technical@lists.samba.org; Mon, 10 Oct 2022 10:34:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=KB1Ks824/+dfBNG4mCO+zziKLYUHFlsSy3HyeVjmhJY=; b=Vnezfk6t9GYJm3aMW5ZhqnEPiz
 xmBideC5rsFio5Iq9nzH47yrSjtv5vSWlx8MmJU7/l1stD2LvaBnGLYoVqcsDnguGrFp96Eb1Awiz
 GZxPdQRjDXC6KRn28hELOOA5sBCYAQSAH+d+rYuoz1OgzUdU7qdLwc+Sa4uJMMQZ3WsGcfFFjPwCk
 r/RxDfRxQHCuUcp+Pbb3PB9EOi7swogUkz9ik+hJkTGLVpOlmcA8CHua1BrqJm/+jfUKP5gGBu2qu
 ZO3Yin4/qFFH7GkqFq/WRRNIlfQFl0PXaV39hE6qV/RWLKkBZTda1xhh920crllup9+5rQ9F2sHSN
 r0qif9sFvHe1ku/dQBQcx/MroNWU8qcwel/yriN+UiC0tKuRhW0BHJlcJCb6rkqK8dd3i/BfayKKE
 zJ8VQRGA0AEMGTwwxPYAQ/6HqDSFfciRpCuW4T4vbeb8aJ46bA+JI80J16B2RBHKybkH26ZZ4CmLT
 N+zbFhFbEVZ92D8mcIYSa3RM;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1ohq76-003hwT-FD; Mon, 10 Oct 2022 10:34:24 +0000
Message-ID: <46bd690d-35c0-0d2c-3101-b90d65b0b35e@samba.org>
Date: Mon, 10 Oct 2022 12:34:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Content-Language: en-US, de-DE
To: =?UTF-8?Q?Pavel_Filipensk=c3=bd?= <pfilipensky@samba.org>,
 samba-technical@lists.samba.org
References: <8fbdc4c2-09db-3032-38c4-1608aae5e7f9@samba.org>
Subject: Re: vfs_crossrename not working in samba-4.15.*
In-Reply-To: <8fbdc4c2-09db-3032-38c4-1608aae5e7f9@samba.org>
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
From: Stefan Metzmacher via samba-technical <samba-technical@lists.samba.org>
Reply-To: Stefan Metzmacher <metze@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi Pavel,

> Program received signal SIGABRT, Aborted.
> __pthread_kill_implementation (threadid=<optimized out>, signo=signo@entry=6, no_tid=no_tid@entry=0) at pthread_kill.c:44
> 44»·      return INTERNAL_SYSCALL_ERROR_P (ret) ? INTERNAL_SYSCALL_ERRNO (ret) : 0;
> #0  __pthread_kill_implementation (threadid=<optimized out>, signo=signo@entry=6, no_tid=no_tid@entry=0) at pthread_kill.c:44
> #1  0x00007fc04abb7cb3 in __pthread_kill_internal (signo=6, threadid=<optimized out>) at pthread_kill.c:78
> #2  0x00007fc04ab679c6 in __GI_raise (sig=sig@entry=6) at ../sysdeps/posix/raise.c:26
> #3  0x00007fc04ab517f4 in __GI_abort () at abort.c:79
> #4  0x00007fc04b076bfa in dump_core () at ../../source3/lib/dumpcore.c:338
> #5  0x00007fc04b088661 in smb_panic_s3 (why=0x7fc04b311928 "assert failed: share_mode_lock_key_refcount == 0") at ../../source3/lib/util.c:713
> #6  0x00007fc04ad7c9a1 in smb_panic (why=0x7fc04b311928 "assert failed: share_mode_lock_key_refcount == 0") at ../../lib/util/fault.c:198
> #7  0x00007fc04b1bfd7a in _share_mode_entry_prepare_lock (prepare_state=0x7fffa9900f60, id=..., servicepath=0x565379144e10 
> "/home/pfilipen/workspace/projects/samba/2571/st/ad_member/share",
>      smb_fname=0x565379162da0, old_write_time=0x7fffa9900eb0, fn=0x7fc04b2145d9 <open_ntcreate_lock_add_entry>, private_data=0x7fffa9900f60, location=0x7fc04b32c0f0 
> "../../source3/smbd/open.c:4342")
>      at ../../source3/locking/share_mode_lock.c:3010

...

> How this should be fixed? Can we remove the assert and allow to grab the share_mode_lock_key_refcount
>   again give the owner is the process itself?

It seems the problem got introduced by this commit:
https://git.samba.org/?p=samba.git;a=commitdiff;h=db743ab005bc7671d4fb0f5bea895c1097b707c5
"share_mode_lock: DEBUG/ASSERT recursion deadlock detection"

Before open_file_ntcreate() just failed with NT_STATUS_SHARING_VIOLATION if
get_share_mode_lock() returned NULL... But in 4.14 copy_reg() also used raw open() syscalls...

So the specific problem comes from
https://git.samba.org/?p=samba.git;a=commitdiff;h=5c18f074be92beea8357a93d64e7118376255ac0
     s3: VFS: crossrename. Use real dirfsp for SMB_VFS_RENAMEAT()

     Finally fix the promise from the docs that this module is stackable. Re-use copy_internals().

     This is a horrible module that must be removed !

     Signed-off-by: Jeremy Allison <jra@samba.org>
     Reviewed-by: Noel Power <npower@samba.org>

That commit came after db743ab005bc7671d4fb0f5bea895c1097b707c5
and seems it was not tested at all (at least together with the recycle module)

I guess we can't use copy_internals() here.

Now that we use g_lock we may allow share_mode_do_locked_vfs_allowed() or
share_mode_entry_prepare_lock_del() with close_share_mode_lock_prepare() setting
*keep_locked = true to lock multiple file_ids at the same time...
But it will be a tricky change.

metze








