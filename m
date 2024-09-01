Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 610D3967509
	for <lists+samba-technical@lfdr.de>; Sun,  1 Sep 2024 06:44:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=XB13jX7pqzNo9GSIstR/wq8ueYkysOGTG6QjGevDfZY=; b=aXs565pV+P6qRe6Fdx94FRXxq7
	eB5CA8xIvVa+ZJ75VEdN+oaz5Gmh4BpsCV+Xdu1G00LESDT0UgAKVBHJiaflGua1FYCVV9iVrhdZM
	3y+qyePyEcYSxqLjIKHkNolWz6KsAStAAP92Ipy+54+bcJov0ZFkf9EayMDuH2mtKO8Ji/eAY9ij3
	0x6tNrwcZpu9F0egb63nIuRnIWEalkYDZvLkGTnmOfqx6QPs2kjAyc2FAcOmwy81iIReLgM2RxTPU
	BbG6xX+pSkMUcefaUR1HDOUfpV7+4ulTIBVc0KoAYRypQG9oKf9yxkuwrc74PEKpmuTuu/o574Ymv
	r05cgY8A==;
Received: from ip6-localhost ([::1]:25848 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1skcR7-007lUp-QR; Sun, 01 Sep 2024 04:43:37 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b]:47304) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1skcR3-007lUi-Ax
 for samba-technical@lists.samba.org; Sun, 01 Sep 2024 04:43:35 +0000
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-53345dcd377so4200975e87.2
 for <samba-technical@lists.samba.org>; Sat, 31 Aug 2024 21:43:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725165812; x=1725770612; darn=lists.samba.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XB13jX7pqzNo9GSIstR/wq8ueYkysOGTG6QjGevDfZY=;
 b=gthsAdJjN85xoYsR5DBP+dWgcvXO1ccr2Pdx4l9LzHT84XN7lqtVkSRtL9EbIiihsX
 /W43nyj5iR4UhBl9Zy7gf4P0mPfk8eTqEi6AcYr/owvxGEBvDFbRV5cUUQYRT/zoAdRU
 UZGt8AOvr2TSemt2d7dq68Cr1Imfx6FLwtDbag/dG2OBsDKLUzYl/R0jRzQSfUWMbj6T
 jpL8W8XvlTLbz+N1gmhF+g11hC1ewjyz9wME4IBniQMgkkv5rjHcoDo1KNfIKUYFUnjW
 pRnVzBEHC/ilOG8edXe7yEcXd5NE9ODS6bwZ98dZAvOTJkDX3LxWDlShzxlWZODSQIVA
 F5/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725165812; x=1725770612;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XB13jX7pqzNo9GSIstR/wq8ueYkysOGTG6QjGevDfZY=;
 b=dNhS4IFYELVeETK9Ttu0VsTn1k/kDKUoBdI4ejeB8XkQioMX2v37UmTPck0w8aVrD4
 wjOkZ04gGliMm7v0/530muI9VV0+NqCX7gv6KkKQjXICwImydNy52fcMNn/B9EE/hH8A
 Zm59vLqq4AcCJoZtpNhv+/gAr6SlPez3HNfsWwQ4kgHMxR4sEElASTrNkgLtAJRcOwgX
 U4JVIffYRhadu9lthkyD8jYBznuA1n40IO+z2lqINd5Q7CQ6CqtYnX4nzqUGwegvL1zo
 CA/XV21tKx8ObjddATgBJ/X0+6twbY9V98wTzqbFwBe8LCIaW5vum5kj1cCEIalYjRU8
 EQEQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV9heYhrjhRSuE2CeDyADM18zez5Ch+zveSC6wPwr/pIPcVkJQ5KsmQHWQRuHtqNhS5OE6sibva2bjLEOwuTmo=@lists.samba.org
X-Gm-Message-State: AOJu0YyNXM/StRTaNlkdic/KI8DDqmSPhG1BXhZTxoSsMpX37L3V+A+E
 SF9X5pFwBU/vDAwheVbff4PkUiK8++5AkWr9rvU+5G6/kQ7NrFqxJEJkeeMo2u7hS5GJxDnserH
 1loLTwMqbxZ0PO1lxj4U+c8UUXWk=
X-Google-Smtp-Source: AGHT+IHu4y+uRiMhDn0qrmVune+00KaG6AT8nPwiLjbra3+fFieFK0+pk+mIHvbGu5xjBuCn1mALeBcQLNE4j/WlkzY=
X-Received: by 2002:a05:6512:3c99:b0:52e:9f17:841a with SMTP id
 2adb3069b0e04-53546af3048mr5220331e87.6.1725165811310; Sat, 31 Aug 2024
 21:43:31 -0700 (PDT)
MIME-Version: 1.0
References: <20240827085420.76655-1-shenlichuan@vivo.com>
In-Reply-To: <20240827085420.76655-1-shenlichuan@vivo.com>
Date: Sat, 31 Aug 2024 23:43:20 -0500
Message-ID: <CAH2r5mtEvkw-v6dr7KdxoA6kzhraEx06kosrYoD-p1kmkX7cgw@mail.gmail.com>
Subject: Re: [PATCH v1] smb: client: Use min() macro
To: Shen Lichuan <shenlichuan@vivo.com>
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
 linux-kernel@vger.kernel.org, sfrench@samba.org, bharathsm@microsoft.com,
 opensource.kernel@vivo.com
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

tentatively merged to cifs-2.6.git for-next-next (target for 6.12-rc)
pending additional review and testing

On Tue, Aug 27, 2024 at 3:54=E2=80=AFAM Shen Lichuan <shenlichuan@vivo.com>=
 wrote:
>
> Use the min() macro to simplify the function and improve
> its readability.
>
> Signed-off-by: Shen Lichuan <shenlichuan@vivo.com>
> ---
>  fs/smb/client/cifsacl.c   | 2 +-
>  fs/smb/client/smbdirect.c | 8 +++-----
>  2 files changed, 4 insertions(+), 6 deletions(-)
>
> diff --git a/fs/smb/client/cifsacl.c b/fs/smb/client/cifsacl.c
> index f5b6df82e857..2f9a1bb6e21c 100644
> --- a/fs/smb/client/cifsacl.c
> +++ b/fs/smb/client/cifsacl.c
> @@ -187,7 +187,7 @@ compare_sids(const struct cifs_sid *ctsid, const stru=
ct cifs_sid *cwsid)
>         /* compare all of the subauth values if any */
>         num_sat =3D ctsid->num_subauth;
>         num_saw =3D cwsid->num_subauth;
> -       num_subauth =3D num_sat < num_saw ? num_sat : num_saw;
> +       num_subauth =3D min(num_sat, num_saw);
>         if (num_subauth) {
>                 for (i =3D 0; i < num_subauth; ++i) {
>                         if (ctsid->sub_auth[i] !=3D cwsid->sub_auth[i]) {
> diff --git a/fs/smb/client/smbdirect.c b/fs/smb/client/smbdirect.c
> index 7bcc379014ca..f307122b59fe 100644
> --- a/fs/smb/client/smbdirect.c
> +++ b/fs/smb/client/smbdirect.c
> @@ -1584,11 +1584,9 @@ static struct smbd_connection *_smbd_get_connectio=
n(
>         memset(&conn_param, 0, sizeof(conn_param));
>         conn_param.initiator_depth =3D 0;
>
> -       conn_param.responder_resources =3D
> -               info->id->device->attrs.max_qp_rd_atom
> -                       < SMBD_CM_RESPONDER_RESOURCES ?
> -               info->id->device->attrs.max_qp_rd_atom :
> -               SMBD_CM_RESPONDER_RESOURCES;
> +       conn_param.responder_resources =3D
> +               min(info->id->device->attrs.max_qp_rd_atom,
> +                   SMBD_CM_RESPONDER_RESOURCES);
>         info->responder_resources =3D conn_param.responder_resources;
>         log_rdma_mr(INFO, "responder_resources=3D%d\n",
>                 info->responder_resources);
> --
> 2.17.1
>
>


--=20
Thanks,

Steve

