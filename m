Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 39163BA5C89
	for <lists+samba-technical@lfdr.de>; Sat, 27 Sep 2025 11:37:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=t7I3nL9emy60PUNUbVVivj0+woihAPXFG+S4JuRgPgU=; b=W9p9X2r+vowOij/Uzaff7vXnDU
	qfDCJBWbFGg0hwLuejrT/YMfivZHNwgcAR2mR9GxOQ6RW7uVOYxlZahs8T6FE64mlvUH/O5GLBeo0
	OlzQopIEeXIQiYD45hgyyFCxh6IQhjh6GNj/kdhCyLV6D8VcnanSbmT5XJyB3TPWUCRoSpE8rpcvA
	gL3aBCjwiyPhyBe3ZyXMFSO5P9N3AL1gFVkHxHaK+Xt0v+ljzQ5lbRTaEBflpLSWTSf4nyw7B90kB
	6WMA9Vjph0hGlQBBIdAaPHADsC+sOzIYIZBxc1TiX7PhvjZs/LC5MXao8aoa1fEH8BRbsoo4UIpbF
	158ks//w==;
Received: from ip6-localhost ([::1]:24362 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1v2RMn-004sHF-1I; Sat, 27 Sep 2025 09:37:21 +0000
Received: from smtp-out2.suse.de ([2a07:de40:b251:101:10:150:64:2]:47796) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1v2AR5-004pyO-1v
 for samba-technical@lists.samba.org; Fri, 26 Sep 2025 15:32:41 +0000
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id BB998688B0;
 Fri, 26 Sep 2025 15:32:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1758900755; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=t7I3nL9emy60PUNUbVVivj0+woihAPXFG+S4JuRgPgU=;
 b=KqdaO+Jbh8F6L3t3n/XhLk8W8CHMZHpSTheAGLcPq8SC8FpxO79T7M5LG6Zl/jLX+xgfCp
 HiU/pd9WS67KiPF1/RC2YnnbNCW9Qbk/VFgtTZHUuFApwwgYixnmEpv4UaineBro9eWiQc
 15y0b285UmuchgiYgz3tPFRB/qqjoao=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1758900755;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=t7I3nL9emy60PUNUbVVivj0+woihAPXFG+S4JuRgPgU=;
 b=kbWcV4I65EwureUfJ2NXsPELhs3naIMiRj+nFtgChg/jqBP5KN3K1aAkrbtP3J2YBMxhQr
 t5DgMdPpMJMd0UDw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1758900755; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=t7I3nL9emy60PUNUbVVivj0+woihAPXFG+S4JuRgPgU=;
 b=KqdaO+Jbh8F6L3t3n/XhLk8W8CHMZHpSTheAGLcPq8SC8FpxO79T7M5LG6Zl/jLX+xgfCp
 HiU/pd9WS67KiPF1/RC2YnnbNCW9Qbk/VFgtTZHUuFApwwgYixnmEpv4UaineBro9eWiQc
 15y0b285UmuchgiYgz3tPFRB/qqjoao=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1758900755;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=t7I3nL9emy60PUNUbVVivj0+woihAPXFG+S4JuRgPgU=;
 b=kbWcV4I65EwureUfJ2NXsPELhs3naIMiRj+nFtgChg/jqBP5KN3K1aAkrbtP3J2YBMxhQr
 t5DgMdPpMJMd0UDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A68C51386E;
 Fri, 26 Sep 2025 15:32:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 8oKhKBOy1mjLAgAAD6G6ig
 (envelope-from <jack@suse.cz>); Fri, 26 Sep 2025 15:32:35 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
 id 63800A0AA0; Fri, 26 Sep 2025 17:32:27 +0200 (CEST)
Date: Fri, 26 Sep 2025 17:32:27 +0200
To: Jeff Layton <jlayton@kernel.org>
Subject: Re: [PATCH v3 06/38] vfs: break parent dir delegations in open(...,
 O_CREAT) codepath
Message-ID: <5cst6i2y5rjxsag3oihanh6nusjvaklw24t6ihdd6kyqsdxy7f@ld2vqj5yoexf>
References: <20250924-dir-deleg-v3-0-9f3af8bc5c40@kernel.org>
 <20250924-dir-deleg-v3-6-9f3af8bc5c40@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250924-dir-deleg-v3-6-9f3af8bc5c40@kernel.org>
X-Spamd-Result: default: False [-2.30 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 SUSPICIOUS_RECIPS(1.50)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 MID_RHS_NOT_FQDN(0.50)[]; NEURAL_HAM_SHORT(-0.20)[-1.000];
 MIME_GOOD(-0.10)[text/plain];
 FUZZY_RATELIMITED(0.00)[rspamd.com]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; MIME_TRACE(0.00)[0:+];
 TO_DN_SOME(0.00)[]; MISSING_XM_UA(0.00)[];
 RCPT_COUNT_TWELVE(0.00)[44]; TAGGED_RCPT(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com];
 R_RATELIMIT(0.00)[to_ip_from(RL63fqwwx8ot6gmekemcs76f9d)];
 FROM_HAS_DN(0.00)[];
 FREEMAIL_CC(0.00)[zeniv.linux.org.uk,kernel.org,suse.cz,oracle.com,gmail.com,samba.org,microsoft.com,talpey.com,brown.name,redhat.com,lwn.net,szeredi.hu,manguebit.org,linuxfoundation.org,tyhicks.com,chromium.org,goodmis.org,efficios.com,vger.kernel.org,lists.samba.org,lists.linux.dev];
 RCVD_COUNT_THREE(0.00)[3]; FROM_EQ_ENVFROM(0.00)[];
 RCVD_TLS_LAST(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:email,imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO
X-Spam-Score: -2.30
X-Mailman-Approved-At: Sat, 27 Sep 2025 09:37:16 +0000
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

On Wed 24-09-25 14:05:52, Jeff Layton wrote:
> In order to add directory delegation support, we need to break
> delegations on the parent whenever there is going to be a change in the
> directory.
> 
> Add a delegated_inode parameter to lookup_open and have it break the
> delegation. Then, open_last_lookups can wait for the delegation break
> and retry the call to lookup_open once it's done.
> 
> Signed-off-by: Jeff Layton <jlayton@kernel.org>

Looks good. Feel free to add:

Reviewed-by: Jan Kara <jack@suse.cz>

								Honza

> ---
>  fs/namei.c | 22 ++++++++++++++++++----
>  1 file changed, 18 insertions(+), 4 deletions(-)
> 
> diff --git a/fs/namei.c b/fs/namei.c
> index 4e058b00208c1663ba828c6f8ed1f82c26a4f136..903b70a82530938a0fdf10508529a1b7cc38136d 100644
> --- a/fs/namei.c
> +++ b/fs/namei.c
> @@ -3609,7 +3609,7 @@ static struct dentry *atomic_open(struct nameidata *nd, struct dentry *dentry,
>   */
>  static struct dentry *lookup_open(struct nameidata *nd, struct file *file,
>  				  const struct open_flags *op,
> -				  bool got_write)
> +				  bool got_write, struct inode **delegated_inode)
>  {
>  	struct mnt_idmap *idmap;
>  	struct dentry *dir = nd->path.dentry;
> @@ -3698,6 +3698,11 @@ static struct dentry *lookup_open(struct nameidata *nd, struct file *file,
>  
>  	/* Negative dentry, just create the file */
>  	if (!dentry->d_inode && (open_flag & O_CREAT)) {
> +		/* but break the directory lease first! */
> +		error = try_break_deleg(dir_inode, delegated_inode);
> +		if (error)
> +			goto out_dput;
> +
>  		file->f_mode |= FMODE_CREATED;
>  		audit_inode_child(dir_inode, dentry, AUDIT_TYPE_CHILD_CREATE);
>  		if (!dir_inode->i_op->create) {
> @@ -3761,6 +3766,7 @@ static const char *open_last_lookups(struct nameidata *nd,
>  		   struct file *file, const struct open_flags *op)
>  {
>  	struct dentry *dir = nd->path.dentry;
> +	struct inode *delegated_inode = NULL;
>  	int open_flag = op->open_flag;
>  	bool got_write = false;
>  	struct dentry *dentry;
> @@ -3791,7 +3797,7 @@ static const char *open_last_lookups(struct nameidata *nd,
>  				return ERR_PTR(-ECHILD);
>  		}
>  	}
> -
> +retry:
>  	if (open_flag & (O_CREAT | O_TRUNC | O_WRONLY | O_RDWR)) {
>  		got_write = !mnt_want_write(nd->path.mnt);
>  		/*
> @@ -3804,7 +3810,7 @@ static const char *open_last_lookups(struct nameidata *nd,
>  		inode_lock(dir->d_inode);
>  	else
>  		inode_lock_shared(dir->d_inode);
> -	dentry = lookup_open(nd, file, op, got_write);
> +	dentry = lookup_open(nd, file, op, got_write, &delegated_inode);
>  	if (!IS_ERR(dentry)) {
>  		if (file->f_mode & FMODE_CREATED)
>  			fsnotify_create(dir->d_inode, dentry);
> @@ -3819,8 +3825,16 @@ static const char *open_last_lookups(struct nameidata *nd,
>  	if (got_write)
>  		mnt_drop_write(nd->path.mnt);
>  
> -	if (IS_ERR(dentry))
> +	if (IS_ERR(dentry)) {
> +		if (delegated_inode) {
> +			int error = break_deleg_wait(&delegated_inode);
> +
> +			if (!error)
> +				goto retry;
> +			return ERR_PTR(error);
> +		}
>  		return ERR_CAST(dentry);
> +	}
>  
>  	if (file->f_mode & (FMODE_OPENED | FMODE_CREATED)) {
>  		dput(nd->path.dentry);
> 
> -- 
> 2.51.0
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

