Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C10CCA26D4
	for <lists+samba-technical@lfdr.de>; Thu, 04 Dec 2025 06:50:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=7SYomATI96u/VTFhrTFGmsIeKSb/fBLFBlpYECdhpKU=; b=UlqLaALFurNRU8KOdEqCc2R/m5
	Xbj/wMpEy7YhKcGie/KA76SfKXzviOstc1Tx7ohMeu7/YuEke07CVeuOn4CJZTU+bBeA5gaI1gsOF
	3LG0I1DhVFHsWZGY6k9X5XnSB7DcUeEwAIjOK+k1yJY3d87AFmOKYqMrw7uTYRA4zB9c4zsuU22uV
	BOwGTlEhP6DJ7gFW5mHca9y8Gh8CU66Ln0s66XhNwU59xggZhOolHRZWtpDEsLsPj47cqC+jlVsZb
	jiYzM2gqcWhQPDawCXcG0m6Ir13tsUag/ijmm1XEeaqr4VSqVTcc3FdjNGno+hRdrGvWqj+zXAv8s
	UooCZqrw==;
Received: from ip6-localhost ([::1]:21068 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vR2Ds-00Ffpc-7J; Thu, 04 Dec 2025 05:49:48 +0000
Received: from mail-qv1-xf31.google.com ([2607:f8b0:4864:20::f31]:54550) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vR2Dn-00FfpV-45
 for samba-technical@lists.samba.org; Thu, 04 Dec 2025 05:49:45 +0000
Received: by mail-qv1-xf31.google.com with SMTP id
 6a1803df08f44-8843ebf2facso7536086d6.1
 for <samba-technical@lists.samba.org>; Wed, 03 Dec 2025 21:49:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764827381; x=1765432181; darn=lists.samba.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7SYomATI96u/VTFhrTFGmsIeKSb/fBLFBlpYECdhpKU=;
 b=MalE3rurAcrnEO2g4nGVJ7ljoUCribJnHA6HyRkgWhGKVwpoZzRGorVzRF36z6CEWg
 Mm6ZqUwkp3hNfnk8Egjc6GwmoDU6BP0+KlU8UAuiUMCUvD6w/NPAt37zd5ttKRLh6WnI
 10Bj54SkizUMeAiHnhvtTW0FWvnW8Q71KsoDkJGLMGUJjm/JHQ0+UbPs7T/dF6of9mta
 T0WQMKFwI5OPEC7CE/4eE2Xsr+KB/aSydsPYSbsXimrMLo3lmmfdaiV2sHxoeY1LROgn
 3aG/K3g7JEsIpq6+t20LkSz9nFUuMFXZjyevEuf3lKZwA+wkEGHOh/LLnmVY2Emmha6+
 iIUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764827381; x=1765432181;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=7SYomATI96u/VTFhrTFGmsIeKSb/fBLFBlpYECdhpKU=;
 b=eTQDaoqNI77yTl+YhHQU2ZKs4VB5yYJVWuJUs5uD+F6IcEZCnYi7md9MiMsSTyLaXT
 wzrQJskN3ZWiCcszodK5WAOHIy3PAsCAjUjhoBea9JBDEuz0QX/Yk/239Ekn1qOf2Lv0
 fy+EDsdGeT7bfwzrShNbuXUNj4waXi64qInC0m1jduWmrmmukRc+fLhPLL/rZ8fXnLWi
 vR67sbws/odZy4KgzPJpqWR8EC4wfBVSG3AmSYuBVugTJlvVsELYXdGjGdBc1FDkAXlO
 wud3GKt8cTFNO4qw+RAqbVaSF/mMB/WhvF7dDK2kTtEopQlu0ESP/4i3JxNiS8bzPZ2d
 6fXw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUwl/k5cc3jbeT6vLgTJciAsMEOtntTzG111XgP6uVKXzU88CziWYDtdrr1TX2+Ix8No193RCQmv6zTVjBxRLE=@lists.samba.org
X-Gm-Message-State: AOJu0Yz+zzljhke31yQfxdn5FobKEv0kiB0Lo1WhYV3S9YFhbDWL8Z3B
 GuSza9NVKiw1cxYMSrc78K4wC519AlYOT6WgCJqWIt+tmiPVl1GcAt4WQyb5slp1TF0oGNiLrrH
 9n0KXQZ//CgiH0Bjprv3Nh3JvKZsVS9A=
X-Gm-Gg: ASbGncsApiwEvy2n5F6GNq1cWPJbUuq0UHZ4Xhf7SKNsT6li2EJh1coNk1e2piepM/8
 4+m8Pe/5zcXA4lAm4WBNGiAYE03p82601QdGWi4S1IebzgFD520gb8CMLzQfQb4Ldi6V+T8+tEx
 pTP60Pd6Kt1cw6C3iBR0M4MdUjewVqG4v3JUQdWElYr1AzH/7MEX14oKc6y9RK6/0oPkqcUPQMn
 T/k69si6eM5zG/7PUYWMqONMTRs+oju9H3gt+V5FX9cVXZ/3rCqABG/YRupAIM03kaDdRljri6l
 gASMj1soprDFbNqZhAPqa59nR+TLtiTxP/93X+SpMQot+sq7HNcYy6r6nuz/wIjzllzTrZHltxX
 0fXcgRkxaBni+NZGUTQRqjHhfsLqlfZ1iJnsLMzO5BOm4TRVaWyDUNQCuji26VPg5cAttNJtZlj
 gL88WZa5lCCA==
X-Google-Smtp-Source: AGHT+IFt1TernB5P6diYBIWL/AavdCTOlaqpzrySpPeZUqcetycbtPAfnU//r8D1iw4R5PNNZoaNGJ+Rzok50eKUhPg=
X-Received: by 2002:a05:6214:2c13:b0:882:3759:9155 with SMTP id
 6a1803df08f44-888194f1abcmr77833716d6.21.1764827380949; Wed, 03 Dec 2025
 21:49:40 -0800 (PST)
MIME-Version: 1.0
References: <20251204045818.2590727-1-chenxiaosong.chenxiaosong@linux.dev>
 <20251204045818.2590727-2-chenxiaosong.chenxiaosong@linux.dev>
In-Reply-To: <20251204045818.2590727-2-chenxiaosong.chenxiaosong@linux.dev>
Date: Wed, 3 Dec 2025 23:49:29 -0600
X-Gm-Features: AWmQ_blsEQ4BXbbGrQMr1rTFyRAygmGD1bccTRFT_VTxGy-vBcE9rOmz8X2wpNs
Message-ID: <CAH2r5mu25T8sBO4P25St_H0F0KMenn+5QGWx1Tfa+=6AsF6aNw@mail.gmail.com>
Subject: Re: [PATCH 01/10] smb/client: reduce loop count in
 map_smb2_to_linux_error() by half
To: chenxiaosong.chenxiaosong@linux.dev
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
Cc: linux-cifs@vger.kernel.org,
 samba-technical <samba-technical@lists.samba.org>,
 linux-kernel@vger.kernel.org, linkinjeon@kernel.org,
 chenxiaosong@chenxiaosong.com, linkinjeon@samba.org,
 ChenXiaoSong <chenxiaosong@kylinos.cn>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Have merged the first three patches (see below) in this series into
cifs-2.6.git for-next pending additional review and testing.   The
other seven may also be ok - but want to look more carefully at them,
more review appreciated

ba521f56912f (HEAD -> for-next, origin/for-next) smb: add two elements
to smb2_error_map_table array
905d8999d67d smb/client: remove unused elements from smb2_error_map_table a=
rray
26866d690bd1 smb/client: reduce loop count in map_smb2_to_linux_error() by =
half

On Wed, Dec 3, 2025 at 10:59=E2=80=AFPM <chenxiaosong.chenxiaosong@linux.de=
v> wrote:
>
> From: ChenXiaoSong <chenxiaosong@kylinos.cn>
>
> The smb2_error_map_table array currently has 1740 elements. When searchin=
g
> for the last element and calling smb2_print_status(), 3480 comparisons
> are needed.
>
> The loop in smb2_print_status() is unnecessary, smb2_print_status() can b=
e
> removed, and only iterate over the array once, printing the message when
> the target status code is found.
>
> Signed-off-by: ChenXiaoSong <chenxiaosong@kylinos.cn>
> ---
>  fs/smb/client/smb2maperror.c | 30 ++++++------------------------
>  1 file changed, 6 insertions(+), 24 deletions(-)
>
> diff --git a/fs/smb/client/smb2maperror.c b/fs/smb/client/smb2maperror.c
> index 12c2b868789f..d1df6e518d21 100644
> --- a/fs/smb/client/smb2maperror.c
> +++ b/fs/smb/client/smb2maperror.c
> @@ -2418,24 +2418,6 @@ static const struct status_to_posix_error smb2_err=
or_map_table[] =3D {
>         {0, 0, NULL}
>  };
>
> -/***********************************************************************=
******
> - Print an error message from the status code
> - ***********************************************************************=
******/
> -static void
> -smb2_print_status(__le32 status)
> -{
> -       int idx =3D 0;
> -
> -       while (smb2_error_map_table[idx].status_string !=3D NULL) {
> -               if ((smb2_error_map_table[idx].smb2_status) =3D=3D status=
) {
> -                       pr_notice("Status code returned 0x%08x %s\n", sta=
tus,
> -                                 smb2_error_map_table[idx].status_string=
);
> -               }
> -               idx++;
> -       }
> -       return;
> -}
> -
>  int
>  map_smb2_to_linux_error(char *buf, bool log_err)
>  {
> @@ -2452,16 +2434,16 @@ map_smb2_to_linux_error(char *buf, bool log_err)
>                 return 0;
>         }
>
> -       /* mask facility */
> -       if (log_err && (smb2err !=3D STATUS_MORE_PROCESSING_REQUIRED) &&
> -           (smb2err !=3D STATUS_END_OF_FILE))
> -               smb2_print_status(smb2err);
> -       else if (cifsFYI & CIFS_RC)
> -               smb2_print_status(smb2err);
> +       log_err =3D (log_err && (smb2err !=3D STATUS_MORE_PROCESSING_REQU=
IRED) &&
> +                  (smb2err !=3D STATUS_END_OF_FILE)) ||
> +                 (cifsFYI & CIFS_RC);
>
>         for (i =3D 0; i < sizeof(smb2_error_map_table) /
>                         sizeof(struct status_to_posix_error); i++) {
>                 if (smb2_error_map_table[i].smb2_status =3D=3D smb2err) {
> +                       if (log_err)
> +                               pr_notice("Status code returned 0x%08x %s=
\n", smb2err,
> +                                         smb2_error_map_table[i].status_=
string);
>                         rc =3D smb2_error_map_table[i].posix_error;
>                         break;
>                 }
> --
> 2.43.0
>


--=20
Thanks,

Steve

