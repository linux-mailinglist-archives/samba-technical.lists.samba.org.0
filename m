Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 85CA65369C3
	for <lists+samba-technical@lfdr.de>; Sat, 28 May 2022 03:34:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=n4DAZBdaLL/g6XFS6QgCms1Gzfa6QkrtgLsny1wbvW4=; b=nRQzbu9MdapE6mn89DdInoVcw0
	GFjcWTn0K/hW6QMyDO7ar6x4vQm1ybSastiSix53yEYS0xFUSH5wR8mlVaPkEUI5crHuOFuAJSIG9
	FgaoV0sWSZ7arfQ8PZh7YOki/7dTEi0uOhLehKMBPYGXf1ZVL1qo1xjPNTlvfT1qCQ60/mdZAFlNO
	Vlq0/zsjQ5zBryrLyC6jnSH6wU6WFPOJYBsVc6Yog+M4CmybtA3xhGoC2vHY1oHaajjvvc0aLcQGc
	v7U7Wn/Hx8X3Hed7xDZXSx02KNvlqm0VhcD7yTHK2Qnnmq6ksFZCFRGbAG57/pIgO7JzjO+bl1rIb
	u2o3EN6A==;
Received: from ip6-localhost ([::1]:43668 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nulKJ-003ZCr-RO; Sat, 28 May 2022 01:33:12 +0000
Received: from mail-vk1-xa32.google.com ([2607:f8b0:4864:20::a32]:36564) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nulKB-003ZCi-2g
 for samba-technical@lists.samba.org; Sat, 28 May 2022 01:33:08 +0000
Received: by mail-vk1-xa32.google.com with SMTP id u188so2742160vku.3
 for <samba-technical@lists.samba.org>; Fri, 27 May 2022 18:33:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=n4DAZBdaLL/g6XFS6QgCms1Gzfa6QkrtgLsny1wbvW4=;
 b=BtqFQ7cmMvO0yOXNuk12Hw1NTanwTkbaQejWyG3Nsv5ZHHVeStXXa3bUpNFRX7PGVx
 Ai3eRhdX6w+xOBf+9jS/KhQYnILdIEY4ETFV11JedpGg+IZdDuzs4aLmkj+eEHn2cuct
 q0aOETPZlYrySEnnGstvUKV5sWGwUIXZILYarVWzFopCks63LWM8Iyi/cXhAYeQgJRNH
 REj9K9xqh4UntdObju9EavOcTNPgQzsuuWVwlNe1carn2yUfyHO0QuWRM60DOZAqeKvD
 I4dH4NJAJZT6aRQAXjbuxvX5/bqcDctu/ZBRfVpSbzNn6P5+lOXutcMj3G9j2wvyT1Om
 Sd6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=n4DAZBdaLL/g6XFS6QgCms1Gzfa6QkrtgLsny1wbvW4=;
 b=Ucz8RH15EnleZiNZS9tcDEOVgRSnRHm5VYWDBPd+tNeHAbsJc4xPYmqgLJ4mprcycy
 40tb5t0dg/oc48QBI4NprKY4wICyBfx6U5P6q8CXkj1IXyRFgj0SsEwiPEPKryZVIXOl
 qwHfX94BXwcLK8CbUpFbmskw8yML+Fj5FefXlvzAAXuE/ec4r4YOCwSsOOqh0a0lGwGW
 +u/AZNc/VREBI1ITwIkc7lfUph6SPz4I1Nu3rhfAlWme7KT/CliXkDcHZOpIvuo2ZtBj
 EnUqBnz57ikCJ23iyioCqKco2sQFlMJm7PYx7Oi8jbS/YTmHMpEg89zR6w+oSmNQmBAx
 Jf1A==
X-Gm-Message-State: AOAM532NtdpA9/cWx5qf5R1elWClwOe75MZ6ViScpoNixxRBXN19a2XF
 3N2qscYZwSkFzTnYgLk3Av2fgQ91F8RSb6jQxI8=
X-Google-Smtp-Source: ABdhPJzAtDsFq2sRy+UlcoUFE+V6lAuAcSUAFj7SFgcdrYcD1arLZQoX3iEUIQGdcKoOz9vr2/8xG9K2S7A4FMvLJ9U=
X-Received: by 2002:a05:6122:2027:b0:35a:19c8:3ec7 with SMTP id
 l39-20020a056122202700b0035a19c83ec7mr3903786vkd.4.1653701580256; Fri, 27 May
 2022 18:33:00 -0700 (PDT)
MIME-Version: 1.0
References: <20220526232606.64174-1-yang.lee@linux.alibaba.com>
In-Reply-To: <20220526232606.64174-1-yang.lee@linux.alibaba.com>
Date: Fri, 27 May 2022 20:32:49 -0500
Message-ID: <CAH2r5muhKEaxgwJQG7s46h1v+1CHVEP441+x+W4dBk77QbYK2Q@mail.gmail.com>
Subject: Re: [PATCH -next] cifs: Remove duplicated include in cifssmb.c
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
Cc: Steve French <sfrench@samba.org>, CIFS <linux-cifs@vger.kernel.org>,
 Abaci Robot <abaci@linux.alibaba.com>,
 samba-technical <samba-technical@lists.samba.org>,
 LKML <linux-kernel@vger.kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

I don't see this line (ie the include cifsfs.h) in fs/cifs/cifssmb.c
anymore could you do a "git blame" and find where that line was added
in for-next?

On Thu, May 26, 2022 at 11:27 PM Yang Li <yang.lee@linux.alibaba.com> wrote:
>
> Fix following includecheck warning:
> ./fs/cifs/cifssmb.c: cifsfs.h is included more than once.
>
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
> ---
>  fs/cifs/cifssmb.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/fs/cifs/cifssmb.c b/fs/cifs/cifssmb.c
> index e3457356ec11..193009f1421b 100644
> --- a/fs/cifs/cifssmb.c
> +++ b/fs/cifs/cifssmb.c
> @@ -28,7 +28,6 @@
>  #include "cifsglob.h"
>  #include "cifsacl.h"
>  #include "cifsproto.h"
> -#include "cifsfs.h"
>  #include "cifs_unicode.h"
>  #include "cifs_debug.h"
>  #include "smb2proto.h"
> --
> 2.20.1.7.g153144c
>


-- 
Thanks,

Steve

