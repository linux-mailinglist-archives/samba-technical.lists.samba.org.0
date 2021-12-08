Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CDFF46CC98
	for <lists+samba-technical@lfdr.de>; Wed,  8 Dec 2021 05:34:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=EN1o8XpoKN4as2yUaOYdrp8Cti7k7n7wDJbtCFFci+Y=; b=hWt2ITy/bibndkVoker1+5k4uQ
	BRuSy21iShK1GQUPYYTtqQ9wdGCE74SRzGx3/OO0REPbLxbZ2FIWLslw3oa/zXvuMNdouCy2TH2rB
	8wxGwN3wezrHz+xLPTqHxyNQnOp19ZkQF6AzBhHFV3KngWB7qrfUIgfiR6wrqlQQmkCvUplNVHKeZ
	RppsJWXht1zZuVE1QKnZoKax+USnTyVVuPUmSFBNZ7kC83fTbMDYU8RRfkKEzmi11UJRwMQPghR0q
	+nxhIII7BLU4AFD6FWkdOno069qKyDLdBoloGUfIxlrR7OgIugPmZMacuakn69DSgfQRvIIEmmYrh
	+ZD1yBVA==;
Received: from ip6-localhost ([::1]:33602 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1muoe0-003ynr-SL; Wed, 08 Dec 2021 04:33:28 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e]:43523) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1muodv-003yni-GX
 for samba-technical@lists.samba.org; Wed, 08 Dec 2021 04:33:26 +0000
Received: by mail-lf1-x12e.google.com with SMTP id b40so3009035lfv.10
 for <samba-technical@lists.samba.org>; Tue, 07 Dec 2021 20:33:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EN1o8XpoKN4as2yUaOYdrp8Cti7k7n7wDJbtCFFci+Y=;
 b=lzk6Ja0MRaTF0ii1RSV3qpELQCzRZ2oDBAf+jsOusYOmESpT5SRM9S8Jyg6NSP9xgI
 ifjeG5Zs1YF+A6Xp2qkVaN36SIzfuOo9wfXseZt42E6Wasnu1Rc99acbnndCpuYWAGat
 dtny7bZZ8z+x4PJubJQy1S/B/dtf9wOHSS3MFT/bskThLk2EHJfoGnLuYtlpIUxyFCQW
 P1dv3UwwoPGIuhnggYWQ1/ZMZs8J6nSCA0DwYvtT8R90GSK4ak1yGa27F9BqmEKKC+ER
 JpRB1E53P2f97NcLueqUpt98tZWAHZCZIvb8Hu9c1BH1B4CXCRWhJIjbp1n2rmuc/1XH
 SK6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EN1o8XpoKN4as2yUaOYdrp8Cti7k7n7wDJbtCFFci+Y=;
 b=HnOoEnAjO8JqHuIlcmekHdXQGV5rDKaN8zpuZ1hqRIqLEfPj+xAzHKLWceRKjrPazj
 2J0Qk0Lhb+rOZQ3A21alRyKl+Rb2k5o4EHLAwNlYccKapIL0Qd5DW5WgyTPCt7odjwOc
 kpLVyTTGRury2xV9tBBEjaK/pTrH6Sx4R96skbx8VjcDP4+DWjXFdeULD+fqBO2UKktN
 /N3Kkb1hYfUCwi5I1ia9Gg6kQ1PRJXeNbGnZuHidjsZ0DwaYqOpZgBOnIfnr+2T8oiV+
 arkOlBMjBPfnaK9Wv98atJr4akdZj+lK0btH9Q+pk2BQ+4UWjpXbIQSq4wiUPxbju7HN
 U8XA==
X-Gm-Message-State: AOAM532LXUVrcLK2bIfRRwPxia5VYmBQfahXdMrzBRFi2yLGVOAIEuHT
 EqivpNs68C9nUAoD2VnHOwo3pUknVdxVYRSaIsc=
X-Google-Smtp-Source: ABdhPJwIdiWlGyg9QKfiqlNkmB52N2pXz78n6hNt6wd/g8Q34QRsZhd+Zv1DyXbdwQWK8+nGuCI+uiTucfKvH8IFsow=
X-Received: by 2002:a05:6512:3991:: with SMTP id
 j17mr45568787lfu.545.1638938002185; 
 Tue, 07 Dec 2021 20:33:22 -0800 (PST)
MIME-Version: 1.0
References: <20211207115420.18713-1-vincent.whitchurch@axis.com>
In-Reply-To: <20211207115420.18713-1-vincent.whitchurch@axis.com>
Date: Tue, 7 Dec 2021 22:33:10 -0600
Message-ID: <CAH2r5mtxkO9whCCKrFXMYNr26RcShx-QT4_EZvLJj52AkQjWqw@mail.gmail.com>
Subject: Re: [PATCH] cifs: Fix crash on unload of cifs_arc4.ko
To: Vincent Whitchurch <vincent.whitchurch@axis.com>
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
 samba-technical <samba-technical@lists.samba.org>,
 LKML <linux-kernel@vger.kernel.org>, Hyunchul Lee <hyc.lee@gmail.com>,
 Ronnie Sahlberg <lsahlber@redhat.com>, Steve French <sfrench@samba.org>,
 Sergey Senozhatsky <senozhatsky@chromium.org>, kernel <kernel@axis.com>,
 Namjae Jeon <linkinjeon@kernel.org>, Steve French <stfrench@microsoft.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

merged into cifs-2.6.git for-next

On Tue, Dec 7, 2021 at 6:11 AM Vincent Whitchurch via samba-technical
<samba-technical@lists.samba.org> wrote:
>
> The exit function is wrongly placed in the __init section and this leads
> to a crash when the module is unloaded.  Just remove both the init and
> exit functions since this module does not need them.
>
> Fixes: 71c02863246167b3d ("cifs: fork arc4 and create a separate module...")
> Signed-off-by: Vincent Whitchurch <vincent.whitchurch@axis.com>
> ---
>  fs/smbfs_common/cifs_arc4.c | 13 -------------
>  1 file changed, 13 deletions(-)
>
> diff --git a/fs/smbfs_common/cifs_arc4.c b/fs/smbfs_common/cifs_arc4.c
> index 85ba15a60b13..043e4cb839fa 100644
> --- a/fs/smbfs_common/cifs_arc4.c
> +++ b/fs/smbfs_common/cifs_arc4.c
> @@ -72,16 +72,3 @@ void cifs_arc4_crypt(struct arc4_ctx *ctx, u8 *out, const u8 *in, unsigned int l
>         ctx->y = y;
>  }
>  EXPORT_SYMBOL_GPL(cifs_arc4_crypt);
> -
> -static int __init
> -init_smbfs_common(void)
> -{
> -       return 0;
> -}
> -static void __init
> -exit_smbfs_common(void)
> -{
> -}
> -
> -module_init(init_smbfs_common)
> -module_exit(exit_smbfs_common)
> --
> 2.33.1
>
>


-- 
Thanks,

Steve

