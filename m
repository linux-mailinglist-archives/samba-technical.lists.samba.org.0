Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 28C96389B36
	for <lists+samba-technical@lfdr.de>; Thu, 20 May 2021 04:13:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=FTCd6+qiif01nDICAPQwlVynjOYjR5IJKwPzRGQKUlc=; b=zoKWtS6ljg12idcWmFkDl2fzil
	nTpt3LSoBxn8++qWUDGOB7ZPjZitH9mOEA64+c+XomOYQuvx2pqjcg85s0peMFuuBPocRhJV0tQsN
	bxcKr+k9+zfJ5W9qMsKIGBQZ3dsVxYSDLsKDVSIcOOAXtwdV6svNLb5RwBl9CBpX/rqvHkDjjO1vu
	kolCQPO/OO3kS7h219vTx7j7j/VCSf/fLVMd6JuYNn9kmYR6s0NlwuaQ/Qy7tMmuZunAaFDExZ1mW
	HGNPKkUgQ1h6rZcotGbgd+W0YDv3NxyE/k+C4ByYzJ519TsYxRFnezOZMJyHIsus++zzxpxOT0304
	SFivQ9ng==;
Received: from ip6-localhost ([::1]:45404 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ljYAo-001ulU-7O; Thu, 20 May 2021 02:12:30 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132]:39445) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ljYAi-001ulL-Qe
 for samba-technical@lists.samba.org; Thu, 20 May 2021 02:12:27 +0000
Received: by mail-lf1-x132.google.com with SMTP id q7so20702451lfr.6
 for <samba-technical@lists.samba.org>; Wed, 19 May 2021 19:12:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FTCd6+qiif01nDICAPQwlVynjOYjR5IJKwPzRGQKUlc=;
 b=eby5+MG5WOLfBJG5eg8HoCR/ZBM6jNxULHNd3nt/BEVa8feoOsK/QERWdS6sVXR7mX
 z2Z+9m72d/z5eyCeX0LythlCLs9TSv6NIjniPi6vO70ZeYt+1pB154TUa+fxTXxfKnto
 q2jygY4V1DeiFfbI6DxYYI51j0fAVepvIt8ojPfaJRcNSxVQ8BkOqfYCeXMjbwLRTQXO
 OfEmSwJ86BiN58WIGXsSgBXgO4h7dYO/ho0CnpqtakIT1/x1LUgvpCZTMKV9lZqgpGhE
 JGINJ2uoVKUqBsi7CSBcKkhiAVD1S5op+4yyIDijfvQxik9DQky+bkBszloJieSp1CUv
 CkQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FTCd6+qiif01nDICAPQwlVynjOYjR5IJKwPzRGQKUlc=;
 b=jGL08uHEBWyEoMF0XntJpzw1eypJRYG9kg++zKQoixK4BF756gUxHZ6o15+Za9Mzux
 QfveBuNJBzsrUU4wNlGRA1kdahymnsyUUAqWy2OKJnk0ksTM2kw2iRgmct6S7KGT93vR
 qxEn8vIDhMbbtcPB+qW3qCQh85qgJfPc571YzIcZ9O9PESvQ1yvqV0i8DAZ6cBd5pg/i
 pddlDUnBLC39zLeJiqjKcJ3bg9JMfzTV560ZttIjuSgyIFJvWRVgdrS+effhDUT0tYpA
 QeO93LpHCLgfvHSmehfMbPhKZ5Moi/4N5+BAADE2Hz1yHZ6gtJhWnKbNSOWxy7G2X8F1
 oDWA==
X-Gm-Message-State: AOAM5334ATs7riFfNbsE4YTsn+rTWd00WGYCpzIp6AXub6OVHSFNhw80
 x9IXaME0bIHiBYIHX3vJqAQNeH7rO68NWNGbSW4=
X-Google-Smtp-Source: ABdhPJze41Tna3mdxpem1bwA3YO/pMjKiaQ5H13HVKKTehHFnhDyXjRsAc5yKedHyMM3VA8zA62/1UIE1m2QHNnNOtQ=
X-Received: by 2002:a19:c397:: with SMTP id t145mr1755064lff.307.1621476742264; 
 Wed, 19 May 2021 19:12:22 -0700 (PDT)
MIME-Version: 1.0
References: <1621421227-34130-1-git-send-email-jiapeng.chong@linux.alibaba.com>
In-Reply-To: <1621421227-34130-1-git-send-email-jiapeng.chong@linux.alibaba.com>
Date: Wed, 19 May 2021 21:12:11 -0500
Message-ID: <CAH2r5mvPTFcueM4VotLvQfiNLDeG0_CMXKQdUtyMYstXYznJqQ@mail.gmail.com>
Subject: Re: [PATCH] cifs: Fix inconsistent indenting
To: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
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

On Wed, May 19, 2021 at 2:27 PM Jiapeng Chong
<jiapeng.chong@linux.alibaba.com> wrote:
>
> Eliminate the follow smatch warning:
>
> fs/cifs/fs_context.c:1148 smb3_fs_context_parse_param() warn:
> inconsistent indenting.
>
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
> ---
>  fs/cifs/fs_context.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/fs/cifs/fs_context.c b/fs/cifs/fs_context.c
> index 5d21cd9..92d4ab0 100644
> --- a/fs/cifs/fs_context.c
> +++ b/fs/cifs/fs_context.c
> @@ -1145,7 +1145,7 @@ static int smb3_fs_context_parse_param(struct fs_context *fc,
>                 /* if iocharset not set then load_nls_default
>                  * is used by caller
>                  */
> -                cifs_dbg(FYI, "iocharset set to %s\n", ctx->iocharset);
> +               cifs_dbg(FYI, "iocharset set to %s\n", ctx->iocharset);
>                 break;
>         case Opt_netbiosname:
>                 memset(ctx->source_rfc1001_name, 0x20,
> --
> 1.8.3.1
>


-- 
Thanks,

Steve

