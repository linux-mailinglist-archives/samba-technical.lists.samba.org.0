Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id C3C94D38D38
	for <lists+samba-technical@lfdr.de>; Sat, 17 Jan 2026 09:31:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=rWCEzzwQTN3Jcqg8Pr6svjg3sqJRK7qADI0E/O11arI=; b=mlNEGKVuUHFSvGfGf0zG1ED+y2
	bzIKucnXyuAZmx7BRBdMVS6iCO1e2JsHPnh9SINPP8KjKqh+TG5FQknOGAlvKQRhaZAcBV5JvZesB
	rBwg5ztYSB+yRp3A53H3PK6ucBl6LrBkdSGF5yKiR1PGqToNmL2Oy0/1zQ4k1sjyZbE+oikBswQIf
	FqDid25c6yAV7jBTaUQ7Vr2+pOgRTg8k6RNxufUjFKKqeZNZSgVsveMnRJRctwTGA7F5H0iumJiFJ
	KobtRPSvBPx6jK24uNujViJYQbux0uu1uuGxHszMLwRvPPdc5pgu9aTsplhLJhWt0OdBgryIRwKcv
	odCcYipA==;
Received: from ip6-localhost ([::1]:57778 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vh1hd-000LU5-9S; Sat, 17 Jan 2026 08:30:37 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:58678) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vgl6O-000Fv6-Bv
 for samba-technical@lists.samba.org; Fri, 16 Jan 2026 14:47:06 +0000
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-b874c00a3fcso342389166b.1
 for <samba-technical@lists.samba.org>; Fri, 16 Jan 2026 06:47:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768574823; cv=none;
 d=google.com; s=arc-20240605;
 b=Q7+9kYddD5DglFKYoU/YzIhv5uFmvv81kTnIDYkMbIPk48u8DP4uRnOL8eclhQclhC
 8oEjApfov3oS9cZsQw6OwDdQf2IuFw0bWMiqvpXgqhMBqYLC9MDO8I7jdo9yiMlweKGq
 5EGUYVYEdpDw6ewmVYg8V7d1AKKDpr9vRQOkVZQqAIUtdpkBL3b/eyLhLpjktiom3Jcx
 /Lu6xYiD/7HtsTKCqLVtsCNiJs6Q+pAS3k+Js4iW2vNrOaZF5oAvGUwwYpYu6FdIqGlO
 gm9cw7PWibyUh5GAue2AD1vDjNSEx35FrICTqRpy0NS/5VqhS5AvFLkj8nUv1yxuWmyT
 H3rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=rWCEzzwQTN3Jcqg8Pr6svjg3sqJRK7qADI0E/O11arI=;
 fh=QXMFIoIuDSoticQOPUURRdzsqv6L3jnu3+S+HBc0qE8=;
 b=P22eS0t6E2NXHKYe4HJKglFgFIwuIwWoKzMCj1KDg6ZlBl0EVqzGU3aQSpDOwF2082
 8iM0pfAF0dOQFdlTeygvXa6dnjOOSkFs+c2zZt6HUJc5yQPr1FgQ0PFQ0sdJ9jC4wHQs
 NCxBGRDsfra7EpNMFDsEZ4g4w+O6BCkbc5kxukcfdBjwS/Bsj8AHCoWCaZG3L9wi8Fjk
 hPS4KCLNdFlxc0jl3YoEf4GAkv2/VQIZgcToGotNn8nZ2hvIzcD6PIV3z5rqLA75+W2q
 Q9rxuE9qAti++tTaPE36zdfKNTWNOV1sw9CDGaR6l7qx4gHxi/T9UUu9XyGGR0pFdBn8
 ZuUw==; darn=lists.samba.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768574823; x=1769179623; darn=lists.samba.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rWCEzzwQTN3Jcqg8Pr6svjg3sqJRK7qADI0E/O11arI=;
 b=UHHQUlFQuLS5OsvT3uHHmBbw2d8IvElYRUJEYEQSoImfILyXyq+h+weV0OGNakPgii
 Lu0Cu+jahRRqvltIfVEYDLrzoOpQYeuexYSNHUw7CA2gNSLfl5zVAZ5N2PAlDQBKkB9A
 UQFzPkmaoRtFVQrc9Se26hX4JmojFQRcDCAR3xWbcPnHerG+wrNOVuB6sytDmqWeQieC
 JaDwJXzIEkVl+4uEkt6ezkDIJeUlwAUKL5g4dL61u7pHVgWg83C89jvnejRJr9kapGOX
 UqRy6HUIBBGSyUfNkc6QYBJIRkqmIlVCHF6CUSkaEjqBh1HVT3mUZQeUwn2d/BPSHkbv
 44PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768574823; x=1769179623;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=rWCEzzwQTN3Jcqg8Pr6svjg3sqJRK7qADI0E/O11arI=;
 b=WjRz0fnuUenSNmty+1glJ8ouLPZhg7dj6hO9xI+dblNoqQObTFuiwHSUrv0YSh4Kqg
 GnRly8wXQTbSCKj9bdlMfo0k2G5jZZTt9HTfJtqo0aqanKLHRtYKt30qwYCgGYn042zW
 1oq+y8oUb1iXWaBkXl/K8IxcPf20UQ0ZJG9izcWFfm5R6fGXBwbs98+Ry46ZmJcVxa8w
 QTt/XjKNS0NzBR5IZ0aOdoCiEniPohbj5y+gtQosm9s29tEuSZejIoNdMYEFFdabobBc
 Adw2GSEme5E2y++ryWp2h5M2xnJ3x7ImE88BNbO4cSGNnckSttcLkq0nYESMbEWw6N8u
 tmBA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVEqwS7x92NyMv38mpxCdghKy7+0c86H0+xvJkkyqBt9GjKsVJe/gz9+T4DFfW7vcYOwm2T4/YynVpwHs6huC4=@lists.samba.org
X-Gm-Message-State: AOJu0Yzaod1enWI7lbluk+gGmBTkkHYPfu3mvDtxn30oIAamUI5T72Vs
 Ir/Wu7yN79v5EKmzAPwSkPoDF2eSw9T3jjozyGZOQmAgi8VsvAT4wIjHQ8iNfTP+Okous8dKaAl
 8entf/9JAJYus+BT9Z8uwjrrZZgumE28=
X-Gm-Gg: AY/fxX6cexqYk8BmvzCUuJR6eccmuM7YNo2ZRUMXwlT7OxyinsYxKC3KYenr0RAOWxE
 4KWrDWmCfEfnBctMRnsF20c8ycwSMl4yoqNd6e1DkhL2OPF/oxxQCyU768/bYxYFPRxditKNpVX
 wRCGOR3boHeVnuE5UZqIz9OEwoZqJD/VzDH76vQfa+wKZ71R6gEA29+Kp6nQGoJGLZJqGWgzus2
 vCcrNLQHO1OaTjGB2QB7VkAq2r3RkQNeWxaRAnm0po++3e05cpJeEHSgsAXLLy8KZeCxh4SrLAI
 AGCdDdDkGOZ8THwD8xw0xZnCHkZ+AA==
X-Received: by 2002:a17:906:7305:b0:b72:a899:169f with SMTP id
 a640c23a62f3a-b8792d6cf8amr335795366b.4.1768574823087; Fri, 16 Jan 2026
 06:47:03 -0800 (PST)
MIME-Version: 1.0
References: <20260115-exportfs-nfsd-v1-0-8e80160e3c0c@kernel.org>
 <20260115-exportfs-nfsd-v1-29-8e80160e3c0c@kernel.org>
 <CAOQ4uxg304=s1Uoeayy3rm1e154Nf7ScOgseJHThw4uQjKwk0A@mail.gmail.com>
 <8e4c3df4828351c677186bf018061f2b1fd1b48e.camel@kernel.org>
In-Reply-To: <8e4c3df4828351c677186bf018061f2b1fd1b48e.camel@kernel.org>
Date: Fri, 16 Jan 2026 15:46:50 +0100
X-Gm-Features: AZwV_QiRcITYtWxbtRpeIxfeQr9ho0AGFQM_8wESdHA53c49E-5t7eaX1T9rC3o
Message-ID: <CAOQ4uxhkZNueydP0tTCAj6tuzKWPTYB7=JR_hb4gaavSKQ8C2w@mail.gmail.com>
Subject: Re: [PATCH 29/29] nfsd: only allow filesystems that set
 EXPORT_OP_STABLE_HANDLES
To: Jeff Layton <jlayton@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Sat, 17 Jan 2026 08:30:35 +0000
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

On Fri, Jan 16, 2026 at 1:36=E2=80=AFPM Jeff Layton <jlayton@kernel.org> wr=
ote:
>
> On Thu, 2026-01-15 at 20:23 +0100, Amir Goldstein wrote:
> > On Thu, Jan 15, 2026 at 6:51=E2=80=AFPM Jeff Layton <jlayton@kernel.org=
> wrote:
> > >
> > > Some filesystems have grown export operations in order to provide
> > > filehandles for local usage. Some of these filesystems are unsuitable
> > > for use with nfsd, since their filehandles are not persistent across
> > > reboots.
> > >
> > > In __fh_verify, check whether EXPORT_OP_STABLE_HANDLES is set
> > > and return nfserr_stale if it isn't.
> > >
> > > Signed-off-by: Jeff Layton <jlayton@kernel.org>
> > > ---
> > >  fs/nfsd/nfsfh.c | 4 ++++
> > >  1 file changed, 4 insertions(+)
> > >
> > > diff --git a/fs/nfsd/nfsfh.c b/fs/nfsd/nfsfh.c
> > > index ed85dd43da18e6d4c4667ff14dc035f2eacff1d6..da9d5fb2e6613c2707195=
da2e8678b3fcb3d444d 100644
> > > --- a/fs/nfsd/nfsfh.c
> > > +++ b/fs/nfsd/nfsfh.c
> > > @@ -334,6 +334,10 @@ __fh_verify(struct svc_rqst *rqstp,
> > >         dentry =3D fhp->fh_dentry;
> > >         exp =3D fhp->fh_export;
> > >
> > > +       error =3D nfserr_stale;
> > > +       if (!(dentry->d_sb->s_export_op->flags & EXPORT_OP_STABLE_HAN=
DLES))
> > > +               goto out;
> > > +
> > >         trace_nfsd_fh_verify(rqstp, fhp, type, access);
> > >
> >
> > IDGI. Don't you want  to deny the export of those fs in check_export()?
> > By the same logic that check_export() checks for can_decode_fh()
> > not for can_encode_fh().
> >
>
> It certainly won't hurt to add a check for this to check_export(), and
> I've gone ahead and done so. To be clear, doing that won't prevent the
> filesystem from being exported, but you will get a warning like this
> when you try:
>
>     exportfs: /sys/fs/cgroup does not support NFS export
>
> That export will still show up in mountd though, so this is just a
> warning. Trying to mount it though will fail.
>

Oh, I did not know. What an odd user experience.
Anyway, better than no warning at all.

Thanks,
Amir.

