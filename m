Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 40B6FD2DEFC
	for <lists+samba-technical@lfdr.de>; Fri, 16 Jan 2026 09:21:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=lrPbqnzgCOvE5NgsFSOuHcaOEuIUQeGDqGbHFIodw8A=; b=co8cVpiex7AeJVnW9uurUbqgJh
	e0Mq7JIx71PPPgY9o6HkDdIup5srzzMbHdSIZ1GbHZCTOsNr506fxoGE7IFyoaUT//LtW5e50Z0h+
	GTpeUoU/nJ80AOLNVDjCrzEt8lVqd5e682uzTngC4X4xpOXTlp11J97FvtzQX2QY3rUqt6Dv1dM87
	D7r3QAEAFcI64j2C/QDal1MinN9+gBB6ebyO4gNK/8l4Oh6ZXjxah5cAejz0AJiCEmvd45CjbOv9B
	qpVoMHzMgCTq2Ipwq7hET3WrTqRn3CJu6NKd1sF72NE6S19XRun/chalXmrMeDHg2KTcKZwQ2Ny0a
	Ghyzuwdg==;
Received: from ip6-localhost ([::1]:48600 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vgf4h-000Dhk-3q; Fri, 16 Jan 2026 08:20:55 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534]:60752) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vgRum-000C9a-0L
 for samba-technical@lists.samba.org; Thu, 15 Jan 2026 18:17:50 +0000
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-64b9230f564so1674494a12.1
 for <samba-technical@lists.samba.org>; Thu, 15 Jan 2026 10:17:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768501067; cv=none;
 d=google.com; s=arc-20240605;
 b=Y+cfmYuzqNIZtvOG/vY1nS4CeG4VcHcjQlzO0JRi4SgwgQooyM16A6zYTF6yVgM+2n
 zO9d/NQcZoX67QjoDmxFGaHJGYyP06IkPokSEyiRaVuYoe1HW2PTy/SI7BwkLjJFDpiP
 rUxq2Fn65YFnrGHN9m/SqwXeq2O2LhFl/0aIVS9rjzie1GGj75TcBmxUlkpsLZgFPFI6
 rtnXjUgj54WjLREQDM+6WBr32+3KIYDWxmQ1MGAxYYWGdd+acnzgs0U1OkA8tvl2GWFN
 6A8ftwfIb+XnAB82qA5O1uT2dzu+moqcg78nltSntJAascahvJUvKH6P+kq7BRJP54ty
 PQLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=lrPbqnzgCOvE5NgsFSOuHcaOEuIUQeGDqGbHFIodw8A=;
 fh=Dw251b3kOoRUsuDtRdP5vwmW8uoJ13UrQdxt8jiFCt8=;
 b=MvjSx4gfHsUPHn9myLMMODZKsqD7W7civK+mzJjPEbgn8HKYUddgOavPbprhc5ZBNX
 Phl0RBCl3k/p/bGSpMp0hh3Wa8qMj0VFn5p9UjMf/LrPojX5eywed+NBFOu98kgGf83c
 wDYy9LrAtmV57UKxMiLF8JZOH9XzjYYR9kL3wby6beui2/v5NqfYHmKSQYX4mvUNQ17G
 TboJEEmcxu4ghYa6Rnk+xo0y7FP/QEIzfRSNP7GmtMSJuBrvAyw/gmJrD/4UkA/lbuKo
 mWLQeVLy5drrrXyJrEtPAkwAWJrdZrTc2WPQHYU03mKW2Yclb4JnRWFGKFmEMRqafE5X
 zUcw==; darn=lists.samba.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768501067; x=1769105867; darn=lists.samba.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lrPbqnzgCOvE5NgsFSOuHcaOEuIUQeGDqGbHFIodw8A=;
 b=KAEmQSLLvxvBihOtcTyWep/ZIo5sCqJTY6PSNY2m7L74BhnQnPqT8rjr+stP+sR2AK
 0GzwRXCGJ9mxAdrlos39STFg3BmfOKxW+y3NCGVHF9oQ4+EpEn6NYtZ8grDOHh3ryFVM
 O9zyPORla0IVmGBQAN8Df0y66vY04Y41vvMGjLYfp/6MpfnRfAmUk4/mhi9A2NHcfwUy
 4WfasYdS7ZULbedlQF4lYh6pSQ0QYnU7RvuPGb7MJ7t1nBBQOGqgj0togH53NYgwgYIs
 MGgdAhJoL45UTiwF0eVwMB5FUSGyVhs20TqeZcx9nrHEwAtplhM8ZoiIL++mZjSPrugr
 WwoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768501067; x=1769105867;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=lrPbqnzgCOvE5NgsFSOuHcaOEuIUQeGDqGbHFIodw8A=;
 b=PN4DWC84YYTySQ/lgPtH9SRsF7uV06DG+OgpebcPKW8ZpQR5+1xqhqO5JEVxzAeARJ
 puR+8z9Qy6w5F2DWeXpf3cbisWLYGmk1OnVxs6MkCasstiK0vrmgy9TNQ8OUOzBroRpC
 xKYYBJHSRSrkFM2FU/s+yDarrlL30h0Md/6iv2mp7I+EMUBsKPWtfHxCwIw6FsH+LnTA
 MLHC2TyEah6VKccHKnclK+EwQc6sbLuKtxMkAylvL9ixTFUSZDcV+DBd3IYasrq/r+sG
 0NOZEDjUW+G46kuiOy2a83LE+cIdmmqVRPAd+x60RZi1VrNquRasDALLMBvq9xz0Lv5+
 0TzQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXh/JdJ6nO+rENeQ8plBR5WmCPJzsEZE07uwgLJMT6jEAlPPXGBFPaWbiUNG9xIQShGgBqkQ7zUDwd3wsaXq6c=@lists.samba.org
X-Gm-Message-State: AOJu0Yx0Nqi85W8HHbYeOaPGs/PSR8Q59+MaQMvsJprHiV4CgwW6i/gN
 MYHSAUwpQ2WBCLs7+JmgLi4exH64oGqEVkLUuIIuikQq9ZRBYmsaqLP7bxOby/AXO9lFDQJ4YxB
 CqIFxNYMnNKqmjHprb78i3ZZDuGdY4QI=
X-Gm-Gg: AY/fxX51lqLBqvDQUFj9A5SknpmezhVFWoc+WVTyEe6MCnh84maLOftGME3GTcbSc1S
 dWF++sDXrD3JJfB2+d/OtTQ/SVxLGU0SRXPKYlyFuqrfbMtLb2jWscpHX+4g4244FFCP6TXSiHF
 W6h39BIKob5oLXs1ibTkWxfYTYKfObm15q3TslXSMZUr4dxF7kk60vVvSlBnlCgYjBcBgsAJna9
 szkKp39HTT+/uqYAik/Vqs6uRz+SnvGb6rj772z0rngXL3MEYcKKWVXpWpEsktD9Y+sArOzMN7L
 VT+R72uErYmMvoKDOxJrmh14c/iBPw==
X-Received: by 2002:a05:6402:510f:b0:64b:7eba:39ed with SMTP id
 4fb4d7f45d1cf-654525ccad4mr346097a12.13.1768501066374; Thu, 15 Jan 2026
 10:17:46 -0800 (PST)
MIME-Version: 1.0
References: <20260115-exportfs-nfsd-v1-0-8e80160e3c0c@kernel.org>
In-Reply-To: <20260115-exportfs-nfsd-v1-0-8e80160e3c0c@kernel.org>
Date: Thu, 15 Jan 2026 19:17:35 +0100
X-Gm-Features: AZwV_QjhT3ZtgvkbHJB7796GEklGCbcNDL5CeRwrn_YYeN3X8FqPO-3_iRnRORw
Message-ID: <CAOQ4uxjOJMwv_hRVTn3tJHDLMQHbeaCGsdLupiZYcwm7M2rm3g@mail.gmail.com>
Subject: Re: [PATCH 00/29] fs: require filesystems to explicitly opt-in to
 nfsd export support
To: Jeff Layton <jlayton@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Fri, 16 Jan 2026 08:20:53 +0000
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

On Thu, Jan 15, 2026 at 6:48=E2=80=AFPM Jeff Layton <jlayton@kernel.org> wr=
ote:
>
> In recent years, a number of filesystems that can't present stable
> filehandles have grown struct export_operations. They've mostly done
> this for local use-cases (enabling open_by_handle_at() and the like).
> Unfortunately, having export_operations is generally sufficient to make
> a filesystem be considered exportable via nfsd, but that requires that
> the server present stable filehandles.

Where does the term "stable file handles" come from? and what does it mean?
Why not "persistent handles", which is described in NFS and SMB specs?

Not to mention that EXPORT_OP_PERSISTENT_HANDLES was Acked
by both Christoph and Christian:

https://lore.kernel.org/linux-fsdevel/20260115-rundgang-leihgabe-12018e93c0=
0c@brauner/

Am I missing anything?

Thanks,
Amir.

