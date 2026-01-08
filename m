Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id C52EAD08077
	for <lists+samba-technical@lfdr.de>; Fri, 09 Jan 2026 09:59:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=2FXB05KWinghyISdrGnDsHHRXJ2LLquCS7DmluRFvrw=; b=RDvO7ijqgYk3SDBrzv0mLj8jgX
	zP125gCVKR+Ygy8r01pIq1VI2JM9wmvvmXJebum3lis4OyNF9md0kvrGGzQwTDSqjBBF3Vx4AREoX
	Cjhwa9Zvvqoldr6cHXQgU5HKWN9J0q2C47QNmzvfRck50bRt5G3BftLFr/Ug8qIrgLkAIyfUpOoAM
	kHJ1GfvX/6iLmRBy8sTwGTVHsoHPdY3xzKp1Z3Y+S3acVeKDt3HEnOadPXgJSRKaq4WRmrLspHaJV
	KrL7eYVyWMlIyzKsg8jsRJN26tgZkJbaZVBDKlq96KX7H4HZ65E8aIK+bapmZNO55bNASXr+xRVYd
	K/GOvwkw==;
Received: from ip6-localhost ([::1]:33694 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ve8Hn-001iax-5r; Fri, 09 Jan 2026 08:55:59 +0000
Received: from smtp-out2.suse.de ([2a07:de40:b251:101:10:150:64:2]:33146) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vdtow-001fjX-SF
 for samba-technical@lists.samba.org; Thu, 08 Jan 2026 17:29:17 +0000
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 58B935CB90;
 Thu,  8 Jan 2026 17:29:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1767893352; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2FXB05KWinghyISdrGnDsHHRXJ2LLquCS7DmluRFvrw=;
 b=q98OikX8Rlp+tPfB2ZHxVR36nEhJ+HZD3bnqMRpYfLGtKGtaEncX/JNBcjEjloWK4bXk1i
 cIWDAvSVP/sBQXMd6MLI6eFHRSDl9mCxqH52YzdYtVgcoOrPlWPoiERTin9dhH0ik9+24V
 rDIl9wrHXO7t0NpcA3X/w+2/NXnTdMc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1767893352;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2FXB05KWinghyISdrGnDsHHRXJ2LLquCS7DmluRFvrw=;
 b=jLiiYj1NB/KC2FKXGW0Rp8Gdggj+tWABL2abRsfkiJij0e8jQKly3ieKviRIh0zE1u83aY
 WzA2A1lxr6mI77CQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1767893352; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2FXB05KWinghyISdrGnDsHHRXJ2LLquCS7DmluRFvrw=;
 b=q98OikX8Rlp+tPfB2ZHxVR36nEhJ+HZD3bnqMRpYfLGtKGtaEncX/JNBcjEjloWK4bXk1i
 cIWDAvSVP/sBQXMd6MLI6eFHRSDl9mCxqH52YzdYtVgcoOrPlWPoiERTin9dhH0ik9+24V
 rDIl9wrHXO7t0NpcA3X/w+2/NXnTdMc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1767893352;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2FXB05KWinghyISdrGnDsHHRXJ2LLquCS7DmluRFvrw=;
 b=jLiiYj1NB/KC2FKXGW0Rp8Gdggj+tWABL2abRsfkiJij0e8jQKly3ieKviRIh0zE1u83aY
 WzA2A1lxr6mI77CQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 446973EA63;
 Thu,  8 Jan 2026 17:29:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id OEmrEGjpX2kZeAAAD6G6ig
 (envelope-from <jack@suse.cz>); Thu, 08 Jan 2026 17:29:12 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
 id 008D9A0B23; Thu,  8 Jan 2026 18:29:11 +0100 (CET)
Date: Thu, 8 Jan 2026 18:29:11 +0100
To: Jeff Layton <jlayton@kernel.org>
Subject: Re: [PATCH 15/24] ocfs2: add setlease file operation
Message-ID: <ou554m23k22d2mswmhwxyhrhfnrhz6socc2jx7p2ef3w7zb56f@noumdopgdg5f>
References: <20260108-setlease-6-20-v1-0-ea4dec9b67fa@kernel.org>
 <20260108-setlease-6-20-v1-15-ea4dec9b67fa@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260108-setlease-6-20-v1-15-ea4dec9b67fa@kernel.org>
X-Spamd-Result: default: False [-2.30 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 SUSPICIOUS_RECIPS(1.50)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 MID_RHS_NOT_FQDN(0.50)[]; NEURAL_HAM_SHORT(-0.20)[-1.000];
 MIME_GOOD(-0.10)[text/plain];
 FUZZY_RATELIMITED(0.00)[rspamd.com]; MIME_TRACE(0.00)[0:+];
 RCVD_COUNT_THREE(0.00)[3]; RCVD_TLS_LAST(0.00)[];
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 ARC_NA(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com];
 R_RATELIMIT(0.00)[to_ip_from(RL6z1i6dkhnac7oamujmo9nifa)];
 TO_DN_SOME(0.00)[]; TO_MATCH_ENVRCPT_SOME(0.00)[];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 FREEMAIL_CC(0.00)[kernel.org,gmail.com,fluxnic.net,infradead.org,suse.cz,alarsen.net,zeniv.linux.org.uk,suse.com,fb.com,linux.alibaba.com,google.com,huawei.com,vivo.com,mit.edu,dilger.ca,mail.parknet.co.jp,nod.at,dubeyko.com,paragon-software.com,fasheh.com,evilplan.org,omnibond.com,szeredi.hu,squashfs.org.uk,linux-foundation.org,samsung.com,sony.com,oracle.com,redhat.com,lwn.net,ionkov.net,codewreck.org,crudebyte.com,samba.org,manguebit.org,microsoft.com,talpey.com,vger.kernel.org,lists.ozlabs.org,lists.sourceforge.net,lists.infradead.org,lists.linux.dev,lists.orangefs.org,kvack.org,lists.samba.org];
 RCPT_COUNT_GT_50(0.00)[86]; RCVD_VIA_SMTP_AUTH(0.00)[];
 TAGGED_RCPT(0.00)[]; MISSING_XM_UA(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.cz:email]
X-Spam-Flag: NO
X-Spam-Score: -2.30
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

On Thu 08-01-26 12:13:10, Jeff Layton wrote:
> Add the setlease file_operation to ocfs2_fops, ocfs2_dops,
> ocfs2_fops_no_plocks, and ocfs2_dops_no_plocks, pointing to
> generic_setlease.  A future patch will change the default behavior to
> reject lease attempts with -EINVAL when there is no setlease file
> operation defined. Add generic_setlease to retain the ability to set
> leases on this filesystem.
> 
> Signed-off-by: Jeff Layton <jlayton@kernel.org>

Looks good. Feel free to add:

Reviewed-by: Jan Kara <jack@suse.cz>

								Honza

> ---
>  fs/ocfs2/file.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/fs/ocfs2/file.c b/fs/ocfs2/file.c
> index 732c61599159ccb1f8fbcbb44e848f78678221d9..ed961a854983d5e7abe935e160e3029c48e6fca4 100644
> --- a/fs/ocfs2/file.c
> +++ b/fs/ocfs2/file.c
> @@ -19,6 +19,7 @@
>  #include <linux/mount.h>
>  #include <linux/writeback.h>
>  #include <linux/falloc.h>
> +#include <linux/filelock.h>
>  #include <linux/quotaops.h>
>  #include <linux/blkdev.h>
>  #include <linux/backing-dev.h>
> @@ -2823,6 +2824,7 @@ const struct file_operations ocfs2_fops = {
>  	.fallocate	= ocfs2_fallocate,
>  	.remap_file_range = ocfs2_remap_file_range,
>  	.fop_flags	= FOP_ASYNC_LOCK,
> +	.setlease	= generic_setlease,
>  };
>  
>  WRAP_DIR_ITER(ocfs2_readdir) // FIXME!
> @@ -2840,6 +2842,7 @@ const struct file_operations ocfs2_dops = {
>  	.lock		= ocfs2_lock,
>  	.flock		= ocfs2_flock,
>  	.fop_flags	= FOP_ASYNC_LOCK,
> +	.setlease	= generic_setlease,
>  };
>  
>  /*
> @@ -2871,6 +2874,7 @@ const struct file_operations ocfs2_fops_no_plocks = {
>  	.splice_write	= iter_file_splice_write,
>  	.fallocate	= ocfs2_fallocate,
>  	.remap_file_range = ocfs2_remap_file_range,
> +	.setlease	= generic_setlease,
>  };
>  
>  const struct file_operations ocfs2_dops_no_plocks = {
> @@ -2885,4 +2889,5 @@ const struct file_operations ocfs2_dops_no_plocks = {
>  	.compat_ioctl   = ocfs2_compat_ioctl,
>  #endif
>  	.flock		= ocfs2_flock,
> +	.setlease	= generic_setlease,
>  };
> 
> -- 
> 2.52.0
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

