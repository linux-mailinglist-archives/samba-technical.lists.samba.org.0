Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B9639BF528F
	for <lists+samba-technical@lfdr.de>; Tue, 21 Oct 2025 10:07:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=Z3Kd6mbbrPRG0zwXHtLEs9ID63+xl85WNbtfLvd00nw=; b=N+uWO4q3lFCxKGRVmsSUfQ4qye
	MpgkZUntoDgAz/uwNyvXuDRqWjoBW2+bLsWYZiCZOQNYQfsVa1UtkKQsiI/P8YA3uI0czCVPAmU3f
	Ei1DsVLX2TElvIp08yJnrsmF1axVF7vWmvAoogQ3mmComd9wtqVSuLA1GPzCChb93ds7UXgm+ijrF
	OHxFolCbEncZO6uu2xs7FO8WwjnwnyaiLrUwu2S5iIqNL7vtA79TTT2/pw7/SK47P0U9ImQdELy9Z
	97iSyH9wafoA7ElMkk9PAiNNKST3xHWLX3z/aYzCwErJeSKneOjoVm+b1zkiwRb+96noBQ6EjAB+k
	v41dPycw==;
Received: from ip6-localhost ([::1]:54440 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vB7Or-008PzA-1i; Tue, 21 Oct 2025 08:07:21 +0000
Received: from smtp-out1.suse.de ([2a07:de40:b251:101:10:150:64:1]:58148) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vAmLO-008LeO-Oj
 for samba-technical@lists.samba.org; Mon, 20 Oct 2025 09:38:25 +0000
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id B602B21182;
 Mon, 20 Oct 2025 09:38:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1760953094; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Z3Kd6mbbrPRG0zwXHtLEs9ID63+xl85WNbtfLvd00nw=;
 b=zxouHgNgKUzdOarvvgPHxxhBWfS94a/uSkfjawCnhR8cbzz69iJLdEIMLj+zu50BZJJba5
 bUTYv7oaSLn8CNysGSrIzr02b4aqBS2pxKu3DHfqFRoON9pn+7ej6fZrScypIZq2azmnM9
 x+TSTCq6IzdNyUQ8GrWILzHPDDFkhg0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1760953094;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Z3Kd6mbbrPRG0zwXHtLEs9ID63+xl85WNbtfLvd00nw=;
 b=5lzRlQJqx8tIyzMXiqieG4GgqzCjJXMTESHJy83TMpTfVtscp3W2GniczNdnyGo/OW71MN
 UX0rYu63KQ2G2IBQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1760953094; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Z3Kd6mbbrPRG0zwXHtLEs9ID63+xl85WNbtfLvd00nw=;
 b=zxouHgNgKUzdOarvvgPHxxhBWfS94a/uSkfjawCnhR8cbzz69iJLdEIMLj+zu50BZJJba5
 bUTYv7oaSLn8CNysGSrIzr02b4aqBS2pxKu3DHfqFRoON9pn+7ej6fZrScypIZq2azmnM9
 x+TSTCq6IzdNyUQ8GrWILzHPDDFkhg0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1760953094;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Z3Kd6mbbrPRG0zwXHtLEs9ID63+xl85WNbtfLvd00nw=;
 b=5lzRlQJqx8tIyzMXiqieG4GgqzCjJXMTESHJy83TMpTfVtscp3W2GniczNdnyGo/OW71MN
 UX0rYu63KQ2G2IBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A767513AAC;
 Mon, 20 Oct 2025 09:38:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id urrbKAYD9mgtDwAAD6G6ig
 (envelope-from <jack@suse.cz>); Mon, 20 Oct 2025 09:38:14 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
 id 55C9AA0856; Mon, 20 Oct 2025 11:38:14 +0200 (CEST)
Date: Mon, 20 Oct 2025 11:38:14 +0200
To: Jeff Layton <jlayton@kernel.org>
Subject: Re: [PATCH 03/13] vfs: add try_break_deleg calls for parents to
 vfs_{link,rename,unlink}
Message-ID: <n5ihwvsits3u7fwvzuk42vmqdv45ap6u4gh77diegtxik42emp@whyfqmynxnl2>
References: <20251013-dir-deleg-ro-v1-0-406780a70e5e@kernel.org>
 <20251013-dir-deleg-ro-v1-3-406780a70e5e@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251013-dir-deleg-ro-v1-3-406780a70e5e@kernel.org>
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
X-Mailman-Approved-At: Tue, 21 Oct 2025 08:07:19 +0000
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

On Mon 13-10-25 10:48:01, Jeff Layton wrote:
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
> index 7377020a2cba02501483020e0fc93c279fb38d3e..6e61e0215b34134b1690f864e2719e3f82cf71a8 100644
> --- a/fs/namei.c
> +++ b/fs/namei.c
> @@ -4667,6 +4667,9 @@ int vfs_unlink(struct mnt_idmap *idmap, struct inode *dir,
>  	else {
>  		error = security_inode_unlink(dir, dentry);
>  		if (!error) {
> +			error = try_break_deleg(dir, delegated_inode);
> +			if (error)
> +				goto out;
>  			error = try_break_deleg(target, delegated_inode);
>  			if (error)
>  				goto out;
> @@ -4936,7 +4939,9 @@ int vfs_link(struct dentry *old_dentry, struct mnt_idmap *idmap,
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
> @@ -5203,6 +5208,14 @@ int vfs_rename(struct renamedata *rd)
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

