Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E7B5CD23337
	for <lists+samba-technical@lfdr.de>; Thu, 15 Jan 2026 09:40:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=/I/lmC8LP3DXdryYas7yQPVnLzGMCsU6bnNnqo9iZUY=; b=0z/4vbO0KAfk5zxzl8lh2LH9Uh
	LfXiCiU0HwPLgymfF5WaKDJoLi1zD5aFFZH5287f1F0TW5f2qKA9LBUtM2ZjjRCHLXS1qQRNzDla2
	H82ANE9/+DD/DP5/46bA9aCalyIy+TsixzsElgtZuEtAl3h0ckCDi9b4qGO/azXC6xsSlVnFZpw6P
	c++TzT7xU2GO/Fmd7SVNpUtq7dR5bCdert8VxmMLApGXnNBrs66ysC0XZM319i6F6D9oLS4RARF3V
	IQvEN/kCpHCzuOxNvbGACxtCvJ0V2Pp43reox2Cv1n3ZJWh93Io8w9c/rsyjrTJbhI+sOuMM5/qXc
	ZKjKpwnQ==;
Received: from ip6-localhost ([::1]:55502 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vgItZ-000ACC-2S; Thu, 15 Jan 2026 08:39:57 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:3::133]:36104) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vgHec-000A1b-9D
 for samba-technical@lists.samba.org; Thu, 15 Jan 2026 07:20:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=/I/lmC8LP3DXdryYas7yQPVnLzGMCsU6bnNnqo9iZUY=; b=VGObqK5voCZEvaOS2sd8k58SOl
 1MKXHul0UIxtbNustQjF3TiNBO5A5DEV+7luUQDjVEmdj1o6ZXj7/RHbsW5uQ8FHghSmNa8RGSf/Z
 lqXP7DBojYS/m9d+kpswr79pVrMANdI/lJ+/vLktuyA9+4LwMwmW4ZudctP5Nn8fgcUOpIxP4H3bZ
 wZU+Uv2sOpV/KHIJNeQwI3FUfk0W1FapF8T8lBqL+KFM3MrFgZ4F2CMZTLhz100xPKnoPJhHW7ms9
 sJwJmQ51fc9hgVLMQHKjPH4dx2dyuUWDE38tPmbeAdELv7G3/fIrEXIlcOTJgefaGpHmCuyNcNjpw
 8JLGu1tA==;
Received: from hch by bombadil.infradead.org with local (Exim 4.98.2 #2 (Red
 Hat Linux)) id 1vgH4C-0000000Brtc-23Ey;
 Thu, 15 Jan 2026 06:42:48 +0000
Date: Wed, 14 Jan 2026 22:42:48 -0800
To: Christian Brauner <brauner@kernel.org>
Subject: Re: [PATCH 00/24] vfs: require filesystems to explicitly opt-in to
 lease support
Message-ID: <aWiMaMwI6nYGX9Bq@infradead.org>
References: <ec78bf021fa1f6243798945943541ba171e337e7.camel@kernel.org>
 <cb5d2da6-2090-4639-ad96-138342bba56d@oracle.com>
 <ce700ee20834631eceededc8cd15fc5d00fee28e.camel@kernel.org>
 <20260113-mondlicht-raven-82fc4eb70e9d@brauner>
 <aWZcoyQLvbJKUxDU@infradead.org>
 <ce418800f06aa61a7f47f0d19394988f87a3da07.camel@kernel.org>
 <aWc3mwBNs8LNFN4W@infradead.org>
 <CAOQ4uxhMjitW_DC9WK9eku51gE1Ft+ENhD=qq3uehwrHO=RByA@mail.gmail.com>
 <aWeUv2UUJ_NdgozS@infradead.org>
 <20260114-klarstellen-blamieren-0b7d40182800@brauner>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260114-klarstellen-blamieren-0b7d40182800@brauner>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Mailman-Approved-At: Thu, 15 Jan 2026 08:39:54 +0000
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
 Christian Schoenebeck <linux_oss@crudebyte.com>, linux-doc@vger.kernel.org,
 linux-cifs@vger.kernel.org, Chao Yu <chao@kernel.org>,
 Tom Talpey <tom@talpey.com>, ocfs2-devel@lists.linux.dev,
 Bharath SM <bharathsm@microsoft.com>, linux-nilfs@vger.kernel.org,
 David Sterba <dsterba@suse.com>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Jeffle Xu <jefflexu@linux.alibaba.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 ceph-devel@vger.kernel.org, Eric Van Hensbergen <ericvh@kernel.org>,
 Ryusuke Konishi <konishi.ryusuke@gmail.com>,
 OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>,
 Andreas Gruenbacher <agruenba@redhat.com>, Hans de Goede <hansg@kernel.org>,
 gfs2@lists.linux.dev, linux-nfs@vger.kernel.org,
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

On Wed, Jan 14, 2026 at 04:20:13PM +0100, Christian Brauner wrote:
> > You're still think of it the wrong way.  If we do have file systems
> > that break the original exportfs semantics we need to fix that, and
> > something like a "stable handles" flag will work well for that.  But
> > a totally arbitrary "is exportable" flag is total nonsense.
> 
> File handles can legitimately be conceptualized independently of
> exporting a filesystem. If we wanted to tear those concepts apart
> implementation wise we could.
> 
> It is complete nonsense to expect the kernel to support exporting any
> arbitrary internal filesystem or to not support file handles at all.

You are going even further down the path of entirely missing the point
(or the two points by now).

If a file systems meets all technical requirements of being nfsd
exportable and the users asks for it, it is not our job to make an
arbitrary policy decision to say no.

If it does not meet the technical requirements it obviously should
not be exportable.  And it seems like the spread of file handles
beyond nfs exporting created some ambiguity here, which we need to
fix.


