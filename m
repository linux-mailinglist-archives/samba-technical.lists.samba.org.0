Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D0DA6745311
	for <lists+samba-technical@lfdr.de>; Mon,  3 Jul 2023 01:37:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=aHFK0zYmI9rlbwJHus0Wv+AFb/pa/A+qTUs5Ldro9ys=; b=WSlTInwAcmmrTC9D32ZG4XFJ4z
	ImIf+v6PQXNB73PBomqyYtLbt3rVJh2ayIDBeJC5+QGaNwvwLrFMXUN2XAlm90IWhodCjLstuyHUl
	EdnZPuH5tYNsd3iVlEHdIg9K4ZFaZovC0RP3GS79RfuM68ClzAGj/8Y6oU6VcOSwvgKXUbLUvd8TK
	DMlQAdT5z551eyqLj4ctNlqWeWUIDd4ZaIjPCOSy1LrI9ybiY6cUoClrdjgjXF45pSsbWs4K9Kodz
	FASJQVNz87CRHeFV6e1zi7w9QSQop6vbpkEtM83UMuIinf/bRoD4S2FDlwEDNH73dyKyeq7jA+3eO
	BCpaSPnw==;
Received: from ip6-localhost ([::1]:64038 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1qG6cS-007PZ3-OF; Sun, 02 Jul 2023 23:36:40 +0000
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235]:53525) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1qG6cN-007PYt-5H
 for samba-technical@lists.samba.org; Sun, 02 Jul 2023 23:36:37 +0000
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2b6e7d7952eso6230511fa.3
 for <samba-technical@lists.samba.org>; Sun, 02 Jul 2023 16:36:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1688340991; x=1690932991;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aHFK0zYmI9rlbwJHus0Wv+AFb/pa/A+qTUs5Ldro9ys=;
 b=PHvb5Cg8BbZDJ4YrFM5VPTFAHADQN6xV3I+4zRrZKdXeKuUeFGmiP3paqBW/qHRqU3
 eJDAMHnrU5E4y+/bBFH/Ivu2mMqcD2lcvlTa25sIX/04Dhbtio9Khh9T75r+htEUQuzK
 JKngACNRLS8BtF13CE8Inhypux4V9yA0toA8P/jou3SP028huxGXw3d4qrAOoyPtFbrC
 H0Y0kNusvB0n6bymhMEoSls7TUFGk+BUrwS01wTkjjLXtujw1f/YG1bZwTatZ+xoIMZp
 Rcuq8xp87ril7dNXgBcR3aGxObq7J9fL8xgDynNd3Yh+jqOx9RB+hTofE2CD/eL+3frR
 n9fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688340991; x=1690932991;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aHFK0zYmI9rlbwJHus0Wv+AFb/pa/A+qTUs5Ldro9ys=;
 b=eDnk77kCFoajVk+WtwY13PIYSFErfE3Te9k3fYAoixRDmv+XeuujhIwU/q15XtQZX2
 AsrR11mNUssEkaAJY82LNlYgkewD6Bubw9x4Rxu6nmc2ahjRyjPNBg+xmZbpFSzcFygN
 +QOPflTgv7jRgtCUj2i7gKfYKGVMwIsI/N83dOw0l0gXRwYwGRxn3VXXSacJ9N1W+b5a
 6gIgKzqBxym/2WSuPQxVZtiUYCbncvJQlC/PK8OhU7K/EXgIaE3nojI0VlycuLT82blZ
 QFI1WTbxkNCXpKkinuvafAV+2B8PaWWsttpNdyp6XT7K6ErB8tJd+8cgjoWNZr61Zo3X
 jUMw==
X-Gm-Message-State: ABy/qLbGe1fqh/MpsBy0gViQh/KufXQLUuQJuE84yGRbyFHNQiAw25HF
 XFyfKrMBqUnC6IDtR24DzDk/nsmpbmPJI0kwc0dXFj9Y9vo=
X-Google-Smtp-Source: APBJJlGN/fuohbhJPjsFEtjooRsxjY/wQdtV8zUm4WJTk+M+D0zxJeC/LQFxPvO+NnqdjcxdO89yJzErPM02gej3v08=
X-Received: by 2002:a2e:80d9:0:b0:2b6:a3a0:5f7 with SMTP id
 r25-20020a2e80d9000000b002b6a3a005f7mr5158743ljg.9.1688340991083; Sun, 02 Jul
 2023 16:36:31 -0700 (PDT)
MIME-Version: 1.0
References: <20230702130310.3437437-1-trix@redhat.com>
In-Reply-To: <20230702130310.3437437-1-trix@redhat.com>
Date: Sun, 2 Jul 2023 18:36:19 -0500
Message-ID: <CAH2r5mtuyXgfkNk65y0JjkUfaxxUuWHYOPuAXO8f_sp4_VDFAA@mail.gmail.com>
Subject: Re: [PATCH] smb: client: remove unused variable 'server'
To: Tom Rix <trix@redhat.com>
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
Cc: pc@manguebit.com, tom@talpey.com, sprasad@microsoft.com,
 linux-cifs@vger.kernel.org, samba-technical@lists.samba.org,
 linux-kernel@vger.kernel.org, lsahlber@redhat.com, sfrench@samba.org,
 Colin Ian King <colin.i.king@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Good catch - but this was removed a few days ago by Colin's patch

smfrench@smfrench-ThinkPad-P52:~/cifs-2.6$ git log fs/smb/client/dfs.c
commit dfbf0ee092a5d7a9301c81e815b5e50b7c0aeeda
Author: Colin Ian King <colin.i.king@gmail.com>
Date:   Fri Jun 30 12:33:37 2023 +0100

    smb: client: remove redundant pointer 'server'

    The pointer 'server' is assigned but never read, the pointer is
    redundant and can be removed. Cleans up clang scan build warning:

    fs/smb/client/dfs.c:217:3: warning: Value stored to 'server' is
    never read [deadcode.DeadStores]

    Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
    Signed-off-by: Steve French <stfrench@microsoft.com>

On Sun, Jul 2, 2023 at 8:43=E2=80=AFAM Tom Rix <trix@redhat.com> wrote:
>
> gcc with W=3D1 reports
> fs/smb/client/dfs.c: In function =E2=80=98__dfs_mount_share=E2=80=99:
> fs/smb/client/dfs.c:146:33: error: variable =E2=80=98server
>   set but not used [-Werror=3Dunused-but-set-variable]
>   146 |         struct TCP_Server_Info *server;
>       |                                 ^~~~~~
>
> This variable is not used, so remove it.
>
> Signed-off-by: Tom Rix <trix@redhat.com>
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
> 2.27.0
>


--=20
Thanks,

Steve

