Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id C0165C510CA
	for <lists+samba-technical@lfdr.de>; Wed, 12 Nov 2025 09:07:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=+8EYNR6057DpYywoZVROv3Xbkt2PD3YynG2WTWg+5xo=; b=zCqI2UxAL22WkbQ4Q/3/LZJ9sk
	6p3meQK7wdSLMsEUz154Dod5Nd/AZh0L200tmj9UH9RbjZLh8N23hoLAfdV8N2GrS72ABfPbvtYE8
	N60+AAWUNxHvMHisAziWnQjwT/aA+9xGr/jMXp9VPeujNK6QNZV3GhQ5tjiNLENRWxMDpyzK0gAWJ
	KAc904p1iyuaDqG+VSLYxcPSWxdeFQsbo/9wLFBI7/E1r2/g/w7a4g2yoUWBfK97umjL/xsu8mK8o
	lYETyr9k/HK9TVHaiCX5ozMJsKZ7kqLySgwesgPBFcoB8pRHTmfuTegfZr/rv6a1O2tAiGzlIKdxb
	zUSKfB4w==;
Received: from ip6-localhost ([::1]:35866 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vJ5sd-00C3kM-9c; Wed, 12 Nov 2025 08:07:03 +0000
Received: from smtp-out1.suse.de ([2a07:de40:b251:101:10:150:64:1]:54236) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vIpJl-00C0jH-2u
 for samba-technical@lists.samba.org; Tue, 11 Nov 2025 14:26:01 +0000
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 3C2BB21A21;
 Tue, 11 Nov 2025 14:25:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1762871154; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+8EYNR6057DpYywoZVROv3Xbkt2PD3YynG2WTWg+5xo=;
 b=XDPmb+UfXnYZ4U4kJyC9+pBDY8gY9tDz64lI/0nR8GxyW9NPJIL4DPvOLQX33MEgVmxB5T
 Jy2fKqv4Z1hESX7GbTr99569cCLZRMB+H26otLlDB31Ar0iq9jSi47j7ZevTLfQN/fAP1v
 pN5WmpxftotUGEqUUEbxSqzhWHF6hv0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1762871154;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+8EYNR6057DpYywoZVROv3Xbkt2PD3YynG2WTWg+5xo=;
 b=BCw54wrvCIsmkl1lRV4ZUJTTToBp0YdLl8Bo01xfMv/I8zga6cnMDthoEM+QgrU9sqUB6H
 K7Vn26UeTrCLSUAw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1762871153; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+8EYNR6057DpYywoZVROv3Xbkt2PD3YynG2WTWg+5xo=;
 b=jtro0ScsPQM4YnNdw66AZeap93Mf/8vY7pCxI1Kux+0ptVXqdcFOFxwN92DgNWmdIh5gos
 wVskORC7dwbtRVliK1N48Nn4a6AzKjXPqy6/l/9DkFK0TdRXWWK4S7e+1D/9MEpErrFDnh
 tSg3yuWjRsa8X6kbw8B9dvMmTWMLouo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1762871153;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+8EYNR6057DpYywoZVROv3Xbkt2PD3YynG2WTWg+5xo=;
 b=DhUb478cbGhAGgd89TUndeM8qCjteLGvIUdnqcAVRUfeD0U9wKg66NdR3YIx+PPSp53/6e
 7W6qgTZX4Rns+FBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 27CAB149D7;
 Tue, 11 Nov 2025 14:25:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 1WqyCXFHE2mwGgAAD6G6ig
 (envelope-from <jack@suse.cz>); Tue, 11 Nov 2025 14:25:53 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
 id BEFCBA28CD; Tue, 11 Nov 2025 15:25:52 +0100 (CET)
Date: Tue, 11 Nov 2025 15:25:52 +0100
To: Jeff Layton <jlayton@kernel.org>
Subject: Re: [PATCH v6 17/17] vfs: expose delegation support to userland
Message-ID: <htsrrghapbhriwdtt6pbrgsptwf5nri6ehzgmgjqrc2bmsmku4@hl4q3fvz4kyc>
References: <20251111-dir-deleg-ro-v6-0-52f3feebb2f2@kernel.org>
 <20251111-dir-deleg-ro-v6-17-52f3feebb2f2@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251111-dir-deleg-ro-v6-17-52f3feebb2f2@kernel.org>
X-Spamd-Result: default: False [-2.30 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 SUSPICIOUS_RECIPS(1.50)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 MID_RHS_NOT_FQDN(0.50)[]; NEURAL_HAM_SHORT(-0.20)[-1.000];
 MIME_GOOD(-0.10)[text/plain];
 FUZZY_RATELIMITED(0.00)[rspamd.com]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; MIME_TRACE(0.00)[0:+];
 TO_DN_SOME(0.00)[]; MISSING_XM_UA(0.00)[];
 RCPT_COUNT_TWELVE(0.00)[45]; TAGGED_RCPT(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com];
 R_RATELIMIT(0.00)[to_ip_from(RL63fqwwx8ot6gmekemcs76f9d)];
 FROM_HAS_DN(0.00)[];
 FREEMAIL_CC(0.00)[szeredi.hu,zeniv.linux.org.uk,kernel.org,suse.cz,oracle.com,gmail.com,samba.org,manguebit.org,microsoft.com,talpey.com,linuxfoundation.org,redhat.com,tyhicks.com,brown.name,chromium.org,google.com,davemloft.net,vger.kernel.org,lists.samba.org,lists.linux.dev];
 RCVD_COUNT_THREE(0.00)[3]; FROM_EQ_ENVFROM(0.00)[];
 RCVD_TLS_LAST(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email, imap1.dmz-prg2.suse.org:helo,
 suse.cz:email]
X-Spam-Flag: NO
X-Spam-Score: -2.30
X-Mailman-Approved-At: Wed, 12 Nov 2025 08:06:56 +0000
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
 linux-api@vger.kernel.org, linux-cifs@vger.kernel.org,
 Kuniyuki Iwashima <kuniyu@google.com>, Miklos Szeredi <miklos@szeredi.hu>,
 Dai Ngo <Dai.Ngo@oracle.com>, Tyler Hicks <code@tyhicks.com>,
 Steve French <smfrench@gmail.com>, NeilBrown <neil@brown.name>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Namjae Jeon <linkinjeon@kernel.org>, Shyam Prasad N <sprasad@microsoft.com>,
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

On Tue 11-11-25 09:12:58, Jeff Layton wrote:
> Now that support for recallable directory delegations is available,
> expose this functionality to userland with new F_SETDELEG and F_GETDELEG
> commands for fcntl().
> 
> Note that this also allows userland to request a FL_DELEG type lease on
> files too. Userland applications that do will get signalled when there
> are metadata changes in addition to just data changes (which is a
> limitation of FL_LEASE leases).
> 
> These commands accept a new "struct delegation" argument that contains a
> flags field for future expansion.
> 
> Signed-off-by: Jeff Layton <jlayton@kernel.org>

Looks good. Feel free to add:

Reviewed-by: Jan Kara <jack@suse.cz>

								Honza

> ---
>  fs/fcntl.c                 | 13 +++++++++++++
>  fs/locks.c                 | 45 ++++++++++++++++++++++++++++++++++++++++-----
>  include/linux/filelock.h   | 12 ++++++++++++
>  include/uapi/linux/fcntl.h | 11 +++++++++++
>  4 files changed, 76 insertions(+), 5 deletions(-)
> 
> diff --git a/fs/fcntl.c b/fs/fcntl.c
> index 72f8433d9109889eecef56b32d20a85b4e12ea44..f93dbca0843557d197bd1e023519cfa0f00ad78f 100644
> --- a/fs/fcntl.c
> +++ b/fs/fcntl.c
> @@ -445,6 +445,7 @@ static long do_fcntl(int fd, unsigned int cmd, unsigned long arg,
>  		struct file *filp)
>  {
>  	void __user *argp = (void __user *)arg;
> +	struct delegation deleg;
>  	int argi = (int)arg;
>  	struct flock flock;
>  	long err = -EINVAL;
> @@ -550,6 +551,18 @@ static long do_fcntl(int fd, unsigned int cmd, unsigned long arg,
>  	case F_SET_RW_HINT:
>  		err = fcntl_set_rw_hint(filp, arg);
>  		break;
> +	case F_GETDELEG:
> +		if (copy_from_user(&deleg, argp, sizeof(deleg)))
> +			return -EFAULT;
> +		err = fcntl_getdeleg(filp, &deleg);
> +		if (!err && copy_to_user(argp, &deleg, sizeof(deleg)))
> +			return -EFAULT;
> +		break;
> +	case F_SETDELEG:
> +		if (copy_from_user(&deleg, argp, sizeof(deleg)))
> +			return -EFAULT;
> +		err = fcntl_setdeleg(fd, filp, &deleg);
> +		break;
>  	default:
>  		break;
>  	}
> diff --git a/fs/locks.c b/fs/locks.c
> index dd290a87f58eb5d522f03fa99d612fbad84dacf3..7f4ccc7974bc8d3e82500ee692c6520b53f2280f 100644
> --- a/fs/locks.c
> +++ b/fs/locks.c
> @@ -1703,7 +1703,7 @@ EXPORT_SYMBOL(lease_get_mtime);
>   *	XXX: sfr & willy disagree over whether F_INPROGRESS
>   *	should be returned to userspace.
>   */
> -int fcntl_getlease(struct file *filp)
> +static int __fcntl_getlease(struct file *filp, unsigned int flavor)
>  {
>  	struct file_lease *fl;
>  	struct inode *inode = file_inode(filp);
> @@ -1719,7 +1719,8 @@ int fcntl_getlease(struct file *filp)
>  		list_for_each_entry(fl, &ctx->flc_lease, c.flc_list) {
>  			if (fl->c.flc_file != filp)
>  				continue;
> -			type = target_leasetype(fl);
> +			if (fl->c.flc_flags & flavor)
> +				type = target_leasetype(fl);
>  			break;
>  		}
>  		spin_unlock(&ctx->flc_lock);
> @@ -1730,6 +1731,19 @@ int fcntl_getlease(struct file *filp)
>  	return type;
>  }
>  
> +int fcntl_getlease(struct file *filp)
> +{
> +	return __fcntl_getlease(filp, FL_LEASE);
> +}
> +
> +int fcntl_getdeleg(struct file *filp, struct delegation *deleg)
> +{
> +	if (deleg->d_flags != 0 || deleg->__pad != 0)
> +		return -EINVAL;
> +	deleg->d_type = __fcntl_getlease(filp, FL_DELEG);
> +	return 0;
> +}
> +
>  /**
>   * check_conflicting_open - see if the given file points to an inode that has
>   *			    an existing open that would conflict with the
> @@ -2039,13 +2053,13 @@ vfs_setlease(struct file *filp, int arg, struct file_lease **lease, void **priv)
>  }
>  EXPORT_SYMBOL_GPL(vfs_setlease);
>  
> -static int do_fcntl_add_lease(unsigned int fd, struct file *filp, int arg)
> +static int do_fcntl_add_lease(unsigned int fd, struct file *filp, unsigned int flavor, int arg)
>  {
>  	struct file_lease *fl;
>  	struct fasync_struct *new;
>  	int error;
>  
> -	fl = lease_alloc(filp, FL_LEASE, arg);
> +	fl = lease_alloc(filp, flavor, arg);
>  	if (IS_ERR(fl))
>  		return PTR_ERR(fl);
>  
> @@ -2081,7 +2095,28 @@ int fcntl_setlease(unsigned int fd, struct file *filp, int arg)
>  
>  	if (arg == F_UNLCK)
>  		return vfs_setlease(filp, F_UNLCK, NULL, (void **)&filp);
> -	return do_fcntl_add_lease(fd, filp, arg);
> +	return do_fcntl_add_lease(fd, filp, FL_LEASE, arg);
> +}
> +
> +/**
> + *	fcntl_setdeleg	-	sets a delegation on an open file
> + *	@fd: open file descriptor
> + *	@filp: file pointer
> + *	@deleg: delegation request from userland
> + *
> + *	Call this fcntl to establish a delegation on the file.
> + *	Note that you also need to call %F_SETSIG to
> + *	receive a signal when the lease is broken.
> + */
> +int fcntl_setdeleg(unsigned int fd, struct file *filp, struct delegation *deleg)
> +{
> +	/* For now, no flags are supported */
> +	if (deleg->d_flags != 0 || deleg->__pad != 0)
> +		return -EINVAL;
> +
> +	if (deleg->d_type == F_UNLCK)
> +		return vfs_setlease(filp, F_UNLCK, NULL, (void **)&filp);
> +	return do_fcntl_add_lease(fd, filp, FL_DELEG, deleg->d_type);
>  }
>  
>  /**
> diff --git a/include/linux/filelock.h b/include/linux/filelock.h
> index 208d108df2d73a9df65e5dc9968d074af385f881..54b824c05299261e6bd6acc4175cb277ea35b35d 100644
> --- a/include/linux/filelock.h
> +++ b/include/linux/filelock.h
> @@ -159,6 +159,8 @@ int fcntl_setlk64(unsigned int, struct file *, unsigned int,
>  
>  int fcntl_setlease(unsigned int fd, struct file *filp, int arg);
>  int fcntl_getlease(struct file *filp);
> +int fcntl_setdeleg(unsigned int fd, struct file *filp, struct delegation *deleg);
> +int fcntl_getdeleg(struct file *filp, struct delegation *deleg);
>  
>  static inline bool lock_is_unlock(struct file_lock *fl)
>  {
> @@ -278,6 +280,16 @@ static inline int fcntl_getlease(struct file *filp)
>  	return F_UNLCK;
>  }
>  
> +static inline int fcntl_setdeleg(unsigned int fd, struct file *filp, struct delegation *deleg)
> +{
> +	return -EINVAL;
> +}
> +
> +static inline int fcntl_getdeleg(struct file *filp, struct delegation *deleg)
> +{
> +	return -EINVAL;
> +}
> +
>  static inline bool lock_is_unlock(struct file_lock *fl)
>  {
>  	return false;
> diff --git a/include/uapi/linux/fcntl.h b/include/uapi/linux/fcntl.h
> index 3741ea1b73d8500061567b6590ccf5fb4c6770f0..008fac15e573084a9b48e4e991528b4363c54047 100644
> --- a/include/uapi/linux/fcntl.h
> +++ b/include/uapi/linux/fcntl.h
> @@ -79,6 +79,17 @@
>   */
>  #define RWF_WRITE_LIFE_NOT_SET	RWH_WRITE_LIFE_NOT_SET
>  
> +/* Set/Get delegations */
> +#define F_GETDELEG		(F_LINUX_SPECIFIC_BASE + 15)
> +#define F_SETDELEG		(F_LINUX_SPECIFIC_BASE + 16)
> +
> +/* Argument structure for F_GETDELEG and F_SETDELEG */
> +struct delegation {
> +	uint32_t	d_flags;	/* Must be 0 */
> +	uint16_t	d_type;		/* F_RDLCK, F_WRLCK, F_UNLCK */
> +	uint16_t	__pad;		/* Must be 0 */
> +};
> +
>  /*
>   * Types of directory notifications that may be requested.
>   */
> 
> -- 
> 2.51.1
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

