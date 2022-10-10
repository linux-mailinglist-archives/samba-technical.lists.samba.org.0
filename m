Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 462A65F9F7E
	for <lists+samba-technical@lfdr.de>; Mon, 10 Oct 2022 15:36:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=suripZ2sQ4veIae1R0TLfAL3yapYrCLQTmZ7Pfo4nec=; b=rOvojjin+Q+qIUQbeW1hoOtOcs
	teD1KoS/PD04LSLQ9FLma257nlVfgCx6sMKGtxjdG17KyOUSvC1qv26DchkkBFdaGQf5a7SFxbp1w
	Bh9VkEG69JyqmGoxUcRYv6X4NgALMzULKIvZGVNC435rf6SBjPUIZ40PR1rjfLM9hTYFz+VaXIIgA
	wNlJya42iqtFmLRNfFoIkAn4IvmPL0Yk0m7gsRt1XY2sOyHvViHkjexpSmbGyrrGog94LT55IjhGM
	Sd108Tp2JiF4MZIq1+JcueAC6Quz91vqcGV5Nr1e1HDzoum+vsWoKR0wsLTO2z0bkiSaKRfXg/O3J
	gdpkzlBg==;
Received: from ip6-localhost ([::1]:18298 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ohsw2-0019KS-Hu; Mon, 10 Oct 2022 13:35:10 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:53588) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ohsvv-0019KJ-83
 for samba-technical@lists.samba.org; Mon, 10 Oct 2022 13:35:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=UhJvoTjaGQAO9CST41fAyA+U8tLqw20ZR9o1xEoCA9k=; b=fYXqsA2Dq0V2dhYX4Zr7mg/iBn
 if0+O+LK1teuyhff7o1ZrhDxTyQiBWZmNds9zRL2TfkHAJxb7eEodDtGu3qXJIQdRe1uMWXu3aZl5
 /o8lCuYfUCACLRvRFDEE45tERA3ym+/Zhzr3NipIf+hB2ozPC9fZ4BvKeT1r5up0TZT5bwRsNAt3d
 eggrPjIH0C8Z1vH9K9fjJa/FlxpkRYGC6UFOrmlbJU1OTMKJs/Q7CTHcoVEUdE3MmPbW3fjJiSBCE
 H8ynMuSfVzJ8qpmlvN8h2MNgCwWwgHvJ6ER+iHhwC3krTjyQY0Ou92xdmvFfAHvAb3X5LYbPEqo2u
 D3uGBVJf8L9WPYYQP0ZrZpDzzpdXFExksf6c9sC0qjo7bdn9DjlSxOSDebkX7zyODeWtscEahghVE
 ciIF6tbjJ8Z8XQNNQ3+yStvzciGwG51Bdc8qJ5kq1S7u5y+6O+wFwF3GKznZQBmDz6QLatXZgFh98
 qJ/YySG9DNowJVHEOIT3+23e;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1ohsvt-003inM-NO; Mon, 10 Oct 2022 13:35:01 +0000
Message-ID: <9dd2af39-6816-7364-aceb-b8bbc5e972ab@samba.org>
Date: Mon, 10 Oct 2022 15:35:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: vfs_crossrename not working in samba-4.15.*
Content-Language: en-US
To: Stefan Metzmacher <metze@samba.org>, samba-technical@lists.samba.org
References: <8fbdc4c2-09db-3032-38c4-1608aae5e7f9@samba.org>
 <46bd690d-35c0-0d2c-3101-b90d65b0b35e@samba.org>
In-Reply-To: <46bd690d-35c0-0d2c-3101-b90d65b0b35e@samba.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
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
From: =?utf-8?q?Pavel_Filipensk=C3=BD_via_samba-technical?=
 <samba-technical@lists.samba.org>
Reply-To: =?UTF-8?Q?Pavel_Filipensk=c3=bd?= <pfilipensky@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi metze,

On 10/10/22 12:34, Stefan Metzmacher wrote:
> Hi Pavel,
>
>> Program received signal SIGABRT, Aborted.
>> __pthread_kill_implementation (threadid=<optimized out>, 
>> signo=signo@entry=6, no_tid=no_tid@entry=0) at pthread_kill.c:44
>> 44»·      return INTERNAL_SYSCALL_ERROR_P (ret) ? 
>> INTERNAL_SYSCALL_ERRNO (ret) : 0;
>> #0  __pthread_kill_implementation (threadid=<optimized out>, 
>> signo=signo@entry=6, no_tid=no_tid@entry=0) at pthread_kill.c:44
>> #1  0x00007fc04abb7cb3 in __pthread_kill_internal (signo=6, 
>> threadid=<optimized out>) at pthread_kill.c:78
>> #2  0x00007fc04ab679c6 in __GI_raise (sig=sig@entry=6) at 
>> ../sysdeps/posix/raise.c:26
>> #3  0x00007fc04ab517f4 in __GI_abort () at abort.c:79
>> #4  0x00007fc04b076bfa in dump_core () at 
>> ../../source3/lib/dumpcore.c:338
>> #5  0x00007fc04b088661 in smb_panic_s3 (why=0x7fc04b311928 "assert 
>> failed: share_mode_lock_key_refcount == 0") at 
>> ../../source3/lib/util.c:713
>> #6  0x00007fc04ad7c9a1 in smb_panic (why=0x7fc04b311928 "assert 
>> failed: share_mode_lock_key_refcount == 0") at 
>> ../../lib/util/fault.c:198
>> #7  0x00007fc04b1bfd7a in _share_mode_entry_prepare_lock 
>> (prepare_state=0x7fffa9900f60, id=..., servicepath=0x565379144e10 
>> "/home/pfilipen/workspace/projects/samba/2571/st/ad_member/share",
>>      smb_fname=0x565379162da0, old_write_time=0x7fffa9900eb0, 
>> fn=0x7fc04b2145d9 <open_ntcreate_lock_add_entry>, 
>> private_data=0x7fffa9900f60, location=0x7fc04b32c0f0 
>> "../../source3/smbd/open.c:4342")
>>      at ../../source3/locking/share_mode_lock.c:3010
>
> ...
>
>> How this should be fixed? Can we remove the assert and allow to grab 
>> the share_mode_lock_key_refcount
>>   again give the owner is the process itself?
>
> It seems the problem got introduced by this commit:
> https://git.samba.org/?p=samba.git;a=commitdiff;h=db743ab005bc7671d4fb0f5bea895c1097b707c5 
>
> "share_mode_lock: DEBUG/ASSERT recursion deadlock detection"
>
> Before open_file_ntcreate() just failed with 
> NT_STATUS_SHARING_VIOLATION if
> get_share_mode_lock() returned NULL... But in 4.14 copy_reg() also 
> used raw open() syscalls...
>
> So the specific problem comes from
> https://git.samba.org/?p=samba.git;a=commitdiff;h=5c18f074be92beea8357a93d64e7118376255ac0 
>
>     s3: VFS: crossrename. Use real dirfsp for SMB_VFS_RENAMEAT()
>
>     Finally fix the promise from the docs that this module is 
> stackable. Re-use copy_internals().
>
>     This is a horrible module that must be removed !
>
>     Signed-off-by: Jeremy Allison <jra@samba.org>
>     Reviewed-by: Noel Power <npower@samba.org>
>
> That commit came after db743ab005bc7671d4fb0f5bea895c1097b707c5
> and seems it was not tested at all (at least together with the recycle 
> module)
>
> I guess we can't use copy_internals() here.
>

Note: The problem is already visible without vfs_recycle. The 
vfs_crossrename itself no longer works.

So we have two requirements that do not go together really well:

1) make crossrename stackable using VFS ops

2) keep the share mode locking safe

The current implementation of share mode locking asserts that the 
process can never have more than one share mode lock simultaneously,
because the current code uses static singleton for the shared mode lock, 
thus cannot provide multiple lock nesting.


> Now that we use g_lock we may allow share_mode_do_locked_vfs_allowed() or
> share_mode_entry_prepare_lock_del() with 
> close_share_mode_lock_prepare() setting
> *keep_locked = true to lock multiple file_ids at the same time...
> But it will be a tricky change.
>
If such change is done, we can use stackable copy_reg() that takes two 
share mode locks.  You wrote: /I guess we can't use copy_internals() here. /

Maybe copy_reg can be improved or do you see any serious problem with it?


BTW, there are two issues with current copy_reg() / copy_internals() 
code, both related to the existence of the destination file.


1) copy_reg() bails out if the dst file does not exist

- but non existence of dst is no problem and th ecode mus go on

  97 »·······ret = SMB_VFS_NEXT_UNLINKAT(handle,
  98 »·······»·······»·······»······· dstfsp,
  99 »·······»·······»·······»······· dest,
100 »·······»·······»·······»······· 0);
101 »·······if (ret == -1) {

we need here:

101 »·······if (ret == -1 && errno != ENOENT) {


2) copy_internals() fails if the destination file exist

- this should pass if we do force rename, e.g: smbclient -c "src dst 
-f", but we fail no matter of -f option

197 NTSTATUS copy_internals(TALLOC_CTX *ctx,
...
232 »·······/* Disallow if dst file already exists. */
233 »·······if (VALID_STAT(smb_fname_dst->st)) {
234 »·······»·······status = NT_STATUS_OBJECT_NAME_COLLISION;
235 »·······»·······goto out;
236 »·······}


> metze
>
>
>
>
>
>
