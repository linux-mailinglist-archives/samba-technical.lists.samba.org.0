Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4353C2F9023
	for <lists+samba-technical@lfdr.de>; Sun, 17 Jan 2021 03:10:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=skWXKBO5JylLVb0KSTuDJa6QX2Cc1e4g3gSH2v4DxRg=; b=eeAHTUnh+DZzm+R/sRaUe4srQN
	oIDcloBLSuP+eIcXCh8aUvArE52WchHNAWQu3cV5qWKg4tceZw99IuXka6s/0CtLd3dCKDwfeS56g
	TeIGIiuKegvag0YLYgzDZKS+qRe5/9Q8AadWyJVE1Ob5XVw7uc0XdLE/77RhUhZE5Gi9bNlX0vMXv
	e2QikCZt9KmqFuGo7LMCa3N3r8CssoqeA22tSis3q9sEcfyiwR7uJ6O5MQ3Lhw/walgxaJD0a+mc8
	uXR+7fMXLUWcEOeQ4XJUhU+LE7vY7snZ1V/T8vmf9gwzuiewnbLRMy4rnfEFSuwOR/bKv0X+MQQ18
	bnoG+TCA==;
Received: from ip6-localhost ([::1]:21488 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1l0xV8-005xQk-J6; Sun, 17 Jan 2021 02:09:10 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b]:44370) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1l0xUz-005xQd-Cs
 for samba-technical@lists.samba.org; Sun, 17 Jan 2021 02:09:07 +0000
Received: by mail-lj1-x22b.google.com with SMTP id m13so14536152ljo.11
 for <samba-technical@lists.samba.org>; Sat, 16 Jan 2021 18:08:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=skWXKBO5JylLVb0KSTuDJa6QX2Cc1e4g3gSH2v4DxRg=;
 b=lGDUe8UHP0tJrQFAELz/00Bcig9hZeH+CjwnZm7QMQilWyHAL5S6z9E3MH8ywpW8/Q
 yTix1+LjyYNicCEin6/cXsvIKtGlR2N7w+5KRPSbgegwCqC4eSu4LGoYlc0fyyKIuwQd
 7nkkexJxhCMXIe4hSozC6mfAGhhBrb9GPBje7GCS92FJKdlaERi1G2DRRCPKZ/MFiGCd
 vbozIrNco1jxdIJ7CS/yHBm/jcffv1jrfUgP9521lahbDsQPkHFZWAYoGcFkSPZnQRAs
 WlhUmKhfrbxyTDyrK3ob2/xb83HbN8lunmj8q8TPFGXpRgvhi5tdZuP+D1bWcYDrcAal
 JU7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=skWXKBO5JylLVb0KSTuDJa6QX2Cc1e4g3gSH2v4DxRg=;
 b=oSMafYUKPeqZnEIburC9Ip2FldyPKTIJcIfi7/wskDJdZVfooZ1BjAYd7jk0GtLkNh
 zOFlhRAb4yDz3rOnkneiwM4KBbglhsMqeJaReMDdA2/Y2S+1BwO7Y4GaiID0SUav54pe
 NIqxU694jk2sFALeZqKjCrK3PKKRMrT1K/QiLYvfGtozaZ8KWAveIHo8KlYWy5/f6qxQ
 rkFnXD6SgouHonHnp36xFdaKKSzGnzHlWyroPvfk6VIXoO44B6ypJgqkmgOGCGRAwMKW
 xxsPtg1h+cnXkf7z/7pVEci83zjVwx4VyUU+LMazNsurTKwhzcxPVJLAbE5rkSwDa/75
 VVkg==
X-Gm-Message-State: AOAM530Aihfjqo/6m+HtLN0BYlVjwGlLYzcmekSPYJZ3XTw/+HlBJKfs
 YJhoIQMj96o2UcEsktsVnmvLzKFoaUsYR3E/uXM=
X-Google-Smtp-Source: ABdhPJzpUyLDd6N64NHll1kRS/L5CQKVrYgGVoDeJNNMJChZbmNzVmFgNOVeENBYpjjcSZSNkfAcPZ46neM3oye19Ao=
X-Received: by 2002:a2e:6a14:: with SMTP id f20mr8486556ljc.6.1610849325438;
 Sat, 16 Jan 2021 18:08:45 -0800 (PST)
MIME-Version: 1.0
References: <1610615360-70523-1-git-send-email-abaci-bugfix@linux.alibaba.com>
In-Reply-To: <1610615360-70523-1-git-send-email-abaci-bugfix@linux.alibaba.com>
Date: Sat, 16 Jan 2021 20:08:34 -0600
Message-ID: <CAH2r5mvTuu+dfTgE_zhBL5Sa1BiZ3UT=fdd79J99b36Dcjn2cg@mail.gmail.com>
Subject: Re: [PATCH] fs/cifs: Assign boolean values to a bool variable
To: Jiapeng Zhong <abaci-bugfix@linux.alibaba.com>
Content-Type: text/plain; charset="UTF-8"
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
From: Steve French via samba-technical <samba-technical@lists.samba.org>
Reply-To: Steve French <smfrench@gmail.com>
Cc: Steve French <sfrench@samba.org>, CIFS <linux-cifs@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>,
 LKML <linux-kernel@vger.kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

merged into cifs-2.6.git for-next

On Thu, Jan 14, 2021 at 3:11 AM Jiapeng Zhong
<abaci-bugfix@linux.alibaba.com> wrote:
>
> Fix the following coccicheck warnings:
>
> ./fs/cifs/connect.c:3386:2-21: WARNING: Assignment of 0/1 to
> bool variable.
>
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Jiapeng Zhong <abaci-bugfix@linux.alibaba.com>
> ---
>  fs/cifs/connect.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/fs/cifs/connect.c b/fs/cifs/connect.c
> index b9df855..8fbb5ea 100644
> --- a/fs/cifs/connect.c
> +++ b/fs/cifs/connect.c
> @@ -2195,7 +2195,7 @@ static int match_tcon(struct cifs_tcon *tcon, struct smb3_fs_context *ctx)
>         if (ses->server->capabilities & SMB2_GLOBAL_CAP_DIRECTORY_LEASING)
>                 tcon->nohandlecache = ctx->nohandlecache;
>         else
> -               tcon->nohandlecache = 1;
> +               tcon->nohandlecache = true;
>         tcon->nodelete = ctx->nodelete;
>         tcon->local_lease = ctx->local_lease;
>         INIT_LIST_HEAD(&tcon->pending_opens);
> --
> 1.8.3.1
>


-- 
Thanks,

Steve

