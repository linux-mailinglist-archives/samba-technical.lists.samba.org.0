Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 62A05775568
	for <lists+samba-technical@lfdr.de>; Wed,  9 Aug 2023 10:32:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=fun65h1R4diSDJnLTZ/cxzR1ILC0j7wzISUUtC+n2VQ=; b=hxeWDCp3IJqVtoQbd8a/z8Nc6q
	TQ7w2lHCsX/jfyFSs1xlLtOPZUsYMfJmz6TVHgHh0cdnnC7Dz2N6GYxiExeyQtlUGAHzYeRXuX/0B
	wqdWkt4xCvfqfongKwcCazMtL0KqslUwjtVnueGSTK/cLFDowL1v8pOXEGYSUt1BaWF5I+Q/iyiom
	+sMhhZNN8LGOpYfYDJOpU3oaFtQmDynqWzwke10UjdsNpJE1vggAJ5FBVqDczOMIcCxVY/yuvTPjm
	zFyUYmGkNTbCl5BFwyd677cawm3NYNP6+rAphrUTKHeuAZOUwUkO+3Qe0/BeTZd4g+aVCs8QUsmZ3
	c/whaYgg==;
Received: from ip6-localhost ([::1]:62452 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1qTebW-00B6p5-5g; Wed, 09 Aug 2023 08:31:42 +0000
Received: from smtp-out2.suse.de ([2001:67c:2178:6::1d]:36374) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1qTeTB-00B5Ax-8Q
 for samba-technical@lists.samba.org; Wed, 09 Aug 2023 08:23:09 +0000
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 3A8C41F388;
 Wed,  9 Aug 2023 08:23:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1691569381; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fun65h1R4diSDJnLTZ/cxzR1ILC0j7wzISUUtC+n2VQ=;
 b=g4FDCoxrnA/p+GYB2SAgg9FCsHDC8xx9oZ/+5lp2F0zXGltHAWDKRIOtF8gm878iBpKXUt
 roN9QLxvxxz/hruPD50xpPKd1EJgyufH1Q9BSATz9Nc8CpHpABXAhB63acjBhnT8R1dzx/
 osOyq4rFMxe4W2YvEs3BmnQMVSN/P5A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1691569381;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fun65h1R4diSDJnLTZ/cxzR1ILC0j7wzISUUtC+n2VQ=;
 b=YP+i5WCgxaDO0MJwnfKAGmomKqp+nrgJtNPAsBPZzyeBoI4TdjLxb1qRz8dnXxGoUZwRPp
 ye7wBZnxxnt9gbCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2633E13251;
 Wed,  9 Aug 2023 08:23:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id kWhPCeVM02RBbwAAMHmgww
 (envelope-from <jack@suse.cz>); Wed, 09 Aug 2023 08:23:01 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
 id 9D476A0769; Wed,  9 Aug 2023 10:23:00 +0200 (CEST)
Date: Wed, 9 Aug 2023 10:23:00 +0200
To: Christian Brauner <brauner@kernel.org>
Subject: Re: [PATCH v7 06/13] ubifs: have ubifs_update_time use
 inode_update_timestamps
Message-ID: <20230809082300.veczantamvcpinxu@quack3>
References: <20230807-mgctime-v7-0-d1dec143a704@kernel.org>
 <20230807-mgctime-v7-6-d1dec143a704@kernel.org>
 <20230808093701.ggyj7tyqonivl7tb@quack3>
 <20230809-handreichung-umgearbeitet-951eebed4d61@brauner>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230809-handreichung-umgearbeitet-951eebed4d61@brauner>
X-Mailman-Approved-At: Wed, 09 Aug 2023 08:31:39 +0000
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
Cc: Latchesar Ionkov <lucho@ionkov.net>,
 Martin Brandenburg <martin@omnibond.com>,
 Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
 Jan Kara <jack@suse.cz>, linux-xfs@vger.kernel.org,
 "Darrick J. Wong" <djwong@kernel.org>,
 Dominique Martinet <asmadeus@codewreck.org>,
 Christian Schoenebeck <linux_oss@crudebyte.com>, ecryptfs@vger.kernel.org,
 linux-unionfs@vger.kernel.org, David Howells <dhowells@redhat.com>,
 Chris Mason <clm@fb.com>, Andreas Dilger <adilger.kernel@dilger.ca>,
 Hans de Goede <hdegoede@redhat.com>, Marc Dionne <marc.dionne@auristor.com>,
 samba-technical@lists.samba.org, codalist@coda.cs.cmu.edu,
 linux-afs@lists.infradead.org, linux-mtd@lists.infradead.org,
 Mike Marshall <hubcap@omnibond.com>, Paulo Alcantara <pc@manguebit.com>,
 linux-cifs@vger.kernel.org, Eric Van Hensbergen <ericvh@kernel.org>,
 Andreas Gruenbacher <agruenba@redhat.com>, Miklos Szeredi <miklos@szeredi.hu>,
 Richard Weinberger <richard@nod.at>, Mark Fasheh <mark@fasheh.com>,
 Hugh Dickins <hughd@google.com>, Benjamin Coddington <bcodding@redhat.com>,
 Tyler Hicks <code@tyhicks.com>, cluster-devel@redhat.com, coda@cs.cmu.edu,
 linux-mm@kvack.org, Ilya Dryomov <idryomov@gmail.com>,
 Iurii Zaikin <yzaikin@google.com>, Namjae Jeon <linkinjeon@kernel.org>,
 Trond Myklebust <trond.myklebust@hammerspace.com>,
 Shyam Prasad N <sprasad@microsoft.com>, Amir Goldstein <amir73il@gmail.com>,
 Kees Cook <keescook@chromium.org>, ocfs2-devel@lists.linux.dev,
 Chao Yu <chao@kernel.org>, Josef Bacik <josef@toxicpanda.com>,
 Tom Talpey <tom@talpey.com>, Tejun Heo <tj@kernel.org>,
 Yue Hu <huyue2@coolpad.com>, Alexander Viro <viro@zeniv.linux.org.uk>,
 David Sterba <dsterba@suse.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 ceph-devel@vger.kernel.org, Xiubo Li <xiubli@redhat.com>,
 Gao Xiang <xiang@kernel.org>, OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>,
 Jan Harkes <jaharkes@cs.cmu.edu>, linux-nfs@vger.kernel.org,
 linux-ext4@vger.kernel.org, Theodore Ts'o <tytso@mit.edu>,
 Joseph Qi <joseph.qi@linux.alibaba.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, v9fs@lists.linux.dev,
 ntfs3@lists.linux.dev, Jeff Layton <jlayton@kernel.org>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 Steve French <sfrench@samba.org>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Jeffle Xu <jefflexu@linux.alibaba.com>,
 devel@lists.orangefs.org, Anna Schumaker <anna@kernel.org>,
 Jan Kara <jack@suse.com>, Bob Peterson <rpeterso@redhat.com>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Sungjong Seo <sj1557.seo@samsung.com>, linux-erofs@lists.ozlabs.org,
 linux-btrfs@vger.kernel.org, Joel Becker <jlbec@evilplan.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wed 09-08-23 09:06:34, Christian Brauner wrote:
> On Tue, Aug 08, 2023 at 11:37:01AM +0200, Jan Kara wrote:
> > On Mon 07-08-23 15:38:37, Jeff Layton wrote:
> > > In later patches, we're going to drop the "now" parameter from the
> > > update_time operation. Prepare ubifs for this, by having it use the new
> > > inode_update_timestamps helper.
> > > 
> > > Signed-off-by: Jeff Layton <jlayton@kernel.org>
> > 
> > One comment below:
> > 
> > > diff --git a/fs/ubifs/file.c b/fs/ubifs/file.c
> > > index df9086b19cd0..2d0178922e19 100644
> > > --- a/fs/ubifs/file.c
> > > +++ b/fs/ubifs/file.c
> > > @@ -1397,15 +1397,9 @@ int ubifs_update_time(struct inode *inode, struct timespec64 *time,
> > >  		return err;
> > >  
> > >  	mutex_lock(&ui->ui_mutex);
> > > -	if (flags & S_ATIME)
> > > -		inode->i_atime = *time;
> > > -	if (flags & S_CTIME)
> > > -		inode_set_ctime_to_ts(inode, *time);
> > > -	if (flags & S_MTIME)
> > > -		inode->i_mtime = *time;
> > > -
> > > -	release = ui->dirty;
> > > +	inode_update_timestamps(inode, flags);
> > >  	__mark_inode_dirty(inode, I_DIRTY_SYNC);
> > > +	release = ui->dirty;
> > >  	mutex_unlock(&ui->ui_mutex);
> > 
> > I think this is wrong. You need to keep sampling ui->dirty before calling
> > __mark_inode_dirty(). Otherwise you could release budget for inode update
> > you really need...
> 
> Fixed in-tree.

Thanks. With that feel free to add:

Reviewed-by: Jan Kara <jack@suse.cz>

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

