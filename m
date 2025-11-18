Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 89FBBC6B839
	for <lists+samba-technical@lfdr.de>; Tue, 18 Nov 2025 21:01:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=SB7FwqNIKbZ7R+GS+j9DGZBpb2NO6ssSsIVjR5I+uyA=; b=GEW2qbUvfsaCH+jImGIkkFeAP9
	IwUcfB9RtyBA7TAXY1v6C74FugPkSFkLv4KTieR9+NXslbZBIwdr7BQ6KLzFE0EUPAXmAFLsFblRv
	RYh3exe9WRKyISVZa4/a4BwIiwgrZgWQcPFjTiOcWDpUFNmHrYRLd6s9R3q0kZuIjixgsb5jB54rF
	ooJsilBZQD4e0KGHLwwkEoZrVweLcoRTN8dviRe/IwmgKSve+8Z+Eim0OCU5ksVy0Ac8JPG3G99Om
	IKtSviQIcBEaeCxDKpqWSt7L8N/OLQNU4O35NdWOCnPNz+riLrmvLNqnBIMii7DZff6E+KzF88Ytt
	7fqVoNOg==;
Received: from ip6-localhost ([::1]:54390 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vLRsv-00CZqG-Lm; Tue, 18 Nov 2025 20:01:05 +0000
Received: from mail-qv1-xf2f.google.com ([2607:f8b0:4864:20::f2f]:44487) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vLRsq-00CZq9-Im
 for samba-technical@lists.samba.org; Tue, 18 Nov 2025 20:01:04 +0000
Received: by mail-qv1-xf2f.google.com with SMTP id
 6a1803df08f44-88242fc32c9so65007216d6.1
 for <samba-technical@lists.samba.org>; Tue, 18 Nov 2025 12:01:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763496059; x=1764100859; darn=lists.samba.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SB7FwqNIKbZ7R+GS+j9DGZBpb2NO6ssSsIVjR5I+uyA=;
 b=EDQxy3I28WDbL/KZOVRMrDZJCjkJnBKOZ1HrmuIWI2jjcvBw9SfH/4KYs0eKQczlPM
 DGf3sa6xCQelrGeF7Ogn+JWSyWeHhfCaukAwpkKk+LrzJDUSr8xIPwHQTW3BgWx1c2EA
 pUaql13N0MYMXDhl/2NF3u5FI7FAyJCU0ItgfMO+WeWKOsfSRRCJlIkA3pgkw55TBJ90
 2oQI/a+NG6WC12YTHqcic0sA3LjK9DrMJTaedNoncycy27EIDufc5co8/73tSivPJkDW
 DqcOM9FrUntGpbIXE43vrmWcMNtj2FzG3m5Fd9YlKLKe/uTgWMRPk1Uy31TsBekcBlNE
 D7YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763496059; x=1764100859;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=SB7FwqNIKbZ7R+GS+j9DGZBpb2NO6ssSsIVjR5I+uyA=;
 b=HSR6KCI1bvkAaAYLklKEbWOBtyRewuKs8CrrGybFg4JLgwgPb5yKIJX7SKVzLIwZ62
 mYsXsQCNWHdG/qsrizccoEBbQkOGZzVyJL1lhaOBXGAUPpV5aXx0WKVUF/4Q6Y0NPPOU
 K6ZSk74yl8b+yNndaQ8jBbbI6vK3HueCtDdtmR+chTHUJrSyHaMoje3bET+fgL2KxXVp
 mdkt1E6w7eFJkWGA9ZSahotoCYjHOhoKJWsm3WZFGMkrVdH2IstMQLKkWsbjePVCK98n
 O6NcYOTFYQ+juJ4nGvSHVV4axDnQVNM6uIUfYZnNEdEddAVVzKZZbK/oTZEx8HG3jdDT
 ZPWw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWaRWyTbl2X7LRvWLHhgZjIRHzZDMRLWDcfdetT00Pnj73PLaIwY8IDmHAv9iFnze5RXiTJOOjCys44C2LrQe8=@lists.samba.org
X-Gm-Message-State: AOJu0YwJxjt7jH6IMzwwy2eiAun5kWXSVrcqbDmaYh44JSZjU6eM0Qv8
 5rRzKt3nDESBBW98/rWhrtJIH1eu4b2azkCjh+lMhZBYPgB1APR0ZsFRvXuPX15mwHmlOAOgBNO
 Y3HHreNh2xq3y4H90sawDMYIwhGuYrWc=
X-Gm-Gg: ASbGnctbfvcLmVIRGGmC9UApPzg9qRwWXMoIL6xAH4EOL7HT0OjigHvYskyrL9QcMqo
 y7wCpIWSJmEj/ojVUa+jmMKpn/Q9vf+XdDdy81zeDjXO/1ZpMX22U1F0pwPL6zPssSs0CAJYvRY
 nk2iR4bNaD1S168G8oognhDeB+m6CWw4uGyuhHhwBabrtrSDzZEvM3ltC99UPMPN8uFSLzPmnKf
 QJ0jMFT1XCyRpZn273g3TKppS7yaEYjPaXi4UstbBAlyNlhTbIyeVNCxZhF2jw1VYiWS4PFSske
 QrF91+PLz/yCST5chX2ZaiGUvO9jjq8AfREImpf2ULeZqJI6Ees0EnBnfCi8NsDa9n6MtWXLyPs
 DlP/hWfglRFb0COE7c5dODBaRzimIKspBnvlF1eddWWXn1nMITSb9kQzuw++OJIiIYk/OtP6/Kd
 9epVrf4CEpxoGIpJgV4Io=
X-Google-Smtp-Source: AGHT+IHhfzBJAEcCphFwzomj2W7zGvOCPeFDhl/lHKkpj3xi16n9G+ByWNLrLHv/3vIAjtNEDflU7OTWv23wgwwm1Ys=
X-Received: by 2002:a05:6214:cae:b0:882:4901:e960 with SMTP id
 6a1803df08f44-8829262506emr211040446d6.29.1763496058322; Tue, 18 Nov 2025
 12:00:58 -0800 (PST)
MIME-Version: 1.0
References: <20251118150257.35455-1-ssranevjti@gmail.com>
In-Reply-To: <20251118150257.35455-1-ssranevjti@gmail.com>
Date: Tue, 18 Nov 2025 14:00:46 -0600
X-Gm-Features: AWmQ_bk518tBwIwq4km9t_okTCnI85hG63NOZgFy5r88Hbvu-haY_fDOfVuyttk
Message-ID: <CAH2r5mu72dDwVfnK1ffAELCa1iWa5b5XXwTY1+7CTsFvTnN7Bw@mail.gmail.com>
Subject: Re: [PATCH] cifs: fix memory leak in smb3_fs_context_parse_param
 error path
To: ssrane_b23@ee.vjti.ac.in
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
>
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
> @@ -1834,6 +1834,12 @@ static int smb3_fs_context_parse_param(struct fs_c=
ontext *fc,
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


--=20
Thanks,

Steve

