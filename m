Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B2F1235AA70
	for <lists+samba-technical@lfdr.de>; Sat, 10 Apr 2021 05:04:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=I/wRxX1R9oNjkGChxLuwTfeQJQhzEhqKDOWET2I+Z38=; b=cQF8bpQv5rOlJ67nv7LpJH8p6m
	CR4WfHYHbu3onywSc+S2om4vfWBAEUOtagt6J2nJalwIjhQS2uGU6J4bXJKc9cskJNcgAv1wI8FgM
	r084mBNn3E7BqVCi520BS4Wd1hBRXQWgOLK4bo6FAVfOg1Dz4QHUYtpNvx0WrHQ2bCZJ8RNaJ5Qhz
	OldQzG840wihdeHT0R3TmnzBwXjSRX9FZ6cb0Is+npMYosfU7/PUSUQ2NcxllrDoj97LPnKzIZ+Rf
	cl0LJw9LwS31j0TGs9hwXIfC1SZ+crbCim86bFpYxWYjJfePGbv7fSEu5Nf5Ixd4S/hjsKrdhgVQ+
	k7W1mdoQ==;
Received: from ip6-localhost ([::1]:52828 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lV3uF-00AkHO-65; Sat, 10 Apr 2021 03:03:31 +0000
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233]:40470) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lV3uA-00AkHH-2U
 for samba-technical@lists.samba.org; Sat, 10 Apr 2021 03:03:28 +0000
Received: by mail-lj1-x233.google.com with SMTP id c1so414585ljd.7
 for <samba-technical@lists.samba.org>; Fri, 09 Apr 2021 20:03:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=I/wRxX1R9oNjkGChxLuwTfeQJQhzEhqKDOWET2I+Z38=;
 b=Inm5K8AjwQqChONCOH2iIzctpL24AM9K15FYc7zoX4EmBpBFDlscB28ar6tATAXdiQ
 i8moRrgkrIne0xlJPE9Xktry0vkMTrDxy+qq1EX5DsoB4XP8VBLCsTCLOdzQAUvj6A0V
 LMrFVk+Q5fk0yEop1v78k232vs0BlWgOuMerKG4NudZllZR39DW8ZlD5tMaPpYsVDz5f
 8Z6NDmdz6CBq+hIcOGmuqJBql6rlJURdK5Af8iIGVUoDXgLYmQC8KYWkbN33ulCr4jcD
 Y7lkdk83bSb9guzF5idArczgsySr9sftB97Vcu2oC4z3rd9q7qIhkUmebhVHsJweXpY9
 pqyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=I/wRxX1R9oNjkGChxLuwTfeQJQhzEhqKDOWET2I+Z38=;
 b=L2O5Mvu42YEgH8c4rFh1LgJWylAX3htqqi0+KyO82hngWjh8gJJPlokoPzSQUDVykK
 1/7BhTlgiWD7KOcgmVPeBmtqonNVRzZMYkcy1UFHloqWZnpyjGNq70rrYS0drnSvdLQB
 Plq17UC+MGC3RzeuotTE69mCKX7VZhMl8Q0F8isW4e8b5R6hSVvSV6iXePCOo674Kerc
 US5BnY5Yi2jPhYBtOvq23URVx8tx/1W7txcn1Yw5ntM4PM4rH/IFo8djZpjEC8Llyewv
 El0OaWMZQYIcQArJ9E1lV0OGv68lUl3szIZmLMqdXOWPaL1LuQDkAFcI69u7xpHALctw
 2/mQ==
X-Gm-Message-State: AOAM533JvzvjNUEEF+mneokix/pGQywzeL+G+HhXGYjwuDRgHR+VKSzz
 6q31st9DGk6CU1iSXug2UiGzGtZC+mct3egymFs=
X-Google-Smtp-Source: ABdhPJy0Xm/gsEDLh86mOz6oX3ooDgaOPzxzCaUH9nFk0p40AUJcPhgInDJ4vmIP9xN3+2agu03CTlIEtMRvagckUIE=
X-Received: by 2002:a05:651c:339:: with SMTP id
 b25mr10967483ljp.406.1618023796589; 
 Fri, 09 Apr 2021 20:03:16 -0700 (PDT)
MIME-Version: 1.0
References: <20210407022655.21124-1-liliu_096@163.com>
In-Reply-To: <20210407022655.21124-1-liliu_096@163.com>
Date: Fri, 9 Apr 2021 22:03:05 -0500
Message-ID: <CAH2r5msQd88mgu_AOFRckzxmqA19NLcKyNggR253HawA2dM+og@mail.gmail.com>
Subject: Re: [PATCH] fs: cifs: Fix spelling of 'security'
To: liliu_096@163.com
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
 LKML <linux-kernel@vger.kernel.org>, "jack1.li_cp" <liliu1@yulong.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Merged into cifs-2.6.git for-next

(strangely ... this patch was sent to my spam folder in gmail so
didn't notice it until today, and by accident).

On Wed, Apr 7, 2021 at 9:03 AM <liliu_096@163.com> wrote:
>
> From: "jack1.li_cp" <liliu1@yulong.com>
>
> secuirty -> security
>
> Signed-off-by: jack1.li_cp <liliu1@yulong.com>
> ---
>  fs/cifs/cifsacl.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/fs/cifs/cifsacl.c b/fs/cifs/cifsacl.c
> index 562913e..d2d8e26 100644
> --- a/fs/cifs/cifsacl.c
> +++ b/fs/cifs/cifsacl.c
> @@ -1418,7 +1418,7 @@ int set_cifs_acl(struct cifs_ntsd *pnntsd, __u32 acllen,
>          * Add three ACEs for owner, group, everyone getting rid of other ACEs
>          * as chmod disables ACEs and set the security descriptor. Allocate
>          * memory for the smb header, set security descriptor request security
> -        * descriptor parameters, and secuirty descriptor itself
> +        * descriptor parameters, and security descriptor itself
>          */
>         secdesclen = max_t(u32, secdesclen, DEFAULT_SEC_DESC_LEN);
>         pnntsd = kmalloc(secdesclen, GFP_KERNEL);
> --
> 1.9.1
>
>


-- 
Thanks,

Steve

