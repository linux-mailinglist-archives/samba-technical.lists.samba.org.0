Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D4496BFFD89
	for <lists+samba-technical@lfdr.de>; Thu, 23 Oct 2025 10:20:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=zWrRoINCj3OqAfg5PTgsjqvXeRUN3tNurbDF1UsQ+SU=; b=Yzbj2yRoQyQlHnkXpdTL5+F/Fb
	/M+cuYA5b4DgxJM8FMoSczi2x4urX/7aLOckBoRBE6Q3KQtIgA8LYBmSx9n0oflgnupd4CFN5FZbO
	AuVN3uyJ2NtPEiEisvFLYTM2kk33qLu7D1mNuev/NeUXMnsW+FJFxDBO0TSqt4jsh/68e0a8kdi5k
	l9cjgqn1/B5nNInvAn+cvD7HkpptwigdylLiWKwQ+GLv+kueEQCe6T+KbCEryqPSYINAD1Zq5u3KE
	3MtuzDi1Fy04O+/BbOnDwwcHRoSwwfiMPhO8NgXNJmRTcPdj+VsnGd+KvLgDWolpqai/rhN6AY0YJ
	yV7yFozw==;
Received: from ip6-localhost ([::1]:37676 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vBqYA-008Yht-FW; Thu, 23 Oct 2025 08:19:58 +0000
Received: from smtp-out2.suse.de ([2a07:de40:b251:101:10:150:64:2]:48272) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vBUkt-008UT1-2O
 for samba-technical@lists.samba.org; Wed, 22 Oct 2025 09:03:42 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id E6A691F788;
 Wed, 22 Oct 2025 09:03:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1761123812; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zWrRoINCj3OqAfg5PTgsjqvXeRUN3tNurbDF1UsQ+SU=;
 b=G9J5KCh6W+1WPd/qBI48zIgYJLRNiHsHnfkiRiTP0Xzyyzdb1KHb8GuQVeUVLuJl/a8YVn
 XNPsdB1Jx8K9KlwbDI2YFXtHvg8ZaxNxPfv17V5TwZu2vztFabLuSstPusCcqDnwgOi+8S
 PB8Nd5XOFFeoYmMoNO6xMj8qKJiMLrA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1761123812;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zWrRoINCj3OqAfg5PTgsjqvXeRUN3tNurbDF1UsQ+SU=;
 b=14G+ZRO8KRuFHfqfYaKfca3Mg4mTGnDXIsGqDkPmz4hI/RMvdcY4XYQ1xk1lfbQytLf/uk
 WbYvieYu0JpZciBg==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=cw4Kd4WO;
 dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b="Q0/1LwQh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1761123808; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zWrRoINCj3OqAfg5PTgsjqvXeRUN3tNurbDF1UsQ+SU=;
 b=cw4Kd4WOzTalNHRC5kCf/r86pEI4ruZ6cuuR60Cib43IhlIP4H7IfPypaa8eJQIZ8mkj7s
 pCoATgsHVMVqio6AfMa02cN26SSVNk33Ez6Vdo6DGluRbOzllUTn07g2yyZI/8u2q6Pq+5
 vcb55DncI+TB00+jX03tL2ElOHnubaE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1761123808;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zWrRoINCj3OqAfg5PTgsjqvXeRUN3tNurbDF1UsQ+SU=;
 b=Q0/1LwQhf1vXYMN24ZHHUpKVytdg28nYw9hc6n1N6ay6PKGXvIm/kT09I7fQl0fNvl4n4k
 OmJeQTUwvheKYoDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id DA47013A29;
 Wed, 22 Oct 2025 09:03:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id XmdINd+d+GisbAAAD6G6ig
 (envelope-from <jack@suse.cz>); Wed, 22 Oct 2025 09:03:27 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
 id 43473A0990; Wed, 22 Oct 2025 11:03:19 +0200 (CEST)
Date: Wed, 22 Oct 2025 11:03:19 +0200
To: Jeff Layton <jlayton@kernel.org>
Subject: Re: [PATCH v3 09/13] filelock: lift the ban on directory leases in
 generic_setlease
Message-ID: <g7r2bffekbosexqbatj5mb7ljc5rn5rw3dwfehipsxdb6hewyp@heriwuhgh3zo>
References: <20251021-dir-deleg-ro-v3-0-a08b1cde9f4c@kernel.org>
 <20251021-dir-deleg-ro-v3-9-a08b1cde9f4c@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251021-dir-deleg-ro-v3-9-a08b1cde9f4c@kernel.org>
X-Spam-Flag: NO
X-Rspamd-Queue-Id: E6A691F788
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-2.51 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 SUSPICIOUS_RECIPS(1.50)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 MID_RHS_NOT_FQDN(0.50)[]; NEURAL_HAM_SHORT(-0.20)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 MIME_GOOD(-0.10)[text/plain]; MX_GOOD(-0.01)[];
 RCVD_TLS_LAST(0.00)[];
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 RCVD_COUNT_THREE(0.00)[3]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 RCPT_COUNT_TWELVE(0.00)[44]; ARC_NA(0.00)[];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 MIME_TRACE(0.00)[0:+]; FREEMAIL_ENVRCPT(0.00)[gmail.com];
 FREEMAIL_CC(0.00)[szeredi.hu,zeniv.linux.org.uk,kernel.org,suse.cz,oracle.com,gmail.com,samba.org,manguebit.org,microsoft.com,talpey.com,linuxfoundation.org,redhat.com,tyhicks.com,brown.name,chromium.org,google.com,davemloft.net,vger.kernel.org,lists.samba.org,lists.linux.dev];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; TAGGED_RCPT(0.00)[]; MISSING_XM_UA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; DKIM_TRACE(0.00)[suse.cz:+];
 R_RATELIMIT(0.00)[to_ip_from(RLpnapcpkwxdkc5mopt1ezhhna)];
 DBL_BLOCKED_OPENRESOLVER(0.00)[brown.name:email, imap1.dmz-prg2.suse.org:rdns,
 imap1.dmz-prg2.suse.org:helo, suse.cz:dkim, suse.cz:email, suse.com:email]
X-Spam-Score: -2.51
X-Mailman-Approved-At: Thu, 23 Oct 2025 08:19:54 +0000
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

On Tue 21-10-25 11:25:44, Jeff Layton wrote:
> With the addition of the try_break_lease calls in directory changing
> operations, allow generic_setlease to hand them out. Write leases on
> directories are never allowed however, so continue to reject them.
> 
> For now, there is no API for requesting delegations from userland, so
> ensure that userland is prevented from acquiring a lease on a directory.
> 
> Reviewed-by: NeilBrown <neil@brown.name>
> Signed-off-by: Jeff Layton <jlayton@kernel.org>

Looks good. Feel free to add:

Reviewed-by: Jan Kara <jack@suse.cz>

								Honza

> ---
>  fs/locks.c | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/fs/locks.c b/fs/locks.c
> index 0b16921fb52e602ea2e0c3de39d9d772af98ba7d..b47552106769ec5a189babfe12518e34aa59c759 100644
> --- a/fs/locks.c
> +++ b/fs/locks.c
> @@ -1929,14 +1929,19 @@ static int generic_delete_lease(struct file *filp, void *owner)
>  int generic_setlease(struct file *filp, int arg, struct file_lease **flp,
>  			void **priv)
>  {
> -	if (!S_ISREG(file_inode(filp)->i_mode))
> +	struct inode *inode = file_inode(filp);
> +
> +	if (!S_ISREG(inode->i_mode) && !S_ISDIR(inode->i_mode))
>  		return -EINVAL;
>  
>  	switch (arg) {
>  	case F_UNLCK:
>  		return generic_delete_lease(filp, *priv);
> -	case F_RDLCK:
>  	case F_WRLCK:
> +		if (S_ISDIR(inode->i_mode))
> +			return -EINVAL;
> +		fallthrough;
> +	case F_RDLCK:
>  		if (!(*flp)->fl_lmops->lm_break) {
>  			WARN_ON_ONCE(1);
>  			return -ENOLCK;
> @@ -2065,6 +2070,9 @@ static int do_fcntl_add_lease(unsigned int fd, struct file *filp, int arg)
>   */
>  int fcntl_setlease(unsigned int fd, struct file *filp, int arg)
>  {
> +	if (S_ISDIR(file_inode(filp)->i_mode))
> +		return -EINVAL;
> +
>  	if (arg == F_UNLCK)
>  		return vfs_setlease(filp, F_UNLCK, NULL, (void **)&filp);
>  	return do_fcntl_add_lease(fd, filp, arg);
> 
> -- 
> 2.51.0
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

