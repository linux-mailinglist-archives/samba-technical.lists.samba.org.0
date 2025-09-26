Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 079EFBA5C92
	for <lists+samba-technical@lfdr.de>; Sat, 27 Sep 2025 11:37:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=jdhpPebHCqVXDxhTRmDXqiKy3zdiH1a2bFFZ2T9f0Ps=; b=WsJt41vUIW5mAiF4SOHKWqyrF/
	lttuJRcGORF1SAUzBahwhehege8ikUQCtZHg+8CJ/8irWvtCTa9pmYyrnzgd2c5ddygJnvGmqg3dr
	fEwQoM9Z0+wmn2WktjB0JQXPHKzIeMfl9b4W35u3jHvNU26dbhMAF3KylYxNA3jeVd5xF1YX/PoDG
	kdwuHcURYrV+LVXVm3pPE1TCg16i/P9l4XQKSZBrfRVcd9/78aCe/jryXb4EUuI0+PyHS/hFfG+fh
	Jmhez0Ix2AfSC0qBIDdmQtRRuj+WSMeo17yjb/zVPRVwYlp5wxcaWqrvJLi+qdkZ/rWcZnD3+Oe1C
	v8Ov18rQ==;
Received: from ip6-localhost ([::1]:37106 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1v2RNB-004sLF-G2; Sat, 27 Sep 2025 09:37:46 +0000
Received: from smtp-out1.suse.de ([195.135.223.130]:59342) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1v2ARV-004pyV-Ni
 for samba-technical@lists.samba.org; Fri, 26 Sep 2025 15:33:08 +0000
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 80AD537E10;
 Fri, 26 Sep 2025 15:32:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1758900780; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jdhpPebHCqVXDxhTRmDXqiKy3zdiH1a2bFFZ2T9f0Ps=;
 b=bVv4PWEamDI28FNq0126MvAvV/UXvpmSwf/KnuXhz76DdwBKfDQ+q1zd4rtQz5p1gJDgFU
 jwURS4YpzvUF8LN0FWrSSi9scQi9fLmGc/J0ePKsnfBBHp3erHEUIdTXJ/vbWAKu/uUqDC
 w9EQRnl7iWu6gOeqiY2WVElxC9bWI6k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1758900780;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jdhpPebHCqVXDxhTRmDXqiKy3zdiH1a2bFFZ2T9f0Ps=;
 b=5WsdL9yyCD8p1S1MgvkfOBunN9cAXpTnfessgG45tCHFEKdiLH+MEiH5GXzsdt6kGqAI0c
 aZUUT14Iyhiz1bBw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1758900779; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jdhpPebHCqVXDxhTRmDXqiKy3zdiH1a2bFFZ2T9f0Ps=;
 b=b8k60jAmCCRsZ4NIsNzEwf0Af6Y2/0lX48M3RGa2qYLGvRWiejtJrV02vEvTbCmQVG/3FQ
 zOHPJY5UodnX24e7l2lvd8wu5/mjroTXPurPfKpSQt/QvP6jP28Km4Q/xFtzfNbdcp5/es
 YR9pvsefY6VXHjgaSnrZElu2mdT8xFQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1758900779;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jdhpPebHCqVXDxhTRmDXqiKy3zdiH1a2bFFZ2T9f0Ps=;
 b=RMtAAtRTtFCv/V917z9xtC71xYuaHQ5VtlQ29XrLrA8ChQ3vSF8H0iZyQ3Vw3m/WJuwKkn
 riRfuAN3vKY2olAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 730011386E;
 Fri, 26 Sep 2025 15:32:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id tH0RHCuy1mjnAgAAD6G6ig
 (envelope-from <jack@suse.cz>); Fri, 26 Sep 2025 15:32:59 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
 id 2C0C0A0AA0; Fri, 26 Sep 2025 17:32:59 +0200 (CEST)
Date: Fri, 26 Sep 2025 17:32:59 +0200
To: Jeff Layton <jlayton@kernel.org>
Subject: Re: [PATCH v3 08/38] vfs: make vfs_mknod break delegations on parent
 directory
Message-ID: <ke7z7ptll7svm4ygbtbmv7ezv7rox75ct6mv5sn73lrnqp6g2r@ju2aolr2n5n7>
References: <20250924-dir-deleg-v3-0-9f3af8bc5c40@kernel.org>
 <20250924-dir-deleg-v3-8-9f3af8bc5c40@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250924-dir-deleg-v3-8-9f3af8bc5c40@kernel.org>
X-Spamd-Result: default: False [-2.30 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 SUSPICIOUS_RECIPS(1.50)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 MID_RHS_NOT_FQDN(0.50)[]; NEURAL_HAM_SHORT(-0.20)[-1.000];
 MIME_GOOD(-0.10)[text/plain];
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 RCVD_TLS_LAST(0.00)[]; FUZZY_RATELIMITED(0.00)[rspamd.com];
 ARC_NA(0.00)[]; RCVD_COUNT_THREE(0.00)[3];
 RCPT_COUNT_TWELVE(0.00)[44]; MIME_TRACE(0.00)[0:+];
 TO_MATCH_ENVRCPT_ALL(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com];
 FREEMAIL_CC(0.00)[zeniv.linux.org.uk,kernel.org,suse.cz,oracle.com,gmail.com,samba.org,microsoft.com,talpey.com,brown.name,redhat.com,lwn.net,szeredi.hu,manguebit.org,linuxfoundation.org,tyhicks.com,chromium.org,goodmis.org,efficios.com,vger.kernel.org,lists.samba.org,lists.linux.dev];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; TAGGED_RCPT(0.00)[]; MISSING_XM_UA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 R_RATELIMIT(0.00)[to_ip_from(RL63fqwwx8ot6gmekemcs76f9d)];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.cz:email]
X-Spam-Flag: NO
X-Spam-Score: -2.30
X-Mailman-Approved-At: Sat, 27 Sep 2025 09:37:27 +0000
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
Cc: Alexander Aring <alex.aring@gmail.com>, Jan Kara <jack@suse.cz>,
 Paulo Alcantara <pc@manguebit.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Carlos Maiolino <cem@kernel.org>, Amir Goldstein <amir73il@gmail.com>,
 linux-unionfs@vger.kernel.org, David Howells <dhowells@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>, linux-cifs@vger.kernel.org,
 Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
 Dai Ngo <Dai.Ngo@oracle.com>, Tyler Hicks <code@tyhicks.com>,
 Steve French <smfrench@gmail.com>, NeilBrown <neil@brown.name>,
 Namjae Jeon <linkinjeon@kernel.org>, linux-trace-kernel@vger.kernel.org,
 Shyam Prasad N <sprasad@microsoft.com>,
 Olga Kornievskaia <okorniev@redhat.com>, ecryptfs@vger.kernel.org,
 linux-nfs@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>,
 Tom Talpey <tom@talpey.com>, linux-fsdevel@vger.kernel.org,
 Bharath SM <bharathsm@microsoft.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>, linux-xfs@vger.kernel.org,
 Christian Brauner <brauner@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Miklos Szeredi <miklos@szeredi.hu>, samba-technical@lists.samba.org,
 linux-kernel@vger.kernel.org, Steve French <sfrench@samba.org>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Chuck Lever <chuck.lever@oracle.com>, Masami Hiramatsu <mhiramat@kernel.org>,
 Anna Schumaker <anna@kernel.org>, Rick Macklem <rick.macklem@gmail.com>,
 netfs@lists.linux.dev, Trond Myklebust <trondmy@kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wed 24-09-25 14:05:54, Jeff Layton wrote:
> In order to add directory delegation support, we need to break
> delegations on the parent whenever there is going to be a change in the
> directory.
> 
> Rename vfs_mknod as __vfs_mknod, make it static, and add a new
> delegated_inode parameter.  Make do_mknodat call __vfs_mknod and wait
> synchronously for delegation breaks to complete. Add a new exported
> vfs_mknod wrapper that calls __vfs_mknod with a NULL delegated_inode
> pointer.
> 
> Signed-off-by: Jeff Layton <jlayton@kernel.org>

Looks good. Feel free to add:

Reviewed-by: Jan Kara <jack@suse.cz>

								Honza

> ---
>  fs/namei.c | 57 +++++++++++++++++++++++++++++++++++----------------------
>  1 file changed, 35 insertions(+), 22 deletions(-)
> 
> diff --git a/fs/namei.c b/fs/namei.c
> index d4b8330a3eb97e205dc2e71766fed1e45503323b..7bcd898c84138061030f1f8b91273261cdf2a9b4 100644
> --- a/fs/namei.c
> +++ b/fs/namei.c
> @@ -4215,24 +4215,9 @@ inline struct dentry *user_path_create(int dfd, const char __user *pathname,
>  }
>  EXPORT_SYMBOL(user_path_create);
>  
> -/**
> - * vfs_mknod - create device node or file
> - * @idmap:	idmap of the mount the inode was found from
> - * @dir:	inode of the parent directory
> - * @dentry:	dentry of the child device node
> - * @mode:	mode of the child device node
> - * @dev:	device number of device to create
> - *
> - * Create a device node or file.
> - *
> - * If the inode has been found through an idmapped mount the idmap of
> - * the vfsmount must be passed through @idmap. This function will then take
> - * care to map the inode according to @idmap before checking permissions.
> - * On non-idmapped mounts or if permission checking is to be performed on the
> - * raw inode simply pass @nop_mnt_idmap.
> - */
> -int vfs_mknod(struct mnt_idmap *idmap, struct inode *dir,
> -	      struct dentry *dentry, umode_t mode, dev_t dev)
> +static int __vfs_mknod(struct mnt_idmap *idmap, struct inode *dir,
> +		       struct dentry *dentry, umode_t mode, dev_t dev,
> +		       struct inode **delegated_inode)
>  {
>  	bool is_whiteout = S_ISCHR(mode) && dev == WHITEOUT_DEV;
>  	int error = may_create(idmap, dir, dentry);
> @@ -4256,11 +4241,37 @@ int vfs_mknod(struct mnt_idmap *idmap, struct inode *dir,
>  	if (error)
>  		return error;
>  
> +	error = try_break_deleg(dir, delegated_inode);
> +	if (error)
> +		return error;
> +
>  	error = dir->i_op->mknod(idmap, dir, dentry, mode, dev);
>  	if (!error)
>  		fsnotify_create(dir, dentry);
>  	return error;
>  }
> +
> +/**
> + * vfs_mknod - create device node or file
> + * @idmap:	idmap of the mount the inode was found from
> + * @dir:	inode of the parent directory
> + * @dentry:	dentry of the child device node
> + * @mode:	mode of the child device node
> + * @dev:	device number of device to create
> + *
> + * Create a device node or file.
> + *
> + * If the inode has been found through an idmapped mount the idmap of
> + * the vfsmount must be passed through @idmap. This function will then take
> + * care to map the inode according to @idmap before checking permissions.
> + * On non-idmapped mounts or if permission checking is to be performed on the
> + * raw inode simply pass @nop_mnt_idmap.
> + */
> +int vfs_mknod(struct mnt_idmap *idmap, struct inode *dir,
> +	      struct dentry *dentry, umode_t mode, dev_t dev)
> +{
> +	return __vfs_mknod(idmap, dir, dentry, mode, dev, NULL);
> +}
>  EXPORT_SYMBOL(vfs_mknod);
>  
>  static int may_mknod(umode_t mode)
> @@ -4314,12 +4325,14 @@ static int do_mknodat(int dfd, struct filename *name, umode_t mode,
>  				security_path_post_mknod(idmap, dentry);
>  			break;
>  		case S_IFCHR: case S_IFBLK:
> -			error = vfs_mknod(idmap, path.dentry->d_inode,
> -					  dentry, mode, new_decode_dev(dev));
> +			error = __vfs_mknod(idmap, path.dentry->d_inode,
> +					    dentry, mode, new_decode_dev(dev),
> +					    &delegated_inode);
>  			break;
>  		case S_IFIFO: case S_IFSOCK:
> -			error = vfs_mknod(idmap, path.dentry->d_inode,
> -					  dentry, mode, 0);
> +			error = __vfs_mknod(idmap, path.dentry->d_inode,
> +					    dentry, mode, 0,
> +					    &delegated_inode);
>  			break;
>  	}
>  out2:
> 
> -- 
> 2.51.0
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

