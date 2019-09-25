Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 751AEBE615
	for <lists+samba-technical@lfdr.de>; Wed, 25 Sep 2019 22:07:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=FwDyywnHLrhItfjOdnqBSwWzsuicjIt7eNG/K4AeFHI=; b=VNRqm6jLWIJrV72CmIB9WhYjUX
	VmW07S4kTwA12BGrS9AFNQqYbSq1eLPUnCbUjeSoy4GHqeCcFxTGDDA/e2scn//g0F8O0r1HIWdH3
	dMx5qkS4/oYdzlgtIQVtad/cgfwqw6RBSQbx85ZDrTFP/p1Lzgc1xRMWPUI6B7hC20Q8bh/+meTHX
	bY6G4TudnR7g4r7aUECPxuiWzWngLY15VXbU7NbmF2+jpbYBkch5AxkLYNuoCnNQb7DX3GSK/pisw
	MsBknz1dOJmAel9/7bqVb0IW2eUZVPEgjwpb68Kn7fgbmxyNTVUNUUvY7bAR17PS+UeKV2m+lgQTy
	RoE0aHYA==;
Received: from localhost ([::1]:18520 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iDDYu-008dKo-LC; Wed, 25 Sep 2019 20:06:56 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:52352) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iDDYq-008dKh-6j
 for samba-technical@lists.samba.org; Wed, 25 Sep 2019 20:06:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Message-ID:Cc:To:From:Date;
 bh=FwDyywnHLrhItfjOdnqBSwWzsuicjIt7eNG/K4AeFHI=; b=gv1rJ33dzubQ6aWGVOr5yJyYe0
 7Tan0WxTOz9xfCPbIE760ncgdmF499wpW07R/OAS0pqIfUBnxytky0uHgyur8BRQ8no6p9SQF3IxS
 cZozLrATJCZ9MfbJ4nnNFiW7mhORAfT+/qZYUQlWTJDy3pMiEGc9DDQm57dzhHHvCWUo=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1iDDYp-0004c2-8y; Wed, 25 Sep 2019 20:06:51 +0000
Date: Wed, 25 Sep 2019 13:06:48 -0700
To: Anoop C S <anoopcs@cryptolab.net>
Subject: Re: Implementing SMB_VFS_FCNTL in Samba
Message-ID: <20190925200648.GC26012@jeremy-ThinkPad-X1>
References: <7024afc6236a656134f867288cdb37579425e3ee.camel@cryptolab.net>
 <20190923153107.GA4325@jeremy-ThinkPad-X1>
 <98add807a4ac55e5f401522fbdfd47ddf2358d16.camel@cryptolab.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <98add807a4ac55e5f401522fbdfd47ddf2358d16.camel@cryptolab.net>
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

On Thu, Sep 26, 2019 at 12:09:34AM +0530, Anoop C S wrote:
> 
> Please find the attached patch in the above suggested direction. For
> now it is compile tested only. I will respond back afterwards with some
> basic testing results.

This looks much better - thanks !

Jeremy.

> From 82e126d1a51701dc812dd51025f37c4c34ee2495 Mon Sep 17 00:00:00 2001
> From: Anoop C S <anoopcs@redhat.com>
> Date: Sat, 21 Sep 2019 19:11:19 +0530
> Subject: [PATCH] s3: VFS: Add SMB_VFS_FCNTL()
> 
> Signed-off-by: Anoop C S <anoopcs@redhat.com>
> ---
>  examples/VFS/skel_opaque.c            |  8 +++++++
>  examples/VFS/skel_transparent.c       | 11 +++++++++
>  source3/include/proto.h               |  1 +
>  source3/include/smbprofile.h          |  1 +
>  source3/include/vfs.h                 |  7 ++++++
>  source3/include/vfs_macros.h          |  5 ++++
>  source3/lib/system.c                  | 14 +++++++++++
>  source3/modules/vfs_default.c         | 34 +++++++++++++++++++++++++++
>  source3/modules/vfs_not_implemented.c |  9 +++++++
>  source3/smbd/vfs.c                    | 15 ++++++++++++
>  10 files changed, 105 insertions(+)
> 
> diff --git a/examples/VFS/skel_opaque.c b/examples/VFS/skel_opaque.c
> index c03a42fee04..72714e7c2b6 100644
> --- a/examples/VFS/skel_opaque.c
> +++ b/examples/VFS/skel_opaque.c
> @@ -442,6 +442,13 @@ static int skel_kernel_flock(struct vfs_handle_struct *handle,
>  	return -1;
>  }
>  
> +static int skel_fcntl(struct vfs_handle_struct *handle,
> +		      struct files_struct *fsp, int cmd, va_list cmd_arg)
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
> index 656c933338a..60e3d58ffc2 100644
> --- a/examples/VFS/skel_transparent.c
> +++ b/examples/VFS/skel_transparent.c
> @@ -547,6 +547,16 @@ static int skel_kernel_flock(struct vfs_handle_struct *handle,
>  	return SMB_VFS_NEXT_KERNEL_FLOCK(handle, fsp, share_mode, access_mask);
>  }
>  
> +static int skel_fcntl(struct vfs_handle_struct *handle,
> +		      struct files_struct *fsp, int cmd, va_list cmd_arg)
> +{
> +	void *arg;
> +
> +	arg = va_arg(cmd_arg, void *);
> +
> +	return SMB_VFS_NEXT_FCNTL(handle, fsp, cmd, arg);
> +}
> +
>  static int skel_linux_setlease(struct vfs_handle_struct *handle,
>  			       struct files_struct *fsp, int leasetype)
>  {
> @@ -1374,6 +1384,7 @@ static struct vfs_fn_pointers skel_transparent_fns = {
>  	.fallocate_fn = skel_fallocate,
>  	.lock_fn = skel_lock,
>  	.kernel_flock_fn = skel_kernel_flock,
> +	.fcntl_fn = skel_fcntl,
>  	.linux_setlease_fn = skel_linux_setlease,
>  	.getlock_fn = skel_getlock,
>  	.symlinkat_fn = skel_symlinkat,
> diff --git a/source3/include/proto.h b/source3/include/proto.h
> index 0d02f38fc8b..d4267a84a65 100644
> --- a/source3/include/proto.h
> +++ b/source3/include/proto.h
> @@ -219,6 +219,7 @@ ssize_t sys_send(int s, const void *msg, size_t len, int flags);
>  ssize_t sys_recvfrom(int s, void *buf, size_t len, int flags, struct sockaddr *from, socklen_t *fromlen);
>  int sys_fcntl_ptr(int fd, int cmd, void *arg);
>  int sys_fcntl_long(int fd, int cmd, long arg);
> +int sys_fcntl_int(int fd, int cmd, int arg);
>  void update_stat_ex_mtime(struct stat_ex *dst, struct timespec write_ts);
>  void update_stat_ex_itime(struct stat_ex *dst, struct timespec itime);
>  void update_stat_ex_create_time(struct stat_ex *dst, struct timespec create_time);
> diff --git a/source3/include/smbprofile.h b/source3/include/smbprofile.h
> index 489a613e3df..2ae3db40a73 100644
> --- a/source3/include/smbprofile.h
> +++ b/source3/include/smbprofile.h
> @@ -80,6 +80,7 @@ struct tevent_context;
>  	SMBPROFILE_STATS_BASIC(syscall_fallocate) \
>  	SMBPROFILE_STATS_BASIC(syscall_fcntl_lock) \
>  	SMBPROFILE_STATS_BASIC(syscall_kernel_flock) \
> +	SMBPROFILE_STATS_BASIC(syscall_fcntl) \
>  	SMBPROFILE_STATS_BASIC(syscall_linux_setlease) \
>  	SMBPROFILE_STATS_BASIC(syscall_fcntl_getlock) \
>  	SMBPROFILE_STATS_BASIC(syscall_readlinkat) \
> diff --git a/source3/include/vfs.h b/source3/include/vfs.h
> index 47147821ffd..efec146e0ae 100644
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
> +			struct files_struct *fsp, int cmd, va_list cmd_arg);
>  	int (*linux_setlease_fn)(struct vfs_handle_struct *handle, struct files_struct *fsp, int leasetype);
>  	bool (*getlock_fn)(struct vfs_handle_struct *handle, struct files_struct *fsp, off_t *poffset, off_t *pcount, int *ptype, pid_t *ppid);
>  	int (*symlinkat_fn)(struct vfs_handle_struct *handle,
> @@ -1340,6 +1343,8 @@ bool smb_vfs_call_lock(struct vfs_handle_struct *handle,
>  int smb_vfs_call_kernel_flock(struct vfs_handle_struct *handle,
>  			      struct files_struct *fsp, uint32_t share_mode,
>  			      uint32_t access_mask);
> +int smb_vfs_call_fcntl(struct vfs_handle_struct *handle,
> +		       struct files_struct *fsp, int cmd, ...);
>  int smb_vfs_call_linux_setlease(struct vfs_handle_struct *handle,
>  				struct files_struct *fsp, int leasetype);
>  bool smb_vfs_call_getlock(struct vfs_handle_struct *handle,
> @@ -1773,6 +1778,8 @@ bool vfs_not_implemented_lock(vfs_handle_struct *handle, files_struct *fsp, int
>  int vfs_not_implemented_kernel_flock(struct vfs_handle_struct *handle,
>  				     struct files_struct *fsp,
>  				     uint32_t share_mode, uint32_t access_mask);
> +int vfs_not_implemented_fcntl(struct vfs_handle_struct *handle,
> +			      struct files_struct *fsp, int cmd, va_list cmd_arg);
>  int vfs_not_implemented_linux_setlease(struct vfs_handle_struct *handle,
>  				       struct files_struct *fsp, int leasetype);
>  bool vfs_not_implemented_getlock(vfs_handle_struct *handle, files_struct *fsp,
> diff --git a/source3/include/vfs_macros.h b/source3/include/vfs_macros.h
> index 6d95d840e25..74ee6b84369 100644
> --- a/source3/include/vfs_macros.h
> +++ b/source3/include/vfs_macros.h
> @@ -286,6 +286,11 @@
>  #define SMB_VFS_NEXT_KERNEL_FLOCK(handle, fsp, share_mode, access_mask)	\
>  	smb_vfs_call_kernel_flock((handle)->next, (fsp), (share_mode), (access_mask))
>  
> +#define SMB_VFS_FCNTL(fsp, cmd, ...) \
> +	smb_vfs_call_fcntl((fsp)->conn->vfs_handles, (fsp), (cmd), (__VA_ARGS__))
> +#define SMB_VFS_NEXT_FCNTL(handle, fsp, cmd, ...) \
> +	smb_vfs_call_fcntl((handle)->next, (fsp), (cmd), (__VA_ARGS__))
> +
>  #define SMB_VFS_LINUX_SETLEASE(fsp, leasetype) \
>  	smb_vfs_call_linux_setlease((fsp)->conn->vfs_handles, (fsp), (leasetype))
>  #define SMB_VFS_NEXT_LINUX_SETLEASE(handle, fsp, leasetype) \
> diff --git a/source3/lib/system.c b/source3/lib/system.c
> index def8281fc43..679332255c0 100644
> --- a/source3/lib/system.c
> +++ b/source3/lib/system.c
> @@ -108,6 +108,20 @@ int sys_fcntl_long(int fd, int cmd, long arg)
>  	return ret;
>  }
>  
> +/*******************************************************************
> +A fcntl wrapper that will deal with EINTR.
> +********************************************************************/
> +
> +int sys_fcntl_int(int fd, int cmd, int arg)
> +{
> +	int ret;
> +
> +	do {
> +		ret = fcntl(fd, cmd, arg);
> +	} while (ret == -1 && errno == EINTR);
> +	return ret;
> +}
> +
>  /****************************************************************************
>   Get/Set all the possible time fields from a stat struct as a timespec.
>  ****************************************************************************/
> diff --git a/source3/modules/vfs_default.c b/source3/modules/vfs_default.c
> index f48a590e5e7..49bceda6c8d 100644
> --- a/source3/modules/vfs_default.c
> +++ b/source3/modules/vfs_default.c
> @@ -2609,6 +2609,39 @@ static int vfswrap_kernel_flock(vfs_handle_struct *handle, files_struct *fsp,
>  	return 0;
>  }
>  
> +static int vfswrap_fcntl(vfs_handle_struct *handle, files_struct *fsp, int cmd,
> +			 va_list cmd_arg)
> +{
> +	void *arg;
> +	int result;
> +
> +	START_PROFILE(syscall_fcntl);
> +
> +	arg = va_arg(cmd_arg, void *);
> +
> +	switch(cmd) {
> +	case F_SETLK:
> +	case F_SETLKW:
> +	case F_GETLK:
> +	case F_OFD_SETLK:
> +	case F_OFD_SETLKW:
> +	case F_OFD_GETLK:
> +	case F_GETOWN_EX:
> +	case F_SETOWN_EX:
> +	case F_GET_RW_HINT:
> +	case F_SET_RW_HINT:
> +	case F_GET_FILE_RW_HINT:
> +	case F_SET_FILE_RW_HINT:
> +		result = sys_fcntl_ptr(fsp->fh->fd, cmd, arg);
> +		break;
> +	default:
> +		result = sys_fcntl_int(fsp->fh->fd, cmd, *((int *)arg));
> +	}
> +
> +	END_PROFILE(syscall_fcntl);
> +	return result;
> +}
> +
>  static bool vfswrap_getlock(vfs_handle_struct *handle, files_struct *fsp, off_t *poffset, off_t *pcount, int *ptype, pid_t *ppid)
>  {
>  	bool result;
> @@ -3500,6 +3533,7 @@ static struct vfs_fn_pointers vfs_default_fns = {
>  	.fallocate_fn = vfswrap_fallocate,
>  	.lock_fn = vfswrap_lock,
>  	.kernel_flock_fn = vfswrap_kernel_flock,
> +	.fcntl_fn = vfswrap_fcntl,
>  	.linux_setlease_fn = vfswrap_linux_setlease,
>  	.getlock_fn = vfswrap_getlock,
>  	.symlinkat_fn = vfswrap_symlinkat,
> diff --git a/source3/modules/vfs_not_implemented.c b/source3/modules/vfs_not_implemented.c
> index e0f36b9a632..d5b8079ae26 100644
> --- a/source3/modules/vfs_not_implemented.c
> +++ b/source3/modules/vfs_not_implemented.c
> @@ -440,6 +440,14 @@ int vfs_not_implemented_kernel_flock(struct vfs_handle_struct *handle,
>  	return -1;
>  }
>  
> +int vfs_not_implemented_fcntl(struct vfs_handle_struct *handle,
> +			      struct files_struct *fsp, int cmd,
> +			      va_list cmd_arg)
> +{
> +	errno = ENOSYS;
> +	return -1;
> +}
> +
>  int vfs_not_implemented_linux_setlease(struct vfs_handle_struct *handle,
>  				       struct files_struct *fsp, int leasetype)
>  {
> @@ -1093,6 +1101,7 @@ static struct vfs_fn_pointers vfs_not_implemented_fns = {
>  	.fallocate_fn = vfs_not_implemented_fallocate,
>  	.lock_fn = vfs_not_implemented_lock,
>  	.kernel_flock_fn = vfs_not_implemented_kernel_flock,
> +	.fcntl_fn = vfs_not_implemented_fcntl,
>  	.linux_setlease_fn = vfs_not_implemented_linux_setlease,
>  	.getlock_fn = vfs_not_implemented_getlock,
>  	.symlinkat_fn = vfs_not_implemented_symlinkat,
> diff --git a/source3/smbd/vfs.c b/source3/smbd/vfs.c
> index 20f3d34965f..1764be5e1cc 100644
> --- a/source3/smbd/vfs.c
> +++ b/source3/smbd/vfs.c
> @@ -2190,6 +2190,21 @@ int smb_vfs_call_kernel_flock(struct vfs_handle_struct *handle,
>  					 access_mask);
>  }
>  
> +int smb_vfs_call_fcntl(struct vfs_handle_struct *handle,
> +		       struct files_struct *fsp, int cmd, ...)
> +{
> +	int result;
> +	va_list cmd_arg;
> +
> +	VFS_FIND(fcntl);
> +
> +	va_start(cmd_arg, cmd);
> +	result = handle->fns->fcntl_fn(handle, fsp, cmd, cmd_arg);
> +	va_end(cmd_arg);
> +
> +	return result;
> +}
> +
>  int smb_vfs_call_linux_setlease(struct vfs_handle_struct *handle,
>  				struct files_struct *fsp, int leasetype)
>  {
> -- 
> 2.21.0
> 


