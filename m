Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 792E682FDB8
	for <lists+samba-technical@lfdr.de>; Wed, 17 Jan 2024 00:18:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=Sgi/x32AtrRpAtlUrAUzikypQdqgt00q+aRRQsUjrKw=; b=dUNNn93x5ZF7fONMpEqdsQlPVm
	bOA0QcBiB1nnGCWyrxoHR70AKLZx3kklQCVTxfu7MdG1hGlwpvFSYav//F4hzxCq234LjUI6cVPwi
	XO3kaUCaJf/gKgFKh+FkvS2qu9Hi/jayLSkvOqiQMXW09XGPZTlouLdM+vL39SnQ6IDYyfs9d96//
	4Kd0He9qiZtnSliCuTJfP/iZXD3iC2bDiqtpWOLW9AshbWF6G1MOPU5R3OqVHLdYXxsjIOBTIuBDz
	dC6INYeDz1k4QjsTMO/Q3v3wVkN6VgbtsWNg0ZzBnQshkHzA7rvWZ4mDjEIUdreueHa08iTNP6Pud
	5DhLMAsQ==;
Received: from ip6-localhost ([::1]:54596 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1rPsgm-003d7J-Qo; Tue, 16 Jan 2024 23:17:48 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232]:48143) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rPsge-003d7C-TI
 for samba-technical@lists.samba.org; Tue, 16 Jan 2024 23:17:46 +0000
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2cd0f4f306fso121854701fa.0
 for <samba-technical@lists.samba.org>; Tue, 16 Jan 2024 15:17:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1705447058; x=1706051858; darn=lists.samba.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Sgi/x32AtrRpAtlUrAUzikypQdqgt00q+aRRQsUjrKw=;
 b=cp9KOX481gNDMzI8TEQcXL9vfAEzfib9LaGBCv4ZCe2p/gucJl17VlJFUzeB5Nb8RJ
 uSHp7g7IQEUUb7VK87BP6TEn7FuQfy4r/Q7gCD2sFtLMBYYnqZ3gt0f8mGKd77eD64DH
 WQUHTRJ4ZktNFsAkY37jNK1lSV0wERI0KCbmN6iH90GEoEBrI9QAAspqnZY3WXLIfCQK
 28BtDwdMKvPOdiSDRkS+eSBtuwgqZqbRw5xo2+5nFe9kJPEomOU4iy/15XkqdjOmoIWw
 1RhVlLzNNNKmra+62OqEEykm1AVAZiJEx3+vE13KeG0GnJmcTjYmshfKW4iLdjVjZ8WT
 Q3nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705447058; x=1706051858;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Sgi/x32AtrRpAtlUrAUzikypQdqgt00q+aRRQsUjrKw=;
 b=rWlu54ABayZ5goThdjPZsWemz3ykqbEi+AgdJRsQxszHPELINxWDtqt2qBOF6hp8Zo
 +g8O5nAMvGVOrxi5unt+mXu4MHMFYx0jhH85bhigG4T74Les59hA6CAs1IRadoVyb55a
 5cPdDsc+NpKg6G0khv+0ziJm2Is7bjqJpXPOIxDq9VBzhuLBbupMjrcJ37w993mg0x6n
 BW5OeX27jFngcVdLSKJ9TudVjf5hs1+rhY5XRlpYvWwC1kaZPRlLNM2r20fN4m/GmnDb
 saiowJlCW4xsIu40+qRfy8+h3rssyQiu7OE09G6yVYTWeowtjLS96tFSKjszApsVSELy
 uymQ==
X-Gm-Message-State: AOJu0Yz3GLwrA2iS9KFETzBLCEO/mRuzfbL7qe5i9kmzXYkg5kEImmFR
 W8CsLLLsLMO5oq8ipL7JwS5zUKVQYsetK1o0WUs=
X-Google-Smtp-Source: AGHT+IEsAm9zDWmYl8th45/sWyIYVODxCtIh83Fdjbug3h68CTsTNrN3iXVGpe173uP/14flCe4eqoOfSE/TuCY8deM=
X-Received: by 2002:a2e:9b0f:0:b0:2cc:ce6d:5ae5 with SMTP id
 u15-20020a2e9b0f000000b002ccce6d5ae5mr3869179lji.54.1705447057989; Tue, 16
 Jan 2024 15:17:37 -0800 (PST)
MIME-Version: 1.0
References: <20240116105134.2245640-1-colin.i.king@gmail.com>
In-Reply-To: <20240116105134.2245640-1-colin.i.king@gmail.com>
Date: Tue, 16 Jan 2024 17:17:26 -0600
Message-ID: <CAH2r5mvf+ZMyqpnFQUaO=DWC8ixXspsjWKE7BxQ1wW4WuvTVcA@mail.gmail.com>
Subject: Re: [PATCH][next] cifs: remove redundant variable tcon_exist
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
 linux-kernel@vger.kernel.org, Steve French <sfrench@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Yes - it looks like Shyam's commit made that variable obsolete.

Shyam/Paulo,
Let me know if any objections.  Will put into cifs-2.6.git for-next

commit 04909192ada3285070f8ced0af7f07735478b364 (tag: 6.7-rc4-smb3-client-f=
ixes)
Author: Shyam Prasad N <sprasad@microsoft.com>
Date:   Wed Dec 6 16:37:38 2023 +0000

    cifs: reconnect worker should take reference on server struct
unconditionally

    Reconnect worker currently assumes that the server struct
    is alive and only takes reference on the server if it needs
    to call smb2_reconnect.

    With the new ability to disable channels based on whether the
    server has multichannel disabled, this becomes a problem when
    we need to disable established channels. While disabling the
    channels and deallocating the server, there could be reconnect
    work that could not be cancelled (because it started).

    This change forces the reconnect worker to unconditionally
    take a reference on the server when it runs.

    Also, this change now allows smb2_reconnect to know if it was
    called by the reconnect worker. Based on this, the cifs_put_tcp_session
    can decide whether it can cancel the reconnect work synchronously or no=
t.

    Signed-off-by: Shyam Prasad N <sprasad@microsoft.com>
    Signed-off-by: Steve French <stfrench@microsoft.com>

On Tue, Jan 16, 2024 at 4:51=E2=80=AFAM Colin Ian King <colin.i.king@gmail.=
com> wrote:
>
> The variable tcon_exist is being assigned however it is never read, the
> variable is redundant and can be removed.
>
> Cleans up clang scan build warning:
> warning: Although the value stored to 'tcon_exist' is used in
> the enclosing expression, the value is never actually readfrom
> 'tcon_exist' [deadcode.DeadStores]
>
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---
>  fs/smb/client/smb2pdu.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/fs/smb/client/smb2pdu.c b/fs/smb/client/smb2pdu.c
> index bd25c34dc398..50f6bf16b624 100644
> --- a/fs/smb/client/smb2pdu.c
> +++ b/fs/smb/client/smb2pdu.c
> @@ -3918,7 +3918,7 @@ void smb2_reconnect_server(struct work_struct *work=
)
>         struct cifs_ses *ses, *ses2;
>         struct cifs_tcon *tcon, *tcon2;
>         struct list_head tmp_list, tmp_ses_list;
> -       bool tcon_exist =3D false, ses_exist =3D false;
> +       bool ses_exist =3D false;
>         bool tcon_selected =3D false;
>         int rc;
>         bool resched =3D false;
> @@ -3964,7 +3964,7 @@ void smb2_reconnect_server(struct work_struct *work=
)
>                         if (tcon->need_reconnect || tcon->need_reopen_fil=
es) {
>                                 tcon->tc_count++;
>                                 list_add_tail(&tcon->rlist, &tmp_list);
> -                               tcon_selected =3D tcon_exist =3D true;
> +                               tcon_selected =3D true;
>                         }
>                 }
>                 /*
> @@ -3973,7 +3973,7 @@ void smb2_reconnect_server(struct work_struct *work=
)
>                  */
>                 if (ses->tcon_ipc && ses->tcon_ipc->need_reconnect) {
>                         list_add_tail(&ses->tcon_ipc->rlist, &tmp_list);
> -                       tcon_selected =3D tcon_exist =3D true;
> +                       tcon_selected =3D true;
>                         cifs_smb_ses_inc_refcount(ses);
>                 }
>                 /*
> --
> 2.39.2
>
>


--=20
Thanks,

Steve

