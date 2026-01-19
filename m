Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 958B5D3C180
	for <lists+samba-technical@lfdr.de>; Tue, 20 Jan 2026 09:12:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=t7xapJC59KqqTTsHRvPEloTsuOjJhUfycEcUpCAL4U8=; b=bsfWqOLMtxY5Ab7JnIdCBmeYHu
	mqJfWwChyhrAWh/rvKNJCBIRPohSZID+68v84K5W64Oi1lp35NI0VZHoOM7Bol3855inznXYWZgU0
	U8lvUj0F8y7+SUANfuEyOr0fP0Crn+wagcHd99N0nV4aEM2+xdeIC9gOOFb49ULSkGYw8h3C/XMH9
	npguhnTvluc4mgLotFa0Rmshbr0lMbxvRItEFUOfl//gXFIeRItCZQ4w7cUCidRs88CAW4UN6+2MH
	wbz6Sr8KZp/iiFAMH6krpQJQ7IRu7mXTUtiVB3+qxwgqZht9OR8hN5yxviQd1qc1s2xT7p7ySWpEh
	n8vhybtg==;
Received: from ip6-localhost ([::1]:54872 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vi6qS-000i05-PU; Tue, 20 Jan 2026 08:12:12 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535]:50680) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vhsLk-000eZ6-Dl
 for samba-technical@lists.samba.org; Mon, 19 Jan 2026 16:43:35 +0000
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-64b9b0b4d5dso9321439a12.1
 for <samba-technical@lists.samba.org>; Mon, 19 Jan 2026 08:43:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768841011; x=1769445811; darn=lists.samba.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=t7xapJC59KqqTTsHRvPEloTsuOjJhUfycEcUpCAL4U8=;
 b=FMQsi/6jetZilPx7NCCs29sju2yRfstA7n8YFdOGDKx50wCn6D9lbhRjpbQJ6HxuFt
 iTKVU3EicRAvE41Nlcc39R1p8nL3xwW/H7ZSEsgMhzP8FcW7W0GGszcfLzkn4PwJ2UJy
 pR6s2LbjeuIsmMxH60daKfQA09ADSNxeigo9cCJeaHF1rXAli19rE6ajDfhnTPei6qcY
 T1ak+NoScnqFbcznpEAXXQ1+FSlj5JJonQd1ECo2vjfg9D4QF0itrceCQF0nXOjuqxsX
 gLYHS0pCjBW4xtdunTUIuyOtHxGivBJRou6JObi7JBYUL0oB0CfIaZuNIV0dYzwM02mi
 T7/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768841011; x=1769445811;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=t7xapJC59KqqTTsHRvPEloTsuOjJhUfycEcUpCAL4U8=;
 b=ZGuQNYk4MZMdHD9Pm6XL4YAK/5+ZPgD+u27LubKXxhG0LKF4nXXam2uDe0F9zaxI3H
 6aO/fGaFmYLZaZHJEVqC/fs2hRLid4+V/V9vrDrCX+vyvnXgOK5aiQJH9DhTjdCqRufs
 Uk8snES/lqCybK7IzwwGpVbJ/VZzjCMsWHTmUyorR4Bz1qIQlzVVOa6CL8ekkHStFfIf
 WzWNgej61BY4yg0IV1GM4QbmtqKrs5MOF6lWXOC2PveGM3PfNf3HrmLQC0MDO8BDjkpE
 7KIUVs7seboMuhVZXSptjTKlIbg0jJpN0LfnNfAMdH6C6NAJknO89CGcaFGQqmSRLfIo
 0jKg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVMuLJKbFEMoGnh8kJ1VRuJqJiQtex3kCk8owXV6NOsa5cssH+DiEMzoycKDtngG3YjBFFXAe8jB0lR9njxJcI=@lists.samba.org
X-Gm-Message-State: AOJu0YzFKP35cviXWyNAQDK34AX2nDd3pOgX1fcCMuHs+hfnJTznsf1k
 58/FgOUE+EnSxWw6TZ5Bn+B2r7c2KM6axQ1R29WQw986+0GH4GInEvYXBxTLVxpQECi1HJ4BSpk
 A4wf0/2rfmZ03ognxrgL/QMoYeNJjk+k=
X-Gm-Gg: AZuq6aLWZNoe14taUuuwy9no3SF6wRb1hRZ1yNB7CkfDjNVqNbj3m1Fh0LgL6Hmy5tG
 LtIYXDvCaZQd2HtsKwco7GJOQLySLyNHbEtt9Ym4WMUigmvr6ChOsIwb6nIDnd/UAf4CJqxU7Z8
 zQJ6V0XK3iYd7NXPuSPx2JgP0Dw4CBTz/KfyMmue3UEGk6ldxZKNDDNzFSoCM5KimmTRX8Wrz0c
 sC7H7DyQ+ZHIP8YlweLN5UYzy22i57+rteqdgFxVhnDsIKqTktSP/Fl+GOif3rsap2/BWCkxDoo
 Thoh+rEHG7sMOLOmUaGkAcoZgDwnqX8//Zf527JP
X-Received: by 2002:a05:6402:5106:b0:64c:584c:556c with SMTP id
 4fb4d7f45d1cf-654bb6192admr8530585a12.30.1768841011353; Mon, 19 Jan 2026
 08:43:31 -0800 (PST)
MIME-Version: 1.0
References: <20260119-exportfs-nfsd-v2-0-d93368f903bd@kernel.org>
 <20260119-exportfs-nfsd-v2-27-d93368f903bd@kernel.org>
In-Reply-To: <20260119-exportfs-nfsd-v2-27-d93368f903bd@kernel.org>
Date: Mon, 19 Jan 2026 17:43:19 +0100
X-Gm-Features: AZwV_QgQ6YFmczFqASwqjyOa509PoCTPsOB-sET1G173IBHOd4X5kFjH9N6z5MI
Message-ID: <CAOQ4uxjyTdf21G1Y=_5Eox58drVPA0gAMeSQZxh=T36_yzssNw@mail.gmail.com>
Subject: Re: [PATCH v2 27/31] fuse: add EXPORT_OP_STABLE_HANDLES flag to
 export operations
To: Jeff Layton <jlayton@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Tue, 20 Jan 2026 08:12:07 +0000
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
 Carlos Maiolino <cem@kernel.org>, Dave Chinner <david@fromorbit.com>,
 linux-unionfs@vger.kernel.org,
 Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
 Chris Mason <clm@fb.com>, Andreas Dilger <adilger.kernel@dilger.ca>,
 Chunhai Guo <guochunhai@vivo.com>, linux-mtd@lists.infradead.org,
 Mike Marshall <hubcap@omnibond.com>, linux-xfs@vger.kernel.org,
 linux-nilfs@vger.kernel.org, Yue Hu <zbestahu@gmail.com>,
 Miklos Szeredi <miklos@szeredi.hu>, Richard Weinberger <richard@nod.at>,
 Mark Fasheh <mark@fasheh.com>, linux-doc@vger.kernel.org,
 Hugh Dickins <hughd@google.com>, Dai Ngo <Dai.Ngo@oracle.com>,
 Ryusuke Konishi <konishi.ryusuke@gmail.com>,
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
 Jonathan Corbet <corbet@lwn.net>, samba-technical@lists.samba.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 Steve French <sfrench@samba.org>, Chuck Lever <chuck.lever@oracle.com>,
 Hongbo Li <lihongbo22@huawei.com>, Anna Schumaker <anna@kernel.org>,
 Jan Kara <jack@suse.com>, linux-fsdevel@vger.kernel.org,
 Phillip Lougher <phillip@squashfs.org.uk>,
 Andrew Morton <akpm@linux-foundation.org>, ntfs3@lists.linux.dev,
 David Woodhouse <dwmw2@infradead.org>,
 David Laight <david.laight.linux@gmail.com>,
 Trond Myklebust <trondmy@kernel.org>, Joel Becker <jlbec@evilplan.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Mon, Jan 19, 2026 at 5:30=E2=80=AFPM Jeff Layton <jlayton@kernel.org> wr=
ote:
>
> Add the EXPORT_OP_STABLE_HANDLES flag to fuse export operations to indica=
te
> that this filesystem can be exported via NFS.
>
> Signed-off-by: Jeff Layton <jlayton@kernel.org>
Reviewed-by: Amir Goldstein <amir73il@gmail.com>

> ---
>  fs/fuse/inode.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/fs/fuse/inode.c b/fs/fuse/inode.c
> index 819e50d666224a6201cfc7f450e0bd37bfe32810..df92414e903b200fedb9dc777=
b913dae1e2d0741 100644
> --- a/fs/fuse/inode.c
> +++ b/fs/fuse/inode.c
> @@ -1215,6 +1215,7 @@ static const struct export_operations fuse_export_o=
perations =3D {
>         .fh_to_parent   =3D fuse_fh_to_parent,
>         .encode_fh      =3D fuse_encode_fh,
>         .get_parent     =3D fuse_get_parent,
> +       .flags          =3D EXPORT_OP_STABLE_HANDLES,
>  };
>
>  static const struct super_operations fuse_super_operations =3D {
>
> --
> 2.52.0
>

