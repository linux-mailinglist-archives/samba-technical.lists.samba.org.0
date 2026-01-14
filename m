Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E50ACD23335
	for <lists+samba-technical@lfdr.de>; Thu, 15 Jan 2026 09:40:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=p/1eVpMenCIWXkmi+LWs4qBDeJZQRhQ1Mo2xBG1d6m0=; b=vu0dmfp0SHntZQbTWfo39igp95
	eiVwVf1qcQNJFKGYa6QJf9rCCdPUy6fceK+Q01UfU/mTi9coZiFgCKzNU4/uqsXHCTQjwiqLkaXde
	U3WZxDLghsfr27n2g3Yrxc3VId6QhnTHtHYWL8ESJCqFz2YQo3Vhvmwn9WnEBpnscohLv4KJV3MEq
	wteTdSWVJ+pEzbE9oDnhYvME5vV/tPZDEB4+KzrlTayoNzfTfaaZv2m6+GcNONCQDrR+KdeM9zMl8
	WlNTNDK+H/e7gQYmXAfAXVZUUwzHGaXPXwG8PURZwFDwWcAnAUaPZw7t/nLPezGupWySbwej0mg9p
	v/KSij2A==;
Received: from ip6-localhost ([::1]:29290 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vgItQ-000AA6-NA; Thu, 15 Jan 2026 08:39:48 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:3::133]:49866) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vg2Rh-0007TY-5V
 for samba-technical@lists.samba.org; Wed, 14 Jan 2026 15:06:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=p/1eVpMenCIWXkmi+LWs4qBDeJZQRhQ1Mo2xBG1d6m0=; b=2aGkR9+Gq07Pqsr81YJxBM46lt
 pC2tFopI1k2CQN/EQyBvUMbN685on8x5U4CpdjMpkFZFWeBtSU1OM84Ciw+y3szFcelfmqTyyg3Vm
 y2DbB7FtxibRk5XBq6sH9x7jaP/v3yPQ2Ob6mTE3lbJs+jMPsrwoZFGtqfkkexkKI90sVyqCbvrKN
 zpFbi2ZET+fTj2fii5dhkiKqKWNVPeKcG3n8jccbhPTVNNeRCqGKQRlyNUdLbE0ua8zYfilMENTNi
 ksLGJd1DFd0SiHbXxA8bZhed6Je0ZmYu3Fr0+QZKywruGLSgXGNe8uS3svWfCZcAVQ+74djzH6mhe
 QKhXyQqw==;
Received: from hch by bombadil.infradead.org with local (Exim 4.98.2 #2 (Red
 Hat Linux)) id 1vg2Qx-00000009cKq-2YJq;
 Wed, 14 Jan 2026 15:05:19 +0000
Date: Wed, 14 Jan 2026 07:05:19 -0800
To: Amir Goldstein <amir73il@gmail.com>
Subject: Re: [PATCH 00/24] vfs: require filesystems to explicitly opt-in to
 lease support
Message-ID: <aWewryHrESHgXGoL@infradead.org>
References: <cb5d2da6-2090-4639-ad96-138342bba56d@oracle.com>
 <ce700ee20834631eceededc8cd15fc5d00fee28e.camel@kernel.org>
 <20260113-mondlicht-raven-82fc4eb70e9d@brauner>
 <aWZcoyQLvbJKUxDU@infradead.org>
 <ce418800f06aa61a7f47f0d19394988f87a3da07.camel@kernel.org>
 <aWc3mwBNs8LNFN4W@infradead.org>
 <CAOQ4uxhMjitW_DC9WK9eku51gE1Ft+ENhD=qq3uehwrHO=RByA@mail.gmail.com>
 <aWeUv2UUJ_NdgozS@infradead.org>
 <c40862cd65a059ad45fa88f5473722ea5c5f70a5.camel@kernel.org>
 <CAOQ4uxhDwR7dteLaqURX+9CooGM1hA7PL6KnVmSwX11ZdKxZTA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOQ4uxhDwR7dteLaqURX+9CooGM1hA7PL6KnVmSwX11ZdKxZTA@mail.gmail.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Mailman-Approved-At: Thu, 15 Jan 2026 08:39:46 +0000
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
From: Christoph Hellwig via samba-technical <samba-technical@lists.samba.org>
Reply-To: Christoph Hellwig <hch@infradead.org>
Cc: Latchesar Ionkov <lucho@ionkov.net>, Dave Kleikamp <shaggy@kernel.org>,
 Alexander Aring <alex.aring@gmail.com>, Jan Kara <jack@suse.cz>,
 Paulo Alcantara <pc@manguebit.org>, Sandeep Dhavale <dhavale@google.com>,
 Martin Brandenburg <martin@omnibond.com>, Yuezhang Mo <yuezhang.mo@sony.com>,
 Anders Larsen <al@alarsen.net>,
 Christian Schoenebeck <linux_oss@crudebyte.com>,
 jfs-discussion@lists.sourceforge.net, linux-unionfs@vger.kernel.org,
 Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
 Chris Mason <clm@fb.com>, Andreas Dilger <adilger.kernel@dilger.ca>,
 Chunhai Guo <guochunhai@vivo.com>, Ilya Dryomov <idryomov@gmail.com>,
 linux-mtd@lists.infradead.org, Mike Marshall <hubcap@omnibond.com>,
 linux-xfs@vger.kernel.org, Xiubo Li <xiubli@redhat.com>,
 Yue Hu <zbestahu@gmail.com>, Miklos Szeredi <miklos@szeredi.hu>,
 Richard Weinberger <richard@nod.at>, Mark Fasheh <mark@fasheh.com>,
 devel@lists.orangefs.org, Hugh Dickins <hughd@google.com>,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>, ntfs3@lists.linux.dev,
 Joseph Qi <joseph.qi@linux.alibaba.com>, linux-mm@kvack.org,
 Viacheslav Dubeyko <slava@dubeyko.com>, linux-btrfs@vger.kernel.org,
 Gao Xiang <xiang@kernel.org>, linux-ext4@vger.kernel.org,
 Salah Triki <salah.triki@gmail.com>, Carlos Maiolino <cem@kernel.org>,
 Dominique Martinet <asmadeus@codewreck.org>,
 Shyam Prasad N <sprasad@microsoft.com>, samba-technical@lists.samba.org,
 linux-doc@vger.kernel.org, linux-cifs@vger.kernel.org,
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
 Jonathan Corbet <corbet@lwn.net>, Jeff Layton <jlayton@kernel.org>,
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

On Wed, Jan 14, 2026 at 03:14:13PM +0100, Amir Goldstein wrote:
> Very well then.
> How about EXPORT_OP_PERSISTENT_HANDLES?

Sure.

> > The problem there is that we very much do want to keep tmpfs
> > exportable, but it doesn't have stable handles (per-se).
> 
> Thinking out loud -
> It would be misguided to declare tmpfs as
> EXPORT_OP_PERSISTENT_HANDLES
> and regressing exports of tmpfs will surely not go unnoticed.

tmpfs handles are stable.  It's the tmpfs files that don't survive an
unmount or reboot..


