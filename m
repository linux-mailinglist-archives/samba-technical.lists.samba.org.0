Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A43A35936B
	for <lists+samba-technical@lfdr.de>; Fri,  9 Apr 2021 05:54:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=WvAkE14RRxFyw37VbW7supzk2d4KzKaaFk6V2nsZhQc=; b=nt1VS+AVe+uv6W+oXM8n8k5yQw
	HY1CGIbp5JpD6KjWze4GxN56J9H+43+WxBJQJbK0ORjoyP5xfA6gCij5ZOKZcgw+UT5YVvYeu2zPp
	/Y1VpzgFV0hpCaTfZBCpDcDe4bshcDnJeCMSN2kHv2KxQhlGYqyq1BkZIisfMVcxhdZ/jXrKYjBk+
	RrzcgNkSJb04ff3oAlXR0OhCLeD45EH/u+682ouxa87Xkw9dfEW4LadCekER+NLt3M8e6aPmIGmCA
	3tMvVTH7viMvGJBvRsOssZ94zjU1DFEj7sSDAXYydfaAIfdwtM3tlHdh7DHXqsVuhAWQ2wK54aRJ8
	ISuuSXQw==;
Received: from ip6-localhost ([::1]:49156 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lUiCz-00AbWw-LS; Fri, 09 Apr 2021 03:53:25 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e]:42869) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lUiCt-00AbWp-SA
 for samba-technical@lists.samba.org; Fri, 09 Apr 2021 03:53:22 +0000
Received: by mail-lf1-x12e.google.com with SMTP id h19so7478333lfu.9
 for <samba-technical@lists.samba.org>; Thu, 08 Apr 2021 20:53:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WvAkE14RRxFyw37VbW7supzk2d4KzKaaFk6V2nsZhQc=;
 b=Bes+aZ8kQWHR8gW+UFXLxhe2qQj9C4RZbvCC9IHufR4O78b+ajGfFHFXjQa5Dldzxs
 u3jvjTjJXaOVJdpfWEKQ9wfK+KxymjJKajonU+uL4191I3QspKmea917j9nMus5xMXGy
 3k3U4X0sLzyjDT+k8Dpa1CodWZEyltZgQvotn4B0QmnFY16ZQ5ibWdoRFjpayByEnEab
 dD02pRam72lYHtwHuBngVn97sA7LA15NLjRyrSfX81DIi66RyK+RTuStrjich3nWmLnJ
 o5EYAG4IWjIowlBgLkvG+4PqAkXcgWtU6P3Dm1NsNimGRsGzsORZEnWBxrr0vPOcaDC6
 GCZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WvAkE14RRxFyw37VbW7supzk2d4KzKaaFk6V2nsZhQc=;
 b=fPjeMDv1i27cZCM23LafmYSsC5zNCzsZizZU2xdp0KZgsiSn+Wv3qeFY+a9NYNLpFp
 BWJF6SeF4aQGGtCck7DXXlBjxcHlWOFDGYZHWAckVIDyoPMNyP1TxuMO3lm9rLeQQr7H
 eZ0DqzuWZ1rSK4hfe9X9pjRZkELSpXOvReCI8okhx1FgpDh1rm9CH7egZMXKoYiKsDIj
 Wnvwiv5IrWZOS3pvTNk4HouAYZ0XnbDmiutXV9GmiJxjDzIHEla20JU3z+Unjozn1Fhh
 at8Mam4LtUPYZERCpUOpDYT9YlCARWjemiV38omC0MXw6lXlTfzsDcO+LpE+3ZezZ+m8
 rZkg==
X-Gm-Message-State: AOAM532y94SFXUFstUVKX6NpzsI3S9g+xjm7Ak5uI/vGswSVU2HlPzYo
 lxJqq8kLsCRk61akEXXBH6WWWlu5WwZlC8wmQ2k=
X-Google-Smtp-Source: ABdhPJz4OoYDuXPlbyzjjdbCDm7bu+Itw0zg+AhNUPCi78022CFqFtV8pXgxDrS3RfpuLFbQVdCBZCiVCqd6Y46rsoI=
X-Received: by 2002:a19:8c0a:: with SMTP id o10mr9022702lfd.175.1617940397489; 
 Thu, 08 Apr 2021 20:53:17 -0700 (PDT)
MIME-Version: 1.0
References: <20210409024639.1092204-1-wanjiabing@vivo.com>
In-Reply-To: <20210409024639.1092204-1-wanjiabing@vivo.com>
Date: Thu, 8 Apr 2021 22:53:06 -0500
Message-ID: <CAH2r5muuziT__TfpFWgeQkXRLkE0ZmekAXLBVwxwOAmCAFrh2w@mail.gmail.com>
Subject: Re: [PATCH] fs: cifs: Remove repeated struct declaration
To: Wan Jiabing <wanjiabing@vivo.com>
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
 kael_w@yeah.net, samba-technical <samba-technical@lists.samba.org>,
 LKML <linux-kernel@vger.kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

merged into cifs-2.6.git for-next

On Thu, Apr 8, 2021 at 9:47 PM Wan Jiabing <wanjiabing@vivo.com> wrote:
>
> struct cifs_writedata is declared twice.
> One is declared at 209th line.
> And struct cifs_writedata is defined blew.
> The declaration hear is not needed. Remove the duplicate.
>
> Signed-off-by: Wan Jiabing <wanjiabing@vivo.com>
> ---
>  fs/cifs/cifsglob.h | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/fs/cifs/cifsglob.h b/fs/cifs/cifsglob.h
> index ec824ab8c5ca..5ec60745034e 100644
> --- a/fs/cifs/cifsglob.h
> +++ b/fs/cifs/cifsglob.h
> @@ -1316,8 +1316,6 @@ struct cifs_readdata {
>         struct page                     **pages;
>  };
>
> -struct cifs_writedata;
> -
>  /* asynchronous write support */
>  struct cifs_writedata {
>         struct kref                     refcount;
> --
> 2.25.1
>


-- 
Thanks,

Steve

