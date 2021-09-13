Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id ADEFF409BFD
	for <lists+samba-technical@lfdr.de>; Mon, 13 Sep 2021 20:17:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=s3MZhVucQyG0qOHnDpPX73u/nWKYDQkznohefK2MfIg=; b=Ocj13/ISpaFGQIW7i7xUpwK/bk
	E7YMK6CP2FGY52DZhBtlMuA4uIH8b7YRO25id6WhhJmVjmG4fqFAE5ra0slJBLMHGk34CycG6/ewN
	95YIcnCJ8PCWtsRGoz+gTEI+FT9RjwIvVpVi6mLggaFj2wjtbhVND3HjO/NcQgLY4UofPJWUOQKvl
	lRvLPz0ah4+cGcVnfMo30ZPYq2l2vuiA5XWvzRtto37sgt90SJmQdnITLHsS2lz/urXYUhMo1Ho5a
	q53rp1zprOtgWAMEMposvFKSlRIzDgtqIIPLry4Ti7daw+icqS24xdohVWT4md0fWoBBjAlY5YNp/
	6qc3LihA==;
Received: from ip6-localhost ([::1]:47334 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1mPqWR-00EvHe-CR; Mon, 13 Sep 2021 18:17:39 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:11750) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1mPqWM-00EvHV-3g
 for samba-technical@lists.samba.org; Mon, 13 Sep 2021 18:17:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=s3MZhVucQyG0qOHnDpPX73u/nWKYDQkznohefK2MfIg=; b=gy8BaL2w9A1NAz2xYcAhffxKR7
 pcd2Jl5xjQ7Fqb5PnNcWRxaHDZiRmN3I3QHRmVuVKGpzSHu0Bj64/0Ka2jHLY5gZedUYUpw74MXhw
 Q1N35xzrNAtitUU6kgL8nwqzXXCFvDiomoq06gFPYMk7AmKX556HJCR7TSbJKP18r6kBSV0BShwkj
 ILj2zA4mU9BGpMwYiTRlJiWizpcMKbbdxmfWnUOWj3mQkZ8Z4ZwlfufNVuwSHzddo/AMirgZ0affq
 Ntn14XZL0CPnFTTwDLaj2I1YQsSGJXouIL3wyErATbxKP3K7NGZv5qzQVz67LzGA0McmHj61Ms+yB
 POZvQhV3dnRxxj83xsG+KcrYElK7neN55/EX4UoOW6+P/I3cg8vOHckMFiAFhJ3rX18ud7yj3LHZ8
 Se9ahvr0UZl5tug9VVyrxbczy/dDWwdCLkezZenjcKojXjlhweZmN0Nf0iDsHtGpnIhXzlfYflgwT
 W+otitTZZhCtNg8sJkJkcbp5;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1mPqWK-005zyi-2V; Mon, 13 Sep 2021 18:17:32 +0000
Date: Mon, 13 Sep 2021 11:17:29 -0700
To: Christof Schmitt <cs@samba.org>
Subject: Re: Linux kernel LOCK_MAND deprecation
Message-ID: <YT+VubLnEc/AXs8G@jeremy-acer>
References: <ac56564760f592b3a6fe477b8ce0e65a0759c988.camel@samba.org>
 <YT+NIpgJUq6GX54f@jeremy-acer> <20210913181145.GA13476@samba.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210913181145.GA13476@samba.org>
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
Cc: Jeff Layton <jlayton@samba.org>, vl@samba.org,
 samba-technical <samba-technical@lists.samba.org>, jra@samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Mon, Sep 13, 2021 at 11:11:45AM -0700, Christof Schmitt wrote:
>On Mon, Sep 13, 2021 at 10:40:50AM -0700, Jeremy Allison via samba-technic=
al wrote:
>> On Mon, Sep 13, 2021 at 10:02:01AM -0400, Jeff Layton via samba-technica=
l wrote:
>> > I recently proposed a patch to remove most of the support for
>> > flock(..., LOCK_MAND...) from the Linux kernel. The code in question h=
as
>> > been broken for well over a decade, such that trying to use LOCK_MAND
>> > flock locks is really just a no-op:
>> >
>> >    https://lore.kernel.org/linux-fsdevel/20210910201915.95170-1-jlayto=
n@kernel.org/
>> >
>> > Samba references that symbol in kernel_flock(). I started to take a lo=
ok
>> > at removing the code from samba, but the work kind of snowballed with
>> > all of the wrappers and indirection.
>> >
>> > Would anyone who is actively working on samba want to take a stab at
>> > removing kernel_flock()? It should be safe to just rip it out since it
>> > hasn't worked in ages.
>> >
>> > If it's not removed, then you may see kernel warnings on Linux when
>> > samba tries to set a LOCK_MAND lock, a'la:
>> >
>> >   pr_warn_once("Attempt to set a LOCK_MAND lock via flock(2). This sup=
port has been removed and the request ignored.\n");
>>
>> So the only code that sets it is in source3/smbd/open.c:
>>
>> 4048         if (!fsp->fsp_flags.is_pathref &&
>> 4049             fsp_get_io_fd(fsp) !=3D -1 &&
>> 4050             lp_kernel_share_modes(SNUM(conn)))
>> 4051         {
>> 4052                 int ret_flock;
>> 4053                 /*
>> 4054                  * Beware: streams implementing VFS modules may
>> 4055                  * implement streams in a way that fsp will have the
>> 4056                  * basefile open in the fsp fd, so lacking a distin=
ct
>> 4057                  * fd for the stream kernel_flock will apply on the
>> 4058                  * basefile which is wrong. The actual check is
>> 4059                  * deferred to the VFS module implementing the
>> 4060                  * kernel_flock call.
>> 4061                  */
>> 4062                 ret_flock =3D SMB_VFS_KERNEL_FLOCK(fsp, share_acces=
s, access_mask);
>> 4063                 if(ret_flock =3D=3D -1 ){
>> 4064 4065                         del_share_mode(lck, fsp);
>> 4066                         TALLOC_FREE(lck);
>> 4067                         fd_close(fsp);
>> 4068 4069                         return NT_STATUS_SHARING_VIOLATION;
>> 4070                 }
>> 4071 4072                 fsp->fsp_flags.kernel_share_modes_taken =3D tr=
ue;
>> 4073         }
>>
>> and removes it in source3/smbd/close.c:
>>
>> 454         if (fsp->fsp_flags.kernel_share_modes_taken) {
>>  455                 int ret_flock;
>>  456  457                 /*
>>  458                  * A file system sharemode could block the unlink;
>>  459                  * remove filesystem sharemodes first.
>>  460                  */
>>  461                 ret_flock =3D SMB_VFS_KERNEL_FLOCK(fsp, 0, 0);
>>  462                 if (ret_flock =3D=3D -1) {
>>  463                         DBG_INFO("removing kernel flock for %s fail=
ed: %s\n",
>>  464                                   fsp_str_dbg(fsp), strerror(errno)=
);
>>  465                 }
>>  466  467                 fsp->fsp_flags.kernel_share_modes_taken =3D fa=
lse;
>>  468         }
>>
>> (and a couple of other places that do the same thing on close).
>>
>> The rest is just boilerplace VFS glue that allows the VFS call:
>>
>>         int (*kernel_flock_fn)(struct vfs_handle_struct *handle, struct =
files_struct *fsp,
>>                                uint32_t share_access, uint32_t access_ma=
sk);
>>
>> to be caught by all VFS modules. It's not too hard to rip out
>> for 4.16.x (too late for a VFS change in 4.15.0).
>>
>> The only question I have, is this being used in IBM gpfs at all ?
>
>GPFS implements the Samba VFS call and implements sharemodes through a
>private API call to the file system (see vfs_gpfs_kernel_flock). From
>what i can see, the locking calls in kernel_flock are not needed, so
>that function can be removed. I would still advocate for keeping the VFS
>interface in Samba, so that we can still use the codepath in vfs_gpfs.

Oh that's easier then, we just make the vfs_default code return
ENOTSUP and remove kernel_flock(), the interface into the kernel system call
=66rom source3/lib/system.c.

Do you want to do the patch, or shall I ?

