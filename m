Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id ED1C3D2DEFE
	for <lists+samba-technical@lfdr.de>; Fri, 16 Jan 2026 09:21:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=d7IY8l2+i1WeuEXvkGd5lYKI5+uHV9G4YufUEOTseco=; b=uAKmMY67yeyK7vKP4cWrE37amx
	z+TkDpEIz3GfNaABPPWauvR7pM2mL99XYSkilGw5Emfg/fc3UpMHHwPoQGuBom9ClYEeSKEsRZMXS
	SCgLcHJZUx0yrtrGnGNtvKbAf5rw6iQCzZnEgYClk2sX7siciQlCi3JY4p1THrl0Acl+T4CIZNZwy
	kL6VmKrrfkU9XdQh8jp1Hn7j2f5NK1OoT7Of0TpC25IyhGcDm8Tre/ek79mnO+CODx1RjouOd6vNp
	Fd7gaRgpjXxqGIO1is7GhQefUDzX2Rdsd2IOQTfubh9Lq5sk7j4sOS6MZ/C62dpjKxBJwszgndBg6
	SW0NTs3Q==;
Received: from ip6-localhost ([::1]:47316 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vgf4o-000DiD-1l; Fri, 16 Jan 2026 08:21:02 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533]:47368) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vgRyz-000CAa-85
 for samba-technical@lists.samba.org; Thu, 15 Jan 2026 18:22:11 +0000
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-6505d3b84bcso1856202a12.3
 for <samba-technical@lists.samba.org>; Thu, 15 Jan 2026 10:22:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768501328; x=1769106128; darn=lists.samba.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=d7IY8l2+i1WeuEXvkGd5lYKI5+uHV9G4YufUEOTseco=;
 b=Hn0FnIUoiX9JsotZqF1QANa0c0t5gfF6dkpMuV0HO51PnDPboZFYuZnJNiiaSyBsG7
 aPkYTkD2AmPTsEGRI3nOjcL6i87xBvwX1xviKQdk94z65IFBvP0GwX5eucluIX7zvSrS
 ZXdtWD6TXflaxlaNiWAxP8fED/HqAvG5erSaWY+mD1pczQcNiEB4jgD169/2LZpV0mob
 HnBxthzHVIOOjI2/q4tk7W5y1qqZUMNjzC0xk68jvAr8ivNZ6wism0q0QW7TSe0gc60g
 fi+x7Q4NDnSEVrgPK47Iqb/+yarjAVfn+HFQu6E1fvibsjw2AcvD+PtyneWJZIFBgCdm
 Ibtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768501328; x=1769106128;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=d7IY8l2+i1WeuEXvkGd5lYKI5+uHV9G4YufUEOTseco=;
 b=TIBeFMo5mDQbFTfJOgGJSBarpevggymWCK+QcaSWIYCdQXHCAfu2oE/HRkahS+rWZF
 g6Hx43WKLJbJUqQpuXjg71N2dvO/NGa9QDk7qKm3sUpARVg4T4lTQ6hC5RWMjHEya+6H
 lOckPTu4MGvN49h3GS6u4iPPiguUtBYNZtoeI6K6ufFvZvSk/Wy1fw3vuQ5pzyDy2rtn
 MvZoeHCygL++PGBs5ryQBmzhEwDeVBIQXfqX+bbMP6FsH7IMlX9VyRfi8PkFpneOrivy
 4jJ2AeZB9auP8ACdt0lCC+cfSHPazyVt9YHGOGg+yf5w6rzYieGs1Llbbd6FW04Fy66+
 BCPA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU0QLfbvQpj1AThL4HS7uJvvBQAO2tSJaxDow/eqjfmb1kWj/0aIlfG4SJhZYw6Is5p5kc/Y/yqu5+tiXrZAYg=@lists.samba.org
X-Gm-Message-State: AOJu0YyeujY+dly6Lx/6psgErKzZcTX7jTQ5siJMioF1DIYLV5fJWgkx
 VQKJ8ZIC9EnSBlbnOoSex7pGz9gjjRl9NKt3RUijr5XXmP1tmqcA2+vItxv/3DMS3Tc42iBFTFQ
 SR1uXTPnMGF75pMDX92ZmJ4FJ3IlNnDM=
X-Gm-Gg: AY/fxX4IzWW7AArlS85nBuwH7DkePTGeeRTAUMk5+J9wqitXyTIqMJALvPTDdYVS43p
 ZacXaxmSq9h5HTFPyoEV6rMOedXEiNn6OlDj9drjaN1eM+DYP9uWEL+L6HxXZKYduASJXrZd2dP
 lbX4GkWJjNnLh3ODBVWgsTPLaPajEK0y1JFlAl8GW5vyeboSdsH4Mq7fSLo2/ZEJ9C56VksN8B6
 u7Jn4nBzWICdgQLYPhUKNDYgdky7MWBl4AppSZJKeqXHirtUqTvHQUktUzG7g1KK2zWrMbYAzQW
 9iAjIOOy710OLJvhO6TshlBdhP8QAQ==
X-Received: by 2002:a05:6402:2812:b0:64b:3f56:55c9 with SMTP id
 4fb4d7f45d1cf-65452cca336mr319308a12.26.1768501327990; Thu, 15 Jan 2026
 10:22:07 -0800 (PST)
MIME-Version: 1.0
References: <20260115-exportfs-nfsd-v1-0-8e80160e3c0c@kernel.org>
 <20260115-exportfs-nfsd-v1-16-8e80160e3c0c@kernel.org>
In-Reply-To: <20260115-exportfs-nfsd-v1-16-8e80160e3c0c@kernel.org>
Date: Thu, 15 Jan 2026 19:21:56 +0100
X-Gm-Features: AZwV_Qjyapjv6JnFBHXmI5sSMthIqKsr1O8J34VK_oMMrDctP8UVkm6G-xvI8HQ
Message-ID: <CAOQ4uxhnxipJcjznEoa_D2R91NDZRgT_TTouGA4PGJO-7R9spw@mail.gmail.com>
Subject: Re: [PATCH 16/29] ovl: add EXPORT_OP_STABLE_HANDLES flag to export
 operations
To: Jeff Layton <jlayton@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Fri, 16 Jan 2026 08:20:59 +0000
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

On Thu, Jan 15, 2026 at 6:49=E2=80=AFPM Jeff Layton <jlayton@kernel.org> wr=
ote:
>
> Add the EXPORT_OP_STABLE_HANDLES flag to overlayfs export operations to i=
ndicate
> that this filesystem can be exported via NFS.
>
> Signed-off-by: Jeff Layton <jlayton@kernel.org>
> ---
>  fs/overlayfs/export.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/fs/overlayfs/export.c b/fs/overlayfs/export.c
> index 83f80fdb156749e65a4ea0ab708cbff338dacdad..17c92a228120e1803135cc2b4=
fe4180f5e343f88 100644
> --- a/fs/overlayfs/export.c
> +++ b/fs/overlayfs/export.c
> @@ -865,9 +865,11 @@ const struct export_operations ovl_export_operations=
 =3D {
>         .fh_to_parent   =3D ovl_fh_to_parent,
>         .get_name       =3D ovl_get_name,
>         .get_parent     =3D ovl_get_parent,
> +       .flags          =3D EXPORT_OP_STABLE_HANDLES,
>  };
>
>  /* encode_fh() encodes non-decodable file handles with nfs_export=3Doff =
*/
>  const struct export_operations ovl_export_fid_operations =3D {
>         .encode_fh      =3D ovl_encode_fh,
> +       .flags          =3D EXPORT_OP_STABLE_HANDLES,
>  };
>

Actually, see comment above:
/* encode_fh() encodes non-decodable file handles with nfs_export=3Doff */

That's the variant of export_ops when overlayfs cannot be nfs exported
because its encoded file handles can change after copyup+reboot.

Thanks,
Amir.

