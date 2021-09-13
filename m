Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E2E5409D93
	for <lists+samba-technical@lfdr.de>; Mon, 13 Sep 2021 22:00:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=il16tpNDyuR2Wckos4F/gb6hlsq8cXN+rKPCP/FZXb4=; b=nucDtWl+tqT8jQ+D2Za5HDlG6N
	5A4wloIGoAbOhHZlboQtFzwwTB9iISt02DytIB4mIflGgzeHIts2N7xR8uxAepOmrd3Mntjk0/IeG
	1uN7OLQvqIpp5EJyUKRPIXD3+yLkxDEyNqLlJcXr5XlYI8rBDD3U/lLwnFMI3PbrzeBNlpZ0zmP/u
	R9//Gj0IS0lLkboTRsfBN3fejLoUKiBPjCkLbRo16m/L7w++5Q/zImnEnS7rI5sen4zTMYN7VI9y4
	ztMGOW8L9Da7U3Ju4/Nvh4fmxRRV9P5rKegexrx8uxQLyAVxHv+RAWHrCR+ALgFMskElBwnKKzsIV
	d6NWbbFQ==;
Received: from ip6-localhost ([::1]:49524 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1mPs6j-00EwLO-CT; Mon, 13 Sep 2021 19:59:13 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:40008) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1mPs6c-00EwLF-W9
 for samba-technical@lists.samba.org; Mon, 13 Sep 2021 19:59:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=il16tpNDyuR2Wckos4F/gb6hlsq8cXN+rKPCP/FZXb4=; b=FTF52ZSfPTqpDHiDv/cYk4HvD6
 XxJFmx07ANnloZZV0t+4+5AXbar2/usrOknhBgQeEYw3OX4DmVsXhYX0XsAn9h8w9JPMJGBWdc8Vs
 4Z9LuGldnUWv2sBn6z3PRJbwSQB701huT/x2THUIlcyuE5l5SggYfeF64jXcZZaRhjw2GMSjxcXZB
 uXQsGQzXr1JPZ7dLiwKz9pIyNjxQekaqG/LjewuucQZean5hD2qphOrUb8RJN94MC7w6q7+aT6yEP
 hzo/VIbZUfV6A4l3DeNh+u5jkPQHmXstWGb912TXId67zYDO6cEKVatGpe6GRgoVIXobH33wYWgqQ
 pbG14jowAXJxS9P5rTrFMuCaRXwZZaCLOd9SLnjQoIVlrcctESXyfcOM/Ep+05hWcMAHdCLazX9tm
 IBRWFgBngGHdAyALJO4cLe+DF84vgWlLdbkFZ+tiyhL48JRKNoLJ0bI9APp8Ul+Tacw5CP7oI7L3W
 AOYR7PgnDcYVQs9PtdAcvH+f;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1mPs6b-0060cX-H0; Mon, 13 Sep 2021 19:59:05 +0000
Date: Mon, 13 Sep 2021 12:59:02 -0700
To: Ralph Boehme <slow@samba.org>
Subject: Re: Linux kernel LOCK_MAND deprecation
Message-ID: <20210913195901.GA28442@samba.org>
References: <ac56564760f592b3a6fe477b8ce0e65a0759c988.camel@samba.org>
 <YT+NIpgJUq6GX54f@jeremy-acer> <20210913181145.GA13476@samba.org>
 <246ff815-8964-036a-7911-10d59c4e1ed6@samba.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <246ff815-8964-036a-7911-10d59c4e1ed6@samba.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
From: Christof Schmitt via samba-technical <samba-technical@lists.samba.org>
Reply-To: Christof Schmitt <cs@samba.org>
Cc: Jeff Layton <jlayton@samba.org>, vl@samba.org,
 samba-technical <samba-technical@lists.samba.org>,
 Jeremy Allison <jra@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Mon, Sep 13, 2021 at 09:08:38PM +0200, Ralph Boehme wrote:
> Am 13.09.21 um 20:11 schrieb Christof Schmitt via samba-technical:
> > On Mon, Sep 13, 2021 at 10:40:50AM -0700, Jeremy Allison via samba-technical wrote:
> > > On Mon, Sep 13, 2021 at 10:02:01AM -0400, Jeff Layton via samba-technical wrote:
> > > > I recently proposed a patch to remove most of the support for
> > > > flock(..., LOCK_MAND...) from the Linux kernel. The code in question has
> > > > been broken for well over a decade, such that trying to use LOCK_MAND
> > > > flock locks is really just a no-op:
> > > > 
> > > >     https://lore.kernel.org/linux-fsdevel/20210910201915.95170-1-jlayton@kernel.org/
> > > > 
> > > > Samba references that symbol in kernel_flock(). I started to take a look
> > > > at removing the code from samba, but the work kind of snowballed with
> > > > all of the wrappers and indirection.
> > > > 
> > > > Would anyone who is actively working on samba want to take a stab at
> > > > removing kernel_flock()? It should be safe to just rip it out since it
> > > > hasn't worked in ages.
> > > > 
> > > > If it's not removed, then you may see kernel warnings on Linux when
> > > > samba tries to set a LOCK_MAND lock, a'la:
> > > > 
> > > >    pr_warn_once("Attempt to set a LOCK_MAND lock via flock(2). This support has been removed and the request ignored.\n");
> > > 
> > > So the only code that sets it is in source3/smbd/open.c:
> > > 
> > > 4048         if (!fsp->fsp_flags.is_pathref &&
> > > 4049             fsp_get_io_fd(fsp) != -1 &&
> > > 4050             lp_kernel_share_modes(SNUM(conn)))
> > > 4051         {
> > > 4052                 int ret_flock;
> > > 4053                 /*
> > > 4054                  * Beware: streams implementing VFS modules may
> > > 4055                  * implement streams in a way that fsp will have the
> > > 4056                  * basefile open in the fsp fd, so lacking a distinct
> > > 4057                  * fd for the stream kernel_flock will apply on the
> > > 4058                  * basefile which is wrong. The actual check is
> > > 4059                  * deferred to the VFS module implementing the
> > > 4060                  * kernel_flock call.
> > > 4061                  */
> > > 4062                 ret_flock = SMB_VFS_KERNEL_FLOCK(fsp, share_access, access_mask);
> > > 4063                 if(ret_flock == -1 ){
> > > 4064 4065                         del_share_mode(lck, fsp);
> > > 4066                         TALLOC_FREE(lck);
> > > 4067                         fd_close(fsp);
> > > 4068 4069                         return NT_STATUS_SHARING_VIOLATION;
> > > 4070                 }
> > > 4071 4072                 fsp->fsp_flags.kernel_share_modes_taken = true;
> > > 4073         }
> > > 
> > > and removes it in source3/smbd/close.c:
> > > 
> > > 454         if (fsp->fsp_flags.kernel_share_modes_taken) {
> > >   455                 int ret_flock;
> > >   456  457                 /*
> > >   458                  * A file system sharemode could block the unlink;
> > >   459                  * remove filesystem sharemodes first.
> > >   460                  */
> > >   461                 ret_flock = SMB_VFS_KERNEL_FLOCK(fsp, 0, 0);
> > >   462                 if (ret_flock == -1) {
> > >   463                         DBG_INFO("removing kernel flock for %s failed: %s\n",
> > >   464                                   fsp_str_dbg(fsp), strerror(errno));
> > >   465                 }
> > >   466  467                 fsp->fsp_flags.kernel_share_modes_taken = false;
> > >   468         }
> > > 
> > > (and a couple of other places that do the same thing on close).
> > > 
> > > The rest is just boilerplace VFS glue that allows the VFS call:
> > > 
> > >          int (*kernel_flock_fn)(struct vfs_handle_struct *handle, struct files_struct *fsp,
> > >                                 uint32_t share_access, uint32_t access_mask);
> > > 
> > > to be caught by all VFS modules. It's not too hard to rip out
> > > for 4.16.x (too late for a VFS change in 4.15.0).
> > > 
> > > The only question I have, is this being used in IBM gpfs at all ?
> > 
> > GPFS implements the Samba VFS call and implements sharemodes through a
> > private API call to the file system (see vfs_gpfs_kernel_flock).
> 
> Are you 100% sure? I was also looking at this and wanted to talk about this
> with the stakeholders.
> 
> The reason I'm worried is that in vfs_gpfs_kernel_flock() we both call
> kernel_flock() kernel functionality and call set_gpfs_sharemode() GPFS API.
> 
> If the GFPS implementation relies on LOCK_MAND being set in fl->fl_type by
> the kernel function then these changes would break GPFS sharemodes.

I am 90% sure that we only need the API call for Samba and GPFS, not
LOCK_MAND. I think the LOCK_MAND part was targeted towards
interoperatibility with NFS servers which might implement NFS
delegations, but that never was pushed to the end. A quick test should
confirm the uncertain parts.

Christof

