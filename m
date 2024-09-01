Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 16C1F967C35
	for <lists+samba-technical@lfdr.de>; Sun,  1 Sep 2024 22:51:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=nmvtuu/nnTTPB5TNvDIzqgJV2raybGXEoThCiuyR1CU=; b=2Ny3AHlYuzsUIMtF19azt0gGgK
	7N1oBaS2HfNt6R/q63QjNQqO9Fm/2XZb80fWVnfreFpV7pYbxr2FJsjdATWbTHfv3PZ6KZamlMzqF
	C4qOBSSstFfHmLrR2uIIL1ISNr+HerVm1mVl+Q8v/8flAFGf0fgeo0bIpcudiHDK/DopTqO8QJ7Vc
	FGAyihCm14Px1LUkh/4BDQHIO4NhuxyWZcR0RFDgmY8pIbM7fDgd3xFeTb2GxD9bnfQ29uz3l3Ef4
	Weq6g0BphV2QtgM77Xwbcqtqo5p4fVR57MtRoqlgphWpmIpgwHEqMBCYEVjlA2fabuJqN5msS7wjF
	4PiDzHBA==;
Received: from ip6-localhost ([::1]:26408 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1skrWn-007mxH-3q; Sun, 01 Sep 2024 20:50:29 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132]:57661) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1skrWb-007mx9-0C
 for samba-technical@lists.samba.org; Sun, 01 Sep 2024 20:50:26 +0000
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-533de5a88f8so3651021e87.3
 for <samba-technical@lists.samba.org>; Sun, 01 Sep 2024 13:50:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725223815; x=1725828615; darn=lists.samba.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nmvtuu/nnTTPB5TNvDIzqgJV2raybGXEoThCiuyR1CU=;
 b=RtR5TpVB/59TFmN7HiTOMO3oFxnthO7dew07/TfTzgcH+QLtkCG2qNjkRvViolf33+
 QQFqDvJVtmq6CFTo4StPFgSus05W+LXVUHsV3N8L5rRZIXPwXtq9ZRK/SqWR7iv7lQJJ
 qTHou3eBMT8LILUXxbSxZcvPEg8hK9+550YDEpLr8NKvnct4sj1GaIReNfvB3GMig5Y9
 itNHEGluiK9TeqMZaSHmnhQvpnq/z5htVWXOiLm18ZxJ4FtLGIq2pPREsPSpxdyIW5AK
 s+2bKaJtL1KUjbIRDawcZTQoUky0MwzU1RJutrwYYjP3A4LV2EF2tdF3vP9aWQ0WcqPY
 ANkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725223815; x=1725828615;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nmvtuu/nnTTPB5TNvDIzqgJV2raybGXEoThCiuyR1CU=;
 b=sIl6rxUiv1gz5MRrjbSFF2kLe9geEX8QGg/iA4kk2FIgVbng1GKetcPKvFuPfmP/62
 4gjHoE/HJsRcIsnWKA+VYdd8EwRoxNV+18XTACHchMKv7kMb76Lddxd3vCPTF3MI/17n
 iqygd6B4z91eN6jfPz92BoDVXZ54lf8vlbJoyNXJsOQurs7/DEneTmP+LpMZ5BYgJamc
 R4Zv6EiEkRWonbwhiUb7u/0JThjjF3Evn0PynHYBqW60+Z9mhyUSHEnVYYkv+r/EtYbg
 jgZjLhpWZiGiw0j2wPE3Ca15ncqyveAsj9FzOFpeSKTcBr3wXDi0ZB6EJEy7QDnnHjWs
 6rtw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU5kYriH5SHZt67wm4roBqe4mQe4wUe/phH7xAsQv1zkHTqGioXKMSNEUjp7km6xYg5wk/uoaFEvm1Q9VLYDyQ=@lists.samba.org
X-Gm-Message-State: AOJu0Ywsp3mwte3hkMw5xePUBOQx52aK7PJVuXfaXbOUn08dOvUA09Ps
 vkuWjgz5uxyZuarr5NOPuwAllCO3eKi04t2utlzr4+xfgap7oV3gbtzNFAZy3j+w+n3vUoKE+K8
 6Je3Rat7bL3Mv5OZTsyER2NAIT7A=
X-Google-Smtp-Source: AGHT+IG/8AvC2IZQG8jqrB7dUuMYI9EscwxoJgIuyGSjXS7j3FsDwsUJazVMpgHaKq3g1u2kyX2l4lqKO5wzDzEgD9A=
X-Received: by 2002:a05:6512:1382:b0:530:dab8:7dd6 with SMTP id
 2adb3069b0e04-53546ba7bffmr5010405e87.50.1725223814609; Sun, 01 Sep 2024
 13:50:14 -0700 (PDT)
MIME-Version: 1.0
References: <20240901164002.117305-2-thorsten.blum@toblux.com>
In-Reply-To: <20240901164002.117305-2-thorsten.blum@toblux.com>
Date: Sun, 1 Sep 2024 15:50:03 -0500
Message-ID: <CAH2r5msAs9Lm=jzWd=pYnK3r9iANSNRTqHvHxNjzsBucgq9Ktw@mail.gmail.com>
Subject: Re: [RESEND PATCH] smb3: Use min() to improve _smbd_get_connection()
To: Thorsten Blum <thorsten.blum@toblux.com>,
 Shen Lichuan <shenlichuan@vivo.com>
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
 linux-kernel@vger.kernel.org, sfrench@samba.org, bharathsm@microsoft.com
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

There is a similar patch in cifs-2.6.git for-next-next (for 6.12-rc) from

smfrench@smfrench-ThinkPad-P52:~/cifs-2.6$ git show
commit a85383ccf515f82ad791f9bfe70b0e6fb5a2117f (HEAD ->
for-next-next, origin/for-next-next)
Author: Shen Lichuan <shenlichuan@vivo.com>
Date:   Tue Aug 27 16:54:20 2024 +0800

    smb: client: Use min() macro

    Use the min() macro to simplify the function and improve
    its readability.

    Signed-off-by: Shen Lichuan <shenlichuan@vivo.com>
    Signed-off-by: Steve French <stfrench@microsoft.com>

On Sun, Sep 1, 2024 at 11:40=E2=80=AFAM Thorsten Blum <thorsten.blum@toblux=
.com> wrote:
>
> Use the min() macro to simplify the _smbd_get_connection() function and
> improve its readability.
>
> Signed-off-by: Thorsten Blum <thorsten.blum@toblux.com>
> ---
>  fs/smb/client/smbdirect.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/fs/smb/client/smbdirect.c b/fs/smb/client/smbdirect.c
> index 7bcc379014ca..8f782edc3fd7 100644
> --- a/fs/smb/client/smbdirect.c
> +++ b/fs/smb/client/smbdirect.c
> @@ -1585,10 +1585,8 @@ static struct smbd_connection *_smbd_get_connectio=
n(
>         conn_param.initiator_depth =3D 0;
>
>         conn_param.responder_resources =3D
> -               info->id->device->attrs.max_qp_rd_atom
> -                       < SMBD_CM_RESPONDER_RESOURCES ?
> -               info->id->device->attrs.max_qp_rd_atom :
> -               SMBD_CM_RESPONDER_RESOURCES;
> +               min(info->id->device->attrs.max_qp_rd_atom,
> +                   SMBD_CM_RESPONDER_RESOURCES);
>         info->responder_resources =3D conn_param.responder_resources;
>         log_rdma_mr(INFO, "responder_resources=3D%d\n",
>                 info->responder_resources);
> --
> 2.46.0
>
>


--=20
Thanks,

Steve

