Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 326B76232DC
	for <lists+samba-technical@lfdr.de>; Wed,  9 Nov 2022 19:47:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=rBbR3q5RjKpmgtaSd6E4JfI2QhqXJ3WwoAZpBNdiyGU=; b=RJUyxW/IMjKuoX0b4aSrzgqDqJ
	PxOZOEgFDwCbIwyRsC/PWorYtoLz7DtDkYAkIneeWPXnTJ3KbPNdePQiOYR4fBCC2nbLMExkyjuwC
	fatH869aIvZkc+ut10t5PgrTunPXPXKgv9hKw15Me4sUi8iKdjtTfecZ9vG4IhQ+lgtIDdA98cYhv
	6fOOhbbmq7yrCpPlwYsU73KJrqHFFYwiA8NSNSS6uZL8nOl3Th0x+fZFnE9bPdopbKFvRiKr5Jflp
	TvxvPVTIvBvFk+5bouXYgYHOgYP2rEQVhdEXCvihdNq7mD3dPbzXZvZU4xM0oaDHkUGw/7xjMUvax
	0zllGBpw==;
Received: from ip6-localhost ([::1]:26314 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1osq76-00BsRL-A5; Wed, 09 Nov 2022 18:47:52 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:37138) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1osq70-00BsRC-PZ
 for samba-technical@lists.samba.org; Wed, 09 Nov 2022 18:47:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=rBbR3q5RjKpmgtaSd6E4JfI2QhqXJ3WwoAZpBNdiyGU=; b=n5PfLCV8F/7VjuxhurPIh51+MJ
 +RzS2e5jCjZ5i4ZeFyhpnPU6priBRxCSBZ7We4z0L//xWaU0UAv5k2qxmlPixYRavXTalXGbGrLbM
 MT2TjTdOXR6o5zfBRkCjT4fGfZOmOcBkDsqAcG3qoZEaecO76u5j+GGN9weAh52Y2Ia+cat1tcslq
 Szy/Hy3xPHG1UXPYLwXRUwaFmm4qHMUa7S2aCGcKSA9jbHpjAlnMzL+HHWwJwomzcZvlMMBt8c+oH
 D5qlxw7dA6aOXAcKV232j0djuEDhgcfcytMbCWtbImt5C1TBQ89EBlnLD5KFWlwawJAwX9DjpH5c1
 d04djKSknw7MBEcpbwfTXwMIV/gH/prVWOp/dH/mRb0CS6/Jl3fafbXkS6M9rFmWDCamfM0PMNXe5
 7G6oNx3DfYZNruTonj8A6nzrCRJWHnKSdy90+2Rix6+Ex71ZRDmEEXIjz/kvKpppgggBOWg91SrTn
 MIB8d7nVyqs+m364VrmFx9hr;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1osq6y-007tAF-Fj; Wed, 09 Nov 2022 18:47:44 +0000
Date: Wed, 9 Nov 2022 10:47:41 -0800
To: Amir Goldstein <amir73il@gmail.com>, Steve French <smfrench@gmail.com>,
 samba-technical <samba-technical@lists.samba.org>,
 CIFS <linux-cifs@vger.kernel.org>
Subject: Re: reflink support and Samba running over XFS
Message-ID: <Y2v1zQbnPoqg+0aj@jeremy-acer>
References: <CAH2r5mtc6rHC=zfWCjmGMex0qJrYKeuAcryW95-ru0KyZsaqpA@mail.gmail.com>
 <Y2molp4pVGNO+kaw@jeremy-acer> <Y2n7lENy0jrUg7XD@infradead.org>
 <Y2qXLNM5xvxZHuLQ@jeremy-acer>
 <CAOQ4uxgyXtr6DU-eAP+kR1a7NsS-zDhXi5-0BJ7i=-erLa3-kg@mail.gmail.com>
 <Y2vzinRPFEBZyACg@jeremy-acer>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <Y2vzinRPFEBZyACg@jeremy-acer>
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
Cc: vl@samba.org, metze@samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wed, Nov 09, 2022 at 10:38:02AM -0800, Jeremy Allison via samba-technical wrote:
>On Wed, Nov 09, 2022 at 11:32:30AM +0200, Amir Goldstein wrote:
>>On Tue, Nov 8, 2022 at 7:53 PM Jeremy Allison via samba-technical
>><samba-technical@lists.samba.org> wrote:
>>>
>>>On Mon, Nov 07, 2022 at 10:47:48PM -0800, Christoph Hellwig wrote:
>>>>On Mon, Nov 07, 2022 at 04:53:42PM -0800, Jeremy Allison via samba-technical wrote:
>>>>> ret = ioctl(fsp_get_io_fd(dest_fsp), BTRFS_IOC_CLONE_RANGE, &cr_args);
>>>>>
>>>>> what ioctls are used for this in XFS ?
>>>>>
>>>>> We'd need a VFS module that implements them for XFS.
>>>>
>>>>That ioctl is now implemented in the Linux VFS and supported by btrfs,
>>>>ocfs2, xfs, nfs (v4.2), cifs and overlayfs.
>>>
>>>I'm assuming it's this:
>>>
>>>https://man7.org/linux/man-pages/man2/ioctl_ficlonerange.2.html
>>>
>>>Yeah ? I'll write some test code and see if I can get it
>>>into the vfs_default code.
>>>
>>
>>Looks like this was already discussed during the work on generic
>>implementation of FSCTL_SRV_COPYCHUNK:
>>https://bugzilla.samba.org/show_bug.cgi?id=12033#c3
>>
>>Forgotten?
>
>Yep :-).
>
>>Left for later?
>
>So looks like we do copy_file_range(), but not CLONE_RANGE,
>or rather CLONE_RANGE only in btrfs.
>
>So the code change needed is to move the logic in vfs_btrfs.c
>into vfs_default.c, and change the call in vfs_btrfs.c:btrfs_offload_write_send()
>to SMB_VFS_NEXT_OFFLOAD_WRITE_SEND() to call the old fallback code
>inside vfs_default.c (vfswrap_offload_write_send()).

Although looking at the current Linux kernel I find inside:

ssize_t vfs_copy_file_range(struct file *file_in, loff_t pos_in,
			    struct file *file_out, loff_t pos_out,
			    size_t len, unsigned int flags)
{

https://github.com/torvalds/linux/blob/0adc313c4f20639f7e235b8d6719d96a2024cf91/fs/read_write.c#L1506

	/*
	 * Try cloning first, this is supported by more file systems, and
	 * more efficient if both clone and copy are supported (e.g. NFS).
	 */
	if (file_in->f_op->remap_file_range &&
	    file_inode(file_in)->i_sb == file_inode(file_out)->i_sb) {
		loff_t cloned;

		cloned = file_in->f_op->remap_file_range(file_in, pos_in,
				file_out, pos_out,
				min_t(loff_t, MAX_RW_COUNT, len),
				REMAP_FILE_CAN_SHORTEN);
		if (cloned > 0) {
			ret = cloned;

and looking at the code supporting int ioctl(int dest_fd, FICLONERANGE, struct file_clone_range *arg);
we have:

loff_t do_clone_file_range(struct file *file_in, loff_t pos_in,
			   struct file *file_out, loff_t pos_out,
			   loff_t len, unsigned int remap_flags)
...
	ret = file_in->f_op->remap_file_range(file_in, pos_in,
			file_out, pos_out, len, remap_flags);

So it *looks* like the copy_file_range() syscall will internally
call the equivalent of FICLONERANGE if the underlying file
system supports it.

So maybe the right fix is to remove the FICLONERANGE specific
code from our vfs_btrfs.c and just always use copy_file_range().

Any comments from other Samba Team members ?

Jeremy.

