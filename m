Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A76FBA2F4A
	for <lists+samba-technical@lfdr.de>; Fri, 26 Sep 2025 10:31:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=H7kAeq27Btf68kumqbIJpRiiXBnvJcpACUD2OM/hNzM=; b=toNMfhbYwtRmdvwDL5UMwHXmGl
	pMvFGlYinZGrYLsLqJE3G6InCmuEE9s1w41kjckcoFR2uaKKy4vdTF/XgNHm7zcwOgHMQiasiIUFR
	Vn7O7JVugi0OwHBdAMWmqYG3q6rD/sGH+JVImPx+jN5jrZGotupf8wpTnnbKKXgg3koBad6ishpyu
	/UurkCDmQl4rM/iwaZhxgqOcADYMvKGNTLsHMghvP12O9Wh1Z+uy+hiMHLHZ8pwr6as6HmXb7Irdo
	Mbjg2TdCI2/z6TYKB7COHS07yq27D5h1kDD1C6l2MInSTqqBNEQHqMbnvzkCOxbpW3gnPs/PCZUvI
	JiTotQHw==;
Received: from ip6-localhost ([::1]:31138 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1v23qj-004nHz-HA; Fri, 26 Sep 2025 08:30:41 +0000
Received: from smtp-out2.suse.de ([2a07:de40:b251:101:10:150:64:2]:41302) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1v1ow4-004l5f-Km
 for samba-technical@lists.samba.org; Thu, 25 Sep 2025 16:35:16 +0000
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 0DB223EBB1;
 Thu, 25 Sep 2025 15:58:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1758815928; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=H7kAeq27Btf68kumqbIJpRiiXBnvJcpACUD2OM/hNzM=;
 b=XFlomXezvgCdYhPrZPrF6PTKy2r5oyB9lm5OG2R1NC2/O/HDpat/tt8llvIWWmXnZDWLHh
 QSHhVHkDtm7QZd4B0tIlYKpLlUl3BBSK60rstqPvp2zYy/Q0Ube4nA1G5NyRXYoNPxDLAu
 9j8f2SoYu1i24wEoCRAF090xX0BD27A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1758815928;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=H7kAeq27Btf68kumqbIJpRiiXBnvJcpACUD2OM/hNzM=;
 b=dq5o9ACWLdxEeLy2B9gkrTzC7PkwZxZBzZBd3y3nzp2LtCipbNc5H2zLUSHA++af77Vdr4
 vx/Z9iIKBUXNH/CA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1758815928; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=H7kAeq27Btf68kumqbIJpRiiXBnvJcpACUD2OM/hNzM=;
 b=XFlomXezvgCdYhPrZPrF6PTKy2r5oyB9lm5OG2R1NC2/O/HDpat/tt8llvIWWmXnZDWLHh
 QSHhVHkDtm7QZd4B0tIlYKpLlUl3BBSK60rstqPvp2zYy/Q0Ube4nA1G5NyRXYoNPxDLAu
 9j8f2SoYu1i24wEoCRAF090xX0BD27A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1758815928;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=H7kAeq27Btf68kumqbIJpRiiXBnvJcpACUD2OM/hNzM=;
 b=dq5o9ACWLdxEeLy2B9gkrTzC7PkwZxZBzZBd3y3nzp2LtCipbNc5H2zLUSHA++af77Vdr4
 vx/Z9iIKBUXNH/CA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id EC1F313869;
 Thu, 25 Sep 2025 15:58:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 86CiObdm1Wi6XQAAD6G6ig
 (envelope-from <jack@suse.cz>); Thu, 25 Sep 2025 15:58:47 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
 id 8D564A0AA0; Thu, 25 Sep 2025 17:58:47 +0200 (CEST)
Date: Thu, 25 Sep 2025 17:58:47 +0200
To: Jeff Layton <jlayton@kernel.org>
Subject: Re: [PATCH v3 04/38] vfs: allow mkdir to wait for delegation break
 on parent
Message-ID: <t5keaycmuzytufkjufw54hpt6sf4mfjsvehc67zqxwoexuofhg@5jmeznwtcup4>
References: <20250924-dir-deleg-v3-0-9f3af8bc5c40@kernel.org>
 <20250924-dir-deleg-v3-4-9f3af8bc5c40@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250924-dir-deleg-v3-4-9f3af8bc5c40@kernel.org>
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
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:email,suse.com:email]
X-Spam-Flag: NO
X-Spam-Score: -2.30
X-Mailman-Approved-At: Fri, 26 Sep 2025 08:30:39 +0000
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

On Wed 24-09-25 14:05:50, Jeff Layton wrote:
> In order to add directory delegation support, we need to break
> delegations on the parent whenever there is going to be a change in the
> directory.
> 
> Rename the existing vfs_mkdir to __vfs_mkdir, make it static and add a
> new delegated_inode parameter. Add a new exported vfs_mkdir wrapper
> around it that passes a NULL pointer for delegated_inode.
> 
> Signed-off-by: Jeff Layton <jlayton@kernel.org>

The changelog looks stale (__vfs_mkdir() doesn't exist anymore) but
otherwise the patch looks good. Feel free to add:

Reviewed-by: Jan Kara <jack@suse.cz>

								Honza

> ---
>  drivers/base/devtmpfs.c  |  2 +-
>  fs/cachefiles/namei.c    |  2 +-
>  fs/ecryptfs/inode.c      |  2 +-
>  fs/init.c                |  2 +-
>  fs/namei.c               | 24 ++++++++++++++++++------
>  fs/nfsd/nfs4recover.c    |  2 +-
>  fs/nfsd/vfs.c            |  2 +-
>  fs/overlayfs/overlayfs.h |  2 +-
>  fs/smb/server/vfs.c      |  2 +-
>  fs/xfs/scrub/orphanage.c |  2 +-
>  include/linux/fs.h       |  2 +-
>  11 files changed, 28 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/base/devtmpfs.c b/drivers/base/devtmpfs.c
> index 31bfb3194b4c29a1d6a002449045bf4e4141911d..a57da600ce7523e9e2755b78f75342bf4fa56ef6 100644
> --- a/drivers/base/devtmpfs.c
> +++ b/drivers/base/devtmpfs.c
> @@ -180,7 +180,7 @@ static int dev_mkdir(const char *name, umode_t mode)
>  	if (IS_ERR(dentry))
>  		return PTR_ERR(dentry);
>  
> -	dentry = vfs_mkdir(&nop_mnt_idmap, d_inode(path.dentry), dentry, mode);
> +	dentry = vfs_mkdir(&nop_mnt_idmap, d_inode(path.dentry), dentry, mode, NULL);
>  	if (!IS_ERR(dentry))
>  		/* mark as kernel-created inode */
>  		d_inode(dentry)->i_private = &thread;
> diff --git a/fs/cachefiles/namei.c b/fs/cachefiles/namei.c
> index 91dfd02318772fa63050ecf40fa5625ab48ad589..b3dac91efec622261186fbba8e704ae9e782bea0 100644
> --- a/fs/cachefiles/namei.c
> +++ b/fs/cachefiles/namei.c
> @@ -130,7 +130,7 @@ struct dentry *cachefiles_get_directory(struct cachefiles_cache *cache,
>  			goto mkdir_error;
>  		ret = cachefiles_inject_write_error();
>  		if (ret == 0)
> -			subdir = vfs_mkdir(&nop_mnt_idmap, d_inode(dir), subdir, 0700);
> +			subdir = vfs_mkdir(&nop_mnt_idmap, d_inode(dir), subdir, 0700, NULL);
>  		else
>  			subdir = ERR_PTR(ret);
>  		if (IS_ERR(subdir)) {
> diff --git a/fs/ecryptfs/inode.c b/fs/ecryptfs/inode.c
> index 72fbe1316ab8831bb4228d573278f32fe52b6b25..00f54c125b102856c33ffff24627475f40dcbc7b 100644
> --- a/fs/ecryptfs/inode.c
> +++ b/fs/ecryptfs/inode.c
> @@ -517,7 +517,7 @@ static struct dentry *ecryptfs_mkdir(struct mnt_idmap *idmap, struct inode *dir,
>  		goto out;
>  
>  	lower_dentry = vfs_mkdir(&nop_mnt_idmap, lower_dir,
> -				 lower_dentry, mode);
> +				 lower_dentry, mode, NULL);
>  	rc = PTR_ERR(lower_dentry);
>  	if (IS_ERR(lower_dentry))
>  		goto out;
> diff --git a/fs/init.c b/fs/init.c
> index eef5124885e372ac020d2923692116c5e884b3cf..dd5240ce8ad41f02367a54ddf1b6ac0aa28e9721 100644
> --- a/fs/init.c
> +++ b/fs/init.c
> @@ -232,7 +232,7 @@ int __init init_mkdir(const char *pathname, umode_t mode)
>  	error = security_path_mkdir(&path, dentry, mode);
>  	if (!error) {
>  		dentry = vfs_mkdir(mnt_idmap(path.mnt), path.dentry->d_inode,
> -				  dentry, mode);
> +				  dentry, mode, NULL);
>  		if (IS_ERR(dentry))
>  			error = PTR_ERR(dentry);
>  	}
> diff --git a/fs/namei.c b/fs/namei.c
> index cd517eb232317d326e6d2fc5a60cb4c7569a137d..c939a58f16f9c4edded424475aff52f2c423d301 100644
> --- a/fs/namei.c
> +++ b/fs/namei.c
> @@ -4320,10 +4320,11 @@ SYSCALL_DEFINE3(mknod, const char __user *, filename, umode_t, mode, unsigned, d
>  
>  /**
>   * vfs_mkdir - create directory returning correct dentry if possible
> - * @idmap:	idmap of the mount the inode was found from
> - * @dir:	inode of the parent directory
> - * @dentry:	dentry of the child directory
> - * @mode:	mode of the child directory
> + * @idmap:		idmap of the mount the inode was found from
> + * @dir:		inode of the parent directory
> + * @dentry:		dentry of the child directory
> + * @mode:		mode of the child directory
> + * @delegated_inode:	returns victim inode, if the inode is delegated.
>   *
>   * Create a directory.
>   *
> @@ -4340,7 +4341,8 @@ SYSCALL_DEFINE3(mknod, const char __user *, filename, umode_t, mode, unsigned, d
>   * In case of an error the dentry is dput() and an ERR_PTR() is returned.
>   */
>  struct dentry *vfs_mkdir(struct mnt_idmap *idmap, struct inode *dir,
> -			 struct dentry *dentry, umode_t mode)
> +			 struct dentry *dentry, umode_t mode,
> +			 struct inode **delegated_inode)
>  {
>  	int error;
>  	unsigned max_links = dir->i_sb->s_max_links;
> @@ -4363,6 +4365,10 @@ struct dentry *vfs_mkdir(struct mnt_idmap *idmap, struct inode *dir,
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
> @@ -4386,6 +4392,7 @@ int do_mkdirat(int dfd, struct filename *name, umode_t mode)
>  	struct path path;
>  	int error;
>  	unsigned int lookup_flags = LOOKUP_DIRECTORY;
> +	struct inode *delegated_inode = NULL;
>  
>  retry:
>  	dentry = filename_create(dfd, name, &path, lookup_flags);
> @@ -4397,11 +4404,16 @@ int do_mkdirat(int dfd, struct filename *name, umode_t mode)
>  			mode_strip_umask(path.dentry->d_inode, mode));
>  	if (!error) {
>  		dentry = vfs_mkdir(mnt_idmap(path.mnt), path.dentry->d_inode,
> -				  dentry, mode);
> +				   dentry, mode, &delegated_inode);
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
> diff --git a/fs/nfsd/nfs4recover.c b/fs/nfsd/nfs4recover.c
> index b1005abcb9035b2cf743200808a251b00af7e3f4..423dd102b51198ea7c447be2b9a0a5020c950dba 100644
> --- a/fs/nfsd/nfs4recover.c
> +++ b/fs/nfsd/nfs4recover.c
> @@ -202,7 +202,7 @@ nfsd4_create_clid_dir(struct nfs4_client *clp)
>  		 * as well be forgiving and just succeed silently.
>  		 */
>  		goto out_put;
> -	dentry = vfs_mkdir(&nop_mnt_idmap, d_inode(dir), dentry, S_IRWXU);
> +	dentry = vfs_mkdir(&nop_mnt_idmap, d_inode(dir), dentry, 0700, NULL);
>  	if (IS_ERR(dentry))
>  		status = PTR_ERR(dentry);
>  out_put:
> diff --git a/fs/nfsd/vfs.c b/fs/nfsd/vfs.c
> index 2026431500ecbc0cf5fb5d4af1a7632c611ce4f4..6f1275fdc8ac831aa0ea8da588f751eddff88df1 100644
> --- a/fs/nfsd/vfs.c
> +++ b/fs/nfsd/vfs.c
> @@ -1560,7 +1560,7 @@ nfsd_create_locked(struct svc_rqst *rqstp, struct svc_fh *fhp,
>  			nfsd_check_ignore_resizing(iap);
>  		break;
>  	case S_IFDIR:
> -		dchild = vfs_mkdir(&nop_mnt_idmap, dirp, dchild, iap->ia_mode);
> +		dchild = vfs_mkdir(&nop_mnt_idmap, dirp, dchild, iap->ia_mode, NULL);
>  		if (IS_ERR(dchild)) {
>  			host_err = PTR_ERR(dchild);
>  		} else if (d_is_negative(dchild)) {
> diff --git a/fs/overlayfs/overlayfs.h b/fs/overlayfs/overlayfs.h
> index bb0d7ded8e763a4a7a6fc506d966ed2f3bdb4f06..4a3a22f422c37d45e49a762cd3c9957aa2c6a485 100644
> --- a/fs/overlayfs/overlayfs.h
> +++ b/fs/overlayfs/overlayfs.h
> @@ -248,7 +248,7 @@ static inline struct dentry *ovl_do_mkdir(struct ovl_fs *ofs,
>  {
>  	struct dentry *ret;
>  
> -	ret = vfs_mkdir(ovl_upper_mnt_idmap(ofs), dir, dentry, mode);
> +	ret = vfs_mkdir(ovl_upper_mnt_idmap(ofs), dir, dentry, mode, NULL);
>  	pr_debug("mkdir(%pd2, 0%o) = %i\n", dentry, mode, PTR_ERR_OR_ZERO(ret));
>  	return ret;
>  }
> diff --git a/fs/smb/server/vfs.c b/fs/smb/server/vfs.c
> index 04539037108c93e285f4e9d6aa61f93a507ae5da..b0fb73b277876a56797f5cc8a5aa53f156bb7a26 100644
> --- a/fs/smb/server/vfs.c
> +++ b/fs/smb/server/vfs.c
> @@ -229,7 +229,7 @@ int ksmbd_vfs_mkdir(struct ksmbd_work *work, const char *name, umode_t mode)
>  	idmap = mnt_idmap(path.mnt);
>  	mode |= S_IFDIR;
>  	d = dentry;
> -	dentry = vfs_mkdir(idmap, d_inode(path.dentry), dentry, mode);
> +	dentry = vfs_mkdir(idmap, d_inode(path.dentry), dentry, mode, NULL);
>  	if (IS_ERR(dentry))
>  		err = PTR_ERR(dentry);
>  	else if (d_is_negative(dentry))
> diff --git a/fs/xfs/scrub/orphanage.c b/fs/xfs/scrub/orphanage.c
> index 9c12cb8442311ca26b169e4d1567939ae44a5be0..91c9d07b97f306f57aebb9b69ba564b0c2cb8c17 100644
> --- a/fs/xfs/scrub/orphanage.c
> +++ b/fs/xfs/scrub/orphanage.c
> @@ -167,7 +167,7 @@ xrep_orphanage_create(
>  	 */
>  	if (d_really_is_negative(orphanage_dentry)) {
>  		orphanage_dentry = vfs_mkdir(&nop_mnt_idmap, root_inode,
> -					     orphanage_dentry, 0750);
> +					     orphanage_dentry, 0750, NULL);
>  		error = PTR_ERR(orphanage_dentry);
>  		if (IS_ERR(orphanage_dentry))
>  			goto out_unlock_root;
> diff --git a/include/linux/fs.h b/include/linux/fs.h
> index 74f2bfc519263c6411a8e3427e1bd6680a1121db..24a091509f12ce65a2c8343d438fccf423d3062b 100644
> --- a/include/linux/fs.h
> +++ b/include/linux/fs.h
> @@ -1997,7 +1997,7 @@ bool inode_owner_or_capable(struct mnt_idmap *idmap,
>  int vfs_create(struct mnt_idmap *, struct inode *,
>  	       struct dentry *, umode_t, bool);
>  struct dentry *vfs_mkdir(struct mnt_idmap *, struct inode *,
> -			 struct dentry *, umode_t);
> +			 struct dentry *, umode_t, struct inode **);
>  int vfs_mknod(struct mnt_idmap *, struct inode *, struct dentry *,
>                umode_t, dev_t);
>  int vfs_symlink(struct mnt_idmap *, struct inode *,
> 
> -- 
> 2.51.0
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

