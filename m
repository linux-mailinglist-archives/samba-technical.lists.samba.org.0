Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id C6CD44910B8
	for <lists+samba-technical@lfdr.de>; Mon, 17 Jan 2022 20:35:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=emOtZhdt5N3mHj5D3ASETnqYXUFr2pjYPEAN6eeF9Ts=; b=C1kNChtS10oj8xo50m52kV/evJ
	HD80aznraNLPoMF1et/iTLpmUSxVB7Jn2V+0Ri0QKYZNBWS88uxbWipD5QML0m+U7gz7IobL/Z9+W
	6rovRRdze9IEJg8A9EXR0Zvl17eexf0DT2p306x+Iq4RVmq5uXTGta1O76/xOE37Okt8x9H4NMtH3
	pgtd0ojGGN8HiFKTV1OO2f4v1X5R35+wpt9sQyimUSR6w+Tek5bx6RqUQeyFsU8QlpLb/NHekO2DZ
	HIC6qXNlIbnl/qwQBbuWtHMjjDBNx8LIt5RCj1QbsxymQDKEWXyJ4WEcelSGsVLBEYD96e/Ujo5Zi
	yBq5Zpag==;
Received: from ip6-localhost ([::1]:57182 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1n9XmD-009E28-W6; Mon, 17 Jan 2022 19:34:50 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e]:41787) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1n9Xm9-009E1z-TF
 for samba-technical@lists.samba.org; Mon, 17 Jan 2022 19:34:48 +0000
Received: by mail-lf1-x12e.google.com with SMTP id x7so61568827lfu.8
 for <samba-technical@lists.samba.org>; Mon, 17 Jan 2022 11:34:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=emOtZhdt5N3mHj5D3ASETnqYXUFr2pjYPEAN6eeF9Ts=;
 b=J+VSDCpYVNAwVW2eHpYj14WGtUwxHXL2Lp5GacTZmY1VwmgLJKQcztLT33T1ef6hUG
 dvd44EeSpPC8kZlVT7zY8JRvshTczdhzMwSM9a+tEZCzHV3/b/lm/JWOEJb8liOlcUFs
 RPqOCHEai9nT/Gbkz8KzZ02BgxWr4r8mxD/WRQ7ITaP1Im4qqpZZ0x761LJfxiRcJ5fD
 OcdrB3SKTNWQpv+2cPRu/b6MDm9naaC9xIfY0TyUFoRkGxqvrvharc0HfvEIjTpnSHoT
 nDQi5IXW4D2rx852y0pA1y/+dT5toftzVJr+ZIkRvGDp5ncdvbQA5cC9S2CAM6JlpXc5
 m0YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=emOtZhdt5N3mHj5D3ASETnqYXUFr2pjYPEAN6eeF9Ts=;
 b=cm87DfXb4G7zAWJ+Lvm8q7SyIU6Zb9Hgl8b7LtdashLKcsVayxSUPIwFDDbXJCPs5g
 ACOMhSwQ+tV8IzeApNjuUR6d0Q9dq06KFsNQF8dw1lkIn9OlhA+P9s5Ck3L6isGN+0Xk
 nqaexVQueiKwJpHxB0d+Y5ZaSVtX8tWxVB9Vn3/C7FDK00kC1FeK/7/48rlUAptVF4+M
 29RGte1yQ3H/SNB9dHcdJDgZne+ugjzqRlEMVBhdISuXUbg4h+tOrNh6alT7CbkIO5Gj
 MzeBhsbBC0s2glu1f1tsgpJLX+lkWbQIUQ+8qYAbfRXx/ocRtV0FhubDGqJKfm8xUQbS
 U2jg==
X-Gm-Message-State: AOAM5309ku52X4wgcQVIq80HS7fku9KB5ZivUjLdPE2vwN4OlZAy7CiT
 ljyxFINdUPsgtpg1vGRQziGHu+ghujId0NeHZJ4=
X-Google-Smtp-Source: ABdhPJxjxhkWx1IfG3E843M4a7EOnVlBZ1imHsFc/tH6VpSxTXzEfkxeNwnrwY++66zOk9uI6yitf+1snApKwGz5HMY=
X-Received: by 2002:ac2:4c41:: with SMTP id o1mr17939096lfk.545.1642448084498; 
 Mon, 17 Jan 2022 11:34:44 -0800 (PST)
MIME-Version: 1.0
References: <20220117011130.84223-1-yang.lee@linux.alibaba.com>
In-Reply-To: <20220117011130.84223-1-yang.lee@linux.alibaba.com>
Date: Mon, 17 Jan 2022 13:34:32 -0600
Message-ID: <CAH2r5muO5=-8A-SiPaU+0MWgGvKrZZbRpEv=3zttNHARLGTNyg@mail.gmail.com>
Subject: Re: [PATCH -next] cifs: clean up an inconsistent indenting
To: Yang Li <yang.lee@linux.alibaba.com>
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
Cc: CIFS <linux-cifs@vger.kernel.org>, Abaci Robot <abaci@linux.alibaba.com>,
 samba-technical <samba-technical@lists.samba.org>,
 LKML <linux-kernel@vger.kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

merged into cifs-2.6.git for-next

On Mon, Jan 17, 2022 at 5:07 AM Yang Li <yang.lee@linux.alibaba.com> wrote:
>
> Eliminate the follow smatch warning:
> fs/cifs/sess.c:1581 sess_auth_rawntlmssp_authenticate() warn:
> inconsistent indenting
>
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
> ---
>  fs/cifs/sess.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/fs/cifs/sess.c b/fs/cifs/sess.c
> index d12490e12be5..96434cad0bfe 100644
> --- a/fs/cifs/sess.c
> +++ b/fs/cifs/sess.c
> @@ -1574,7 +1574,7 @@ sess_auth_rawntlmssp_authenticate(struct sess_data *sess_data)
>  out:
>         sess_free_buffer(sess_data);
>
> -        if (!rc)
> +       if (!rc)
>                 rc = sess_establish_session(sess_data);
>
>         /* Cleanup */
> --
> 2.20.1.7.g153144c
>


-- 
Thanks,

Steve

