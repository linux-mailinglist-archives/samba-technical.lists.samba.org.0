Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E185240BA2
	for <lists+samba-technical@lfdr.de>; Mon, 10 Aug 2020 19:09:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=EV/Inn1yIq80k4xTWqNtB11Yxfxj2hvMoKBR9JcOwIo=; b=KKzxFP0QPulAD79hVyu8tmg0mV
	Q/JbA/Pnhp/BqfB8BH0mzL62U7CvqDWj7QGSDJ4qIY6vIg6kf62uGVuiZEAPssEYf1lZtMQZBBy5v
	XOSB5AYZQoVxXnOwfPzusKSAtGEt5QgAMWzOJnGIPIz2n4G0iy4vNZS/2uAwl6T1DtwRorqXEGmbq
	kRddNSLA3gqzN0YV0dDE9KHHGe8Ho+FEGf+Qnz2x9U7uiS7XtmtjqjZjhc0/lvDLRex8HgrPFYbjx
	fWE7G5m77jKMyNQf7CYeXwvP4frilzQABPuRnHP43+0iXZHQsYTJnAr2yoPk76sjKkR26JkEQkaSO
	yIWTFXdQ==;
Received: from localhost ([::1]:60904 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1k5BHp-00D8kd-MA; Mon, 10 Aug 2020 17:08:37 +0000
Received: from mail-io1-xd41.google.com ([2607:f8b0:4864:20::d41]:44864) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1k5BHh-00D8kW-5d
 for samba-technical@lists.samba.org; Mon, 10 Aug 2020 17:08:33 +0000
Received: by mail-io1-xd41.google.com with SMTP id v6so9661380iow.11
 for <samba-technical@lists.samba.org>; Mon, 10 Aug 2020 10:08:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EV/Inn1yIq80k4xTWqNtB11Yxfxj2hvMoKBR9JcOwIo=;
 b=D4odPv7PmDBTv8Fr4bfErHYxqALMVwFsfFMmqsp82assrut3e69ZNXKmR+KDkxZRWG
 YHKA9IhaMldTiRLhsg500chNRM/ou501nJfjU3npvH1nZRX3900zmodkNGZi3mN8tIoC
 HG16jK4Jnd2ViNjtQv+rUQGWNzryHDcq8vAjZlzkA/BsTBqYxrVOPg6fwdiMCiUvEEre
 Oe23p+rdRhbdZd1C1OouJkp9juFnW93XUHKeSWiIVWd3wShY2JzsDi5U6LMui2hesChO
 FdLfAuwk/X5i0ZDdCJEU6MnAh5Emt7tb8nDx2Ia3X5f0BIpeXi+UQ5A/NvmrXqPKBFmF
 /5Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EV/Inn1yIq80k4xTWqNtB11Yxfxj2hvMoKBR9JcOwIo=;
 b=VQB5Ry+bagBA5c3HA8Ruj4jV1K9r5W/AcAM4NEIuiawZuFW2v/n/Ob0/dOWM+545yq
 25fiOFeK+75rollqZ75ADb1h5enMbCW6GQqIWepbVH3+10n/hc8q8wbzFRNEoZRozabA
 KPH6ZKcRgdHd4kIIu7TQ55mK6f/SNiUR1BoPconGLryUS920Cu5NAWGW1TunWGZOuOhb
 n56XE8uyARAklefvHWIDVZd0uoOFjI4niDURFpc1V65MmLIaOi68tFpmLXza+F9vDHUu
 pnYN/KHhTc/uaJ5E19iZqp7wHWWqYv1etkpv2yYlRJoprw2oiGBoDm0CWqDkfojAkkic
 ZmKA==
X-Gm-Message-State: AOAM531IWnZoFv2BeYhr4YwQfEZtreOyJ1yapN3XYKQwJ1gOuA+4bNW2
 LceOOi9GOCwGyEq7/Z3JXtz+9jtTc7UpkhF8BEo=
X-Google-Smtp-Source: ABdhPJzz4KKqCWD8DewPuuMqNyLgFicLPDFscAPkzIrLXWdzhAtY0bnr7EccVxuIqigNWXrcGkoPoLjwlE3xYY1EmEg=
X-Received: by 2002:a05:6638:2604:: with SMTP id
 m4mr21271201jat.76.1597079306859; 
 Mon, 10 Aug 2020 10:08:26 -0700 (PDT)
MIME-Version: 1.0
References: <1596875797-22710-1-git-send-email-linmiaohe@huawei.com>
In-Reply-To: <1596875797-22710-1-git-send-email-linmiaohe@huawei.com>
Date: Mon, 10 Aug 2020 12:08:15 -0500
Message-ID: <CAH2r5mstN6P_kU_Riobdv5NJPL-pF6=oZoAh6k9qj1+nz9Z8Cw@mail.gmail.com>
Subject: Re: [PATCH] cifs: Convert to use the fallthrough macro
To: linmiaohe <linmiaohe@huawei.com>
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

(but note that most places in fs directory other than cifs and btrfs
have not been updated), and I noticed another 8 places in fs/cifs that
you didn't change in your patch (ie change from the older way of
indicating fallthrough   /* Fallthrough */ as a comment to the newer
fallthrough macro.

On Sat, Aug 8, 2020 at 3:34 AM linmiaohe <linmiaohe@huawei.com> wrote:
>
> From: Miaohe Lin <linmiaohe@huawei.com>
>
> Convert the uses of fallthrough comments to fallthrough macro.
>
> Signed-off-by: Hongxiang Lou <louhongxiang@huawei.com>
> Signed-off-by: Miaohe Lin <linmiaohe@huawei.com>
> ---
>  fs/cifs/smb2pdu.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/fs/cifs/smb2pdu.c b/fs/cifs/smb2pdu.c
> index 24c2ac360591..667d70aa335f 100644
> --- a/fs/cifs/smb2pdu.c
> +++ b/fs/cifs/smb2pdu.c
> @@ -3913,7 +3913,7 @@ smb2_readv_callback(struct mid_q_entry *mid)
>         case MID_RESPONSE_MALFORMED:
>                 credits.value = le16_to_cpu(shdr->CreditRequest);
>                 credits.instance = server->reconnect_instance;
> -               /* fall through */
> +               fallthrough;
>         default:
>                 rdata->result = -EIO;
>         }
> @@ -4146,7 +4146,7 @@ smb2_writev_callback(struct mid_q_entry *mid)
>         case MID_RESPONSE_MALFORMED:
>                 credits.value = le16_to_cpu(rsp->sync_hdr.CreditRequest);
>                 credits.instance = server->reconnect_instance;
> -               /* fall through */
> +               fallthrough;
>         default:
>                 wdata->result = -EIO;
>                 break;
> --
> 2.19.1
>


-- 
Thanks,

Steve

