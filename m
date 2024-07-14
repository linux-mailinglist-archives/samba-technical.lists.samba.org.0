Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id F2AF7930BC6
	for <lists+samba-technical@lfdr.de>; Sun, 14 Jul 2024 23:32:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=v4xkzDWX19N9oFSSTQeCe65G8IASeY++bNpXDyU0BaI=; b=StRqfLZ9GVycTEXKsKd/i5/CMe
	wj+WslpmX2UoOFlk5ugUzvOy8l2evlC+jGHFJNMSdQ5fMiihpssgvIcge8aTfe+rk+qYXMn/dwGFN
	6NmOJwJKfjwhISSjNG1qRbIJRSjPEw7w7K7LelpW3JeXnG9xnDbA/roY9PHBbr0cef1V1dcKoK8Cj
	OY72MetXAYJGWLJP4IWIofABeqWpevo0dVyWnc32LmoxnDdWfmY3KOeCWXcLEOdIb2aKEXE98UYWk
	ovnZszw1H40q0lcIQoFdZUCSwtXAWNojvivizOdaQva8ZDx87oEm5WCFwCmqCy3mz+ypvUKT2KsEh
	XltoxfFg==;
Received: from ip6-localhost ([::1]:19940 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1sT6oZ-000gvC-Qh; Sun, 14 Jul 2024 21:31:27 +0000
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236]:55540) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1sT6oV-000gv5-0F
 for samba-technical@lists.samba.org; Sun, 14 Jul 2024 21:31:25 +0000
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2eec7e431d9so46751471fa.2
 for <samba-technical@lists.samba.org>; Sun, 14 Jul 2024 14:31:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1720992681; x=1721597481; darn=lists.samba.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=v4xkzDWX19N9oFSSTQeCe65G8IASeY++bNpXDyU0BaI=;
 b=N4c4E7i/hLOCccTSvLIcqIo2LGFhjr6WJMV48KpUxbWGqI1SYJ7Kci4HyXI0uT4v2L
 rMRbw4K8TUDRnCWZuMyx2qhLT7gD9FltKjgf76okZ4PaCABW9cIgmnCUXJOFdkxAjG26
 LS0HZRGlwZe6UGggRkngL9g1C9zVsc167/XLCECEAW3mKjlAl2onUtic2HspUx1fa5H4
 TdLsQ/qPjP+2tJQdrP0ZWzrzU5yYi11qyXo/13N+M4PPxKgVvmlG0idIxJB1QB+GPncw
 /I4pxJSpKtIZroB+1T5yRh+bN26XOrX/oZkk86ilnRyiDyu83yGnfWuqash0wQZjAU9j
 NRIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720992681; x=1721597481;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=v4xkzDWX19N9oFSSTQeCe65G8IASeY++bNpXDyU0BaI=;
 b=HArM7HWLAsaOfjtY6gGv+U6AwfkmkE4l+umE28VrCw8g8Vq5r7xh+Q02yVD+QrC7xC
 DTnY4tORYD5Dq414zOQXHsp8QB4pakNnJsnLC+qBpoSHP/XbX4ghl7zWGrEcgdqhE78l
 tus6rs3DOAtWhoo1cj3KWIp3BgTKl9UgBlAmn6ie0MIAnyzFVnblUTeV1i06VtTsysm0
 JBamkuaTY7aMrBFlA5X0WcWdFg17qlZKGyNPDx3wKaUgW4Jg71SEnCi/GY9yKPjhF07T
 gBBThPkdOn4Y98JnBIqjvtJyBIq/WvyYdBhXnADsVcXGpwNt9g6G/FUnf9Wi8t15YNZm
 a77Q==
X-Gm-Message-State: AOJu0YxXHSzguy4ysgEyCXFy20joQNMl02P3sfMhZb4TYWR79MvCF6r1
 lN9+YJEcFSXIwhcRKUu1zy/dMkScBHiw3DyyLL5t2MNaKddmfnx682C0FEmHLmzC3Ntmj2N8HHV
 YZiW3gu+TuGVOtFfnsui9x1KDVt0=
X-Google-Smtp-Source: AGHT+IHZzsUJb+X/1SRiHsZxjcp8GphpXB7juokaQr1xHTkTa0/CX9uDQm+sFRpdXWKF/6b8s8qSfjvWuuxrH2AC3HY=
X-Received: by 2002:a2e:9d06:0:b0:2ec:5469:9d57 with SMTP id
 38308e7fff4ca-2eeb318275cmr108695541fa.41.1720992680928; Sun, 14 Jul 2024
 14:31:20 -0700 (PDT)
MIME-Version: 1.0
References: <18310e20-826f-45ab-b69e-dbfe47a1f83f@web.de>
In-Reply-To: <18310e20-826f-45ab-b69e-dbfe47a1f83f@web.de>
Date: Sun, 14 Jul 2024 16:31:09 -0500
Message-ID: <CAH2r5mvbk6OrX59dybJvS=ANdzzidsj=rDzRUFrBrjff-upSkg@mail.gmail.com>
Subject: Re: [PATCH] cifs: Use seq_putc() in two functions
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
 Steve French <sfrench@samba.org>, Bharath SM <bharathsm@microsoft.com>,
 Tom Talpey <tom@talpey.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

are there other examples of modules where similar changes have been made?

On Sun, Jul 14, 2024 at 3:35=E2=80=AFAM Markus Elfring <Markus.Elfring@web.=
de> wrote:
>
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Sun, 14 Jul 2024 10:23:49 +0200
>
> Single characters should be put into a sequence.
> Thus use the corresponding function =E2=80=9Cseq_putc=E2=80=9D.
>
> This issue was transformed by using the Coccinelle software.
>
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  fs/smb/client/cifs_swn.c | 2 +-
>  fs/smb/client/cifsfs.c   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/fs/smb/client/cifs_swn.c b/fs/smb/client/cifs_swn.c
> index 7233c6a7e6d7..68998c6ba7a2 100644
> --- a/fs/smb/client/cifs_swn.c
> +++ b/fs/smb/client/cifs_swn.c
> @@ -655,7 +655,7 @@ void cifs_swn_dump(struct seq_file *m)
>                 seq_printf(m, "%s", swnreg->ip_notify ? "(y)" : "(n)");
>         }
>         mutex_unlock(&cifs_swnreg_idr_mutex);
> -       seq_puts(m, "\n");
> +       seq_putc(m, '\n');
>  }
>
>  void cifs_swn_check(void)
> diff --git a/fs/smb/client/cifsfs.c b/fs/smb/client/cifsfs.c
> index 6397fdefd876..ce5cb72bb81f 100644
> --- a/fs/smb/client/cifsfs.c
> +++ b/fs/smb/client/cifsfs.c
> @@ -491,7 +491,7 @@ cifs_show_security(struct seq_file *s, struct cifs_se=
s *ses)
>         }
>
>         if (ses->sign)
> -               seq_puts(s, "i");
> +               seq_putc(s, 'i');
>
>         if (ses->sectype =3D=3D Kerberos)
>                 seq_printf(s, ",cruid=3D%u",
> --
> 2.45.2
>
>


--=20
Thanks,

Steve

