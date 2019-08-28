Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D091A13F8
	for <lists+samba-technical@lfdr.de>; Thu, 29 Aug 2019 10:41:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=yJoo2pNqTHPzZm0pkWr+dI3Wt26Ba0eR+Mp1ZOx/yp8=; b=b5a5/AIRpbaNhY3fFZR+wSWP8P
	kTFuWkgmUCljI3U2a/ZQP43xpIOrhNBdFo7M35L+74c14wzjQ6Revc7p48Z2TzsSXyJvhbfuY4nR2
	TNiCEm2YioYSsrN5fJmtEcelbXdECGj/NxaP7b1yUeAb4iF9/Cg1pUKYfj7PiJdj3a9BcTPGG7tm+
	BECgzay8pegZtG0wjUfSbjB2JQc/e+EZqSNbArgHz3vG0R/GgvnBjMkM9/FFKztWvO0YhmafQOVlD
	bDquxjFAtvtVFPGfVwkedLuXeG/nVnKJwfcXJGkZv0FBqXgeNHY/xjzPUTRn6TZqBLlKfr1M1QSVY
	uMLQ3FfQ==;
Received: from localhost ([::1]:55192 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1i3FzT-000DrQ-4E; Thu, 29 Aug 2019 08:41:11 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133]:49828) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1i2zQV-0094MG-6g
 for samba-technical@lists.samba.org; Wed, 28 Aug 2019 15:00:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Transfer-Encoding
 :Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
 Sender:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=yJoo2pNqTHPzZm0pkWr+dI3Wt26Ba0eR+Mp1ZOx/yp8=; b=BK/KEpQDOLfLlooeYZXzciO0Ih
 KZ5wNCw5kNMwDJSk0pj1muklV9g/jk0KlTf/SwvC51pBQxSElrumaGBLZuHpQsR7SwxCq34Mot1XJ
 7gmWkyODNqXa17KKkWyyY+vNZDlZzp8AS0rGYTV0F62iEnMONHSEdfZ7H9Etcl0AcgK8bEkyOlbQS
 r0PBEi4ow8fP9ty81WDX7XQCZeJCQtgYLUTRfxVjcLjt8/fVN9n9I3tHAfoOBaAIjsYikU11xALWa
 mL+x3tHE/3UAq8EByi15+eJvdwQ/XwnR0l5pqHnWOA++zmSEHyLZkNeHHwA8OtgBc5w/ZqUGkIWTV
 GmBXUYFw==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92 #3 (Red Hat
 Linux)) id 1i2ys3-0005kr-PD; Wed, 28 Aug 2019 14:24:23 +0000
Date: Wed, 28 Aug 2019 07:24:23 -0700
To: Mark Salyzyn <salyzyn@android.com>
Subject: Re: [PATCH v8] Add flags option to get xattr method paired to
 __vfs_getxattr
Message-ID: <20190828142423.GA1955@infradead.org>
References: <20190827150544.151031-1-salyzyn@android.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190827150544.151031-1-salyzyn@android.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Mailman-Approved-At: Thu, 29 Aug 2019 08:41:09 +0000
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
Cc: Latchesar Ionkov <lucho@ionkov.net>, Hugh Dickins <hughd@google.com>,
 Mike Marshall <hubcap@omnibond.com>, James Morris <jmorris@namei.org>,
 devel@lists.orangefs.org, Eric Van Hensbergen <ericvh@gmail.com>,
 Joel Becker <jlbec@evilplan.org>, Anna Schumaker <anna.schumaker@netapp.com>,
 Trond Myklebust <trond.myklebust@hammerspace.com>,
 Mathieu Malaterre <malat@debian.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Jan Kara <jack@suse.com>, Casey Schaufler <casey@schaufler-ca.com>,
 Andrew Morton <akpm@linux-foundation.org>, Dave Kleikamp <shaggy@kernel.org>,
 linux-doc@vger.kernel.org, Jeff Layton <jlayton@kernel.org>,
 Chao Yu <yuchao0@huawei.com>, Mimi Zohar <zohar@linux.ibm.com>,
 linux-cifs@vger.kernel.org, Paul Moore <paul@paul-moore.com>,
 "Darrick J. Wong" <darrick.wong@oracle.com>,
 Eric Sandeen <sandeen@sandeen.net>, kernel-team@android.com,
 selinux@vger.kernel.org, Brian Foster <bfoster@redhat.com>,
 reiserfs-devel@vger.kernel.org, Tejun Heo <tj@kernel.org>,
 Jaegeuk Kim <jaegeuk@kernel.org>, Theodore Ts'o <tytso@mit.edu>,
 Miklos Szeredi <miklos@szeredi.hu>, linux-f2fs-devel@lists.sourceforge.net,
 Benjamin Coddington <bcodding@redhat.com>, linux-integrity@vger.kernel.org,
 Martin Brandenburg <martin@omnibond.com>, Chris Mason <clm@fb.com>,
 linux-mtd@lists.infradead.org, linux-afs@lists.infradead.org,
 Jonathan Corbet <corbet@lwn.net>, Vyacheslav Dubeyko <slava@dubeyko.com>,
 Allison Henderson <allison.henderson@oracle.com>,
 Ilya Dryomov <idryomov@gmail.com>, linux-ext4@vger.kernel.org,
 Stephen Smalley <sds@tycho.nsa.gov>, Serge Hallyn <serge@hallyn.com>,
 Gao Xiang <gaoxiang25@huawei.com>, Eric Paris <eparis@parisplace.org>,
 ceph-devel@vger.kernel.org, linux-nfs@vger.kernel.org, linux-mm@kvack.org,
 samba-technical@lists.samba.org, linux-xfs@vger.kernel.org,
 Bob Peterson <rpeterso@redhat.com>, linux-fsdevel@vger.kernel.org,
 linux-erofs@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>,
 ocfs2-devel@oss.oracle.com, jfs-discussion@lists.sourceforge.net,
 Jan Kara <jack@suse.cz>, Eric Biggers <ebiggers@google.com>,
 Dominique Martinet <asmadeus@codewreck.org>,
 Adrian Hunter <adrian.hunter@intel.com>, David Howells <dhowells@redhat.com>,
 Joseph Qi <joseph.qi@linux.alibaba.com>,
 Andreas Dilger <adilger.kernel@dilger.ca>, devel@driverdev.osuosl.org,
 "J. Bruce Fields" <bfields@redhat.com>,
 Andreas Gruenbacher <agruenba@redhat.com>, Sage Weil <sage@redhat.com>,
 Richard Weinberger <richard@nod.at>, Mark Fasheh <mark@fasheh.com>,
 cluster-devel@redhat.com, Steve French <sfrench@samba.org>,
 v9fs-developer@lists.sourceforge.net, Bharath Vedartham <linux.bhar@gmail.com>,
 Jann Horn <jannh@google.com>, ecryptfs@vger.kernel.org,
 Josef Bacik <josef@toxicpanda.com>, Dave Chinner <dchinner@redhat.com>,
 David Sterba <dsterba@suse.com>, Artem Bityutskiy <dedekind1@gmail.com>,
 netdev@vger.kernel.org, linux-unionfs@vger.kernel.org, stable@vger.kernel.org,
 Tyler Hicks <tyhicks@canonical.com>, linux-security-module@vger.kernel.org,
 Phillip Lougher <phillip@squashfs.org.uk>,
 David Woodhouse <dwmw2@infradead.org>, linux-btrfs@vger.kernel.org,
 Alexander Viro <viro@zeniv.linux.org.uk>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tue, Aug 27, 2019 at 08:05:15AM -0700, Mark Salyzyn wrote:
> Replace arguments for get and set xattr methods, and __vfs_getxattr
> and __vfs_setaxtr functions with a reference to the following now
> common argument structure:

Yikes.  That looks like a mess.  Why can't we pass a kernel-only
flag in the existing flags field for ₋>set and add a flags field
to ->get?  Passing methods by structure always tends to be a mess.

