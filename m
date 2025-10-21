Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E6E1BF5294
	for <lists+samba-technical@lfdr.de>; Tue, 21 Oct 2025 10:07:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=wzwy5x2PYJ6Ji+N5DkWavBUtEqBNmQBy4TmNzsIyKBk=; b=EqfyHCGdmDdqKZBN9ViblZCyMP
	wNIBwiRF/3+pVH33Bdw0WhGIVqYbkCl8NB0wI2dvkd1OpfWsfoCDSu2E/WjZEMqoBxhuV+NRLhIgM
	wDrN8GxRVkGlsMrKYh51c17a1Bi/CI6lEgWLn11FwU3pBf0MyEILCyouv68kn+H0h6oLjX8iHLxuk
	xOLkzh340yGkaCWeKx9dmRJfjQb4dOfIMjTMYwNLdFbKud153aACcrFnt1sgXbKyyK0iXzPXVPQkF
	esOlEE2G600IKPHMIkzj3Kvkcf6CM2TI5ASOifqg886v1hr/58hYFytMN5sM3OuQ1aMHRZKvC708M
	ZDSSDkjg==;
Received: from ip6-localhost ([::1]:49076 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vB7P6-008Q0b-KW; Tue, 21 Oct 2025 08:07:36 +0000
Received: from smtp-out2.suse.de ([195.135.223.131]:57568) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vAmLk-008Leg-F3
 for samba-technical@lists.samba.org; Mon, 20 Oct 2025 09:38:47 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 503481F387;
 Mon, 20 Oct 2025 09:38:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1760953110; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wzwy5x2PYJ6Ji+N5DkWavBUtEqBNmQBy4TmNzsIyKBk=;
 b=AbCokr9dcIh0NiCZ9cee7OmJq14x2+KI4TwurVPy4R5ubkZcSdypO8X3BCzPdoy7wY67RT
 YicommI+KCLloL29wfNG3Zf4zVX/BnqgEWA0pRnazudCRSip0gnID1navjnzhcIbHLA3Uj
 jFh8R6pXzlUVGDhnEgU50WWUHw3mL+A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1760953110;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wzwy5x2PYJ6Ji+N5DkWavBUtEqBNmQBy4TmNzsIyKBk=;
 b=htOJBh5DZ0E1gaAuVZMfUX4OaN1kpMQNAdjPYasYIn+FvlC7M3JEd20beZZqqTIvvpMzWc
 /Mo6PJTk6e/fxWAQ==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=lecXGC+s;
 dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=w+ROXWwa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1760953106; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wzwy5x2PYJ6Ji+N5DkWavBUtEqBNmQBy4TmNzsIyKBk=;
 b=lecXGC+s4hN8o9BjaHzKAULEA5+P96smF+Nl8+Lf7OByLCrRbnQWa5lX39WGwc95ZNzr9X
 EX/1hyQrEeovpaYVudpvdRDja2MbGT6veU7l+Fpc+r12TBbyPQ6VPMPRvBuw2Xz3Oc/0Tn
 LFYWbh+95+aoa3DavjddggCaIGaoGj4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1760953106;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wzwy5x2PYJ6Ji+N5DkWavBUtEqBNmQBy4TmNzsIyKBk=;
 b=w+ROXWwa1pt4+XUlIQ/mwD6xiZt1mj0tkgHedJ7Wv52zYHz8D56CvMcOYLhKY43veDzZQM
 kpDN+Tdf8JzGiVBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4377013AAD;
 Mon, 20 Oct 2025 09:38:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id CIZ4EBID9mg+DwAAD6G6ig
 (envelope-from <jack@suse.cz>); Mon, 20 Oct 2025 09:38:26 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
 id 04A47A0856; Mon, 20 Oct 2025 11:38:25 +0200 (CEST)
Date: Mon, 20 Oct 2025 11:38:25 +0200
To: Jeff Layton <jlayton@kernel.org>
Subject: Re: [PATCH 05/13] vfs: allow rmdir to wait for delegation break on
 parent
Message-ID: <dmixw6ybhw2bqfejcpd5xq6i6o77heuunhnezy3nwrgraw2fce@e7xhnz24u6yn>
References: <20251013-dir-deleg-ro-v1-0-406780a70e5e@kernel.org>
 <20251013-dir-deleg-ro-v1-5-406780a70e5e@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251013-dir-deleg-ro-v1-5-406780a70e5e@kernel.org>
X-Rspamd-Queue-Id: 503481F387
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-2.51 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 SUSPICIOUS_RECIPS(1.50)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 MID_RHS_NOT_FQDN(0.50)[]; NEURAL_HAM_SHORT(-0.20)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 MIME_GOOD(-0.10)[text/plain]; MX_GOOD(-0.01)[];
 RCVD_COUNT_THREE(0.00)[3];
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 ARC_NA(0.00)[]; RCPT_COUNT_TWELVE(0.00)[44];
 MIME_TRACE(0.00)[0:+]; RCVD_TLS_LAST(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]; TO_DN_SOME(0.00)[];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 TAGGED_RCPT(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 R_RATELIMIT(0.00)[to_ip_from(RLpnapcpkwxdkc5mopt1ezhhna)];
 MISSING_XM_UA(0.00)[];
 FREEMAIL_CC(0.00)[szeredi.hu,zeniv.linux.org.uk,kernel.org,suse.cz,oracle.com,gmail.com,samba.org,manguebit.org,microsoft.com,talpey.com,linuxfoundation.org,redhat.com,tyhicks.com,brown.name,chromium.org,google.com,davemloft.net,vger.kernel.org,lists.samba.org,lists.linux.dev];
 DKIM_TRACE(0.00)[suse.cz:+];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email, imap1.dmz-prg2.suse.org:helo,
 imap1.dmz-prg2.suse.org:rdns]
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -2.51
X-Mailman-Approved-At: Tue, 21 Oct 2025 08:07:34 +0000
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
 Eric Dumazet <edumazet@google.com>, Danilo Krummrich <dakr@kernel.org>,
 linux-cifs@vger.kernel.org, Kuniyuki Iwashima <kuniyu@google.com>,
 Miklos Szeredi <miklos@szeredi.hu>, Dai Ngo <Dai.Ngo@oracle.com>,
 Tyler Hicks <code@tyhicks.com>, Steve French <smfrench@gmail.com>,
 NeilBrown <neil@brown.name>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Namjae Jeon <linkinjeon@kernel.org>,
 Shyam Prasad N <sprasad@microsoft.com>,
 Olga Kornievskaia <okorniev@redhat.com>, Simon Horman <horms@kernel.org>,
 ecryptfs@vger.kernel.org, linux-nfs@vger.kernel.org,
 Tom Talpey <tom@talpey.com>, Bharath SM <bharathsm@microsoft.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>, linux-xfs@vger.kernel.org,
 Christian Brauner <brauner@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 samba-technical@lists.samba.org, linux-kernel@vger.kernel.org,
 Steve French <sfrench@samba.org>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Chuck Lever <chuck.lever@oracle.com>, Anna Schumaker <anna@kernel.org>,
 netdev@vger.kernel.org, linux-fsdevel@vger.kernel.org, netfs@lists.linux.dev,
 "David S. Miller" <davem@davemloft.net>, Trond Myklebust <trondmy@kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Mon 13-10-25 10:48:03, Jeff Layton wrote:
> In order to add directory delegation support, we need to break
> delegations on the parent whenever there is going to be a change in the
> directory.
> 
> Add a "delegated_inode" return pointer to vfs_rmdir() and populate that
> pointer with the parent inode if it's non-NULL. Most existing in-kernel
> callers pass in a NULL pointer.
> 
> Signed-off-by: Jeff Layton <jlayton@kernel.org>

Looks good. Feel free to add:

Reviewed-by: Jan Kara <jack@suse.cz>

								Honza

> ---
>  drivers/base/devtmpfs.c  |  2 +-
>  fs/ecryptfs/inode.c      |  2 +-
>  fs/namei.c               | 22 +++++++++++++++++-----
>  fs/nfsd/nfs4recover.c    |  4 ++--
>  fs/nfsd/vfs.c            |  2 +-
>  fs/overlayfs/overlayfs.h |  2 +-
>  fs/smb/server/vfs.c      |  4 ++--
>  include/linux/fs.h       |  3 ++-
>  8 files changed, 27 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/base/devtmpfs.c b/drivers/base/devtmpfs.c
> index 0e79621cb0f79870003b867ca384199171ded4e0..104025104ef75381984fd94dfbd50feeaa8cdd22 100644
> --- a/drivers/base/devtmpfs.c
> +++ b/drivers/base/devtmpfs.c
> @@ -261,7 +261,7 @@ static int dev_rmdir(const char *name)
>  		return PTR_ERR(dentry);
>  	if (d_inode(dentry)->i_private == &thread)
>  		err = vfs_rmdir(&nop_mnt_idmap, d_inode(parent.dentry),
> -				dentry);
> +				dentry, NULL);
>  	else
>  		err = -EPERM;
>  
> diff --git a/fs/ecryptfs/inode.c b/fs/ecryptfs/inode.c
> index 35830b3144f8f71374a78b3e7463b864f4fc216e..88631291b32535f623a3fbe4ea9b6ed48a306ca0 100644
> --- a/fs/ecryptfs/inode.c
> +++ b/fs/ecryptfs/inode.c
> @@ -540,7 +540,7 @@ static int ecryptfs_rmdir(struct inode *dir, struct dentry *dentry)
>  		if (d_unhashed(lower_dentry))
>  			rc = -EINVAL;
>  		else
> -			rc = vfs_rmdir(&nop_mnt_idmap, lower_dir, lower_dentry);
> +			rc = vfs_rmdir(&nop_mnt_idmap, lower_dir, lower_dentry, NULL);
>  	}
>  	if (!rc) {
>  		clear_nlink(d_inode(dentry));
> diff --git a/fs/namei.c b/fs/namei.c
> index 86cf6eca1f485361c6732974e4103cf5ea721539..4b5a99653c558397e592715d9d4663cd4a63ef86 100644
> --- a/fs/namei.c
> +++ b/fs/namei.c
> @@ -4522,9 +4522,10 @@ SYSCALL_DEFINE2(mkdir, const char __user *, pathname, umode_t, mode)
>  
>  /**
>   * vfs_rmdir - remove directory
> - * @idmap:	idmap of the mount the inode was found from
> - * @dir:	inode of the parent directory
> - * @dentry:	dentry of the child directory
> + * @idmap:		idmap of the mount the inode was found from
> + * @dir:		inode of the parent directory
> + * @dentry:		dentry of the child directory
> + * @delegated_inode:	returns parent inode, if it's delegated.
>   *
>   * Remove a directory.
>   *
> @@ -4535,7 +4536,7 @@ SYSCALL_DEFINE2(mkdir, const char __user *, pathname, umode_t, mode)
>   * raw inode simply pass @nop_mnt_idmap.
>   */
>  int vfs_rmdir(struct mnt_idmap *idmap, struct inode *dir,
> -		     struct dentry *dentry)
> +	      struct dentry *dentry, struct inode **delegated_inode)
>  {
>  	int error = may_delete(idmap, dir, dentry, 1);
>  
> @@ -4557,6 +4558,10 @@ int vfs_rmdir(struct mnt_idmap *idmap, struct inode *dir,
>  	if (error)
>  		goto out;
>  
> +	error = try_break_deleg(dir, delegated_inode);
> +	if (error)
> +		goto out;
> +
>  	error = dir->i_op->rmdir(dir, dentry);
>  	if (error)
>  		goto out;
> @@ -4583,6 +4588,7 @@ int do_rmdir(int dfd, struct filename *name)
>  	struct qstr last;
>  	int type;
>  	unsigned int lookup_flags = 0;
> +	struct inode *delegated_inode = NULL;
>  retry:
>  	error = filename_parentat(dfd, name, lookup_flags, &path, &last, &type);
>  	if (error)
> @@ -4612,7 +4618,8 @@ int do_rmdir(int dfd, struct filename *name)
>  	error = security_path_rmdir(&path, dentry);
>  	if (error)
>  		goto exit4;
> -	error = vfs_rmdir(mnt_idmap(path.mnt), path.dentry->d_inode, dentry);
> +	error = vfs_rmdir(mnt_idmap(path.mnt), path.dentry->d_inode,
> +			  dentry, &delegated_inode);
>  exit4:
>  	dput(dentry);
>  exit3:
> @@ -4620,6 +4627,11 @@ int do_rmdir(int dfd, struct filename *name)
>  	mnt_drop_write(path.mnt);
>  exit2:
>  	path_put(&path);
> +	if (delegated_inode) {
> +		error = break_deleg_wait(&delegated_inode);
> +		if (!error)
> +			goto retry;
> +	}
>  	if (retry_estale(error, lookup_flags)) {
>  		lookup_flags |= LOOKUP_REVAL;
>  		goto retry;
> diff --git a/fs/nfsd/nfs4recover.c b/fs/nfsd/nfs4recover.c
> index 3dfbb85c9a1166b56e56eb9f1d6bfd140584730b..ad3acbb956d90cac88f74e5f598719af6f1f8328 100644
> --- a/fs/nfsd/nfs4recover.c
> +++ b/fs/nfsd/nfs4recover.c
> @@ -275,7 +275,7 @@ nfsd4_unlink_clid_dir(char *name, struct nfsd_net *nn)
>  	status = -ENOENT;
>  	if (d_really_is_negative(dentry))
>  		goto out;
> -	status = vfs_rmdir(&nop_mnt_idmap, d_inode(dir), dentry);
> +	status = vfs_rmdir(&nop_mnt_idmap, d_inode(dir), dentry, NULL);
>  out:
>  	dput(dentry);
>  out_unlock:
> @@ -367,7 +367,7 @@ purge_old(struct dentry *parent, char *cname, struct nfsd_net *nn)
>  	inode_lock_nested(d_inode(parent), I_MUTEX_PARENT);
>  	child = lookup_one(&nop_mnt_idmap, &QSTR(cname), parent);
>  	if (!IS_ERR(child)) {
> -		status = vfs_rmdir(&nop_mnt_idmap, d_inode(parent), child);
> +		status = vfs_rmdir(&nop_mnt_idmap, d_inode(parent), child, NULL);
>  		if (status)
>  			printk("failed to remove client recovery directory %pd\n",
>  			       child);
> diff --git a/fs/nfsd/vfs.c b/fs/nfsd/vfs.c
> index 447f5ab8e0b92288c9f220060ab15f32f2a84de9..7d8cd2595f197be9741ee6320d43ed6651896647 100644
> --- a/fs/nfsd/vfs.c
> +++ b/fs/nfsd/vfs.c
> @@ -2194,7 +2194,7 @@ nfsd_unlink(struct svc_rqst *rqstp, struct svc_fh *fhp, int type,
>  				break;
>  		}
>  	} else {
> -		host_err = vfs_rmdir(&nop_mnt_idmap, dirp, rdentry);
> +		host_err = vfs_rmdir(&nop_mnt_idmap, dirp, rdentry, NULL);
>  	}
>  	fh_fill_post_attrs(fhp);
>  
> diff --git a/fs/overlayfs/overlayfs.h b/fs/overlayfs/overlayfs.h
> index 0f65f9a5d54d4786b39e4f4f30f416d5b9016e70..d215d7349489686b66bb66e939b27046f7d836f6 100644
> --- a/fs/overlayfs/overlayfs.h
> +++ b/fs/overlayfs/overlayfs.h
> @@ -206,7 +206,7 @@ static inline int ovl_do_notify_change(struct ovl_fs *ofs,
>  static inline int ovl_do_rmdir(struct ovl_fs *ofs,
>  			       struct inode *dir, struct dentry *dentry)
>  {
> -	int err = vfs_rmdir(ovl_upper_mnt_idmap(ofs), dir, dentry);
> +	int err = vfs_rmdir(ovl_upper_mnt_idmap(ofs), dir, dentry, NULL);
>  
>  	pr_debug("rmdir(%pd2) = %i\n", dentry, err);
>  	return err;
> diff --git a/fs/smb/server/vfs.c b/fs/smb/server/vfs.c
> index 3d2190f26623b23ea79c63410905a3c3ad684048..c5f0f3170d586cb2dc4d416b80948c642797fb82 100644
> --- a/fs/smb/server/vfs.c
> +++ b/fs/smb/server/vfs.c
> @@ -609,7 +609,7 @@ int ksmbd_vfs_remove_file(struct ksmbd_work *work, const struct path *path)
>  
>  	idmap = mnt_idmap(path->mnt);
>  	if (S_ISDIR(d_inode(path->dentry)->i_mode)) {
> -		err = vfs_rmdir(idmap, d_inode(parent), path->dentry);
> +		err = vfs_rmdir(idmap, d_inode(parent), path->dentry, NULL);
>  		if (err && err != -ENOTEMPTY)
>  			ksmbd_debug(VFS, "rmdir failed, err %d\n", err);
>  	} else {
> @@ -1090,7 +1090,7 @@ int ksmbd_vfs_unlink(struct file *filp)
>  	dget(dentry);
>  
>  	if (S_ISDIR(d_inode(dentry)->i_mode))
> -		err = vfs_rmdir(idmap, d_inode(dir), dentry);
> +		err = vfs_rmdir(idmap, d_inode(dir), dentry, NULL);
>  	else
>  		err = vfs_unlink(idmap, d_inode(dir), dentry, NULL);
>  
> diff --git a/include/linux/fs.h b/include/linux/fs.h
> index 1040df3792794cd353b86558b41618294e25b8a6..d8bdaf7c87502ff17775602f5391d375738b4ed8 100644
> --- a/include/linux/fs.h
> +++ b/include/linux/fs.h
> @@ -2120,7 +2120,8 @@ int vfs_symlink(struct mnt_idmap *, struct inode *,
>  		struct dentry *, const char *);
>  int vfs_link(struct dentry *, struct mnt_idmap *, struct inode *,
>  	     struct dentry *, struct inode **);
> -int vfs_rmdir(struct mnt_idmap *, struct inode *, struct dentry *);
> +int vfs_rmdir(struct mnt_idmap *, struct inode *, struct dentry *,
> +	      struct inode **);
>  int vfs_unlink(struct mnt_idmap *, struct inode *, struct dentry *,
>  	       struct inode **);
>  
> 
> -- 
> 2.51.0
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

