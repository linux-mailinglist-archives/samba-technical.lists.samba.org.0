Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 5371F44FE1C
	for <lists+samba-technical@lfdr.de>; Mon, 15 Nov 2021 06:14:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=zZoE+xQ2U7qWcLCwPm3BWxfe1Es+mpw14CoOgK3M7Ok=; b=RuSY/WJFzdAR/SPIStopyas73X
	hQebIGGXuiICPlFwK8gyRp8YfFCiDvolB0fW8p/oddXoTSR7qHnH3CqCLhC4Fk+hMKrq9b055dhkC
	e0NiNxF1Q13o/c5ZLkoFEVIaQvqv1LJn5x/9o8hzs3aghhTVkfj/nw6kEEvKjoCYJdQlCh0XDqQwZ
	agyKchQE/u2hD76s6ZBU1LjxveCTkgRLgcTkZCneGCIQFTjhvWgNe8yWI3SSf0ud03lquD3sIxVrb
	a6/v0lcE+zv/21VsLFcgJt3SBayGAfQd/Y6dSEPAQtc3L4mhaGzSD8GOs7hQmwC6d1xH1BlyVK7Kf
	qeNZxt3w==;
Received: from ip6-localhost ([::1]:38596 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1mmUJC-001Jhi-Cn; Mon, 15 Nov 2021 05:13:34 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f]:40490) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1mmUJ6-001JhZ-LJ
 for samba-technical@lists.samba.org; Mon, 15 Nov 2021 05:13:32 +0000
Received: by mail-lf1-x12f.google.com with SMTP id l22so40245264lfg.7
 for <samba-technical@lists.samba.org>; Sun, 14 Nov 2021 21:13:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zZoE+xQ2U7qWcLCwPm3BWxfe1Es+mpw14CoOgK3M7Ok=;
 b=mwm1VjQ772gRZ4PuPgObB+pw+oQgHGo0gH8xXfY20IrpKUmrCNqdtnQD17BsNf6flb
 fqYRtMBtI8ssq47EvKK7k7me43tk/1EnUxRmYFUbhTTxtJNsECVuv6H+9l7mM2L8kMHl
 Ti1HfiRu2dIiAJWG/R1O7ne2eNsNFDVJi1P42Sqihk2iGMQOmkczpZQDvo5Ck1SHfRH1
 8d5la2PFPHcSPqrjh8OdXiQmYMw9LKgpnjowZpsrK7pAMT1Yo1gYkbvcuzvt1WvNazI/
 EJgF9gNnwRrNIyAXiwWOYHO5F0ojNXbNmrbx5TX26Oem6zIYnrkUfhFQ8gbRfhcbUyI0
 VenA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zZoE+xQ2U7qWcLCwPm3BWxfe1Es+mpw14CoOgK3M7Ok=;
 b=0WCO+jgqfi9fiX5qeEEuHm1AXJTEkmXiHuSZJvitleAvsuQMHtW17qvYNwbTsQEGh8
 StNQv/vDg7HOjXyhkzsx/tdyqpOvHGH3OKMZaojhFaB7DDS+O2Gl5kMUuM/fNXZhiDSR
 ro7htz95yljQ8+7I4+vy5/WCXjigv9ejFnIL7iIsXXXOkWKGCa3ehqlR64Kae6b+cUf3
 kRyLoWDVEf71jE0/l9D1prKFM1YA7oq3RPud1J4qgNCTAxBRZ0m3pZRQlFwZviizP7CK
 cueQOvG8p3q4fMwHmfvNCdK4hsVH7IXa9eV2lPzJ7AUNRsXjK0yJ+SaoJuvYuSuXQGj9
 WqJw==
X-Gm-Message-State: AOAM530Fu477j3guU6Y8ilQMtL6i5rrgLN7C7ZUNi1uyWizByiOD/TTy
 xPfZemroYIRFzbByBDNx2/JQ8T99/xET7lOtMp4=
X-Google-Smtp-Source: ABdhPJxXns1wG+psRT62X8UPM7sHi3HbTaMCW/uGnIXCXyY36drmrlPsz+a6JG96myvs8cZdB598PP5mo7jAIvMlvZs=
X-Received: by 2002:a19:770a:: with SMTP id s10mr34265127lfc.234.1636953207366; 
 Sun, 14 Nov 2021 21:13:27 -0800 (PST)
MIME-Version: 1.0
References: <20211112093051.9366-1-chi.minghao@zte.com.cn>
In-Reply-To: <20211112093051.9366-1-chi.minghao@zte.com.cn>
Date: Sun, 14 Nov 2021 23:13:16 -0600
Message-ID: <CAH2r5muJ14DbEax2N2p30MD_wWcteeHfH4TCJM4K_eSDsU2dBQ@mail.gmail.com>
Subject: Re: [PATCH] fs:cifs: convert from atomic_t to refcount_t on
 tlink->tl_count
To: cgel.zte@gmail.com
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
Cc: CIFS <linux-cifs@vger.kernel.org>, Zeal Robot <zealci@zte.com.cm>,
 samba-technical <samba-technical@lists.samba.org>,
 LKML <linux-kernel@vger.kernel.org>, chiminghao <chi.minghao@zte.com.cn>,
 Steve French <sfrench@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

merged into cifs-2.6.git for-next pending testing

On Fri, Nov 12, 2021 at 3:32 AM <cgel.zte@gmail.com> wrote:
>
> From: chiminghao <chi.minghao@zte.com.cn>
>
> use refcount_t instead of atomic_t
> which prevents reference counter overflows.
>
> Reported-by: Zeal Robot <zealci@zte.com.cm>
> Signed-off-by: chiminghao <chi.minghao@zte.com.cn>
> ---
>  fs/cifs/cifsglob.h | 4 ++--
>  fs/cifs/connect.c  | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/fs/cifs/cifsglob.h b/fs/cifs/cifsglob.h
> index 41e97df4e0e5..a8edaada0fea 100644
> --- a/fs/cifs/cifsglob.h
> +++ b/fs/cifs/cifsglob.h
> @@ -8,7 +8,7 @@
>   */
>  #ifndef _CIFS_GLOB_H
>  #define _CIFS_GLOB_H
> -
> +#include <linux/refcount.h>
>  #include <linux/in.h>
>  #include <linux/in6.h>
>  #include <linux/inet.h>
> @@ -1115,7 +1115,7 @@ struct tcon_link {
>  #define TCON_LINK_PENDING      1
>  #define TCON_LINK_IN_TREE      2
>         unsigned long           tl_time;
> -       atomic_t                tl_count;
> +       refcount_t              tl_count;
>         struct cifs_tcon        *tl_tcon;
>  };
>
> diff --git a/fs/cifs/connect.c b/fs/cifs/connect.c
> index 9637465d23db..4aad8c9acf2e 100644
> --- a/fs/cifs/connect.c
> +++ b/fs/cifs/connect.c
> @@ -2318,7 +2318,7 @@ cifs_put_tlink(struct tcon_link *tlink)
>         if (!tlink || IS_ERR(tlink))
>                 return;
>
> -       if (!atomic_dec_and_test(&tlink->tl_count) ||
> +       if (!refcount_dec_and_test(&tlink->tl_count) ||
>             test_bit(TCON_LINK_IN_TREE, &tlink->tl_flags)) {
>                 tlink->tl_time = jiffies;
>                 return;
> --
> 2.25.1
>


-- 
Thanks,

Steve

