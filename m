Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 15DEA189512
	for <lists+samba-technical@lfdr.de>; Wed, 18 Mar 2020 05:48:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=9t6OER6Nr8rTZmv9fIvbSoay6iMJgVOYfySsd9QPfc4=; b=QQDtgO/jApRyMX4wWMnEZlXP5O
	OcBAxEOHX75mJ4XxoeKJN8WVXMlu1nwVfPnuNmPUgCiQG3MBHRHnNuQbV5OcZaRon98hccSekik/Z
	vYeX3kTzLQbIZh9tLuwar2xP5Zi6DU97uV0on7OPQv+TRMAWYrHi4GigY/WWsqZN9CDkduKgEqqAF
	6LAI15O2nskoNGe17oC+rJ0uSLiX5FRO8zjoOYleE2DVp0ECjoCfV+9MKuIuV9EqXRAhM8ybdJIZZ
	TVNqRauuAZEQDP6qDB514zNp0Fy2vsKgtX+qrNTqtk5uhj2BZVwE5UzfGGGqwVh4XH8pc7jgAAU7W
	//ELPH6Q==;
Received: from localhost ([::1]:28106 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jEQcR-000H6T-Ao; Wed, 18 Mar 2020 04:47:51 +0000
Received: from mail-io1-xd42.google.com ([2607:f8b0:4864:20::d42]:34317) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jEQcL-000H6M-UO
 for samba-technical@lists.samba.org; Wed, 18 Mar 2020 04:47:48 +0000
Received: by mail-io1-xd42.google.com with SMTP id h131so23645423iof.1
 for <samba-technical@lists.samba.org>; Tue, 17 Mar 2020 21:47:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9t6OER6Nr8rTZmv9fIvbSoay6iMJgVOYfySsd9QPfc4=;
 b=mfA+GMmCp4qNgKXbNcNzf8cghnXV6QQ3GtKTAxFhMdD6bRnE36h5Xo3rZwAUXBoNmZ
 nuGj1WreHi2fmsfZ3wRWJPTwZWKbcwxcHCJJ3wl1PhnaN1X95rsCkpPT9b//wmJeXFSN
 XgakKl2ogf7QvmgHiMGwTU/vTm6WUgtHxfFXS3ERvHEJEVThIiLpq+cKdg5fLQ27W3sx
 JoeBXDa85cjpI5pO1PUKyF2t9NggC9wu7zf4SnCNRVVI10Kgcis7Op2/Aujk5er8KzEa
 ij3V20oD2QMnmLU2JgWxoztvhNaHbXh9ndRIQm31FQ/yG/EtZrOI8COKYz9SBZiJchp4
 h0Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9t6OER6Nr8rTZmv9fIvbSoay6iMJgVOYfySsd9QPfc4=;
 b=BATrgJNZosPvuSefMRELazORte0UAKFsl3QvOI59+G+k++DTwgrO6dSfwO+ioPGW67
 dvpFTLJLM812SnUlYDD1NPMp2Av8iM6YIcIUyihQxXm+F/ofkkdEw42BvsjopE/8rlX1
 77idPdvRJOSbcf82KTwfJSvHfa70f8DUd+2cephxLPA38f4SE1+QUevgwiyYRTo4vuyX
 yVjOHBACCRBgZv6NSTntYiFW9pt9QdYqskSNzE4fGcmXRtBdOcQf+7nznQuIqNv0uHAI
 HkA0bGOlFM7j9w2oETLKOLs/8vxmvrRX8X+9VGC13ta1cYCqoO27wPl2GI1LVR4Co85/
 cdGA==
X-Gm-Message-State: ANhLgQ0vhTAx+SzmLe5tClB7EubWm9KVje2Dql2PxKrSlINHcpdLVege
 NkzWoGUdDcfWn5lQIFCNPd6tYf03Et5XJ8DcoGg=
X-Google-Smtp-Source: ADFU+vsgQ+qx2CLoR9BIj0WDMTsdIGixCf0zjYOE9Lr8efHI5AIL3zlIgFhzUgrpb+kZOdFKxZALyNWkE4zVHAWjSU8=
X-Received: by 2002:a05:6638:a99:: with SMTP id
 25mr2729836jas.37.1584506863812; 
 Tue, 17 Mar 2020 21:47:43 -0700 (PDT)
MIME-Version: 1.0
References: <ef49e240-fc8f-9eb4-af98-26bfd39104aa@huawei.com>
In-Reply-To: <ef49e240-fc8f-9eb4-af98-26bfd39104aa@huawei.com>
Date: Wed, 18 Mar 2020 14:47:32 +1000
Message-ID: <CAN05THQYxPcsgiHTqMcsTgB6ZDYaBMamu-sOe428H7EwSRU2HQ@mail.gmail.com>
Subject: Re: [PATCH] CIFS: Fix bug which the return value by asynchronous read
 is error
To: Yilu Lin <linyilu@huawei.com>
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
From: ronnie sahlberg via samba-technical <samba-technical@lists.samba.org>
Reply-To: ronnie sahlberg <ronniesahlberg@gmail.com>
Cc: Steve French <sfrench@samba.org>, linux-cifs <linux-cifs@vger.kernel.org>,
 "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>,
 LKML <linux-kernel@vger.kernel.org>, alex.chen@huawei.com
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi Yilu,

I think your reasoning makes sense.
Do you have a small reproducer for this? A small C program that triggers this?

I am asking because if you do we would like to add it to our buildbot
to make  sure we don't get regressions.


regards
ronnie sahlberg

On Wed, Mar 18, 2020 at 1:59 PM Yilu Lin <linyilu@huawei.com> wrote:
>
> This patch is used to fix the bug in collect_uncached_read_data()
> that rc is automatically converted from a signed number to an
> unsigned number when the CIFS asynchronous read fails.
> It will cause ctx->rc is error.
>
> Example:
> Share a directory and create a file on the Windows OS.
> Mount the directory to the Linux OS using CIFS.
> On the CIFS client of the Linux OS, invoke the pread interface to
> deliver the read request.
>
> The size of the read length plus offset of the read request is greater
> than the maximum file size.
>
> In this case, the CIFS server on the Windows OS returns a failure
> message (for example, the return value of
> smb2.nt_status is STATUS_INVALID_PARAMETER).
>
> After receiving the response message, the CIFS client parses
> smb2.nt_status to STATUS_INVALID_PARAMETER
> and converts it to the Linux error code (rdata->result=-22).
>
> Then the CIFS client invokes the collect_uncached_read_data function to
> assign the value of rdata->result to rc, that is, rc=rdata->result=-22.
>
> The type of the ctx->total_len variable is unsigned integer,
> the type of the rc variable is integer, and the type of
> the ctx->rc variable is ssize_t.
>
> Therefore, during the ternary operation, the value of rc is
> automatically converted to an unsigned number. The final result is
> ctx->rc=4294967274. However, the expected result is ctx->rc=-22.
>
> Signed-off-by: Yilu Lin <linyilu@huawei.com>
> ---
>  fs/cifs/file.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/fs/cifs/file.c b/fs/cifs/file.c
> index 022029a5d..ff4ac244c 100644
> --- a/fs/cifs/file.c
> +++ b/fs/cifs/file.c
> @@ -3323,7 +3323,7 @@ again:
>         if (rc == -ENODATA)
>                 rc = 0;
>
> -       ctx->rc = (rc == 0) ? ctx->total_len : rc;
> +       ctx->rc = (rc == 0) ? (ssize_t)ctx->total_len : rc;
>
>         mutex_unlock(&ctx->aio_mutex);
>
> --
> 2.19.1
>
>

