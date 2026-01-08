Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 42205D08070
	for <lists+samba-technical@lfdr.de>; Fri, 09 Jan 2026 09:58:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=Rc9QMKouyjzH45LZUhjCbf9iU6kNH1nER3QE4i7JiDM=; b=41/juMJTX0M9rqDF7qyZhGLcvz
	M+7HXJE+0OqGVEZT+9Lbiz5wEjx2gD8v8JBQJAPFQfozkOHhgLF/DhxbJLxklSt27HXmVbAPCj8uK
	u4mYn/Jwm55p2uNXstwOAIGEcuGQkNoxd0AgO9BCp7meBQIIGXpceP8n4clV17/nAxhS9PcN7tx9r
	0urU7tAeo5uf4cwML9WwSEThXLwwiFZXwNq2Q7/1XZO/pjoB8bIR1g/uNCjlFyjtUjGATuTlUQ038
	dgG9Ic/ikh0ok1XnIGdBmW1NrHOxOLMu2JyDBWnkeb1Vd1xn0oz5uQlEWmGYHLC5SEXbisisgzQt7
	49t/M3oA==;
Received: from ip6-localhost ([::1]:28476 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ve8Hp-001icz-J6; Fri, 09 Jan 2026 08:56:01 +0000
Received: from smtp-out2.suse.de ([195.135.223.131]:53026) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vdtrh-001fk9-Bu
 for samba-technical@lists.samba.org; Thu, 08 Jan 2026 17:32:07 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id E02605CBAB;
 Thu,  8 Jan 2026 17:32:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1767893523; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Rc9QMKouyjzH45LZUhjCbf9iU6kNH1nER3QE4i7JiDM=;
 b=MKYplGgUyR+sE06i0JiUz8GKtJbOPqRHHpMIj+IWs303KtwqzOMjj+JFlHwHtSt7nbAUxA
 UNp4Ll6iPK3H52aM4vFBGo0ErVRKRIPPFhbwF8eh7s2fgE1PWOm6znJF/4G+mtw+movdZo
 1psyKrKOcJR2WxUMmY9s6q28XLqlyTw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1767893523;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Rc9QMKouyjzH45LZUhjCbf9iU6kNH1nER3QE4i7JiDM=;
 b=+kISGD+BwUugn2ejyQVVgjX3pI8t3dz4nil+/amsO+obOFpkCydzCEt1LMAEaSWkfKrT23
 PrLkTBk88AY2V7BA==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=zchHYT5l;
 dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=v7Sxuhou
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1767893522; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Rc9QMKouyjzH45LZUhjCbf9iU6kNH1nER3QE4i7JiDM=;
 b=zchHYT5ly7W8Ws0WGBZ/OLSaO6YePdF0ZuvnJ54B4z/6iRJB1Rmu65L8SCdhqtGnDJRxNt
 h8hIIjb74QUVWPEDWc4b2ZIMvH4EEJ7zRjN43UvzJAdzhjiSz7WLubJqA7OtP6gQLvF0Fh
 qsB+hXW7VQPvyvSNGU9sg0unRkW933o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1767893522;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Rc9QMKouyjzH45LZUhjCbf9iU6kNH1nER3QE4i7JiDM=;
 b=v7Sxuhou8fYCJendb+nuEct46VWp54XIkm6cHFo3LZWNdJd5/5Qm//MUpOHl5WjYSfdzmb
 HPS47RhJ47XDEuBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C47143EA63;
 Thu,  8 Jan 2026 17:32:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id pu3oLxLqX2nzegAAD6G6ig
 (envelope-from <jack@suse.cz>); Thu, 08 Jan 2026 17:32:02 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
 id 3B7FAA0B23; Thu,  8 Jan 2026 18:31:54 +0100 (CET)
Date: Thu, 8 Jan 2026 18:31:54 +0100
To: Jeff Layton <jlayton@kernel.org>
Subject: Re: [PATCH 19/24] tmpfs: add setlease file operation
Message-ID: <5dtyb6by4ujjnkjz6lu4rl2x3s5km6awilvrozuzmgq2wn7bl6@cxvq3jpviunf>
References: <20260108-setlease-6-20-v1-0-ea4dec9b67fa@kernel.org>
 <20260108-setlease-6-20-v1-19-ea4dec9b67fa@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260108-setlease-6-20-v1-19-ea4dec9b67fa@kernel.org>
X-Spam-Score: -2.51
X-Spamd-Result: default: False [-2.51 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 SUSPICIOUS_RECIPS(1.50)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 MID_RHS_NOT_FQDN(0.50)[];
 R_DKIM_ALLOW(-0.20)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; RCVD_TLS_LAST(0.00)[];
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 RCVD_COUNT_THREE(0.00)[3]; FUZZY_RATELIMITED(0.00)[rspamd.com];
 MIME_TRACE(0.00)[0:+];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 ARC_NA(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com];
 FREEMAIL_CC(0.00)[kernel.org,gmail.com,fluxnic.net,infradead.org,suse.cz,alarsen.net,zeniv.linux.org.uk,suse.com,fb.com,linux.alibaba.com,google.com,huawei.com,vivo.com,mit.edu,dilger.ca,mail.parknet.co.jp,nod.at,dubeyko.com,paragon-software.com,fasheh.com,evilplan.org,omnibond.com,szeredi.hu,squashfs.org.uk,linux-foundation.org,samsung.com,sony.com,oracle.com,redhat.com,lwn.net,ionkov.net,codewreck.org,crudebyte.com,samba.org,manguebit.org,microsoft.com,talpey.com,vger.kernel.org,lists.ozlabs.org,lists.sourceforge.net,lists.infradead.org,lists.linux.dev,lists.orangefs.org,kvack.org,lists.samba.org];
 DKIM_TRACE(0.00)[suse.cz:+]; TO_MATCH_ENVRCPT_SOME(0.00)[];
 DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; RCPT_COUNT_GT_50(0.00)[86];
 TAGGED_RCPT(0.00)[];
 R_RATELIMIT(0.00)[to_ip_from(RLjxstjou9w9fpr873xxxyrjcd)];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 MISSING_XM_UA(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:dkim, suse.cz:email,
 imap1.dmz-prg2.suse.org:rdns, imap1.dmz-prg2.suse.org:helo]
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: E02605CBAB
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Mailman-Approved-At: Fri, 09 Jan 2026 08:55:52 +0000
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
Cc: Latchesar Ionkov <lucho@ionkov.net>, Dave Kleikamp <shaggy@kernel.org>,
 Alexander Aring <alex.aring@gmail.com>, Jan Kara <jack@suse.cz>,
 Paulo Alcantara <pc@manguebit.org>, Sandeep Dhavale <dhavale@google.com>,
 Martin Brandenburg <martin@omnibond.com>, Yuezhang Mo <yuezhang.mo@sony.com>,
 Anders Larsen <al@alarsen.net>, Amir Goldstein <amir73il@gmail.com>,
 jfs-discussion@lists.sourceforge.net, linux-unionfs@vger.kernel.org,
 Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
 Chris Mason <clm@fb.com>, Andreas Dilger <adilger.kernel@dilger.ca>,
 Chunhai Guo <guochunhai@vivo.com>, Ilya Dryomov <idryomov@gmail.com>,
 linux-mtd@lists.infradead.org, Mike Marshall <hubcap@omnibond.com>,
 linux-xfs@vger.kernel.org, Xiubo Li <xiubli@redhat.com>,
 Yue Hu <zbestahu@gmail.com>, Miklos Szeredi <miklos@szeredi.hu>,
 samba-technical@lists.samba.org, Richard Weinberger <richard@nod.at>,
 Mark Fasheh <mark@fasheh.com>, devel@lists.orangefs.org,
 Hugh Dickins <hughd@google.com>,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>, ntfs3@lists.linux.dev,
 Joseph Qi <joseph.qi@linux.alibaba.com>, linux-mm@kvack.org,
 Viacheslav Dubeyko <slava@dubeyko.com>, linux-btrfs@vger.kernel.org,
 Gao Xiang <xiang@kernel.org>, linux-ext4@vger.kernel.org,
 Salah Triki <salah.triki@gmail.com>, Carlos Maiolino <cem@kernel.org>,
 Dominique Martinet <asmadeus@codewreck.org>,
 Shyam Prasad N <sprasad@microsoft.com>,
 Christian Schoenebeck <linux_oss@crudebyte.com>, linux-cifs@vger.kernel.org,
 Chao Yu <chao@kernel.org>, linux-nfs@vger.kernel.org,
 Tom Talpey <tom@talpey.com>, ocfs2-devel@lists.linux.dev,
 Bharath SM <bharathsm@microsoft.com>, linux-nilfs@vger.kernel.org,
 David Sterba <dsterba@suse.com>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Jeffle Xu <jefflexu@linux.alibaba.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 ceph-devel@vger.kernel.org, Eric Van Hensbergen <ericvh@kernel.org>,
 Ryusuke Konishi <konishi.ryusuke@gmail.com>,
 OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>,
 Andreas Gruenbacher <agruenba@redhat.com>, Hans de Goede <hansg@kernel.org>,
 gfs2@lists.linux.dev, Christian Brauner <brauner@kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net, Theodore Ts'o <tytso@mit.edu>,
 Luis de Bethencourt <luisbg@kernel.org>, Nicolas Pitre <nico@fluxnic.net>,
 linux-erofs@lists.ozlabs.org, v9fs@lists.linux.dev,
 Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Namjae Jeon <linkinjeon@kernel.org>,
 Steve French <sfrench@samba.org>, Chuck Lever <chuck.lever@oracle.com>,
 Hongbo Li <lihongbo22@huawei.com>, Anna Schumaker <anna@kernel.org>,
 Jan Kara <jack@suse.com>, linux-fsdevel@vger.kernel.org,
 Phillip Lougher <phillip@squashfs.org.uk>,
 Andrew Morton <akpm@linux-foundation.org>,
 Sungjong Seo <sj1557.seo@samsung.com>, David Woodhouse <dwmw2@infradead.org>,
 Trond Myklebust <trondmy@kernel.org>, Joel Becker <jlbec@evilplan.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thu 08-01-26 12:13:14, Jeff Layton wrote:
> Add the setlease file_operation pointing to generic_setlease to the
> tmpfs file_operations structures. A future patch will change the
> default behavior to reject lease attempts with -EINVAL when there is no
> setlease file operation defined. Add generic_setlease to retain the
> ability to set leases on this filesystem.
> 
> Signed-off-by: Jeff Layton <jlayton@kernel.org>

Looks good. Feel free to add:

Reviewed-by: Jan Kara <jack@suse.cz>

								Honza

> ---
>  fs/libfs.c | 2 ++
>  mm/shmem.c | 2 ++
>  2 files changed, 4 insertions(+)
> 
> diff --git a/fs/libfs.c b/fs/libfs.c
> index 591eb649ebbacf202ff48cd3abd64a175daa291c..697c6d5fc12786c036f0086886297fb5cd52ae00 100644
> --- a/fs/libfs.c
> +++ b/fs/libfs.c
> @@ -6,6 +6,7 @@
>  
>  #include <linux/blkdev.h>
>  #include <linux/export.h>
> +#include <linux/filelock.h>
>  #include <linux/pagemap.h>
>  #include <linux/slab.h>
>  #include <linux/cred.h>
> @@ -570,6 +571,7 @@ const struct file_operations simple_offset_dir_operations = {
>  	.iterate_shared	= offset_readdir,
>  	.read		= generic_read_dir,
>  	.fsync		= noop_fsync,
> +	.setlease	= generic_setlease,
>  };
>  
>  struct dentry *find_next_child(struct dentry *parent, struct dentry *prev)
> diff --git a/mm/shmem.c b/mm/shmem.c
> index ec6c01378e9d2bd47db9d7506e4d6a565e092185..88ef1fd5cd38efedbb31353da2871ab1d47e68a5 100644
> --- a/mm/shmem.c
> +++ b/mm/shmem.c
> @@ -29,6 +29,7 @@
>  #include <linux/pagemap.h>
>  #include <linux/file.h>
>  #include <linux/fileattr.h>
> +#include <linux/filelock.h>
>  #include <linux/mm.h>
>  #include <linux/random.h>
>  #include <linux/sched/signal.h>
> @@ -5219,6 +5220,7 @@ static const struct file_operations shmem_file_operations = {
>  	.splice_read	= shmem_file_splice_read,
>  	.splice_write	= iter_file_splice_write,
>  	.fallocate	= shmem_fallocate,
> +	.setlease	= generic_setlease,
>  #endif
>  };
>  
> 
> -- 
> 2.52.0
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

