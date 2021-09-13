Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 2620B409BEB
	for <lists+samba-technical@lfdr.de>; Mon, 13 Sep 2021 20:12:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=gugq0cBQ8oNFtqe8RzNAp65/h78S231Wo1oUlMHtAVo=; b=wcHsq9nedi6MEaaxM8WlBqw1JX
	tI+JkgA5mlir+PMnCBpr/JKRG6GBbPLiOl3f/dehKmn8uS/nW7dId7UCod4RwInlQ8Pov9KPC675T
	1dI1WoUn2ja9SkI1Q42Eha30p3noxHAvimO3vSNEb0e3IF78AI1NcWgSieDvtlEft0fgaZ9qmMzza
	P+jdRQ3pAOdWuWiC4//l/2pShEmb2kiblLE6QzlerZYTbbYAxLJjBVLRoGf1VhhqHYPpFrSNFMFT/
	TdNKXvHCvy5/5cnvhXWl1IJEklXgYfuBAEnu/Fjt/nq7CYK8K9kfoLHPtXD3Xcq5b+UtWmlxfOLo0
	xwtAaODQ==;
Received: from ip6-localhost ([::1]:46654 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1mPqQu-00Euyt-G8; Mon, 13 Sep 2021 18:11:56 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:10240) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1mPqQp-00Euyk-E7
 for samba-technical@lists.samba.org; Mon, 13 Sep 2021 18:11:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=gugq0cBQ8oNFtqe8RzNAp65/h78S231Wo1oUlMHtAVo=; b=24/WTyXaRutZuombF1Wz0ZlscF
 l1SIoa8J7sKSkjR5j6dOgezBTFSmj7u1oDcflx48Y+1+Ae21ph5bKLAZxBK1a06MIiW/eXt9kJeUC
 ZvlbIG8hPVGS0RWKY2uIy2t3pyz7CqyqeOkkUV+LM7mHCLdAeQzWj1l7ljKBuqSXNL5luoTLH6yHo
 buTNCLax2LMr88pjrys0l0gGGCao9DDUD5vjjZjkJzKWjvzJTAhUknNvNXIrIjJr59Z/P/9scd4/S
 mjG8opYXoUbVE9sapnMn2GwpoSmNUj/hVyY5Tl6+OtDv/xe6/oq0eEptrpudWckrhQFPH5qPGcEBg
 H7+4+3gtqU4+gUCH/rXEU43/gB72N+SE1Qbvvicj9ZLcAsVpk0ErNKKjUvqWbyKD9SPS2rr/hEz5C
 Dwaf4yCjr1kU4Td5K2Wz5ugM1NcpM5BowaYisn2XwJ8JKBzUeU3LhmoZsGmr8j72EigO3GGfcyBCy
 goh/IXW2WibcuUpSuQqddkSY;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1mPqQn-005zvG-Qk; Mon, 13 Sep 2021 18:11:50 +0000
Date: Mon, 13 Sep 2021 11:11:45 -0700
To: Jeremy Allison <jra@samba.org>
Subject: Re: Linux kernel LOCK_MAND deprecation
Message-ID: <20210913181145.GA13476@samba.org>
References: <ac56564760f592b3a6fe477b8ce0e65a0759c988.camel@samba.org>
 <YT+NIpgJUq6GX54f@jeremy-acer>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YT+NIpgJUq6GX54f@jeremy-acer>
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
 samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Mon, Sep 13, 2021 at 10:40:50AM -0700, Jeremy Allison via samba-technical wrote:
> On Mon, Sep 13, 2021 at 10:02:01AM -0400, Jeff Layton via samba-technical wrote:
> > I recently proposed a patch to remove most of the support for
> > flock(..., LOCK_MAND...) from the Linux kernel. The code in question has
> > been broken for well over a decade, such that trying to use LOCK_MAND
> > flock locks is really just a no-op:
> > 
> >    https://lore.kernel.org/linux-fsdevel/20210910201915.95170-1-jlayton@kernel.org/
> > 
> > Samba references that symbol in kernel_flock(). I started to take a look
> > at removing the code from samba, but the work kind of snowballed with
> > all of the wrappers and indirection.
> > 
> > Would anyone who is actively working on samba want to take a stab at
> > removing kernel_flock()? It should be safe to just rip it out since it
> > hasn't worked in ages.
> > 
> > If it's not removed, then you may see kernel warnings on Linux when
> > samba tries to set a LOCK_MAND lock, a'la:
> > 
> >   pr_warn_once("Attempt to set a LOCK_MAND lock via flock(2). This support has been removed and the request ignored.\n");
> 
> So the only code that sets it is in source3/smbd/open.c:
> 
> 4048         if (!fsp->fsp_flags.is_pathref &&
> 4049             fsp_get_io_fd(fsp) != -1 &&
> 4050             lp_kernel_share_modes(SNUM(conn)))
> 4051         {
> 4052                 int ret_flock;
> 4053                 /*
> 4054                  * Beware: streams implementing VFS modules may
> 4055                  * implement streams in a way that fsp will have the
> 4056                  * basefile open in the fsp fd, so lacking a distinct
> 4057                  * fd for the stream kernel_flock will apply on the
> 4058                  * basefile which is wrong. The actual check is
> 4059                  * deferred to the VFS module implementing the
> 4060                  * kernel_flock call.
> 4061                  */
> 4062                 ret_flock = SMB_VFS_KERNEL_FLOCK(fsp, share_access, access_mask);
> 4063                 if(ret_flock == -1 ){
> 4064 4065                         del_share_mode(lck, fsp);
> 4066                         TALLOC_FREE(lck);
> 4067                         fd_close(fsp);
> 4068 4069                         return NT_STATUS_SHARING_VIOLATION;
> 4070                 }
> 4071 4072                 fsp->fsp_flags.kernel_share_modes_taken = true;
> 4073         }
> 
> and removes it in source3/smbd/close.c:
> 
> 454         if (fsp->fsp_flags.kernel_share_modes_taken) {
>  455                 int ret_flock;
>  456  457                 /*
>  458                  * A file system sharemode could block the unlink;
>  459                  * remove filesystem sharemodes first.
>  460                  */
>  461                 ret_flock = SMB_VFS_KERNEL_FLOCK(fsp, 0, 0);
>  462                 if (ret_flock == -1) {
>  463                         DBG_INFO("removing kernel flock for %s failed: %s\n",
>  464                                   fsp_str_dbg(fsp), strerror(errno));
>  465                 }
>  466  467                 fsp->fsp_flags.kernel_share_modes_taken = false;
>  468         }
> 
> (and a couple of other places that do the same thing on close).
> 
> The rest is just boilerplace VFS glue that allows the VFS call:
> 
>         int (*kernel_flock_fn)(struct vfs_handle_struct *handle, struct files_struct *fsp,
>                                uint32_t share_access, uint32_t access_mask);
> 
> to be caught by all VFS modules. It's not too hard to rip out
> for 4.16.x (too late for a VFS change in 4.15.0).
> 
> The only question I have, is this being used in IBM gpfs at all ?

GPFS implements the Samba VFS call and implements sharemodes through a
private API call to the file system (see vfs_gpfs_kernel_flock). From
what i can see, the locking calls in kernel_flock are not needed, so
that function can be removed. I would still advocate for keeping the VFS
interface in Samba, so that we can still use the codepath in vfs_gpfs.

Christof

