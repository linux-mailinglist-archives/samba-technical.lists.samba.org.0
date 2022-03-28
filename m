Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 604054E9E8F
	for <lists+samba-technical@lfdr.de>; Mon, 28 Mar 2022 20:06:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=BI2fKdlJE5Rxc+4tfCTMYWaI3vOtMYnKX1JUgFUyHXU=; b=rQ7QMbXtmAOgmDPmKG3qn0U8Ui
	0/5VML98vrbtjgduJKXuql7Weca4XIgX1YtXIlVtiP1iR3CLFabXVJT1CGfXiqU+k+3Eogqru4gWZ
	AB50wKGpPznTu+YvlqyylV8IC8BxgqA0XMRclhEaHSGHTmj2zwADADBLGANhAaEv0fUnkVPmQ/3EV
	eQp2IKiLQxXrox6/REwD3Y9VuHMHIDb8m37iUQAhdpAzBShr+v83jJoro6RC0gnsM0ozZ3xCexwLT
	1OVVRIou+9fU43mABJ4Vpc82wyUW23hsl9hvg72YbkdQlapXEtDlUzIbO9e8M0ZpXuDM/14XNtyWD
	BwCbFdng==;
Received: from ip6-localhost ([::1]:54846 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nYtjt-0063Cn-I5; Mon, 28 Mar 2022 18:05:14 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134]:45648) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nYtjo-0063Ce-74
 for samba-technical@lists.samba.org; Mon, 28 Mar 2022 18:05:10 +0000
Received: by mail-lf1-x134.google.com with SMTP id p10so20284250lfa.12
 for <samba-technical@lists.samba.org>; Mon, 28 Mar 2022 11:05:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tZK8O+10/0vciWAx2PW7iVpACpRDNEkg/wSPMvKJzUQ=;
 b=KTfamGEPmbboxHOzTCHmaKT/9ndBKS8tasyAtkCrZjEV+KbFy4DQT5tZBK3wSBZUnP
 Pwp9AikI+S5m3HXyjkYjSEj8PBbFxZysmiI8McoX9oXDHK7TMdwBfz//fG57xlH8kTXn
 3bR8pSlhZfI+ohPla6wqMgcOOoLmgdEuBC9HRg0IUtK5hC1mJE1OFMJjll3jOoqiPHVW
 lgkFyNZlg6Dh/UoLYonHDD21fl0nJYvnvRj7Nu7s1ZdjqY1rpT/sB2wSJ37+8EBR80Fd
 9R3A3spASjD51iwLg7/BNxO+1VOJVHhyeOKOiGsOeevXJFGsz6nVvI4yKZgYiz5iIClQ
 mERQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tZK8O+10/0vciWAx2PW7iVpACpRDNEkg/wSPMvKJzUQ=;
 b=BrgRR4MMzb15ALuUpkuvTgorTm7t7vwl3dZG+zvySCrlXIh4WZAmyBLZ3L5qlrt+jZ
 vT0t+cASAZNqPxvmi42Q+IJ+pJndgxo5Z/uYoLyYWzwshD1irEuQDURAOPGgNpf4+CDK
 t/qr0r35ug7DpsLvgfvq5E/Jvs90qJbNE9M0hkxuRBXEELumGXN0lC4SoSyq10/Bjks7
 00NhZ9nzXu/Aylh1rjWesR8N223QafC7PZnLd//ReSbQ9LshbusfOu/SMvXslfEpip0g
 DJsUl7Mqwa6zHLtDmr+E2TwLpv1ncxec7nce/EjU6ElzSKWzZv1PkSSHC3sjB+07Ag8B
 pu0g==
X-Gm-Message-State: AOAM533/RtUy9+5ANP+kqXX+p2HqRmui5D9VPd12qZPGLLyOm0LivZtr
 Jj97MC6DITWejW/OMj7uQ+DJU8i2QOoxTUFOki0=
X-Google-Smtp-Source: ABdhPJy4W0czI2kWrabJSXFW8xVPolK5CYQKJ2lwrvgwh5OnWqafeFERFdoY75SF3mFfmDL7iHwqZ7rNVM6AtREoxAs=
X-Received: by 2002:ac2:5444:0:b0:44a:846e:ad2b with SMTP id
 d4-20020ac25444000000b0044a846ead2bmr11246197lfn.545.1648490706688; Mon, 28
 Mar 2022 11:05:06 -0700 (PDT)
MIME-Version: 1.0
References: <20220328130300.3090213-1-trix@redhat.com>
In-Reply-To: <20220328130300.3090213-1-trix@redhat.com>
Date: Mon, 28 Mar 2022 13:04:55 -0500
Message-ID: <CAH2r5muEaOVDPPbhhaveipxBhe61Egj6oH7c54PC1xCJfwtQ5A@mail.gmail.com>
Subject: Re: [PATCH] cifs: fix enum usage
To: trix@redhat.com
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
Cc: nathan@kernel.org, CIFS <linux-cifs@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>, llvm@lists.linux.dev,
 Nick Desaulniers <ndesaulniers@google.com>,
 LKML <linux-kernel@vger.kernel.org>, Steve French <sfrench@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

I fixed this yesterday in my for-next branch. Let me know if you see other
problems

On Mon, Mar 28, 2022, 12:10 <trix@redhat.com> wrote:

> From: Tom Rix <trix@redhat.com>
>
> Clang build fails with
> cifsfs.c:709:18: error: implicit conversion from enumeration
>   type 'enum statusEnum' to different enumeration
>   type 'enum tid_status_enum'
>   tcon->status = CifsExiting;
>                ~ ^~~~~~~~~~~
>
> The type of the element status changed, so enum needed to change.
> Replace CifsExiting with TID_EXITING.
>
> Fixes: 7e5c8c02911b ("smb3: cleanup and clarify status of tree
> connections")
> Signed-off-by: Tom Rix <trix@redhat.com>
> ---
>  fs/cifs/cifsfs.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/fs/cifs/cifsfs.c b/fs/cifs/cifsfs.c
> index 0789bf1496c74..a47fa44b6d52b 100644
> --- a/fs/cifs/cifsfs.c
> +++ b/fs/cifs/cifsfs.c
> @@ -706,7 +706,7 @@ static void cifs_umount_begin(struct super_block *sb)
>                 spin_unlock(&cifs_tcp_ses_lock);
>                 return;
>         } else if (tcon->tc_count == 1)
> -               tcon->status = CifsExiting;
> +               tcon->status = TID_EXITING;
>         spin_unlock(&cifs_tcp_ses_lock);
>
>         /* cancel_brl_requests(tcon); */ /* BB mark all brl mids as
> exiting */
> --
> 2.26.3
>
>
