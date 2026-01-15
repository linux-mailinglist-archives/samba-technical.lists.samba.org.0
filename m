Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A8FF0D2DF34
	for <lists+samba-technical@lfdr.de>; Fri, 16 Jan 2026 09:22:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=aDUsn+SB7H7nYSne5YCtxozzRNZ3DAEsXPNjynL2NCs=; b=t9do6XJpW/6R+SUHw9gA6+wetc
	5wF5vN42rJQrUMUOWpn6UmXXJhait9zNnOvh6vhILowGD1D8i8Q4m6dP7+LxDJ+RBvrqkCNM8e09V
	GwXKnDBEDFhPMihTYVgRdYCkWAhvo+seSfpSKPn8sQ0CMVxOttaO3f6cdu8MAMln2p4AwylPIRHpQ
	ySaiCZXudfDToIV9iamGUo5jcevb2vdMQ2RfhZ1uhRUfC9T2MrEOoAGG7HvntlrMIGKIb3LsGYcDN
	htwLHxzy/sFwx5t05TmoL+WPsaApwoEPLq+xsPxM7FoYFeURVSGLGl5QliHSuVK3brxvZ7SvUL3yV
	DXr68M1A==;
Received: from ip6-localhost ([::1]:62460 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vgf6H-000Dxh-Ro; Fri, 16 Jan 2026 08:22:35 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529]:47235) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vgSzU-000CHY-64
 for samba-technical@lists.samba.org; Thu, 15 Jan 2026 19:26:46 +0000
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-653781de668so1912027a12.2
 for <samba-technical@lists.samba.org>; Thu, 15 Jan 2026 11:26:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768505203; x=1769110003; darn=lists.samba.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aDUsn+SB7H7nYSne5YCtxozzRNZ3DAEsXPNjynL2NCs=;
 b=iYBxrOe0iHV+H/g3p7lCQB2Mx25Jrk/pYeDPmC2K2hZOSIhxy+tx+UUdvPgsTtIuFo
 KnYFJuvtah6+JskjpxjIPlVKNLWeWHV0cV10Kfc8s5hppO0d8vt6QnoRvpeODi5y2BOK
 AYRiMQ5OhRHpRin0/3sMt22wzx+mFHc5TSt1TswuV1PGFrpRlywufV9weFDCGUFzuDTq
 5K6kLk3IFDEpgY8F+DAcycTtt8trrUkK1GHS76nOAk9AAYNpG059rbKNVFRALxpfAMKT
 FaDW34NlpDjCs8umjRsca2Yq0ptMFXqGcRWSm2yrIEYtY3wvDfWWAW9HVG/vXP/UTDSG
 dJjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768505203; x=1769110003;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=aDUsn+SB7H7nYSne5YCtxozzRNZ3DAEsXPNjynL2NCs=;
 b=V5I9v9PJacfMyRDny/S3Bis1ISjXYs3cVIwj9ivZUcNEGXngbXzdz8zUEzGwJe8dRE
 E0RUR9fTu7XjH7EqTcLghs1c9UTDBHAyPnyxU2fDvoTC/PThcFEYWQwcF8wbNGGBIhMR
 GvuyNKwAetCjWfK/m0XqOilIUsPdizWlAl/JXE2HBC2rA7I2oCQqYXhVHt8ZDFVBb5mo
 dbL7Udo2d90VLe+RXxAmVmMh7OV58jnfkD6tiOuAJwNpfPGDRmZBv+jfl4MQ7Vs37fiB
 JaLH+2vQovfeIjsVxubYCkRymCVRvun1Xp6V76bSQUiz3hV6zXnaMUewUmn/e77KcNUe
 ybwg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUJ/nUno2dlJ+LbeVSL+cY6rMGqpXZ13WINidP1UA5aJ+B+nzTWJt30ExDoug64QG9MZ5SVaib4x8EksAQ5jWI=@lists.samba.org
X-Gm-Message-State: AOJu0Yx2wRE0OtKoav9Ii1WFkOL29i+sP6MTVwh9Q1P1QJj4SoCLo3R2
 1LydwtDmGZgfAUsdjboXqFye3QFYBSUFxp2YUuPqKwXI0BRh8UbMNVE8CwDHYqibO/QjeiwmyJj
 V6ZxgAGDbNUV7hO/dI0ChHbCiYhSibOg=
X-Gm-Gg: AY/fxX7uNH9kKoUXcypLXgOTEyrZo843q61i5ji58RIDZUFLjKMClmm6UAcRTIE0HIJ
 1JhxN9Qny+hMNpR5nz36gmsqPwJTGStZ86W0ZST/cVwCGyAtSI0vx/hC5NxGkAhxtM17dNoVnR9
 7UfoJHRaU5lOz9QrSU8iwjnfH/vCYTk2jLICt/9Z0ePyBUl2l1yPT7R6DLhz76rEoay60zsHs7l
 29GErIrCCsy9QzKUsru/QXp1uRJQZWXGeja82v9DiwLKRjqk1nF3XhClqm+wCOYtg08JWW1i31n
 BTsH7O/jVMKKRbqcAwAF6xMtaVecjg==
X-Received: by 2002:a05:6402:4402:b0:64b:4540:6edb with SMTP id
 4fb4d7f45d1cf-65452ad0f58mr442903a12.22.1768505202965; Thu, 15 Jan 2026
 11:26:42 -0800 (PST)
MIME-Version: 1.0
References: <20260115-exportfs-nfsd-v1-0-8e80160e3c0c@kernel.org>
 <20260115-exportfs-nfsd-v1-15-8e80160e3c0c@kernel.org>
In-Reply-To: <20260115-exportfs-nfsd-v1-15-8e80160e3c0c@kernel.org>
Date: Thu, 15 Jan 2026 20:26:31 +0100
X-Gm-Features: AZwV_QgHlhd5AJtx9A_oESS7w6U6eCWyUuqrhH3MyU474xj2Kq62KuhGZ4o-aoc
Message-ID: <CAOQ4uxiTE+8r+F-e91cg9wZY-fjZfSHHOeLk3RWb+2JQQZvbvA@mail.gmail.com>
Subject: Re: [PATCH 15/29] smb/client: add EXPORT_OP_STABLE_HANDLES flag to
 export operations
To: Jeff Layton <jlayton@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Fri, 16 Jan 2026 08:22:04 +0000
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
> Add the EXPORT_OP_STABLE_HANDLES flag to cifs export operations to indica=
te
> that this filesystem can be exported via NFS.
>
> Signed-off-by: Jeff Layton <jlayton@kernel.org>
> ---
>  fs/smb/client/export.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/fs/smb/client/export.c b/fs/smb/client/export.c
> index d606e8cbcb7db2b4026675bd9cbc264834687807..c1c23e21bfe610f1b5bf8d0ee=
a64ab49e2c6ee3a 100644
> --- a/fs/smb/client/export.c
> +++ b/fs/smb/client/export.c
> @@ -47,6 +47,7 @@ const struct export_operations cifs_export_ops =3D {
>   * Following export operations are mandatory for NFS export support:
>   *     .fh_to_dentry =3D
>   */
> +       .flags =3D EXPORT_OP_STABLE_HANDLES,

Kind of odd to have this here after the comment out of NFS export.
Maybe add it inside the comment...

Thanks,
Amir.

