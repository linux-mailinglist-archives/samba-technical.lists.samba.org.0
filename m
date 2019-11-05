Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A723BF10BD
	for <lists+samba-technical@lfdr.de>; Wed,  6 Nov 2019 09:05:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=uOVvLIfAKaABNeenvYiWQ2HO7/bSUZZppsMPK3eSjzk=; b=RgsZDESg/IyOGI61yxS4FL2OG9
	l14VJJbYeQR9nsI3sZyrUqxA+/rJGoTUuYX47vhJtO/lcmE7+2wQuJdi/WZlKy17IhAMZlKz4RdWe
	zfi5KgqnpOb4MtMnbzOMNXhVk2yJstSQum83ATXcUOG3XgYHx1RcLLbrXSur4DPUAtdCvNXgruViW
	aw3hIClneYpgDVrTv1BJZTUOmBco82vV7FXBNIATi3rbIQbYDV7fIXW1Ow25FaL+eTwmAjCEQsIRa
	pHTHF2CQ9MgU/GfbMw4lIUSVQopwEMgoIRUXQEfaAxGSyrJy9WBCO9EDZIMvh/o5fgtBXRZMd5pZP
	fdvUbUbQ==;
Received: from localhost ([::1]:59262 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iSGJG-006y6N-CF; Wed, 06 Nov 2019 08:04:58 +0000
Received: from mx2.suse.de ([195.135.220.15]:48454 helo=mx1.suse.de) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1iRvgm-006dAH-Ix
 for samba-technical@lists.samba.org; Tue, 05 Nov 2019 10:03:54 +0000
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id DDAFFB3A6;
 Tue,  5 Nov 2019 09:48:34 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
 id 242661E4407; Tue,  5 Nov 2019 10:48:30 +0100 (CET)
Date: Tue, 5 Nov 2019 10:48:30 +0100
To: Mark Salyzyn <salyzyn@android.com>
Subject: Re: [PATCH v15 1/4] Add flags option to get xattr method paired to
 __vfs_getxattr
Message-ID: <20191105094830.GL22379@quack2.suse.cz>
References: <20191104215253.141818-1-salyzyn@android.com>
 <20191104215253.141818-2-salyzyn@android.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191104215253.141818-2-salyzyn@android.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Warn: EHLO/HELO not verified: Remote host 195.135.220.15 (mx2.suse.de)
 incorrectly presented itself as mx1.suse.de
X-Mailman-Approved-At: Wed, 06 Nov 2019 08:04:56 +0000
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
 jfs-discussion@lists.sourceforge.net, Jan Kara <jack@suse.cz>,
 linux-doc@vger.kernel.org, linux-integrity@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Martin Brandenburg <martin@omnibond.com>, samba-technical@lists.samba.org,
 Dominique Martinet <asmadeus@codewreck.org>,
 Artem Bityutskiy <dedekind1@gmail.com>,
 Adrian Hunter <adrian.hunter@intel.com>, David Howells <dhowells@redhat.com>,
 Chris Mason <clm@fb.com>, "David S. Miller" <davem@davemloft.net>,
 Andreas Dilger <adilger.kernel@dilger.ca>, Eric Paris <eparis@parisplace.org>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, netdev@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-afs@lists.infradead.org,
 Mike Marshall <hubcap@omnibond.com>, linux-xfs@vger.kernel.org,
 linux-unionfs@vger.kernel.org, Andreas Gruenbacher <agruenba@redhat.com>,
 Sage Weil <sage@redhat.com>, "Darrick J . Wong" <darrick.wong@oracle.com>,
 Richard Weinberger <richard@nod.at>, Mark Fasheh <mark@fasheh.com>,
 Eric Biggers <ebiggers@google.com>, Hugh Dickins <hughd@google.com>,
 James Morris <jmorris@namei.org>,
 Trond Myklebust <trond.myklebust@hammerspace.com>, cluster-devel@redhat.com,
 selinux@vger.kernel.org, Benjamin Coddington <bcodding@redhat.com>,
 Casey Schaufler <casey@schaufler-ca.com>, v9fs-developer@lists.sourceforge.net,
 Ilya Dryomov <idryomov@gmail.com>, linux-ext4@vger.kernel.org,
 Stephen Smalley <sds@tycho.nsa.gov>, linux-mm@kvack.org,
 Mark Salyzyn <salyzyn@google.com>, Serge Hallyn <serge@hallyn.com>,
 ecryptfs@vger.kernel.org, linux-cifs@vger.kernel.org,
 Eric Van Hensbergen <ericvh@gmail.com>, Chao Yu <chao@kernel.org>,
 linux-erofs@lists.ozlabs.org, Josef Bacik <josef@toxicpanda.com>,
 reiserfs-devel@vger.kernel.org, Miklos Szeredi <miklos@szeredi.hu>,
 Joel Becker <jlbec@evilplan.org>, linux-mtd@lists.infradead.org,
 Phillip Lougher <phillip@squashfs.org.uk>, David Sterba <dsterba@suse.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>, ceph-devel@vger.kernel.org,
 devel@lists.orangefs.org, Gao Xiang <xiang@kernel.org>,
 Mimi Zohar <zohar@linux.ibm.com>, Paul Moore <paul@paul-moore.com>,
 linux-nfs@vger.kernel.org, Theodore Ts'o <tytso@mit.edu>,
 linux-fsdevel@vger.kernel.org, Joseph Qi <joseph.qi@linux.alibaba.com>,
 Mathieu Malaterre <malat@debian.org>, kernel-team@android.com,
 Jonathan Corbet <corbet@lwn.net>, Jeff Layton <jlayton@kernel.org>,
 linux-kernel@vger.kernel.org, Tyler Hicks <tyhicks@canonical.com>,
 Steve French <sfrench@samba.org>, linux-security-module@vger.kernel.org,
 ocfs2-devel@oss.oracle.com, Jan Kara <jack@suse.com>,
 Bob Peterson <rpeterso@redhat.com>, Tejun Heo <tj@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Woodhouse <dwmw2@infradead.org>,
 Anna Schumaker <anna.schumaker@netapp.com>, linux-btrfs@vger.kernel.org,
 Alexander Viro <viro@zeniv.linux.org.uk>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

> @@ -228,11 +228,11 @@ static int afs_xattr_get_yfs(const struct xattr_handler *handler,
>  		break;
>  	case 1:
>  		data = buf;
> -		dsize = snprintf(buf, sizeof(buf), "%u", yacl->inherit_flag);
> +		dsize = scnprintf(buf, sizeof(buf), "%u", yacl->inherit_flag);
>  		break;
>  	case 2:
>  		data = buf;
> -		dsize = snprintf(buf, sizeof(buf), "%u", yacl->num_cleaned);
> +		dsize = scnprintf(buf, sizeof(buf), "%u", yacl->num_cleaned);
>  		break;
>  	case 3:

These scnprintf() changes (and there are more in the patch) probably
shouldn't be here... Otherwise the patch still looks good to me :).

								Honza

-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

