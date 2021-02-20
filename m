Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 382AC320385
	for <lists+samba-technical@lfdr.de>; Sat, 20 Feb 2021 04:31:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=292MATbzlB4o54+IM8HfKJMyHQgDxD2xmU+bp0SjGGY=; b=yLKu83SxTOSwwnAVhzUggkV2nk
	IRpP+EaZtBxZzqaDFvOXQLnidtdD0LbD7vPz/xr5qUWbZwmjbNW65iV3YARdLl+HYCTTVCFS16xK0
	z011+aKFm9miWoOf6BpYYJd9j2P8WcoFXnycdwtyoyLZZzNDOKVWuwhL49Xl0T87x8XP9rLj97QlP
	CodT7ExKlEk+eIBm5y1mJBmdGQu4M4QsjaabDAJlSz6rEzQ+GVkAssxc9wbBtoVf8LmXNXfThVreO
	HXlyDhQIbnwD+N7RY8YOCuKRqsfnROjWPViTRhXdGPZ/MGf2dvDoBZ3waA21aTksrP/lmkt5XdCU8
	/4MIb3sA==;
Received: from ip6-localhost ([::1]:55064 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lDIyg-000ljp-Li; Sat, 20 Feb 2021 03:30:42 +0000
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229]:33154) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lDIya-000lji-JY
 for samba-technical@lists.samba.org; Sat, 20 Feb 2021 03:30:40 +0000
Received: by mail-lj1-x229.google.com with SMTP id c17so34361930ljn.0
 for <samba-technical@lists.samba.org>; Fri, 19 Feb 2021 19:30:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=r8K9ekZ3bdz39MKAo+MDhCBvbDsw7hJnnCLHy2tI6FA=;
 b=Le6NoAix4ARvXP9uzyj63ab0lAksjY7u5bm2kIrhCyKxPBIuMZ9VfgMHRrRFGDAlE9
 MDP9w7u2wbevzFFxoWBHirdPbb89KKZX0+5GWKE/zdonGCylLQsWg8hJIpaiAyp8TTWd
 88+tqbq3tIfq9JAsp08TRQPaiOCWBZ5sEipvJMN51+9FqgHE7oD4wfmZ8QYcW8KEC/8Z
 au0e1j5dICoIrXbSlT9OHpjhXpv2Zgo8nvfSUTb4eNbyPBk+OcFoBiHgo+azBWZba/Os
 cQWL/dCflrUG53NqomMSFoGKj+2fyHJl5MhcJzxaq91i7dWiPr3JG6JnMzaMMwbhWg94
 3lhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=r8K9ekZ3bdz39MKAo+MDhCBvbDsw7hJnnCLHy2tI6FA=;
 b=OR+naPBe1rhKBGrRxQWNVztun6ob+PK3lo8UgbHLxgV+JHZe5rXOvCwmUKfedBfqYk
 Pj90SmR0AY3Hfy0zoyAX9I3u/AY+X4UykGmDfY3VnYO+Paq59eE4MbI/ZuZPAY1eLbZD
 ebgZgAwLLF0OWBULqpBn096IbmP0kFOGNpUXh+A1VC6oZphY2sNT3dBepxzRuNYSirch
 tcI+9+QAZ4ojmcorDEmgBdKPJAdglCD5L5bblzxMb1JZQPHuhyYpCFHoC9GH7G2jtfRB
 JpicOBKVkrrbF9AeT+XsJFHmbrMroQSvwKFYmJmNQj4bloyMQcTJut0ujbhCc/LLVKBW
 idsw==
X-Gm-Message-State: AOAM530yoUMrxeJta59/ZszVFIXkXOp7k4L3YEo1uy2cgBXXp8tWQ/6t
 znTHJL8WBn0iGfLXmhIJiXDu/bIwraqVGtCssKw=
X-Google-Smtp-Source: ABdhPJxitBFKOsQKaxYsdEKwHc21ZRAm31d3lL8zmGDrPjPW/8VM4mcSabfeZ0twwVuBuWnFcBOPnPep4DftP4a60yY=
X-Received: by 2002:a05:6512:1311:: with SMTP id
 x17mr7278973lfu.307.1613791823487; 
 Fri, 19 Feb 2021 19:30:23 -0800 (PST)
MIME-Version: 1.0
References: <20210218092812.20004-1-yuehaibing@huawei.com>
 <ee53a10aa0bf87445b1ab6be7c2db60aecd568cf.camel@suse.de>
In-Reply-To: <ee53a10aa0bf87445b1ab6be7c2db60aecd568cf.camel@suse.de>
Date: Fri, 19 Feb 2021 21:30:12 -0600
Message-ID: <CAH2r5munzCJ8PChnMgaqCv__Fxk4AKRQ7frn6jhhgwXJiQEGpw@mail.gmail.com>
Subject: Re: [PATCH] cifs: Fix inconsistent IS_ERR and PTR_ERR
To: scabrero@suse.com
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
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
Cc: CIFS <linux-cifs@vger.kernel.org>, YueHaibing <yuehaibing@huawei.com>,
 samba-technical <samba-technical@lists.samba.org>,
 =?UTF-8?Q?Aur=C3=A9lien_Aptel?= <aaptel@suse.com>,
 LKML <linux-kernel@vger.kernel.org>, Steve French <sfrench@samba.org>,
 Dan Carpenter <dan.carpenter@oracle.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

merged into cifs-2.6.git for-next

On Fri, Feb 19, 2021 at 10:50 AM Samuel Cabrero <scabrero@suse.de> wrote:

> Thanks Yue, it looks good to me.
>
> Reviewed-by: Samuel Cabrero <scabrero@suse.de>
>
> On Thu, 2021-02-18 at 17:28 +0800, YueHaibing wrote:
> > Fix inconsistent IS_ERR and PTR_ERR in cifs_find_swn_reg(). The
> > proper
> > pointer to be passed as argument to PTR_ERR() is share_name.
> >
> > This bug was detected with the help of Coccinelle.
> >
> > Fixes: bf80e5d4259a ("cifs: Send witness register and unregister
> > commands to userspace daemon")
> > Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> > ---
> >  fs/cifs/cifs_swn.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/fs/cifs/cifs_swn.c b/fs/cifs/cifs_swn.c
> > index d35f599aa00e..f2d730fffccb 100644
> > --- a/fs/cifs/cifs_swn.c
> > +++ b/fs/cifs/cifs_swn.c
> > @@ -272,7 +272,7 @@ static struct cifs_swn_reg
> > *cifs_find_swn_reg(struct cifs_tcon *tcon)
> >         if (IS_ERR(share_name)) {
> >                 int ret;
> >
> > -               ret = PTR_ERR(net_name);
> > +               ret = PTR_ERR(share_name);
> >                 cifs_dbg(VFS, "%s: failed to extract share name from
> > target '%s': %d\n",
> >                                 __func__, tcon->treeName, ret);
> >                 kfree(net_name);
>
>
>

-- 
Thanks,

Steve
