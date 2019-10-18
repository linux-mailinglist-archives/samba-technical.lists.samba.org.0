Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 00119DD552
	for <lists+samba-technical@lfdr.de>; Sat, 19 Oct 2019 01:27:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=WG1FAPm3UfFpB28tDOlCyxssLqpiLRDDQWn9I165yYw=; b=k0quECDpU8unjWFFRPnayLoERt
	AZCxEKJhE8iJ+7an4pRZcR32VCJbDmlH2fAfdcmTC/wOMurzrK0pw8FW5wxsJiqM0+5EbW+l+JNFA
	gldqdKnSXlLKnbf7Ka8sCwfYZ9ii9n6On9BjoOJKD6DelyhF6AjJ6j34nyPzRY14z4BKn4mfRItxx
	MfWy2PWDrFKhXtyxaGk/2egf1u9uhYGr7vVS0yAgVv5aZMWg/ezAvsToZ54XTNxisSafwifCUuh4L
	tbHmDgbuqa9pc3Nv063o3rp1fht/dEAVCVuTPwyK6oNxamEHrpnWkcPYYsRa3MXXaGCefoYPGs5sU
	xM/u1JDA==;
Received: from localhost ([::1]:23578 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iLbe3-000UKM-JN; Fri, 18 Oct 2019 23:26:55 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:62520) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iLbdz-000UKF-4i
 for samba-technical@lists.samba.org; Fri, 18 Oct 2019 23:26:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=WG1FAPm3UfFpB28tDOlCyxssLqpiLRDDQWn9I165yYw=; b=M9m+qTVTlB8nTBP93+nTmLGunR
 /FZUWTX6UqvvbYWa1ni9kt9pVQoiew+Wqz4egVMPPZhFeWCY70p906DxLb7ZoWPX17PvwW1qtI+FD
 K3EjvuvoKJsoYVm9NOgW+JPb0JkMrEeM37Qyomdv8csB1WGgUqP5FIO9NKdjO3Ubu4YwNV5Vnyclk
 6Zu0AD8velv9h4XFWICT1qZNXUWxS4HQ+OtvHFoRJ3668B1QMlYwA+AyUShOd/6FAHFjPihPO2VTL
 2Xjst8UV3LKxcOXwL/AowIcC/KzZkoalNVwwfKqoRK02wabn9hJvCCcam029hQji9RikesB/hp393
 WNUrovQHWvzVIj2LQ4mQZ/ESI2kd2e1dFQLQLl5MEU5Za6E2aSwd7p5eoR0vuk/O2qiPUd7J3XKzx
 vXp3IDIT6G0ttsOK0LNcpCrYkQ7WuVzioCxRuxNKN4Yzggj72QkCZaNpCryYgyJHZzs1TmLZ0z34e
 qiCDaYKNsUxehra85CJsPyK0;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iLbdy-0002CB-19; Fri, 18 Oct 2019 23:26:50 +0000
Date: Fri, 18 Oct 2019 16:26:47 -0700
To: Stefan Metzmacher <metze@samba.org>
Subject: Re: RFC impersonation and substitution
Message-ID: <20191018232647.GA49942@jra4>
References: <a7aabda6-2463-7777-9132-a3a94edfa3a1@samba.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a7aabda6-2463-7777-9132-a3a94edfa3a1@samba.org>
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
From: Jeremy Allison via samba-technical <samba-technical@lists.samba.org>
Reply-To: Jeremy Allison <jra@samba.org>
Cc: Samba Technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wed, Oct 16, 2019 at 05:47:19PM +0200, Stefan Metzmacher via samba-technical wrote:
> Hi,
> 
> some of you already saw my SDC presentation:
> https://www.samba.org/~metze/presentations/2019/SDC/
> 
> Now I want to start the discussion regarding our impersonation model
> here.
> 
> We try to get more things (including path based calls) in the smb_vfs
> layer async.
> 
> I started with tevent_wrapper based impersonation, but that got reverted
> as it got too complex, more details can be found here:
> https://lists.samba.org/archive/samba-technical/2018-December/131731.html
> 
> Currently our impersonation happens per incoming SMB request.
> We change 3 things:
> A) the unix token (uid, gid, groups)
> B) the global state in order to do smb.conf substitutions like %U
> C) we change to the share root directory
> 
> The future idea would be that we no longer do impersonation at the
> SMB layer. Instead we would explicitly pass down enough information
> through the SMB_VFS layer, that vfs modules can do impersonation
> just around the raw syscall (or in other required places).
> The module write should know where it is required!
> Userspace filesystems may do impersonation differently.
> Of course we'll provide helper functions to make it
> easy for the module writers.
> 
> In order to catch problem C) (relying on the correct current
> working directory) Jeremy and others are working
> hard to convert our SMB_VFS layer to *at() based syscalls.
> See https://git.samba.org/?p=samba.git;a=history;f=source3/include/vfs.h
> 
> For problems A) and B) I have the idea to pass down
> a 'const struct samba_impersonation' as explicit argument
> to each SMB_VFS call. Note I called i 'smb_vfs_impersonation'
> in my presentation, but I realized that we need the same
> for the DCEPRC servers and changed the name.
> 
> Regarding problem B) I'm introducing a
> 'struct loadparm_substitution' that needs tobe passed explicitly
> to each lp_*(), lpcfg_*() function that needs substitutions.
> 
> struct samba_impersonation will wrap
> struct auth_session_info as well as struct loadparm_substitution.
> We could add more later if needed.
> 
> I started with the struct loadparm_substitution infrastructure
> and created some draft patches for struct samba_impersonation.
> Before I continue I'd like to get some feedback.
> 
> Please have a look and tell me if you are happy with
> that approach or if we need to find a better solution.

Just want to comment to say I think this is the right
way to move forward to modernize our VFS and move to
a completely async model.

Haven't had time to review these specific patches
yet (sorry, been busy with other things) but I'll
try and do so as soon as I get some time.

Cheers,

	Jeremy.

