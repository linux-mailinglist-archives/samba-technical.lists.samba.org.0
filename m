Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 863F494C67B
	for <lists+samba-technical@lfdr.de>; Thu,  8 Aug 2024 23:52:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=zTilJSTMzzmTUfM8PwyjqnLeW2jPuc+7Tc/WpwcfYso=; b=Fd3P4caT0q9ZTRgAWunkk5e6K7
	wvJBrFDIUoyAFmt9n+0LrI5l8E1Je5kL0VoY8eCP50ra5Cdlh+u8rYH2HnlpXAVQVEtNWHs68jn1m
	iW0hCyCJbsu/8G3RLqmFCV5yS6jluB3dMb235M6lYCTVNCk/vjdbRhwePQ3usTMmN8R2KJWWlmbFu
	3uXcHObFtVm/oYDbj6/bicPenqpw4kA0K6kHZQbjOkmGRMVLP4qVkGUxfiYADBR+KZDl/w1vYJSyM
	tr6LVB2qobXoKMCxos/L8QE0MjL0JvykNlMVfB3qiBw5MgyPnLZcm+2ZYPGB6JMDIl7rpcJ4mk4Y/
	uSDnf3oQ==;
Received: from ip6-localhost ([::1]:52884 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1scB36-004Clo-OT; Thu, 08 Aug 2024 21:51:56 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136]:44244) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1scB31-004Clg-Q4
 for samba-technical@lists.samba.org; Thu, 08 Aug 2024 21:51:53 +0000
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-52efe4c7c16so1978032e87.0
 for <samba-technical@lists.samba.org>; Thu, 08 Aug 2024 14:51:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1723153910; x=1723758710; darn=lists.samba.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zTilJSTMzzmTUfM8PwyjqnLeW2jPuc+7Tc/WpwcfYso=;
 b=nlyReK/Sm6JDLeBP0PsGv1XzZdc3rHpzjgwQZyKNHu+mvJvqSqZFihQ+VAUjbPaOLc
 ZJA1iYd2DP+OVqQSE7BdLI2BsoUR9uXFzu2fmPkekT6Ow9msRTysRN8hM95311KP4par
 +G6+9Ma6eHSmSfoCD2w1ASPBdLwFjawbRCoDn4zL2Ay4DTFSlJZRxAc6eN9RKETE60pP
 EcT3SEvjf2A3OfdJwDU7spr5NzdxAQyuI4XkZyaI04uwckv+BmYoex2nz9poGdBIe9TU
 MLkfoG63bkhnh9RgiLzv9Z61E1ZSw5DVSWOGHzwi2W/iMpYQFMeCuzRhXzuvhxB1YLoc
 gFLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723153910; x=1723758710;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zTilJSTMzzmTUfM8PwyjqnLeW2jPuc+7Tc/WpwcfYso=;
 b=Bg68CJWjkLdkUMGshwcucJwinVs0FR6HU/+lDXLI3taJjKt+aKs0AzU3F7kau24Hqi
 XoeWlbC8ovXjSNzDAUc+BAGYq/zuEUphsk1F+hVYgyVugGIhDYjpZ6HUCeSCmbiuIVAC
 wXd/ZvGpVy2q/8gJ1osVQhV4WM7xTBM8fZm0Ua0nw8vOKFBwfIBUej2fiLpIxk5CU8cg
 NfqVFUpLaHE0swHdqzQNeDlCqZgytfbLW3REA/yfdJ69ClKOasmzcWYFArEvDLuHAfXK
 9La1cy+Lf6mEirnvsjcZOcyltzyOQdLh6qQVQ1C4d/90hCzQJ8r9ggwzArrDGY8pqOEW
 aAiA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXkpYEPQveZRELGl2cV7dNFM0Ivv0X/yYoJQFAVFFIcng7XUwaUEuaBGrY2G28PsOd6pyDuhltX/0VXnfb4HVnP24A8W1frexY0/jGa0/hI
X-Gm-Message-State: AOJu0YzYVKLZfNrYZX/GIzWVDqolhXwBNlVx/kBBgIil1apXneYsJQfe
 7WMavH5yb9z8DbBCkV+AYbjbTv07eDiqdooIdbOUmiMVuOtvOlgghEp1U/GuZV1tC10mqftLTXC
 Z9/CjXOjSPZbRg42oDJqIrPbb2Dw=
X-Google-Smtp-Source: AGHT+IGES8fNHsGvpYv7uRV9s1I4pkbSiW25z5WmM1/EEFB1wRmanyCXIXI8O8RexuT7mqGHIaX1FSuWqO2mBT4epPY=
X-Received: by 2002:a05:6512:15aa:b0:52e:987f:cfe4 with SMTP id
 2adb3069b0e04-530e5876b8fmr2151699e87.30.1723153909723; Thu, 08 Aug 2024
 14:51:49 -0700 (PDT)
MIME-Version: 1.0
References: <20240808122331.342473-1-suhui@nfschina.com>
In-Reply-To: <20240808122331.342473-1-suhui@nfschina.com>
Date: Thu, 8 Aug 2024 16:51:37 -0500
Message-ID: <CAH2r5mshFXCMO38WMZP0NzrugKZn1QexLSH+2aEMcZnB2S0+zA@mail.gmail.com>
Subject: Re: [PATCH] smb/client: avoid possible NULL dereference in
 cifs_free_subrequest()
To: Su Hui <suhui@nfschina.com>
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
Cc: pc@manguebit.com, nathan@kernel.org, sprasad@microsoft.com,
 linux-cifs@vger.kernel.org, kernel-janitors@vger.kernel.org,
 samba-technical@lists.samba.org, llvm@lists.linux.dev, ndesaulniers@google.com,
 linux-kernel@vger.kernel.org, tom@talpey.com,
 David Howells <dhowells@redhat.com>, bharathsm@microsoft.com, morbo@google.com,
 justinstitt@google.com
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Tentatively merged into cifs-2.6.git pending review/testing

Did minor update to add Cc: stable

On Thu, Aug 8, 2024 at 7:26=E2=80=AFAM Su Hui <suhui@nfschina.com> wrote:
>
> Clang static checker (scan-build) warning:
>         cifsglob.h:line 890, column 3
>         Access to field 'ops' results in a dereference of a null pointer.
>
> Commit 519be989717c ("cifs: Add a tracepoint to track credits involved in
> R/W requests") adds a check for 'rdata->server', and let clang throw this
> warning about NULL dereference.
>
> When 'rdata->credits.value !=3D 0 && rdata->server =3D=3D NULL' happens,
> add_credits_and_wake_if() will call rdata->server->ops->add_credits().
> This will cause NULL dereference problem. Add a check for 'rdata->server'
> to avoid NULL dereference.
>
> Signed-off-by: Su Hui <suhui@nfschina.com>
> ---
>  fs/smb/client/file.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/fs/smb/client/file.c b/fs/smb/client/file.c
> index b2405dd4d4d4..45459af5044d 100644
> --- a/fs/smb/client/file.c
> +++ b/fs/smb/client/file.c
> @@ -315,7 +315,7 @@ static void cifs_free_subrequest(struct netfs_io_subr=
equest *subreq)
>  #endif
>         }
>
> -       if (rdata->credits.value !=3D 0)
> +       if (rdata->credits.value !=3D 0) {
>                 trace_smb3_rw_credits(rdata->rreq->debug_id,
>                                       rdata->subreq.debug_index,
>                                       rdata->credits.value,
> @@ -323,8 +323,12 @@ static void cifs_free_subrequest(struct netfs_io_sub=
request *subreq)
>                                       rdata->server ? rdata->server->in_f=
light : 0,
>                                       -rdata->credits.value,
>                                       cifs_trace_rw_credits_free_subreq);
> +               if (rdata->server)
> +                       add_credits_and_wake_if(rdata->server, &rdata->cr=
edits, 0);
> +               else
> +                       rdata->credits.value =3D 0;
> +       }
>
> -       add_credits_and_wake_if(rdata->server, &rdata->credits, 0);
>         if (rdata->have_xid)
>                 free_xid(rdata->xid);
>  }
> --
> 2.30.2
>
>


--=20
Thanks,

Steve

