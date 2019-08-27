Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A301B9EF4E
	for <lists+samba-technical@lfdr.de>; Tue, 27 Aug 2019 17:47:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=jn4Zk1YEfNuZWrJiBEF7aJIJ61Ws8t1i4se+p36owVI=; b=mMmRmVGiQEPMKqEM88XR5fp78f
	+33Kri30AZPpR58PNJ9UtI8LQ0x/IEgRMv+LCsKXDbz8ajQt8MwLFU6Outsj0UQzWx7M8HaESCVnE
	8XGJLoVXJKv6DRt4bUlfZdGd1I64LTYd4R1dCYijiEZz75I6iooVtjGf4+mFq99NEwtU0pw6+w5uD
	U0HLPH4l2mjKUzNrboi/IKQ+nUYyF5ByG4ovUqhdmlG1/Y1NGsbEJxvvy8NQskLguWKoiu7K51Q15
	HvlX4SBKzWhkaTBWsvtMoEzcSQajLzkETkHujXU7/OYykSuKkXbeURUh4JbH/AgMNawzfbbsYtUUm
	UWUA+UNg==;
Received: from localhost ([::1]:18110 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1i2dgR-008l8b-Uk; Tue, 27 Aug 2019 15:47:00 +0000
Received: from mail-io1-xd43.google.com ([2607:f8b0:4864:20::d43]:34234) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1i2dgN-008l8U-ES
 for samba-technical@lists.samba.org; Tue, 27 Aug 2019 15:46:57 +0000
Received: by mail-io1-xd43.google.com with SMTP id s21so47470596ioa.1
 for <samba-technical@lists.samba.org>; Tue, 27 Aug 2019 08:46:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jn4Zk1YEfNuZWrJiBEF7aJIJ61Ws8t1i4se+p36owVI=;
 b=LUZyKDlayR4pWIMzcszOZAyIVoE7X18xbsQ+g2Mbjg54iDvxggsn/nScfmZH84Ig5k
 OMoAX46BmbHtN9Aw/LXurfgimGCtFUvUAfTJnTVUpWf2s6lK7kMdmW1Yzy2r/6xqnfbf
 lNle6zklHGr76QK3r4/L87XCwM9nSB0T+fn7BUMzNPleWNE0P2B0WxmpNvfpFoOZXw5+
 Qr3sqimdNjt1vtd0guKpiZynJu1vn8tnVOZf21KpzaDbLdAkhP6mJt7sSr7dE4gjk8Xu
 D+4ADz5j8uvQekaMK+q758BxZFueKmLLXQ6bW/BiMd1MMty2G0UH7fJ1Tziir3xFGEml
 9NVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jn4Zk1YEfNuZWrJiBEF7aJIJ61Ws8t1i4se+p36owVI=;
 b=Hplr3gKFzFGRZZ74ZUoKfGirAjM4Lr7bZkKa1f0fP66L+t+Yr9oHcUzc+0k1KcpAa1
 l0O4XQTKb99eL3dlsV6Fqhfzn+U07PFpY6EbYBuI5IEQp0xemUXAvEoQL0aqWdZdjCqf
 9Z89VkiN8w76nQpZQWo6Sr6hl9iQzqYqHhPCV2G7mNtCaYMYxglgF7go0V/tXv9e7PmS
 St0JJ/efel0xiaC/jGznNiQ11eFkKcfNYlzVbmF4/xq0ktZAudQWXxGANvuBXouS8Bqt
 6qY57WvffyydQzEeFQY4jH241nPqHyyUzBcmpUwyvoM5VLTTJOucMDCLltZ7PAjzz9Ae
 XgFg==
X-Gm-Message-State: APjAAAUZvi51lc0oA6H8SX6MpWey6ZmGr/Bnb0WZxaXNWe7wWRgoUGSn
 nr8I0M1kPwLZDaQC0JEodNJeahdfzCiS29jKluc=
X-Google-Smtp-Source: APXvYqx79sSUk/Xxv5sBSR6GSI6Ao9kCciCfu5cTEkuGnr/Oly4C7LhXQyHQ+p4iI6jh4z0WFt2dk87f7/twPzLOUfY=
X-Received: by 2002:a02:ce49:: with SMTP id y9mr24372245jar.63.1566920812306; 
 Tue, 27 Aug 2019 08:46:52 -0700 (PDT)
MIME-Version: 1.0
References: <20190827105917.GA23038@mwanda>
In-Reply-To: <20190827105917.GA23038@mwanda>
Date: Tue, 27 Aug 2019 10:46:41 -0500
Message-ID: <CAH2r5mtNVwt-Dp8YVvbVHbYEpUAG_bw=aqJqWdB1Wb-hY1e=NQ@mail.gmail.com>
Subject: Re: [PATCH] cifs: Use kzfree() to zero out the password
To: Dan Carpenter <dan.carpenter@oracle.com>
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
 Ronnie Sahlberg <lsahlber@redhat.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

merged into cifs-2.6.git for-next

On Tue, Aug 27, 2019 at 6:02 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> It's safer to zero out the password so that it can never be disclosed.
>
> Fixes: 0c219f5799c7 ("cifs: set domainName when a domain-key is used in multiuser")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  fs/cifs/connect.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/fs/cifs/connect.c b/fs/cifs/connect.c
> index e6cc5c4b0f19..642bbb5bee3a 100644
> --- a/fs/cifs/connect.c
> +++ b/fs/cifs/connect.c
> @@ -3101,7 +3101,7 @@ cifs_set_cifscreds(struct smb_vol *vol, struct cifs_ses *ses)
>                         rc = -ENOMEM;
>                         kfree(vol->username);
>                         vol->username = NULL;
> -                       kfree(vol->password);
> +                       kzfree(vol->password);
>                         vol->password = NULL;
>                         goto out_key_put;
>                 }
> --
> 2.20.1
>


-- 
Thanks,

Steve

