Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id ECC21D0806E
	for <lists+samba-technical@lfdr.de>; Fri, 09 Jan 2026 09:58:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=R7QyMjWNwrqj8UEPWI/WaBPmYmyTfSFG6zvi/rjbSso=; b=BMT5XjIzxKJsVov4sJc+Ht1ACG
	1o/tonrptyIT9BmV/ddjtJEaDPc2P/CygCVnp9Cj/hAk9ODzaH/FolLzu6PjDLNXya6YzjQRfWJtQ
	TJqED3Gk7+yA91Jetk3+np7iuTMtCHoqNrYPRE+X6gMdVkkE5vNGN1M8OEHs7FuuUeKd9AqTpBE16
	9yqVi/UC1/iVYVyJu+D+/psrH3Lm7KK6X6FqusXBulZ0M7gpmmfracGiyMq7lLfkAhN4QJZFxvJhm
	Y2bzePJ+h2RMdvnv6eLPyOL6b2BkBc7WJ5jGUI1f6mlug/N1xcJXysekwT26hR6QqQzUneejpL2Wo
	7jcRgCqA==;
Received: from ip6-localhost ([::1]:33670 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ve8Hj-001iaV-3w; Fri, 09 Jan 2026 08:55:55 +0000
Received: from smtp-out2.suse.de ([2a07:de40:b251:101:10:150:64:2]:51572) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vdtmo-001fj9-JS
 for samba-technical@lists.samba.org; Thu, 08 Jan 2026 17:27:05 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 62A895CB7C;
 Thu,  8 Jan 2026 17:26:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1767893219; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=R7QyMjWNwrqj8UEPWI/WaBPmYmyTfSFG6zvi/rjbSso=;
 b=zlnIZXTfinrf7hq5vt4U5cUKJ6NPNUMQKK2r+Tmfi2xEzptt6ClI4wMDQQvjt9dx8n8JRa
 f+6MG01/Jc9w6M+FLcxwyZZdeIID2KjyJifSH8p7z53HnRVuZYr8SQKyqt/r4Pp8Z+ZZ9O
 oGRfCrFhM3vTR5EXInWctDXLZPrEeFo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1767893219;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=R7QyMjWNwrqj8UEPWI/WaBPmYmyTfSFG6zvi/rjbSso=;
 b=phfwz5+a+RuRX25uv+FH1xiHN8WR/XirFu4FyQP6WWGFdXXorQlDWQOreoBzrsu9F8q7u1
 Qxxocyjselc1ZHBA==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=zlnIZXTf;
 dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=phfwz5+a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1767893219; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=R7QyMjWNwrqj8UEPWI/WaBPmYmyTfSFG6zvi/rjbSso=;
 b=zlnIZXTfinrf7hq5vt4U5cUKJ6NPNUMQKK2r+Tmfi2xEzptt6ClI4wMDQQvjt9dx8n8JRa
 f+6MG01/Jc9w6M+FLcxwyZZdeIID2KjyJifSH8p7z53HnRVuZYr8SQKyqt/r4Pp8Z+ZZ9O
 oGRfCrFhM3vTR5EXInWctDXLZPrEeFo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1767893219;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=R7QyMjWNwrqj8UEPWI/WaBPmYmyTfSFG6zvi/rjbSso=;
 b=phfwz5+a+RuRX25uv+FH1xiHN8WR/XirFu4FyQP6WWGFdXXorQlDWQOreoBzrsu9F8q7u1
 Qxxocyjselc1ZHBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4627D3EA65;
 Thu,  8 Jan 2026 17:26:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id E6zLEOPoX2kEdgAAD6G6ig
 (envelope-from <jack@suse.cz>); Thu, 08 Jan 2026 17:26:59 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
 id BEB9EA0B23; Thu,  8 Jan 2026 18:26:58 +0100 (CET)
Date: Thu, 8 Jan 2026 18:26:58 +0100
To: Jeff Layton <jlayton@kernel.org>
Subject: Re: [PATCH 01/24] fs: add setlease to generic_ro_fops and read-only
 filesystem directory operations
Message-ID: <iik7pdymlt6glogh6f62ps764go4233ub7mgvdctwktc4iszyz@h33w3q63jjrj>
References: <20260108-setlease-6-20-v1-0-ea4dec9b67fa@kernel.org>
 <20260108-setlease-6-20-v1-1-ea4dec9b67fa@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260108-setlease-6-20-v1-1-ea4dec9b67fa@kernel.org>
X-Spamd-Result: default: False [-2.51 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 SUSPICIOUS_RECIPS(1.50)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 MID_RHS_NOT_FQDN(0.50)[];
 R_DKIM_ALLOW(-0.20)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; RCVD_TLS_LAST(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]; RCVD_COUNT_THREE(0.00)[3];
 MIME_TRACE(0.00)[0:+];
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 ARC_NA(0.00)[]; FUZZY_RATELIMITED(0.00)[rspamd.com];
 FREEMAIL_CC(0.00)[kernel.org,gmail.com,fluxnic.net,infradead.org,suse.cz,alarsen.net,zeniv.linux.org.uk,suse.com,fb.com,linux.alibaba.com,google.com,huawei.com,vivo.com,mit.edu,dilger.ca,mail.parknet.co.jp,nod.at,dubeyko.com,paragon-software.com,fasheh.com,evilplan.org,omnibond.com,szeredi.hu,squashfs.org.uk,linux-foundation.org,samsung.com,sony.com,oracle.com,redhat.com,lwn.net,ionkov.net,codewreck.org,crudebyte.com,samba.org,manguebit.org,microsoft.com,talpey.com,vger.kernel.org,lists.ozlabs.org,lists.sourceforge.net,lists.infradead.org,lists.linux.dev,lists.orangefs.org,kvack.org,lists.samba.org];
 DKIM_TRACE(0.00)[suse.cz:+];
 R_RATELIMIT(0.00)[to_ip_from(RLjxstjou9w9fpr873xxxyrjcd)];
 TO_MATCH_ENVRCPT_SOME(0.00)[];
 DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; RCPT_COUNT_GT_50(0.00)[86];
 TAGGED_RCPT(0.00)[];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 MISSING_XM_UA(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email]
X-Spam-Flag: NO
X-Spam-Score: -2.51
X-Rspamd-Queue-Id: 62A895CB7C
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
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

On Thu 08-01-26 12:12:56, Jeff Layton wrote:
> Add the setlease file_operation to generic_ro_fops, which covers file
> operations for several read-only filesystems (BEFS, EFS, ISOFS, QNX4,
> QNX6, CRAMFS, FREEVXFS). Also add setlease to the directory
> file_operations for these filesystems.	A future patch will change the
> default behavior to reject lease attempts with -EINVAL when there is no
> setlease file operation defined. Add generic_setlease to retain the
> ability to set leases on these filesystems.
> 
> Signed-off-by: Jeff Layton <jlayton@kernel.org>

Looks good. Feel free to add:

Reviewed-by: Jan Kara <jack@suse.cz>

								Honza

> ---
>  fs/befs/linuxvfs.c        | 2 ++
>  fs/cramfs/inode.c         | 2 ++
>  fs/efs/dir.c              | 2 ++
>  fs/freevxfs/vxfs_lookup.c | 2 ++
>  fs/isofs/dir.c            | 2 ++
>  fs/qnx4/dir.c             | 2 ++
>  fs/qnx6/dir.c             | 2 ++
>  fs/read_write.c           | 2 ++
>  8 files changed, 16 insertions(+)
> 
> diff --git a/fs/befs/linuxvfs.c b/fs/befs/linuxvfs.c
> index 9fcfdd6b8189aaf5cc3b68aa8dff4798af5bdcbc..d7c5d9270387bf6c3e94942e6331b449f90fe428 100644
> --- a/fs/befs/linuxvfs.c
> +++ b/fs/befs/linuxvfs.c
> @@ -14,6 +14,7 @@
>  #include <linux/fs_context.h>
>  #include <linux/fs_parser.h>
>  #include <linux/errno.h>
> +#include <linux/filelock.h>
>  #include <linux/stat.h>
>  #include <linux/nls.h>
>  #include <linux/buffer_head.h>
> @@ -79,6 +80,7 @@ static const struct file_operations befs_dir_operations = {
>  	.read		= generic_read_dir,
>  	.iterate_shared	= befs_readdir,
>  	.llseek		= generic_file_llseek,
> +	.setlease	= generic_setlease,
>  };
>  
>  static const struct inode_operations befs_dir_inode_operations = {
> diff --git a/fs/cramfs/inode.c b/fs/cramfs/inode.c
> index e54ebe402df79d43a2c7cf491d669829f7ef81b7..41b1a869cf135d014003d6bf1c343d590ae7a084 100644
> --- a/fs/cramfs/inode.c
> +++ b/fs/cramfs/inode.c
> @@ -16,6 +16,7 @@
>  #include <linux/module.h>
>  #include <linux/fs.h>
>  #include <linux/file.h>
> +#include <linux/filelock.h>
>  #include <linux/pagemap.h>
>  #include <linux/ramfs.h>
>  #include <linux/init.h>
> @@ -938,6 +939,7 @@ static const struct file_operations cramfs_directory_operations = {
>  	.llseek		= generic_file_llseek,
>  	.read		= generic_read_dir,
>  	.iterate_shared	= cramfs_readdir,
> +	.setlease	= generic_setlease,
>  };
>  
>  static const struct inode_operations cramfs_dir_inode_operations = {
> diff --git a/fs/efs/dir.c b/fs/efs/dir.c
> index f892ac7c2a35e0094a314eeded06a974154e46d7..35ad0092c11547af68ef8baf4965b50a0a7593fe 100644
> --- a/fs/efs/dir.c
> +++ b/fs/efs/dir.c
> @@ -6,6 +6,7 @@
>   */
>  
>  #include <linux/buffer_head.h>
> +#include <linux/filelock.h>
>  #include "efs.h"
>  
>  static int efs_readdir(struct file *, struct dir_context *);
> @@ -14,6 +15,7 @@ const struct file_operations efs_dir_operations = {
>  	.llseek		= generic_file_llseek,
>  	.read		= generic_read_dir,
>  	.iterate_shared	= efs_readdir,
> +	.setlease	= generic_setlease,
>  };
>  
>  const struct inode_operations efs_dir_inode_operations = {
> diff --git a/fs/freevxfs/vxfs_lookup.c b/fs/freevxfs/vxfs_lookup.c
> index 1b0bca8b4cc686043d92246042dcf833d37712e4..138e08de976ea762a46043316f27e9a031f60c32 100644
> --- a/fs/freevxfs/vxfs_lookup.c
> +++ b/fs/freevxfs/vxfs_lookup.c
> @@ -8,6 +8,7 @@
>   * Veritas filesystem driver - lookup and other directory related code.
>   */
>  #include <linux/fs.h>
> +#include <linux/filelock.h>
>  #include <linux/time.h>
>  #include <linux/mm.h>
>  #include <linux/highmem.h>
> @@ -36,6 +37,7 @@ const struct file_operations vxfs_dir_operations = {
>  	.llseek =		generic_file_llseek,
>  	.read =			generic_read_dir,
>  	.iterate_shared =	vxfs_readdir,
> +	.setlease =		generic_setlease,
>  };
>  
>  
> diff --git a/fs/isofs/dir.c b/fs/isofs/dir.c
> index 09df40b612fbf27a1a93af2b4fbf6a607f4a1ab4..2ca16c3fe5ef3427e5bbd0631eb8323ef3c58bf1 100644
> --- a/fs/isofs/dir.c
> +++ b/fs/isofs/dir.c
> @@ -12,6 +12,7 @@
>   *  isofs directory handling functions
>   */
>  #include <linux/gfp.h>
> +#include <linux/filelock.h>
>  #include "isofs.h"
>  
>  int isofs_name_translate(struct iso_directory_record *de, char *new, struct inode *inode)
> @@ -271,6 +272,7 @@ const struct file_operations isofs_dir_operations =
>  	.llseek = generic_file_llseek,
>  	.read = generic_read_dir,
>  	.iterate_shared = isofs_readdir,
> +	.setlease = generic_setlease,
>  };
>  
>  /*
> diff --git a/fs/qnx4/dir.c b/fs/qnx4/dir.c
> index 42a529e26bd68b6de1a7738c409d5942a92066f8..6402715ab377e5686558371dd76e5a4c1cfbb787 100644
> --- a/fs/qnx4/dir.c
> +++ b/fs/qnx4/dir.c
> @@ -13,6 +13,7 @@
>   */
>  
>  #include <linux/buffer_head.h>
> +#include <linux/filelock.h>
>  #include "qnx4.h"
>  
>  static int qnx4_readdir(struct file *file, struct dir_context *ctx)
> @@ -71,6 +72,7 @@ const struct file_operations qnx4_dir_operations =
>  	.read		= generic_read_dir,
>  	.iterate_shared	= qnx4_readdir,
>  	.fsync		= generic_file_fsync,
> +	.setlease	= generic_setlease,
>  };
>  
>  const struct inode_operations qnx4_dir_inode_operations =
> diff --git a/fs/qnx6/dir.c b/fs/qnx6/dir.c
> index b4d10e45f2e41b45568fe813a3cc0aa253bcab6e..ae0c9846833d916beb7f356cfa6e9de01a6f6963 100644
> --- a/fs/qnx6/dir.c
> +++ b/fs/qnx6/dir.c
> @@ -11,6 +11,7 @@
>   *
>   */
>  
> +#include <linux/filelock.h>
>  #include "qnx6.h"
>  
>  static unsigned qnx6_lfile_checksum(char *name, unsigned size)
> @@ -275,6 +276,7 @@ const struct file_operations qnx6_dir_operations = {
>  	.read		= generic_read_dir,
>  	.iterate_shared	= qnx6_readdir,
>  	.fsync		= generic_file_fsync,
> +	.setlease	= generic_setlease,
>  };
>  
>  const struct inode_operations qnx6_dir_inode_operations = {
> diff --git a/fs/read_write.c b/fs/read_write.c
> index 833bae068770a4e410e4895132586313a9687fa2..50bff7edc91f36fe5ee24198bd51a33c278d40a2 100644
> --- a/fs/read_write.c
> +++ b/fs/read_write.c
> @@ -20,6 +20,7 @@
>  #include <linux/compat.h>
>  #include <linux/mount.h>
>  #include <linux/fs.h>
> +#include <linux/filelock.h>
>  #include "internal.h"
>  
>  #include <linux/uaccess.h>
> @@ -30,6 +31,7 @@ const struct file_operations generic_ro_fops = {
>  	.read_iter	= generic_file_read_iter,
>  	.mmap_prepare	= generic_file_readonly_mmap_prepare,
>  	.splice_read	= filemap_splice_read,
> +	.setlease	= generic_setlease,
>  };
>  
>  EXPORT_SYMBOL(generic_ro_fops);
> 
> -- 
> 2.52.0
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

