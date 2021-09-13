Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E5FD409E30
	for <lists+samba-technical@lfdr.de>; Mon, 13 Sep 2021 22:32:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=+yGX4asq/u5G3r2HeZbzgh2AKDFaXBI5g/gNr8hcfsg=; b=DRP2BIaY3DG5wiypBicy0GmvMk
	CsU3QM/DkiMz5Su//OJIvWKsV98WuUAMfQi6EXypwuzDvYMSSb+mB0Iq8ipiYM2/Vqehg3IafFgp9
	K0zmkutaDBqndDIrDWMAqKj6hhAF74rpMlGwTXL0CafWJomcCeENGHicVBKXhAFOaI0lWEDFbwrn5
	vrA8jfoA4zmxPx5q70d4X872jLuA3PYt1+wEzDs6mpjHV6B/PubT/ww1/aR+k0F2kOgRr0Fp98ekE
	3ie0yf0rqehX/ujakxRt+2rCsqn1+Finb5gTZjCgRFMSSyGAvNcA8FrOwp/bl3o2P51omvTPEbihw
	pB/YpziA==;
Received: from ip6-localhost ([::1]:50212 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1mPscp-00Ewfh-BX; Mon, 13 Sep 2021 20:32:23 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:48954) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1mPscj-00EwfY-Np
 for samba-technical@lists.samba.org; Mon, 13 Sep 2021 20:32:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Cc:To:From:Message-ID;
 bh=+yGX4asq/u5G3r2HeZbzgh2AKDFaXBI5g/gNr8hcfsg=; b=oHY6RCODiGUMCYIiQ0IjQCFFC2
 9ff4Xp1TbBbd9BShVb+rBmKLX/TQHh+6C9VmV3XEqu30/mlPXNBweIRstm9cYAiiySnU3OCElaVa6
 9iP3T/3ne9BTCb/BknaKl1mctUZ+RBXXVeCAKBhPGMWLonGLWo8IYiyqDefiZeBnDiP8zlSBuFMI7
 4Fo5GrccPum22M0NXsWtx05F9q0GEk7PQ1VbgV4tuv1wim+T5JkhKLiAQZt9J6kraL3pCFW6UhXh3
 wyeYDKSbHoLjlDxqKjyX7oJj3K15goeYBp4kk4DQREecyvJf3Uzm4fRkHVSsw9ukKWfUvhGI/zswk
 2SEJUzQEkz4PpP5KCHrSr14G+lkMc64fa3vFKdShmGrjlbWX4PuthK7ECWYXLPnb7TKvyjoW/kbWr
 ZbBS8UKslaDs63UsczrpwP6+Ni+6IrlHaNLGIQUycdvBkpi5rzHwLdKWO1HgaBi5tUbzuFLUJ9jvP
 ienELCPzgKFqH4Y7iqpr8bcs;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1mPsci-0060nR-6v; Mon, 13 Sep 2021 20:32:16 +0000
Message-ID: <16e822776813310d1635efa74be2455d329308a6.camel@samba.org>
Subject: Re: Linux kernel LOCK_MAND deprecation
To: Christof Schmitt <cs@samba.org>, Ralph Boehme <slow@samba.org>
Date: Mon, 13 Sep 2021 16:32:14 -0400
In-Reply-To: <20210913195901.GA28442@samba.org>
References: <ac56564760f592b3a6fe477b8ce0e65a0759c988.camel@samba.org>
 <YT+NIpgJUq6GX54f@jeremy-acer> <20210913181145.GA13476@samba.org>
 <246ff815-8964-036a-7911-10d59c4e1ed6@samba.org>
 <20210913195901.GA28442@samba.org>
Content-Type: text/plain; charset="ISO-8859-15"
User-Agent: Evolution 3.40.4 (3.40.4-1.fc34) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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
From: Jeff Layton via samba-technical <samba-technical@lists.samba.org>
Reply-To: Jeff Layton <jlayton@samba.org>
Cc: vl@samba.org, samba-technical <samba-technical@lists.samba.org>,
 Jeremy Allison <jra@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Mon, 2021-09-13 at 12:59 -0700, Christof Schmitt wrote:
> On Mon, Sep 13, 2021 at 09:08:38PM +0200, Ralph Boehme wrote:
> > Am 13.09.21 um 20:11 schrieb Christof Schmitt via samba-technical:
> > > On Mon, Sep 13, 2021 at 10:40:50AM -0700, Jeremy Allison via samba-technical wrote:
> > > > On Mon, Sep 13, 2021 at 10:02:01AM -0400, Jeff Layton via samba-technical wrote:
> > > > > I recently proposed a patch to remove most of the support for
> > > > > flock(..., LOCK_MAND...) from the Linux kernel. The code in question has
> > > > > been broken for well over a decade, such that trying to use LOCK_MAND
> > > > > flock locks is really just a no-op:
> > > > > 
> > > > >     https://lore.kernel.org/linux-fsdevel/20210910201915.95170-1-jlayton@kernel.org/
> > > > > 
> > > > > Samba references that symbol in kernel_flock(). I started to take a look
> > > > > at removing the code from samba, but the work kind of snowballed with
> > > > > all of the wrappers and indirection.
> > > > > 
> > > > > Would anyone who is actively working on samba want to take a stab at
> > > > > removing kernel_flock()? It should be safe to just rip it out since it
> > > > > hasn't worked in ages.
> > > > > 
> > > > > If it's not removed, then you may see kernel warnings on Linux when
> > > > > samba tries to set a LOCK_MAND lock, a'la:
> > > > > 
> > > > >    pr_warn_once("Attempt to set a LOCK_MAND lock via flock(2). This support has been removed and the request ignored.\n");
> > > > 
> > > > So the only code that sets it is in source3/smbd/open.c:
> > > > 
> > > > 4048         if (!fsp->fsp_flags.is_pathref &&
> > > > 4049             fsp_get_io_fd(fsp) != -1 &&
> > > > 4050             lp_kernel_share_modes(SNUM(conn)))
> > > > 4051         {
> > > > 4052                 int ret_flock;
> > > > 4053                 /*
> > > > 4054                  * Beware: streams implementing VFS modules may
> > > > 4055                  * implement streams in a way that fsp will have the
> > > > 4056                  * basefile open in the fsp fd, so lacking a distinct
> > > > 4057                  * fd for the stream kernel_flock will apply on the
> > > > 4058                  * basefile which is wrong. The actual check is
> > > > 4059                  * deferred to the VFS module implementing the
> > > > 4060                  * kernel_flock call.
> > > > 4061                  */
> > > > 4062                 ret_flock = SMB_VFS_KERNEL_FLOCK(fsp, share_access, access_mask);
> > > > 4063                 if(ret_flock == -1 ){
> > > > 4064 4065                         del_share_mode(lck, fsp);
> > > > 4066                         TALLOC_FREE(lck);
> > > > 4067                         fd_close(fsp);
> > > > 4068 4069                         return NT_STATUS_SHARING_VIOLATION;
> > > > 4070                 }
> > > > 4071 4072                 fsp->fsp_flags.kernel_share_modes_taken = true;
> > > > 4073         }
> > > > 
> > > > and removes it in source3/smbd/close.c:
> > > > 
> > > > 454         if (fsp->fsp_flags.kernel_share_modes_taken) {
> > > >   455                 int ret_flock;
> > > >   456  457                 /*
> > > >   458                  * A file system sharemode could block the unlink;
> > > >   459                  * remove filesystem sharemodes first.
> > > >   460                  */
> > > >   461                 ret_flock = SMB_VFS_KERNEL_FLOCK(fsp, 0, 0);
> > > >   462                 if (ret_flock == -1) {
> > > >   463                         DBG_INFO("removing kernel flock for %s failed: %s\n",
> > > >   464                                   fsp_str_dbg(fsp), strerror(errno));
> > > >   465                 }
> > > >   466  467                 fsp->fsp_flags.kernel_share_modes_taken = false;
> > > >   468         }
> > > > 
> > > > (and a couple of other places that do the same thing on close).
> > > > 
> > > > The rest is just boilerplace VFS glue that allows the VFS call:
> > > > 
> > > >          int (*kernel_flock_fn)(struct vfs_handle_struct *handle, struct files_struct *fsp,
> > > >                                 uint32_t share_access, uint32_t access_mask);
> > > > 
> > > > to be caught by all VFS modules. It's not too hard to rip out
> > > > for 4.16.x (too late for a VFS change in 4.15.0).
> > > > 
> > > > The only question I have, is this being used in IBM gpfs at all ?
> > > 
> > > GPFS implements the Samba VFS call and implements sharemodes through a
> > > private API call to the file system (see vfs_gpfs_kernel_flock).
> > 
> > Are you 100% sure? I was also looking at this and wanted to talk about this
> > with the stakeholders.
> > 
> > The reason I'm worried is that in vfs_gpfs_kernel_flock() we both call
> > kernel_flock() kernel functionality and call set_gpfs_sharemode() GPFS API.
> > 
> > If the GFPS implementation relies on LOCK_MAND being set in fl->fl_type by
> > the kernel function then these changes would break GPFS sharemodes.

GPFS is the part I'm most unsure of. vfs_gpfs_kernel_flock does this:

        kernel_flock(fsp_get_io_fd(fsp), share_access, access_mask);

        ret = set_gpfs_sharemode(fsp, access_mask, share_access);

Isn't the GPFS sharemode handling done in set_gpfs_sharemode? Does that
somehow rely on kernel_flock doing something? If so and you can provide
details there, we may be able to do something to help ease the
transition for IBM.

> 
> I am 90% sure that we only need the API call for Samba and GPFS, not
> LOCK_MAND. I think the LOCK_MAND part was targeted towards
> interoperatibility with NFS servers which might implement NFS
> delegations, but that never was pushed to the end. A quick test should
> confirm the uncertain parts.
> 

Bruce did some archaeology and this was his finding:

--------------------------------8<-------------------------------------
Looking back at the kernel...  LOCK_MAND was introduced in Linux
2.4.0-test9pre6, and it was only checked in nfsd read and write code,
and only only on exports that had an "msnfs" export option set.

So it was a mandatory lock that only worked against NFS readers and
writers, and only if the admin knew to set this export option.

And, oh, look, I'd forgotten about this, but apparently in 2011 I
noticed that the msnfs option was totally undocumented and ripped it
out, in 9ce137eee4fe "nfsd: don't support msnfs export option".
--------------------------------8<-------------------------------------

So, the kernel support for all in-tree filesystems has been a no-op
since at least 2011.

Going forward, the kernel will still accept LOCK_MAND requests, but it
just returns 0 to the request without doing anything, and will throw a
one-time-per-boot warning that it ignored the request.

Thanks for helping clean this up!
-- 
Jeff Layton <jlayton@samba.org>


