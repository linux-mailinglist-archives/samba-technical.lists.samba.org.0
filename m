Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id AD5EEC510CD
	for <lists+samba-technical@lfdr.de>; Wed, 12 Nov 2025 09:07:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=ZkJQ+ETHMLX8gaociQ/ZH4e9YkkTx1BYT1F+DHiUNow=; b=bFAC1L6A01EOlmfYYT920TcZqX
	WnxPlsNctlZlLrD8z3KgGKVYVd4G1JXMJ2X518oTZXyXyALxcjk1rbpx5HPvXKduSsf3lsLVkhgDH
	XJWeZiNdd0I1HhKUfdhcOshdc/HEpY93URJIgt64Fdxnwm4ou8um9tHpBcy+IlGldXKD6/NfMhd2Q
	7CDbZpDOfFEt5tFqLVCeE64Sv+d2FQcMQ/uMlVc0i/oTWJjyPkdz4gLTB5dtmfYq8/jHuq03T5FDb
	xaRIm0PnldB1DTawNHf/WWaRJnkAJDjQhNIxyEivGYeGbscq9E3fVEykkJMH7GH5JTMiuzo/2yOC9
	JADkKQcA==;
Received: from ip6-localhost ([::1]:35836 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vJ5sZ-00C3iT-IW; Wed, 12 Nov 2025 08:06:59 +0000
Received: from smtp-out2.suse.de ([2a07:de40:b251:101:10:150:64:2]:52974) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vIlwJ-00Bz7P-Bz
 for samba-technical@lists.samba.org; Tue, 11 Nov 2025 10:49:35 +0000
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id AE4751F790;
 Tue, 11 Nov 2025 10:49:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1762858168; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZkJQ+ETHMLX8gaociQ/ZH4e9YkkTx1BYT1F+DHiUNow=;
 b=048Duv24jecDa2dlRX/r4T68dJo/Q1HZM6/bFhJcik5peshmjaYc5a6cz7ijm0CHJBlC+1
 Nqkcs4oNsAsUZ/7YwQ/BoizzVYPNZhm7pWFegg7mtXkt4VC4hO08pkJlUbTTQbBrak61yb
 3nfEtOGq2e/tF3lKT4RtbNvnIyX+F4w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1762858168;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZkJQ+ETHMLX8gaociQ/ZH4e9YkkTx1BYT1F+DHiUNow=;
 b=pxjRMTfX6kH3ijVgNX4+D7CfwQqIa0aJAtKl6cNDjcZOJTtdTt3PR653T1tMeG8lvmlwI6
 lKgj7ADcTdiZRGCg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1762858168; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZkJQ+ETHMLX8gaociQ/ZH4e9YkkTx1BYT1F+DHiUNow=;
 b=048Duv24jecDa2dlRX/r4T68dJo/Q1HZM6/bFhJcik5peshmjaYc5a6cz7ijm0CHJBlC+1
 Nqkcs4oNsAsUZ/7YwQ/BoizzVYPNZhm7pWFegg7mtXkt4VC4hO08pkJlUbTTQbBrak61yb
 3nfEtOGq2e/tF3lKT4RtbNvnIyX+F4w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1762858168;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZkJQ+ETHMLX8gaociQ/ZH4e9YkkTx1BYT1F+DHiUNow=;
 b=pxjRMTfX6kH3ijVgNX4+D7CfwQqIa0aJAtKl6cNDjcZOJTtdTt3PR653T1tMeG8lvmlwI6
 lKgj7ADcTdiZRGCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9D1CD148FC;
 Tue, 11 Nov 2025 10:49:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id YkhWJrgUE2k9QQAAD6G6ig
 (envelope-from <jack@suse.cz>); Tue, 11 Nov 2025 10:49:28 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
 id 466A7A28C8; Tue, 11 Nov 2025 11:49:24 +0100 (CET)
Date: Tue, 11 Nov 2025 11:49:24 +0100
To: Jeff Layton <jlayton@kernel.org>
Subject: Re: [PATCH v5 01/17] filelock: make lease_alloc() take a flags
 argument
Message-ID: <zmpoq5aaprvu7ymytrensjue2qwkcsj6aiylfan2adbreftknb@mwinvi3uwb2p>
References: <20251105-dir-deleg-ro-v5-0-7ebc168a88ac@kernel.org>
 <20251105-dir-deleg-ro-v5-1-7ebc168a88ac@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251105-dir-deleg-ro-v5-1-7ebc168a88ac@kernel.org>
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
 FREEMAIL_CC(0.00)[szeredi.hu,zeniv.linux.org.uk,kernel.org,suse.cz,oracle.com,gmail.com,samba.org,manguebit.org,microsoft.com,talpey.com,linuxfoundation.org,redhat.com,tyhicks.com,brown.name,chromium.org,google.com,davemloft.net,vger.kernel.org,lists.samba.org,lists.linux.dev];
 RCVD_COUNT_THREE(0.00)[3]; FROM_EQ_ENVFROM(0.00)[];
 RCVD_TLS_LAST(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo, suse.cz:email,
 suse.com:email]
X-Spam-Flag: NO
X-Spam-Score: -2.30
X-Mailman-Approved-At: Wed, 12 Nov 2025 08:06:55 +0000
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

On Wed 05-11-25 11:53:47, Jeff Layton wrote:
> __break_lease() currently overrides the flc_flags field in the lease
> after allocating it. A forthcoming patch will add the ability to request
> a FL_DELEG type lease.
> 
> Instead of overriding the flags field, add a flags argument to
> lease_alloc() and lease_init() so it's set correctly after allocating.
> 
> Signed-off-by: Jeff Layton <jlayton@kernel.org>

Looks good. Feel free to add:

Reviewed-by: Jan Kara <jack@suse.cz>

								Honza

> ---
>  fs/locks.c | 13 ++++++-------
>  1 file changed, 6 insertions(+), 7 deletions(-)
> 
> diff --git a/fs/locks.c b/fs/locks.c
> index 04a3f0e2072461b6e2d3d1cd12f2b089d69a7db3..b33c327c21dcd49341fbeac47caeb72cdf7455db 100644
> --- a/fs/locks.c
> +++ b/fs/locks.c
> @@ -585,7 +585,7 @@ static const struct lease_manager_operations lease_manager_ops = {
>  /*
>   * Initialize a lease, use the default lock manager operations
>   */
> -static int lease_init(struct file *filp, int type, struct file_lease *fl)
> +static int lease_init(struct file *filp, unsigned int flags, int type, struct file_lease *fl)
>  {
>  	if (assign_type(&fl->c, type) != 0)
>  		return -EINVAL;
> @@ -594,13 +594,13 @@ static int lease_init(struct file *filp, int type, struct file_lease *fl)
>  	fl->c.flc_pid = current->tgid;
>  
>  	fl->c.flc_file = filp;
> -	fl->c.flc_flags = FL_LEASE;
> +	fl->c.flc_flags = flags;
>  	fl->fl_lmops = &lease_manager_ops;
>  	return 0;
>  }
>  
>  /* Allocate a file_lock initialised to this type of lease */
> -static struct file_lease *lease_alloc(struct file *filp, int type)
> +static struct file_lease *lease_alloc(struct file *filp, unsigned int flags, int type)
>  {
>  	struct file_lease *fl = locks_alloc_lease();
>  	int error = -ENOMEM;
> @@ -608,7 +608,7 @@ static struct file_lease *lease_alloc(struct file *filp, int type)
>  	if (fl == NULL)
>  		return ERR_PTR(error);
>  
> -	error = lease_init(filp, type, fl);
> +	error = lease_init(filp, flags, type, fl);
>  	if (error) {
>  		locks_free_lease(fl);
>  		return ERR_PTR(error);
> @@ -1548,10 +1548,9 @@ int __break_lease(struct inode *inode, unsigned int mode, unsigned int type)
>  	int want_write = (mode & O_ACCMODE) != O_RDONLY;
>  	LIST_HEAD(dispose);
>  
> -	new_fl = lease_alloc(NULL, want_write ? F_WRLCK : F_RDLCK);
> +	new_fl = lease_alloc(NULL, type, want_write ? F_WRLCK : F_RDLCK);
>  	if (IS_ERR(new_fl))
>  		return PTR_ERR(new_fl);
> -	new_fl->c.flc_flags = type;
>  
>  	/* typically we will check that ctx is non-NULL before calling */
>  	ctx = locks_inode_context(inode);
> @@ -2033,7 +2032,7 @@ static int do_fcntl_add_lease(unsigned int fd, struct file *filp, int arg)
>  	struct fasync_struct *new;
>  	int error;
>  
> -	fl = lease_alloc(filp, arg);
> +	fl = lease_alloc(filp, FL_LEASE, arg);
>  	if (IS_ERR(fl))
>  		return PTR_ERR(fl);
>  
> 
> -- 
> 2.51.1
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

