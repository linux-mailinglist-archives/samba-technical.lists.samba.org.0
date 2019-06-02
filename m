Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id C1EBF3259F
	for <lists+samba-technical@lfdr.de>; Mon,  3 Jun 2019 01:20:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=Lb9DvjMSyUOUImY/tbnDz5/9U5ZO01aN5zQ8BCwuuDo=; b=gwPkdxAWTGG+upm8X0lk5+iQfM
	QLny8uNNr1dhqvdY0987bF3zVwKBxq/dUiXbeXEKRVoZws+pcpfRQZEH1T8eq3k3OMCaSsPrH0NoJ
	wXKm5cJcSZjV8x5e+vdfsJlwAis61L/53TLr3aahcPi3Jh0h7XGqTmxGu5NdCNdgCADJlBmsv+3P1
	R78t2vBC26KOThvVY2EjYGBkXYt3c0wnCCfc1XeRk/5sCXKl3i7PBD1N6C7hOko0vmTndtE3spQ0M
	z9okkGwIMQj9VtOlx1mPmcsPQu3kiRZThhnWfk+f6MMHejr1C3ynJYFRjvHzwBPeiDjYgx9HO3uYx
	PU1GVLng==;
Received: from localhost ([::1]:57558 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hXZkm-004i4P-6Y; Sun, 02 Jun 2019 23:19:04 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:44082) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hXZkg-004i4I-Nl
 for samba-technical@lists.samba.org; Sun, 02 Jun 2019 23:19:02 +0000
Received: by mail-pl1-x635.google.com with SMTP id c5so6213392pll.11
 for <samba-technical@lists.samba.org>; Sun, 02 Jun 2019 16:18:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AbScavLT8hRHvblSXnX8ASsJ/1sAm/q+ihnCoWKAQsU=;
 b=saNzM6wJcBBZIdl+JoGQLKeKA8OQNP/nqOPmweDjLlsSc2W6VZtsejcQftNxvKlcLB
 Yl3sjaE+FZIfS0dZ9w65gw1Ls84vDl8vzw35N6lB/aiNElE+zl2cinSiN+NkREGuo0Kl
 4Le7weqsvGPIQFQc3Mo3i1mmlrmoULzifjp0v4rrLqaW0Gx/FUcF27wfer3vx4KALWH3
 rM6/xIEZEZlrYMjrUc2hJr7t9SSKafOGAukzXzy80kbsABQMowS3t0NaNJu035GglKgR
 PUUJD9vPXzOX+bu4Bqw0FwYtMPdVNaO+31NxMKruAwG/MUKH6J2ka4OurB1FYrrHInma
 BEKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AbScavLT8hRHvblSXnX8ASsJ/1sAm/q+ihnCoWKAQsU=;
 b=rOv1/tremtYe4GjtVjdpZ4lgAJxsApiDLwVGOQUV01dHxdLa7F9jGRj/iGY9D6SGWn
 YuEk3UGE8KF4tca3ITwg2yia4UbVMLkzch0v38nQTXPaLjRnL8USWm5OnCSsuGQrtUcw
 MYdlAKEbgXG2k6i765UJtG/ty3I3bZkymIItJ0f0mA532C10Cyk9qTCo2YjTIPpRKdEi
 fecRgNWHPSjyTdl1FFdnTmOGadzE5ldnUiOxq7ZLLtlNaLZLWwijneXXOqYciNTkPx/m
 k60oeGx9unNrCFR0mArMXvcwTllbk0oa3HzJLX6xNsrxAaj/HEYclZoWc/t8Q9xmtj/e
 VIbA==
X-Gm-Message-State: APjAAAXqir+ine/HDUjeHbHHmTSpsMezbroSoWQdAJ5iXwz+JaMFUZ2x
 v/fax9Bt8W3CVcputcAdwWj85z5VhNqQB7J6QRo=
X-Google-Smtp-Source: APXvYqxrh22+xVrK8/wYlhUmW0Fe7DQmU9HaCNiLH/N5vSZ6tqfa1pMGf6SkTb04phWfa+DBE+kOZszFbgfFLSLRdZg=
X-Received: by 2002:a17:902:7618:: with SMTP id
 k24mr26505631pll.78.1559517534586; 
 Sun, 02 Jun 2019 16:18:54 -0700 (PDT)
MIME-Version: 1.0
References: <20190601033110.81011-1-yuehaibing@huawei.com>
In-Reply-To: <20190601033110.81011-1-yuehaibing@huawei.com>
Date: Sun, 2 Jun 2019 18:18:43 -0500
Message-ID: <CAH2r5mvsk6+E_5cxNS45NdSkAMdaofXV=f-1QWXBKGRj6NEwVg@mail.gmail.com>
Subject: Re: [PATCH -next] cifs: Use kmemdup in SMB2_ioctl_init()
To: YueHaibing <yuehaibing@huawei.com>
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.23
X-BeenThere: samba-technical@lists.samba.org
X-Mailman-Version: 2.1.23
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
 kernel-janitors@vger.kernel.org, samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Merged into cifs-2.6.git for-next

On Fri, May 31, 2019, 22:23 YueHaibing <yuehaibing@huawei.com> wrote:

> Use kmemdup rather than duplicating its implementation
>
> This was reported by coccinelle.
>
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---
>  fs/cifs/smb2pdu.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/fs/cifs/smb2pdu.c b/fs/cifs/smb2pdu.c
> index 710ceb875161..02f0c2e41fcb 100644
> --- a/fs/cifs/smb2pdu.c
> +++ b/fs/cifs/smb2pdu.c
> @@ -2549,12 +2549,11 @@ SMB2_ioctl_init(struct cifs_tcon *tcon, struct
> smb_rqst *rqst,
>                  * indatalen is usually small at a couple of bytes max, so
>                  * just allocate through generic pool
>                  */
> -               in_data_buf = kmalloc(indatalen, GFP_NOFS);
> +               in_data_buf = kmemdup(in_data, indatalen, GFP_NOFS);
>                 if (!in_data_buf) {
>                         cifs_small_buf_release(req);
>                         return -ENOMEM;
>                 }
> -               memcpy(in_data_buf, in_data, indatalen);
>         }
>
>         req->CtlCode = cpu_to_le32(opcode);
>
>
>
>
