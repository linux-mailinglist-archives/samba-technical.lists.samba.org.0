Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F699D2DEFA
	for <lists+samba-technical@lfdr.de>; Fri, 16 Jan 2026 09:21:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=R/pIR9g5xBWqOZmQj/jDCO8xKQONNisoQQHHakrcMdk=; b=JC3xg8Z5f6NS2yQKZa6UuipThT
	sBL06EYbkhb6sh1AH5zsXYG4txNElf/aiaTpKbmewcZIcM/EgG/2a/K+70BlI5gnXV/4Ft3NC+YoU
	uPYbQGAnSt6MewNt45wwC0J+7Qa+PMeuujvJI+xLOA5spm713AaewjutRHvXyOY3vFD/ZW+lKCX7h
	uJPNd4AwW8EveUDOuqNOFwbVxzpIxAx+ADg8rKMlKOvjWxa3FFTFcB/I1h/rMZXH9CcvKTSsn/dvz
	QGXVQRLXTf3Su0uNaQ1oRiXoXNyqoNEsRfWMp/z3Fy1UHNSJ2BS2rFUYp3y2aIhLQeoByID7RHL19
	xaATKyTw==;
Received: from ip6-localhost ([::1]:50190 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vgf4x-000Dik-Rv; Fri, 16 Jan 2026 08:21:11 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:44203) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vgSUH-000CEC-Op
 for samba-technical@lists.samba.org; Thu, 15 Jan 2026 18:54:32 +0000
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-432da746749so614620f8f.0
 for <samba-technical@lists.samba.org>; Thu, 15 Jan 2026 10:54:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768503269; x=1769108069; darn=lists.samba.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=R/pIR9g5xBWqOZmQj/jDCO8xKQONNisoQQHHakrcMdk=;
 b=OG84SNojwirbXO4RDD2UruEeFoQHS61SZXHCLxMjP9AClQO/lS7qVdRsY+bL0ZXjTC
 kvvslOQcH99/tht2ze6+eUaNsrw4uA0/dnv/bDTjjZIxm51UiP4nOZF3VQzntIIUV603
 YakHONEGYFKmM0bE61hdaZO49c7I/8YWaASt8VpODShauPu7hDNGrOE0a2ECfuvHS46g
 EE5ok6C3u9MtgAOY1gUKzhqWx/xK4HWFrcyNYmCRmIAjV72vdURPhv+PuwuucwZfOjqs
 XcD8BGXOFhcPrkUQRApWAjeCjgDkPLbDCi5HCBLqgZ/nP0xSnF6soyCGiobnADsGW8qm
 N1xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768503269; x=1769108069;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=R/pIR9g5xBWqOZmQj/jDCO8xKQONNisoQQHHakrcMdk=;
 b=rzEWReOPVqqVq5KGhrpOAUAHsUseAxPBi0+T6d3zhXTVYBu/wmfXKjsfPmpg9yczGz
 RTOIC4DyZk8tctL59ISJZgdIKg6drJ5/ivOO8A3nUa8x5PXNTY2ipwvNBWc1Z0tQ8b6c
 IQ8QYE6etXsVH5i5+KiiKzgGXth2wl0eJwybj2lRdTFQUvWJD91nge/mTjZIYYPEH6VB
 LYf1kfN4sMpUF8rAjTSA8+ZC/A24gUfIo+8kqPgK5BTngh9dn4otqx9dD+ix4ssz42MS
 eTBXsn7KQfdR4zlITVRxeyTr8IOHvhLe7tBTvzQiYlxU7zit9+ak8PkGLoAxOspJz48h
 spEw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUXNMpaVWNsQ2Zyr5AsGi0sUORXwbj9xCH2pF0lJFyR8G76qcHG4+7elO3qleemKvHdLjN/D35VSiJCqnby5/s=@lists.samba.org
X-Gm-Message-State: AOJu0YwiIUXJXdeTcvRQQjlnT3ZF64F0AwtjhCiYbhTgavnnlqrffsL/
 X3EXDOK/vc2Q1Moz3lLbjpbkj3pvdpbtYQD3mjzieYGt1EeTSKkGrMWrFej6W267ACUAzKknOvm
 ssn1fa1DZg6c5RIjDhI0nEwxqSNGrZlQ=
X-Gm-Gg: AY/fxX6qX/W/7ZLuZxNv2Km7Vm140D8NHfGGrq7Dm+2dDBq1o3wJWzV1B+fVKAh45VB
 miQTSwW6sfMQ378HWxczJtXo/K2h+/CwMkpDXe9WWwle0EmIgCnsxMecwVIXK8S+rISc/98cGBz
 XdWpPDIzG/XksOLMKcvQyJRFp+md5+T1iimpHrwq6Szst3eKqIe57Zgyw73zQhJNz/UYBAXX0lr
 lpAxd7hldDT2GEiY2Lj0pg9pOqJTKRJGhAnAI/SC1pyGxbYnJJbnrsMBh8k5O2y80vYhsoRKO4Q
 WY8EN7UXeVmYa1l8KZU9hDwXdMZ5eg==
X-Received: by 2002:a05:6000:2313:b0:432:5c43:76 with SMTP id
 ffacd0b85a97d-43569bc17ebmr434376f8f.39.1768503268480; Thu, 15 Jan 2026
 10:54:28 -0800 (PST)
MIME-Version: 1.0
References: <20260115-exportfs-nfsd-v1-0-8e80160e3c0c@kernel.org>
 <20260115-exportfs-nfsd-v1-26-8e80160e3c0c@kernel.org>
In-Reply-To: <20260115-exportfs-nfsd-v1-26-8e80160e3c0c@kernel.org>
Date: Thu, 15 Jan 2026 19:54:17 +0100
X-Gm-Features: AZwV_QgNgqINU2MW0ct-_EKOImgQ1uAwJfq7nKBHPoIgHpyzlMCSNbXGV-6zTEg
Message-ID: <CAOQ4uxh4VaVL9PD7-_Op9Xs-z5Qrx8g6x2x5FccujQX-Cw9RqQ@mail.gmail.com>
Subject: Re: [PATCH 26/29] fuse: add EXPORT_OP_STABLE_HANDLES flag to export
 operations
To: Jeff Layton <jlayton@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Fri, 16 Jan 2026 08:21:09 +0000
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
From: Amir Goldstein via samba-technical <samba-technical@lists.samba.org>
Reply-To: Amir Goldstein <amir73il@gmail.com>
Cc: Martin Brandenburg <martin@omnibond.com>,
 jfs-discussion@lists.sourceforge.net, Jan Kara <jack@suse.cz>,
 Paulo Alcantara <pc@manguebit.org>, Alex Markuze <amarkuze@redhat.com>,
 Sandeep Dhavale <dhavale@google.com>, linux-btrfs@vger.kernel.org,
 Carlos Maiolino <cem@kernel.org>, linux-unionfs@vger.kernel.org,
 Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
 Chris Mason <clm@fb.com>, Andreas Dilger <adilger.kernel@dilger.ca>,
 Chunhai Guo <guochunhai@vivo.com>, linux-mtd@lists.infradead.org,
 Mike Marshall <hubcap@omnibond.com>, linux-xfs@vger.kernel.org,
 linux-nilfs@vger.kernel.org, Yue Hu <zbestahu@gmail.com>,
 Miklos Szeredi <miklos@szeredi.hu>, Richard Weinberger <richard@nod.at>,
 Mark Fasheh <mark@fasheh.com>, Hugh Dickins <hughd@google.com>,
 Dai Ngo <Dai.Ngo@oracle.com>, Ryusuke Konishi <konishi.ryusuke@gmail.com>,
 Viacheslav Dubeyko <slava@dubeyko.com>, NeilBrown <neil@brown.name>,
 Ilya Dryomov <idryomov@gmail.com>, linux-ext4@vger.kernel.org,
 Salah Triki <salah.triki@gmail.com>, linux-mm@kvack.org,
 devel@lists.orangefs.org, Shyam Prasad N <sprasad@microsoft.com>,
 Olga Kornievskaia <okorniev@redhat.com>, linux-cifs@vger.kernel.org,
 Dave Kleikamp <shaggy@kernel.org>, Chao Yu <chao@kernel.org>,
 linux-nfs@vger.kernel.org, Tom Talpey <tom@talpey.com>,
 ocfs2-devel@lists.linux.dev, Bharath SM <bharathsm@microsoft.com>,
 David Sterba <dsterba@suse.com>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Jeffle Xu <jefflexu@linux.alibaba.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 ceph-devel@vger.kernel.org, Gao Xiang <xiang@kernel.org>,
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

On Thu, Jan 15, 2026 at 6:50=E2=80=AFPM Jeff Layton <jlayton@kernel.org> wr=
ote:
>
> Add the EXPORT_OP_STABLE_HANDLES flag to fuse export operations to indica=
te
> that this filesystem can be exported via NFS.
>
> Signed-off-by: Jeff Layton <jlayton@kernel.org>
> ---
>  fs/fuse/inode.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/fs/fuse/inode.c b/fs/fuse/inode.c
> index 819e50d666224a6201cfc7f450e0bd37bfe32810..1652a98db639fd75e8201b681=
a29c68b4eab093c 100644
> --- a/fs/fuse/inode.c
> +++ b/fs/fuse/inode.c
> @@ -1208,6 +1208,7 @@ static struct dentry *fuse_get_parent(struct dentry=
 *child)
>  /* only for fid encoding; no support for file handle */
>  static const struct export_operations fuse_export_fid_operations =3D {
>         .encode_fh      =3D fuse_encode_fh,
> +       .flags          =3D EXPORT_OP_STABLE_HANDLES,
>  };

These are used when the server declares FUSE_NO_EXPORT_SUPPORT
so do not opt in for NFS export.

The sad thing w.r.t FUSE is that in most likelihood server does not provide
persistent handles also when it does not declare FUSE_NO_EXPORT_SUPPORT
but we are stuck with that.

Thanks,
Amir.

