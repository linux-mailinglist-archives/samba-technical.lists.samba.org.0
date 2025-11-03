Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 26574C2C0E9
	for <lists+samba-technical@lfdr.de>; Mon, 03 Nov 2025 14:25:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=0S6+1dUVKvqII667r+XW9/GENl1vb5Sqoomw0mlu3RI=; b=JXE2TNIVvvGYTo51GIlMOrfv8A
	/nnl3tE941DGRHkKcI7VnGbwW5GaW+fO/lysidGnK0ExZKzXZZMIO/dDIDtkeHh1f3fQxvuesK0gh
	HRctKmxuFebIwUB9vX+TcX4fYTPVPJHtBIeWo/7rDQ8r6BHBZ86OXQVSqW/qkV5Y9kWaC2YeFbHTE
	sWHJ+DibbXBJO5yFz7Wqrb5SWsQ67o+KPVNkRMz7zdXsGYOjqMLsewa4FyZl1R/Jj7/gibgxqBSgH
	++LKXSFL+HJ7zbt+8YcJRqR6UM96Hj4z90PtcN2JpoKRZaIL5hYiPZkKrfDHVPfOh1oZ0/ChLyBd8
	sxDcvsNQ==;
Received: from ip6-localhost ([::1]:45210 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vFuXu-00BLia-SR; Mon, 03 Nov 2025 13:24:30 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:44172) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vFuXq-00BLiT-9H
 for samba-technical@lists.samba.org; Mon, 03 Nov 2025 13:24:28 +0000
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-b3c2db014easo919979366b.0
 for <samba-technical@lists.samba.org>; Mon, 03 Nov 2025 05:24:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762176265; x=1762781065; darn=lists.samba.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0S6+1dUVKvqII667r+XW9/GENl1vb5Sqoomw0mlu3RI=;
 b=k1Mle3APc1t2AVoS8JJpmw82yBNTZ4SnyLp9svq33FMsDKSHEegdKS1/0feTUR2yvv
 Z7LlXozT01qYFFBt2ZDB1tiHGjYwKAHEJ7hY1pkYp8No3DYgkQDyTp88ZbDfy/Kl9eic
 OYl8H3dK0AHWF2OllbJ7CKSxoEjSioZUi/Ud79eCmtHJ0bN9AGrjLSu2/wEyEPu/1qni
 kULov2/mRRxVhg5QMoADWZBkweP13l2W8r7wHnB/vzG9zdf4zWnIi/M1Hbv6I7GdrL3E
 0TcyL1zlr7+QtkNE0YsuvoI1rQNK6zb6U1QQJyGQdkeLfyF5zZBncU6v5Hj4ZihbzbzQ
 3ssQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762176265; x=1762781065;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0S6+1dUVKvqII667r+XW9/GENl1vb5Sqoomw0mlu3RI=;
 b=vozoRtfZDsK81b+wjuXfmX8NdZOcTHsNqP4Rf0GF7LQ53rz3FNMP1e8kCWGgjuN8ci
 ioVILtykHVy9uEe+FFdRc8COI1OfssCnNEmncYwMdY5nPWj7POhBa4DM/yBeUYrXSKdD
 kOJgA+gSduHQPQCfsUDrNRcTtllwo54nJI7w9I+9owbwPZTjOSCyPzdzTG1OrIrurYBw
 H2is59orwpFqUwpWAwYGGzaptGgirQi28KBHIWfIMQtPx/HNrAH5t3c+lutlAi1Andid
 r6Vbkxlu9RL77VgXZBHTqYSjfCYnZ0CVup1IK3kEUqvoPMUVoJTWuFocVJHcB5i1GqlQ
 FYmA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWQH8NMmj1p8cH0aTatQ2yPnq0XxXT3iuYoG6FUoSboC+YTju+mefUlZwwuXeLGdat2sjigMAsKI++DfxjNuqo=@lists.samba.org
X-Gm-Message-State: AOJu0YxjkPqTn8x2EV3WoBYp5Uxtf/LYshR52oSjKrZiiP6855hTudeO
 Lc+UOOjjQ1kTeO97QTa7Rl49qPv3cxlWzluzpnIH85f6TDY3TTDZuPvQZZeSy4x+XzCJgXT30xP
 +lCRXd3FLsYSNLN261QK2n61+NIVo5eI=
X-Gm-Gg: ASbGncvXrfOMlsBFinsAhr9XjOGHtUODHPYSaMBeduXbtIDnPb/WLV7DT53n8EVMjfE
 Y5qAwSCYdzzzMmyYA30eoisDAlK9n5Uw6hxFtZILSfjcLma/E3IwPwl1aneX7FPR0EmMDDZJDkn
 LqvB6EkAtO7JvhVEoNW/aVM3Rbd6sZB4gwcPWgKyP0SPvNXZHUjnbw43zuZfrPl6ea3IDJnI/CQ
 VgBha7wmvJsR5ZYHAqsZwS94AYrRNRp4PG4srDD08R0YIiRfgg54nsUDJ0sWMtqQLopQqtLtMcH
 582F004+pE4tNte/qH5eV5kYaBQ4Qw==
X-Google-Smtp-Source: AGHT+IELl7DuDv5uo3bD6NZ9q582bvS2bDMma/TtRpWZCxPhIVAv9e4H0npG+fdCye/re4SlhiT2Qy0S3M2gjGw90Ag=
X-Received: by 2002:a17:907:ea7:b0:b6d:2d0b:1ec2 with SMTP id
 a640c23a62f3a-b70708315e8mr1272156366b.54.1762176265161; Mon, 03 Nov 2025
 05:24:25 -0800 (PST)
MIME-Version: 1.0
References: <20251103-work-creds-guards-simple-v1-0-a3e156839e7f@kernel.org>
 <20251103-work-creds-guards-simple-v1-4-a3e156839e7f@kernel.org>
In-Reply-To: <20251103-work-creds-guards-simple-v1-4-a3e156839e7f@kernel.org>
Date: Mon, 3 Nov 2025 14:24:13 +0100
X-Gm-Features: AWmQ_blW2akq-ipD0fIUUOxTn8zmugUgDmTC0C57BdhrsmFigJmfJvym14MPro0
Message-ID: <CAOQ4uxhW2FiVe6XjQDT_aXhzJDyT5yuna9CVaWOLyzU1J99hFg@mail.gmail.com>
Subject: Re: [PATCH 04/16] backing-file: use credential guards for writes
To: Christian Brauner <brauner@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: linux-aio@kvack.org, linux-nfs@vger.kernel.org, linux-cifs@vger.kernel.org,
 Linus Torvalds <torvalds@linux-foundation.org>,
 samba-technical@lists.samba.org, linux-kernel@vger.kernel.org,
 linux-unionfs@vger.kernel.org, netdev@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, cgroups@vger.kernel.org,
 linux-erofs@lists.ozlabs.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Mon, Nov 3, 2025 at 12:30=E2=80=AFPM Christian Brauner <brauner@kernel.o=
rg> wrote:
>
> Use credential guards for scoped credential override with automatic
> restoration on scope exit.
>
> Signed-off-by: Christian Brauner <brauner@kernel.org>
> ---
>  fs/backing-file.c | 74 +++++++++++++++++++++++++++++--------------------=
------
>  1 file changed, 39 insertions(+), 35 deletions(-)
>
> diff --git a/fs/backing-file.c b/fs/backing-file.c
> index 4cb7276e7ead..9bea737d5bef 100644
> --- a/fs/backing-file.c
> +++ b/fs/backing-file.c
> @@ -210,11 +210,47 @@ ssize_t backing_file_read_iter(struct file *file, s=
truct iov_iter *iter,
>  }
>  EXPORT_SYMBOL_GPL(backing_file_read_iter);
>
> +static int do_backing_file_write_iter(struct file *file, struct iov_iter=
 *iter,
> +                                     struct kiocb *iocb, int flags,
> +                                     void (*end_write)(struct kiocb *, s=
size_t))
> +{
> +       struct backing_aio *aio;
> +       int ret;
> +
> +       if (is_sync_kiocb(iocb)) {
> +               rwf_t rwf =3D iocb_to_rw_flags(flags);
> +
> +               ret =3D vfs_iter_write(file, iter, &iocb->ki_pos, rwf);
> +               if (end_write)
> +                       end_write(iocb, ret);
> +               return ret;
> +       }
> +
> +       ret =3D backing_aio_init_wq(iocb);
> +       if (ret)
> +               return ret;
> +
> +       aio =3D kmem_cache_zalloc(backing_aio_cachep, GFP_KERNEL);
> +       if (!aio)
> +               return -ENOMEM;
> +
> +       aio->orig_iocb =3D iocb;
> +       aio->end_write =3D end_write;
> +       kiocb_clone(&aio->iocb, iocb, get_file(file));
> +       aio->iocb.ki_flags =3D flags;
> +       aio->iocb.ki_complete =3D backing_aio_queue_completion;
> +       refcount_set(&aio->ref, 2);
> +       ret =3D vfs_iocb_iter_write(file, &aio->iocb, iter);
> +       backing_aio_put(aio);
> +       if (ret !=3D -EIOCBQUEUED)
> +               backing_aio_cleanup(aio, ret);
> +       return ret;
> +}
> +
>  ssize_t backing_file_write_iter(struct file *file, struct iov_iter *iter=
,
>                                 struct kiocb *iocb, int flags,
>                                 struct backing_file_ctx *ctx)
>  {
> -       const struct cred *old_cred;
>         ssize_t ret;
>
>         if (WARN_ON_ONCE(!(file->f_mode & FMODE_BACKING)))
> @@ -237,40 +273,8 @@ ssize_t backing_file_write_iter(struct file *file, s=
truct iov_iter *iter,
>          */
>         flags &=3D ~IOCB_DIO_CALLER_COMP;
>
> -       old_cred =3D override_creds(ctx->cred);
> -       if (is_sync_kiocb(iocb)) {
> -               rwf_t rwf =3D iocb_to_rw_flags(flags);
> -
> -               ret =3D vfs_iter_write(file, iter, &iocb->ki_pos, rwf);
> -               if (ctx->end_write)
> -                       ctx->end_write(iocb, ret);
> -       } else {
> -               struct backing_aio *aio;
> -
> -               ret =3D backing_aio_init_wq(iocb);
> -               if (ret)
> -                       goto out;
> -
> -               ret =3D -ENOMEM;
> -               aio =3D kmem_cache_zalloc(backing_aio_cachep, GFP_KERNEL)=
;
> -               if (!aio)
> -                       goto out;
> -
> -               aio->orig_iocb =3D iocb;
> -               aio->end_write =3D ctx->end_write;
> -               kiocb_clone(&aio->iocb, iocb, get_file(file));
> -               aio->iocb.ki_flags =3D flags;
> -               aio->iocb.ki_complete =3D backing_aio_queue_completion;
> -               refcount_set(&aio->ref, 2);
> -               ret =3D vfs_iocb_iter_write(file, &aio->iocb, iter);
> -               backing_aio_put(aio);
> -               if (ret !=3D -EIOCBQUEUED)
> -                       backing_aio_cleanup(aio, ret);
> -       }
> -out:
> -       revert_creds(old_cred);
> -
> -       return ret;
> +       with_creds(ctx->cred);
> +       return do_backing_file_write_iter(file, iter, iocb, flags, ctx->e=
nd_write);
>  }

Pointing out the obvious that do_backing_file_write_iter() feels
unnecessary here.

But I am fine with keeping it for symmetry with
do_backing_file_read_iter() and in case we will want to call the sync
end_write() callback outside of creds override context as we do in the
read case.

Thanks,
Amir.

