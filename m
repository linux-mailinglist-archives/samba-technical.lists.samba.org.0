Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 05F08C6B78B
	for <lists+samba-technical@lfdr.de>; Tue, 18 Nov 2025 20:41:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=yXHAzdSmOXVhWRC4vIo+f32gZc/kqOvBMxigKYi0DEQ=; b=hEBOO/cH5uO68KmjYiV6t8q9H3
	TZ4v9hw1jm0JpZ92t089wLeA9GmpqJvT/mCbXo59SqCyfEIVDl+R7WMAfXVqhpnBBTpHcHPo2XkEh
	7/7g7NqtRnSKtV8ZlN2vMWa03OlKPJqPQaJNh4+cs+N0pGaQ+3ieWFkesLdGnkffuPU309XWLTiN/
	K05NnSq3boGpcAihAcdHKZPj4Q5zg/4vUCFsfmWMWclR7BXvkIY56d0TKimbCwbSVarz9Z7A8geN/
	U477J+bnNOelyiW5Zk44GpPGOrzJ6R8VVdRoIhH31xlaVM/n+vY3kyf3RJDeOwPOHK081grCkqkZ+
	SjyJcrqQ==;
Received: from ip6-localhost ([::1]:26048 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vLRZ1-00CZjO-5j; Tue, 18 Nov 2025 19:40:31 +0000
Received: from mail-qt1-x82d.google.com ([2607:f8b0:4864:20::82d]:44461) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vLRYv-00CZjH-5r
 for samba-technical@lists.samba.org; Tue, 18 Nov 2025 19:40:29 +0000
Received: by mail-qt1-x82d.google.com with SMTP id
 d75a77b69052e-4ed9c19248bso54740681cf.1
 for <samba-technical@lists.samba.org>; Tue, 18 Nov 2025 11:40:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763494823; x=1764099623; darn=lists.samba.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=uP/MfyD100ahkyh30CXitCbaIs2OTGjmWpxzNyNanb4=;
 b=WdeTvf3ec+dnR5YqsvGqrXsJ5I4yvp3NxARJWew27zbgc+rEkmYsp9Pey3rRUlWNza
 vkzDKN/sBVpVdxpSQ5bRUs+d3j6jqnfAfSREYFUw6MilNzSzi2n3O+u3Lyj9NPQJihys
 f6il84+4GgG9ujFgGeJxsk3IK8poySyYwJrEEi8CD5x6ecKNUZ+qyg8t9xchQBHB8hkQ
 LIF93J3AVX1KWJt66DDMj76Z/yDF/GR4BE23OxXxHOC3lvXzeX17UoweyoWbE1KzchDF
 w1nywZ95Jt11Y+Dy1LyWpCHctfCqkgOjW55XkWSFi179O5sQ1jTwzyU6KHqEMCEBnoU2
 QMBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763494823; x=1764099623;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uP/MfyD100ahkyh30CXitCbaIs2OTGjmWpxzNyNanb4=;
 b=DUN8WMaSyIenWk1CG0CK6RpAa7BLliKAPOwr1UoDmp5ezQlldlCCEDMwBjIDSzqzS3
 eOz+VKVCVDR0bxx6cSMJJYhoT4xOLZq/tG8JJ/HagAxPOakKM5uSnu1WMpD5jfbYF6+P
 t2gh7ukN7N0Hqj70UKGHtO26hzMpudD1Xx7etkA2RW0dQtO2jzdQWVm++vuFG28K4w7X
 GBYcARigoS6c8OtP0ksBT+o/uBV8O3ABIRejDxDMGM1rgMG324jUm9pOA8ZlBzJtxN2e
 9YM4feM+U/DO+L2C1yriELCBMOGDCbuYreCrT9gaMS0r8Ov7iwd5iVFHedex6Si+GQCT
 5H0w==
X-Forwarded-Encrypted: i=1;
 AJvYcCU0KTQa7v+Ca8ugo6HrAKTBl08+RdW2nTLyWcZqR3zzW2HUt8Mt2gKbragRkAAdhHauueFhPgKyB+a168yd9ZU=@lists.samba.org
X-Gm-Message-State: AOJu0YxHuCxZeAMdPBujSfFeUsXa+3mspOtIj7PUhOMPEbj1mvz7yt7f
 Udfgpheyg89iQeQWYtwTGmqMP594E6pn6JS20/IKFYop9TowmEbqv47V82nb+lF+Wcv//QALKg3
 LjDZq/+6R2nbw4RaWwP+VZj/SWnImi/A=
X-Gm-Gg: ASbGnctunNVNXyPDFdTcMiNQjxkeAEjYCVJx3XA1xAzBCF1mvjx73R2gzTh+royCa78
 WGwYclHMZGwFjHlPG33vUl09NF2E8t7yCnQItfJTeM592n+XSDQJPi/jECwEsiAaCn2dE4QGa6G
 aX8zK8lR7e+v3SqdQXm/XjkI3hTz7jhYE1G5cgKLXAOujHdwE/ISj60eV5a6YHPJmbhT1DoagI9
 8aKiUmH2NGS2ujc2vrhZr1Aj3aTk9WsSfIGS9QpYPKjnrQ5B8rg3QciNQ7P6d4jNMNDu54nbKl2
 FEvwX2ljjIi406sLwUdWvhvAEQJYjRHByFKWw5lF+O1TIixhjF4v0EFo59pme42hfMAGxgCvEmZ
 B4I+NScy612P7R3QkzAvR2RYso5kYusAanLgz+/3JAT2XUo8mM+hUeyP7zMLFQKdUJAnqLGNWqI
 NMvS3Mne8c
X-Google-Smtp-Source: AGHT+IF9Olz+04owc6pA8oO+QE5x1fnGLbX4xa6FSf47x+OoJFeDokGwKKYgz/a+gUZK0PGJkDwK5Dsn008Ktrgw/pA=
X-Received: by 2002:ac8:5743:0:b0:4ee:24fc:be81 with SMTP id
 d75a77b69052e-4ee24fcc1cfmr90001221cf.36.1763494823106; Tue, 18 Nov 2025
 11:40:23 -0800 (PST)
MIME-Version: 1.0
References: <20251118150257.35455-1-ssranevjti@gmail.com>
In-Reply-To: <20251118150257.35455-1-ssranevjti@gmail.com>
Date: Tue, 18 Nov 2025 13:40:11 -0600
X-Gm-Features: AWmQ_bmB0MUuEWhAyOCDZ6bkCOmp1_rKuoSNZ_3xejkxgZLXrAdMbDAoLRFov7s
Message-ID: <CAH2r5mtBUFXmYtU7itC+NKX5Qu9k=cjiRLfU00RFuy6RKS-yJA@mail.gmail.com>
Subject: Re: [PATCH] cifs: fix memory leak in smb3_fs_context_parse_param
 error path
To: ssrane_b23@ee.vjti.ac.in
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
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
Cc: tom@talpey.com, sprasad@microsoft.com, pc@manguebit.org,
 linux-cifs@vger.kernel.org,
 syzbot+87be6809ed9bf6d718e3@syzkaller.appspotmail.com,
 samba-technical@lists.samba.org, linux-kernel@vger.kernel.org,
 sfrench@samba.org, bharathsm@microsoft.com, khalid@kernel.org,
 skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev,
 david.hunter.linux@gmail.com
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

merged into cifs-2.6.git for-next pending additional review

On Tue, Nov 18, 2025 at 9:08=E2=80=AFAM <ssrane_b23@ee.vjti.ac.in> wrote:

> From: Shaurya Rane <ssrane_b23@ee.vjti.ac.in>
>
> Add proper cleanup of ctx->source and fc->source to the
> cifs_parse_mount_err error handler. This ensures that memory allocated
> for the source strings is correctly freed on all error paths, matching
> the cleanup already performed in the success path by
> smb3_cleanup_fs_context_contents().
> Pointers are also set to NULL after freeing to prevent potential
> double-free issues.
>
> This change fixes a memory leak originally detected by syzbot. The
> leak occurred when processing Opt_source mount options if an error
> happened after ctx->source and fc->source were successfully
> allocated but before the function completed.
>
> The specific leak sequence was:
> 1. ctx->source =3D smb3_fs_context_fullpath(ctx, '/') allocates memory
> 2. fc->source =3D kstrdup(ctx->source, GFP_KERNEL) allocates more memory
> 3. A subsequent error jumps to cifs_parse_mount_err
> 4. The old error handler freed passwords but not the source strings,
> causing the memory to leak.
>
> This issue was not addressed by commit e8c73eb7db0a ("cifs: client:
> fix memory leak in smb3_fs_context_parse_param"), which only fixed
> leaks from repeated fsconfig() calls but not this error path.
>
> Reported-by: syzbot+87be6809ed9bf6d718e3@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=3D87be6809ed9bf6d718e3
> Fixes: 24e0a1eff9e2 ("cifs: switch to new mount api")
> Signed-off-by: Shaurya Rane <ssrane_b23@ee.vjti.ac.in>
> ---
>  fs/smb/client/fs_context.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/fs/smb/client/fs_context.c b/fs/smb/client/fs_context.c
> index 0f894d09157b..975f1fa153fd 100644
> --- a/fs/smb/client/fs_context.c
> +++ b/fs/smb/client/fs_context.c
> @@ -1834,6 +1834,12 @@ static int smb3_fs_context_parse_param(struct
> fs_context *fc,
>         ctx->password =3D NULL;
>         kfree_sensitive(ctx->password2);
>         ctx->password2 =3D NULL;
> +       kfree(ctx->source);
> +       ctx->source =3D NULL;
> +       if (fc) {
> +               kfree(fc->source);
> +               fc->source =3D NULL;
> +       }
>         return -EINVAL;
>  }
>
> --
> 2.34.1
>
>
>

--=20
Thanks,

Steve
