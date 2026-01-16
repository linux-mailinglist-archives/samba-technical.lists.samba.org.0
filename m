Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 15C20D30D89
	for <lists+samba-technical@lfdr.de>; Fri, 16 Jan 2026 13:06:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=WJuLQN1/VqCQ5MzAXUwztUOsWD7c/6Ri8BvtTGrLxeQ=; b=42eEmfImVXyIPtLJ2tpV7SDRPv
	jai5nPWb7gPtxDR1ypVr/wgpJp8snsaytlQHPdCTkL7zxmOg/JWo5I/Zcp4fUKO3ZEDsckBlBFQCj
	wHZY46uaSqLAm43DNrcQlsm5KU77pa8tRDAO/dwGcCXh82bCOKEbxGze4WZnY02HoAIzJPt11S1Tb
	pjS8SBkbdlIpLUdZ3FK63chtp1WPIkrkMtRTx4JQ8GZpvM7tunIxcAkOboKp6+ZMSxQKBMLVzpPNz
	AXM+xW5FjdFGjDJo0f85zsFMtyf2nptDz9184SY9VSL6XetCQA8mYk/nIyRqSdAesbr4WIiWSJ+9y
	QH2lfZIw==;
Received: from ip6-localhost ([::1]:36830 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vgiZt-000ExG-S1; Fri, 16 Jan 2026 12:05:21 +0000
Received: from smtp-out1.suse.de ([195.135.223.130]:43836) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vghYx-000EiO-0r
 for samba-technical@lists.samba.org; Fri, 16 Jan 2026 11:00:22 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id A863F336A7;
 Fri, 16 Jan 2026 10:45:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1768560355; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WJuLQN1/VqCQ5MzAXUwztUOsWD7c/6Ri8BvtTGrLxeQ=;
 b=NM/kSQUl/op+YKS2s6eKZXfE9Glh5kkfMDr9vCIJsC9FWe94PjEgFUboHs0ZKmqO49bUWq
 GGnb+NiraWiGN0Yc7/GMi+PXcDAXYotsEPDcTaiNspuD+pdYjp5VDufc+cwlF6YloG+qs3
 uSGr4retqv1mJn56UXxhwHQeZysiV4E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1768560355;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WJuLQN1/VqCQ5MzAXUwztUOsWD7c/6Ri8BvtTGrLxeQ=;
 b=YPA70NjZ53LaWpg1U5dSvh7NjJzYXWZLUEwmMsCnm1ykEpF60x4KxRv4KCQctMxjo+19kZ
 QfNXpE3F5HGTWWBA==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.cz header.s=susede2_rsa header.b="NM/kSQUl";
 dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=YPA70NjZ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1768560355; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WJuLQN1/VqCQ5MzAXUwztUOsWD7c/6Ri8BvtTGrLxeQ=;
 b=NM/kSQUl/op+YKS2s6eKZXfE9Glh5kkfMDr9vCIJsC9FWe94PjEgFUboHs0ZKmqO49bUWq
 GGnb+NiraWiGN0Yc7/GMi+PXcDAXYotsEPDcTaiNspuD+pdYjp5VDufc+cwlF6YloG+qs3
 uSGr4retqv1mJn56UXxhwHQeZysiV4E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1768560355;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WJuLQN1/VqCQ5MzAXUwztUOsWD7c/6Ri8BvtTGrLxeQ=;
 b=YPA70NjZ53LaWpg1U5dSvh7NjJzYXWZLUEwmMsCnm1ykEpF60x4KxRv4KCQctMxjo+19kZ
 QfNXpE3F5HGTWWBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 965853EA65;
 Fri, 16 Jan 2026 10:45:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 6CqxJOMWamkVCwAAD6G6ig
 (envelope-from <jack@suse.cz>); Fri, 16 Jan 2026 10:45:55 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
 id 30814A091D; Fri, 16 Jan 2026 11:45:55 +0100 (CET)
Date: Fri, 16 Jan 2026 11:45:55 +0100
To: Jeff Layton <jlayton@kernel.org>
Subject: Re: [PATCH 01/29] exportfs: add new EXPORT_OP_STABLE_HANDLES flag
Message-ID: <6bajjyslarqrjr2brzyy6bgrmqrdxyhc42q7pfmz42d4y4kjtn@fod6fi4uf6qv>
References: <20260115-exportfs-nfsd-v1-0-8e80160e3c0c@kernel.org>
 <20260115-exportfs-nfsd-v1-1-8e80160e3c0c@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260115-exportfs-nfsd-v1-1-8e80160e3c0c@kernel.org>
X-Spam-Score: -2.51
X-Spamd-Result: default: False [-2.51 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 SUSPICIOUS_RECIPS(1.50)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 MID_RHS_NOT_FQDN(0.50)[];
 R_DKIM_ALLOW(-0.20)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; MIME_TRACE(0.00)[0:+];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 RCVD_COUNT_THREE(0.00)[3]; RCVD_TLS_LAST(0.00)[];
 FUZZY_RATELIMITED(0.00)[rspamd.com]; ARC_NA(0.00)[];
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]; DKIM_TRACE(0.00)[suse.cz:+];
 TO_DN_SOME(0.00)[]; TO_MATCH_ENVRCPT_SOME(0.00)[];
 DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 FREEMAIL_CC(0.00)[kernel.org,zeniv.linux.org.uk,oracle.com,brown.name,redhat.com,talpey.com,gmail.com,google.com,linux.alibaba.com,linux-foundation.org,mit.edu,dilger.ca,suse.com,huawei.com,vivo.com,dubeyko.com,fb.com,squashfs.org.uk,samba.org,manguebit.org,microsoft.com,szeredi.hu,omnibond.com,fasheh.com,evilplan.org,paragon-software.com,infradead.org,nod.at,suse.cz,mail.parknet.co.jp,vger.kernel.org,kvack.org,lists.ozlabs.org,lists.samba.org,lists.orangefs.org,lists.linux.dev,lists.sourceforge.net,lists.infradead.org];
 RCPT_COUNT_GT_50(0.00)[74]; TAGGED_RCPT(0.00)[];
 R_RATELIMIT(0.00)[to_ip_from(RLpnapcpkwxdkc5mopt1ezhhna)];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 MISSING_XM_UA(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,
 imap1.dmz-prg2.suse.org:helo, suse.com:email, suse.cz:dkim, suse.cz:email]
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: A863F336A7
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Mailman-Approved-At: Fri, 16 Jan 2026 12:05:20 +0000
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
Cc: Martin Brandenburg <martin@omnibond.com>,
 jfs-discussion@lists.sourceforge.net, Jan Kara <jack@suse.cz>,
 Paulo Alcantara <pc@manguebit.org>, Alex Markuze <amarkuze@redhat.com>,
 Sandeep Dhavale <dhavale@google.com>, linux-btrfs@vger.kernel.org,
 Carlos Maiolino <cem@kernel.org>, Amir Goldstein <amir73il@gmail.com>,
 linux-unionfs@vger.kernel.org,
 Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
 Chris Mason <clm@fb.com>, Andreas Dilger <adilger.kernel@dilger.ca>,
 Chunhai Guo <guochunhai@vivo.com>, linux-mtd@lists.infradead.org,
 Mike Marshall <hubcap@omnibond.com>, linux-xfs@vger.kernel.org,
 linux-nilfs@vger.kernel.org, Yue Hu <zbestahu@gmail.com>,
 Miklos Szeredi <miklos@szeredi.hu>, Richard Weinberger <richard@nod.at>,
 Mark Fasheh <mark@fasheh.com>, Hugh Dickins <hughd@google.com>,
 Dai Ngo <Dai.Ngo@oracle.com>, Ryusuke Konishi <konishi.ryusuke@gmail.com>,
 Viacheslav Dubeyko <slava@dubeyko.com>, NeilBrown <neil@brown.name>,
 Gao Xiang <xiang@kernel.org>, linux-ext4@vger.kernel.org,
 Salah Triki <salah.triki@gmail.com>, linux-mm@kvack.org,
 devel@lists.orangefs.org, Shyam Prasad N <sprasad@microsoft.com>,
 Olga Kornievskaia <okorniev@redhat.com>, linux-cifs@vger.kernel.org,
 Dave Kleikamp <shaggy@kernel.org>, Chao Yu <chao@kernel.org>,
 linux-nfs@vger.kernel.org, Tom Talpey <tom@talpey.com>,
 ocfs2-devel@lists.linux.dev, Bharath SM <bharathsm@microsoft.com>,
 David Sterba <dsterba@suse.com>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Jeffle Xu <jefflexu@linux.alibaba.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 ceph-devel@vger.kernel.org, Ilya Dryomov <idryomov@gmail.com>,
 OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>,
 Andreas Gruenbacher <agruenba@redhat.com>, gfs2@lists.linux.dev,
 Christian Brauner <brauner@kernel.org>, Theodore Ts'o <tytso@mit.edu>,
 Luis de Bethencourt <luisbg@kernel.org>,
 Joseph Qi <joseph.qi@linux.alibaba.com>, linux-erofs@lists.ozlabs.org,
 samba-technical@lists.samba.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, Steve French <sfrench@samba.org>,
 Chuck Lever <chuck.lever@oracle.com>, Hongbo Li <lihongbo22@huawei.com>,
 Anna Schumaker <anna@kernel.org>, Jan Kara <jack@suse.com>,
 linux-fsdevel@vger.kernel.org, Phillip Lougher <phillip@squashfs.org.uk>,
 Andrew Morton <akpm@linux-foundation.org>, ntfs3@lists.linux.dev,
 David Woodhouse <dwmw2@infradead.org>, Trond Myklebust <trondmy@kernel.org>,
 Joel Becker <jlbec@evilplan.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thu 15-01-26 12:47:32, Jeff Layton wrote:
> At one time, nfsd could take the presence of struct export_operations to
> be an indicator that a filesystem was exportable via NFS. Since then, a
> lot of filesystems have grown export operations in order to provide
> filehandle support. Some of those (e.g. kernfs, pidfs, and nsfs) are not
> suitable for export via NFS since they lack filehandles that are
> stable across reboot.
> 
> Add a new EXPORT_OP_STABLE_HANDLES flag that indicates that the
> filesystem supports perisistent filehandles, a requirement for nfs
> export. While in there, switch to the BIT() macro for defining these
> flags.
> 
> For now, the flag is not checked anywhere. That will come later after
> we've added it to the existing filesystems that need to remain
> exportable.
> 
> Signed-off-by: Jeff Layton <jlayton@kernel.org>

...

> -#define EXPORT_OP_FLUSH_ON_CLOSE	(0x20) /* fs flushes file data on close */
> -#define EXPORT_OP_NOLOCKS		(0x40) /* no file locking support */
> +#define EXPORT_OP_FLUSH_ON_CLOSE	BIT(5) /* fs flushes file data on close */
> +#define EXPORT_OP_NOLOCKS		BIT(6) /* no file locking support */
> +#define EXPORT_OP_STABLE_HANDLES	BIT(7) /* required for nfsd export */

The comment "required for nfsd export" doesn't quite match the name. I'd
change the comment to something like "file handles are stable across
reboot". Otherwise feel free to add:

Reviewed-by: Jan Kara <jack@suse.cz>

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

