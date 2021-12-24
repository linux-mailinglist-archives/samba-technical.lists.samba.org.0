Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A30C47EFCF
	for <lists+samba-technical@lfdr.de>; Fri, 24 Dec 2021 16:16:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=Kl0YYPYD5040RHk8tdUC5mMa6Ge8dZ75v7xiKZepmfQ=; b=lZHxMIu21UOxSiwSLnruw/k2tW
	S/QvDARElU7u2Oa5L/BnGMuWRbFLInxD6z6LGQMqYPVyVLm6DXQoZgfk21rp3fCjsfbE0BEcSJCNY
	V5ETDoqmeYV+vMMfK+pnvm4Il16JcIc5o0JPPCOE52brMGiEL8IMzyHywjIMwH74xMEHF8qdulm6X
	YkQeLkcawq827KZK2xLkVprluH2t8Q1bGGNI3e3+HgBRRQgbmOh0b9VY4kUUOMq330ioUj9dyq0kF
	XdAWsl+XA5kNlvQholsRyFIQbm1BEBFBtC3/BgOg0IPQag6g9YfdWvrlQS/NlaK9mE9+TB8qL/Tgh
	eWXM/QKg==;
Received: from ip6-localhost ([::1]:56550 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1n0mII-001ljA-Dy; Fri, 24 Dec 2021 15:15:42 +0000
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d]:46051) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1n0mID-001lj1-Bt
 for samba-technical@lists.samba.org; Fri, 24 Dec 2021 15:15:39 +0000
Received: by mail-lj1-x22d.google.com with SMTP id h15so973610ljh.12
 for <samba-technical@lists.samba.org>; Fri, 24 Dec 2021 07:15:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Kl0YYPYD5040RHk8tdUC5mMa6Ge8dZ75v7xiKZepmfQ=;
 b=TdibYtwGxEk3xJK5BKqfhxRSGn0kwEs7mi3sd9Jwqmtyjdc1pHJFynRD4PJjvY+o2K
 +6uRtu+hvwIv1fxKIUHmqsipqsxFNm2zp/7DK3W03gdkUmjlG8oTh7zBand97wfsAmfo
 bhL282nL7UGVtnxGVhMmTRzzw+xSqXPMeBPBzzbkhxhCdFQJQTMbT3hgXchHZEGvviff
 CX7G0ONo96bzdxQ5bSPdNR5ZADZu25z7X1dIkc7JVb7MhiYmCQOlqAp8ONlRGRgoWcbw
 vrk1c15Krp9maIduMTMEvoVV/y2iKaaN6eUlIZV10p66RMzYQb8nD/5qfcWIktZAk2FD
 aZHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Kl0YYPYD5040RHk8tdUC5mMa6Ge8dZ75v7xiKZepmfQ=;
 b=bsnnhGgd4Nk0LEQfdlZrROtyO6BA5i4Sz68zvt+GFxbGMZ7FXrYWsb/RQsnHt+IXEm
 Mn0WngZTTnowa/1yS/noRZVH/BfnoKqS7Zr7+yAN1ognLVX7oW+/iGgJcL89vuITJpiO
 ETXZMhXeLrjAoB20Gyf8dz/Zr1XmGbQKjP8JG7YVOnyOeAJ8FxAxaRp23D80V1VyPi1F
 kOHuWFhtOtOMeiixHYU2DjounAifl66lpqe7Ilo3K5O3HUS+GkxwFsGn6FMPnI0GyGS1
 pEV3lpsbfmiEXRybUxwQ9zmhgi1dlO+av7v22RkEsoehAXmbdt3+4UUVsFoCb12/FBeh
 5Enw==
X-Gm-Message-State: AOAM531xSsugYmj8uYAjJ8OwbLrZs55VOMIeyqXkRcYN0uXI8/u++HP3
 vqxV0FDifRX33Yyl/30yvxBtVr2/sR3ol819aGk=
X-Google-Smtp-Source: ABdhPJycFT6tNzlLJNgcf4f6fB2GoEbU/rKg+UQBbjMijLF4lW1jPgAVwtQvmTSu8G8DKZfefm2uQkyCSQCjNU8xRwY=
X-Received: by 2002:a2e:9c8a:: with SMTP id x10mr2384131lji.209.1640358935120; 
 Fri, 24 Dec 2021 07:15:35 -0800 (PST)
MIME-Version: 1.0
References: <20211221004809.213602-1-colin.i.king@gmail.com>
In-Reply-To: <20211221004809.213602-1-colin.i.king@gmail.com>
Date: Fri, 24 Dec 2021 09:15:24 -0600
Message-ID: <CAH2r5ms_VWd6WEh6c6ydfF0it+xdnS9YJL02RwN-baVzdiHmQA@mail.gmail.com>
Subject: Re: [PATCH] cifs: remove redundant assignment to pointer p
To: Colin Ian King <colin.i.king@gmail.com>
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
 kernel-janitors <kernel-janitors@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>,
 LKML <linux-kernel@vger.kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

merged into cifs-2.6.git for-next

On Mon, Dec 20, 2021 at 8:01 PM Colin Ian King <colin.i.king@gmail.com> wrote:
>
> The pointer p is being assigned with a value that is never read. The
> pointer is being re-assigned a different value inside the do-while
> loop. The assignment is redundant and can be removed.
>
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---
>  fs/cifs/cifsfs.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/fs/cifs/cifsfs.c b/fs/cifs/cifsfs.c
> index d3f3acf340f1..61091eed8c65 100644
> --- a/fs/cifs/cifsfs.c
> +++ b/fs/cifs/cifsfs.c
> @@ -775,7 +775,7 @@ cifs_get_root(struct smb3_fs_context *ctx, struct super_block *sb)
>
>         sep = CIFS_DIR_SEP(cifs_sb);
>         dentry = dget(sb->s_root);
> -       p = s = full_path;
> +       s = full_path;
>
>         do {
>                 struct inode *dir = d_inode(dentry);
> --
> 2.32.0
>


-- 
Thanks,

Steve

