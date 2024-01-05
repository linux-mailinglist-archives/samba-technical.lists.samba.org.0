Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D9375825B4F
	for <lists+samba-technical@lfdr.de>; Fri,  5 Jan 2024 20:58:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=FRLMdfdFEFGxBekM0Ah4/mWBgPRmZGkIhZJOiMWzNJs=; b=yQYK5EfYqED764EgQAthpkyPjZ
	9scnATLD6SMIlgtAbUkI9blK/AjOtnjm6+0snj+mSuaJW0YuE17V/9Etxai2Q7Ezpmsg+98gUZgD0
	k071pparud+GpYr/Ak/Wn9OZj45OTcBLNk6q1wRjkhEQAIvPglvXYw72EN+SEUSaUoQWJLSoLBt+L
	cTvssIyatNi2QR1TmGWLfPJnpxlMEGjJ9a7tqIF5nKLNn6kQ7FmWvxQEGSY61SqDANCw7m8C2Z1Sz
	1hrbotPfQN7ROMZq+OrD8sMefCZ3K0lswZBMEdRVGVgyN/m34A2ftn/rmQsMM27Pim1ycbxHIxFnm
	qghemFBw==;
Received: from ip6-localhost ([::1]:30456 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1rLqK5-002XmB-7j; Fri, 05 Jan 2024 19:57:41 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c]:59803) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rLqJz-002Xm4-Fe
 for samba-technical@lists.samba.org; Fri, 05 Jan 2024 19:57:39 +0000
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2cd0db24e03so23747421fa.3
 for <samba-technical@lists.samba.org>; Fri, 05 Jan 2024 11:57:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704484654; x=1705089454; darn=lists.samba.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FRLMdfdFEFGxBekM0Ah4/mWBgPRmZGkIhZJOiMWzNJs=;
 b=DRGKK4sdLVCxq5CB6tidXTEtysQQ0y/17W4brOOXprw4EHoDsrUUuDP2loZ5UYLK55
 tKwYY1YB063h+WA9hlxkBdKbufTdYkQ+k5CiIeJFaAICOUmt1i92WQEbtzlK3ZG4a2Hq
 fyzyWZDbop0IA4Bc/nc3htvSVackhk3bLZXXtHWAlKd3Az5gbe1hdvA1YkaKy4rUbDAr
 v4ZuGGmeuD46zDpUfWKV5RZFthHq/KXZ8uFHMss2sww9Zuy1+7tGwRB3dvpjAq9ABfqk
 flV1jGxbYNuuDJLOwAa+vCaPdRggY9k2M2v63gPulU2AgaUSMOYbliGGa8Pb4z3aUlaM
 XGMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704484654; x=1705089454;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FRLMdfdFEFGxBekM0Ah4/mWBgPRmZGkIhZJOiMWzNJs=;
 b=c4L8Fy1ueqzGgGm2sFLRQFSSTVYO5rHwqhs3FjYIIa14Smim9qO96vGIp6wiOPTzBj
 Fd5qCurhH/52wPRv6LFwmJ4ALo3IZdgQGN7N/ZHD0sqPFsOwRiExcyosEYChhqA4v6UU
 +nRRaIGYu/9oCnSWZlpMPr6xprxSP4w01E4bhr6ZqJlYoKy7jXFJJlaqhdJxp9R7LZgV
 Sz/f2havjZg8YPNNR+/3mZTawfyTH92dADHGOZEZma095cMOEGGYEnQcHZzvi0cA0LLn
 GZIm7OicGznyDEpjPzYYZ+6nOoXmjv4Bq1Qn/fE1GH8I+7F74fkL2DsqI1wwM4g6t53h
 v0kQ==
X-Gm-Message-State: AOJu0YzVO6TvyBdRe0D4rNJrFhZ8jjbcGjhpdqu4S501vYhx3ebReiSE
 J4t/LY7Hkas5s/jccA2XTgs2CHpVpKjPAFNs4lo=
X-Google-Smtp-Source: AGHT+IHGDXHjbGA05eHZAKK9YFIY2QI6JAgCi4NVMCV+oKA8gMgpFfW2yWE82rmCIYPb4lI2ZnakHtpo7zPlCtYX4B8=
X-Received: by 2002:a2e:a683:0:b0:2cc:6fbb:8b07 with SMTP id
 q3-20020a2ea683000000b002cc6fbb8b07mr565252lje.98.1704484653691; Fri, 05 Jan
 2024 11:57:33 -0800 (PST)
MIME-Version: 1.0
References: <9e415e37-a5bf-459f-8b9c-a02431e8fcfd@web.de>
In-Reply-To: <9e415e37-a5bf-459f-8b9c-a02431e8fcfd@web.de>
Date: Fri, 5 Jan 2024 13:57:22 -0600
Message-ID: <CAH2r5mtDbP3XZTdrT97KB8R4ujZ1qHOkn=4RUsvzsHEcmwLxwg@mail.gmail.com>
Subject: Re: [PATCH] smb3: Improve exception handling in allocate_mr_list()
To: Markus Elfring <Markus.Elfring@web.de>
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
Cc: Paulo Alcantara <pc@manguebit.com>, linux-cifs@vger.kernel.org,
 Shyam Prasad N <sprasad@microsoft.com>, samba-technical@lists.samba.org,
 kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 Ronnie Sahlberg <lsahlber@redhat.com>, Steve French <sfrench@samba.org>,
 Tom Talpey <tom@talpey.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

merged into cifs-2.6.git for-next

On Sat, Dec 30, 2023 at 3:47=E2=80=AFAM Markus Elfring <Markus.Elfring@web.=
de> wrote:
>
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Fri, 29 Dec 2023 20:43:12 +0100
>
> The kfree() function was called in one case by
> the allocate_mr_list() function during error handling
> even if the passed variable contained a null pointer.
> This issue was detected by using the Coccinelle software.
>
> Thus use another label.
>
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  fs/smb/client/smbdirect.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/fs/smb/client/smbdirect.c b/fs/smb/client/smbdirect.c
> index 94df9eec3d8d..d74e829de51c 100644
> --- a/fs/smb/client/smbdirect.c
> +++ b/fs/smb/client/smbdirect.c
> @@ -2136,7 +2136,7 @@ static int allocate_mr_list(struct smbd_connection =
*info)
>         for (i =3D 0; i < info->responder_resources * 2; i++) {
>                 smbdirect_mr =3D kzalloc(sizeof(*smbdirect_mr), GFP_KERNE=
L);
>                 if (!smbdirect_mr)
> -                       goto out;
> +                       goto cleanup_entries;
>                 smbdirect_mr->mr =3D ib_alloc_mr(info->pd, info->mr_type,
>                                         info->max_frmr_depth);
>                 if (IS_ERR(smbdirect_mr->mr)) {
> @@ -2162,7 +2162,7 @@ static int allocate_mr_list(struct smbd_connection =
*info)
>
>  out:
>         kfree(smbdirect_mr);
> -
> +cleanup_entries:
>         list_for_each_entry_safe(smbdirect_mr, tmp, &info->mr_list, list)=
 {
>                 list_del(&smbdirect_mr->list);
>                 ib_dereg_mr(smbdirect_mr->mr);
> --
> 2.43.0
>
>


--=20
Thanks,

Steve

