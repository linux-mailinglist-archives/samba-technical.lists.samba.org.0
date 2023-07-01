Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 99B337446C4
	for <lists+samba-technical@lfdr.de>; Sat,  1 Jul 2023 07:25:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=UWSfT3e2CdHXT3PPccjwI1PvUkLEKr2RqsUNIeb0KVU=; b=3II+5nkIuuSY8Ugyjf5mfgHUKt
	wpTV88pOO7tj1J22+IMDYd2/Q+SyF/5dJZk2ngJIDJMQICzs3UPsvghxirC6YKVYsj+vj1/CUi8rb
	/2GujjkV6hweBOzzrBzuz8IkYeTO9JwjSx476JG/sl17gIuZ2J3Rg8QnEgPyalDW3juPzDJsg4IGB
	6C6wOd0n8Z7FbGfL50j5cQbbRWQRpSN07L8gEUpBjEBF2rdbW5+2+1l3gsRH7hUUViM55Invq/hCZ
	lULr4g4bvOciTO73HzgrtJtgq9Sx1z/ZoxW4yZw0PZ9uUl38bUYBey2+t48Nmb4Hn9H1l3np08Di4
	WvP6N8mA==;
Received: from ip6-localhost ([::1]:55678 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1qFT5h-007GzG-Sf; Sat, 01 Jul 2023 05:24:13 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232]:48599) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1qFT5Z-007Gz7-0T
 for samba-technical@lists.samba.org; Sat, 01 Jul 2023 05:24:09 +0000
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2b69f958ef3so42592341fa.1
 for <samba-technical@lists.samba.org>; Fri, 30 Jun 2023 22:24:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1688189042; x=1690781042;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UWSfT3e2CdHXT3PPccjwI1PvUkLEKr2RqsUNIeb0KVU=;
 b=dv4BNmhKurSjr4SFlv7PvcW3oxS+o5nRZ0A8lZkOheALgd3YqDXfLTZeSoDO3TwBO4
 HeowMn4na6OlBLRtOwoXYQ9LpIT6ZY/iOzYi2Nn5U0IkAUbGVj/fVT6eU9tM/XYiM68U
 7+00JLc0mja0wzB2ItiXGm0kOMLiyTqLhi6UXs6Eb24uspVLE18y8n8X7jtCqxmDPO9W
 uzMm8WlrJxeJguV4qoXVRw6siOUYOkaKFRN5cXEPz8JN/lUMzKzHr2Lj68wXrp1YJTr7
 rtSrycUqnjmq5hSVc8EzFqhtwWoFfNri+c0UhLgeHAPcxIa1AhcDfjVDdAB8acEuPM8+
 CWcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688189042; x=1690781042;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UWSfT3e2CdHXT3PPccjwI1PvUkLEKr2RqsUNIeb0KVU=;
 b=ghK76MleRndzBFDhbZGw/U44DPVhj02jCjallwmoxqI1FWoJoajXHECZiGjrhp3eEx
 jxHDukMNiq1L0Ac47tzgczebEYvPKq7zy5pO7gyBpf+lJl0KmRHyzhNcpRnPXH3DKhEL
 P32kGl+MX/6EIROIORWOAqItaehJ0VTbV2GRUcgnR6Jj4vLkgvZiy5WnR0QEZabyz1sh
 Ax+7DCBZ6WjD4ozSaN3OVXL10LRlsz43UnpFK0fNy49R0UE1swTPt5o0dF/gscM4f8bj
 NIfZO1BgJc2a5pQXjVvkXSt85CJFHdFmGWdTsmm2qX5XK4V9ee9FgBudWfUzpYLzecLF
 tzgg==
X-Gm-Message-State: ABy/qLZtKk6DpQU0v9M7kVnX+xwH+cQ/HfxxyCrn6lb1QDClaxkO/0qr
 Kvw2SY1LZ/kwa2yVXgaJIJH3M8Pm8dIdKzw0yJQ=
X-Google-Smtp-Source: APBJJlGmNEZoTcJGC2KNmbJoTnMMgs2JN1FJjXl5qHsHC2/aeL9kSCLBqESKoi5FjagfbSLqnN3Yag9zoRE0fvq0Xs8=
X-Received: by 2002:a2e:88c8:0:b0:2b6:ca1d:ee88 with SMTP id
 a8-20020a2e88c8000000b002b6ca1dee88mr3354057ljk.12.1688189042086; Fri, 30 Jun
 2023 22:24:02 -0700 (PDT)
MIME-Version: 1.0
References: <20230630113337.123257-1-colin.i.king@gmail.com>
In-Reply-To: <20230630113337.123257-1-colin.i.king@gmail.com>
Date: Sat, 1 Jul 2023 00:23:50 -0500
Message-ID: <CAH2r5mvkWeMO-AoPEpDbeKy8_K5hz3nJL3-BPh+w4Dow0qoOkg@mail.gmail.com>
Subject: Re: [PATCH][next] smb: client: remove redundant pointer 'server'
To: Colin Ian King <colin.i.king@gmail.com>
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
Cc: Paulo Alcantara <pc@manguebit.com>, Tom Talpey <tom@talpey.com>,
 Shyam Prasad N <sprasad@microsoft.com>, linux-cifs@vger.kernel.org,
 kernel-janitors@vger.kernel.org, samba-technical@lists.samba.org,
 linux-kernel@vger.kernel.org, Ronnie Sahlberg <lsahlber@redhat.com>,
 Steve French <sfrench@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

merged into cifs-2.6.git for-next

On Fri, Jun 30, 2023 at 6:35=E2=80=AFAM Colin Ian King <colin.i.king@gmail.=
com> wrote:
>
> The pointer 'server' is assigned but never read, the pointer is
> redundant and can be removed. Cleans up clang scan build warning:
>
> fs/smb/client/dfs.c:217:3: warning: Value stored to 'server' is
> never read [deadcode.DeadStores]
>
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---
>  fs/smb/client/dfs.c | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/fs/smb/client/dfs.c b/fs/smb/client/dfs.c
> index 26d14dd0482e..1403a2d1ab17 100644
> --- a/fs/smb/client/dfs.c
> +++ b/fs/smb/client/dfs.c
> @@ -143,7 +143,6 @@ static int __dfs_mount_share(struct cifs_mount_ctx *m=
nt_ctx)
>         struct smb3_fs_context *ctx =3D mnt_ctx->fs_ctx;
>         char *ref_path =3D NULL, *full_path =3D NULL;
>         struct dfs_cache_tgt_iterator *tit;
> -       struct TCP_Server_Info *server;
>         struct cifs_tcon *tcon;
>         char *origin_fullpath =3D NULL;
>         char sep =3D CIFS_DIR_SEP(cifs_sb);
> @@ -214,7 +213,6 @@ static int __dfs_mount_share(struct cifs_mount_ctx *m=
nt_ctx)
>         } while (rc =3D=3D -EREMOTE);
>
>         if (!rc) {
> -               server =3D mnt_ctx->server;
>                 tcon =3D mnt_ctx->tcon;
>
>                 spin_lock(&tcon->tc_lock);
> --
> 2.39.2
>


--=20
Thanks,

Steve

