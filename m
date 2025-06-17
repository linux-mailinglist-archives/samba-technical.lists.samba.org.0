Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id BD768ADE544
	for <lists+samba-technical@lfdr.de>; Wed, 18 Jun 2025 10:10:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=yRL1pzyzWfZkEwjIrh5EPK0DyvqO4jGpH7nTdQIDJOU=; b=cRSKodhjzxGzoiIG5jQ3mdbJV0
	h7lFHS9OpVj7ktnulZsuTgS7yDUbCbVa4eFKUDj//+md2tAY1iZPAuzBnmPQNz4CzPg8013ob6bK5
	s22MBk3ioNIhU9PmYhnQscWTiJsPyAFixociHq1vk9V0uwUCyF4ilIFMEfeZ54s99Hqc9GcFYZM1L
	lIeYty5W6B1+Mk3juP8VOk+h0qAmjs0nGLhDzc0DozwceT9fJY+kocNc9h0KLUlfXhDBOyB5ztpGT
	GXgqbM++7/69Rn0yH97DfdgMhd2YoQPg5jjXodeW6MEOV6yaKqC2aqPdhktZ0xMk44VYCWdz2rGRJ
	tcwo9bLw==;
Received: from ip6-localhost ([::1]:22686 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uRnqe-007KfL-M5; Wed, 18 Jun 2025 08:08:44 +0000
Received: from smtp-out1.suse.de ([195.135.223.130]:59086) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uRTYD-007Hco-Dp
 for samba-technical@lists.samba.org; Tue, 17 Jun 2025 10:28:23 +0000
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id BECB9211C4;
 Tue, 17 Jun 2025 10:28:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1750156098; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=yRL1pzyzWfZkEwjIrh5EPK0DyvqO4jGpH7nTdQIDJOU=;
 b=WmjG5bytiy7I3a/BBLvW+VsIqotD5+JByi3+kYC+pJMvBTbqXyJesHTAiZz3I9gAH/sqUN
 odZ44BsgYcizKb8oLgEt7TVYvcI+tsVcCM6mtUrfDsIhCmfjtb9owBPB4UGS70/DLklX3/
 Jo0XXlko/aZ2t3BgHpHVI8npx+gZ584=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1750156098;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=yRL1pzyzWfZkEwjIrh5EPK0DyvqO4jGpH7nTdQIDJOU=;
 b=pnny5t+1R3s5+oz10RPJdQZOZNrWl6PZC680u7CImBF6HezK9+Kt7F3opuQwryTFcHQpGE
 YCJF0/Vphg/IO3AA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1750156097; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=yRL1pzyzWfZkEwjIrh5EPK0DyvqO4jGpH7nTdQIDJOU=;
 b=V8XAlhZjNOq8a7kiGH50OFfxbQped1myZsJ2VgF89KEp1B7ttzza88fJJmn8NOg1DW9f4B
 dsvPKunu7OasSmWwBpOOEngmUB1By6xbruLi8CNwnB8xMEMKKX3pNnCpg41JdP5EXk1cj4
 +u3B2fWZyjPE8HDYsGAxwXD53Fd47Mk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1750156097;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=yRL1pzyzWfZkEwjIrh5EPK0DyvqO4jGpH7nTdQIDJOU=;
 b=ZOSe9hUD5u6zOvVCb2BXorJhOv5ONladUC3MF82cZkGy3ZY15cD1s7zoZ2vwuLM5JGKDm5
 jOxbp0QBEPV9MGAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A12C913AE1;
 Tue, 17 Jun 2025 10:28:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id MhydJkFDUWjGHQAAD6G6ig
 (envelope-from <jack@suse.cz>); Tue, 17 Jun 2025 10:28:17 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
 id 4465FA29F0; Tue, 17 Jun 2025 12:28:17 +0200 (CEST)
Date: Tue, 17 Jun 2025 12:28:17 +0200
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Subject: Re: [PATCH 10/10] fs: replace mmap hook with .mmap_prepare for
 simple mappings
Message-ID: <6nktgdc7ygt6hncfnl33d2jlwvlydspiiklwf6oxiqxxcjhzs2@j6f36ktyv774>
References: <cover.1750099179.git.lorenzo.stoakes@oracle.com>
 <f528ac4f35b9378931bd800920fee53fc0c5c74d.1750099179.git.lorenzo.stoakes@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f528ac4f35b9378931bd800920fee53fc0c5c74d.1750099179.git.lorenzo.stoakes@oracle.com>
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
 MIME_GOOD(-0.10)[text/plain]; FUZZY_BLOCKED(0.00)[rspamd.com];
 URIBL_BLOCKED(0.00)[imap1.dmz-prg2.suse.org:helo,oracle.com:email,suse.cz:email,suse.com:email];
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 MIME_TRACE(0.00)[0:+]; ARC_NA(0.00)[]; RCVD_TLS_LAST(0.00)[];
 RCVD_COUNT_THREE(0.00)[3]; FROM_HAS_DN(0.00)[];
 FREEMAIL_CC(0.00)[linux-foundation.org,oracle.com,kernel.dk,linux.intel.com,intel.com,ursulin.net,gmail.com,ffwll.ch,kernel.org,ionkov.net,codewreck.org,crudebyte.com,suse.com,redhat.com,auristor.com,zeniv.linux.org.uk,suse.cz,kvack.org,szeredi.hu,linux.dev,fb.com,toxicpanda.com,cs.cmu.edu,tyhicks.com,linux.alibaba.com,google.com,huawei.com,samsung.com,sony.com,mit.edu,dilger.ca,mail.parknet.co.jp,dubeyko.com,physik.fu-berlin.de,vivo.com,nod.at,cambridgegreys.com,sipsolutions.net,artax.karlin.mff.cuni.cz,infradead.org,paragon-software.com,fasheh.com,evilplan.org,bobcopeland.com,omnibond.com,samba.org,manguebit.org,microsoft.com,talpey.com,wdc.com,suse.de,vger.kernel.org,lists.freedesktop.org,lists.linux.dev,lists.infradead.org,coda.cs.cmu.edu,lists.ozlabs.org,lists.sourceforge.net,lists.orangefs.org,lists.samba.org];
 RCPT_COUNT_GT_50(0.00)[113]; TO_MATCH_ENVRCPT_SOME(0.00)[];
 FROM_EQ_ENVFROM(0.00)[]; TO_DN_SOME(0.00)[];
 TAGGED_RCPT(0.00)[]; MISSING_XM_UA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 R_RATELIMIT(0.00)[to_ip_from(RLb58ib84xst5oy51ju4zaburj)];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email]
X-Spam-Flag: NO
X-Spam-Score: -0.30
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

On Mon 16-06-25 20:33:29, Lorenzo Stoakes wrote:
> Since commit c84bf6dd2b83 ("mm: introduce new .mmap_prepare() file
> callback"), the f_op->mmap() hook has been deprecated in favour of
> f_op->mmap_prepare().
> 
> This callback is invoked in the mmap() logic far earlier, so error handling
> can be performed more safely without complicated and bug-prone state
> unwinding required should an error arise.
> 
> This hook also avoids passing a pointer to a not-yet-correctly-established
> VMA avoiding any issues with referencing this data structure.
> 
> It rather provides a pointer to the new struct vm_area_desc descriptor type
> which contains all required state and allows easy setting of required
> parameters without any consideration needing to be paid to locking or
> reference counts.
> 
> Note that nested filesystems like overlayfs are compatible with an
> .mmap_prepare() callback since commit bb666b7c2707 ("mm: add mmap_prepare()
> compatibility layer for nested file systems").
> 
> In this patch we apply this change to file systems with relatively simple
> mmap() hook logic - exfat, ceph, f2fs, bcachefs, zonefs, btrfs, ocfs2,
> orangefs, nilfs2, romfs, ramfs and aio.
> 
> Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>

Two small nits below. Otherwise feel free to add:

Reviewed-by: Jan Kara <jack@suse.cz>

> diff --git a/fs/ceph/addr.c b/fs/ceph/addr.c
> index 60a621b00c65..37522137c380 100644
> --- a/fs/ceph/addr.c
> +++ b/fs/ceph/addr.c
> @@ -2330,13 +2330,14 @@ static const struct vm_operations_struct ceph_vmops = {
>  	.page_mkwrite	= ceph_page_mkwrite,
>  };
>  
> -int ceph_mmap(struct file *file, struct vm_area_struct *vma)
> +int ceph_mmap_prepare(struct vm_area_desc *desc)
>  {
> +	struct file *file = desc->file;
>  	struct address_space *mapping = file->f_mapping;

Pointless local variable here...

>  
>  	if (!mapping->a_ops->read_folio)
>  		return -ENOEXEC;
> -	vma->vm_ops = &ceph_vmops;
> +	desc->vm_ops = &ceph_vmops;
>  	return 0;
>  }
>  
...
> diff --git a/fs/exfat/file.c b/fs/exfat/file.c
> index 841a5b18e3df..d63213c8a823 100644
> --- a/fs/exfat/file.c
> +++ b/fs/exfat/file.c
> @@ -683,13 +683,14 @@ static const struct vm_operations_struct exfat_file_vm_ops = {
>  	.page_mkwrite	= exfat_page_mkwrite,
>  };
>  
> -static int exfat_file_mmap(struct file *file, struct vm_area_struct *vma)
> +static int exfat_file_mmap_prepare(struct vm_area_desc *desc)
>  {
> +	struct file *file = desc->file;

Missing empty line here.

>  	if (unlikely(exfat_forced_shutdown(file_inode(file)->i_sb)))
>  		return -EIO;
>  
>  	file_accessed(file);
> -	vma->vm_ops = &exfat_file_vm_ops;
> +	desc->vm_ops = &exfat_file_vm_ops;
>  	return 0;
>  }
>  

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

