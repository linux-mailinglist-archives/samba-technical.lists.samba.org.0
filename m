Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D667C510CF
	for <lists+samba-technical@lfdr.de>; Wed, 12 Nov 2025 09:07:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=H4iMLUEIFp+KFnCBMrOHfoCV2tmUed7YGGquhX1HYzE=; b=ulkXpElqrlC/g2/12JHBSBjz+R
	AF6XT4uTwZvv6MQLbx8rSgm2ywSCqhPpCh6KApwscxpHjIR9sjn/+uTWdz44T+J6CAiq/vtb9hogV
	f8Q6BiADjMYZxwY5J+yKl5+Ns3angUk4egUOpmy4nOt+lVxV+jIyT7IEZoAm96XBwbS/YVXVC0yhh
	+zuFu64eyfuFxo7mtUvykH8wO5KU45k0ZheAHqq60kiYWkYIPpX4ceNBRIQpvHDVRE3UjIAbqb8dm
	MvfJeSPdeu+Sniczybx3zDGnqqEidE2dm2ljV9E7EXhYFlXiR3J2TKgQ1aZm14yZuGnZOZAdZWdrG
	NZAtHZDQ==;
Received: from ip6-localhost ([::1]:19670 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vJ5sY-00C3iK-Hb; Wed, 12 Nov 2025 08:06:58 +0000
Received: from smtp-out1.suse.de ([2a07:de40:b251:101:10:150:64:1]:35756) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vIlv1-00Bz7H-8x
 for samba-technical@lists.samba.org; Tue, 11 Nov 2025 10:48:14 +0000
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 7148C21E4B;
 Tue, 11 Nov 2025 10:48:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1762858088; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=H4iMLUEIFp+KFnCBMrOHfoCV2tmUed7YGGquhX1HYzE=;
 b=knwCUupIdDxL+kXwq5eH6u8/SWHWDOdg72AoaBHLq8FllViMvp9KCbtFMp0mglQr3V7dnj
 39R6eQGkz9soUG1Ivoqc0XBYGO31n0uCXyoeqekV/fyx4czgBP/skMFDTCLB+Og1aeOKCC
 81S6KO3lywIj6HUDo2mTbtDsFSRjVYM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1762858088;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=H4iMLUEIFp+KFnCBMrOHfoCV2tmUed7YGGquhX1HYzE=;
 b=w05KIqedIeW2ibbg67OTG8PygRxA4MK6nk2TZ4uU5WZGCe1JGnO+kGkt8oTLDFDkEsxodC
 75OBHS0M3F0aqPDg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1762858088; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=H4iMLUEIFp+KFnCBMrOHfoCV2tmUed7YGGquhX1HYzE=;
 b=knwCUupIdDxL+kXwq5eH6u8/SWHWDOdg72AoaBHLq8FllViMvp9KCbtFMp0mglQr3V7dnj
 39R6eQGkz9soUG1Ivoqc0XBYGO31n0uCXyoeqekV/fyx4czgBP/skMFDTCLB+Og1aeOKCC
 81S6KO3lywIj6HUDo2mTbtDsFSRjVYM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1762858088;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=H4iMLUEIFp+KFnCBMrOHfoCV2tmUed7YGGquhX1HYzE=;
 b=w05KIqedIeW2ibbg67OTG8PygRxA4MK6nk2TZ4uU5WZGCe1JGnO+kGkt8oTLDFDkEsxodC
 75OBHS0M3F0aqPDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 60D71148FB;
 Tue, 11 Nov 2025 10:48:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id xPGdF2gUE2nYPwAAD6G6ig
 (envelope-from <jack@suse.cz>); Tue, 11 Nov 2025 10:48:08 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
 id 1F726A28C8; Tue, 11 Nov 2025 11:48:08 +0100 (CET)
Date: Tue, 11 Nov 2025 11:48:08 +0100
To: Jeff Layton <jlayton@kernel.org>
Subject: Re: [PATCH v5 17/17] vfs: expose delegation support to userland
Message-ID: <tcpo34clqby633deon2qnccih24xor2mz6jm4fzh2zj7o24sjc@s5c25qgpgmv2>
References: <20251105-dir-deleg-ro-v5-0-7ebc168a88ac@kernel.org>
 <20251105-dir-deleg-ro-v5-17-7ebc168a88ac@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251105-dir-deleg-ro-v5-17-7ebc168a88ac@kernel.org>
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
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.com:email]
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

On Wed 05-11-25 11:54:03, Jeff Layton wrote:
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

For new apis CCing linux-api is a good practice ;)

...

> diff --git a/include/uapi/linux/fcntl.h b/include/uapi/linux/fcntl.h
> index 3741ea1b73d8500061567b6590ccf5fb4c6770f0..8123fe70e03cfb1ba9ce1b5e20d61b62e462a7ea 100644
> --- a/include/uapi/linux/fcntl.h
> +++ b/include/uapi/linux/fcntl.h
> @@ -79,6 +79,16 @@
>   */
>  #define RWF_WRITE_LIFE_NOT_SET	RWH_WRITE_LIFE_NOT_SET
>  
> +/* Set/Get delegations */
> +#define F_GETDELEG		(F_LINUX_SPECIFIC_BASE + 15)
> +#define F_SETDELEG		(F_LINUX_SPECIFIC_BASE + 16)
> +
> +/* Argument structure for F_GETDELEG and F_SETDELEG */
> +struct delegation {
> +	unsigned int	d_flags;	/* Must be 0 */
> +	short		d_type;		/* F_RDLCK, F_WRLCK, F_UNLCK */
> +};
> +

I think it would make sense for d_type to be unsigned since it's more or
less enum. Also struct delegation is going to have a hole in it at the end
which is always a concern with uAPI structures (passing around
uninitialized stuff). I think it would be good to put an explicit padding
there and enforce it is zeroed out.

								Honza

-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

