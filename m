Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F5ED34151A
	for <lists+samba-technical@lfdr.de>; Fri, 19 Mar 2021 06:54:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=ieKEg/I8DWyrNnzM2/enM81rs852gdyY9A7m+JJ808U=; b=hil0UvTGzU5rs3nXm88Sk2GQ3M
	r6ULxbiz3w4tx0vOKTg4E0EBras4iWtOekK+6vvap4A1XmcB2mlYBEuSrdURLUM4pci7GmQDOrTd0
	llhr3/S3lPYcNESWQY+7Clq4qoNxxdfMt8JOpKsdL+2qYuAt692ObAVO51AtaxcaPo5Si2K0eUxVz
	//0TvdFJZVhKBqoUevyDbA0OrdSwuoaTtD/w3YlksrGi0EEekTKYgB3s+MZUMFt+6tPKb2d1rro4f
	svQFgGwytKZqUX7bHlrByqoMqJQEd/lu48EU3FLIcPOOIEdpk8cyLiibn6cNk9tanR/m4l402iRDU
	jW5csmdA==;
Received: from ip6-localhost ([::1]:48560 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lN84P-005xPC-TB; Fri, 19 Mar 2021 05:53:13 +0000
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236]:45642) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lN84K-005xP5-0n
 for samba-technical@lists.samba.org; Fri, 19 Mar 2021 05:53:10 +0000
Received: by mail-lj1-x236.google.com with SMTP id z8so10449591ljm.12
 for <samba-technical@lists.samba.org>; Thu, 18 Mar 2021 22:53:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ieKEg/I8DWyrNnzM2/enM81rs852gdyY9A7m+JJ808U=;
 b=iquAE73D+G5vtFjan5O+JlTPfC66rcUGH/5thoAYHxPmC24aRf/jy+PA3N8+BpHx3u
 g2KmGfunQ6z4ink3IHSgAg1+a+VbCxC5nivZehVhVfMDUa5V0lcH9eHLBAcfktr8HB8c
 JXd/YLFYA/QBhunWB86TPz8WYOP2qb90C5psmvcS/0gnMmftlZJ6VOwD3mMBLpo+g75Y
 9/o+y+Lke2U7b2OXIvaj9v29YDqNG4rRkFWPwNSgCPKmsNJj8FW4AcdIfAvLn89O/ldy
 UlccC/CAB3UN3X1dzXG79XeZn3AByb9CGsFRvnx7RebEg1BJ/cbnVbk/xcJYqH2n8LIF
 4jRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ieKEg/I8DWyrNnzM2/enM81rs852gdyY9A7m+JJ808U=;
 b=XyGWGiNTDiJWWifjTemU4I4KaqxdPBdAioiPRqZH5q1UBxCw6naWL6Q4/Nl+HZSa0L
 iRFEdHUwuAcQqHY16FRLzMJWkylZ1JIz+40+ceU9ZNMEVz0Z9fj7ObIbxI6QBDTE/93o
 xVrjPFeNdTWQtiqi/D7mOW+QzVUxGanTE+3+mfJm0dhfZKECzS3fyude72mzq5+w0P1p
 aL98pJXtPD3WiPYJGaQ8xFFKdp5sZ/EFXxeJnorik7q6gVNG7VEenyLOgw8iHrsxHwx9
 NSx2zFJFnbapsdghyG9FuueczftIprhN56F7EHjMm2iEyLr7BvaR9rZAf0ia6dkvXjKS
 wdKw==
X-Gm-Message-State: AOAM532zzAakE788awJUFAkb4m/ETy1HXvW08V7bB9DeNRjFlrp3pxn9
 6WXrn5BRUQtUNzx2BdcS86y+r3h3QbAVND9kkT0=
X-Google-Smtp-Source: ABdhPJydyF85xrIO4j2aR2Wm5nIVy2epWPKLP+h7WXhkpS3H1B7/f3GVCd/4EXVHM/UTaYywdG+DosSaWPia01x72gk=
X-Received: by 2002:a2e:9907:: with SMTP id v7mr3584997lji.256.1616133185055; 
 Thu, 18 Mar 2021 22:53:05 -0700 (PDT)
MIME-Version: 1.0
References: <20210319004657.485503-1-liu.xuzhi@zte.com.cn>
In-Reply-To: <20210319004657.485503-1-liu.xuzhi@zte.com.cn>
Date: Fri, 19 Mar 2021 00:52:54 -0500
Message-ID: <CAH2r5mvXw8mdY1b56O6802NoemXMh70P4MJY0E-dr-rZ6=Cu-A@mail.gmail.com>
Subject: Re: [PATCH] fs/cifs/: fix misspellings using codespell tool
To: menglong8.dong@gmail.com
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
 LKML <linux-kernel@vger.kernel.org>, Liu xuzhi <liu.xuzhi@zte.com.cn>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

merged into cifs-2.6.git for-next

On Thu, Mar 18, 2021 at 7:50 PM <menglong8.dong@gmail.com> wrote:
>
> From: Liu xuzhi <liu.xuzhi@zte.com.cn>
>
> A typo is found out by codespell tool in 251th lines of cifs_swn.c:
>
> $ codespell ./fs/cifs/
> ./cifs_swn.c:251: funciton  ==> function
>
> Fix a typo found by codespell.
>
> Signed-off-by: Liu xuzhi <liu.xuzhi@zte.com.cn>
> ---
>  fs/cifs/cifs_swn.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/fs/cifs/cifs_swn.c b/fs/cifs/cifs_swn.c
> index f2d730fffccb..d829b8bf833e 100644
> --- a/fs/cifs/cifs_swn.c
> +++ b/fs/cifs/cifs_swn.c
> @@ -248,7 +248,7 @@ static int cifs_swn_send_unregister_message(struct cifs_swn_reg *swnreg)
>
>  /*
>   * Try to find a matching registration for the tcon's server name and share name.
> - * Calls to this funciton must be protected by cifs_swnreg_idr_mutex.
> + * Calls to this function must be protected by cifs_swnreg_idr_mutex.
>   * TODO Try to avoid memory allocations
>   */
>  static struct cifs_swn_reg *cifs_find_swn_reg(struct cifs_tcon *tcon)
> --
> 2.25.1
>


-- 
Thanks,

Steve

