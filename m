Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CD4F62A1A2
	for <lists+samba-technical@lfdr.de>; Tue, 15 Nov 2022 20:00:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=m8W/0pY0U0/YdEIdwLzpMd90XGiJVa107n2xUOXTtzI=; b=1GdthnM72s61tquy03H5q5RiKe
	k2LhcjmV1osmxR2SqxJbUt76eKJGXkB09A2d3e4dEUKMy8CJLv0NzhUP9FbKYjAbXrrZ5uscSe+gz
	QbKzNtetiNw4LVwinX2/AeOKEHkkpgpqLSwzmqrtzL4qWGOIfwwRLDGQ6nojU5CaLMMXhNDehAxhd
	NXGfQWs9+OeEigAnJUzJ3+0UPRcP7lb1wEK8PS2HyS+3pd1pEq4b6qd5OxlEPPoTqisdcpQ079wh8
	LIm5e8YgzqVxlpiLgCmDsTVJ+IEY4W4P8l6uglJbvy3OO/wKEcGqqvW058aVwRFf0YOSR0eyOZE4r
	h/Tp698g==;
Received: from ip6-localhost ([::1]:24870 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ov19d-00DybM-9w; Tue, 15 Nov 2022 18:59:29 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130]:35496) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ov19V-00DybC-P9
 for samba-technical@lists.samba.org; Tue, 15 Nov 2022 18:59:26 +0000
Received: by mail-lf1-x130.google.com with SMTP id b3so25927418lfv.2
 for <samba-technical@lists.samba.org>; Tue, 15 Nov 2022 10:59:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=m8W/0pY0U0/YdEIdwLzpMd90XGiJVa107n2xUOXTtzI=;
 b=YCV05GN19uBSTv2O3yqeIqJiaYtG17bkaWOAhO2RO720T7T7oeBpFZ5WVRHZPyBcR3
 FjlLo5voVc5ek6ikFUlEMO8pkRz7pxPlqjR1a6qimPrz/QGQbVxXdR+pHWMkJTr6AsoB
 yo+R+Dym3E04WHHTy2FSMTRD+mYonFztVnYpKVWDnXqiyg6YCbyqN1pYV8dnkC1Hr8Vq
 /pVFoVYN4W1cpDqCvEVZbOD1EhS+nV5ElutWA/TNax8AGsdbxdki3t++u2ssR44Na+J4
 2mZqbL/3/xoCEH6i/3LiNhiHn6vPyKeK3VKrJrDkx7VH+kn+tjfcbABUC10EaWPZW8dY
 1G2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=m8W/0pY0U0/YdEIdwLzpMd90XGiJVa107n2xUOXTtzI=;
 b=8CJ2JF5AbaVqV8feB0aj3iAXYnXCjUJ5vwtkfzAND9xD3piycQJMzqTQQdQ+R3Xgfc
 qsEzSE3KKxnk2D0A+bTDiVGEytXT9DPmb04cnpDeTglX8l5j6iN9N9QQbx0Y4z8WaEcs
 wLCDa++3L2dct5mdHhxCpxM7q8ZdE3R2HLMW5AWlVPpuMJfiZM71PrvmvxiF48RrRVEN
 w6rRCWeNna8I49wKjqWYZWelrOybF9Rlvck6XH927ZUyxiA7pfGA8SKx5IToLjKC6YfW
 Ox6+toJ2950tZLZdhSG/O14eO7tCmAiOOxcLc31epTbrfxGZ5flvT5fYUwC6RQ7ZbczD
 NDSA==
X-Gm-Message-State: ANoB5plOq4NDXgXXBhAUWtPaE82K2/AUCUlqSh1ONXEw8e8c2j13YWSD
 cRRsjwJxGUwu0lN8BAtr8fDA3V/I6PHQkG40Y4c=
X-Google-Smtp-Source: AA0mqf5y3LwZWjhCawuga7fH/h6NG7Icta3bCFw/67wQ9nG9UkOVSb3d8XJy76j5N0V5Cx0wDPh0qB9hQe8PCjffaZ8=
X-Received: by 2002:a05:6512:138f:b0:4ab:534b:1b2c with SMTP id
 p15-20020a056512138f00b004ab534b1b2cmr5800959lfa.426.1668538756218; Tue, 15
 Nov 2022 10:59:16 -0800 (PST)
MIME-Version: 1.0
References: <20221115142701.27074-1-abelova@astralinux.ru>
In-Reply-To: <20221115142701.27074-1-abelova@astralinux.ru>
Date: Tue, 15 Nov 2022 12:59:04 -0600
Message-ID: <CAH2r5mtaTSih9X6Xzc0HTqRYSTx47vNzStMkXeWYzyXPMqzEFg@mail.gmail.com>
Subject: Re: [PATCH] cifs: add check for returning value of SMB2_close_init
To: Anastasia Belova <abelova@astralinux.ru>
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
Cc: Tom Talpey <tom@talpey.com>, Shyam Prasad N <sprasad@microsoft.com>,
 lvc-project@linuxtesting.org, linux-cifs@vger.kernel.org,
 linux-kernel@vger.kernel.org, Paulo Alcantara <pc@cjr.nz>,
 samba-technical@lists.samba.org, Aurelien Aptel <aaptel@suse.com>,
 Ronnie Sahlberg <lsahlber@redhat.com>, Steve French <sfrench@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

good catch.

merged into cifs-2.6.git for-next

On Tue, Nov 15, 2022 at 8:41 AM Anastasia Belova <abelova@astralinux.ru> wrote:
>
> If the returning value of SMB2_close_init is an error-value,
> exit the function.
>
> Found by Linux Verification Center (linuxtesting.org) with SVACE.
>
> Fixes: 352d96f3acc6 ("cifs: multichannel: move channel selection above transport layer")
>
> Signed-off-by: Anastasia Belova <abelova@astralinux.ru>
> ---
>  fs/cifs/smb2ops.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/fs/cifs/smb2ops.c b/fs/cifs/smb2ops.c
> index 880cd494afea..9737296c0fbc 100644
> --- a/fs/cifs/smb2ops.c
> +++ b/fs/cifs/smb2ops.c
> @@ -1126,6 +1126,8 @@ smb2_set_ea(const unsigned int xid, struct cifs_tcon *tcon,
>         rqst[2].rq_nvec = 1;
>         rc = SMB2_close_init(tcon, server,
>                              &rqst[2], COMPOUND_FID, COMPOUND_FID, false);
> +       if (rc)
> +               goto sea_exit;
>         smb2_set_related(&rqst[2]);
>
>         rc = compound_send_recv(xid, ses, server,
> --
> 2.30.2
>


-- 
Thanks,

Steve

