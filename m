Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 446935644BE
	for <lists+samba-technical@lfdr.de>; Sun,  3 Jul 2022 06:29:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=ZPp1iqE9WbnI1BB7CGfKQapKem5vMNrsn0GT1sug9GI=; b=rVdsSfihfzHp9lQjylaWFmfP6B
	oekmOHSjDhdoCBuQXNv2KWOphb+kTpau26oW5aHHe0NMONTaBZR7LW5LvLvM2scCuFmikeL4ZIDJV
	6zjjjQM68L8Kv2MeGUmOHAbS9IqN9sINut7eqRra/tJGxMxyVIc0g2rIOnIWnFPIt0yt5Gy0qejOj
	Ah9WuZCvHY8AzYzycMt8T9GXaO+ZkvTvUHn3Bv4IoEmH5VVb7b5gwzzi3E4NqFAppvylUWL32imuT
	LZyq20DopL4E8Deh6+wnx57AmQpFnQQEIUIhigm1ujVALlAzpkV14Ygrw6IZWSPWee3A1RULouF+6
	S+I+3WJg==;
Received: from ip6-localhost ([::1]:23872 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1o7rE1-00FNQx-KC; Sun, 03 Jul 2022 04:28:49 +0000
Received: from mail-vs1-xe2d.google.com ([2607:f8b0:4864:20::e2d]:35832) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1o7rDr-00FNQm-0g
 for samba-technical@lists.samba.org; Sun, 03 Jul 2022 04:28:44 +0000
Received: by mail-vs1-xe2d.google.com with SMTP id 189so6060099vsh.2
 for <samba-technical@lists.samba.org>; Sat, 02 Jul 2022 21:28:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZPp1iqE9WbnI1BB7CGfKQapKem5vMNrsn0GT1sug9GI=;
 b=RXNkE9JF6DjC19sZwzs3/ijuoY4C1yRyI7c4OQwd2w3npPywV4ggvjUuGMIB3dxbEU
 FlEXg0Wvf5yXXLFMnk9WJ5yAQIp/p1QEWHj6wfgtRhNHzKCJxzm0gAcvqJ+LaVg1TGQc
 9sU1d4jC372iPJllloxMm83ytNqmDg2qBlMzI2awz0diZqu9hPSP+hjOE5Hkn29hVk2o
 xFQg8WWk6Ygott4BaP8PlN9Wo8ScKAZpNnraCOKmNptF2/DDrk7A/fGpYnxfQ0XVHf6n
 GxC8YbrB68/VTxo29zdkb+W2/Nx9rmI17dP2LzKXLR+lFSIHtnt4Z+zt6tt8vNR468d7
 XHoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZPp1iqE9WbnI1BB7CGfKQapKem5vMNrsn0GT1sug9GI=;
 b=0d2x66oXUjkyoUdPzHPN3fjzrnB7Ex8TxzpQ9Dcw/T4r77BBWkMGHpYrg7CVL+AxCI
 kG5lfIMIZVEe9Ytt9j6IWfF8kOeuCuIvL9e42Qs1JUP7C4sRa72pSY0ZpSbWyOFlPsi0
 qAZTHj1+GihfJkOxiGpy7wpBwdwOwkjBqVNsQww38sjSdB4VtjojCMNRSxMAd9qFSJBB
 ownAcNswPk2uUGr41EWaXQ+DHnacw6M2eCretuUvUL89nfZuMm9rTLl2dA6lG5FELrnA
 6A/70qy0bMMB7dxsCMliVLUc9fv6mxciBFASonqrYhDFQj9gP7WmO0/797kyFSiLx0gg
 4frg==
X-Gm-Message-State: AJIora+byYwPuwWmV5szqxLDpLlFIrz64QvVMS10c7xqdzC0TJ83A1ae
 vT/QIee7jpqok87G4295RpASOzAIdWin6Jm7gXk=
X-Google-Smtp-Source: AGRyM1uWamAWth4kZc4SzjqduqRteA3dvdPek5fMaJyOpogJGLVS3NqZezhwbI0Em/Z7D0JYB63jsHyi/RV6ymwF+0I=
X-Received: by 2002:a67:fe50:0:b0:356:a09d:afe4 with SMTP id
 m16-20020a67fe50000000b00356a09dafe4mr4322566vsr.6.1656822508482; Sat, 02 Jul
 2022 21:28:28 -0700 (PDT)
MIME-Version: 1.0
References: <20220628213229.354032-1-colin.i.king@gmail.com>
In-Reply-To: <20220628213229.354032-1-colin.i.king@gmail.com>
Date: Sat, 2 Jul 2022 23:28:17 -0500
Message-ID: <CAH2r5mucQ9LRBO9Kw6dEeSG=fWsbUnOv=C9b5Bp+fZg_Ox-7-w@mail.gmail.com>
Subject: Re: [PATCH] cifs: remove redundant initialization to variable
 mnt_sign_enabled
To: Colin Ian King <colin.i.king@gmail.com>
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

On Tue, Jun 28, 2022 at 4:40 PM Colin Ian King <colin.i.king@gmail.com> wrote:
>
> Variable mnt_sign_enabled is being initialized with a value that
> is never read, it is being reassigned later on with a different
> value. The initialization is redundant and can be removed.
>
> Cleans up clang scan-build warning:
> fs/cifs/cifssmb.c:465:7: warning: Value stored to 'mnt_sign_enabled
>  during its initialization is never read
>
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---
>  fs/cifs/cifssmb.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/fs/cifs/cifssmb.c b/fs/cifs/cifssmb.c
> index 6371b9eebdad..9ed21752f2df 100644
> --- a/fs/cifs/cifssmb.c
> +++ b/fs/cifs/cifssmb.c
> @@ -462,7 +462,7 @@ cifs_enable_signing(struct TCP_Server_Info *server, bool mnt_sign_required)
>  {
>         bool srv_sign_required = server->sec_mode & server->vals->signing_required;
>         bool srv_sign_enabled = server->sec_mode & server->vals->signing_enabled;
> -       bool mnt_sign_enabled = global_secflags & CIFSSEC_MAY_SIGN;
> +       bool mnt_sign_enabled;
>
>         /*
>          * Is signing required by mnt options? If not then check
> --
> 2.35.3
>


-- 
Thanks,

Steve

