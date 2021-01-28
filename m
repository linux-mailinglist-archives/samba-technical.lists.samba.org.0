Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D464E306A51
	for <lists+samba-technical@lfdr.de>; Thu, 28 Jan 2021 02:26:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=WLd3m2anYlo17qAtsO8VgbCYDsIU6XiczphB8GO6huw=; b=hhbAfXrNKd8E/IgpUNOfHlTwyB
	xr++NoisluOhOOp9wUgqMDDhrsp0MX7mq5agBf595gyHxarkT4GiZ7rMq6MuXzSQAv3paFE5KBt1S
	zEPZhsqd/zhr+zUUL+5fhBv0Kpm7Aakv2kUtSGJBledS5mebRUUMA2vDyLM5pSZidNSQC18Z1yORK
	loW2qoKOpuyJWVsZV/rXxLw8ObgSmTWtjqTrOTaFxiVy4XfDpYl1xCKxzTRmsEyyAp4EwTmuy0Uqs
	oZ7y7i2vT4QZaUopC2X15z3Omnky9c0Moc1M0suoqpZNFr6ojXCHh2KDYV6FmokTEtDOLIjZu6qMe
	z80zhkwA==;
Received: from ip6-localhost ([::1]:62444 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1l4w40-007TMF-2E; Thu, 28 Jan 2021 01:25:36 +0000
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229]:38649) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1l4w3u-007TM8-Ec
 for samba-technical@lists.samba.org; Thu, 28 Jan 2021 01:25:33 +0000
Received: by mail-lj1-x229.google.com with SMTP id f19so4401623ljn.5
 for <samba-technical@lists.samba.org>; Wed, 27 Jan 2021 17:25:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WLd3m2anYlo17qAtsO8VgbCYDsIU6XiczphB8GO6huw=;
 b=SoKadgDRoNoj6UGC70fPujkcwFTJbTZfdsCRUZ7zFqhFFp9pN/Vfepmhlr+k6H8BdN
 YCfzmtJlJOvlwg4zd2SEGF+Q/MLsexpz89EyBqjVpiWMszoNWHYD7cZmOl7tHdLcQrN2
 TwYn6jMVIAnJRn+H2gHlW8G9kbdSJuq2CcJeofCMiQja+n4vMXBdR6XjYK0x8TWbieUg
 C8bCJDZPtBIG8vrFgYyQyq//qeeKqTDDPhEVOmseAzuoh8Wx8Hs4HrTmYxtwvhUFjZQZ
 SHMUrHc4vk8pjq6Gqka2r7r0v3/ELIF2eIh1Uv7rWTQgM0n7xDyeHwPG3NgAKS4ILkdV
 AecQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WLd3m2anYlo17qAtsO8VgbCYDsIU6XiczphB8GO6huw=;
 b=ryS2NsbHtUiUf5gtIe/XWNqA480CchSRbmKruILHTmgrI9kTbi8eXQFkuswXsKxPr/
 o/jVAFbnLgWVuL/YfWj0r+hZNWfmocsXYyc0Rl7Gbt73UU1YWWlx6SQ2yQyemEnhWW2h
 635aC9UK0Erny56CAmCd8453hjTiIq/h//R7IdFPIK3b3xlrPSfQhg0tLc+0epd0+syD
 XfAOJBEoNGGozw2ScIOkoEDI8lkNLUv0BVKd88mj5PUbt2/iNHtVqovD+O5lR9UvIRv6
 MiS7x9JKdBI4+ksTB32ZgkEgxJJO9Jfu1VXeT4PXbpBzTKqnU8DSTRWdTnY9O+yyVNHx
 43WQ==
X-Gm-Message-State: AOAM532C8Pi1Bbc5TWLIIR+JmaMlabJhEkQQtFhM/bZhu8OsPpExiBqg
 1/Ur3N9eII1/w0PVYT8vMctOaBHhG5av3Tv1WFw=
X-Google-Smtp-Source: ABdhPJxWx9kEFeFSk0sDQudKK0YOVgZ5UA6BjqHXogEnSCpCA4PfEhO0jaEzg5vJiwYvrIo13R0FVIpivr56+A03XGQ=
X-Received: by 2002:a2e:86c1:: with SMTP id n1mr138735ljj.148.1611797116842;
 Wed, 27 Jan 2021 17:25:16 -0800 (PST)
MIME-Version: 1.0
References: <CADajX4DzoNehHZGqpd+3Bh0yM2U=B6AwL6bJ2EM6t6hkvr7L4Q@mail.gmail.com>
 <20210127214434.3882-1-adam@adamharvey.name>
In-Reply-To: <20210127214434.3882-1-adam@adamharvey.name>
Date: Wed, 27 Jan 2021 19:25:05 -0600
Message-ID: <CAH2r5muXg8-8vQGXXq_4JO_HgnUkvzkPcOpU3FsBJC9YsbJvxA@mail.gmail.com>
Subject: Re: [PATCH] cifs: ignore auto and noauto options if given
To: Adam Harvey <adam@adamharvey.name>
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
 =?UTF-8?Q?Aur=C3=A9lien_Aptel?= <aaptel@suse.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Merged into cifs-2.6.git (seems harmless, and probably slightly safer
to include this - even though currently I can't reproduce the reported
problem).

Let me know if anyone else has been able to reproduce it - even with
Adam's suggested /etc/fstab line, I wasn't able to repro it.

On Wed, Jan 27, 2021 at 3:44 PM Adam Harvey <adam@adamharvey.name> wrote:
>
> In 24e0a1eff9e2, the noauto and auto options were missed when migrating
> to the new mount API. As a result, users with noauto in their fstab
> mount options are now unable to mount cifs filesystems, as they'll
> receive an "Unknown parameter" error.
>
> This restores the old behaviour of ignoring noauto and auto if they're
> given.
>
> Fixes: 24e0a1eff9e2 ("cifs: switch to new mount api")
> Signed-off-by: Adam Harvey <adam@adamharvey.name>
> ---
>  fs/cifs/fs_context.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/fs/cifs/fs_context.c b/fs/cifs/fs_context.c
> index 076bcadc756a..62818b142e2e 100644
> --- a/fs/cifs/fs_context.c
> +++ b/fs/cifs/fs_context.c
> @@ -175,6 +175,7 @@ const struct fs_parameter_spec smb3_fs_parameters[] = {
>         fsparam_flag_no("exec", Opt_ignore),
>         fsparam_flag_no("dev", Opt_ignore),
>         fsparam_flag_no("mand", Opt_ignore),
> +       fsparam_flag_no("auto", Opt_ignore),
>         fsparam_string("cred", Opt_ignore),
>         fsparam_string("credentials", Opt_ignore),
>         {}
> --
> 2.30.0
>


-- 
Thanks,

Steve

