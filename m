Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id BA53C505AF4
	for <lists+samba-technical@lfdr.de>; Mon, 18 Apr 2022 17:25:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=Yzd0k15jNINm7t4OGuekyT5hbYKK++UP5qlxCZTLqZ0=; b=BeJTJDUxgctrUY/SKg0GvPkXc8
	/9l682+Tl+F2lby0KLCEJj3rxe6658pO92Q11mvWI9wFEvB4EgHlECOMmYGl+KVRuTxYlhiE3gTtx
	XRYY6hfcYKay8q4bfR2S3A1ds0HlZwXFzFivhkMWj96OF0sDPI8xnuwow3B9wFQNpk1hGsX4Njv/P
	35u3ejO4brtjIKCPnTRRwc/mTG9iHWvdSBmjKH+kkbakvP3II893pZy3Y1N/kCHs5t7aJt8sMFyfE
	656JhmErjGd8NWIbbR98rMTAmD4tO14jqlLQW0bHL7Y3OiYvUQKxWc3ZT7/JYRkdQ0es1gofGaa7J
	yjyIngfQ==;
Received: from ip6-localhost ([::1]:35232 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ngTEm-000zjM-AV; Mon, 18 Apr 2022 15:24:24 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135]:41640) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ngTEg-000zjD-6x
 for samba-technical@lists.samba.org; Mon, 18 Apr 2022 15:24:20 +0000
Received: by mail-lf1-x135.google.com with SMTP id u7so24655035lfs.8
 for <samba-technical@lists.samba.org>; Mon, 18 Apr 2022 08:24:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YJ5orj/h/+rXwxZkntbKNBvXI7gDlNOHT4bfU1S9Ucs=;
 b=N3waM9fFKcrVZAjojYbywbeeNxOI+Ex32YoMWiwo4sfBFeLpoH7dM7ezO0usD4bRlZ
 z03aQ0IlfK5fQ+PBPqivxUwdwrPjoz2STJy8y9paK7D3K9LAVqxMGhm9RI8IeE3O8/JO
 Vq6JK7vmNCih7mAcy5uGXGT85Cw9SPtXAXxKHHI47EBkEaU79EDljv1WZFHt55ulqiGh
 /T4GPof+nncHLyEn8NCjvch5rmE4dALNSnpLIvVdd5kIMFPqCMRCVgk9r6Q7e0fYthrt
 SNEteNwlyPVqOJ72qZr/MBGmj/jthhVJt/fjvjWRjpS/DifqxYMTL+dPJrXqo8PK+yZ4
 W/nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YJ5orj/h/+rXwxZkntbKNBvXI7gDlNOHT4bfU1S9Ucs=;
 b=LLRR3OX9wQ36XcBWMMqeLs8ki05sv3JTlRKSxrvRwskucfYRnH+uv+FbJ9ay6vfmT4
 Uekp9FSG4uXcTXG6NKD/3VL9FH7Gt1sCD+kqmJHfxIDdSeUk2Qp1mKB8+5VPkQMVWYd3
 fvV0ahNFePTYOLRh+thyIe7EzQ4jGsgmUyAKBlDYMHQFoRUjqclaOnTLhqvvZC5DsGJi
 mC5J0SEIc8YL5tOmgOh10rFuLCxDnBsCV822OAeixTRVdWnqijynwizZA7EYWr/r6q2a
 Z93eWeq9ZwONRvTlojEdyJPbSkbVxijrv1deoxn8A6uTCGqN7B5niEWD7+L5icrLs4aL
 oXhg==
X-Gm-Message-State: AOAM533XD9P/fM/zWWm/EfV0XUmnjp6GgJ2QvU0EY8XgCYOUYgigrBLM
 u9TvPHUopDWD4eyxAabh1haZvVpenYR37v/vq6I=
X-Google-Smtp-Source: ABdhPJzqkQdCO5+oTr4ZfY6F5Ru2S6JxhWYFpv+1E6+jm0pP5lZHjNWARbXLIqJykTHDP+bcbVME/1IwMNeukBew2sc=
X-Received: by 2002:a05:6512:3f0a:b0:46b:8942:2f3a with SMTP id
 y10-20020a0565123f0a00b0046b89422f3amr8078377lfa.667.1650295453380; Mon, 18
 Apr 2022 08:24:13 -0700 (PDT)
MIME-Version: 1.0
References: <1650277586-31431-1-git-send-email-baihaowen@meizu.com>
In-Reply-To: <1650277586-31431-1-git-send-email-baihaowen@meizu.com>
Date: Mon, 18 Apr 2022 10:24:02 -0500
Message-ID: <CAH2r5muYBE+c-cbYFSgBoxHy3PgJ2DwJ82Uv2a0hj2BoEo_=Mw@mail.gmail.com>
Subject: Re: [PATCH] cifs: Use kzalloc instead of kmalloc/memset
To: Haowen Bai <baihaowen@meizu.com>
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
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

On Mon, Apr 18, 2022 at 7:39 AM Haowen Bai <baihaowen@meizu.com> wrote:

> Use kzalloc rather than duplicating its implementation, which
> makes code simple and easy to understand.
>
> Signed-off-by: Haowen Bai <baihaowen@meizu.com>
> ---
>  fs/cifs/transport.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/fs/cifs/transport.c b/fs/cifs/transport.c
> index d9d1c353bafc..c667e6ddfe2f 100644
> --- a/fs/cifs/transport.c
> +++ b/fs/cifs/transport.c
> @@ -464,13 +464,12 @@ smb_send_rqst(struct TCP_Server_Info *server, int
> num_rqst,
>                 return -EIO;
>         }
>
> -       tr_hdr = kmalloc(sizeof(*tr_hdr), GFP_NOFS);
> +       tr_hdr = kzalloc(sizeof(*tr_hdr), GFP_NOFS);
>         if (!tr_hdr)
>                 return -ENOMEM;
>
>         memset(&cur_rqst[0], 0, sizeof(cur_rqst));
>         memset(&iov, 0, sizeof(iov));
> -       memset(tr_hdr, 0, sizeof(*tr_hdr));
>
>         iov.iov_base = tr_hdr;
>         iov.iov_len = sizeof(*tr_hdr);
> --
> 2.7.4
>
>

-- 
Thanks,

Steve
