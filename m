Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id DA670D3C181
	for <lists+samba-technical@lfdr.de>; Tue, 20 Jan 2026 09:12:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=OP488vxzDs37SDvqB3SvtrET0fHZKVUQCP8+UqFkiUw=; b=KcYgk4EdITgKl4LuwFJUdxAHnH
	leMgFfPEp0yBnqJ+sH3iRhyo7jmioBdirKRniFoVE3kGojx6ygmeoJVW1iU6gjcEQ7IkVbKJcPOB8
	HHPlY+YSCSHAMJNeLY+IrNcCcG7+gufnTw5ndWMiQKALegMD6MTqxaBr3O3jnEY6G2cYIbbBEZRlz
	RT11Fkfyy52hwn5QzfolTA3mDPSeOn50pN3Ik+lCpcXamMdat1Jfmpa3NwTTjx8nuuiLhERuIsmos
	T+t2th0h+ks/6W663rIV1JXw8CvQ/axjmaYShmttX0rjW8bUZTM4yYlLSmKhZdND6pSini5Pto79S
	1cCBkeLg==;
Received: from ip6-localhost ([::1]:54870 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vi6qR-000hzv-Ls; Tue, 20 Jan 2026 08:12:11 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:47597) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vhsLM-000eYy-5C
 for samba-technical@lists.samba.org; Mon, 19 Jan 2026 16:43:10 +0000
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-6505d3b84bcso6787834a12.3
 for <samba-technical@lists.samba.org>; Mon, 19 Jan 2026 08:43:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768840987; x=1769445787; darn=lists.samba.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OP488vxzDs37SDvqB3SvtrET0fHZKVUQCP8+UqFkiUw=;
 b=hhKE0tUk/Tf6nsN0xWzQ9G1PRAFS1ot8WW10P4kBLdXhq1znhticImWGVjbxqBTJ4i
 bXnHGa4QmVhEggOh6rdU65LCAraG9TPVldg1P2azfOfgVeTZjCV7sE21IVH6nJ7AoPpF
 oBaVWiLQ2IcAkMf6Em2ff3p6Szr0zenWn8/ageiMVReii5SjvCZJ7brh0APR4vH660wC
 eaf51EKaPl/zdvOCM+bfR2jBKq/bmF/AjusNQr5CnWK2+MdLEXzmOLAeaOzi35uKUUpR
 I/SEhZCv7KG/+Fu7yvTu23nZk6jcr7PUhSRJxtrlMh6IqGfrfPLKawGwiwAPGNih0KHZ
 AGfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768840987; x=1769445787;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=OP488vxzDs37SDvqB3SvtrET0fHZKVUQCP8+UqFkiUw=;
 b=FkMpDfCl/waEjYFLqylT972L4Cx5Vcv3LQbN2j0uz5KD4yGxj54589qK3L1drD20kK
 lV9jRVy+G4MEIasZS6ySZgGv+l3H7y3qPMwBLFwIAw+/HxIgGRXqJ9usDW1ey1eupAcm
 z7xfAYvwbBWoTCD7g2JtVzjNZ19Gir5NuwYW02nJLuf/g3oF57GlfIPVFAVYjJ49Vbb6
 ZqRDQqcaykkSn5Apld1LEMlU20Es0c8BgtfQGvuyqtGWCbEK1trpwYYtjuj0lz2xni8e
 qT/gWc4y5a/7/Yjq8OetHUU6itobW3fgtHp11U8RTkgbHtRcUXjsUujM8byrfdK6yjVY
 PYNQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVG8IhJXe6Z81CRIbdLykU3fAFlr/7/hlDHH6ljJtbsQK0HUQPigTJrSb5JBPeDFRDUcybCjRHxIp5dD+Q7ztA=@lists.samba.org
X-Gm-Message-State: AOJu0YxNteLp9s/RsZPz2p7HITb9tMm+OUWhjwt8ESpQqN7nEwkm4xM1
 T2/DarZqKSWj7QtoBqs032IZMVX8Ca2wuUjFAD2d9VteWbZFb5QeU1SAdQEsCUB3jhOga1gm2Dg
 4BxbUktLysGGm7CNbzkP6YcgI/W+WXAA=
X-Gm-Gg: AZuq6aLmnqVS4+Xnm0XNpigonMtG5in1ykvxLtUfJXvi5GnbOH8du3GFRBQZ6URphvW
 j1sb2gxanZG2Da3InZnCTHLXhOwXEfm1sP9RaZSaEm4rPhPFF6Fg8TMELURWShFi4jHRCcvEhCL
 IpDHw94XseK7+brEY2u1FvNVwBiRP6jVtc9WSH/C6ToSLL2OtGlU4zch2XVyo+gXpd52GL5DBJ9
 Y78zfl70UklIqJnODwuTJF4U1D393VNRyJeOEuyxAw0MBuwYDNfI5st+Ul/WeZMNkdYykPdjRTN
 6KG8aL/y7BquoeipNCDbvBUYAreynQ==
X-Received: by 2002:a05:6402:4304:b0:649:b200:afe9 with SMTP id
 4fb4d7f45d1cf-65452cca909mr8384256a12.27.1768840987066; Mon, 19 Jan 2026
 08:43:07 -0800 (PST)
MIME-Version: 1.0
References: <20260119-exportfs-nfsd-v2-0-d93368f903bd@kernel.org>
 <20260119-exportfs-nfsd-v2-17-d93368f903bd@kernel.org>
In-Reply-To: <20260119-exportfs-nfsd-v2-17-d93368f903bd@kernel.org>
Date: Mon, 19 Jan 2026 17:42:54 +0100
X-Gm-Features: AZwV_QiQ9eetgKyRnXUMiKJDXK2vIOYhTLzpDlKP7IN3cG_hSRVA59Z6sNZRsnw
Message-ID: <CAOQ4uxgXovX-rPuAE55D8x4jbNOQdAKJH3O5gpHJDMsT7kNGgw@mail.gmail.com>
Subject: Re: [PATCH v2 17/31] ovl: add EXPORT_OP_STABLE_HANDLES flag to export
 operations
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

On Mon, Jan 19, 2026 at 5:29=E2=80=AFPM Jeff Layton <jlayton@kernel.org> wr=
ote:
>
> Add the EXPORT_OP_STABLE_HANDLES flag to overlayfs export operations to
> indicate that this filesystem can be exported via NFS.
>
> Signed-off-by: Jeff Layton <jlayton@kernel.org>
Reviewed-by: Amir Goldstein <amir73il@gmail.com>

> ---
>  fs/overlayfs/export.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/fs/overlayfs/export.c b/fs/overlayfs/export.c
> index 83f80fdb156749e65a4ea0ab708cbff338dacdad..18c6aee9dd23bb450dadbe8ee=
f9360ea268241ff 100644
> --- a/fs/overlayfs/export.c
> +++ b/fs/overlayfs/export.c
> @@ -865,6 +865,7 @@ const struct export_operations ovl_export_operations =
=3D {
>         .fh_to_parent   =3D ovl_fh_to_parent,
>         .get_name       =3D ovl_get_name,
>         .get_parent     =3D ovl_get_parent,
> +       .flags          =3D EXPORT_OP_STABLE_HANDLES,
>  };
>
>  /* encode_fh() encodes non-decodable file handles with nfs_export=3Doff =
*/
>
> --
> 2.52.0
>

