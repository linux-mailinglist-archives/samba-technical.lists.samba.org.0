Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E8A1F5FBB52
	for <lists+samba-technical@lfdr.de>; Tue, 11 Oct 2022 21:25:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=KrpFP+Mj9veJMXenv81yLWjdF1PRk+jMuB3GRbI7O5g=; b=u/ESXjAKIcBo84Cic++QT8qqnk
	5IRBF45Pacx300tROksBVv07MylqF7/zIYHL8pc/3CbWVtIBRqBalIrfDqEq+foKy2xO3OSe+lXaN
	dDJwimjSN7Lttd6PEj2C373ksc8lykSkRKeSNJbBzTX+72J24O2Ppwk2ogBqK7HvwTysh04ZsNQ6o
	iAekkNDZs+UlvN7TzqMB2wri0H5yJWmrE6GphZad98+xLObZOtqHHC9911Tby8REinWTkJ25aa7Dw
	H6dSgSd/aGrtVAZeuGu8nmo2jnYUvyJtGAVrM5P2JZivJ2Y2dpV6IoJF4dS9AJ7PQ5zMX7h97vgeA
	n1WZO9aA==;
Received: from ip6-localhost ([::1]:38604 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1oiKrV-001Kih-QM; Tue, 11 Oct 2022 19:24:21 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:59158) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1oiKrR-001KiY-DL
 for samba-technical@lists.samba.org; Tue, 11 Oct 2022 19:24:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:Cc:To:Date:Message-ID;
 bh=KrpFP+Mj9veJMXenv81yLWjdF1PRk+jMuB3GRbI7O5g=; b=TFk+osghjm0Yo/Xb8xwUQufVww
 B+vPuom9dRlQkybIqtneWrFo0wI5gkn781Iu7F0/Vo31z8PZl7H4zpf4jefu6hfeWs87PxjgbUzhS
 uS8Shnp3cUnCfHpgdP0LC1nTyJ31CzIpbLiYnq289DxuU3Od0RLz54Nh07TTze+kunEse1XVbqtFW
 PIXYSiV28+UKgxa7vyATept3LWL5hduqBm6y3rvabIJmD9fUbjOyAL69ab9JQ1A7dHivzWotNg13Y
 aRFeyq3+ZIlzkF0GOmlpLRh1cHu+1yV3BWRvVLCjCAVtEsg+F59vL3S0OvqHJ5apvtaokD0ATr9Px
 qXyYmSvJTRpfU4e1neYd8MP/o9GvQd62QdmMsxS0dIZ2q/mjOkkQc5QA/DTE4y782cglo3gp0dOpl
 aCZmLHzQUNuNZemyfmpaoLTSw0vUxzTvKpVHVTwWgDXrg0Fh3KJO3WwNrI2xOumjcfrly809JNij5
 Oa/QpuS2Ob8UkMOSAn15fmmB;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1oiKrP-003rpt-Tw; Tue, 11 Oct 2022 19:24:16 +0000
Message-ID: <824ce341-598e-927d-88de-5d8b1005db0d@samba.org>
Date: Tue, 11 Oct 2022 21:24:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: vfs_crossrename not working in samba-4.15.*
Content-Language: en-US
To: Jeremy Allison <jra@samba.org>, Stefan Metzmacher <metze@samba.org>
References: <8fbdc4c2-09db-3032-38c4-1608aae5e7f9@samba.org>
 <46bd690d-35c0-0d2c-3101-b90d65b0b35e@samba.org>
 <Y0RoUwniuuHfiJkS@jeremy-acer>
In-Reply-To: <Y0RoUwniuuHfiJkS@jeremy-acer>
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
From: =?utf-8?q?Pavel_Filipensk=C3=BD_via_samba-technical?=
 <samba-technical@lists.samba.org>
Reply-To: =?UTF-8?Q?Pavel_Filipensk=c3=bd?= <pfilipensky@samba.org>
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>


On 10/10/22 20:45, Jeremy Allison wrote:
> On Mon, Oct 10, 2022 at 12:34:24PM +0200, Stefan Metzmacher via 
> samba-technical wrote:
>> Hi Pavel,
>>
>>> Program received signal SIGABRT, Aborted.
>>> __pthread_kill_implementation (threadid=<optimized out>, 
>>> signo=signo@entry=6, no_tid=no_tid@entry=0) at pthread_kill.c:44
>>> 44»·      return INTERNAL_SYSCALL_ERROR_P (ret) ? 
>>> INTERNAL_SYSCALL_ERRNO (ret) : 0;
>>> #0  __pthread_kill_implementation (threadid=<optimized out>, 
>>> signo=signo@entry=6, no_tid=no_tid@entry=0) at pthread_kill.c:44
>>> #1  0x00007fc04abb7cb3 in __pthread_kill_internal (signo=6, 
>>> threadid=<optimized out>) at pthread_kill.c:78
>>> #2  0x00007fc04ab679c6 in __GI_raise (sig=sig@entry=6) at 
>>> ../sysdeps/posix/raise.c:26
>>> #3  0x00007fc04ab517f4 in __GI_abort () at abort.c:79
>>> #4  0x00007fc04b076bfa in dump_core () at 
>>> ../../source3/lib/dumpcore.c:338
>>> #5  0x00007fc04b088661 in smb_panic_s3 (why=0x7fc04b311928 "assert 
>>> failed: share_mode_lock_key_refcount == 0") at 
>>> ../../source3/lib/util.c:713
>>> #6  0x00007fc04ad7c9a1 in smb_panic (why=0x7fc04b311928 "assert 
>>> failed: share_mode_lock_key_refcount == 0") at 
>>> ../../lib/util/fault.c:198
>>> #7  0x00007fc04b1bfd7a in _share_mode_entry_prepare_lock 
>>> (prepare_state=0x7fffa9900f60, id=..., servicepath=0x565379144e10 
>>> "/home/pfilipen/workspace/projects/samba/2571/st/ad_member/share",
>>>     smb_fname=0x565379162da0, old_write_time=0x7fffa9900eb0, 
>>> fn=0x7fc04b2145d9 <open_ntcreate_lock_add_entry>, 
>>> private_data=0x7fffa9900f60, location=0x7fc04b32c0f0 
>>> "../../source3/smbd/open.c:4342")
>>>     at ../../source3/locking/share_mode_lock.c:3010
>>
>> ...
>>
>>> How this should be fixed? Can we remove the assert and allow to grab 
>>> the share_mode_lock_key_refcount
>>>  again give the owner is the process itself?
>>
>> It seems the problem got introduced by this commit:
>> https://git.samba.org/?p=samba.git;a=commitdiff;h=db743ab005bc7671d4fb0f5bea895c1097b707c5 
>>
>> "share_mode_lock: DEBUG/ASSERT recursion deadlock detection"
>>
>> Before open_file_ntcreate() just failed with 
>> NT_STATUS_SHARING_VIOLATION if
>> get_share_mode_lock() returned NULL... But in 4.14 copy_reg() also 
>> used raw open() syscalls...
>>
>> So the specific problem comes from
>> https://git.samba.org/?p=samba.git;a=commitdiff;h=5c18f074be92beea8357a93d64e7118376255ac0 
>>
>>    s3: VFS: crossrename. Use real dirfsp for SMB_VFS_RENAMEAT()
>>
>>    Finally fix the promise from the docs that this module is 
>> stackable. Re-use copy_internals().
>>
>>    This is a horrible module that must be removed !
>>
>>    Signed-off-by: Jeremy Allison <jra@samba.org>
>>    Reviewed-by: Noel Power <npower@samba.org>
>>
>> That commit came after db743ab005bc7671d4fb0f5bea895c1097b707c5
>> and seems it was not tested at all (at least together with the 
>> recycle module)
>
> As I recall, this was in the middle of the move to fixing our symlink
> problem with dirfsp's - so I'm not going to apologise for the lack
> of tests on such a rarely used module :-).
>
> Better to fix up later (as we're doing now).
>
>> I guess we can't use copy_internals() here.
>
> copy_internals is horrible and I'd like to see it removed to
> be honest.
>
>> Now that we use g_lock we may allow 
>> share_mode_do_locked_vfs_allowed() or
>> share_mode_entry_prepare_lock_del() with 
>> close_share_mode_lock_prepare() setting
>> *keep_locked = true to lock multiple file_ids at the same time...
>> But it will be a tricky change.
>
> A. Modest. Proposal. :-). Needing crossrename is a sign of
> administrator failure to set up the share directories correctly.
>
> Can we just delete this module ?


I am checking with the Red Hat support and with the customer if the 
module can be removed and if RH support strategy allows that.


>
> Pavel, who is using this and for what purpose ?


The crossrename VFS module is used together with the recycle module. I 
guess that customer prefers to have the recycle bin in a separate 
filesystem.


