Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B4536A69989
	for <lists+samba-technical@lfdr.de>; Wed, 19 Mar 2025 20:37:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=WelDcJYWQaS3l09AcZuppDXU1WugmJGhAokrLxNPCgE=; b=5JSB6fmMhiSk/6+cM1HaQa7LBp
	p03fJCUO/3iRKipKH74ykY/JP4k7c36GvTMAURg9syCq7KV+t3tc8RZPz50J276w3Ltvmq8ZKeznA
	tIjD15FjSxtalagDftiK6do0HErSbHNGrs80QmL+HZqfQtNfM1nYy2AljIkaYI7NUNyOPDcsFBZJB
	Sbx4rTzYnedrZIjCasGX9SH3QIg2kcw4TfHqzs9MkAOq+6mAGEOHRWm1dEK+d05H/6NfWqworktsY
	8Q8rHn0Da7H64mdY6ISTHraBvKfi90AtdvHvxtkmYHVLle+cs/nVzKW3wMOfiOh5FrNYFj733z16B
	1csziXuw==;
Received: from ip6-localhost ([::1]:36632 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1tuzEb-00GYEw-K1; Wed, 19 Mar 2025 19:37:49 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130]:44218) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1tuzEW-00GYEp-Pa
 for samba-technical@lists.samba.org; Wed, 19 Mar 2025 19:37:47 +0000
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-5495c1e1b63so92582e87.0
 for <samba-technical@lists.samba.org>; Wed, 19 Mar 2025 12:37:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742413051; x=1743017851; darn=lists.samba.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WelDcJYWQaS3l09AcZuppDXU1WugmJGhAokrLxNPCgE=;
 b=TfStxsk3nAVD/Yf0YSqDYm1grTy39+T7WJWDH6PmNGvz6RmBrXTflKnWPye2g63jo/
 i43U2si7x5NRzP5Nyvj12oTp67KGVIoMrKHRpakptRVk8DFX91Bdl0c1jydvEmqzgyOK
 A9PAQ9p9jsBzdZglstO3EGwnwYAWfjb31IYkV4rY4dYAn62Nl5HtWg9HqQCfcclfBOXj
 C5Lf7WVNbwYw9vWPvc/VQ0qky0Y+9JpJQrfuq5U0L5o5YYj48T16bNJME6yxTAc4oE4y
 ziHVMUttEuqLBN7MgmUF8nTI53IoulufcD1+tWS73E7ZyRFIjIJa52lWbpypKzbFiY4e
 tJ4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742413051; x=1743017851;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WelDcJYWQaS3l09AcZuppDXU1WugmJGhAokrLxNPCgE=;
 b=PPmbrlg6q+mtGKsSwuBFTggr28nv+Gnd7Lo3Hl9vLG9t2e9oMwaMmxj5xoIZPfKn/l
 x/Nfg2j/N6slEnQM8qkLrNgpFJBgO4NvbomEvugdGz2BJBvrScCWLjyfPNumSf1E9yRR
 48F4TA9RB2GomKnCCUFJ7KT0GERv/vruWwuOMpEJ2rSSdDKCjbiM6tSaRTd6J748Yplx
 FN/hsjvyAMJ8JLri4gmd+NiyODvErG5VTqN8K7zl4hrGnzd8eRQmpCvW5AM8fWpgmWBD
 U2MgvPh+9s/RjAu8FSN50zx4r6/ctfXNoG3iFPCagKONBLQIfUDTSGoKcyVOrrokNZ/s
 n9Tw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWzW6DUtYXMEgaMr/9eUirFNnxlzQ+X8uG6P6UV2/ChqatAM5m33lcPdgEynnECJhK/JgPyM+AQkdibku1uXiI=@lists.samba.org
X-Gm-Message-State: AOJu0YwhxYp1WxMCwRuMSqr5cpO9GLHUl69cXYluSO/zqxz/FLm/9Vqm
 jiN80V0xAZhyd+VJvyDIo3GKm8DSk3dZMqTsGZKriuP4biBKI9/Fg6wFZAG7YVk0zUuK/J2/4U7
 fdrw8VUoSQDwuJJ37sMh2uF9SNTMaYA==
X-Gm-Gg: ASbGnctcU/rSLI60cFjB4UYHRQeKycboLdEqEVWcvar02zPRCqRudYpe5RK+OUI2sps
 ZRWqASPkDT82mtbcTTw17u8/3tf5sDAXTw0W1KqQqrhAPgtlhDlFbT6Mn5TwbNmgL8LPo6AFshs
 hscXIaApls5yrmzj4R+K9b6NAJf8MjEJVyarYGASn/iZxvEWitoqD+pgVf7oNg
X-Google-Smtp-Source: AGHT+IHrvWI3UoKXZQQSRHhL+gWni4iREVrtOgZThxYJkYpKtEfFcO9VBstPjZnI4CM4VdBfLrcZazPcLCorx1NKX8A=
X-Received: by 2002:a05:6512:398e:b0:549:38eb:d694 with SMTP id
 2adb3069b0e04-54acb1d23fbmr1449998e87.26.1742413051160; Wed, 19 Mar 2025
 12:37:31 -0700 (PDT)
MIME-Version: 1.0
References: <20250319142858.2166-1-adiupina@astralinux.ru>
In-Reply-To: <20250319142858.2166-1-adiupina@astralinux.ru>
Date: Wed, 19 Mar 2025 14:37:19 -0500
X-Gm-Features: AQ5f1JrgLUDmVpAP0c4ldz7sUhuXdXJkM2JqC2VPQQoZqLCK0Q3aELpbc3alokw
Message-ID: <CAH2r5mukVacAnksOjDE7k4UOSwzkkkA4PXEaKZAzZcFz78YBgQ@mail.gmail.com>
Subject: Re: [PATCH v2] cifs: avoid NULL pointer dereference in dbg call
To: Alexandra Diupina <adiupina@astralinux.ru>
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
 Shyam Prasad N <sprasad@microsoft.com>, lvc-project@linuxtesting.org,
 linux-cifs@vger.kernel.org, samba-technical@lists.samba.org,
 linux-kernel@vger.kernel.org, Steve French <sfrench@samba.org>,
 Bharath SM <bharathsm@microsoft.com>,
 =?UTF-8?Q?Aur=C3=A9lien_Aptel?= <aaptel@samba.org>,
 Pavel Shilovsky <pshilov@microsoft.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Added to cifs-2.6.git for-next

On Wed, Mar 19, 2025 at 10:00=E2=80=AFAM Alexandra Diupina
<adiupina@astralinux.ru> wrote:
>
> cifs_server_dbg() implies server to be non-NULL so
> move call under condition to avoid NULL pointer dereference.
>
> Found by Linux Verification Center (linuxtesting.org) with SVACE.
>
> Fixes: e79b0332ae06 ("cifs: ignore cached share root handle closing error=
s")
> Signed-off-by: Alexandra Diupina <adiupina@astralinux.ru>
> ---
> v2: fix indentation
>  fs/smb/client/smb2misc.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
>
> diff --git a/fs/smb/client/smb2misc.c b/fs/smb/client/smb2misc.c
> index f3c4b70b77b9..c02aab58aade 100644
> --- a/fs/smb/client/smb2misc.c
> +++ b/fs/smb/client/smb2misc.c
> @@ -816,11 +816,12 @@ smb2_handle_cancelled_close(struct cifs_tcon *tcon,=
 __u64 persistent_fid,
>                 WARN_ONCE(tcon->tc_count < 0, "tcon refcount is negative"=
);
>                 spin_unlock(&cifs_tcp_ses_lock);
>
> -               if (tcon->ses)
> +               if (tcon->ses) {
>                         server =3D tcon->ses->server;
> -
> -               cifs_server_dbg(FYI, "tid=3D0x%x: tcon is closing, skippi=
ng async close retry of fid %llu %llu\n",
> -                               tcon->tid, persistent_fid, volatile_fid);
> +                       cifs_server_dbg(FYI,
> +                                       "tid=3D0x%x: tcon is closing, ski=
pping async close retry of fid %llu %llu\n",
> +                                       tcon->tid, persistent_fid, volati=
le_fid);
> +               }
>
>                 return 0;
>         }
> --
> 2.30.2
>
>


--=20
Thanks,

Steve

