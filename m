Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 07402F260C
	for <lists+samba-technical@lfdr.de>; Thu,  7 Nov 2019 04:35:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=j00j0P5tg7ufiLDUoOnBdVRUf6hj9hF5UDph/p/NK68=; b=AbnWY7VmIxzVNrAi5IH/1il09+
	lsU/6BzfKXuxMWL29kTR6sRkSJtU8IBL4v90M6RSgrR6ebshRLW/1hY26ckLOztqAswwdA6ssc5aa
	dM9N54QiclyuIDarwdyV3UtUGPn6kfi9lEO6L9i0JQkDimzPd26BgHdqEEoshHzsAh8sPCivelI4Q
	WrXYFHD3e5Mz2uz2uTN9S07oZrdjFs5A5wkotPugX38N/D491G8PGiV3dyPhUDrwdnkBo8Puv0BB4
	8mksZnFMow1MXMoG4dJT47M6XRg/vDCZmJF7y/loKpGUgM71Y88Zh4pImWlY8R7rTMrZ80GsUfTRZ
	IJXyoGFg==;
Received: from localhost ([::1]:27234 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iSYZO-007Dic-Qr; Thu, 07 Nov 2019 03:34:50 +0000
Received: from mail-io1-xd44.google.com ([2607:f8b0:4864:20::d44]:33973) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iSYZH-007DiS-UO
 for samba-technical@lists.samba.org; Thu, 07 Nov 2019 03:34:48 +0000
Received: by mail-io1-xd44.google.com with SMTP id q83so718102iod.1
 for <samba-technical@lists.samba.org>; Wed, 06 Nov 2019 19:34:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=j00j0P5tg7ufiLDUoOnBdVRUf6hj9hF5UDph/p/NK68=;
 b=HuVYeWApBFO+9D/Ggj+4qUY5unti4vS0dXk7MlI4Db3/qZV+3I4AlmGIXTH4c0Pbor
 Ohju8tXGFXrjbLL15eFdQogG9VSPpgSD7eNLLGbrxmR3d2ORHI/IyT1R+m3hxZ6Awa3o
 ge9NysOVl3U8sVP5UAbuKX6D9hsmOW1JwtWG672dko0/3YW2L7iUtC8a/z6E5/tGbd41
 cvNXQgoo3/T3rd5tnlXFOuLLAI7s2/XlIgIfph5qnZdLTOcSe+rZZUwAWSFOMZf7Ezv1
 sBJ0R3Tvper9gJYi7zv36leQkTCkamH39dLFU6i66FGwxe3T5rTMgyFl4mbKb1ifyneW
 Ixcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=j00j0P5tg7ufiLDUoOnBdVRUf6hj9hF5UDph/p/NK68=;
 b=V5Z3SO8xvAmZFQR/mji4vnsipoi07srBXOwRevziXpiZ413Q+Sf0UESTc3qVh2GJmE
 6WuAL5PdAmqwsUFXQt++yralDNRlqEqd27IMEwUP9jKZq7c2kyon93eEzl0YmuC4Oppp
 o5oBR7029Swx2jIvy3QpzYas8ozLT2/dkwCkeD6Gp277gvEKrcrVh7w2jOCkOE6rWd8d
 5lCWazUI0b1JDiCEp0YapJOd1wn9tswFfYfziHnWnpQlLKtdghearp+aRPSslqzGhi2h
 dfCGsU+64L7mLAnBLNzWHDRBdudR16y4XexZP71K9bB2ZxbeDIts3sz5F6Ktdv1fGATR
 /r/A==
X-Gm-Message-State: APjAAAXCVYs36OdT7E4KuDHkp1DIwWIiFGp9bee/2A9IM1LktGFSgE0T
 vbM2Bo3rfQmMfig5FWNwuIsicRXfDTOU6wrILtA=
X-Google-Smtp-Source: APXvYqxmxrcUqMIf+MxenLaiixpDBKSDY+CiliO91aSSQhnW/VD9p8c0URvnBnQ5MC999/3P1DmXVKNifyw+ZyDx0vE=
X-Received: by 2002:a05:6638:20a:: with SMTP id
 e10mr1797639jaq.27.1573097681936; 
 Wed, 06 Nov 2019 19:34:41 -0800 (PST)
MIME-Version: 1.0
References: <826310e5-e01c-38af-90df-c5630f761a4d@users.sourceforge.net>
 <24a10b1a-3b4a-da70-1670-23b4ec9abff8@users.sourceforge.net>
In-Reply-To: <24a10b1a-3b4a-da70-1670-23b4ec9abff8@users.sourceforge.net>
Date: Wed, 6 Nov 2019 21:34:30 -0600
Message-ID: <CAH2r5msOyZXi6msPOPNnM4pF_YJEEOkxFk=dScUW0ZMuEvHFaQ@mail.gmail.com>
Subject: Re: [PATCH 6/8] CIFS: Return directly after a failed
 build_path_from_dentry() in cifs_do_create()
To: SF Markus Elfring <elfring@users.sourceforge.net>
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

On Sun, Aug 20, 2017 at 11:40 AM SF Markus Elfring
<elfring@users.sourceforge.net> wrote:
>
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Sun, 20 Aug 2017 17:17:30 +0200
>
> Return directly after a call of the function "build_path_from_dentry"
> failed at the beginning.
>
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  fs/cifs/dir.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/fs/cifs/dir.c b/fs/cifs/dir.c
> index 2c9cbd8393d6..248aead1f3f4 100644
> --- a/fs/cifs/dir.c
> +++ b/fs/cifs/dir.c
> @@ -239,10 +239,8 @@ cifs_do_create(struct inode *inode, struct dentry *direntry, unsigned int xid,
>                 *oplock = REQ_OPLOCK;
>
>         full_path = build_path_from_dentry(direntry);
> -       if (full_path == NULL) {
> -               rc = -ENOMEM;
> -               goto out;
> -       }
> +       if (!full_path)
> +               return -ENOMEM;
>
>         if (tcon->unix_ext && cap_unix(tcon->ses) && !tcon->broken_posix_open &&
>             (CIFS_UNIX_POSIX_PATH_OPS_CAP &
> --
> 2.14.0
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-cifs" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



-- 
Thanks,

Steve

