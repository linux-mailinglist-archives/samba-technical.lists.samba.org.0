Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E9BB4D933E
	for <lists+samba-technical@lfdr.de>; Tue, 15 Mar 2022 05:16:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=MX+6thpdmH9Fmh6G8WI/hYT23j8vgEmJnH4dIzx5fhI=; b=0OIYd77tgZqBTRKdVaTmayVnUX
	oB29+t9YD2bSP4HSmXEJJX9uyU5TQWAl/IURUdezjfFmb/VWoleU/IYVeDRq6fCAirIny1tsdpTLv
	TZJv1jajClgjMX5+EvSB5Ka2Ob7PLx55e3MLTcbywAoQZa97w79LTAj0CnkVgnv8JZnZJD73b/ZdX
	B364PaA/HLHupcI8HDtxGU6qb0gI7/3Fri7VGRn8EzceLSpI1Ov7KzwWl4TMKABc0sYQhGE/rOGiK
	5GsMtX7mjZcGRxXpKoB9br7KHWae+FeHMuEzW3JdW0XL8QU/DkMw9FKujtrWOeYZ6jz6P781P7SAs
	+psPKW6A==;
Received: from ip6-localhost ([::1]:33998 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nTyav-002V1n-Tk; Tue, 15 Mar 2022 04:15:38 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b]:37587) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nTyaq-002V1e-V9
 for samba-technical@lists.samba.org; Tue, 15 Mar 2022 04:15:35 +0000
Received: by mail-lf1-x12b.google.com with SMTP id b28so19140338lfc.4
 for <samba-technical@lists.samba.org>; Mon, 14 Mar 2022 21:15:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MX+6thpdmH9Fmh6G8WI/hYT23j8vgEmJnH4dIzx5fhI=;
 b=VYtL8vemdJkuH/Vis/B8Rof9Cp3UWDhYCJj/PVdFco+0KeaZ8btcr5zxL/DxWpUOOZ
 nuUiJMoTnqiAIb5l1ZywONQgyQF2U3KUwkYHZAL2y3JpWG+bsocGuEY/cHWxkwn2SBSc
 fcZ0ZL38lizuWMJjn9Vzp7a9bZt414Nn26+BD+F5xBTzfwsgW2t6tFPDuO7A+F32ATHi
 Ooytl5VhT02NLwbgaduZySpG0XfqkxTA4dCo6LuKypk5jZGHX2ENR5ReRTWpAiXwS9KJ
 OPPxH09ZwYSCbUGLeKXJxThPoNkXkDPdKzDUFpHs1Dj9d03WONUwopdi+dgAZVpbsxLc
 8MuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MX+6thpdmH9Fmh6G8WI/hYT23j8vgEmJnH4dIzx5fhI=;
 b=gC3AZuEi2VYtbAReznulQpUgaRGJ05ik76JGuY/xZlocrX7f66EFRFlO36Y+ZBKBKr
 sc3EzFxLm2DjgCarobsspK9nJQtvWwR1cZdBaaT6L9z1VK7iUNZ5N0Wlp7cCydyoHTk0
 kmmVHr21LAUdU30dX2Egl/2l/TEVDU9KS9oGRTnOrZgGrm+kix52mLMhdIRPVfB0f451
 NS+zksr7DDipGQRMNUzeKJg4x97WqDQPaGOYcapUkkWB5I7fh6QMKyEyWOjTBOGlv5SI
 kYbZFHiHR6OEruD9pVuG6Qg6AmFZLpmyFjXJQi22/mIMr/3tFAm3XHhG0O1EVuR8G4tu
 5oxA==
X-Gm-Message-State: AOAM530aKpXYPxn3Rf9MGOSYY3RHxys2qyJwGQgmY8ElFrYCT4FiKImH
 s2kDs1yZjYtpBlOcTGahj45nLvkg9GmZeeVKjPs=
X-Google-Smtp-Source: ABdhPJz37KwMUSCRY+zf4rBXiMdU8hH8Ijn8GNbH3cY07jiXP3+drPZ9RfdPXYk9LDPnv/CO8u6fcDfxk+ak4Ncq8+0=
X-Received: by 2002:a19:490f:0:b0:448:4bf8:6084 with SMTP id
 w15-20020a19490f000000b004484bf86084mr14810015lfa.537.1647317731326; Mon, 14
 Mar 2022 21:15:31 -0700 (PDT)
MIME-Version: 1.0
References: <20220312102705.71413-1-Julia.Lawall@inria.fr>
 <20220312102705.71413-2-Julia.Lawall@inria.fr>
In-Reply-To: <20220312102705.71413-2-Julia.Lawall@inria.fr>
Date: Mon, 14 Mar 2022 23:15:20 -0500
Message-ID: <CAH2r5mtD3=BiSDE4pLMpsc708dkP43hXosdyorfENawV9ura9g@mail.gmail.com>
Subject: Re: [PATCH 1/6] cifs: use kzalloc
To: Julia Lawall <Julia.Lawall@inria.fr>
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
Cc: CIFS <linux-cifs@vger.kernel.org>,
 kernel-janitors <kernel-janitors@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>,
 LKML <linux-kernel@vger.kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Which tree should this be merged from?  cifs-2.6.git for-next ... or
do you prefer that these all go together through a different tree

On Sun, Mar 13, 2022 at 11:36 AM Julia Lawall <Julia.Lawall@inria.fr> wrote:
>
> Use kzalloc instead of kmalloc + memset.
>
> The semantic patch that makes this change is:
> (https://coccinelle.gitlabpages.inria.fr/website/)
>
> //<smpl>
> @@
> expression res, size, flag;
> @@
> - res = kmalloc(size, flag);
> + res = kzalloc(size, flag);
>   ...
> - memset(res, 0, size);
> //</smpl>
>
> Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>
>
> ---
>  fs/cifs/transport.c |    3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/fs/cifs/transport.c b/fs/cifs/transport.c
> index eeb1a699bd6f..4ff8e165a180 100644
> --- a/fs/cifs/transport.c
> +++ b/fs/cifs/transport.c
> @@ -464,13 +464,12 @@ smb_send_rqst(struct TCP_Server_Info *server, int num_rqst,
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
>


-- 
Thanks,

Steve

