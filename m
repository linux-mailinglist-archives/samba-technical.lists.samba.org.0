Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 72BAED2DF1D
	for <lists+samba-technical@lfdr.de>; Fri, 16 Jan 2026 09:22:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=1HpNW/ml4xLa7Q+ZYoOd6NCigBelaQL2RtJ0aaDh9mI=; b=FBP1kUjih2aILVZVdF6uAkvb+6
	N07sqoL1x+EgHEq1so0hpkqHueglYspGmwOi1lnMa/ZeQejuu57ADYG6+Pshr+midGTmpyP7gpYZr
	HOAa4sSdEbOkVzmvcNUL/OHIvvGAnhgjJxiETSjGLMvc5OwPT7mB8/11CQcqDj4u+h2GhNm6+X6mZ
	7vCNCyr53nUwNY9IqiHkNbGa6c2+zqe5mFfVpgLO+mSvIBSiFEijUxyHnAn3ASMoFmsuOW0BiuHpP
	QSzJ5uZpF5s9muBDAXql6AtzoPdZ37sjCsi60nvZKP0fNIL1Idbv3lKjBN3DMigbMoTqhE7ecgyJ+
	RRmv03wg==;
Received: from ip6-localhost ([::1]:27658 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vgf5n-000Dr7-4E; Fri, 16 Jan 2026 08:22:05 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:44514) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vgSwM-000CH8-Ch
 for samba-technical@lists.samba.org; Thu, 15 Jan 2026 19:23:33 +0000
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-64b58553449so2208119a12.1
 for <samba-technical@lists.samba.org>; Thu, 15 Jan 2026 11:23:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768505009; x=1769109809; darn=lists.samba.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1HpNW/ml4xLa7Q+ZYoOd6NCigBelaQL2RtJ0aaDh9mI=;
 b=YHYPFCwvQ4D+D77caEWunbgFa1lX2IP2z845G+ikaToF5QYHZZimGi85nh0VOXcK08
 AkGDfuKq1SzN+n7hAoPLg1OhQWWUA+fZlmSxMV7G2g7BKJlPKohidzDncO5jp0sxvoia
 7aPQ4VjIh8sF7IhkJqqSzVkZRU3ESxFxQ7PiRcalIobuEm9xnYd3XxY19m2ONU86NhgV
 LoRl4Bubx13oB4uEkV5J545tCK3MD+dmItcYuOAp7VLvXSsLTzWNCND7Kx11qILJ6gWb
 jMQUHfrzHtfJKeo7ErPiCNopjz2eDwOA+Hm/NOuSPs0+vKJSotRoP4+9IFt4bEYiLOaY
 2/Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768505009; x=1769109809;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=1HpNW/ml4xLa7Q+ZYoOd6NCigBelaQL2RtJ0aaDh9mI=;
 b=Vvjtqjg1oI+01ZdoHgux7w+MKdGLors3CSkzDYBKA8eKD8OicunTPvm07QPHco70OW
 yeGKX7e6Bm9GrHm4BUXounjFPrn3n84fBzGC/OhrVV30tvNqhNKyUmaFRIiXjPvejXsX
 t3zybs/Ur7wA/ycpnguuJ3fIEic/4uzZTngrsM71WEHlDWFDeclAvtWKH9X2KJFl1xv/
 bfIc2GbXS9p53Pe4aeHN3Yzr+TEUqQFybOz8eLusSGJSI1JWrVD4iS8vyg+2MyiR2SDh
 Zd5ojyTCLi87Mqpza95ayXC1Xz1pkjD58uNVf+Xyun8fzDVrmA37t+8JYSv+ffNcDLUj
 W7HQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX+8deb2VJHPYvv01WVzWlnGKWyGeBb5MsOBGRQlq4J/9YnXKVAH+l0Saku0yXgTEN0SG/64/WkpHpYkRm05JY=@lists.samba.org
X-Gm-Message-State: AOJu0YyGYw00uRssksTHnhIMERN/kW9bcZhPABMKiLQ/ibKj4pMMQP9A
 /mcKu6BygmIlQR9gmdpcnHsQCNf1FKoNLXYReA3lv3kZcj8DDhOInNX3O3Ilq21WK+hvVE+go85
 7pRSi/+SLIyprUhkY2PW2WbBfEc1UDHE=
X-Gm-Gg: AY/fxX5mcacFMIPy6LfzzLq7rapfDtWe5FKchJkvfOeYz3s8RJF6nMxQx560we9HEf9
 yQ2o82sx+GJucsA8N8dRL/LsNOZNb6MyoeLGfdEI06EI1FPYuqixnhPdTxBg8WC4IM7n7kJyXic
 ZSbmOE0BwCbf7cdSR949Dw3ncOIhasEvAKn6f0I32Wg2gtSdh5JKc8y6UXg4/F25C7Imk99tCnW
 98mQgC2w+5OdHPEvgZWc2LYKp2CwYz+Qipa+2ppHoFkYbqSD+xZ5mZ5bq+xNC4MoRMf2RFSQWvC
 zJDOv23dBmbKMXp7xkzLNUTx/P3f2g==
X-Received: by 2002:a17:907:3e97:b0:b73:7c3e:e17c with SMTP id
 a640c23a62f3a-b879327e30bmr63085666b.44.1768505008810; Thu, 15 Jan 2026
 11:23:28 -0800 (PST)
MIME-Version: 1.0
References: <20260115-exportfs-nfsd-v1-0-8e80160e3c0c@kernel.org>
 <20260115-exportfs-nfsd-v1-29-8e80160e3c0c@kernel.org>
In-Reply-To: <20260115-exportfs-nfsd-v1-29-8e80160e3c0c@kernel.org>
Date: Thu, 15 Jan 2026 20:23:17 +0100
X-Gm-Features: AZwV_Qj21qC7f0_83CWGwxMbCuhLisWPoHuSIOsZGqfnrVByhBJVGvUqJqXdQ-8
Message-ID: <CAOQ4uxg304=s1Uoeayy3rm1e154Nf7ScOgseJHThw4uQjKwk0A@mail.gmail.com>
Subject: Re: [PATCH 29/29] nfsd: only allow filesystems that set
 EXPORT_OP_STABLE_HANDLES
To: Jeff Layton <jlayton@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Fri, 16 Jan 2026 08:21:29 +0000
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

On Thu, Jan 15, 2026 at 6:51=E2=80=AFPM Jeff Layton <jlayton@kernel.org> wr=
ote:
>
> Some filesystems have grown export operations in order to provide
> filehandles for local usage. Some of these filesystems are unsuitable
> for use with nfsd, since their filehandles are not persistent across
> reboots.
>
> In __fh_verify, check whether EXPORT_OP_STABLE_HANDLES is set
> and return nfserr_stale if it isn't.
>
> Signed-off-by: Jeff Layton <jlayton@kernel.org>
> ---
>  fs/nfsd/nfsfh.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/fs/nfsd/nfsfh.c b/fs/nfsd/nfsfh.c
> index ed85dd43da18e6d4c4667ff14dc035f2eacff1d6..da9d5fb2e6613c2707195da2e=
8678b3fcb3d444d 100644
> --- a/fs/nfsd/nfsfh.c
> +++ b/fs/nfsd/nfsfh.c
> @@ -334,6 +334,10 @@ __fh_verify(struct svc_rqst *rqstp,
>         dentry =3D fhp->fh_dentry;
>         exp =3D fhp->fh_export;
>
> +       error =3D nfserr_stale;
> +       if (!(dentry->d_sb->s_export_op->flags & EXPORT_OP_STABLE_HANDLES=
))
> +               goto out;
> +
>         trace_nfsd_fh_verify(rqstp, fhp, type, access);
>

IDGI. Don't you want  to deny the export of those fs in check_export()?
By the same logic that check_export() checks for can_decode_fh()
not for can_encode_fh().

Thanks,
Amir.

