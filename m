Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id AC2FFBB7F6
	for <lists+samba-technical@lfdr.de>; Mon, 23 Sep 2019 17:32:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=BJr2ApeLqooRCsLRyQovTbN8aXzj+h+zgw1QdVVXDNs=; b=o0CJ+ZhX4Zp1KiwmudEXvrV1oF
	JqZ4m7alo52AkUtSjyd93JQeeEsMW5d5bn0Buf7O6UjQNfHvUBOUO3nEDZ7Su53aXzm/tpl4M1ZtT
	7cxtzChSt0LoTNkvQVdkdfZIegUfMFhJoirm1h/6qc/6h4Wwgi9BcmqRIgBxKu1NdRDNIUEPEfsY6
	nNHoU3gymJGfhaQB9hc7/cQj3wkAJ4MlXZIHBbROqKYV4i5h8jgihf1geAVXy/UtEAojcfDj5J+vu
	lHWA5iOaakzLhUKCOLW+FQBCVirJLKSaXI+Omnk/eKpvLWEXe6AL3o9jET9E9ExHJATG8wmlocU+0
	zpLG0PRA==;
Received: from localhost ([::1]:57728 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iCQJ3-00821n-2U; Mon, 23 Sep 2019 15:31:17 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:64058) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iCQIx-00821Y-5I
 for samba-technical@lists.samba.org; Mon, 23 Sep 2019 15:31:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Message-ID:Cc:To:From:Date;
 bh=BJr2ApeLqooRCsLRyQovTbN8aXzj+h+zgw1QdVVXDNs=; b=cu9kuy/Vz0jC8t/ewQTQ6Ex+ww
 JfJns3dzeqMtgKto6DyAISxyeOdRGWnXfoOfAVlAcJlar39MLcbxk4VIj1QQdWQVEDzmI3pBq50OX
 cmkCbW/Wi0iOVoqegCTGfwycQmTFJVjIlfZSRsD9PH7AE3ZO5q1Ge38yzPkz4RgZ6UXE=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1iCQIv-0002Xi-ER; Mon, 23 Sep 2019 15:31:09 +0000
Date: Mon, 23 Sep 2019 08:31:07 -0700
To: Anoop C S <anoopcs@cryptolab.net>
Subject: Re: Implementing SMB_VFS_FCNTL in Samba
Message-ID: <20190923153107.GA4325@jeremy-ThinkPad-X1>
References: <7024afc6236a656134f867288cdb37579425e3ee.camel@cryptolab.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7024afc6236a656134f867288cdb37579425e3ee.camel@cryptolab.net>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Mon, Sep 23, 2019 at 02:51:24PM +0530, Anoop C S wrote:
> Hi all,
> 
> I am attaching a patch as an attempt to implement SMB_VFS_FCNTL(for a
> background see https://bugzilla.samba.org/show_bug.cgi?id=14060). But I
> have the following question.
> 
> int fcntl(int fd, int cmd, ... /* arg */ );
> 
> As per man page, fcntl(2) system call can accept a third optional
> argument. If present it can be of type int, struct flock *, struct
> f_owner_ex * or uint64_t *. Our current SMB_VFS_LOCK and
> SMB_VFS_GETLOCK takes care of "Advisory record locking" and "Open file
> description locks" commands which requires third argument of type
> struct flock *. Other important fact here to notice is that in most
> cases the required third argument type is int. The patch I have
> prepared right now assumes third argument type to be int. 
> 
> So should we rename the call to something else(keeping third argument
> as int) or change the implementation to consider optional third
> argument as variable?

I think we need a varargs argument here like the real fcntl definition.

> From 0a13c3f427bcd7a8ce88ccf37a53f13b56e2a678 Mon Sep 17 00:00:00 2001
> From: Anoop C S <anoopcs@redhat.com>
> Date: Sat, 21 Sep 2019 19:11:19 +0530
> Subject: [PATCH] s3: VFS: Add SMB_VFS_FCNTL()
> 
> Signed-off-by: Anoop C S <anoopcs@redhat.com>
> ---
>  examples/VFS/skel_opaque.c            |  8 ++++++++
>  examples/VFS/skel_transparent.c       |  7 +++++++
>  source3/include/smbprofile.h          |  1 +
>  source3/include/vfs.h                 |  7 +++++++
>  source3/include/vfs_macros.h          |  5 +++++
>  source3/modules/vfs_default.c         | 13 +++++++++++++
>  source3/modules/vfs_not_implemented.c |  8 ++++++++
>  source3/smbd/vfs.c                    |  7 +++++++
>  8 files changed, 56 insertions(+)
> 
> diff --git a/examples/VFS/skel_opaque.c b/examples/VFS/skel_opaque.c
> index c03a42fee04..feb90c31533 100644
> --- a/examples/VFS/skel_opaque.c
> +++ b/examples/VFS/skel_opaque.c
> @@ -442,6 +442,13 @@ static int skel_kernel_flock(struct vfs_handle_struct *handle,
>  	return -1;
>  }
>  
> +static int skel_fcntl(struct vfs_handle_struct *handle,
> +		      struct files_struct *fsp, int cmd, int cmd_arg)
> +{
> +	errno = ENOSYS;
> +	return -1;
> +}
> +
>  static int skel_linux_setlease(struct vfs_handle_struct *handle,
>  			       struct files_struct *fsp, int leasetype)
>  {
> @@ -1089,6 +1096,7 @@ static struct vfs_fn_pointers skel_opaque_fns = {
>  	.fallocate_fn = skel_fallocate,
>  	.lock_fn = skel_lock,
>  	.kernel_flock_fn = skel_kernel_flock,
> +	.fcntl_fn = skel_fcntl,
>  	.linux_setlease_fn = skel_linux_setlease,
>  	.getlock_fn = skel_getlock,
>  	.symlinkat_fn = skel_symlinkat,
> diff --git a/examples/VFS/skel_transparent.c b/examples/VFS/skel_transparent.c
> index 656c933338a..6d88f08ae59 100644
> --- a/examples/VFS/skel_transparent.c
> +++ b/examples/VFS/skel_transparent.c
> @@ -547,6 +547,12 @@ static int skel_kernel_flock(struct vfs_handle_struct *handle,
>  	return SMB_VFS_NEXT_KERNEL_FLOCK(handle, fsp, share_mode, access_mask);
>  }
>  
> +static int skel_fcntl(struct vfs_handle_struct *handle,
> +		      struct files_struct *fsp, int cmd, int cmd_arg)
> +{
> +	return SMB_VFS_NEXT_FCNTL(handle, fsp, cmd, cmd_arg);
> +}
> +
>  static int skel_linux_setlease(struct vfs_handle_struct *handle,
>  			       struct files_struct *fsp, int leasetype)
>  {
> @@ -1374,6 +1380,7 @@ static struct vfs_fn_pointers skel_transparent_fns = {
>  	.fallocate_fn = skel_fallocate,
>  	.lock_fn = skel_lock,
>  	.kernel_flock_fn = skel_kernel_flock,
> +	.fcntl_fn = skel_fcntl,
>  	.linux_setlease_fn = skel_linux_setlease,
>  	.getlock_fn = skel_getlock,
>  	.symlinkat_fn = skel_symlinkat,
> diff --git a/source3/include/smbprofile.h b/source3/include/smbprofile.h
> index 489a613e3df..24da99dcd20 100644
> --- a/source3/include/smbprofile.h
> +++ b/source3/include/smbprofile.h
> @@ -82,6 +82,7 @@ struct tevent_context;
>  	SMBPROFILE_STATS_BASIC(syscall_kernel_flock) \
>  	SMBPROFILE_STATS_BASIC(syscall_linux_setlease) \
>  	SMBPROFILE_STATS_BASIC(syscall_fcntl_getlock) \
> +	SMBPROFILE_STATS_BASIC(syscall_fcntl) \
>  	SMBPROFILE_STATS_BASIC(syscall_readlinkat) \
>  	SMBPROFILE_STATS_BASIC(syscall_symlinkat) \
>  	SMBPROFILE_STATS_BASIC(syscall_linkat) \
> diff --git a/source3/include/vfs.h b/source3/include/vfs.h
> index 47147821ffd..6e446d3b32c 100644
> --- a/source3/include/vfs.h
> +++ b/source3/include/vfs.h
> @@ -281,6 +281,7 @@
>  /* Version 42 - Move change_to_user() -> change_to_user_and_service() */
>  /* Version 42 - Move change_to_user_by_fsp() -> change_to_user_and_service_by_fsp() */
>  /* Version 42 - Move [un]become_user*() -> [un]become_user_without_service*() */
> +/* Version 42 - Add SMB_VFS_FCNTL */
>  
>  #define SMB_VFS_INTERFACE_VERSION 42
>  
> @@ -807,6 +808,8 @@ struct vfs_fn_pointers {
>  	bool (*lock_fn)(struct vfs_handle_struct *handle, struct files_struct *fsp, int op, off_t offset, off_t count, int type);
>  	int (*kernel_flock_fn)(struct vfs_handle_struct *handle, struct files_struct *fsp,
>  			       uint32_t share_mode, uint32_t access_mask);
> +	int (*fcntl_fn)(struct vfs_handle_struct *handle,
> +			struct files_struct *fsp, int cmd, int cmd_arg);
>  	int (*linux_setlease_fn)(struct vfs_handle_struct *handle, struct files_struct *fsp, int leasetype);
>  	bool (*getlock_fn)(struct vfs_handle_struct *handle, struct files_struct *fsp, off_t *poffset, off_t *pcount, int *ptype, pid_t *ppid);
>  	int (*symlinkat_fn)(struct vfs_handle_struct *handle,
> @@ -1340,6 +1343,8 @@ bool smb_vfs_call_lock(struct vfs_handle_struct *handle,
>  int smb_vfs_call_kernel_flock(struct vfs_handle_struct *handle,
>  			      struct files_struct *fsp, uint32_t share_mode,
>  			      uint32_t access_mask);
> +int smb_vfs_call_fcntl(struct vfs_handle_struct *handle,
> +		       struct files_struct *fsp, int cmd, int cmd_arg);
>  int smb_vfs_call_linux_setlease(struct vfs_handle_struct *handle,
>  				struct files_struct *fsp, int leasetype);
>  bool smb_vfs_call_getlock(struct vfs_handle_struct *handle,
> @@ -1773,6 +1778,8 @@ bool vfs_not_implemented_lock(vfs_handle_struct *handle, files_struct *fsp, int
>  int vfs_not_implemented_kernel_flock(struct vfs_handle_struct *handle,
>  				     struct files_struct *fsp,
>  				     uint32_t share_mode, uint32_t access_mask);
> +int vfs_not_implemented_fcntl(struct vfs_handle_struct *handle,
> +			      struct files_struct *fsp, int cmd, int cmd_arg);
>  int vfs_not_implemented_linux_setlease(struct vfs_handle_struct *handle,
>  				       struct files_struct *fsp, int leasetype);
>  bool vfs_not_implemented_getlock(vfs_handle_struct *handle, files_struct *fsp,
> diff --git a/source3/include/vfs_macros.h b/source3/include/vfs_macros.h
> index 6d95d840e25..fc6d5be589c 100644
> --- a/source3/include/vfs_macros.h
> +++ b/source3/include/vfs_macros.h
> @@ -286,6 +286,11 @@
>  #define SMB_VFS_NEXT_KERNEL_FLOCK(handle, fsp, share_mode, access_mask)	\
>  	smb_vfs_call_kernel_flock((handle)->next, (fsp), (share_mode), (access_mask))
>  
> +#define SMB_VFS_FCNTL(fsp, cmd, cmd_arg) \
> +	smb_vfs_call_fcntl((fsp)->conn->vfs_handles, (fsp), (cmd), (cmd_arg))
> +#define SMB_VFS_NEXT_FCNTL(handle, fsp, cmd, cmd_arg) \
> +	smb_vfs_call_fcntl((handle)->next, (fsp), (cmd), (cmd_arg))
> +
>  #define SMB_VFS_LINUX_SETLEASE(fsp, leasetype) \
>  	smb_vfs_call_linux_setlease((fsp)->conn->vfs_handles, (fsp), (leasetype))
>  #define SMB_VFS_NEXT_LINUX_SETLEASE(handle, fsp, leasetype) \
> diff --git a/source3/modules/vfs_default.c b/source3/modules/vfs_default.c
> index f48a590e5e7..4cd26747c47 100644
> --- a/source3/modules/vfs_default.c
> +++ b/source3/modules/vfs_default.c
> @@ -2609,6 +2609,18 @@ static int vfswrap_kernel_flock(vfs_handle_struct *handle, files_struct *fsp,
>  	return 0;
>  }
>  
> +static int vfswrap_fcntl(vfs_handle_struct *handle, files_struct *fsp, int cmd,
> +			 int cmd_arg)
> +{
> +	int result;
> +
> +	START_PROFILE(syscall_fcntl);
> +	result = fcntl(fsp->fh->fd, cmd, cmd_arg);
> +	END_PROFILE(syscall_fcntl);
> +
> +	return result;
> +}
> +
>  static bool vfswrap_getlock(vfs_handle_struct *handle, files_struct *fsp, off_t *poffset, off_t *pcount, int *ptype, pid_t *ppid)
>  {
>  	bool result;
> @@ -3500,6 +3512,7 @@ static struct vfs_fn_pointers vfs_default_fns = {
>  	.fallocate_fn = vfswrap_fallocate,
>  	.lock_fn = vfswrap_lock,
>  	.kernel_flock_fn = vfswrap_kernel_flock,
> +	.fcntl_fn = vfswrap_fcntl,
>  	.linux_setlease_fn = vfswrap_linux_setlease,
>  	.getlock_fn = vfswrap_getlock,
>  	.symlinkat_fn = vfswrap_symlinkat,
> diff --git a/source3/modules/vfs_not_implemented.c b/source3/modules/vfs_not_implemented.c
> index e0f36b9a632..4f710cb4ca7 100644
> --- a/source3/modules/vfs_not_implemented.c
> +++ b/source3/modules/vfs_not_implemented.c
> @@ -440,6 +440,13 @@ int vfs_not_implemented_kernel_flock(struct vfs_handle_struct *handle,
>  	return -1;
>  }
>  
> +int vfs_not_implemented_fcntl(struct vfs_handle_struct *handle,
> +			      struct files_struct *fsp, int cmd, int cmd_arg)
> +{
> +	errno = ENOSYS;
> +	return -1;
> +}
> +
>  int vfs_not_implemented_linux_setlease(struct vfs_handle_struct *handle,
>  				       struct files_struct *fsp, int leasetype)
>  {
> @@ -1093,6 +1100,7 @@ static struct vfs_fn_pointers vfs_not_implemented_fns = {
>  	.fallocate_fn = vfs_not_implemented_fallocate,
>  	.lock_fn = vfs_not_implemented_lock,
>  	.kernel_flock_fn = vfs_not_implemented_kernel_flock,
> +	.fcntl_fn = vfs_not_implemented_fcntl,
>  	.linux_setlease_fn = vfs_not_implemented_linux_setlease,
>  	.getlock_fn = vfs_not_implemented_getlock,
>  	.symlinkat_fn = vfs_not_implemented_symlinkat,
> diff --git a/source3/smbd/vfs.c b/source3/smbd/vfs.c
> index 20f3d34965f..7e848900aba 100644
> --- a/source3/smbd/vfs.c
> +++ b/source3/smbd/vfs.c
> @@ -2190,6 +2190,13 @@ int smb_vfs_call_kernel_flock(struct vfs_handle_struct *handle,
>  					 access_mask);
>  }
>  
> +int smb_vfs_call_fcntl(struct vfs_handle_struct *handle,
> +		       struct files_struct *fsp, int cmd, int cmd_arg)
> +{
> +	VFS_FIND(fcntl);
> +	return handle->fns->fcntl_fn(handle, fsp, cmd, cmd_arg);
> +}
> +
>  int smb_vfs_call_linux_setlease(struct vfs_handle_struct *handle,
>  				struct files_struct *fsp, int leasetype)
>  {
> -- 
> 2.21.0
> 


