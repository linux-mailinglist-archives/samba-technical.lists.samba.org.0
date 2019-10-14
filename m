Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4416BD6B57
	for <lists+samba-technical@lfdr.de>; Mon, 14 Oct 2019 23:43:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=3qwTHsJQXtLByGWGmkMogTYtmXYBCZ8p7g4dCDAH2Hc=; b=TerGg/I7mIi8Oy3Jya1mHptqyT
	Dle5V9VCpFyVoJxE7PT4QY2GXIiUdetrBVimH4V1EHGWmBsUsyAGwUrEa79fLXtUhGJS27gN4H73W
	xRBdGQYm00A9nOd4NMmqwLNFlb3OAoKpUlxfRh6sy0wmEzlqqR+eLCFEUclJ5j+A2VWfaeIfzfMFx
	i1bzSuiQ97FnLmUum9uFiwC/utHB7irBRzqRWYN7dy/MbA5R26AFdqJp4ws4OA4OZbfnNOe2DlNma
	eRibjw18bxJOeFAemTapBspRlhAVgXRmVYs/DsWj0JWihBvWHeVH4G7ZqkZkw+C+yMIlbVhD0tHOW
	YBifaxQw==;
Received: from localhost ([::1]:29726 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iK87j-003ksA-Fo; Mon, 14 Oct 2019 21:43:27 +0000
Received: from mail-lj1-x243.google.com ([2a00:1450:4864:20::243]:36868) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iK87f-003krs-JE
 for samba-technical@lists.samba.org; Mon, 14 Oct 2019 21:43:25 +0000
Received: by mail-lj1-x243.google.com with SMTP id l21so18087912lje.4
 for <samba-technical@lists.samba.org>; Mon, 14 Oct 2019 14:43:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=3qwTHsJQXtLByGWGmkMogTYtmXYBCZ8p7g4dCDAH2Hc=;
 b=GkNSjhP0eZ80orHn4cAARxiyTXcvb5pPD7FRVCWSFff5/lJaJh7m0Eym/uVAhlJAK3
 aOHaHKdueqDalt+cb9568WOvHFiduwq/KtHwrU6C7RUEO0UvH+kOatOoFvjlusem7ElO
 4+eiy/B13KWx8QhR4CT9z8n/JZzaCtNEUWW8qB6UdWJqss3SHN/4IMdo8S2dyTVnsMqF
 xwGi1bJhpw2ugWX5wToPEFZTe3kTp9fijpoJ039D1UCsXOR83LYsj6ftvPMB3vEpo9oE
 MAuZ+SddrdhSAp9zO46QStgTyDk2WaXu4jbmygCQohW7F1sk3FGynVd9IdaF/UXvAQ+l
 qplQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=3qwTHsJQXtLByGWGmkMogTYtmXYBCZ8p7g4dCDAH2Hc=;
 b=IN/Y5JMBJJ6dz46JQNvWout1U61RLdUR+4jEEx2SrOUYCjsJ+BqgXmsqKCEgsIhD/p
 OY5cxyE1D9r46M5BR75kKxc2WIdvTVml5v/8EiUvLGfOx9d/A71YuIluzUUtnoPXhk2Q
 mt04KKvt4MmRbtq7Tp8PpyJGLynrNZiU+KHwDVzfjoaN2a/CzL7+q5QyGBahBZ2Wo+Nj
 YBmgBHEeCeIq+0zGWaH6ddd/fERwlJnRtikQX8ksIRGf3Yq/47qZucBI8Eg0ZKnfQI6A
 CTVchVMtcpeeTL/FAA2pdU+LSlND/U9La5pVTbEChhkNur2cL7sDAFMESk50arl0eKZL
 JCAw==
X-Gm-Message-State: APjAAAVLdX3whE033SoaWMiZUd0trtE/QE19tTXtnR1iXKD2yzr9Y7+f
 UZ3xzojiH+O3HUIdHVNfOt3mDRTIJAfJ5qzsrQ==
X-Google-Smtp-Source: APXvYqz3z9deyqj84FSXsg+/2ryg7LbrmoOETqAHbU2dkepNZeuB6r+Ff9HGPQY2TdsoLFO2AyX5r0FI0UrTiwWGhNM=
X-Received: by 2002:a2e:5354:: with SMTP id t20mr20223113ljd.227.1571089402725; 
 Mon, 14 Oct 2019 14:43:22 -0700 (PDT)
MIME-Version: 1.0
References: <20191014071531.12790-1-hslester96@gmail.com>
In-Reply-To: <20191014071531.12790-1-hslester96@gmail.com>
Date: Mon, 14 Oct 2019 14:43:11 -0700
Message-ID: <CAKywueQY-J3g0RBF4=opP8SbhpWh-BHoHWzNEeTruxmfacnhGw@mail.gmail.com>
Subject: Re: [PATCH] cifs: Fix missed free operations
To: Chuhong Yuan <hslester96@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
From: Pavel Shilovsky via samba-technical <samba-technical@lists.samba.org>
Reply-To: Pavel Shilovsky <piastryyy@gmail.com>
Cc: Steve French <sfrench@samba.org>, linux-cifs <linux-cifs@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>,
 Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

=D0=BF=D0=BD, 14 =D0=BE=D0=BA=D1=82. 2019 =D0=B3. =D0=B2 00:18, Chuhong Yua=
n <hslester96@gmail.com>:
>
> cifs_setattr_nounix has two paths which miss free operations
> for xid and fullpath.
> Use goto cifs_setattr_exit like other paths to fix them.
>
> Fixes: aa081859b10c ("cifs: flush before set-info if we have writeable ha=
ndles")
> Signed-off-by: Chuhong Yuan <hslester96@gmail.com>
> ---
>  fs/cifs/inode.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/fs/cifs/inode.c b/fs/cifs/inode.c
> index 5dcc95b38310..df9377828e2f 100644
> --- a/fs/cifs/inode.c
> +++ b/fs/cifs/inode.c
> @@ -2475,9 +2475,9 @@ cifs_setattr_nounix(struct dentry *direntry, struct=
 iattr *attrs)
>                         rc =3D tcon->ses->server->ops->flush(xid, tcon, &=
wfile->fid);
>                         cifsFileInfo_put(wfile);
>                         if (rc)
> -                               return rc;
> +                               goto cifs_setattr_exit;
>                 } else if (rc !=3D -EBADF)
> -                       return rc;
> +                       goto cifs_setattr_exit;
>                 else
>                         rc =3D 0;
>         }
> --
> 2.20.1
>

Looks good, thanks.

Reviewed-by: Pavel Shilovsky <pshilov@microsoft.com>

The original patch was tagged for stable, so, it seems that this one
should be tagged too.

--
Best regards,
Pavel Shilovsky

