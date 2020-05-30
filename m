Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 0159B1E93D8
	for <lists+samba-technical@lfdr.de>; Sat, 30 May 2020 23:09:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=N3uLWYoa/hZAbc4d3OlSWhNwaMdQAPLUT8g8/VN/Ehc=; b=HCZ8Xh6/3gDxpLRlHUoWw+1WzO
	IMNc9Af+WDIWX/SeGlAVPNA6cXEhU5spmAy8abUg41LOn0F4YCUZcii5dI2spqdxPQXxUoYSzXM/q
	SqmWq2dGecEouEqQSLRJ3mP/ASB2japcqvH6Z3uZVnvRE+L9z0BqsaSYwzVGh/ldsdXOAKvO7axYh
	rudDL2vgZjApUerlZ4/LQJdUrTk1zt8Am8FGdfcBm1G06VIPnJ8qWpz9cRYeQYkKbrlyXUoPQt6lb
	yk7ES2uX2Yv1Fc25DsyRkYf2NL4Q4ERFijwXtAl+3wpLOOkxJPIwOsKGD9uS1eWScqr5txpbXujCC
	53WQ7eDw==;
Received: from localhost ([::1]:49378 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jf8iK-006RPs-T3; Sat, 30 May 2020 21:08:20 +0000
Received: from mail-yb1-xb43.google.com ([2607:f8b0:4864:20::b43]:35315) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jf8iF-006RPl-I2
 for samba-technical@lists.samba.org; Sat, 30 May 2020 21:08:18 +0000
Received: by mail-yb1-xb43.google.com with SMTP id v15so3077719ybk.2
 for <samba-technical@lists.samba.org>; Sat, 30 May 2020 14:08:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=N3uLWYoa/hZAbc4d3OlSWhNwaMdQAPLUT8g8/VN/Ehc=;
 b=I+V69rxL5tA6THo02L4NHjlDUbUI/axbTjh0I3YDiDpDrcABy571xoZLELee6gmlha
 phRVT6GdK8A3Il32WoiTA/7wp0jWssqat/5oZ2adFYwEchyWJx3eIZYbkkjkjHVo2ECh
 icZItFXR2vRQB7LBCE7kVtTCuuoC9/0fseKchY0BM9WN7AfwCMsvTd+IuJDQm6XfuE6B
 UP+NmZEqPR00KwDqWgiTrFCRC5e62nO5byf8rEWH2FHjOQwU4pmuD7lNXGaD7qwISoE8
 9Ua72fJGhZCi4+JF2Fb6rgOClEjjN9VkNuapwoy1cdTEWA5HMbv2aGbFUR7CmRNxQCX2
 B+Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=N3uLWYoa/hZAbc4d3OlSWhNwaMdQAPLUT8g8/VN/Ehc=;
 b=fCtqLlBIPP/jxkQCsK+Or8Ft3CtDS/5pxOWfx5ZA3EXj5s5yqvnM0KPfWtJTMnygXP
 704m7nbxp7+BUyN+tFg2l99AVbu+VtTF1xFWhQjWYzfciIFQR4lqsL++fq1dqdcRm5HN
 9PX+DTIU6WGwPS+hJCv+T8QMeKTHYjc7uoy8w1gPb1UNtZltaLYiygOBd20AzXacSREB
 yoS6ydv9TmJl9IS5BpAc3shUs/71G8FJTcygEaS0Htf+rwtbGrbbwAuLibe29uaC8WD/
 2Idp2zfU+YoYHV99e9Y/ih6rClaa3zF33sIBuRsWl+9SuaqpDKXlQubgPhKhJolqYNew
 Zl1A==
X-Gm-Message-State: AOAM532tiwTHQTHfu9JVqbvVvaWowgqgclIrTceOmIIImPbTFAl6I38I
 FoKV/kfewnfoLua1MRmYtW+kjkC794iU8Dlj+pc=
X-Google-Smtp-Source: ABdhPJyWlckeGlqw5zAH1gPRyoitajS9v7QUSji0TnTK98AJzrSglomGIeyo01OMjM9VBYsEaZiuBqMxouRX1PXIFKU=
X-Received: by 2002:a25:4487:: with SMTP id r129mr9834916yba.14.1590872891914; 
 Sat, 30 May 2020 14:08:11 -0700 (PDT)
MIME-Version: 1.0
References: <20200527125031.173987-1-colin.king@canonical.com>
In-Reply-To: <20200527125031.173987-1-colin.king@canonical.com>
Date: Sat, 30 May 2020 16:08:01 -0500
Message-ID: <CAH2r5mumV8UJPaXx-hWMWOB3bjz5dPH=4gEkiDGQBqnYdFxq3w@mail.gmail.com>
Subject: Re: [PATCH] cifs: remove redundant initialization of variable rc
To: Colin King <colin.king@canonical.com>
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


On Wed, May 27, 2020 at 7:52 AM Colin King <colin.king@canonical.com> wrote:
>
> From: Colin Ian King <colin.king@canonical.com>
>
> The variable rc is being initialized with a value that is never read
> and it is being updated later with a new value.  The initialization is
> redundant and can be removed.
>
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  fs/cifs/cifssmb.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/fs/cifs/cifssmb.c b/fs/cifs/cifssmb.c
> index 5014a82391ff..d62f9175c546 100644
> --- a/fs/cifs/cifssmb.c
> +++ b/fs/cifs/cifssmb.c
> @@ -2375,7 +2375,7 @@ int
>  CIFSSMBWrite2(const unsigned int xid, struct cifs_io_parms *io_parms,
>               unsigned int *nbytes, struct kvec *iov, int n_vec)
>  {
> -       int rc = -EACCES;
> +       int rc;
>         WRITE_REQ *pSMB = NULL;
>         int wct;
>         int smb_hdr_len;
> --
> 2.25.1
>


--
Thanks,

Steve

