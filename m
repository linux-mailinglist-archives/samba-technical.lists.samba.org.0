Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A04E86233EB
	for <lists+samba-technical@lfdr.de>; Wed,  9 Nov 2022 20:50:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=+h9TeuXidQ3k3GadIkmIwetO2wxfA+tn4yVL6CUdhTE=; b=gGHkuN/uFh1ciNtxNe2EG2EcIx
	O48TqXMAd6+sblvPQnGOaQNpsOUFpUtss0O3qTF0p9zgXix8+Z6zhnyk1y9NNm4jMVI4g5Jx3saRc
	+83oq/GlLQxeYkKGKsyQ149GXXuv9xHOUoOIaFGG+gLlMA2MDebxDtWWP9l+UQB/X87kiWqrpzRpf
	eQYP9UUNPL22y7SlmY11I18YXvgTsRNhLqu0tPILThdxJ/o0NN6CBXGLzTtxHr2y04QpfNNTnZXUQ
	RvO0w2kW+gR25Hw9lS5JBZtjyR4671y+Y9gdrj4zjRAeuZJxN7RI76/ciJcov0/3/ivSCR4wSQPRK
	2bdpVkJw==;
Received: from ip6-localhost ([::1]:54728 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1osr5i-00Bt97-PI; Wed, 09 Nov 2022 19:50:30 +0000
Received: from mail-vs1-xe36.google.com ([2607:f8b0:4864:20::e36]:37503) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1osr5b-00Bt8y-CU
 for samba-technical@lists.samba.org; Wed, 09 Nov 2022 19:50:27 +0000
Received: by mail-vs1-xe36.google.com with SMTP id z189so17908150vsb.4
 for <samba-technical@lists.samba.org>; Wed, 09 Nov 2022 11:50:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=+h9TeuXidQ3k3GadIkmIwetO2wxfA+tn4yVL6CUdhTE=;
 b=TAF9aLLERtUQpMOOENrH8ApjEVl2youzkshjHlbAlmt9IPId5J9Kq/A+vWpzx4uI37
 IxbWwY35T60bgcWGT4g3czY4yJ67CrXW3NISnBBOZ7WDxfhSr3y+3MAm8UZbzbfWbDSi
 Rvnu0N2g2Mjs9c0gGbk6CoH51uBoe1ezxePAKeoqhwYn7hD8pyFPjO4vB74p5rmRH/mg
 +DHB0Uo9uKMD/nEjCmh6PHwMgp71NNNuZGmvyLQEKrav6vlt4ldekPerHmRGCJBNyD4x
 46SntTv7yib2/aNQcreX8j7vZiCD6SiRsaAWExH1Qmsd94SU3wj3Pd+yAF3rS1biDX+x
 Q5ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+h9TeuXidQ3k3GadIkmIwetO2wxfA+tn4yVL6CUdhTE=;
 b=tB/IXnMfI2JK+wX73fWXNVv6wwvu7HqVD4+aBWP8EY0mnwgLwVb3yzRe4ka0sG5rQZ
 nfMCqu+X4JUmwqr20fmo1pO+3KxsJkWFbJURF9wEbeFgn2rOkwPVA2Iv7iqInktxmwtw
 UKe+T5nNYk9BIYSuULrbLYncF2tfe7eIXEBukkoH0hgYSKUdfsZIDeSZJjI2C5qziZ9l
 RuItpds4nH023ELolKLvjsJH+cyc5fDC6oqewkJfqobm1hIuR2em4muSVlD4OrKq1WTB
 qL5vuHqWgCpeSCfz3W7D3gj+tg37DAkrM1l6SbMOw4AdXO+B4E6fAPFFqQFbi1hPS1VE
 sF5Q==
X-Gm-Message-State: ACrzQf3nCIWVU4i7Uyl67pEVPQ1c8Y7uDhd0B7ZVKyAIvA/lxV3oYANh
 yPdd4YL37K798gyEFfFLlRk81arBodKHk5rBxfA=
X-Google-Smtp-Source: AMsMyM6wRN+ImRqI49lqp6pnZC2Pbrx8v/hIDBjOjnnfTn231cAWSc1OfwYkSDc7E8/cMiaYAuPnk/I620eh8BOGWTM=
X-Received: by 2002:a67:edc9:0:b0:3a9:ee9c:f9c4 with SMTP id
 e9-20020a67edc9000000b003a9ee9cf9c4mr31484653vsp.71.1668023421217; Wed, 09
 Nov 2022 11:50:21 -0800 (PST)
MIME-Version: 1.0
References: <CAH2r5mtc6rHC=zfWCjmGMex0qJrYKeuAcryW95-ru0KyZsaqpA@mail.gmail.com>
 <Y2molp4pVGNO+kaw@jeremy-acer> <Y2n7lENy0jrUg7XD@infradead.org>
 <Y2qXLNM5xvxZHuLQ@jeremy-acer>
 <CAOQ4uxgyXtr6DU-eAP+kR1a7NsS-zDhXi5-0BJ7i=-erLa3-kg@mail.gmail.com>
 <Y2vzinRPFEBZyACg@jeremy-acer> <Y2v1zQbnPoqg+0aj@jeremy-acer>
In-Reply-To: <Y2v1zQbnPoqg+0aj@jeremy-acer>
Date: Wed, 9 Nov 2022 21:50:09 +0200
Message-ID: <CAOQ4uxiDrtgrMeY_a0sq15PVNkjBJuT9STcBP7UuzZzdT8z4sw@mail.gmail.com>
Subject: Re: reflink support and Samba running over XFS
To: Jeremy Allison <jra@samba.org>
Content-Type: text/plain; charset="UTF-8"
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
From: Amir Goldstein via samba-technical <samba-technical@lists.samba.org>
Reply-To: Amir Goldstein <amir73il@gmail.com>
Cc: CIFS <linux-cifs@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>, metze@samba.org,
 Steve French <smfrench@gmail.com>, vl@samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wed, Nov 9, 2022 at 8:47 PM Jeremy Allison <jra@samba.org> wrote:
>
> On Wed, Nov 09, 2022 at 10:38:02AM -0800, Jeremy Allison via samba-technical wrote:
> >On Wed, Nov 09, 2022 at 11:32:30AM +0200, Amir Goldstein wrote:
> >>On Tue, Nov 8, 2022 at 7:53 PM Jeremy Allison via samba-technical
> >><samba-technical@lists.samba.org> wrote:
> >>>
> >>>On Mon, Nov 07, 2022 at 10:47:48PM -0800, Christoph Hellwig wrote:
> >>>>On Mon, Nov 07, 2022 at 04:53:42PM -0800, Jeremy Allison via samba-technical wrote:
> >>>>> ret = ioctl(fsp_get_io_fd(dest_fsp), BTRFS_IOC_CLONE_RANGE, &cr_args);
> >>>>>
> >>>>> what ioctls are used for this in XFS ?
> >>>>>
> >>>>> We'd need a VFS module that implements them for XFS.
> >>>>
> >>>>That ioctl is now implemented in the Linux VFS and supported by btrfs,
> >>>>ocfs2, xfs, nfs (v4.2), cifs and overlayfs.
> >>>
> >>>I'm assuming it's this:
> >>>
> >>>https://man7.org/linux/man-pages/man2/ioctl_ficlonerange.2.html
> >>>
> >>>Yeah ? I'll write some test code and see if I can get it
> >>>into the vfs_default code.
> >>>
> >>
> >>Looks like this was already discussed during the work on generic
> >>implementation of FSCTL_SRV_COPYCHUNK:
> >>https://bugzilla.samba.org/show_bug.cgi?id=12033#c3
> >>
> >>Forgotten?
> >
> >Yep :-).
> >
> >>Left for later?
> >
> >So looks like we do copy_file_range(), but not CLONE_RANGE,
> >or rather CLONE_RANGE only in btrfs.
> >
> >So the code change needed is to move the logic in vfs_btrfs.c
> >into vfs_default.c, and change the call in vfs_btrfs.c:btrfs_offload_write_send()
> >to SMB_VFS_NEXT_OFFLOAD_WRITE_SEND() to call the old fallback code
> >inside vfs_default.c (vfswrap_offload_write_send()).
>
> Although looking at the current Linux kernel I find inside:
>
> ssize_t vfs_copy_file_range(struct file *file_in, loff_t pos_in,
>                             struct file *file_out, loff_t pos_out,
>                             size_t len, unsigned int flags)
> {
>
> https://github.com/torvalds/linux/blob/0adc313c4f20639f7e235b8d6719d96a2024cf91/fs/read_write.c#L1506
>
>         /*
>          * Try cloning first, this is supported by more file systems, and
>          * more efficient if both clone and copy are supported (e.g. NFS).
>          */
>         if (file_in->f_op->remap_file_range &&
>             file_inode(file_in)->i_sb == file_inode(file_out)->i_sb) {
>                 loff_t cloned;
>
>                 cloned = file_in->f_op->remap_file_range(file_in, pos_in,
>                                 file_out, pos_out,
>                                 min_t(loff_t, MAX_RW_COUNT, len),
>                                 REMAP_FILE_CAN_SHORTEN);
>                 if (cloned > 0) {
>                         ret = cloned;
>
> and looking at the code supporting int ioctl(int dest_fd, FICLONERANGE, struct file_clone_range *arg);
> we have:
>
> loff_t do_clone_file_range(struct file *file_in, loff_t pos_in,
>                            struct file *file_out, loff_t pos_out,
>                            loff_t len, unsigned int remap_flags)
> ...
>         ret = file_in->f_op->remap_file_range(file_in, pos_in,
>                         file_out, pos_out, len, remap_flags);
>
> So it *looks* like the copy_file_range() syscall will internally
> call the equivalent of FICLONERANGE if the underlying file
> system supports it.
>

It's true.
Unless you have some SMB command that requires the clone to be
a clone (what is VFS_COPY_CHUNK_FL_MUST_CLONE in the
referred comment?)
because currently there is no flag that can be passed to
copy_file_range() to request only clone.

Thanks,
Amir.

> So maybe the right fix is to remove the FICLONERANGE specific
> code from our vfs_btrfs.c and just always use copy_file_range().
>
> Any comments from other Samba Team members ?
>
> Jeremy.

