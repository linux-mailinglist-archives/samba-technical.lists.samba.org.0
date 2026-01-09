Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id F0582D0F93B
	for <lists+samba-technical@lfdr.de>; Sun, 11 Jan 2026 19:32:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=TVlnT2WiXW5nYG95M0tj3/pwuA98uZmz0fLtRU3VLPA=; b=TjKUeDn2el3DR0gmRZfmpynpdL
	jozvZx/66VvGxg6AGIltJXf7tOpidPsVikU3KSLe8lY7bw1tpKAQkUXi+XnadyN6BYg9JS783qUkn
	8f+cIlMWkw1gEa08qNKgq9l93o3oDClDS7lxByfVbjJU+2lC01XZWAW2CqPPtaMNR69ISaDAYa4La
	pBVPWBu7VCqQfRC82T3SN6Th5X7Mt8i07dBxUXrOZ6+JW9Qxkg+l/ut7I2aQPnx+r9JtMKDygDk/T
	MvxWUbhUT5SXVeEDRzUyx2jYXeP1l0l3GnGJX39M+4f8JL851am71VmOWD6egk5ZkMW68rJCr6BeW
	DZ1/M3Rg==;
Received: from ip6-localhost ([::1]:57378 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vf0EH-001v2O-JZ; Sun, 11 Jan 2026 18:31:57 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:3::133]:43348) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1ve6nE-001iR4-4d
 for samba-technical@lists.samba.org; Fri, 09 Jan 2026 07:20:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=TVlnT2WiXW5nYG95M0tj3/pwuA98uZmz0fLtRU3VLPA=; b=nNw+ohOkHNWpQswvh+NdF9LHsu
 PJ6XIUFJtAy/341ZJ9J92w/DrPqKhkxz3zTjI/OkCD5uCId/D9WwQgvpVYCFTlMBlisRY+uVtvIRe
 REPMinKM/zRtj+mAGb6mG8h33I8v4EUxHd7wpMoL0MVUe5QELfPQU02i+BkEkkPD+IWuWUtmR9vj7
 5PESqXWBa9hJrSIyYBcnAULtN9bqZwa9ct6avHgzAt8PQ8DJwQPVi9fHlBg9V+TF/Bau3F5xfjNlp
 4gxLTxemKZWrMAqjEIaxZ8E5uEYuSvRgEMvz0VvHRFcwTeD7kP/g3KTcD027gjhOnTRYhsN0CtrV+
 PA5MAVYw==;
Received: from hch by bombadil.infradead.org with local (Exim 4.98.2 #2 (Red
 Hat Linux)) id 1ve5Y8-00000001VCt-1XPG;
 Fri, 09 Jan 2026 06:00:40 +0000
Date: Thu, 8 Jan 2026 22:00:40 -0800
To: Jeff Layton <jlayton@kernel.org>
Subject: Re: [PATCH 00/24] vfs: require filesystems to explicitly opt-in to
 lease support
Message-ID: <aWCZiFOmnY3D4oUl@infradead.org>
References: <20260108-setlease-6-20-v1-0-ea4dec9b67fa@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260108-setlease-6-20-v1-0-ea4dec9b67fa@kernel.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
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
From: Christoph Hellwig via samba-technical <samba-technical@lists.samba.org>
Reply-To: Christoph Hellwig <hch@infradead.org>
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

On Thu, Jan 08, 2026 at 12:12:55PM -0500, Jeff Layton wrote:
> I mainly focused on filesystems that are NFS exportable, since NFS and
> SMB are the main users of file leases, and they tend to end up exporting
> the same filesystem types. Let me know if I've missed any.
> 
> [1]: https://lore.kernel.org/linux-fsdevel/20260107-setlease-6-19-v1-0-85f034abcc57@kernel.org/

That seems reasonable, and I like the approach here (without having the
time to review every change right now):

Acked-by: Christoph Hellwig <hch@lst.de>

If it turns out we have people use leases on other file systems we'll
have to wire up a few more instance as needed, but I think your initial
set makes sense.


