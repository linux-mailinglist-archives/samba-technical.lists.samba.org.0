Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 573C85FA38E
	for <lists+samba-technical@lfdr.de>; Mon, 10 Oct 2022 20:46:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=Ka+fWfIYFxPIwJEZxDL5VesbSr9y/mf9mdU424946rY=; b=dyzMZWiVYj7pkjk6wO7Rx8aO5M
	WUlVa2uHPki4ppHoXM/jLDQ8WkSSH+IpfHPgnOU5QXXdV/vDJO8/2BDbML1bETGvmk0kG84KUhJrD
	J8KUZwNJhAdC7dzKHGIGtRN4Gxic214UXLmUy9JvlLdm5pppDSEEqWLJE3yXiU/qoqkY1orAP3B7n
	nfUbGNQvLCHnfZghGOG9H2mIPkN1N8rF0mPvO0j/kNpyIWZkP/d7RbAGENU8O582uxk8ZlZgqjeKi
	GygwnNdhXYchf/jdQ0j+aA8DzHbAlEHws8898k0pIkP26j7bHcqlt/kXIBb4Kg5Qm/AwCkTAXpUFZ
	s+t5s5qQ==;
Received: from ip6-localhost ([::1]:25710 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ohxmf-001C55-2X; Mon, 10 Oct 2022 18:45:49 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:30712) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ohxmZ-001C4w-Hn
 for samba-technical@lists.samba.org; Mon, 10 Oct 2022 18:45:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=Ka+fWfIYFxPIwJEZxDL5VesbSr9y/mf9mdU424946rY=; b=BrXMaQbPkLCajzqsXJsrPY5EzD
 nZtCTByEvqsFhtwaTvqfhs5cpygXeeIx0BvEWg0Z34mtdrZzBxDaYutJ7tv1XAvG82XtpGW9ozRLi
 YS321PJkxSqN1QExwfqhFVhvKe1SQqCst57ByU9eeFZHwXxU6shP8K5Lofl1oDQdzuQ+n4tkdtfQW
 G55IdqwsiQ4smYqhRToFUTRmiXw9PCmTDuUdZrSkGPbieA7mlWZ7hB5QlFQdGC/NGnK5DmMTEtNil
 piqwyVfxAYTGiZ91gCG9xSoz9EZm2m5f6/XI60LODTzlDzennYHYpcCv7ThhUgyHoiCFrWprRTxYz
 i2i6E2x5yBCBQh8RRTA4DZsOmRiPQUMhSQ2jlyb/0qzGxOlt4+qjNqf4Rghw7MU9kvD/YXDbOhsxK
 YGAzwoiOOqSDwthhxS6VgekI2VkWBHCWpDwJShLLMxGDAp9jaWhUtSPGD1AuNIK8SwMchu6T77mZY
 3Be81iUw0xIwwEOQRqr0/gc+;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1ohxmX-003kCA-Rm; Mon, 10 Oct 2022 18:45:42 +0000
Date: Mon, 10 Oct 2022 11:45:39 -0700
To: Stefan Metzmacher <metze@samba.org>
Subject: Re: vfs_crossrename not working in samba-4.15.*
Message-ID: <Y0RoUwniuuHfiJkS@jeremy-acer>
References: <8fbdc4c2-09db-3032-38c4-1608aae5e7f9@samba.org>
 <46bd690d-35c0-0d2c-3101-b90d65b0b35e@samba.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <46bd690d-35c0-0d2c-3101-b90d65b0b35e@samba.org>
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
From: Jeremy Allison via samba-technical <samba-technical@lists.samba.org>
Reply-To: Jeremy Allison <jra@samba.org>
Cc: samba-technical@lists.samba.org,
 Pavel =?iso-8859-1?Q?Filipensk=FD?= <pfilipensky@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Mon, Oct 10, 2022 at 12:34:24PM +0200, Stefan Metzmacher via samba-technical wrote:
>Hi Pavel,
>
>>Program received signal SIGABRT, Aborted.
>>__pthread_kill_implementation (threadid=<optimized out>, signo=signo@entry=6, no_tid=no_tid@entry=0) at pthread_kill.c:44
>>44»·      return INTERNAL_SYSCALL_ERROR_P (ret) ? INTERNAL_SYSCALL_ERRNO (ret) : 0;
>>#0  __pthread_kill_implementation (threadid=<optimized out>, signo=signo@entry=6, no_tid=no_tid@entry=0) at pthread_kill.c:44
>>#1  0x00007fc04abb7cb3 in __pthread_kill_internal (signo=6, threadid=<optimized out>) at pthread_kill.c:78
>>#2  0x00007fc04ab679c6 in __GI_raise (sig=sig@entry=6) at ../sysdeps/posix/raise.c:26
>>#3  0x00007fc04ab517f4 in __GI_abort () at abort.c:79
>>#4  0x00007fc04b076bfa in dump_core () at ../../source3/lib/dumpcore.c:338
>>#5  0x00007fc04b088661 in smb_panic_s3 (why=0x7fc04b311928 "assert failed: share_mode_lock_key_refcount == 0") at ../../source3/lib/util.c:713
>>#6  0x00007fc04ad7c9a1 in smb_panic (why=0x7fc04b311928 "assert failed: share_mode_lock_key_refcount == 0") at ../../lib/util/fault.c:198
>>#7  0x00007fc04b1bfd7a in _share_mode_entry_prepare_lock 
>>(prepare_state=0x7fffa9900f60, id=..., servicepath=0x565379144e10 
>>"/home/pfilipen/workspace/projects/samba/2571/st/ad_member/share",
>>     smb_fname=0x565379162da0, old_write_time=0x7fffa9900eb0, 
>>fn=0x7fc04b2145d9 <open_ntcreate_lock_add_entry>, 
>>private_data=0x7fffa9900f60, location=0x7fc04b32c0f0 
>>"../../source3/smbd/open.c:4342")
>>     at ../../source3/locking/share_mode_lock.c:3010
>
>...
>
>>How this should be fixed? Can we remove the assert and allow to grab the share_mode_lock_key_refcount
>>  again give the owner is the process itself?
>
>It seems the problem got introduced by this commit:
>https://git.samba.org/?p=samba.git;a=commitdiff;h=db743ab005bc7671d4fb0f5bea895c1097b707c5
>"share_mode_lock: DEBUG/ASSERT recursion deadlock detection"
>
>Before open_file_ntcreate() just failed with NT_STATUS_SHARING_VIOLATION if
>get_share_mode_lock() returned NULL... But in 4.14 copy_reg() also used raw open() syscalls...
>
>So the specific problem comes from
>https://git.samba.org/?p=samba.git;a=commitdiff;h=5c18f074be92beea8357a93d64e7118376255ac0
>    s3: VFS: crossrename. Use real dirfsp for SMB_VFS_RENAMEAT()
>
>    Finally fix the promise from the docs that this module is stackable. Re-use copy_internals().
>
>    This is a horrible module that must be removed !
>
>    Signed-off-by: Jeremy Allison <jra@samba.org>
>    Reviewed-by: Noel Power <npower@samba.org>
>
>That commit came after db743ab005bc7671d4fb0f5bea895c1097b707c5
>and seems it was not tested at all (at least together with the recycle module)

As I recall, this was in the middle of the move to fixing our symlink
problem with dirfsp's - so I'm not going to apologise for the lack
of tests on such a rarely used module :-).

Better to fix up later (as we're doing now).

>I guess we can't use copy_internals() here.

copy_internals is horrible and I'd like to see it removed to
be honest.

>Now that we use g_lock we may allow share_mode_do_locked_vfs_allowed() or
>share_mode_entry_prepare_lock_del() with close_share_mode_lock_prepare() setting
>*keep_locked = true to lock multiple file_ids at the same time...
>But it will be a tricky change.

A. Modest. Proposal. :-). Needing crossrename is a sign of
administrator failure to set up the share directories correctly.

Can we just delete this module ?

Pavel, who is using this and for what purpose ?

