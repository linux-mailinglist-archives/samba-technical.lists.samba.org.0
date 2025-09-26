Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id C0293BA5C93
	for <lists+samba-technical@lfdr.de>; Sat, 27 Sep 2025 11:38:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=glSyxRB6Xj36ASiIjA+TJGgbXUZyzaV6dbkxB9p11to=; b=QOrs6lGaZcMlHo2TvSxE/6EX6o
	7sZg4At/1R7DYeQ3MvQAz7IH0+6ccjerHOmDnOycLqqOZN1QqHe5zsMbDK/9R1WnuwWApAXiEXr9D
	s/7jffQQBcbZBKXP0B0ULGGaVCWRGLQ4rkEc1O43YgMnJXWTAddJOOOuPkxFrnu3DY3xp1b+3rHJ+
	dlUtfWIq4RrRDqE5pIRi7mIGSL6s3bDuLvlnGc2hE0qU/tFm7XaGCdVCfoE3uW0MB0i4iaKdX39fC
	P8nov5mtRNT2zLxJXH9a3QbIlVFrozeAN93m9GPornq5EP2g43PdKBpIdc2zRCuNoWuLFA0mbAGrW
	1abCWsMw==;
Received: from ip6-localhost ([::1]:46524 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1v2RNX-004sQY-Dl; Sat, 27 Sep 2025 09:38:08 +0000
Received: from smtp-out2.suse.de ([2a07:de40:b251:101:10:150:64:2]:36832) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1v2ARm-004pyc-L2
 for samba-technical@lists.samba.org; Fri, 26 Sep 2025 15:33:25 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 1F8DD1F84F;
 Fri, 26 Sep 2025 15:33:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1758900800; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=glSyxRB6Xj36ASiIjA+TJGgbXUZyzaV6dbkxB9p11to=;
 b=hPN1Q/Z2I0LleaVvFRVk+yXLW6mKv8nxGbCL4ruk19wSvq+3uPTxnoPMPL2ZdNeXu68zEE
 ZHfIFjmXeybYmlsuTT/gGyP5+++DS0qkKLPB1nUbM6a2ZIIau/UlRX0DENJipCwjcahyG7
 kcnHCmHP8mfbc/flUmB1bDEzR5g62Ls=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1758900800;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=glSyxRB6Xj36ASiIjA+TJGgbXUZyzaV6dbkxB9p11to=;
 b=qvsmI3WJwdxotgPOWL64XgiQ7XQul3VTfRbYUxHg3hVGT+gxhleujtTOPyvGFODFYUjNhk
 Ub5wEs52eNFsq7BQ==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.cz header.s=susede2_rsa header.b="hPN1Q/Z2";
 dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=qvsmI3WJ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1758900800; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=glSyxRB6Xj36ASiIjA+TJGgbXUZyzaV6dbkxB9p11to=;
 b=hPN1Q/Z2I0LleaVvFRVk+yXLW6mKv8nxGbCL4ruk19wSvq+3uPTxnoPMPL2ZdNeXu68zEE
 ZHfIFjmXeybYmlsuTT/gGyP5+++DS0qkKLPB1nUbM6a2ZIIau/UlRX0DENJipCwjcahyG7
 kcnHCmHP8mfbc/flUmB1bDEzR5g62Ls=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1758900800;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=glSyxRB6Xj36ASiIjA+TJGgbXUZyzaV6dbkxB9p11to=;
 b=qvsmI3WJwdxotgPOWL64XgiQ7XQul3VTfRbYUxHg3hVGT+gxhleujtTOPyvGFODFYUjNhk
 Ub5wEs52eNFsq7BQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0CA6E1386E;
 Fri, 26 Sep 2025 15:33:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id Wk0VA0Cy1mj4AgAAD6G6ig
 (envelope-from <jack@suse.cz>); Fri, 26 Sep 2025 15:33:20 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
 id B7903A0AA0; Fri, 26 Sep 2025 17:33:19 +0200 (CEST)
Date: Fri, 26 Sep 2025 17:33:19 +0200
To: Jeff Layton <jlayton@kernel.org>
Subject: Re: [PATCH v3 07/38] vfs: make vfs_create break delegations on
 parent directory
Message-ID: <jshbhldhrbr2vbzfvuary3qowbfavcgkjznbgnjwhnxvmudvhw@c2uam4vtghcw>
References: <20250924-dir-deleg-v3-0-9f3af8bc5c40@kernel.org>
 <20250924-dir-deleg-v3-7-9f3af8bc5c40@kernel.org>
 <otguskcvjqwcojy6tsw7yimvshsgtj4vl7ciwksxazx7z5s2ko@vjyf5plolvvf>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <otguskcvjqwcojy6tsw7yimvshsgtj4vl7ciwksxazx7z5s2ko@vjyf5plolvvf>
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 1F8DD1F84F
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-2.51 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 SUSPICIOUS_RECIPS(1.50)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 MID_RHS_NOT_FQDN(0.50)[];
 R_DKIM_ALLOW(-0.20)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 RCPT_COUNT_TWELVE(0.00)[44]; RCVD_TLS_LAST(0.00)[];
 FUZZY_RATELIMITED(0.00)[rspamd.com]; MIME_TRACE(0.00)[0:+];
 ARC_NA(0.00)[];
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 RCVD_COUNT_THREE(0.00)[3]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com];
 FREEMAIL_CC(0.00)[zeniv.linux.org.uk,kernel.org,suse.cz,oracle.com,gmail.com,samba.org,microsoft.com,talpey.com,brown.name,redhat.com,lwn.net,szeredi.hu,manguebit.org,linuxfoundation.org,tyhicks.com,chromium.org,goodmis.org,efficios.com,vger.kernel.org,lists.samba.org,lists.linux.dev];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; TAGGED_RCPT(0.00)[]; MISSING_XM_UA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; DKIM_TRACE(0.00)[suse.cz:+];
 R_RATELIMIT(0.00)[to_ip_from(RLpnapcpkwxdkc5mopt1ezhhna)];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,
 imap1.dmz-prg2.suse.org:helo, suse.com:email, suse.cz:dkim, suse.cz:email]
X-Spam-Score: -2.51
X-Mailman-Approved-At: Sat, 27 Sep 2025 09:37:47 +0000
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

On Fri 26-09-25 17:23:41, Jan Kara wrote:
> On Wed 24-09-25 14:05:53, Jeff Layton wrote:
> > In order to add directory delegation support, we need to break
> > delegations on the parent whenever there is going to be a change in the
> > directory.
> > 
> > Rename vfs_create as __vfs_create, make it static, and add a new
> > delegated_inode parameter. Fix do_mknodat to call __vfs_create and wait
> > for a delegation break if there is one. Add a new exported vfs_create
> > wrapper that passes in NULL for delegated_inode.
> > 
> > Signed-off-by: Jeff Layton <jlayton@kernel.org>
> 
> Looks good. Feel free to add:
> 
> Reviewed-by: Jan Kara <jack@suse.cz>

Sorry, I've sent this twise by mistake.

								Honza

> > ---
> >  fs/namei.c | 55 ++++++++++++++++++++++++++++++++++++-------------------
> >  1 file changed, 36 insertions(+), 19 deletions(-)
> > 
> > diff --git a/fs/namei.c b/fs/namei.c
> > index 903b70a82530938a0fdf10508529a1b7cc38136d..d4b8330a3eb97e205dc2e71766fed1e45503323b 100644
> > --- a/fs/namei.c
> > +++ b/fs/namei.c
> > @@ -3370,6 +3370,32 @@ static inline umode_t vfs_prepare_mode(struct mnt_idmap *idmap,
> >  	return mode;
> >  }
> >  
> > +static int __vfs_create(struct mnt_idmap *idmap, struct inode *dir,
> > +			struct dentry *dentry, umode_t mode, bool want_excl,
> > +			struct inode **delegated_inode)
> > +{
> > +	int error;
> > +
> > +	error = may_create(idmap, dir, dentry);
> > +	if (error)
> > +		return error;
> > +
> > +	if (!dir->i_op->create)
> > +		return -EACCES;	/* shouldn't it be ENOSYS? */
> > +
> > +	mode = vfs_prepare_mode(idmap, dir, mode, S_IALLUGO, S_IFREG);
> > +	error = security_inode_create(dir, dentry, mode);
> > +	if (error)
> > +		return error;
> > +	error = try_break_deleg(dir, delegated_inode);
> > +	if (error)
> > +		return error;
> > +	error = dir->i_op->create(idmap, dir, dentry, mode, want_excl);
> > +	if (!error)
> > +		fsnotify_create(dir, dentry);
> > +	return error;
> > +}
> > +
> >  /**
> >   * vfs_create - create new file
> >   * @idmap:	idmap of the mount the inode was found from
> > @@ -3389,23 +3415,7 @@ static inline umode_t vfs_prepare_mode(struct mnt_idmap *idmap,
> >  int vfs_create(struct mnt_idmap *idmap, struct inode *dir,
> >  	       struct dentry *dentry, umode_t mode, bool want_excl)
> >  {
> > -	int error;
> > -
> > -	error = may_create(idmap, dir, dentry);
> > -	if (error)
> > -		return error;
> > -
> > -	if (!dir->i_op->create)
> > -		return -EACCES;	/* shouldn't it be ENOSYS? */
> > -
> > -	mode = vfs_prepare_mode(idmap, dir, mode, S_IALLUGO, S_IFREG);
> > -	error = security_inode_create(dir, dentry, mode);
> > -	if (error)
> > -		return error;
> > -	error = dir->i_op->create(idmap, dir, dentry, mode, want_excl);
> > -	if (!error)
> > -		fsnotify_create(dir, dentry);
> > -	return error;
> > +	return __vfs_create(idmap, dir, dentry, mode, want_excl, NULL);
> >  }
> >  EXPORT_SYMBOL(vfs_create);
> >  
> > @@ -4278,6 +4288,7 @@ static int do_mknodat(int dfd, struct filename *name, umode_t mode,
> >  	struct path path;
> >  	int error;
> >  	unsigned int lookup_flags = 0;
> > +	struct inode *delegated_inode = NULL;
> >  
> >  	error = may_mknod(mode);
> >  	if (error)
> > @@ -4296,8 +4307,9 @@ static int do_mknodat(int dfd, struct filename *name, umode_t mode,
> >  	idmap = mnt_idmap(path.mnt);
> >  	switch (mode & S_IFMT) {
> >  		case 0: case S_IFREG:
> > -			error = vfs_create(idmap, path.dentry->d_inode,
> > -					   dentry, mode, true);
> > +			error = __vfs_create(idmap, path.dentry->d_inode,
> > +					     dentry, mode, true,
> > +					     &delegated_inode);
> >  			if (!error)
> >  				security_path_post_mknod(idmap, dentry);
> >  			break;
> > @@ -4312,6 +4324,11 @@ static int do_mknodat(int dfd, struct filename *name, umode_t mode,
> >  	}
> >  out2:
> >  	done_path_create(&path, dentry);
> > +	if (delegated_inode) {
> > +		error = break_deleg_wait(&delegated_inode);
> > +		if (!error)
> > +			goto retry;
> > +	}
> >  	if (retry_estale(error, lookup_flags)) {
> >  		lookup_flags |= LOOKUP_REVAL;
> >  		goto retry;
> > 
> > -- 
> > 2.51.0
> > 
> -- 
> Jan Kara <jack@suse.com>
> SUSE Labs, CR
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

