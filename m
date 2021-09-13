Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 5766E409B21
	for <lists+samba-technical@lfdr.de>; Mon, 13 Sep 2021 19:42:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=MraCbyUSD62nJzKUI2WsD8fur9C2/m6S+CvVxaCFYd8=; b=uGdlE5LlBE3Ytqlgyl54msYxcO
	+kJoGSHyiM6Ib9LuatdPHFSqVFEsk0Cjd3pUFDuLuxBh2NUSpB/Cde5E7T98IKu6eMa0OSbpVnUUq
	ToK1n6fp5IzREWrir7RyywYTkhu4Uze98ywgaoJXqy4Z2SA6eCO/Qw7ugcgz1wIThS2jrveKp+5QH
	hIKT2LPmObg1UcTCQ3r5zvm4vsU8lOiAVb+3nw9Apju2qvkncrtPx1/e3r16WhFXaJArJ9VQZp1/h
	BCb26cJTXkgRep1InbNHWb/Q9pErIyraKxnDVYbYrRYlHYgWyUgNLwTHhQrF9IjBy/plZ3Elcjhnh
	OY5UZdKg==;
Received: from ip6-localhost ([::1]:45972 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1mPpwy-00Euel-LJ; Mon, 13 Sep 2021 17:41:00 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:57298) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1mPpwt-00Euec-A8
 for samba-technical@lists.samba.org; Mon, 13 Sep 2021 17:40:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=MraCbyUSD62nJzKUI2WsD8fur9C2/m6S+CvVxaCFYd8=; b=UamN5MXHfeicj9iKzXYv6vK5db
 oMDh85fOqFeILTHE41w6EP9cSDU3unahflespj1hXOZOqyvxIWDzFzWE+8Pm6iUTq8owk+m69t14F
 tY4BPsixG2D6vPUOk73MELFCC1AQ+/6Y2hhhqhSQJxrbLTzE6oRJMzpQlXK7Pmicthfa0j/Vmzljx
 UL0SErn86Prwo7Mj4gaoRQM0vNchATUNStg+ZL/jqpN5EJLmpndPEUCskVHSkyZSMqB/7413AzbXE
 OubDgA/F0KEZLHk/rbzMlK0wYDL8k6KzcZyiwBE/QUt6QL5MdQub1Fgzbed5TuNrPz+51Fe9Knm8x
 n9SP3XyRv5L0pSoxdSB+Hm+EL2gqb9d1AJ5Qoy8Ri9HWGHOtxj3g0hpCHS3zCpjqy/+6RHWMCxciB
 AXoshiFeAOyTDDKw1xGYTaJAxjSWQcUl+TNUbCNN4Y+rCzDOFpKK30CeKCEMqg57uv6Epu0QN+0m2
 20Z4EHs09JReH43mWD/rqEBn;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1mPpwr-005zkW-H1; Mon, 13 Sep 2021 17:40:53 +0000
Date: Mon, 13 Sep 2021 10:40:50 -0700
To: Jeff Layton <jlayton@samba.org>
Subject: Re: Linux kernel LOCK_MAND deprecation
Message-ID: <YT+NIpgJUq6GX54f@jeremy-acer>
References: <ac56564760f592b3a6fe477b8ce0e65a0759c988.camel@samba.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <ac56564760f592b3a6fe477b8ce0e65a0759c988.camel@samba.org>
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
Cc: vl@samba.org, samba-technical <samba-technical@lists.samba.org>,
 jra@samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Mon, Sep 13, 2021 at 10:02:01AM -0400, Jeff Layton via samba-technical wrote:
>I recently proposed a patch to remove most of the support for
>flock(..., LOCK_MAND...) from the Linux kernel. The code in question has
>been broken for well over a decade, such that trying to use LOCK_MAND
>flock locks is really just a no-op:
>
>    https://lore.kernel.org/linux-fsdevel/20210910201915.95170-1-jlayton@kernel.org/
>
>Samba references that symbol in kernel_flock(). I started to take a look
>at removing the code from samba, but the work kind of snowballed with
>all of the wrappers and indirection.
>
>Would anyone who is actively working on samba want to take a stab at
>removing kernel_flock()? It should be safe to just rip it out since it
>hasn't worked in ages.
>
>If it's not removed, then you may see kernel warnings on Linux when
>samba tries to set a LOCK_MAND lock, a'la:
>
>   pr_warn_once("Attempt to set a LOCK_MAND lock via flock(2). This support has been removed and the request ignored.\n");

So the only code that sets it is in source3/smbd/open.c:

4048         if (!fsp->fsp_flags.is_pathref &&
4049             fsp_get_io_fd(fsp) != -1 &&
4050             lp_kernel_share_modes(SNUM(conn)))
4051         {
4052                 int ret_flock;
4053                 /*
4054                  * Beware: streams implementing VFS modules may
4055                  * implement streams in a way that fsp will have the
4056                  * basefile open in the fsp fd, so lacking a distinct
4057                  * fd for the stream kernel_flock will apply on the
4058                  * basefile which is wrong. The actual check is
4059                  * deferred to the VFS module implementing the
4060                  * kernel_flock call.
4061                  */
4062                 ret_flock = SMB_VFS_KERNEL_FLOCK(fsp, share_access, access_mask);
4063                 if(ret_flock == -1 ){
4064 
4065                         del_share_mode(lck, fsp);
4066                         TALLOC_FREE(lck);
4067                         fd_close(fsp);
4068 
4069                         return NT_STATUS_SHARING_VIOLATION;
4070                 }
4071 
4072                 fsp->fsp_flags.kernel_share_modes_taken = true;
4073         }

and removes it in source3/smbd/close.c:

454         if (fsp->fsp_flags.kernel_share_modes_taken) {
  455                 int ret_flock;
  456 
  457                 /*
  458                  * A file system sharemode could block the unlink;
  459                  * remove filesystem sharemodes first.
  460                  */
  461                 ret_flock = SMB_VFS_KERNEL_FLOCK(fsp, 0, 0);
  462                 if (ret_flock == -1) {
  463                         DBG_INFO("removing kernel flock for %s failed: %s\n",
  464                                   fsp_str_dbg(fsp), strerror(errno));
  465                 }
  466 
  467                 fsp->fsp_flags.kernel_share_modes_taken = false;
  468         }

(and a couple of other places that do the same thing on close).

The rest is just boilerplace VFS glue that allows the VFS call:

         int (*kernel_flock_fn)(struct vfs_handle_struct *handle, struct files_struct *fsp,
                                uint32_t share_access, uint32_t access_mask);

to be caught by all VFS modules. It's not too hard to rip out
for 4.16.x (too late for a VFS change in 4.15.0).

The only question I have, is this being used in IBM gpfs at all ?

As far as I recall, that was the only real user of this functionality.

I'm CC:ing Volker and Ralph for their comments. If they agree it
can go I can whip up a patchset removing it reasonably quickly.

Volker, Ralph, thoughts ?

Jeremy.

