Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DC2A6DA830
	for <lists+samba-technical@lfdr.de>; Fri,  7 Apr 2023 06:14:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=2ayCY8gnSzRVaLPlX69HunLAAxrpGlLKZnIoUUkKakI=; b=KTqV/hZ3/5D71lI2eoOXgXskdb
	i5IfKXZoSgSiLPZmnp+hBSfi4YUQBy8/GZ9hoP1yUxKNW2EP2mFmTyvC2u/ySA5uNY5XHQbFhwmXj
	aoHoJpHuXu2DPODiT11XXgHz3frfHMAoAvdZQTWJ8on9/yaRVBSre66NWlX0XZbSYFlk8oERMVQFz
	E2TvKkZ2CHflHz++5mI0RpS1PfAof7Z7Mq1RZBBsEsTHnM0O/uqK+3nNzQR/kuEH+OkStW+RQ/j9T
	adfU9DQYN1scrmgKUoBYukWxhHf5pKbqAJTB/FsDuyEWkAnTDwVSGgEM1CMYmm/wQr24qdIXOyUt0
	pkMLATSA==;
Received: from ip6-localhost ([::1]:38000 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pkdTn-009m6f-Ie; Fri, 07 Apr 2023 04:13:39 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f]:39882) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1pkdTi-009m6W-8x
 for samba-technical@lists.samba.org; Fri, 07 Apr 2023 04:13:36 +0000
Received: by mail-lf1-x12f.google.com with SMTP id h25so53195656lfv.6
 for <samba-technical@lists.samba.org>; Thu, 06 Apr 2023 21:13:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680840811; x=1683432811;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2ayCY8gnSzRVaLPlX69HunLAAxrpGlLKZnIoUUkKakI=;
 b=G3am6QtCc/ohzizao0JPiLpe5jex0BIOfdy7+tfEDRYRKwumPeM7UTmFkhxOSkS7xt
 fiHh/tLU/T+bFubDudvwLvwX5ebInUPh+PFfFdQnzlGNCfp3FelWGUSOo1nMBGY3U23s
 QHzivT99VepCzvxF8I3g1AG7d5moC/30iU4j7NjXzgz0KihLjwFJ77g5YqJc2JrK71Ld
 TGEorHKWfJrQbpbjE6r2BrsprUVghOQdT536ryiw48QGoCtjedEdwJPFnoJ5MojUhplb
 FnGFPJcGOTTxkjPXpWqgwhT2hX799lx96C/bh6Q9V4mxKt9Q4KOLJOSFSAk0HzX/cEOq
 iE/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680840811; x=1683432811;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2ayCY8gnSzRVaLPlX69HunLAAxrpGlLKZnIoUUkKakI=;
 b=VMLiy4PMDivMfy0AsmuCaU5gWoLGbX8mx8V7bgO/4+C+zRZ9rQp5Q5mnSHxUfRPnAB
 89svVF5JA1r3+RgK6RnYhtCxXJb90TIRl+9kGApz0nuU/TKFLi4C5ajpeyYm/6YvY92J
 l+C6oCRGWPZcfmQZqWKSEe/mYFvsU/F59XDjEOxdMmUBMnebmnUNdYJXQsgwHhPI7ZhY
 HxuFrxQk6LFZtjj2r7DhvRzmkCkrsJn+0DZoFBM1Cx8GAriMlHok2aub6boeRme+5UWG
 t6ANJd2LSIjyFxtDgTGoOJGdgW+eywDCDwKpWub9H8IgCYNYeD+HMCjDCto61l6r2dZn
 tkog==
X-Gm-Message-State: AAQBX9dPY0/UcM0HEx+S6m7WA8OjRcetjTOYEFmjziiq3bcp1XN1vO4Q
 WECSYLvdjf5Eumt5fR3MOJQQDBkQ47DgJ0LR/Ew=
X-Google-Smtp-Source: AKy350bRswQc+Go4VLcS//oc6Km8D/aDmonvZzbB2PVC4ejAc8eEuZn7aAMOJPzFaH2SlE6OdF9KR4FpYY4fV7PFS8M=
X-Received: by 2002:ac2:4569:0:b0:4e9:22ff:948d with SMTP id
 k9-20020ac24569000000b004e922ff948dmr327215lfm.7.1680840811172; Thu, 06 Apr
 2023 21:13:31 -0700 (PDT)
MIME-Version: 1.0
References: <6cf163fe-a974-68ab-0edc-11ebc54314ef@redhat.com>
In-Reply-To: <6cf163fe-a974-68ab-0edc-11ebc54314ef@redhat.com>
Date: Thu, 6 Apr 2023 23:13:20 -0500
Message-ID: <CAH2r5msJtiGDuQcQdUkpamChTYNobUEVCax5GmHwpV0NbZOR0Q@mail.gmail.com>
Subject: Re: [PATCH] cifs: reinstate original behavior again for
 forceuid/forcegid
To: Takayuki Nagata <tnagata@redhat.com>
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
From: Steve French via samba-technical <samba-technical@lists.samba.org>
Reply-To: Steve French <smfrench@gmail.com>
Cc: tom@talpey.com, sprasad@microsoft.com, linux-cifs@vger.kernel.org,
 pc@cjr.nz, samba-technical@lists.samba.org, lsahlber@redhat.com,
 sfrench@samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Tentatively merged into cifs-2.6.git for-next

Any thoughts on priority sending it upstream soon?

On Thu, Apr 6, 2023 at 7:06=E2=80=AFAM Takayuki Nagata <tnagata@redhat.com>=
 wrote:
>
> forceuid/forcegid should be enabled by default when uid=3D/gid=3D options=
 are
> specified, but commit 24e0a1eff9e2 ("cifs: switch to new mount api")
> changed the behavior. This patch reinstates original behavior to overridi=
ng
> uid/gid with specified uid/gid.
>
> Fixes: 24e0a1eff9e2 ("cifs: switch to new mount api")
> Signed-off-by: Takayuki Nagata <tnagata@redhat.com>
> ---
>  fs/cifs/fs_context.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/fs/cifs/fs_context.c b/fs/cifs/fs_context.c
> index ace11a1a7c8a..6f7c5ca3764f 100644
> --- a/fs/cifs/fs_context.c
> +++ b/fs/cifs/fs_context.c
> @@ -972,6 +972,7 @@ static int smb3_fs_context_parse_param(struct fs_cont=
ext *fc,
>                         goto cifs_parse_mount_err;
>                 ctx->linux_uid =3D uid;
>                 ctx->uid_specified =3D true;
> +               ctx->override_uid =3D 1;
>                 break;
>         case Opt_cruid:
>                 uid =3D make_kuid(current_user_ns(), result.uint_32);
> @@ -1000,6 +1001,7 @@ static int smb3_fs_context_parse_param(struct fs_co=
ntext *fc,
>                         goto cifs_parse_mount_err;
>                 ctx->linux_gid =3D gid;
>                 ctx->gid_specified =3D true;
> +               ctx->override_gid =3D 1;
>                 break;
>         case Opt_port:
>                 ctx->port =3D result.uint_32;
> --
> 2.40.0
>


--=20
Thanks,

Steve

