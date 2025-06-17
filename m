Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C59DADE543
	for <lists+samba-technical@lfdr.de>; Wed, 18 Jun 2025 10:10:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=mgKx+Rhufud+xyv84CkP5jQpT6pJPjmkPqgzNgofRZY=; b=pK/u4hs9CYiK+hXK5ygRP8GFJ4
	lo6J6SZBWr02x3GdCHJTkPXQGbvqrgSIHdLVY5XjCWeBf39meUCIHc0uA0xidDKgNKbkf8vxkI8RO
	YjQSLgVfGHrZVdYPDB01KXrYAv3dMKlm+Cl3H4c37SsW6FN4bKwywVewwWS+M+QQXa1Utdh+INuKs
	XhyEyIs79s+baFvcGAVX0enWMg7PliqVRGzMMrRhAAkLMYnQcFquMPVHw8OKrsTGqM574IiIT58Jp
	sxPBi7lnEKgmhuXWcN3QY8s/CmtI22kX81FC7NhMjlWlt0u+yTwxjZaUryDNqVEAYjEjm6uCCaIMU
	AB0j6xzQ==;
Received: from ip6-localhost ([::1]:22672 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uRnqd-007KfC-Qu; Wed, 18 Jun 2025 08:08:43 +0000
Received: from smtp-out1.suse.de ([195.135.223.130]:58520) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uRTTl-007HcT-2v
 for samba-technical@lists.samba.org; Tue, 17 Jun 2025 10:23:48 +0000
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id C3955211C4;
 Tue, 17 Jun 2025 10:23:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1750155821; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mgKx+Rhufud+xyv84CkP5jQpT6pJPjmkPqgzNgofRZY=;
 b=0vtO1r83WRAKyen/sl74pMYrwEeINd06w3kouKw4XtQ9dQRPADLJ6CM5JYXunqVAkAUnGT
 9C9SJGFB86ITz6p0vbKmlWMotVPtFVkgbtgpanOBzpBUJ5FoTXmS1oeJ2zbY4BlWg4Kjqe
 3fQ7eXKJ56YE6xUi6J3Ype8YfurulIE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1750155821;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mgKx+Rhufud+xyv84CkP5jQpT6pJPjmkPqgzNgofRZY=;
 b=MFXM112gzLzycqzUCeXn0pDIkj1ZAFT7HH7Jay35zGiLu/sJ0s7oopW+e62NvCfn15BsWZ
 ycahuii9UnS1A+BA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1750155821; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mgKx+Rhufud+xyv84CkP5jQpT6pJPjmkPqgzNgofRZY=;
 b=0vtO1r83WRAKyen/sl74pMYrwEeINd06w3kouKw4XtQ9dQRPADLJ6CM5JYXunqVAkAUnGT
 9C9SJGFB86ITz6p0vbKmlWMotVPtFVkgbtgpanOBzpBUJ5FoTXmS1oeJ2zbY4BlWg4Kjqe
 3fQ7eXKJ56YE6xUi6J3Ype8YfurulIE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1750155821;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mgKx+Rhufud+xyv84CkP5jQpT6pJPjmkPqgzNgofRZY=;
 b=MFXM112gzLzycqzUCeXn0pDIkj1ZAFT7HH7Jay35zGiLu/sJ0s7oopW+e62NvCfn15BsWZ
 ycahuii9UnS1A+BA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A59B613A69;
 Tue, 17 Jun 2025 10:23:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 9gFqKC1CUWhcHAAAD6G6ig
 (envelope-from <jack@suse.cz>); Tue, 17 Jun 2025 10:23:41 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
 id 5CF2BA29F0; Tue, 17 Jun 2025 12:23:41 +0200 (CEST)
Date: Tue, 17 Jun 2025 12:23:41 +0200
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Subject: Re: [PATCH 09/10] fs: convert most other generic_file_*mmap() users
 to .mmap_prepare()
Message-ID: <gexpfonlstqrggxbwxlorn7c6qvt42e2dof6lahipfyfecgfru@vexc23jbaxwc>
References: <cover.1750099179.git.lorenzo.stoakes@oracle.com>
 <08db85970d89b17a995d2cffae96fb4cc462377f.1750099179.git.lorenzo.stoakes@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <08db85970d89b17a995d2cffae96fb4cc462377f.1750099179.git.lorenzo.stoakes@oracle.com>
X-Spam-Flag: NO
X-Spam-Score: -0.30
X-Spamd-Result: default: False [-0.30 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 FORGED_RECIPIENTS(2.00)[m:akpm@linux-foundation.org, m:axboe@kernel.dk,
 m:rodrigo.vivi@intel.com, m:airlied@gmail.com, m:simona@ffwll.ch,
 m:ericvh@kernel.org, m:lucho@ionkov.net, m:asmadeus@codewreck.org,
 m:linux_oss@crudebyte.com, m:marc.dionne@auristor.com,
 m:viro@zeniv.linux.org.uk, m:brauner@kernel.org, m:bcrl@kvack.org,
 m:amir73il@gmail.com, m:aivazian.tigran@gmail.com, m:kees@kernel.org,
 m:clm@fb.com, m:idryomov@gmail.com, m:jaharkes@cs.cmu.edu, m:coda@cs.cmu.edu,
 m:xiang@kernel.org, m:chao@kernel.org, m:zbestahu@gmail.com,
 m:dhavale@google.com, m:lihongbo22@huawei.com, m:linkinjeon@kernel.org,
 m:adilger.kernel@dilger.ca, m:jaegeuk@kernel.org, m:slava@dubeyko.com,
 m:frank.li@vivo.com, m:anton.ivanov@cambridgegreys.com,
 m:mikulas@artax.karlin.mff.cuni.cz, m:dwmw2@infradead.org, m:shaggy@kernel.org,
 m:trondmy@kernel.org, m:anna@kernel.org, m:konishi.ryusuke@gmail.com,
 m:mark@fasheh.com, m:jlbec@evilplan.org, m:me@bobcopeland.com,
 m:ronniesahlberg@gmail.com, m:chengzhihao1@huawei.com, m:cem@kernel.org,
 m:dlemoal@kernel.or
 g,m:naohiro.aota@wdc.com,m:jth@kernel.org,m:dan.j.williams@intel.com,m:willy@infradead.org,m:jannh@google.com,m:linux-aio@kvack.org,m:linux-mm@kvack.org,m:codalist@coda.cs.cmu.edu,s:linux-mtd@lists.infradead.org,s:linux-um@lists.infradead.org,s:ntfs3@lists.linux.dev,s:nvdimm@lists.linux.dev,s:ocfs2-devel@lists.linux.dev,s:devel@lists.orangefs.org,s:samba-technical@lists.samba.org,s:jfs-discussion@lists.sourceforge.net,s:linux-f2fs-devel@lists.sourceforge.net,s:linux-karma-devel@lists.sourceforge.net];
 SUSPICIOUS_RECIPS(1.50)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 MID_RHS_NOT_FQDN(0.50)[]; NEURAL_HAM_SHORT(-0.20)[-1.000];
 MIME_GOOD(-0.10)[text/plain]; TO_DN_SOME(0.00)[];
 TAGGED_RCPT(0.00)[]; MIME_TRACE(0.00)[0:+];
 RCVD_VIA_SMTP_AUTH(0.00)[]; MISSING_XM_UA(0.00)[];
 ARC_NA(0.00)[];
 FREEMAIL_CC(0.00)[linux-foundation.org,oracle.com,kernel.dk,linux.intel.com,intel.com,ursulin.net,gmail.com,ffwll.ch,kernel.org,ionkov.net,codewreck.org,crudebyte.com,suse.com,redhat.com,auristor.com,zeniv.linux.org.uk,suse.cz,kvack.org,szeredi.hu,linux.dev,fb.com,toxicpanda.com,cs.cmu.edu,tyhicks.com,linux.alibaba.com,google.com,huawei.com,samsung.com,sony.com,mit.edu,dilger.ca,mail.parknet.co.jp,dubeyko.com,physik.fu-berlin.de,vivo.com,nod.at,cambridgegreys.com,sipsolutions.net,artax.karlin.mff.cuni.cz,infradead.org,paragon-software.com,fasheh.com,evilplan.org,bobcopeland.com,omnibond.com,samba.org,manguebit.org,microsoft.com,talpey.com,wdc.com,suse.de,vger.kernel.org,lists.freedesktop.org,lists.linux.dev,lists.infradead.org,coda.cs.cmu.edu,lists.ozlabs.org,lists.sourceforge.net,lists.orangefs.org,lists.samba.org];
 RCVD_COUNT_THREE(0.00)[3];
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 R_RATELIMIT(0.00)[to_ip_from(RLb58ib84xst5oy51ju4zaburj)];
 TO_MATCH_ENVRCPT_SOME(0.00)[]; RCPT_COUNT_GT_50(0.00)[113];
 RCVD_TLS_LAST(0.00)[]; FUZZY_BLOCKED(0.00)[rspamd.com];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email]
X-Mailman-Approved-At: Wed, 18 Jun 2025 08:08:38 +0000
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
From: Jan Kara via samba-technical <samba-technical@lists.samba.org>
Reply-To: Jan Kara <jack@suse.cz>
Cc: Latchesar Ionkov <lucho@ionkov.net>, nvdimm@lists.linux.dev,
 Paulo Alcantara <pc@manguebit.org>, dri-devel@lists.freedesktop.org,
 ceph-devel@vger.kernel.org, Mike Marshall <hubcap@omnibond.com>,
 linux-xfs@vger.kernel.org, Tyler Hicks <code@tyhicks.com>,
 devel@lists.orangefs.org, Shyam Prasad N <sprasad@microsoft.com>,
 Jan Harkes <jaharkes@cs.cmu.edu>, linux-um@lists.infradead.org,
 Joel Becker <jlbec@evilplan.org>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Eric Van Hensbergen <ericvh@kernel.org>,
 Zhihao Cheng <chengzhihao1@huawei.com>, Christian Brauner <brauner@kernel.org>,
 linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Trond Myklebust <trondmy@kernel.org>, Dave Kleikamp <shaggy@kernel.org>,
 Sandeep Dhavale <dhavale@google.com>, Simona Vetter <simona@ffwll.ch>,
 linux-cifs@vger.kernel.org, linux-nilfs@vger.kernel.org,
 codalist@coda.cs.cmu.edu, Namjae Jeon <linkinjeon@kernel.org>,
 ecryptfs@vger.kernel.org, Yangtao Li <frank.li@vivo.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, ocfs2-devel@lists.linux.dev,
 Pedro Falcato <pfalcato@suse.de>, OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>,
 linux-block@vger.kernel.org, Theodore Ts'o <tytso@mit.edu>,
 linux-f2fs-devel@lists.sourceforge.net, Hongbo Li <lihongbo22@huawei.com>,
 Anna Schumaker <anna@kernel.org>, Martin Brandenburg <martin@omnibond.com>,
 Kees Cook <kees@kernel.org>, Yuezhang Mo <yuezhang.mo@sony.com>,
 Carlos Maiolino <cem@kernel.org>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Chris Mason <clm@fb.com>,
 linux-mtd@lists.infradead.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 Marc Dionne <marc.dionne@auristor.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 linux-afs@lists.infradead.org, Naohiro Aota <naohiro.aota@wdc.com>,
 Miklos Szeredi <miklos@szeredi.hu>, Matthew Wilcox <willy@infradead.org>,
 coda@cs.cmu.edu, Viacheslav Dubeyko <slava@dubeyko.com>,
 Ilya Dryomov <idryomov@gmail.com>, linux-ext4@vger.kernel.org,
 Amir Goldstein <amir73il@gmail.com>, intel-gfx@lists.freedesktop.org,
 Damien Le Moal <dlemoal@kernel.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Dan Williams <dan.j.williams@intel.com>, Gao Xiang <xiang@kernel.org>,
 David Howells <dhowells@redhat.com>, linux-nfs@vger.kernel.org,
 linux-mm@kvack.org, samba-technical@lists.samba.org,
 Steve French <sfrench@samba.org>, ntfs3@lists.linux.dev,
 linux-erofs@lists.ozlabs.org, jfs-discussion@lists.sourceforge.net,
 Jan Kara <jack@suse.cz>, linux-aio@kvack.org,
 Dominique Martinet <asmadeus@codewreck.org>,
 Christian Schoenebeck <linux_oss@crudebyte.com>,
 Bob Copeland <me@bobcopeland.com>,
 Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
 Joseph Qi <joseph.qi@linux.alibaba.com>,
 Andreas Dilger <adilger.kernel@dilger.ca>,
 Mikulas Patocka <mikulas@artax.karlin.mff.cuni.cz>,
 David Airlie <airlied@gmail.com>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>, Yue Hu <zbestahu@gmail.com>,
 Richard Weinberger <richard@nod.at>, Mark Fasheh <mark@fasheh.com>,
 linux-bcachefs@vger.kernel.org, Jann Horn <jannh@google.com>,
 Chao Yu <chao@kernel.org>, Josef Bacik <josef@toxicpanda.com>,
 "Liam R . Howlett" <Liam.Howlett@oracle.com>, Tom Talpey <tom@talpey.com>,
 Hans de Goede <hdegoede@redhat.com>, Bharath SM <bharathsm@microsoft.com>,
 "Tigran A . Aivazian" <aivazian.tigran@gmail.com>,
 David Sterba <dsterba@suse.com>, Xiubo Li <xiubli@redhat.com>,
 Ryusuke Konishi <konishi.ryusuke@gmail.com>, Vlastimil Babka <vbabka@suse.cz>,
 Jens Axboe <axboe@kernel.dk>, Sungjong Seo <sj1557.seo@samsung.com>,
 v9fs@lists.linux.dev, Kent Overstreet <kent.overstreet@linux.dev>,
 linux-unionfs@vger.kernel.org, Benjamin LaHaise <bcrl@kvack.org>,
 Jeffle Xu <jefflexu@linux.alibaba.com>,
 Johannes Berg <johannes@sipsolutions.net>, Johannes Thumshirn <jth@kernel.org>,
 David Woodhouse <dwmw2@infradead.org>, linux-karma-devel@lists.sourceforge.net,
 linux-btrfs@vger.kernel.org, Alexander Viro <viro@zeniv.linux.org.uk>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Mon 16-06-25 20:33:28, Lorenzo Stoakes wrote:
> Update nearly all generic_file_mmap() and generic_file_readonly_mmap()
> callers to use generic_file_mmap_prepare() and
> generic_file_readonly_mmap_prepare() respectively.
> 
> We update blkdev, 9p, afs, erofs, ext2, nfs, ntfs3, smb, ubifs and vboxsf
> file systems this way.
> 
> Remaining users we cannot yet update are ecryptfs, fuse and cramfs. The
> former two are nested file systems that must support any underlying file
> ssytem, and cramfs inserts a mixed mapping which currently requires a VMA.
> 
> Once all file systems have been converted to mmap_prepare(), we can then
> update nested file systems.
> 
> Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>

Overall the patch looks good. Just a couple of notes regarding pointless
local variable being created...

> ---
>  block/fops.c           |  9 +++++----
>  fs/9p/vfs_file.c       | 11 ++++++-----
>  fs/afs/file.c          | 11 ++++++-----
>  fs/erofs/data.c        | 16 +++++++++-------
>  fs/ext2/file.c         | 12 +++++++-----
>  fs/nfs/file.c          | 13 +++++++------
>  fs/nfs/internal.h      |  2 +-
>  fs/nfs/nfs4file.c      |  2 +-
>  fs/ntfs3/file.c        | 15 ++++++++-------
>  fs/smb/client/cifsfs.c | 12 ++++++------
>  fs/smb/client/cifsfs.h |  4 ++--
>  fs/smb/client/file.c   | 14 ++++++++------
>  fs/ubifs/file.c        |  8 ++++----
>  fs/vboxsf/file.c       |  8 ++++----
>  14 files changed, 74 insertions(+), 63 deletions(-)
> 
> diff --git a/block/fops.c b/block/fops.c
> index 1309861d4c2c..5a0ebc81e489 100644
> --- a/block/fops.c
> +++ b/block/fops.c
> @@ -911,14 +911,15 @@ static long blkdev_fallocate(struct file *file, int mode, loff_t start,
>  	return error;
>  }
>  
> -static int blkdev_mmap(struct file *file, struct vm_area_struct *vma)
> +static int blkdev_mmap_prepare(struct vm_area_desc *desc)
>  {
> +	struct file *file = desc->file;
>  	struct inode *bd_inode = bdev_file_inode(file);

I guess no need to create 'file' variable here since it has only one use in
the line above...

>  
>  	if (bdev_read_only(I_BDEV(bd_inode)))
> -		return generic_file_readonly_mmap(file, vma);
> +		return generic_file_readonly_mmap_prepare(desc);
>  
> -	return generic_file_mmap(file, vma);
> +	return generic_file_mmap_prepare(desc);
>  }
>  
>  const struct file_operations def_blk_fops = {

...

> @@ -492,16 +492,17 @@ static void afs_drop_open_mmap(struct afs_vnode *vnode)
>  /*
>   * Handle setting up a memory mapping on an AFS file.
>   */
> -static int afs_file_mmap(struct file *file, struct vm_area_struct *vma)
> +static int afs_file_mmap_prepare(struct vm_area_desc *desc)
>  {
> +	struct file *file = desc->file;
>  	struct afs_vnode *vnode = AFS_FS_I(file_inode(file));

Same comment about pointless local variable here as well.

>  	int ret;
>  
>  	afs_add_open_mmap(vnode);
>  
> -	ret = generic_file_mmap(file, vma);
> +	ret = generic_file_mmap_prepare(desc);
>  	if (ret == 0)
> -		vma->vm_ops = &afs_vm_ops;
> +		desc->vm_ops = &afs_vm_ops;
>  	else
>  		afs_drop_open_mmap(vnode);
>  	return ret;
> diff --git a/fs/erofs/data.c b/fs/erofs/data.c
> index 6a329c329f43..52dfd1a44c43 100644
> --- a/fs/erofs/data.c
> +++ b/fs/erofs/data.c
> @@ -409,20 +409,22 @@ static const struct vm_operations_struct erofs_dax_vm_ops = {
>  	.huge_fault	= erofs_dax_huge_fault,
>  };
>  
> -static int erofs_file_mmap(struct file *file, struct vm_area_struct *vma)
> +static int erofs_file_mmap_prepare(struct vm_area_desc *desc)
>  {
> +	struct file *file = desc->file;
> +
>  	if (!IS_DAX(file_inode(file)))

And here...

> -		return generic_file_readonly_mmap(file, vma);
> +		return generic_file_readonly_mmap_prepare(desc);
>  
> -	if ((vma->vm_flags & VM_SHARED) && (vma->vm_flags & VM_MAYWRITE))
> +	if ((desc->vm_flags & VM_SHARED) && (desc->vm_flags & VM_MAYWRITE))
>  		return -EINVAL;
>  
> -	vma->vm_ops = &erofs_dax_vm_ops;
> -	vm_flags_set(vma, VM_HUGEPAGE);
> +	desc->vm_ops = &erofs_dax_vm_ops;
> +	desc->vm_flags |= VM_HUGEPAGE;
>  	return 0;
>  }
...
> diff --git a/fs/smb/client/file.c b/fs/smb/client/file.c
> index 9835672267d2..2ed5173cfa73 100644
> --- a/fs/smb/client/file.c
> +++ b/fs/smb/client/file.c
> @@ -2995,8 +2995,9 @@ static const struct vm_operations_struct cifs_file_vm_ops = {
>  	.page_mkwrite = cifs_page_mkwrite,
>  };
>  
> -int cifs_file_strict_mmap(struct file *file, struct vm_area_struct *vma)
> +int cifs_file_strict_mmap_prepare(struct vm_area_desc *desc)
>  {
> +	struct file *file = desc->file;
>  	int xid, rc = 0;
>  	struct inode *inode = file_inode(file);

Again pointless local variable 'file' here.

>  
> @@ -3005,16 +3006,17 @@ int cifs_file_strict_mmap(struct file *file, struct vm_area_struct *vma)
>  	if (!CIFS_CACHE_READ(CIFS_I(inode)))
>  		rc = cifs_zap_mapping(inode);
>  	if (!rc)
> -		rc = generic_file_mmap(file, vma);
> +		rc = generic_file_mmap_prepare(desc);
>  	if (!rc)
> -		vma->vm_ops = &cifs_file_vm_ops;
> +		desc->vm_ops = &cifs_file_vm_ops;
>  
>  	free_xid(xid);
>  	return rc;
>  }
>  
> -int cifs_file_mmap(struct file *file, struct vm_area_struct *vma)
> +int cifs_file_mmap_prepare(struct vm_area_desc *desc)
>  {
> +	struct file *file = desc->file;
>  	int rc, xid;

And here (the only use is in cifs_revalidate_file(file)).

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

