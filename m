Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::443:1])
	by mail.lfdr.de (Postfix) with ESMTPS id E6BFE1A336
	for <lists+samba-technical@lfdr.de>; Fri, 10 May 2019 20:59:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=SXQwq/lxjEyftqRPeFlGKG5dzdIeLJ3dX9ac3uychuw=; b=2LhQtibJEKttqJ6Vjw5Y3pT/G5
	9nqiuNfBQPdfpH0PTCAfQnJYcldmZuWzv2vrE5X6LLW6pzKeHe1b6cUe+tNjnFGD5u8kLnQBICKyZ
	nntc+jfTcey0Jd9/C/QUz8avCuYJeEWT3I6xF1yhsZ/Sy35g2+9IdmmQDy+G5qjmGHeHIfT7yOEXz
	XptzfnL9BqzRDOxv1XLQfOH7CCpF3538V3b3Wd4aqbntstxepY8cQrS+2Lvt0eUHfovGU7r9zUE8R
	5DDIXAEtkFVSyJSVEuI/z5KNh7UywRZjlZL0ZDM76EDQIZoeTigy9ghNS+MW0C8iJyUVa4nk15wyv
	aO71JQ5g==;
Received: from localhost ([::1]:25826 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hPAjK-003AVb-4b; Fri, 10 May 2019 18:58:50 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::147:1]:23922) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hPAjF-003AVT-Oj
 for samba-technical@lists.samba.org; Fri, 10 May 2019 18:58:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Message-ID:Cc:To:From:Date;
 bh=SXQwq/lxjEyftqRPeFlGKG5dzdIeLJ3dX9ac3uychuw=; b=aVMkA2TDGI6lb+zkbKfxTuNMkd
 adY+5blc9tXouJo16kXY6cBH51ctAODQWH27kZydJtU/xUrVSDXvcps2yaGz3E3IyHXJdXLkZ1KXz
 IIoiulSpM1IapH5czFUb1b187WC10CPeR8yrOTK758aT1hPFmUWZVgw9ZLiL4ZkKohsk=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hPAjE-0007Tl-JG; Fri, 10 May 2019 18:58:44 +0000
Date: Fri, 10 May 2019 11:58:41 -0700
To: David Disseldorp <ddiss@suse.de>
Subject: Re: [PATCH] Samba: CephFS Snapshots VFS module
Message-ID: <20190510185841.GA54524@jra4>
References: <20190329184531.0c78e06b@echidna.suse.de>
 <20190508224740.GA21367@jra4> <20190510151601.798bee61@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190510151601.798bee61@suse.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-BeenThere: samba-technical@lists.samba.org
X-Mailman-Version: 2.1.23
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
Cc: "ceph-devel@vger.kernel.org" <ceph-devel@vger.kernel.org>,
 Jeremy Allison via samba-technical <samba-technical@lists.samba.org>,
 jra@samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, May 10, 2019 at 03:16:01PM +0200, David Disseldorp wrote:
> On Wed, 8 May 2019 15:47:40 -0700, Jeremy Allison via samba-technical wrote:
> 
> > On Fri, Mar 29, 2019 at 06:45:31PM +0100, David Disseldorp via samba-technical wrote:
> > > 
> > > The attached patchset adds a new ceph_snapshots Samba VFS module which
> > > handles snapshot enumeration and timewarp/@GMT token mapping.
> > > 
> > > Feedback appreciated.  
> > 
> > Mostly looks good - a few comments inline below. Hope you don't think
> > I'm being too picky, push back if so. I really want this functionality, just
> > want to make sure I can maintain it going forward.
> 
> Thanks for the review, Jeremy. I've attached a V2 patchset with the
> changes below squashed in...

A couple of comments left (sorry) - in:

+static int ceph_snap_gmt_convert(struct vfs_handle_struct *handle,
+                                    const char *name,
+                                    time_t timestamp,
+                                    char *_converted_buf,
+                                    size_t buflen)

You have:

+       /*
+        * found snapshot via parent. Append the child path component
+        * that was trimmed... +1 for path separator.
+        */
+       if (strlen(_converted_buf) + 1 + strlen(trimmed) >= buflen) {
+               return -EINVAL;
+       }
+       strncat(_converted_buf, "/", buflen);
+       strncat(_converted_buf, trimmed, buflen);

strncat is potentially dangerous here as it doesn't zero-terminate
by default if there's no space. I'd be much happier with strlcat instead.

Having said that, and looking at the arithmetic carefully I *think* it's
safe as you exit on >= buflen. But I had to think
about it carefully in the review. I don't want
other people to have to do that :-).

Can you change the comment to be:

+       /*
+        * found snapshot via parent. Append the child path component
+        * that was trimmed... +1 for path separator + 1 for null termination.
+        */
+       if (strlen(_converted_buf) + 1 + strlen(trimmed) + 1 > buflen) {
+               return -EINVAL;
+       }

Just to use the expected idion of '>' rather than the rarer
'>=' when checking string overruns.

So the result would be:

+       /*
+        * found snapshot via parent. Append the child path component
+        * that was trimmed... +1 for path separator + 1 for null termination.
+        */
+       if (strlen(_converted_buf) + 1 + strlen(trimmed) + 1 > buflen) {
+               return -EINVAL;
+       }
+       strlcat(_converted_buf, "/", buflen);
+       strlcat(_converted_buf, trimmed, buflen);

Second comment - in ceph_snap_gmt_opendir() you do:

+       dir = SMB_VFS_NEXT_OPENDIR(handle, conv_smb_fname, mask, attr);
+       saved_errno = errno;
+       TALLOC_FREE(conv_smb_fname);
+       errno = saved_errno;
+       return dir;

- NB, you're saving errno and restoring over the TALLOC_FREE(conv_smb_fname);
I think that's the right thing to do (you never know
if TALLOC_FREE might do a syscall to overwrite errno).

I think you also need to do this in:

ceph_snap_gmt_unlink()
ceph_snap_gmt_chmod()
ceph_snap_gmt_chown()
ceph_snap_gmt_chdir()
ceph_snap_gmt_ntimes()
ceph_snap_gmt_readlink()
ceph_snap_gmt_mknod()
ceph_snap_gmt_realpath()
ceph_snap_gmt_mkdir()
ceph_snap_gmt_rmdir()
ceph_snap_gmt_chflags()
ceph_snap_gmt_getxattr()
ceph_snap_gmt_listxattr()
ceph_snap_gmt_removexattr()
ceph_snap_gmt_setxattr()
ceph_snap_gmt_disk_free()
ceph_snap_gmt_get_quota()

for consistency.

Sorry for being picky, but I think we're getting there !

Jeremy.

