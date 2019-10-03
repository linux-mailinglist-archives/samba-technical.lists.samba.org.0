Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A82A8CAEA9
	for <lists+samba-technical@lfdr.de>; Thu,  3 Oct 2019 20:56:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=mB7wPzb8eh0NNzhFsSQqqNzj9LUVcpyU8aQn6uaJ9HE=; b=bIWIoj9RDivPl4EtjErDveuc6D
	3XnGys9T2iiZVFsjSTHVAydL9jT4zK7c+4WMD03Ab5zcAkCMqZdSfaaSMSPcTD4Fq1oeraf9nyxxE
	mag3qldK1f9/JG2McuGZbnuzFesbK2qgc60PNzKa6x+va1sdMdAXCsXlUiPtaH+qYMx/paIRnSgj/
	ZeESxIGSZ+knCZCy0mqmQ2/vUrJN0arqCEMMmAylsFCT0eGDu7uMleusTrEzMzqkN6UJKyuv2grYE
	HZODXJqfoDxD4qm6RWtFOqAdxhkc+/Bps2HthJkUrh0Rrdv/QzVffjleA4AS897wYSnK1rdlY4M4q
	3W8XyRcw==;
Received: from localhost ([::1]:46568 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iG6GQ-000pxB-Ls; Thu, 03 Oct 2019 18:55:46 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:21516) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iG6GJ-000px3-LI
 for samba-technical@lists.samba.org; Thu, 03 Oct 2019 18:55:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Message-ID:Cc:To:From:Date;
 bh=mB7wPzb8eh0NNzhFsSQqqNzj9LUVcpyU8aQn6uaJ9HE=; b=KQmYixBjMLpTJNmw2qssdT941K
 Y29OOu7q468SmDv5C5G8/sys72gDb0/RpoXVobpgGRXY8fFI/vjFHCMFvzdn4Sex083kznt4As+Uv
 WAgtzarrAHg6KnQpYIAjVqgfrdh3pysV3eWIV1+3GSsUKnXB/o0/WLcO0RHQB6sD2TKo=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iG6GF-0000Tb-QH; Thu, 03 Oct 2019 18:55:36 +0000
Date: Thu, 3 Oct 2019 11:55:33 -0700
To: Anoop C S <anoopcs@cryptolab.net>
Subject: Re: Implementing SMB_VFS_FCNTL in Samba
Message-ID: <20191003185533.GC163446@jra4>
References: <7024afc6236a656134f867288cdb37579425e3ee.camel@cryptolab.net>
 <20190923153107.GA4325@jeremy-ThinkPad-X1>
 <98add807a4ac55e5f401522fbdfd47ddf2358d16.camel@cryptolab.net>
 <e9469e1d026b34cf46c0012a463a2fbe610ffd17.camel@cryptolab.net>
 <a71d6def280a3c6125009f3d1eafff54f8f059b4.camel@cryptolab.net>
 <cb57dbab50e84cd24fdccd75530d11d5dbd002ed.camel@cryptolab.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cb57dbab50e84cd24fdccd75530d11d5dbd002ed.camel@cryptolab.net>
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
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thu, Oct 03, 2019 at 06:50:07PM +0530, Anoop C S via samba-technical wrote:
> On Thu, 2019-10-03 at 18:43 +0530, Anoop C S via samba-technical wrote:
> > OK. This should be it. I hope attached patch covers the missing part
> > where recent fcntl() commands are detected during configure. A
> > pipeline
> > has been completed successfully for the attached patches.
> > 
> > https://gitlab.com/samba-team/devel/samba/pipelines/86263033
> > 
> > Reviews are appreciated.
> 
> Please ignore the previous version which had a typo in checking
> HAVE_XX_XX inside vfs_default. Attaching the patches after correction.

+1 from me. This is *GREAT* work Anoop, thanks a lot !

This fixes a hole in our VFS fd usage we've had for a
long time.

In case anyone is interested in the details of my review,
I looked at how we map SMB_VFS_LOCK() onto POSIX fcntl to
see if this needed changing to use this new SMB_VFS_FCNTL
call, but decided it's not a good idea to do that as it
means going through the VFS stack twice for calls that
a properly written VFS module will already be coping
with at the initial VFS incall (SMB_VFS_LOCK/SMB_VFS_GETLOCK).

Can I get a second Team reviewer ?

Cheers,

	Jeremy.

> From 8e9a84dc3c14d1d6669300040c39676765b095f6 Mon Sep 17 00:00:00 2001
> From: Anoop C S <anoopcs@redhat.com>
> Date: Fri, 27 Sep 2019 11:19:37 +0530
> Subject: [PATCH 1/2] s3: VFS: Add SMB_VFS_FCNTL
> 
> Signed-off-by: Anoop C S <anoopcs@redhat.com>
> ---
>  examples/VFS/skel_opaque.c            |   8 ++
>  examples/VFS/skel_transparent.c       |  16 ++++
>  source3/include/proto.h               |   1 +
>  source3/include/smbprofile.h          |   1 +
>  source3/include/vfs.h                 |   7 ++
>  source3/include/vfs_macros.h          |   5 ++
>  source3/lib/system.c                  |  14 ++++
>  source3/modules/vfs_default.c         |  46 +++++++++++
>  source3/modules/vfs_full_audit.c      |  21 +++++
>  source3/modules/vfs_not_implemented.c |   9 +++
>  source3/modules/vfs_time_audit.c      |  26 ++++++
>  source3/smbd/vfs.c                    |  15 ++++
>  source3/wscript                       | 109 ++++++++++++++++++++++++++
>  13 files changed, 278 insertions(+)
> 
> diff --git a/examples/VFS/skel_opaque.c b/examples/VFS/skel_opaque.c
> index 59804675c8e..be3773965e7 100644
> --- a/examples/VFS/skel_opaque.c
> +++ b/examples/VFS/skel_opaque.c
> @@ -444,6 +444,13 @@ static int skel_kernel_flock(struct vfs_handle_struct *handle,
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
> @@ -1091,6 +1098,7 @@ static struct vfs_fn_pointers skel_opaque_fns = {
>  	.fallocate_fn = skel_fallocate,
>  	.lock_fn = skel_lock,
>  	.kernel_flock_fn = skel_kernel_flock,
> +	.fcntl_fn = skel_fcntl,
>  	.linux_setlease_fn = skel_linux_setlease,
>  	.getlock_fn = skel_getlock,
>  	.symlinkat_fn = skel_symlinkat,
> diff --git a/examples/VFS/skel_transparent.c b/examples/VFS/skel_transparent.c
> index c73c2a2692b..063af8f3aed 100644
> --- a/examples/VFS/skel_transparent.c
> +++ b/examples/VFS/skel_transparent.c
> @@ -552,6 +552,21 @@ static int skel_kernel_flock(struct vfs_handle_struct *handle,
>  	return SMB_VFS_NEXT_KERNEL_FLOCK(handle, fsp, share_mode, access_mask);
>  }
>  
> +static int skel_fcntl(struct vfs_handle_struct *handle,
> +		      struct files_struct *fsp, int cmd, va_list cmd_arg)
> +{
> +	void *arg;
> +	va_list dup_cmd_arg;
> +	int result;
> +
> +	va_copy(dup_cmd_arg, cmd_arg);
> +	arg = va_arg(dup_cmd_arg, void *);
> +	result = SMB_VFS_NEXT_FCNTL(handle, fsp, cmd, arg);
> +	va_end(dup_cmd_arg);
> +
> +	return result;
> +}
> +
>  static int skel_linux_setlease(struct vfs_handle_struct *handle,
>  			       struct files_struct *fsp, int leasetype)
>  {
> @@ -1379,6 +1394,7 @@ static struct vfs_fn_pointers skel_transparent_fns = {
>  	.fallocate_fn = skel_fallocate,
>  	.lock_fn = skel_lock,
>  	.kernel_flock_fn = skel_kernel_flock,
> +	.fcntl_fn = skel_fcntl,
>  	.linux_setlease_fn = skel_linux_setlease,
>  	.getlock_fn = skel_getlock,
>  	.symlinkat_fn = skel_symlinkat,
> diff --git a/source3/include/proto.h b/source3/include/proto.h
> index 91a7c00fef2..c98f7cfa351 100644
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
> index cc54dea2710..ea2a29a0758 100644
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
> index 6ba653f56c7..326687f5ee1 100644
> --- a/source3/include/vfs.h
> +++ b/source3/include/vfs.h
> @@ -282,6 +282,7 @@
>  /* Version 42 - Move change_to_user_by_fsp() -> change_to_user_and_service_by_fsp() */
>  /* Version 42 - Move [un]become_user*() -> [un]become_user_without_service*() */
>  /* Version 42 - Move SMB_VFS_UNLINK -> SMB_VFS_UNLINKAT. */
> +/* Version 42 - Add SMB_VFS_FCNTL */
>  
>  #define SMB_VFS_INTERFACE_VERSION 42
>  
> @@ -810,6 +811,8 @@ struct vfs_fn_pointers {
>  	bool (*lock_fn)(struct vfs_handle_struct *handle, struct files_struct *fsp, int op, off_t offset, off_t count, int type);
>  	int (*kernel_flock_fn)(struct vfs_handle_struct *handle, struct files_struct *fsp,
>  			       uint32_t share_mode, uint32_t access_mask);
> +	int (*fcntl_fn)(struct vfs_handle_struct *handle,
> +			struct files_struct *fsp, int cmd, va_list cmd_arg);
>  	int (*linux_setlease_fn)(struct vfs_handle_struct *handle, struct files_struct *fsp, int leasetype);
>  	bool (*getlock_fn)(struct vfs_handle_struct *handle, struct files_struct *fsp, off_t *poffset, off_t *pcount, int *ptype, pid_t *ppid);
>  	int (*symlinkat_fn)(struct vfs_handle_struct *handle,
> @@ -1345,6 +1348,8 @@ bool smb_vfs_call_lock(struct vfs_handle_struct *handle,
>  int smb_vfs_call_kernel_flock(struct vfs_handle_struct *handle,
>  			      struct files_struct *fsp, uint32_t share_mode,
>  			      uint32_t access_mask);
> +int smb_vfs_call_fcntl(struct vfs_handle_struct *handle,
> +		       struct files_struct *fsp, int cmd, ...);
>  int smb_vfs_call_linux_setlease(struct vfs_handle_struct *handle,
>  				struct files_struct *fsp, int leasetype);
>  bool smb_vfs_call_getlock(struct vfs_handle_struct *handle,
> @@ -1780,6 +1785,8 @@ bool vfs_not_implemented_lock(vfs_handle_struct *handle, files_struct *fsp, int
>  int vfs_not_implemented_kernel_flock(struct vfs_handle_struct *handle,
>  				     struct files_struct *fsp,
>  				     uint32_t share_mode, uint32_t access_mask);
> +int vfs_not_implemented_fcntl(struct vfs_handle_struct *handle,
> +			      struct files_struct *fsp, int cmd, va_list cmd_arg);
>  int vfs_not_implemented_linux_setlease(struct vfs_handle_struct *handle,
>  				       struct files_struct *fsp, int leasetype);
>  bool vfs_not_implemented_getlock(vfs_handle_struct *handle, files_struct *fsp,
> diff --git a/source3/include/vfs_macros.h b/source3/include/vfs_macros.h
> index 2979769e7d5..2dd59711e19 100644
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
> index 738be3bf2d6..9bf8005bcd7 100644
> --- a/source3/modules/vfs_default.c
> +++ b/source3/modules/vfs_default.c
> @@ -2615,6 +2615,51 @@ static int vfswrap_kernel_flock(vfs_handle_struct *handle, files_struct *fsp,
>  	return 0;
>  }
>  
> +static int vfswrap_fcntl(vfs_handle_struct *handle, files_struct *fsp, int cmd,
> +			 va_list cmd_arg)
> +{
> +	void *argp;
> +	va_list dup_cmd_arg;
> +	int result;
> +	int val;
> +
> +	START_PROFILE(syscall_fcntl);
> +
> +	va_copy(dup_cmd_arg, cmd_arg);
> +
> +	switch(cmd) {
> +	case F_SETLK:
> +	case F_SETLKW:
> +	case F_GETLK:
> +#if defined(HAVE_OFD_LOCKS)
> +	case F_OFD_SETLK:
> +	case F_OFD_SETLKW:
> +	case F_OFD_GETLK:
> +#endif
> +#if defined(HAVE_F_OWNER_EX)
> +	case F_GETOWN_EX:
> +	case F_SETOWN_EX:
> +#endif
> +#if defined(HAVE_RW_HINTS)
> +	case F_GET_RW_HINT:
> +	case F_SET_RW_HINT:
> +	case F_GET_FILE_RW_HINT:
> +	case F_SET_FILE_RW_HINT:
> +#endif
> +		argp = va_arg(dup_cmd_arg, void *);
> +		result = sys_fcntl_ptr(fsp->fh->fd, cmd, argp);
> +		break;
> +	default:
> +		val = va_arg(dup_cmd_arg, int);
> +		result = sys_fcntl_int(fsp->fh->fd, cmd, val);
> +	}
> +
> +	va_end(dup_cmd_arg);
> +
> +	END_PROFILE(syscall_fcntl);
> +	return result;
> +}
> +
>  static bool vfswrap_getlock(vfs_handle_struct *handle, files_struct *fsp, off_t *poffset, off_t *pcount, int *ptype, pid_t *ppid)
>  {
>  	bool result;
> @@ -3506,6 +3551,7 @@ static struct vfs_fn_pointers vfs_default_fns = {
>  	.fallocate_fn = vfswrap_fallocate,
>  	.lock_fn = vfswrap_lock,
>  	.kernel_flock_fn = vfswrap_kernel_flock,
> +	.fcntl_fn = vfswrap_fcntl,
>  	.linux_setlease_fn = vfswrap_linux_setlease,
>  	.getlock_fn = vfswrap_getlock,
>  	.symlinkat_fn = vfswrap_symlinkat,
> diff --git a/source3/modules/vfs_full_audit.c b/source3/modules/vfs_full_audit.c
> index de591eb2136..757cd26d3f1 100644
> --- a/source3/modules/vfs_full_audit.c
> +++ b/source3/modules/vfs_full_audit.c
> @@ -151,6 +151,7 @@ typedef enum _vfs_op_type {
>  	SMB_VFS_OP_FALLOCATE,
>  	SMB_VFS_OP_LOCK,
>  	SMB_VFS_OP_KERNEL_FLOCK,
> +	SMB_VFS_OP_FCNTL,
>  	SMB_VFS_OP_LINUX_SETLEASE,
>  	SMB_VFS_OP_GETLOCK,
>  	SMB_VFS_OP_SYMLINKAT,
> @@ -1734,6 +1735,25 @@ static int smb_full_audit_kernel_flock(struct vfs_handle_struct *handle,
>  	return result;
>  }
>  
> +static int smb_full_audit_fcntl(struct vfs_handle_struct *handle,
> +				struct files_struct *fsp,
> +				int cmd, va_list cmd_arg)
> +{
> +	void *arg;
> +	va_list dup_cmd_arg;
> +	int result;
> +
> +	va_copy(dup_cmd_arg, cmd_arg);
> +	arg = va_arg(dup_cmd_arg, void *);
> +	result = SMB_VFS_NEXT_FCNTL(handle, fsp, cmd, arg);
> +	va_end(dup_cmd_arg);
> +
> +	do_log(SMB_VFS_OP_FCNTL, (result >= 0), handle, "%s",
> +	       fsp_str_do_log(fsp));
> +
> +	return result;
> +}
> +
>  static int smb_full_audit_linux_setlease(vfs_handle_struct *handle, files_struct *fsp,
>                                   int leasetype)
>  {
> @@ -2981,6 +3001,7 @@ static struct vfs_fn_pointers vfs_full_audit_fns = {
>  	.fallocate_fn = smb_full_audit_fallocate,
>  	.lock_fn = smb_full_audit_lock,
>  	.kernel_flock_fn = smb_full_audit_kernel_flock,
> +	.fcntl_fn = smb_full_audit_fcntl,
>  	.linux_setlease_fn = smb_full_audit_linux_setlease,
>  	.getlock_fn = smb_full_audit_getlock,
>  	.symlinkat_fn = smb_full_audit_symlinkat,
> diff --git a/source3/modules/vfs_not_implemented.c b/source3/modules/vfs_not_implemented.c
> index ffcba7bd8db..2b906b3cf28 100644
> --- a/source3/modules/vfs_not_implemented.c
> +++ b/source3/modules/vfs_not_implemented.c
> @@ -442,6 +442,14 @@ int vfs_not_implemented_kernel_flock(struct vfs_handle_struct *handle,
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
> @@ -1095,6 +1103,7 @@ static struct vfs_fn_pointers vfs_not_implemented_fns = {
>  	.fallocate_fn = vfs_not_implemented_fallocate,
>  	.lock_fn = vfs_not_implemented_lock,
>  	.kernel_flock_fn = vfs_not_implemented_kernel_flock,
> +	.fcntl_fn = vfs_not_implemented_fcntl,
>  	.linux_setlease_fn = vfs_not_implemented_linux_setlease,
>  	.getlock_fn = vfs_not_implemented_getlock,
>  	.symlinkat_fn = vfs_not_implemented_symlinkat,
> diff --git a/source3/modules/vfs_time_audit.c b/source3/modules/vfs_time_audit.c
> index 213ea10b17f..7fa6161945a 100644
> --- a/source3/modules/vfs_time_audit.c
> +++ b/source3/modules/vfs_time_audit.c
> @@ -1344,6 +1344,31 @@ static int smb_time_audit_kernel_flock(struct vfs_handle_struct *handle,
>  	return result;
>  }
>  
> +static int smb_time_audit_fcntl(struct vfs_handle_struct *handle,
> +				struct files_struct *fsp,
> +				int cmd, va_list cmd_arg)
> +{
> +	void *arg;
> +	va_list dup_cmd_arg;
> +	int result;
> +	struct timespec ts1,ts2;
> +	double timediff;
> +
> +	va_copy(dup_cmd_arg, cmd_arg);
> +	arg = va_arg(dup_cmd_arg, void *);
> +	clock_gettime_mono(&ts1);
> +	result = SMB_VFS_NEXT_FCNTL(handle, fsp, cmd, arg);
> +	clock_gettime_mono(&ts2);
> +	va_end(dup_cmd_arg);
> +
> +	timediff = nsec_time_diff(&ts2,&ts1)*1.0e-9;
> +	if (timediff > audit_timeout) {
> +		smb_time_audit_log_fsp("kernel_flock", timediff, fsp);
> +	}
> +
> +	return result;
> +}
> +
>  static int smb_time_audit_linux_setlease(vfs_handle_struct *handle,
>  					 files_struct *fsp,
>  					 int leasetype)
> @@ -2866,6 +2891,7 @@ static struct vfs_fn_pointers vfs_time_audit_fns = {
>  	.fallocate_fn = smb_time_audit_fallocate,
>  	.lock_fn = smb_time_audit_lock,
>  	.kernel_flock_fn = smb_time_audit_kernel_flock,
> +	.fcntl_fn = smb_time_audit_fcntl,
>  	.linux_setlease_fn = smb_time_audit_linux_setlease,
>  	.getlock_fn = smb_time_audit_getlock,
>  	.symlinkat_fn = smb_time_audit_symlinkat,
> diff --git a/source3/smbd/vfs.c b/source3/smbd/vfs.c
> index b83cf1e4d55..bef79e4c64e 100644
> --- a/source3/smbd/vfs.c
> +++ b/source3/smbd/vfs.c
> @@ -2195,6 +2195,21 @@ int smb_vfs_call_kernel_flock(struct vfs_handle_struct *handle,
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
> diff --git a/source3/wscript b/source3/wscript
> index d45222625c4..e29bf657b5e 100644
> --- a/source3/wscript
> +++ b/source3/wscript
> @@ -1119,6 +1119,115 @@ err:
>              execute=True,
>              msg="Checking whether fcntl lock supports open file description locks")
>  
> +    conf.CHECK_CODE('''
> +#include <fcntl.h>
> +#include <unistd.h>
> +#include <stdlib.h>
> +#include <sys/socket.h>
> +
> +int main(void)
> +{
> +        int sockfd, ret;
> +        struct f_owner_ex owner, get_owner;
> +
> +        sockfd = socket(AF_UNIX, SOCK_STREAM, 0);
> +        if (sockfd == -1) {
> +            goto err;
> +        }
> +
> +        owner.type = F_OWNER_PID;
> +        owner.pid = getpid();
> +
> +        ret = fcntl(sockfd, F_SETOWN_EX, &owner);
> +        if (ret == -1) {
> +            goto err;
> +        }
> +
> +        ret = fcntl(sockfd, F_GETOWN_EX, &get_owner);
> +        if (ret == -1) {
> +            goto err;
> +        }
> +
> +        if (get_owner.type != F_OWNER_PID) {
> +            goto err;
> +        }
> +
> +        if (get_owner.pid != getpid()) {
> +            goto err;
> +        }
> +
> +        close(sockfd);
> +        exit(0);
> +err:
> +        close(sockfd);
> +        exit(1);
> +}''',
> +            'HAVE_F_OWNER_EX',
> +            addmain=False,
> +            execute=True,
> +            msg="Checking whether fcntl supports flags to send direct I/O availability signals")
> +
> +    conf.CHECK_CODE('''
> +#include <fcntl.h>
> +#include <unistd.h>
> +#include <stdlib.h>
> +#include <stdint.h>
> +
> +#define DATA "hinttest.fcntl"
> +
> +int main(void)
> +{
> +        uint64_t *hint, get_hint;
> +        int fd;
> +
> +        fd = open(DATA, O_RDONLY | O_CREAT | O_EXCL);
> +        if (fd == -1) {
> +            goto err;
> +        }
> +
> +        *hint = RWH_WRITE_LIFE_SHORT;
> +        int ret = fcntl(fd, F_SET_RW_HINT, hint);
> +        if (ret == -1) {
> +            goto err;
> +        }
> +
> +        ret = fcntl(fd, F_GET_RW_HINT, &get_hint);
> +        if (ret == -1) {
> +            goto err;
> +        }
> +
> +        if (get_hint != RWH_WRITE_LIFE_SHORT) {
> +            goto err;
> +        }
> +
> +        *hint = RWH_WRITE_LIFE_EXTREME;
> +        ret = fcntl(fd, F_SET_FILE_RW_HINT, hint);
> +        if (ret == -1) {
> +            goto err;
> +        }
> +
> +        ret = fcntl(fd, F_GET_FILE_RW_HINT, &get_hint);
> +        if (ret == -1) {
> +            goto err;
> +        }
> +
> +        if (get_hint != RWH_WRITE_LIFE_EXTREME) {
> +            goto err;
> +        }
> +
> +        close(fd);
> +        unlink(DATA);
> +        exit(0);
> +err:
> +        close(fd);
> +        unlink(DATA);
> +        exit(1);
> +}''',
> +            'HAVE_RW_HINTS',
> +            addmain=False,
> +            execute=True,
> +            msg="Checking whether fcntl supports setting/geting hints")
> +
>      conf.CHECK_STRUCTURE_MEMBER('struct stat', 'st_mtim.tv_nsec',
>                                  define='HAVE_STRUCT_STAT_ST_MTIM_TV_NSEC') # Linux, Solaris
>      conf.CHECK_STRUCTURE_MEMBER('struct stat', 'st_mtimensec',
> -- 
> 2.21.0
> 

> From 8e4c4c7104cd3c3020c55d2de88f26f647ffbd96 Mon Sep 17 00:00:00 2001
> From: Anoop C S <anoopcs@redhat.com>
> Date: Fri, 27 Sep 2019 12:07:40 +0530
> Subject: [PATCH 2/2] s3: VFS: Use SMB_VFS_FCNTL to set fd flags in open_file()
> 
> Signed-off-by: Anoop C S <anoopcs@redhat.com>
> ---
>  source3/smbd/open.c  |  2 +-
>  source3/smbd/proto.h |  1 +
>  source3/smbd/vfs.c   | 30 ++++++++++++++++++++++++++++++
>  3 files changed, 32 insertions(+), 1 deletion(-)
> 
> diff --git a/source3/smbd/open.c b/source3/smbd/open.c
> index 5860155263b..9493021c48d 100644
> --- a/source3/smbd/open.c
> +++ b/source3/smbd/open.c
> @@ -1327,7 +1327,7 @@ static NTSTATUS open_file(files_struct *fsp,
>  			 * too. With blocking file descriptors this
>  			 * does not happen.
>  			 */
> -			ret = set_blocking(fsp->fh->fd, true);
> +			ret = vfs_set_blocking(fsp, true);
>  			if (ret == -1) {
>  				status = map_nt_error_from_unix(errno);
>  				DBG_WARNING("Could not set fd to blocking: "
> diff --git a/source3/smbd/proto.h b/source3/smbd/proto.h
> index 11c9dc0f8b1..e9d04474df6 100644
> --- a/source3/smbd/proto.h
> +++ b/source3/smbd/proto.h
> @@ -1230,6 +1230,7 @@ int vfs_allocate_file_space(files_struct *fsp, uint64_t len);
>  int vfs_set_filelen(files_struct *fsp, off_t len);
>  int vfs_slow_fallocate(files_struct *fsp, off_t offset, off_t len);
>  int vfs_fill_sparse(files_struct *fsp, off_t len);
> +int vfs_set_blocking(files_struct *fsp, bool set);
>  off_t vfs_transfer_file(files_struct *in, files_struct *out, off_t n);
>  const char *vfs_readdirname(connection_struct *conn, void *p,
>  			    SMB_STRUCT_STAT *sbuf, char **talloced);
> diff --git a/source3/smbd/vfs.c b/source3/smbd/vfs.c
> index bef79e4c64e..cd6d0f25c04 100644
> --- a/source3/smbd/vfs.c
> +++ b/source3/smbd/vfs.c
> @@ -711,6 +711,36 @@ int vfs_fill_sparse(files_struct *fsp, off_t len)
>  	return ret;
>  }
>  
> +/*******************************************************************************
> + Set a fd into blocking/nonblocking mode through VFS
> +*******************************************************************************/
> +
> +int vfs_set_blocking(files_struct *fsp, bool set)
> +{
> +	int val;
> +#ifdef O_NONBLOCK
> +#define FLAG_TO_SET O_NONBLOCK
> +#else
> +#ifdef SYSV
> +#define FLAG_TO_SET O_NDELAY
> +#else /* BSD */
> +#define FLAG_TO_SET FNDELAY
> +#endif
> +#endif
> +	if ((val = SMB_VFS_FCNTL(fsp, F_GETFL, 0)) == -1) {
> +		return -1;
> +	}
> +
> +	if (set) {
> +		val &= ~FLAG_TO_SET;
> +	} else {
> +		val |= FLAG_TO_SET;
> +	}
> +
> +	return SMB_VFS_FCNTL(fsp, F_SETFL, val);
> +#undef FLAG_TO_SET
> +}
> +
>  /****************************************************************************
>   Transfer some data (n bytes) between two file_struct's.
>  ****************************************************************************/
> -- 
> 2.21.0
> 


