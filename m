Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 289E7D08075
	for <lists+samba-technical@lfdr.de>; Fri, 09 Jan 2026 09:59:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=KSDIIOSgIHhRcbxi9/+AQB/pdbt9dql3OYIFgg84PNM=; b=2YOPdeA8FLzYRMK8+N0Ualj2QU
	LT52yfXC1kwN8P5GnwY+zaEiCKUMMzHrBUL9K6kANaBmFC9TplMy7hg9X4xQ0Yj666vtsUMOeb6Ip
	5RjFre2MeELro83C1FUnF40IR8f08XRtYJMi0nVpbgB8l/9J2h/SKP0hDRqWS5TIsc5xmhOC0PuDH
	lQFQgRj9Ha98pv2Dt3CApijVCWzVXgqm9YaGx86ZGxyLQTdYwiOVuW6WgxIqPzC0Vy6QP4MIgfaUf
	k0Vg17taldpFFeQ5kRwErwSw7X0VrtsqMtTpdVru4manf//4Xc2iXZC1Yxd7buq2G7Uh36Yz3QG91
	CWfaOb7g==;
Received: from ip6-localhost ([::1]:28460 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ve8Ho-001icY-D6; Fri, 09 Jan 2026 08:56:00 +0000
Received: from smtp-out2.suse.de ([195.135.223.131]:48068) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vdtpI-001fje-55
 for samba-technical@lists.samba.org; Thu, 08 Jan 2026 17:29:38 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 8CF365CB97;
 Thu,  8 Jan 2026 17:29:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1767893373; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KSDIIOSgIHhRcbxi9/+AQB/pdbt9dql3OYIFgg84PNM=;
 b=LKLHZsveRqERTai/L93RkI2K84owBSoPVDX4PWwQdZUPnhOhUJ/E2ghFkO7TB3qTeFK4In
 hyXqDZRKe3gPdTEa2pfQUJD9r7JhY2Gxy+QwNxGBAIUcG2XYPrlvQ2GUfH/jDBAwWN0nsL
 ohZmkjATm1kB2ioRc8QTK5suspy3fCU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1767893373;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KSDIIOSgIHhRcbxi9/+AQB/pdbt9dql3OYIFgg84PNM=;
 b=xtHDnGn+2hOmpYwhvCDVTOBaoIs4Ao1kPHDaKuKZg7EQKiV5T+3VpS+c1qeMoAhoh6KcSh
 BVtoa2RrFhAbRIAA==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=LKLHZsve;
 dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=xtHDnGn+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1767893373; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KSDIIOSgIHhRcbxi9/+AQB/pdbt9dql3OYIFgg84PNM=;
 b=LKLHZsveRqERTai/L93RkI2K84owBSoPVDX4PWwQdZUPnhOhUJ/E2ghFkO7TB3qTeFK4In
 hyXqDZRKe3gPdTEa2pfQUJD9r7JhY2Gxy+QwNxGBAIUcG2XYPrlvQ2GUfH/jDBAwWN0nsL
 ohZmkjATm1kB2ioRc8QTK5suspy3fCU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1767893373;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KSDIIOSgIHhRcbxi9/+AQB/pdbt9dql3OYIFgg84PNM=;
 b=xtHDnGn+2hOmpYwhvCDVTOBaoIs4Ao1kPHDaKuKZg7EQKiV5T+3VpS+c1qeMoAhoh6KcSh
 BVtoa2RrFhAbRIAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 76B8A3EA63;
 Thu,  8 Jan 2026 17:29:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id qCj6HH3pX2kzeAAAD6G6ig
 (envelope-from <jack@suse.cz>); Thu, 08 Jan 2026 17:29:33 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
 id 213A0A0B23; Thu,  8 Jan 2026 18:29:33 +0100 (CET)
Date: Thu, 8 Jan 2026 18:29:33 +0100
To: Jeff Layton <jlayton@kernel.org>
Subject: Re: [PATCH 20/24] udf: add setlease file operation
Message-ID: <uyibvpewjdnrwrdyby3kr4lq244qjolgoje5bdyzpwjwndhzh6@mgp67jphmu2u>
References: <20260108-setlease-6-20-v1-0-ea4dec9b67fa@kernel.org>
 <20260108-setlease-6-20-v1-20-ea4dec9b67fa@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260108-setlease-6-20-v1-20-ea4dec9b67fa@kernel.org>
X-Spamd-Result: default: False [-2.51 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 SUSPICIOUS_RECIPS(1.50)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 MID_RHS_NOT_FQDN(0.50)[];
 R_DKIM_ALLOW(-0.20)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; RCVD_TLS_LAST(0.00)[];
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 RCVD_COUNT_THREE(0.00)[3]; FUZZY_RATELIMITED(0.00)[rspamd.com];
 MIME_TRACE(0.00)[0:+];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 ARC_NA(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com];
 FREEMAIL_CC(0.00)[kernel.org,gmail.com,fluxnic.net,infradead.org,suse.cz,alarsen.net,zeniv.linux.org.uk,suse.com,fb.com,linux.alibaba.com,google.com,huawei.com,vivo.com,mit.edu,dilger.ca,mail.parknet.co.jp,nod.at,dubeyko.com,paragon-software.com,fasheh.com,evilplan.org,omnibond.com,szeredi.hu,squashfs.org.uk,linux-foundation.org,samsung.com,sony.com,oracle.com,redhat.com,lwn.net,ionkov.net,codewreck.org,crudebyte.com,samba.org,manguebit.org,microsoft.com,talpey.com,vger.kernel.org,lists.ozlabs.org,lists.sourceforge.net,lists.infradead.org,lists.linux.dev,lists.orangefs.org,kvack.org,lists.samba.org];
 DKIM_TRACE(0.00)[suse.cz:+]; TO_MATCH_ENVRCPT_SOME(0.00)[];
 DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; RCPT_COUNT_GT_50(0.00)[86];
 TAGGED_RCPT(0.00)[];
 R_RATELIMIT(0.00)[to_ip_from(RLjxstjou9w9fpr873xxxyrjcd)];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 MISSING_XM_UA(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,
 imap1.dmz-prg2.suse.org:rdns, suse.cz:dkim, suse.cz:email]
X-Spam-Flag: NO
X-Spam-Score: -2.51
X-Rspamd-Queue-Id: 8CF365CB97
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Mailman-Approved-At: Fri, 09 Jan 2026 08:55:52 +0000
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
Cc: Latchesar Ionkov <lucho@ionkov.net>, Dave Kleikamp <shaggy@kernel.org>,
 Alexander Aring <alex.aring@gmail.com>, Jan Kara <jack@suse.cz>,
 Paulo Alcantara <pc@manguebit.org>, Sandeep Dhavale <dhavale@google.com>,
 Martin Brandenburg <martin@omnibond.com>, Yuezhang Mo <yuezhang.mo@sony.com>,
 Anders Larsen <al@alarsen.net>, Amir Goldstein <amir73il@gmail.com>,
 jfs-discussion@lists.sourceforge.net, linux-unionfs@vger.kernel.org,
 Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
 Chris Mason <clm@fb.com>, Andreas Dilger <adilger.kernel@dilger.ca>,
 Chunhai Guo <guochunhai@vivo.com>, Ilya Dryomov <idryomov@gmail.com>,
 linux-mtd@lists.infradead.org, Mike Marshall <hubcap@omnibond.com>,
 linux-xfs@vger.kernel.org, Xiubo Li <xiubli@redhat.com>,
 Yue Hu <zbestahu@gmail.com>, Miklos Szeredi <miklos@szeredi.hu>,
 samba-technical@lists.samba.org, Richard Weinberger <richard@nod.at>,
 Mark Fasheh <mark@fasheh.com>, devel@lists.orangefs.org,
 Hugh Dickins <hughd@google.com>,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>, ntfs3@lists.linux.dev,
 Joseph Qi <joseph.qi@linux.alibaba.com>, linux-mm@kvack.org,
 Viacheslav Dubeyko <slava@dubeyko.com>, linux-btrfs@vger.kernel.org,
 Gao Xiang <xiang@kernel.org>, linux-ext4@vger.kernel.org,
 Salah Triki <salah.triki@gmail.com>, Carlos Maiolino <cem@kernel.org>,
 Dominique Martinet <asmadeus@codewreck.org>,
 Shyam Prasad N <sprasad@microsoft.com>,
 Christian Schoenebeck <linux_oss@crudebyte.com>, linux-cifs@vger.kernel.org,
 Chao Yu <chao@kernel.org>, linux-nfs@vger.kernel.org,
 Tom Talpey <tom@talpey.com>, ocfs2-devel@lists.linux.dev,
 Bharath SM <bharathsm@microsoft.com>, linux-nilfs@vger.kernel.org,
 David Sterba <dsterba@suse.com>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Jeffle Xu <jefflexu@linux.alibaba.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 ceph-devel@vger.kernel.org, Eric Van Hensbergen <ericvh@kernel.org>,
 Ryusuke Konishi <konishi.ryusuke@gmail.com>,
 OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>,
 Andreas Gruenbacher <agruenba@redhat.com>, Hans de Goede <hansg@kernel.org>,
 gfs2@lists.linux.dev, Christian Brauner <brauner@kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net, Theodore Ts'o <tytso@mit.edu>,
 Luis de Bethencourt <luisbg@kernel.org>, Nicolas Pitre <nico@fluxnic.net>,
 linux-erofs@lists.ozlabs.org, v9fs@lists.linux.dev,
 Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Namjae Jeon <linkinjeon@kernel.org>,
 Steve French <sfrench@samba.org>, Chuck Lever <chuck.lever@oracle.com>,
 Hongbo Li <lihongbo22@huawei.com>, Anna Schumaker <anna@kernel.org>,
 Jan Kara <jack@suse.com>, linux-fsdevel@vger.kernel.org,
 Phillip Lougher <phillip@squashfs.org.uk>,
 Andrew Morton <akpm@linux-foundation.org>,
 Sungjong Seo <sj1557.seo@samsung.com>, David Woodhouse <dwmw2@infradead.org>,
 Trond Myklebust <trondmy@kernel.org>, Joel Becker <jlbec@evilplan.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thu 08-01-26 12:13:15, Jeff Layton wrote:
> Add the setlease file_operation pointing to generic_setlease to the udf
> file_operations structures. A future patch will change the default
> behavior to reject lease attempts with -EINVAL when there is no
> setlease file operation defined. Add generic_setlease to retain the
> ability to set leases on this filesystem.
> 
> Signed-off-by: Jeff Layton <jlayton@kernel.org>

Looks good. Feel free to add:

Reviewed-by: Jan Kara <jack@suse.cz>

								Honza

> ---
>  fs/udf/dir.c  | 2 ++
>  fs/udf/file.c | 2 ++
>  2 files changed, 4 insertions(+)
> 
> diff --git a/fs/udf/dir.c b/fs/udf/dir.c
> index 5023dfe191e8088b78396997a8915bf383f7a2d2..5bf75638f3520ecb3a0a2ade2279ab56787ecd11 100644
> --- a/fs/udf/dir.c
> +++ b/fs/udf/dir.c
> @@ -24,6 +24,7 @@
>  
>  #include <linux/string.h>
>  #include <linux/errno.h>
> +#include <linux/filelock.h>
>  #include <linux/mm.h>
>  #include <linux/slab.h>
>  #include <linux/bio.h>
> @@ -157,4 +158,5 @@ const struct file_operations udf_dir_operations = {
>  	.iterate_shared		= udf_readdir,
>  	.unlocked_ioctl		= udf_ioctl,
>  	.fsync			= generic_file_fsync,
> +	.setlease		= generic_setlease,
>  };
> diff --git a/fs/udf/file.c b/fs/udf/file.c
> index 0d76c4f37b3e71ffe6a883a8d97a6c3038d2a01d..32ae7cfd72c549958b70824b449cf146f6750f44 100644
> --- a/fs/udf/file.c
> +++ b/fs/udf/file.c
> @@ -28,6 +28,7 @@
>  #include <linux/string.h> /* memset */
>  #include <linux/capability.h>
>  #include <linux/errno.h>
> +#include <linux/filelock.h>
>  #include <linux/pagemap.h>
>  #include <linux/uio.h>
>  
> @@ -208,6 +209,7 @@ const struct file_operations udf_file_operations = {
>  	.splice_read		= filemap_splice_read,
>  	.splice_write		= iter_file_splice_write,
>  	.llseek			= generic_file_llseek,
> +	.setlease		= generic_setlease,
>  };
>  
>  static int udf_setattr(struct mnt_idmap *idmap, struct dentry *dentry,
> 
> -- 
> 2.52.0
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

