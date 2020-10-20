Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id AA8632940EC
	for <lists+samba-technical@lfdr.de>; Tue, 20 Oct 2020 18:56:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=qz4MjVNVxrecIcW8x1TcdGzeDcTlGL+33knVz17BQFk=; b=W0nFu69S9yi5+HCNLSCAP/Kk0F
	f0030+jbRmkVelIhEru5wArJg7gF1YGlBrk5Sgs09ZQwdHxmBzkHVcm/YkfPvKAJpS9F+eN4I81QB
	D2m4TJT5hfRUXLte19i9b/WeA/44B8heM31oA8K0svgNzAkVSZ5tsUZlIT6taT1Or5gzt0/Q41pkj
	qo6+g5ppG6UXHk5nNWdhbAYuVMOU8fkZeSUfKsTuXwzq+wsQUtUsqBGCZOoQYn+liFZeYSxzHNabC
	TZVdLPc+MRqDU21XEdWj+wiPu2Mnxt5mlrSfcnbiiJCC0CP5/+nDfZi93I96dnESX/8H86O3NSLpC
	M0i3LCiA==;
Received: from ip6-localhost ([::1]:61454 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kUuvU-00Cuq3-G6; Tue, 20 Oct 2020 16:55:56 +0000
Received: from mail-lj1-x243.google.com ([2a00:1450:4864:20::243]:35382) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kUuvO-00Cupw-3D
 for samba-technical@lists.samba.org; Tue, 20 Oct 2020 16:55:52 +0000
Received: by mail-lj1-x243.google.com with SMTP id x16so2799083ljh.2
 for <samba-technical@lists.samba.org>; Tue, 20 Oct 2020 09:55:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qz4MjVNVxrecIcW8x1TcdGzeDcTlGL+33knVz17BQFk=;
 b=aG17Up5akVMalus/NeTKE6aGHRm8gjB8jK8Dg9CnkPsI4ut9T47Fv5EQIZGF9BPJ86
 ExjfCyIUMdOYnaAEz2khGxxEHm4XoyPVL6F9uaAZRqNQjJD4f5JQeQNQ0tYclIclsJJC
 WLiz5CWas+RPe8snAwhmVHuToZg47AYHMIaj8Hm2xfHgugHgd3ZyV3jKiin0ICJ++eQi
 Bwj0fxcN6+SUO90+CID7elktrVTAcoVf0b7CHvIcV+41h+gn+TNlrvZwQ42LKVbhHQfX
 Pv+eUoraYIt4K9nwfAXcVQhyLBYK7BDxxi99rqoMcJiusaFZFSORaeny07vbrz4g/yA2
 piqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qz4MjVNVxrecIcW8x1TcdGzeDcTlGL+33knVz17BQFk=;
 b=Sx5LJXyIZQN5Vm0SKy2FHIdVCkLUvOmnG0BOtw3C6az5lo55HuWT3NbicF/fRw+hek
 lSMdEnIWa0YVNDQQuQjrmZ2eVun/cUKCnMq9GK9MtL9kWY9mqbsT8dzLcpQFXyNHzZal
 +AteaR6lCTblBPQdgcvwFYeEvRbBLfNXyoR7JD4OoD3hzoGt4DIRWYbtxv+km+jUWgWi
 BKa0x6Hv1k/6yoMwShsaqv7HWUu9pdYQYiToxUrZAxkU+wx6dKnBLgB9d8/jpIH8byjz
 F9WuhGuHykN3unOCm88ZL9DC7BtGN5+aLvPoPafmafUynOV539OnXnIA7vTvFnVHlcoM
 Rljg==
X-Gm-Message-State: AOAM531TxiY4Z7zwFXNt5heq9rFS/3gJE8piCUppXHZLQnr8vdQ9RK2E
 3BpDghnWdA/cDGB/Ip/kJiKzOXD/uMTiJ6tJnjo=
X-Google-Smtp-Source: ABdhPJxmKwy1feIl6inzCUzl6utHPj8AV6tlP+rB48lrZaEGH3kifdhldf95yOCS+tz/ydf7Xnce7H5lree+fPvT0cY=
X-Received: by 2002:a2e:b0e4:: with SMTP id h4mr1454870ljl.119.1603212948806; 
 Tue, 20 Oct 2020 09:55:48 -0700 (PDT)
MIME-Version: 1.0
References: <20201020141936.52272-1-colin.king@canonical.com>
In-Reply-To: <20201020141936.52272-1-colin.king@canonical.com>
Date: Tue, 20 Oct 2020 11:55:38 -0500
Message-ID: <CAH2r5muM5K802hub3WYJYcC5Mqi8K2S2HJa1hgW_mo+oW0toMA@mail.gmail.com>
Subject: Re: [PATCH] cifs: make const array static, makes object smaller
To: Colin King <colin.king@canonical.com>,
 =?UTF-8?Q?Aur=C3=A9lien_Aptel?= <aaptel@suse.com>
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

added Aurelien's Reviewed-by and merged into cifs-2.6.git for-next

On Tue, Oct 20, 2020 at 9:22 AM Colin King <colin.king@canonical.com> wrote:
>
> From: Colin Ian King <colin.king@canonical.com>
>
> Don't populate const array smb3_create_tag_posix on the stack but
> instead make it static. Makes the object code smaller by 50 bytes.
>
> Before:
>    text    data     bss     dec     hex filename
>  150184   47167       0  197351   302e7 fs/cifs/smb2pdu.o
>
> After:
>     text           data     bss     dec     hex filename
>  150070   47231       0  197301   302b5 fs/cifs/smb2pdu.o
>
> (gcc version 10.2.0)
>
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  fs/cifs/smb2pdu.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/fs/cifs/smb2pdu.c b/fs/cifs/smb2pdu.c
> index d504bc296349..be8696abd871 100644
> --- a/fs/cifs/smb2pdu.c
> +++ b/fs/cifs/smb2pdu.c
> @@ -1971,9 +1971,11 @@ smb2_parse_contexts(struct TCP_Server_Info *server,
>         unsigned int next;
>         unsigned int remaining;
>         char *name;
> -       const char smb3_create_tag_posix[] = {0x93, 0xAD, 0x25, 0x50, 0x9C,
> -                                       0xB4, 0x11, 0xE7, 0xB4, 0x23, 0x83,
> -                                       0xDE, 0x96, 0x8B, 0xCD, 0x7C};
> +       static const char smb3_create_tag_posix[] = {
> +               0x93, 0xAD, 0x25, 0x50, 0x9C,
> +               0xB4, 0x11, 0xE7, 0xB4, 0x23, 0x83,
> +               0xDE, 0x96, 0x8B, 0xCD, 0x7C
> +       };
>
>         *oplock = 0;
>         data_offset = (char *)rsp + le32_to_cpu(rsp->CreateContextsOffset);
> --
> 2.27.0
>


-- 
Thanks,

Steve

