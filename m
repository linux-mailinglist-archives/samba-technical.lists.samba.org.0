Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 77C63ACFDFE
	for <lists+samba-technical@lfdr.de>; Fri,  6 Jun 2025 10:11:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=v2Ue1JMlytjtMnxI/P2E86/Rt42RmUffq+homzYUw/c=; b=qtGcnAxXq/SA8aiZZ6kGSTBBbj
	7aJ79qPlwrC2qOMCzw+0aVgpnXqakNlGP8y1ZuTCXhUQ8ZyYBInoKc0fCr+KudykGv0yBULGXM6yw
	KYQ/32Ao6g29wPuvWsnKivfqC/FZKQ8LcgkJMpTHJLmBHYYuNJNeHvqEEW7cczFHk2+oE8e8HfYMx
	AXt/MmKWwqWQnDcRzgRBKcEL9tLuFv6QPAk4hesT7uhNHk79yACK/5O5Afcdr8yPxFOispGdvA9ar
	bvqAkWeLUD2mf/FCuZOQpV/4WyOAFU++cMh1fNPIXfwHI4sXTqrkDjPWmJs2O2rGYdh4nYrvHS6Dw
	lj/cV2eA==;
Received: from ip6-localhost ([::1]:28512 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uNS9z-006iW2-ES; Fri, 06 Jun 2025 08:10:43 +0000
Received: from smtp-out1.suse.de ([195.135.223.130]:59236) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uN8di-006fGt-3q
 for samba-technical@lists.samba.org; Thu, 05 Jun 2025 11:20:09 +0000
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 91D8D34A75;
 Thu,  5 Jun 2025 11:19:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1749122394; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=v2Ue1JMlytjtMnxI/P2E86/Rt42RmUffq+homzYUw/c=;
 b=vK7RiwZV69p19WILwjFZ+rFs6qkBr+nheRQdqpSH8LqMGE0OtlA3RfxdMUn2nUyLU5Lfgh
 9EyHjZcHI316Tn6u+7m6ZcoD9MG07hFuTbLN/NhyH9ptgJMOnKouXny6XvGUXodYa/36NO
 QooZBNxUYqzmhL4Ewua//aFcQ3MLNt4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1749122394;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=v2Ue1JMlytjtMnxI/P2E86/Rt42RmUffq+homzYUw/c=;
 b=XHJsNMK23B1jnmwX/K1a9ZhtTNU8K2cdBtpsT9bRx6t61DSno9GjtvtGxktlWNj3JyCDQ/
 29L2y3rq90eVVIAg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1749122394; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=v2Ue1JMlytjtMnxI/P2E86/Rt42RmUffq+homzYUw/c=;
 b=vK7RiwZV69p19WILwjFZ+rFs6qkBr+nheRQdqpSH8LqMGE0OtlA3RfxdMUn2nUyLU5Lfgh
 9EyHjZcHI316Tn6u+7m6ZcoD9MG07hFuTbLN/NhyH9ptgJMOnKouXny6XvGUXodYa/36NO
 QooZBNxUYqzmhL4Ewua//aFcQ3MLNt4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1749122394;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=v2Ue1JMlytjtMnxI/P2E86/Rt42RmUffq+homzYUw/c=;
 b=XHJsNMK23B1jnmwX/K1a9ZhtTNU8K2cdBtpsT9bRx6t61DSno9GjtvtGxktlWNj3JyCDQ/
 29L2y3rq90eVVIAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8230C1373E;
 Thu,  5 Jun 2025 11:19:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id BVrDH1p9QWjsBAAAD6G6ig
 (envelope-from <jack@suse.cz>); Thu, 05 Jun 2025 11:19:54 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
 id 3A68EA0951; Thu,  5 Jun 2025 13:19:54 +0200 (CEST)
Date: Thu, 5 Jun 2025 13:19:54 +0200
To: Jeff Layton <jlayton@kernel.org>
Subject: Re: [PATCH RFC v2 04/28] vfs: allow mkdir to wait for delegation
 break on parent
Message-ID: <wqp4ruxfzv47xwz2fca5trvpwg7rxufvd3nlfiu5kfsasqzsih@lutnvxe4ri62>
References: <20250602-dir-deleg-v2-0-a7919700de86@kernel.org>
 <20250602-dir-deleg-v2-4-a7919700de86@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250602-dir-deleg-v2-4-a7919700de86@kernel.org>
X-Spamd-Result: default: False [-2.23 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 SUSPICIOUS_RECIPS(1.50)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 MID_RHS_NOT_FQDN(0.50)[]; NEURAL_HAM_SHORT(-0.13)[-0.668];
 MIME_GOOD(-0.10)[text/plain]; RCPT_COUNT_TWELVE(0.00)[26];
 RCVD_VIA_SMTP_AUTH(0.00)[]; MIME_TRACE(0.00)[0:+];
 ARC_NA(0.00)[]; MISSING_XM_UA(0.00)[]; TO_DN_SOME(0.00)[];
 TAGGED_RCPT(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com];
 R_RATELIMIT(0.00)[to_ip_from(RL63fqwwx8ot6gmekemcs76f9d)];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 FREEMAIL_CC(0.00)[zeniv.linux.org.uk,kernel.org,suse.cz,oracle.com,gmail.com,samba.org,manguebit.com,microsoft.com,talpey.com,brown.name,redhat.com,lwn.net,szeredi.hu,vger.kernel.org,lists.samba.org];
 RCVD_COUNT_THREE(0.00)[3]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 FUZZY_BLOCKED(0.00)[rspamd.com]; RCVD_TLS_LAST(0.00)[];
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email]
X-Spam-Flag: NO
X-Spam-Score: -2.23
X-Mailman-Approved-At: Fri, 06 Jun 2025 08:10:41 +0000
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
 linux-doc@vger.kernel.org, Amir Goldstein <amir73il@gmail.com>,
 Paulo Alcantara <pc@manguebit.com>, linux-cifs@vger.kernel.org,
 Jonathan Corbet <corbet@lwn.net>, Dai Ngo <Dai.Ngo@oracle.com>,
 NeilBrown <neil@brown.name>, Shyam Prasad N <sprasad@microsoft.com>,
 Olga Kornievskaia <okorniev@redhat.com>, linux-nfs@vger.kernel.org,
 Tom Talpey <tom@talpey.com>, Bharath SM <bharathsm@microsoft.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, Miklos Szeredi <miklos@szeredi.hu>,
 samba-technical@lists.samba.org, linux-kernel@vger.kernel.org,
 Steve French <sfrench@samba.org>, Chuck Lever <chuck.lever@oracle.com>,
 Anna Schumaker <anna@kernel.org>, linux-fsdevel@vger.kernel.org,
 Trond Myklebust <trondmy@kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Mon 02-06-25 10:01:47, Jeff Layton wrote:
> In order to add directory delegation support, we need to break
> delegations on the parent whenever there is going to be a change in the
> directory.
> 
> Rename the existing vfs_mkdir to __vfs_mkdir, make it static and add a
> new delegated_inode parameter. Add a new exported vfs_mkdir wrapper
> around it that passes a NULL pointer for delegated_inode.
> 
> Signed-off-by: Jeff Layton <jlayton@kernel.org>

FWIW I went through the changes adding breaking of delegations to VFS
directory functions and they look ok to me. Just I dislike the addition of
__vfs_mkdir() (and similar) helpers because over longer term the helpers
tend to pile up and the maze of functions (already hard to follow in VFS)
gets unwieldy. Either I'd try to give it a proper name or (if exposing the
functionality to the external world is fine - which seems it is) you could
just add the argument to vfs_mkdir() and change all the callers? I've
checked and for each of the modified functions there's less than 10 callers
so the churn shouldn't be that big. What do others think?

								Honza

> ---
>  fs/namei.c | 67 +++++++++++++++++++++++++++++++++++++++-----------------------
>  1 file changed, 42 insertions(+), 25 deletions(-)
> 
> diff --git a/fs/namei.c b/fs/namei.c
> index 0fea12860036162c01a291558e068fde9c986142..7c9e237ed1b1a535934ffe5e523424bb035e7ae0 100644
> --- a/fs/namei.c
> +++ b/fs/namei.c
> @@ -4318,29 +4318,9 @@ SYSCALL_DEFINE3(mknod, const char __user *, filename, umode_t, mode, unsigned, d
>  	return do_mknodat(AT_FDCWD, getname(filename), mode, dev);
>  }
>  
> -/**
> - * vfs_mkdir - create directory returning correct dentry if possible
> - * @idmap:	idmap of the mount the inode was found from
> - * @dir:	inode of the parent directory
> - * @dentry:	dentry of the child directory
> - * @mode:	mode of the child directory
> - *
> - * Create a directory.
> - *
> - * If the inode has been found through an idmapped mount the idmap of
> - * the vfsmount must be passed through @idmap. This function will then take
> - * care to map the inode according to @idmap before checking permissions.
> - * On non-idmapped mounts or if permission checking is to be performed on the
> - * raw inode simply pass @nop_mnt_idmap.
> - *
> - * In the event that the filesystem does not use the *@dentry but leaves it
> - * negative or unhashes it and possibly splices a different one returning it,
> - * the original dentry is dput() and the alternate is returned.
> - *
> - * In case of an error the dentry is dput() and an ERR_PTR() is returned.
> - */
> -struct dentry *vfs_mkdir(struct mnt_idmap *idmap, struct inode *dir,
> -			 struct dentry *dentry, umode_t mode)
> +static struct dentry *__vfs_mkdir(struct mnt_idmap *idmap, struct inode *dir,
> +				  struct dentry *dentry, umode_t mode,
> +				  struct inode **delegated_inode)
>  {
>  	int error;
>  	unsigned max_links = dir->i_sb->s_max_links;
> @@ -4363,6 +4343,10 @@ struct dentry *vfs_mkdir(struct mnt_idmap *idmap, struct inode *dir,
>  	if (max_links && dir->i_nlink >= max_links)
>  		goto err;
>  
> +	error = try_break_deleg(dir, delegated_inode);
> +	if (error)
> +		goto err;
> +
>  	de = dir->i_op->mkdir(idmap, dir, dentry, mode);
>  	error = PTR_ERR(de);
>  	if (IS_ERR(de))
> @@ -4378,6 +4362,33 @@ struct dentry *vfs_mkdir(struct mnt_idmap *idmap, struct inode *dir,
>  	dput(dentry);
>  	return ERR_PTR(error);
>  }
> +
> +/**
> + * vfs_mkdir - create directory returning correct dentry if possible
> + * @idmap:	idmap of the mount the inode was found from
> + * @dir:	inode of the parent directory
> + * @dentry:	dentry of the child directory
> + * @mode:	mode of the child directory
> + *
> + * Create a directory.
> + *
> + * If the inode has been found through an idmapped mount the idmap of
> + * the vfsmount must be passed through @idmap. This function will then take
> + * care to map the inode according to @idmap before checking permissions.
> + * On non-idmapped mounts or if permission checking is to be performed on the
> + * raw inode simply pass @nop_mnt_idmap.
> + *
> + * In the event that the filesystem does not use the *@dentry but leaves it
> + * negative or unhashes it and possibly splices a different one returning it,
> + * the original dentry is dput() and the alternate is returned.
> + *
> + * In case of an error the dentry is dput() and an ERR_PTR() is returned.
> + */
> +struct dentry *vfs_mkdir(struct mnt_idmap *idmap, struct inode *dir,
> +			 struct dentry *dentry, umode_t mode)
> +{
> +	return __vfs_mkdir(idmap, dir, dentry, mode, NULL);
> +}
>  EXPORT_SYMBOL(vfs_mkdir);
>  
>  int do_mkdirat(int dfd, struct filename *name, umode_t mode)
> @@ -4386,6 +4397,7 @@ int do_mkdirat(int dfd, struct filename *name, umode_t mode)
>  	struct path path;
>  	int error;
>  	unsigned int lookup_flags = LOOKUP_DIRECTORY;
> +	struct inode *delegated_inode = NULL;
>  
>  retry:
>  	dentry = filename_create(dfd, name, &path, lookup_flags);
> @@ -4396,12 +4408,17 @@ int do_mkdirat(int dfd, struct filename *name, umode_t mode)
>  	error = security_path_mkdir(&path, dentry,
>  			mode_strip_umask(path.dentry->d_inode, mode));
>  	if (!error) {
> -		dentry = vfs_mkdir(mnt_idmap(path.mnt), path.dentry->d_inode,
> -				  dentry, mode);
> +		dentry = __vfs_mkdir(mnt_idmap(path.mnt), path.dentry->d_inode,
> +				     dentry, mode, &delegated_inode);
>  		if (IS_ERR(dentry))
>  			error = PTR_ERR(dentry);
>  	}
>  	done_path_create(&path, dentry);
> +	if (delegated_inode) {
> +		error = break_deleg_wait(&delegated_inode);
> +		if (!error)
> +			goto retry;
> +	}
>  	if (retry_estale(error, lookup_flags)) {
>  		lookup_flags |= LOOKUP_REVAL;
>  		goto retry;
> 
> -- 
> 2.49.0
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

