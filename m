Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 462FFACD95F
	for <lists+samba-technical@lfdr.de>; Wed,  4 Jun 2025 10:11:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=tWmBnvptzNYs4R0MZ3Uo0OTy6lzicOFPfnKUeZLec7k=; b=uKx3Mcs4qckkug7ix5jLfFlj83
	NQHgGuwi3kgA+QENZO+iymVWD+pi1sqJ3IYqPPBYjAZMJUoCcdiGICXEGoCd8pXr+8qnBMfVTA+1U
	aZfQYfJw+174RIlca9WcOn+9Swnb2+i6UyMCQdEG5LN/YvQASgWUsNJWmnAzFnttW0Y5qWlcD+kUJ
	VRe/DaSZQmb6Vor+BM2UHLM57L9HNE6WxwkhjCMLR3KFOGWdceTavo/O7hQCtlxZspsjdzq0YX9fB
	NCIgbTGw7FDsYXd0EvHLCCUTYOEKpuK352lNjkqJdNaiVOqJzzQ4JE+UoDTIi9EifIHQyyStbCTMR
	tf1jy59Q==;
Received: from ip6-localhost ([::1]:64352 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uMjD9-006a0v-9u; Wed, 04 Jun 2025 08:10:59 +0000
Received: from smtp-out2.suse.de ([195.135.223.131]:43564) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uMYFc-006Ym8-Eh
 for samba-technical@lists.samba.org; Tue, 03 Jun 2025 20:28:51 +0000
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 0A09B1F443;
 Tue,  3 Jun 2025 20:14:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1748981642; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tWmBnvptzNYs4R0MZ3Uo0OTy6lzicOFPfnKUeZLec7k=;
 b=N9Kbvcl1o+W8mnAV52zBhxxyYHA97Cb9y96xWViRy3Yzan5mZrTcZW4eDHM+PDAJTz6E6N
 qoYcq5rOWPG+jlGqOMtgP4auf8TMckeLsezSaiWM+dn3D02fPUEyzQI3AS8wZGeQh0sTqW
 wVVj71wp9xcn1BGy/t0w8V9bMx0wFsk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1748981642;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tWmBnvptzNYs4R0MZ3Uo0OTy6lzicOFPfnKUeZLec7k=;
 b=BB4lK6RIU1ic1WRsD45tpMjFD1GpBqLcSKDtMJp9C60Whrnl6cXeo9AGiXcRfjhu8+mWDV
 KFXHeyv2/WXiGLDQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1748981642; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tWmBnvptzNYs4R0MZ3Uo0OTy6lzicOFPfnKUeZLec7k=;
 b=N9Kbvcl1o+W8mnAV52zBhxxyYHA97Cb9y96xWViRy3Yzan5mZrTcZW4eDHM+PDAJTz6E6N
 qoYcq5rOWPG+jlGqOMtgP4auf8TMckeLsezSaiWM+dn3D02fPUEyzQI3AS8wZGeQh0sTqW
 wVVj71wp9xcn1BGy/t0w8V9bMx0wFsk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1748981642;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tWmBnvptzNYs4R0MZ3Uo0OTy6lzicOFPfnKUeZLec7k=;
 b=BB4lK6RIU1ic1WRsD45tpMjFD1GpBqLcSKDtMJp9C60Whrnl6cXeo9AGiXcRfjhu8+mWDV
 KFXHeyv2/WXiGLDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E7FFB13A92;
 Tue,  3 Jun 2025 20:14:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id TamiOIlXP2itDgAAD6G6ig
 (envelope-from <jack@suse.cz>); Tue, 03 Jun 2025 20:14:01 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
 id 89AB6A08DD; Tue,  3 Jun 2025 22:13:53 +0200 (CEST)
Date: Tue, 3 Jun 2025 22:13:53 +0200
To: Jeff Layton <jlayton@kernel.org>
Subject: Re: [PATCH RFC v2 21/28] fsnotify: export fsnotify_recalc_mask()
Message-ID: <ssbrsekgkssixxq4wiybw6k7n24efg64ozh6vrzxuft2sdz2w7@3tfmzfnqdwbu>
References: <20250602-dir-deleg-v2-0-a7919700de86@kernel.org>
 <20250602-dir-deleg-v2-21-a7919700de86@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250602-dir-deleg-v2-21-a7919700de86@kernel.org>
X-Spam-Flag: NO
X-Spam-Score: -2.30
X-Spamd-Result: default: False [-2.30 / 50.00]; BAYES_HAM(-3.00)[99.99%];
 SUSPICIOUS_RECIPS(1.50)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 MID_RHS_NOT_FQDN(0.50)[]; NEURAL_HAM_SHORT(-0.20)[-1.000];
 MIME_GOOD(-0.10)[text/plain]; RCPT_COUNT_TWELVE(0.00)[26];
 RCVD_VIA_SMTP_AUTH(0.00)[]; MIME_TRACE(0.00)[0:+];
 ARC_NA(0.00)[]; MISSING_XM_UA(0.00)[]; TO_DN_SOME(0.00)[];
 TAGGED_RCPT(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com];
 R_RATELIMIT(0.00)[to_ip_from(RL63fqwwx8ot6gmekemcs76f9d)];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 FREEMAIL_CC(0.00)[zeniv.linux.org.uk,kernel.org,suse.cz,oracle.com,gmail.com,samba.org,manguebit.com,microsoft.com,talpey.com,brown.name,redhat.com,lwn.net,szeredi.hu,vger.kernel.org,lists.samba.org];
 RCVD_COUNT_THREE(0.00)[3]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 FUZZY_BLOCKED(0.00)[rspamd.com]; RCVD_TLS_LAST(0.00)[];
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,imap1.dmz-prg2.suse.org:helo]
X-Mailman-Approved-At: Wed, 04 Jun 2025 08:10:58 +0000
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
 linux-doc@vger.kernel.org, Amir Goldstein <amir73il@gmail.com>,
 Paulo Alcantara <pc@manguebit.com>, linux-cifs@vger.kernel.org,
 Jonathan Corbet <corbet@lwn.net>, Dai Ngo <Dai.Ngo@oracle.com>,
 NeilBrown <neil@brown.name>, Shyam Prasad N <sprasad@microsoft.com>,
 Olga Kornievskaia <okorniev@redhat.com>, linux-nfs@vger.kernel.org,
 Tom Talpey <tom@talpey.com>, Bharath SM <bharathsm@microsoft.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, Miklos Szeredi <miklos@szeredi.hu>,
 samba-technical@lists.samba.org, linux-kernel@vger.kernel.org,
 Steve French <sfrench@samba.org>, Chuck Lever <chuck.lever@oracle.com>,
 Anna Schumaker <anna@kernel.org>, linux-fsdevel@vger.kernel.org,
 Trond Myklebust <trondmy@kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Mon 02-06-25 10:02:04, Jeff Layton wrote:
> nfsd needs to call this when new directory delegations are set or unset.
> 
> Signed-off-by: Jeff Layton <jlayton@kernel.org>

So fsnotify_recalc_mask() is not a great API to export because it depends
on lifetime rules of mark connector - in particular the caller has to make
sure the connector stays alive while fsnotify_recalc_mask() is running. So
far the knowledge was internal in fsnotify subsystem but now NFSD needs to
know as well.

Generally you need to recalculate the mask when you modify events you
listen to in a mark. So perhaps we should provide an API like:

int fsnotify_modify_mark_mask(struct fsnotify_mark *mark, __u32 mask_clear,
			      __u32 mask_set);

which could be used to modify mark mask without having to care about
details like cached masks and connector locking rules?

								Honza

> ---
>  fs/notify/mark.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/fs/notify/mark.c b/fs/notify/mark.c
> index 798340db69d761dd05c1b361c251818dee89b9cf..ff21409c3ca3ad948557225afc586da3728f7cbe 100644
> --- a/fs/notify/mark.c
> +++ b/fs/notify/mark.c
> @@ -308,6 +308,7 @@ void fsnotify_recalc_mask(struct fsnotify_mark_connector *conn)
>  	if (update_children)
>  		fsnotify_conn_set_children_dentry_flags(conn);
>  }
> +EXPORT_SYMBOL_GPL(fsnotify_recalc_mask);
>  
>  /* Free all connectors queued for freeing once SRCU period ends */
>  static void fsnotify_connector_destroy_workfn(struct work_struct *work)
> 
> -- 
> 2.49.0
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

