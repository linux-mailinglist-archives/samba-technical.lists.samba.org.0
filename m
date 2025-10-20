Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A8D51BF52D9
	for <lists+samba-technical@lfdr.de>; Tue, 21 Oct 2025 10:09:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=z9tk0MymbeEPEc97HmDnOdd6Tee2QpVHpskZDB00+A0=; b=xGBpxUF9N/sjjNgGPvUff0837x
	n/ZTGCxeaG3CiIH01mLgjcugsyWJahC55FLW8gT5w//3pCc88LKDVfZtnQZRVduLUzF3Z8+QJon6x
	50Gz+YezLkn2tmcuLSU0nzvu3tgnJ5f6Xp/PeTY0tsm/oypvlAA+5528lZU2dYhE1noh0hkr5Ai/t
	Scsd52l1PfrZVoxtRk7+BkvKNoL4X/P/6+Gi/ERBiuQa1OZd1ZYMsIeCY4f/fopznMSNE9mbQ+gfZ
	l3pN5nsgqLesyEqmnzpNrptcNSzZVY8xTzMyVBghV/SkmChvZWHxYMMzj/9rNSRVgmJPsIOcSNZoO
	qlyEIW8g==;
Received: from ip6-localhost ([::1]:40630 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vB7QZ-008QBD-8r; Tue, 21 Oct 2025 08:09:07 +0000
Received: from smtp-out2.suse.de ([195.135.223.131]:57580) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vAmLs-008Lex-Gf
 for samba-technical@lists.samba.org; Mon, 20 Oct 2025 09:38:56 +0000
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id AD4221F391;
 Mon, 20 Oct 2025 09:38:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1760953121; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=z9tk0MymbeEPEc97HmDnOdd6Tee2QpVHpskZDB00+A0=;
 b=PMoc3eH+z0ztx01o56U11wC8lTz9omQBMba625hKDZNzBzDX7ztNvE0i2ZWi3TaGaOjQr/
 ROyLSAUg8v5LUavcxE5TKsmbFta5xgosf7E6GElNpmU2EKM+I3Bqzj9wmsdhpgCmCJ2EN0
 euyZZbCiP8S1qGdwoNcHFFDKTJSxCvI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1760953121;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=z9tk0MymbeEPEc97HmDnOdd6Tee2QpVHpskZDB00+A0=;
 b=xpQ8z13td4NPQPHGowYAyCUwVENEAuUpdgHT0rSgrmLtdLC09oj9Vi2Fzj/jWudLGWHxGt
 VXb5w+rH9mvAyaAw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1760953121; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=z9tk0MymbeEPEc97HmDnOdd6Tee2QpVHpskZDB00+A0=;
 b=PMoc3eH+z0ztx01o56U11wC8lTz9omQBMba625hKDZNzBzDX7ztNvE0i2ZWi3TaGaOjQr/
 ROyLSAUg8v5LUavcxE5TKsmbFta5xgosf7E6GElNpmU2EKM+I3Bqzj9wmsdhpgCmCJ2EN0
 euyZZbCiP8S1qGdwoNcHFFDKTJSxCvI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1760953121;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=z9tk0MymbeEPEc97HmDnOdd6Tee2QpVHpskZDB00+A0=;
 b=xpQ8z13td4NPQPHGowYAyCUwVENEAuUpdgHT0rSgrmLtdLC09oj9Vi2Fzj/jWudLGWHxGt
 VXb5w+rH9mvAyaAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A000C13AAD;
 Mon, 20 Oct 2025 09:38:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 3A4NJyED9mhjDwAAD6G6ig
 (envelope-from <jack@suse.cz>); Mon, 20 Oct 2025 09:38:41 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
 id 55145A0856; Mon, 20 Oct 2025 11:38:41 +0200 (CEST)
Date: Mon, 20 Oct 2025 11:38:41 +0200
To: Jeff Layton <jlayton@kernel.org>
Subject: Re: [PATCH 08/13] vfs: make vfs_mknod break delegations on parent
 directory
Message-ID: <vuf6ypnlwgo6edemvtdhx3cpoufpr2iojbzqd4urocqjuoxj76@v7xwlpwnn77a>
References: <20251013-dir-deleg-ro-v1-0-406780a70e5e@kernel.org>
 <20251013-dir-deleg-ro-v1-8-406780a70e5e@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251013-dir-deleg-ro-v1-8-406780a70e5e@kernel.org>
X-Spamd-Result: default: False [-2.30 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 SUSPICIOUS_RECIPS(1.50)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 MID_RHS_NOT_FQDN(0.50)[]; NEURAL_HAM_SHORT(-0.20)[-1.000];
 MIME_GOOD(-0.10)[text/plain]; RCVD_VIA_SMTP_AUTH(0.00)[];
 ARC_NA(0.00)[]; MIME_TRACE(0.00)[0:+]; TO_DN_SOME(0.00)[];
 MISSING_XM_UA(0.00)[]; RCPT_COUNT_TWELVE(0.00)[44];
 TAGGED_RCPT(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com];
 R_RATELIMIT(0.00)[to_ip_from(RL63fqwwx8ot6gmekemcs76f9d)];
 FROM_HAS_DN(0.00)[];
 FREEMAIL_CC(0.00)[szeredi.hu,zeniv.linux.org.uk,kernel.org,suse.cz,oracle.com,gmail.com,samba.org,manguebit.org,microsoft.com,talpey.com,linuxfoundation.org,redhat.com,tyhicks.com,brown.name,chromium.org,google.com,davemloft.net,vger.kernel.org,lists.samba.org,lists.linux.dev];
 RCVD_COUNT_THREE(0.00)[3]; FROM_EQ_ENVFROM(0.00)[];
 RCVD_TLS_LAST(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.com:email]
X-Spam-Flag: NO
X-Spam-Score: -2.30
X-Mailman-Approved-At: Tue, 21 Oct 2025 08:08:15 +0000
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

On Mon 13-10-25 10:48:06, Jeff Layton wrote:
> In order to add directory delegation support, we need to break
> delegations on the parent whenever there is going to be a change in the
> directory.
> 
> Add a new delegated_inode return pointer to vfs_mknod() and have the
> appropriate callers wait when there is an outstanding delegation. All
> other callers just set the pointer to NULL.
> 
> Signed-off-by: Jeff Layton <jlayton@kernel.org>

Looks good. Feel free to add:

Reviewed-by: Jan Kara <jack@suse.cz>

								Honza

> ---
>  drivers/base/devtmpfs.c  |  2 +-
>  fs/ecryptfs/inode.c      |  2 +-
>  fs/init.c                |  2 +-
>  fs/namei.c               | 25 +++++++++++++++++--------
>  fs/nfsd/vfs.c            |  2 +-
>  fs/overlayfs/overlayfs.h |  2 +-
>  include/linux/fs.h       |  4 ++--
>  net/unix/af_unix.c       |  2 +-
>  8 files changed, 25 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/base/devtmpfs.c b/drivers/base/devtmpfs.c
> index 104025104ef75381984fd94dfbd50feeaa8cdd22..2f576ecf18324f767cd5ac6cbd28adbf9f46b958 100644
> --- a/drivers/base/devtmpfs.c
> +++ b/drivers/base/devtmpfs.c
> @@ -231,7 +231,7 @@ static int handle_create(const char *nodename, umode_t mode, kuid_t uid,
>  		return PTR_ERR(dentry);
>  
>  	err = vfs_mknod(&nop_mnt_idmap, d_inode(path.dentry), dentry, mode,
> -			dev->devt);
> +			dev->devt, NULL);
>  	if (!err) {
>  		struct iattr newattrs;
>  
> diff --git a/fs/ecryptfs/inode.c b/fs/ecryptfs/inode.c
> index 88631291b32535f623a3fbe4ea9b6ed48a306ca0..acef6d921167268d4590c688894d4522016db0dd 100644
> --- a/fs/ecryptfs/inode.c
> +++ b/fs/ecryptfs/inode.c
> @@ -565,7 +565,7 @@ ecryptfs_mknod(struct mnt_idmap *idmap, struct inode *dir,
>  	rc = lock_parent(dentry, &lower_dentry, &lower_dir);
>  	if (!rc)
>  		rc = vfs_mknod(&nop_mnt_idmap, lower_dir,
> -			       lower_dentry, mode, dev);
> +			       lower_dentry, mode, dev, NULL);
>  	if (rc || d_really_is_negative(lower_dentry))
>  		goto out;
>  	rc = ecryptfs_interpose(lower_dentry, dentry, dir->i_sb);
> diff --git a/fs/init.c b/fs/init.c
> index 895f8a09a71acfd03e11164e3b441a7d4e2de146..4f02260dd65b0dfcbfbf5812d2ec6a33444a3b1f 100644
> --- a/fs/init.c
> +++ b/fs/init.c
> @@ -157,7 +157,7 @@ int __init init_mknod(const char *filename, umode_t mode, unsigned int dev)
>  	error = security_path_mknod(&path, dentry, mode, dev);
>  	if (!error)
>  		error = vfs_mknod(mnt_idmap(path.mnt), path.dentry->d_inode,
> -				  dentry, mode, new_decode_dev(dev));
> +				  dentry, mode, new_decode_dev(dev), NULL);
>  	end_creating_path(&path, dentry);
>  	return error;
>  }
> diff --git a/fs/namei.c b/fs/namei.c
> index 1427c53e13978e70adefdc572b71247536985430..2e1e3f0068a28271e07aa0fa0c7e0b04582400fe 100644
> --- a/fs/namei.c
> +++ b/fs/namei.c
> @@ -4302,13 +4302,15 @@ inline struct dentry *start_creating_user_path(
>  }
>  EXPORT_SYMBOL(start_creating_user_path);
>  
> +
>  /**
>   * vfs_mknod - create device node or file
> - * @idmap:	idmap of the mount the inode was found from
> - * @dir:	inode of the parent directory
> - * @dentry:	dentry of the child device node
> - * @mode:	mode of the child device node
> - * @dev:	device number of device to create
> + * @idmap:		idmap of the mount the inode was found from
> + * @dir:		inode of the parent directory
> + * @dentry:		dentry of the child device node
> + * @mode:		mode of the child device node
> + * @dev:		device number of device to create
> + * @delegated_inode:	returns parent inode, if the inode is delegated.
>   *
>   * Create a device node or file.
>   *
> @@ -4319,7 +4321,8 @@ EXPORT_SYMBOL(start_creating_user_path);
>   * raw inode simply pass @nop_mnt_idmap.
>   */
>  int vfs_mknod(struct mnt_idmap *idmap, struct inode *dir,
> -	      struct dentry *dentry, umode_t mode, dev_t dev)
> +	      struct dentry *dentry, umode_t mode, dev_t dev,
> +	      struct inode **delegated_inode)
>  {
>  	bool is_whiteout = S_ISCHR(mode) && dev == WHITEOUT_DEV;
>  	int error = may_create(idmap, dir, dentry);
> @@ -4343,6 +4346,10 @@ int vfs_mknod(struct mnt_idmap *idmap, struct inode *dir,
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
> @@ -4402,11 +4409,13 @@ static int do_mknodat(int dfd, struct filename *name, umode_t mode,
>  			break;
>  		case S_IFCHR: case S_IFBLK:
>  			error = vfs_mknod(idmap, path.dentry->d_inode,
> -					  dentry, mode, new_decode_dev(dev));
> +					  dentry, mode, new_decode_dev(dev),
> +					  &delegated_inode);
>  			break;
>  		case S_IFIFO: case S_IFSOCK:
>  			error = vfs_mknod(idmap, path.dentry->d_inode,
> -					  dentry, mode, 0);
> +					  dentry, mode, 0,
> +					  &delegated_inode);
>  			break;
>  	}
>  out2:
> diff --git a/fs/nfsd/vfs.c b/fs/nfsd/vfs.c
> index 7d8cd2595f197be9741ee6320d43ed6651896647..858485c76b6524e965b7cbc92f67c1a4eb19e34e 100644
> --- a/fs/nfsd/vfs.c
> +++ b/fs/nfsd/vfs.c
> @@ -1660,7 +1660,7 @@ nfsd_create_locked(struct svc_rqst *rqstp, struct svc_fh *fhp,
>  	case S_IFIFO:
>  	case S_IFSOCK:
>  		host_err = vfs_mknod(&nop_mnt_idmap, dirp, dchild,
> -				     iap->ia_mode, rdev);
> +				     iap->ia_mode, rdev, NULL);
>  		break;
>  	default:
>  		printk(KERN_WARNING "nfsd: bad file type %o in nfsd_create\n",
> diff --git a/fs/overlayfs/overlayfs.h b/fs/overlayfs/overlayfs.h
> index d215d7349489686b66bb66e939b27046f7d836f6..8b8c99e9e1a518c365cfff952d391887ec18d453 100644
> --- a/fs/overlayfs/overlayfs.h
> +++ b/fs/overlayfs/overlayfs.h
> @@ -257,7 +257,7 @@ static inline int ovl_do_mknod(struct ovl_fs *ofs,
>  			       struct inode *dir, struct dentry *dentry,
>  			       umode_t mode, dev_t dev)
>  {
> -	int err = vfs_mknod(ovl_upper_mnt_idmap(ofs), dir, dentry, mode, dev);
> +	int err = vfs_mknod(ovl_upper_mnt_idmap(ofs), dir, dentry, mode, dev, NULL);
>  
>  	pr_debug("mknod(%pd2, 0%o, 0%o) = %i\n", dentry, mode, dev, err);
>  	return err;
> diff --git a/include/linux/fs.h b/include/linux/fs.h
> index d8bdaf7c87502ff17775602f5391d375738b4ed8..4ad49b39441b2c9088fd01a7e0e46a6511c26d2e 100644
> --- a/include/linux/fs.h
> +++ b/include/linux/fs.h
> @@ -2115,7 +2115,7 @@ int vfs_create(struct mnt_idmap *, struct inode *,
>  struct dentry *vfs_mkdir(struct mnt_idmap *, struct inode *,
>  			 struct dentry *, umode_t, struct inode **);
>  int vfs_mknod(struct mnt_idmap *, struct inode *, struct dentry *,
> -              umode_t, dev_t);
> +	      umode_t, dev_t, struct inode **);
>  int vfs_symlink(struct mnt_idmap *, struct inode *,
>  		struct dentry *, const char *);
>  int vfs_link(struct dentry *, struct mnt_idmap *, struct inode *,
> @@ -2151,7 +2151,7 @@ static inline int vfs_whiteout(struct mnt_idmap *idmap,
>  			       struct inode *dir, struct dentry *dentry)
>  {
>  	return vfs_mknod(idmap, dir, dentry, S_IFCHR | WHITEOUT_MODE,
> -			 WHITEOUT_DEV);
> +			 WHITEOUT_DEV, NULL);
>  }
>  
>  struct file *kernel_tmpfile_open(struct mnt_idmap *idmap,
> diff --git a/net/unix/af_unix.c b/net/unix/af_unix.c
> index 768098dec2310008632558ae928703b37c3cc8ef..db1fd8d6a84c2c7c0d45b43d9c5a936b3d491b7b 100644
> --- a/net/unix/af_unix.c
> +++ b/net/unix/af_unix.c
> @@ -1399,7 +1399,7 @@ static int unix_bind_bsd(struct sock *sk, struct sockaddr_un *sunaddr,
>  	idmap = mnt_idmap(parent.mnt);
>  	err = security_path_mknod(&parent, dentry, mode, 0);
>  	if (!err)
> -		err = vfs_mknod(idmap, d_inode(parent.dentry), dentry, mode, 0);
> +		err = vfs_mknod(idmap, d_inode(parent.dentry), dentry, mode, 0, NULL);
>  	if (err)
>  		goto out_path;
>  	err = mutex_lock_interruptible(&u->bindlock);
> 
> -- 
> 2.51.0
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

