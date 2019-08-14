Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E45DE8E606
	for <lists+samba-technical@lfdr.de>; Thu, 15 Aug 2019 10:17:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=XiZvbx1Cp6Oqyc0YHfIAj22w+8Ky/OkrizB9nmmqcbc=; b=3WAutMqXs1I1WlNignlNfl7XWT
	4setC7vhho7wP5QsGWNqj40YJdXgR63y9QS6i4B09fwOUPvduIZgol6jWlloxnsf6q8eEaTFv89G4
	kxiwmRLWhT3xjnhAKCyO5tOXi/xF0QiT9DdAqLHZDvFxJ7jyHAlhzLHQvWA5ngjCS5OIjMm70tJYv
	rk0pMxB6d3AQkJHfYAbsTXlplJB5jInYAM60Akb6Zf0K86brquaR3ES8kwuDcL8bfVPYe+LBcSz2E
	SJ8nFxmk6Jak2clRPG2tGt+vBioN629MCkrVoT5r8HpIq2HZRg9nr5fJuZnfqT/eBqrGX+/y2pntm
	f/oPqK/Q==;
Received: from localhost ([::1]:64168 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hyAvV-006Jr5-CU; Thu, 15 Aug 2019 08:16:05 +0000
Received: from mx2.suse.de ([195.135.220.15]:38580 helo=mx1.suse.de) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hxrE1-006GbA-Pn
 for samba-technical@lists.samba.org; Wed, 14 Aug 2019 11:13:56 +0000
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 3537FADEF;
 Wed, 14 Aug 2019 11:00:26 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
 id 81D741E4200; Wed, 14 Aug 2019 13:00:22 +0200 (CEST)
Date: Wed, 14 Aug 2019 13:00:22 +0200
To: Mark Salyzyn <salyzyn@android.com>
Subject: Re: [PATCH v2] Add flags option to get xattr method paired to
 __vfs_getxattr
Message-ID: <20190814110022.GB26273@quack2.suse.cz>
References: <20190813145527.26289-1-salyzyn@android.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190813145527.26289-1-salyzyn@android.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Warn: EHLO/HELO not verified: Remote host 195.135.220.15 (mx2.suse.de)
 incorrectly presented itself as mx1.suse.de
X-Mailman-Approved-At: Thu, 15 Aug 2019 08:16:02 +0000
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
 jfs-discussion@lists.sourceforge.net,
 Phillip Lougher <phillip@squashfs.org.uk>, linux-integrity@vger.kernel.org,
 Martin Brandenburg <martin@omnibond.com>, samba-technical@lists.samba.org,
 Dominique Martinet <asmadeus@codewreck.org>, Chao Yu <yuchao0@huawei.com>,
 Mimi Zohar <zohar@linux.ibm.com>, Adrian Hunter <adrian.hunter@intel.com>,
 linux-mm@kvack.org, Chris Mason <clm@fb.com>, netdev@vger.kernel.org,
 Andreas Dilger <adilger.kernel@dilger.ca>, linux-xfs@vger.kernel.org,
 Eric Paris <eparis@parisplace.org>, linux-f2fs-devel@lists.sourceforge.net,
 linux-afs@lists.infradead.org, Stephen Smalley <sds@tycho.nsa.gov>,
 Mike Marshall <hubcap@omnibond.com>, devel@driverdev.osuosl.org,
 linux-cifs@vger.kernel.org, Paul Moore <paul@paul-moore.com>,
 Sage Weil <sage@redhat.com>, "Darrick J. Wong" <darrick.wong@oracle.com>,
 Richard Weinberger <richard@nod.at>, Mark Fasheh <mark@fasheh.com>,
 linux-unionfs@vger.kernel.org, Hugh Dickins <hughd@google.com>,
 James Morris <jmorris@namei.org>, cluster-devel@redhat.com,
 Joseph Qi <joseph.qi@linux.alibaba.com>,
 Vyacheslav Dubeyko <slava@dubeyko.com>,
 Casey Schaufler <casey@schaufler-ca.com>, v9fs-developer@lists.sourceforge.net,
 Ilya Dryomov <idryomov@gmail.com>, linux-ext4@vger.kernel.org,
 kernel-team@android.com, devel@lists.orangefs.org,
 Serge Hallyn <serge@hallyn.com>, Gao Xiang <gaoxiang25@huawei.com>,
 Eric Van Hensbergen <ericvh@gmail.com>, ecryptfs@vger.kernel.org,
 linux-erofs@lists.ozlabs.org, Josef Bacik <josef@toxicpanda.com>,
 reiserfs-devel@vger.kernel.org, Bob Peterson <rpeterso@redhat.com>,
 Joel Becker <jlbec@evilplan.org>, Anna Schumaker <anna.schumaker@netapp.com>,
 David Sterba <dsterba@suse.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 ceph-devel@vger.kernel.org, selinux@vger.kernel.org,
 Trond Myklebust <trond.myklebust@hammerspace.com>,
 Andreas Gruenbacher <agruenba@redhat.com>, David Howells <dhowells@redhat.com>,
 linux-nfs@vger.kernel.org, Theodore Ts'o <tytso@mit.edu>,
 linux-fsdevel@vger.kernel.org, Artem Bityutskiy <dedekind1@gmail.com>,
 Mathieu Malaterre <malat@debian.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Miklos Szeredi <miklos@szeredi.hu>, Jeff Layton <jlayton@kernel.org>,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Tyler Hicks <tyhicks@canonical.com>, Steve French <sfrench@samba.org>,
 Ernesto =?iso-8859-1?Q?A=2E_Fern=E1ndez?= <ernesto.mnd.fernandez@gmail.com>,
 linux-btrfs@vger.kernel.org, linux-security-module@vger.kernel.org,
 Jan Kara <jack@suse.com>, Tejun Heo <tj@kernel.org>,
 linux-mtd@lists.infradead.org, Andrew Morton <akpm@linux-foundation.org>,
 David Woodhouse <dwmw2@infradead.org>, "David S. Miller" <davem@davemloft.net>,
 ocfs2-devel@oss.oracle.com, Alexander Viro <viro@zeniv.linux.org.uk>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tue 13-08-19 07:55:06, Mark Salyzyn wrote:
...
> diff --git a/fs/xattr.c b/fs/xattr.c
> index 90dd78f0eb27..71f887518d6f 100644
> --- a/fs/xattr.c
> +++ b/fs/xattr.c
...
>  ssize_t
>  __vfs_getxattr(struct dentry *dentry, struct inode *inode, const char *name,
> -	       void *value, size_t size)
> +	       void *value, size_t size, int flags)
>  {
>  	const struct xattr_handler *handler;
> -
> -	handler = xattr_resolve_name(inode, &name);
> -	if (IS_ERR(handler))
> -		return PTR_ERR(handler);
> -	if (!handler->get)
> -		return -EOPNOTSUPP;
> -	return handler->get(handler, dentry, inode, name, value, size);
> -}
> -EXPORT_SYMBOL(__vfs_getxattr);
> -
> -ssize_t
> -vfs_getxattr(struct dentry *dentry, const char *name, void *value, size_t size)
> -{
> -	struct inode *inode = dentry->d_inode;
>  	int error;
>  
> +	if (flags & XATTR_NOSECURITY)
> +		goto nolsm;

Hum, is it OK for XATTR_NOSECURITY to skip even the xattr_permission()
check? I understand that for reads of security xattrs it actually does not
matter in practice but conceptually that seems wrong to me as
XATTR_NOSECURITY is supposed to skip just security-module checks to avoid
recursion AFAIU.

> diff --git a/include/uapi/linux/xattr.h b/include/uapi/linux/xattr.h
> index c1395b5bd432..1216d777d210 100644
> --- a/include/uapi/linux/xattr.h
> +++ b/include/uapi/linux/xattr.h
> @@ -17,8 +17,9 @@
>  #if __UAPI_DEF_XATTR
>  #define __USE_KERNEL_XATTR_DEFS
>  
> -#define XATTR_CREATE	0x1	/* set value, fail if attr already exists */
> -#define XATTR_REPLACE	0x2	/* set value, fail if attr does not exist */
> +#define XATTR_CREATE	 0x1	/* set value, fail if attr already exists */
> +#define XATTR_REPLACE	 0x2	/* set value, fail if attr does not exist */
> +#define XATTR_NOSECURITY 0x4	/* get value, do not involve security check */
>  #endif

It seems confusing to export XATTR_NOSECURITY definition to userspace when
that is kernel-internal flag. I'd just define it in include/linux/xattr.h
somewhere from the top of flags space (like 0x40000000).

Otherwise the patch looks OK to me (cannot really comment on the security
module aspect of this whole thing though).

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

