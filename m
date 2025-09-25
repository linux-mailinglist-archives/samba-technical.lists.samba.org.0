Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id CC590BA2F48
	for <lists+samba-technical@lfdr.de>; Fri, 26 Sep 2025 10:31:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=WDopZZ0RgseBNFHbhRFaoUMb/T2KLph+cR80nM05oOw=; b=4Q+2tQdSzkbSH8mXdIml2qlMsT
	oy/66p2K9utQP4KY3EnsU4l0oTBxHLXEDpnlztlpTrLnrNmGwmbXeMHhDSFH56bcYJVgUsgrVrT7P
	/M0Y/rcEVhkuqBQk79Ln1gNhD3GQJUP6iOH3eb+8/O4gh6vVLlPrm0JyySRqLiP9HNyjxkDKWpBN6
	qV6eY2MVHmqNlzKsXSWkXUpAwn7jlYVBmdXTOKGkVzCwuijtjmxpVJ4UakELIS0RAiGdE5f4ODn/h
	FbT9Z2eGy0IkH9FHBOW8fRl5TBhqBVt8cVYwQNEdnm0kOnEKqa/I+885p9Ze+6CoFL7tvPAz04tj0
	LXevQDGA==;
Received: from ip6-localhost ([::1]:38978 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1v23qa-004nHT-Ne; Fri, 26 Sep 2025 08:30:32 +0000
Received: from smtp-out2.suse.de ([195.135.223.131]:42168) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1v1ot3-004l5I-4o
 for samba-technical@lists.samba.org; Thu, 25 Sep 2025 16:32:08 +0000
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 023893EAF3;
 Thu, 25 Sep 2025 15:52:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1758815576; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WDopZZ0RgseBNFHbhRFaoUMb/T2KLph+cR80nM05oOw=;
 b=uRNcFJA0E1P4zX1bBuWvkrBlwKl6R3+5YEDg7RV2vnIaKZhXTyQmD+uDoZkIFfpR/ezAuh
 vDWv2RzX/EJ0O/d3k+WSxaZ+ldBs5n2DRdZ8a2OTjkkAjFpoiBeDgrnfkjpsNYjHlZu6su
 1qZgJ69vacnZwS3Pmhuo/QACiN1ZiOY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1758815576;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WDopZZ0RgseBNFHbhRFaoUMb/T2KLph+cR80nM05oOw=;
 b=v1YrAcFz9KiXost75HrGA8+EQiArgz8lklUTmim69amE6ALvMmmoaHZVDDhxRj2i0pQ2fC
 H6g4AedCvRNOzBBA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1758815576; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WDopZZ0RgseBNFHbhRFaoUMb/T2KLph+cR80nM05oOw=;
 b=uRNcFJA0E1P4zX1bBuWvkrBlwKl6R3+5YEDg7RV2vnIaKZhXTyQmD+uDoZkIFfpR/ezAuh
 vDWv2RzX/EJ0O/d3k+WSxaZ+ldBs5n2DRdZ8a2OTjkkAjFpoiBeDgrnfkjpsNYjHlZu6su
 1qZgJ69vacnZwS3Pmhuo/QACiN1ZiOY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1758815576;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WDopZZ0RgseBNFHbhRFaoUMb/T2KLph+cR80nM05oOw=;
 b=v1YrAcFz9KiXost75HrGA8+EQiArgz8lklUTmim69amE6ALvMmmoaHZVDDhxRj2i0pQ2fC
 H6g4AedCvRNOzBBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id DADD213869;
 Thu, 25 Sep 2025 15:52:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 2k5wNVdl1WgAXAAAD6G6ig
 (envelope-from <jack@suse.cz>); Thu, 25 Sep 2025 15:52:55 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
 id 912DDA0AA0; Thu, 25 Sep 2025 17:52:55 +0200 (CEST)
Date: Thu, 25 Sep 2025 17:52:55 +0200
To: Jeff Layton <jlayton@kernel.org>
Subject: Re: [PATCH v3 03/38] vfs: add try_break_deleg calls for parents to
 vfs_{link,rename,unlink}
Message-ID: <cx5cpyg2q2ro3hpn55z673bk44tm5syftxso2hawe4ioe7jv2s@itiemyvjhgtc>
References: <20250924-dir-deleg-v3-0-9f3af8bc5c40@kernel.org>
 <20250924-dir-deleg-v3-3-9f3af8bc5c40@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250924-dir-deleg-v3-3-9f3af8bc5c40@kernel.org>
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
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,suse.cz:email]
X-Spam-Flag: NO
X-Spam-Score: -2.30
X-Mailman-Approved-At: Fri, 26 Sep 2025 08:30:30 +0000
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

On Wed 24-09-25 14:05:49, Jeff Layton wrote:
> In order to add directory delegation support, we need to break
> delegations on the parent whenever there is going to be a change in the
> directory.
> 
> vfs_link, vfs_unlink, and vfs_rename all have existing delegation break
> handling for the children in the rename. Add the necessary calls for
> breaking delegations in the parent(s) as well.
> 
> Signed-off-by: Jeff Layton <jlayton@kernel.org>

Looks good. Feel free to add:

Reviewed-by: Jan Kara <jack@suse.cz>

								Honza

> ---
>  fs/namei.c | 15 ++++++++++++++-
>  1 file changed, 14 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/namei.c b/fs/namei.c
> index cd43ff89fbaa38206db2aec4f097ca119819f92e..cd517eb232317d326e6d2fc5a60cb4c7569a137d 100644
> --- a/fs/namei.c
> +++ b/fs/namei.c
> @@ -4580,6 +4580,9 @@ int vfs_unlink(struct mnt_idmap *idmap, struct inode *dir,
>  	else {
>  		error = security_inode_unlink(dir, dentry);
>  		if (!error) {
> +			error = try_break_deleg(dir, delegated_inode);
> +			if (error)
> +				goto out;
>  			error = try_break_deleg(target, delegated_inode);
>  			if (error)
>  				goto out;
> @@ -4849,7 +4852,9 @@ int vfs_link(struct dentry *old_dentry, struct mnt_idmap *idmap,
>  	else if (max_links && inode->i_nlink >= max_links)
>  		error = -EMLINK;
>  	else {
> -		error = try_break_deleg(inode, delegated_inode);
> +		error = try_break_deleg(dir, delegated_inode);
> +		if (!error)
> +			error = try_break_deleg(inode, delegated_inode);
>  		if (!error)
>  			error = dir->i_op->link(old_dentry, dir, new_dentry);
>  	}
> @@ -5116,6 +5121,14 @@ int vfs_rename(struct renamedata *rd)
>  		    old_dir->i_nlink >= max_links)
>  			goto out;
>  	}
> +	error = try_break_deleg(old_dir, delegated_inode);
> +	if (error)
> +		goto out;
> +	if (new_dir != old_dir) {
> +		error = try_break_deleg(new_dir, delegated_inode);
> +		if (error)
> +			goto out;
> +	}
>  	if (!is_dir) {
>  		error = try_break_deleg(source, delegated_inode);
>  		if (error)
> 
> -- 
> 2.51.0
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

