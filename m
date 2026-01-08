Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E5305D0806C
	for <lists+samba-technical@lfdr.de>; Fri, 09 Jan 2026 09:58:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=pbYulziCehk0+dq0CXHXUlJblsepps/x0pBz736+F88=; b=gB0+XfxJIoHapHEE1KXS3dt6vL
	GYx+IY0A1iPpRe1WO3+LECMB3g5u7PF/3IvZ1SvEtTlzGEMVDaoCxP57AAbw5s34NqKR4EpUY0Wuc
	B4uUboOHiodJmfEAGOGx8+2hGbxgqXIwSvSN5wZqfw0TRnm+uge0qVH8xImXpyuSNDApeE5IQ/2+g
	2HWDWkU/gs/hjp0Q/W1hXioGNriICsC7KuyfUb+nK5luCBlDic7CBoREDOUT65ay5SwRKgu0UHL2g
	VLycdWD0ORRRV+VXbcxLV7KB73cG2+8vMdRfnaiB6Oh78Sc3rTnpKMPLGIVkRk0jVgSt1wRR+AGmt
	GFtZY2zA==;
Received: from ip6-localhost ([::1]:28500 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ve8Hv-001ieI-VG; Fri, 09 Jan 2026 08:56:11 +0000
Received: from smtp-out2.suse.de ([2a07:de40:b251:101:10:150:64:2]:42246) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vdtzX-001fku-21
 for samba-technical@lists.samba.org; Thu, 08 Jan 2026 17:40:15 +0000
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 60DD85CBEA;
 Thu,  8 Jan 2026 17:40:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1767894008; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pbYulziCehk0+dq0CXHXUlJblsepps/x0pBz736+F88=;
 b=v6o0xZIIolBq3Kc+VF6+9Ya5E6t2G34FsAJ4qlruIPlrp3yRFZ1mosmLKssOtf8GopFPv6
 pdM5KNdg6uqkpzJC2OCiQs93p2MdVtM1C1AsH2TngC8tV9OjZ7anbkGl2iE3fhCSU9mvhX
 K1VxnfPudBQRQJ1Q1ovU0oM49Yj5Rmo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1767894008;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pbYulziCehk0+dq0CXHXUlJblsepps/x0pBz736+F88=;
 b=iQxzzizVuPHl0WVwxtpKrivs8r+dbY1HBg67emHdQ+8PTu3CciNeemY/i1L/NaN8QOR0LX
 w4waIzEE2aIOLGCA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1767894008; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pbYulziCehk0+dq0CXHXUlJblsepps/x0pBz736+F88=;
 b=v6o0xZIIolBq3Kc+VF6+9Ya5E6t2G34FsAJ4qlruIPlrp3yRFZ1mosmLKssOtf8GopFPv6
 pdM5KNdg6uqkpzJC2OCiQs93p2MdVtM1C1AsH2TngC8tV9OjZ7anbkGl2iE3fhCSU9mvhX
 K1VxnfPudBQRQJ1Q1ovU0oM49Yj5Rmo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1767894008;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pbYulziCehk0+dq0CXHXUlJblsepps/x0pBz736+F88=;
 b=iQxzzizVuPHl0WVwxtpKrivs8r+dbY1HBg67emHdQ+8PTu3CciNeemY/i1L/NaN8QOR0LX
 w4waIzEE2aIOLGCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4927E3EA63;
 Thu,  8 Jan 2026 17:40:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id MFPYEfjrX2kUBAAAD6G6ig
 (envelope-from <jack@suse.cz>); Thu, 08 Jan 2026 17:40:08 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
 id 0782CA0B23; Thu,  8 Jan 2026 18:40:08 +0100 (CET)
Date: Thu, 8 Jan 2026 18:40:07 +0100
To: Jeff Layton <jlayton@kernel.org>
Subject: Re: [PATCH 00/24] vfs: require filesystems to explicitly opt-in to
 lease support
Message-ID: <m3mywef74xhcakianlrovrnaadnhzhfqjfusulkcnyioforfml@j2xnk7dzkmv4>
References: <20260108-setlease-6-20-v1-0-ea4dec9b67fa@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260108-setlease-6-20-v1-0-ea4dec9b67fa@kernel.org>
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
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,imap1.dmz-prg2.suse.org:helo]
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

On Thu 08-01-26 12:12:55, Jeff Layton wrote:
> Yesterday, I sent patches to fix how directory delegation support is
> handled on filesystems where the should be disabled [1]. That set is
> appropriate for v6.19. For v7.0, I want to make lease support be more
> opt-in, rather than opt-out:
> 
> For historical reasons, when ->setlease() file_operation is set to NULL,
> the default is to use the kernel-internal lease implementation. This
> means that if you want to disable them, you need to explicitly set the
> ->setlease() file_operation to simple_nosetlease() or the equivalent.
> 
> This has caused a number of problems over the years as some filesystems
> have inadvertantly allowed leases to be acquired simply by having left
> it set to NULL. It would be better if filesystems had to opt-in to lease
> support, particularly with the advent of directory delegations.
> 
> This series has sets the ->setlease() operation in a pile of existing
> local filesystems to generic_setlease() and then changes
> kernel_setlease() to return -EINVAL when the setlease() operation is not
> set.
> 
> With this change, new filesystems will need to explicitly set the
> ->setlease() operations in order to provide lease and delegation
> support.
> 
> I mainly focused on filesystems that are NFS exportable, since NFS and
> SMB are the main users of file leases, and they tend to end up exporting
> the same filesystem types. Let me know if I've missed any.

So, what about kernfs and fuse? They seem to be exportable and don't have
.setlease set...

								Honza

> 
> [1]: https://lore.kernel.org/linux-fsdevel/20260107-setlease-6-19-v1-0-85f034abcc57@kernel.org/
> 
> Signed-off-by: Jeff Layton <jlayton@kernel.org>
> ---
> Jeff Layton (24):
>       fs: add setlease to generic_ro_fops and read-only filesystem directory operations
>       affs: add setlease file operation
>       btrfs: add setlease file operation
>       erofs: add setlease file operation
>       ext2: add setlease file operation
>       ext4: add setlease file operation
>       exfat: add setlease file operation
>       f2fs: add setlease file operation
>       fat: add setlease file operation
>       gfs2: add a setlease file operation
>       jffs2: add setlease file operation
>       jfs: add setlease file operation
>       nilfs2: add setlease file operation
>       ntfs3: add setlease file operation
>       ocfs2: add setlease file operation
>       orangefs: add setlease file operation
>       overlayfs: add setlease file operation
>       squashfs: add setlease file operation
>       tmpfs: add setlease file operation
>       udf: add setlease file operation
>       ufs: add setlease file operation
>       xfs: add setlease file operation
>       filelock: default to returning -EINVAL when ->setlease operation is NULL
>       fs: remove simple_nosetlease()
> 
>  Documentation/filesystems/porting.rst |  9 +++++++++
>  Documentation/filesystems/vfs.rst     |  9 ++++++---
>  fs/9p/vfs_dir.c                       |  2 --
>  fs/9p/vfs_file.c                      |  2 --
>  fs/affs/dir.c                         |  2 ++
>  fs/affs/file.c                        |  2 ++
>  fs/befs/linuxvfs.c                    |  2 ++
>  fs/btrfs/file.c                       |  2 ++
>  fs/btrfs/inode.c                      |  2 ++
>  fs/ceph/dir.c                         |  2 --
>  fs/ceph/file.c                        |  1 -
>  fs/cramfs/inode.c                     |  2 ++
>  fs/efs/dir.c                          |  2 ++
>  fs/erofs/data.c                       |  2 ++
>  fs/erofs/dir.c                        |  2 ++
>  fs/exfat/dir.c                        |  2 ++
>  fs/exfat/file.c                       |  2 ++
>  fs/ext2/dir.c                         |  2 ++
>  fs/ext2/file.c                        |  2 ++
>  fs/ext4/dir.c                         |  2 ++
>  fs/ext4/file.c                        |  2 ++
>  fs/f2fs/dir.c                         |  2 ++
>  fs/f2fs/file.c                        |  2 ++
>  fs/fat/dir.c                          |  2 ++
>  fs/fat/file.c                         |  2 ++
>  fs/freevxfs/vxfs_lookup.c             |  2 ++
>  fs/fuse/dir.c                         |  1 -
>  fs/gfs2/file.c                        |  3 +--
>  fs/isofs/dir.c                        |  2 ++
>  fs/jffs2/dir.c                        |  2 ++
>  fs/jffs2/file.c                       |  2 ++
>  fs/jfs/file.c                         |  2 ++
>  fs/jfs/namei.c                        |  2 ++
>  fs/libfs.c                            | 20 ++------------------
>  fs/locks.c                            |  3 +--
>  fs/nfs/dir.c                          |  1 -
>  fs/nfs/file.c                         |  1 -
>  fs/nilfs2/dir.c                       |  3 ++-
>  fs/nilfs2/file.c                      |  2 ++
>  fs/ntfs3/dir.c                        |  3 +++
>  fs/ntfs3/file.c                       |  3 +++
>  fs/ocfs2/file.c                       |  5 +++++
>  fs/orangefs/dir.c                     |  4 +++-
>  fs/orangefs/file.c                    |  1 +
>  fs/overlayfs/file.c                   |  2 ++
>  fs/overlayfs/readdir.c                |  2 ++
>  fs/qnx4/dir.c                         |  2 ++
>  fs/qnx6/dir.c                         |  2 ++
>  fs/read_write.c                       |  2 ++
>  fs/smb/client/cifsfs.c                |  1 -
>  fs/squashfs/dir.c                     |  2 ++
>  fs/squashfs/file.c                    |  4 +++-
>  fs/udf/dir.c                          |  2 ++
>  fs/udf/file.c                         |  2 ++
>  fs/ufs/dir.c                          |  2 ++
>  fs/ufs/file.c                         |  2 ++
>  fs/vboxsf/dir.c                       |  1 -
>  fs/vboxsf/file.c                      |  1 -
>  fs/xfs/xfs_file.c                     |  3 +++
>  include/linux/fs.h                    |  1 -
>  mm/shmem.c                            |  2 ++
>  61 files changed, 116 insertions(+), 42 deletions(-)
> ---
> base-commit: 731ce71a6c8adb8b8f873643beacaeedc1564500
> change-id: 20260107-setlease-6-20-299eb5695c5a
> 
> Best regards,
> -- 
> Jeff Layton <jlayton@kernel.org>
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

