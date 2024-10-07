Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 17FDC99335E
	for <lists+samba-technical@lfdr.de>; Mon,  7 Oct 2024 18:35:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=KxmY+nGUCZfbuIzWB3p+ETPtotVwDRzbpkoSK23MWjw=; b=R26FWC6EvRL9cRMl2ddzTwZbqq
	vhqyJ70P52FDTCKUFQcfYXkjuJesShhR0UTuZePLZe5C/gzqIqA9mAJJhaPDLHroI1PsMCxRFFfBT
	ZGV8il5qS95WeFgL2lHk5WEPQZId8wWXFbG0+VxQOulpWbz05t+Y1Qy0BeMY6GalJz6CoadplAH7x
	qw2WojkRpcAsDtDMDtr55lAOCI5M4Eww660iBU9FkjoHLoVY14p4KBFTu0gkgAtc6S0x3XvBKSjhy
	Cp5XwUcd/P1yAfYRWPJTq8eAts8LQ7g7ORFrF/R00ZouoXtSbMtWcVuwWFK8sec2sCvWzmxIXbsMD
	Qie0ZP9w==;
Received: from ip6-localhost ([::1]:35804 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1sxqhY-003Dyo-Ev; Mon, 07 Oct 2024 16:35:16 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135]:59606) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1sxqhO-003Dyg-NR
 for samba-technical@lists.samba.org; Mon, 07 Oct 2024 16:35:10 +0000
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-53993c115cfso5898028e87.2
 for <samba-technical@lists.samba.org>; Mon, 07 Oct 2024 09:35:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1728318905; x=1728923705; darn=lists.samba.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KxmY+nGUCZfbuIzWB3p+ETPtotVwDRzbpkoSK23MWjw=;
 b=Ni71DNz4j/CntmnstIjC+BcrNAqYBW6/yzy/UyBEUmqPw66l+13Ex6ZeYXSO2rQTEL
 amgwIx3/zt/8T1pOOqfpWYihCicSVv8yLIOx2gfts0VfQyKMhxhsqjzgNoIM8PYhQGNW
 qrd9iJaddlSNzSq++zfYmb64VvhP0+Yes6ghAyaYntZ05+Q4m7GNUWxC4Fva9AWKs+RP
 DpRV0labb+4gZe3kmw9LH8nHD6ls/fazVdUvKJBk6A5qZ3IgQL+2fT7D5Xcyz3Dlp1Pc
 d/EMl/OgKg3DAuNyBrklJOM4eXqLm4Hnyws4+Jl3smAF3vajSo4hKN2NTXseoSTKN0BG
 ZO0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728318905; x=1728923705;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KxmY+nGUCZfbuIzWB3p+ETPtotVwDRzbpkoSK23MWjw=;
 b=DJr9+iVR8xp9a+azZ9A67tux+GTdkTreL9aBRWsVfGGyCyWkVLuXKRqF1IuNvaKvRT
 PgS+EtH/wqwJKDd2/eydudL1Zg9V2Y+a2unB3NXBLCqtiticLoVA5NCNNbRlHXS+K0Li
 gG0TZwEogS+CK9oGH4DWURK2Ip/mFwDl6GTGoG8+jxTukoRXbaOG4+bi+qpFqmaDQmV1
 cYhYY/xXdtOVyuWtei8PYUOqHepA32OhhUoKayE5qrwC+ueE7lHQz9LmzkfbDEYV1SxS
 Up9Pu+bwuVgwBuPGJpFRrUpdaWKuJJLPuMQFbKo/GfvWAH8J1fKEiO14HsauV7dlY2hU
 54Bg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU6mIFqfn06i3fiFJD/HFKxPrJQsRrLQEwNyHz28t5emN2RYneuFZFDNyxP8N51bGHYzB1C5ZJnTmbu7hpByLk=@lists.samba.org
X-Gm-Message-State: AOJu0YyRmpLmH8oCo1dzI/EMjMKZWeuYzBNqZReNWfGf9QyXgmJ9GBVT
 Sn8cdMs036Zds8jkIf3E/vW4jrCAk9hjXg409acZx4IExMXBJpyUMMYlrqH6irjjjEGRES6UZGV
 D579FMANxf4rK0z2XSedAP3v4TFk=
X-Google-Smtp-Source: AGHT+IGAkFQFjCGt+USfWPhUv17P2w7WoFstu7v6F6U9LDb9UEccZtgj5hMC7YTlbZH657NcJIEV0K0IjU8qKkoCB44=
X-Received: by 2002:a05:6512:158e:b0:539:8876:5555 with SMTP id
 2adb3069b0e04-539ab88ac11mr7279152e87.29.1728318904194; Mon, 07 Oct 2024
 09:35:04 -0700 (PDT)
MIME-Version: 1.0
References: <20241007152334.11780-1-advaitdhamorikar@gmail.com>
In-Reply-To: <20241007152334.11780-1-advaitdhamorikar@gmail.com>
Date: Mon, 7 Oct 2024 11:34:52 -0500
Message-ID: <CAH2r5muZn5OEUsXJ-LujJmnHmVMq+TuH89uxkbfXwVjLiCD+TQ@mail.gmail.com>
Subject: Re: [PATCH v2] smb/client: Fix logically dead code
To: Advait Dhamorikar <advaitdhamorikar@gmail.com>
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
 Enzo Matsumiya <ematsumiya@suse.de>, David Howells <dhowells@redhat.com>,
 samba-technical@lists.samba.org, linux-kernel@vger.kernel.org,
 Steve French <sfrench@samba.org>, Bharath SM <bharathsm@microsoft.com>,
 skhan@linuxfoundation.org, Colin Ian King <colin.i.king@gmail.com>,
 anupnewsmail@gmail.com
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Merged into cifs-2.6.git for-next

(also FYI - a similar patch was submitted soon after this one by
Colin, but was duplicate)

On Mon, Oct 7, 2024 at 10:23=E2=80=AFAM Advait Dhamorikar
<advaitdhamorikar@gmail.com> wrote:
>
> The if condition in collect_sample: can never be satisfied
> because of a logical contradiction. The indicated dead code
> may have performed some action; that action will never occur.
>
> Fixes: 94ae8c3fee94 ("smb: client: compress: LZ77 code improvements clean=
up")
> Signed-off-by: Advait Dhamorikar <advaitdhamorikar@gmail.com>
> ---
> v1->v2: update short log and changelog
>
>  fs/smb/client/compress.c | 4 ----
>  1 file changed, 4 deletions(-)
>
> diff --git a/fs/smb/client/compress.c b/fs/smb/client/compress.c
> index 63b5a55b7a57..766b4de13da7 100644
> --- a/fs/smb/client/compress.c
> +++ b/fs/smb/client/compress.c
> @@ -166,7 +166,6 @@ static int collect_sample(const struct iov_iter *iter=
, ssize_t max, u8 *sample)
>         loff_t start =3D iter->xarray_start + iter->iov_offset;
>         pgoff_t last, index =3D start / PAGE_SIZE;
>         size_t len, off, foff;
> -       ssize_t ret =3D 0;
>         void *p;
>         int s =3D 0;
>
> @@ -193,9 +192,6 @@ static int collect_sample(const struct iov_iter *iter=
, ssize_t max, u8 *sample)
>                                 memcpy(&sample[s], p, len2);
>                                 kunmap_local(p);
>
> -                               if (ret < 0)
> -                                       return ret;
> -
>                                 s +=3D len2;
>
>                                 if (len2 < SZ_2K || s >=3D max - SZ_2K)
> --
> 2.34.1
>


--=20
Thanks,

Steve

