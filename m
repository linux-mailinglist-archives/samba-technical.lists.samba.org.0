Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 57D5ED23336
	for <lists+samba-technical@lfdr.de>; Thu, 15 Jan 2026 09:40:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=frpDmmp1i4r1AZelS3CVor2fKx/lP0Tq5j8/mhEG/8s=; b=HraO4PFqV9OyznmUlgqdw9K69P
	OiAxtOtxV5ibdbGwcEp595mOPh03pvXcadnMHQO/Jtukc2NBDmGFdhTIlBzbteb8xdweByc33KH2l
	MBFS66AMac9JzCt6pi40B8nbIRzoxFnLQKwkqlusjooDyurCzLjoJORaR2w+tW9dLtFWDrFjKCLIK
	tO1VchHXACQwnKkJHkLBBNgiij9dLA4CttyFIENztuxXzfe3iWGR1OH2972IHGjqTfngc7t/vYBMg
	8hStIlZV4/kh32tKJPHM5SU3zhHFmipFmtq3m5LSQopJPUXSppaC03jPKV4moTbHYPpyRG8il72lG
	fPqxipbw==;
Received: from ip6-localhost ([::1]:29274 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vgItJ-000A9d-Si; Thu, 15 Jan 2026 08:39:41 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:3::133]:34714) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vg0aa-0006jF-OE
 for samba-technical@lists.samba.org; Wed, 14 Jan 2026 13:07:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Transfer-Encoding
 :Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=frpDmmp1i4r1AZelS3CVor2fKx/lP0Tq5j8/mhEG/8s=; b=CsUTToetKF+Id6BSRt8PfLBnAS
 Y0ul3yOPNvK2EqLosGUY3uqxb0rBGjpkb3pFkF+nzL0tn0KOBAl2xhlehcW9SbJloDYCaYos/fI+R
 /3mikrJStWJrWeOJzR2PeycF0eBRtBI6m7fleAVeDpZJmAWb5/mhUGXdyVHOSGGKP+FgMpRotCkGe
 U4rxrSW9vdcoJ/4xvbYl6nQLLy/pVnBBXwulC6bpAsoSvSw4Aw1pxxyPY2C1RxEdi/vm7DGCPqLOa
 XPJH2SpQwhbv/9XjUm+ADr7Kr9Po4kKl3x0XMHBhpwdVI/FJYFR2ISU4AMVB1IFKkKKX1rv/bPqoF
 Uf0wlX6w==;
Received: from hch by bombadil.infradead.org with local (Exim 4.98.2 #2 (Red
 Hat Linux)) id 1vg0Zb-00000009Gnt-0ut4;
 Wed, 14 Jan 2026 13:06:07 +0000
Date: Wed, 14 Jan 2026 05:06:07 -0800
To: Amir Goldstein <amir73il@gmail.com>
Subject: Re: [PATCH 00/24] vfs: require filesystems to explicitly opt-in to
 lease support
Message-ID: <aWeUv2UUJ_NdgozS@infradead.org>
References: <8af369636c32b868f83669c49aea708ca3b894ac.camel@kernel.org>
 <CAOQ4uxgD+Sgbbg9K2U0SF9TyUOBb==Z6auShUWc4FfPaDCQ=rg@mail.gmail.com>
 <ec78bf021fa1f6243798945943541ba171e337e7.camel@kernel.org>
 <cb5d2da6-2090-4639-ad96-138342bba56d@oracle.com>
 <ce700ee20834631eceededc8cd15fc5d00fee28e.camel@kernel.org>
 <20260113-mondlicht-raven-82fc4eb70e9d@brauner>
 <aWZcoyQLvbJKUxDU@infradead.org>
 <ce418800f06aa61a7f47f0d19394988f87a3da07.camel@kernel.org>
 <aWc3mwBNs8LNFN4W@infradead.org>
 <CAOQ4uxhMjitW_DC9WK9eku51gE1Ft+ENhD=qq3uehwrHO=RByA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAOQ4uxhMjitW_DC9WK9eku51gE1Ft+ENhD=qq3uehwrHO=RByA@mail.gmail.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Mailman-Approved-At: Thu, 15 Jan 2026 08:39:39 +0000
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

On Wed, Jan 14, 2026 at 10:34:04AM +0100, Amir Goldstein wrote:
> On Wed, Jan 14, 2026 at 7:28 AM Christoph Hellwig <hch@infradead.org> wrote:
> >
> > On Tue, Jan 13, 2026 at 12:06:42PM -0500, Jeff Layton wrote:
> > > Fair point, but it's not that hard to conceive of a situation where
> > > someone inadvertantly exports cgroupfs or some similar filesystem:
> >
> > Sure.  But how is this worse than accidentally exporting private data
> > or any other misconfiguration?
> >
> 
> My POV is that it is less about security (as your question implies), and
> more about correctness.

I was just replying to Jeff.

> The special thing about NFS export, as opposed to, say, ksmbd, is
> open by file handle, IOW, the export_operations.
> 
> I perceive this as a very strange and undesired situation when NFS
> file handles do not behave as persistent file handles.

That is not just very strange, but actually broken (discounting the
obscure volatile file handles features not implemented in Linux NFS
and NFSD).  And the export ops always worked under the assumption
that these file handles are indeed persistent.  If they're not we
do have a problem.

> 
> cgroupfs, pidfs, nsfs, all gained open_by_handle_at() capability for
> a known reason, which was NOT NFS export.
> 
> If the author of open_by_handle_at() support (i.e. brauner) does not
> wish to imply that those fs should be exported to NFS, why object?

Because "want to export" is a stupid category.

OTOH "NFS exporting doesn't actually properly work because someone
overloaded export_ops with different semantics" is a valid category.

> We could have the opt-in/out of NFS export fixes per EXPORT_OP_
> flags and we could even think of allowing admin to make this decision
> per vfsmount (e.g. for cgroupfs).
> 
> In any case, I fail to see how objecting to the possibility of NFS export
> opt-out serves anyone.

You're still think of it the wrong way.  If we do have file systems
that break the original exportfs semantics we need to fix that, and
something like a "stable handles" flag will work well for that.  But
a totally arbitrary "is exportable" flag is total nonsense.


