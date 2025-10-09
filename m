Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 08180BC6FAF
	for <lists+samba-technical@lfdr.de>; Thu, 09 Oct 2025 02:13:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=iLOs0m+C5vy8eU1JuQcMkicCaJKpraCdPB1zIalrqqQ=; b=mdIUosR1+X7+lFDEcGymFFJanT
	WK19oksiq6D+Kz+v867cCN9t18d+zBHZpzRneD/DR6t4F6O4N+MawbBtSTPRD7L2d6hDM/ZQqAtPT
	EGb0Wy8LYz29TRl1GiaKRVzqJSQ+uiHdLN1IPkg4pqRhWMY+5TxebwXioRma6eWRJRZfU5pudLjz2
	yjupnBiF+6BGAtW7eVVMIcHpaEzJmshmZXrhG6UBE8jABOXKLg5u2f3hWPGk0InTck4/3Lu3NwDnm
	nL4wA6l4rMte3ZrOLXDuIoDrq9nAPcEmXZmD3AQmES2TAKeT4LlgXuHgtuSjmtlRNhb/xhXujFgtd
	5b2ciFsA==;
Received: from ip6-localhost ([::1]:41366 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1v6eGz-007Kn2-6p; Thu, 09 Oct 2025 00:12:45 +0000
Received: from mail-qt1-x82b.google.com ([2607:f8b0:4864:20::82b]:53468) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1v6eGs-007Kmv-1f
 for samba-technical@lists.samba.org; Thu, 09 Oct 2025 00:12:41 +0000
Received: by mail-qt1-x82b.google.com with SMTP id
 d75a77b69052e-4d9bcc2368eso3403491cf.2
 for <samba-technical@lists.samba.org>; Wed, 08 Oct 2025 17:12:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759968756; x=1760573556; darn=lists.samba.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iLOs0m+C5vy8eU1JuQcMkicCaJKpraCdPB1zIalrqqQ=;
 b=eMFHW5CZM+FMPGo62P7Olooct3E9koFJpojtxrp6tQTR4hiu0iJGwdSsElqz+/CDzn
 0+/k/uA6eth3ZCSiS23gIH0ROoVaPxF6ZKvbgvFa4JhZgesLpMBeYBCdwiHeQrplW01U
 UrNOfTejNz210EKAa2qv4Od+t2xm93IpHNUB6F8CrpaTwL7MBj+90gye5n3FD+FRKgUd
 UIp7lfTV5V47fzhOD3oNTncx+06rEtygBaZi/+CSQgKXS65imdulHJ5eLvp0o07LJznc
 WelbO7gmtYDrrW/Pn2f2WyljEedtziNxTdsKSHwWhHcPCzOMpgBLU1D4Czqlewfeo/uN
 XzMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759968756; x=1760573556;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iLOs0m+C5vy8eU1JuQcMkicCaJKpraCdPB1zIalrqqQ=;
 b=aXc5LCk5sAZ5ppvdYtctYYFPtaEYRI6N6HhKAofNg5pXhbX3SprKvY+LmlH67XDsYS
 ZqEw6qP1S2aGZ0N/o3l3MRDbKD0pq/1S/0+RGSd/FuLnXrQDjM9wiN1YkUPNTRKGQpk5
 WHH91YhIF0AgAIl3lb6QqpXKnmC7rxcX4GPPh62YX26wi4qH8LmKBP5w0CWlqDL4lLl5
 m1XQ6OJ4gW+7gWnat5/+6VzHOlUsCGoOwZAJbwE8g7h8tUF7wMi6uKNRrMo2E09YVhta
 5kBFGn4qmU14CeZYfHhSJq3YLXfh1BTXtEeOlCBcEklJ2ca/d8szKu+S+K+6qyVUv11K
 UAHw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWvT5Y5PSDsB2JpdAsnTEzolcCV7Mg9qKPIBTGfMmt8xDMct5NtfIAPfvOdT66zq1xjCw2gQ3RYoS9xKad2RbY=@lists.samba.org
X-Gm-Message-State: AOJu0Yxpkm510fRiVYW/QetWJ1hf7Sf/NLu/uQImO61BZnbFAbCkmCpD
 27qEblMSb+Ai4uvN7khzGBU813J2z4IVUibSiPMogAyNA95YHHxRnGw8TFUvSz1Shc/fImeZFsz
 2ZOkssFAbn4SEHd3PC1sp4e89t6oTHzQ=
X-Gm-Gg: ASbGncvootj4JkAUf/1uSaoeEXEqzShO8gtRZQU9U77br9eO5QJAF5BEbTSNATDedeH
 9R/wCLrttNa9oUZDX8D8DAA2ZecCNZLZvjs+NWS8ah1gFt0uPyKPFklI7HuRykw7jBDOk07PxWf
 rugN/m4DyXvE7+k3sDws1wqO9/nSd5vXlS5pWgcdwgaKbzBk2V1P9ACXCIUKH3hxWsBCa3CcTCY
 2I+ojFqqmBCxh3cs11aaOctro6DnI2BWkm3ZnkS+Pq5e2/XjWoanFEamLUMoCmq22LtiSW46cdD
 zNiHAx/gKgwEu8lps4ahjwNRB/sbhfKJOX061fHRRyNHUyAyBE/ifBtHrpWAMsnjVtplV8oiIkn
 u3T+ktn4LL9Hvj+M+yYzKZxoQ2gNyn4t28IzA4M0zNMVhbg==
X-Google-Smtp-Source: AGHT+IGTMJxEUzyjJOaL0+NNwHEI9UfsX87q17OQxRmhejzUvwBxmkwB9k17auDXhJE1cMaLG7jkj1CnKy1ELrzjvrA=
X-Received: by 2002:a05:622a:6a42:b0:4e6:ee71:ee96 with SMTP id
 d75a77b69052e-4e6ee71f26cmr35134331cf.25.1759968756008; Wed, 08 Oct 2025
 17:12:36 -0700 (PDT)
MIME-Version: 1.0
References: <5b95806a-e72e-4d05-9db8-104be645e6e5@web.de>
In-Reply-To: <5b95806a-e72e-4d05-9db8-104be645e6e5@web.de>
Date: Wed, 8 Oct 2025 19:12:24 -0500
X-Gm-Features: AS18NWBDO6yK69iSBzCC-3F6icpJXqhtpmdffwn6wWQE7dyQKytMaHCk49ryAxs
Message-ID: <CAH2r5mtrT7m71i2928akVarmQ0FTKzaEOu2q4781U8a-_w__ZA@mail.gmail.com>
Subject: Re: [PATCH] smb: client: Simplify a return statement in
 get_smb2_acl_by_path()
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
Cc: linux-cifs@vger.kernel.org, Shyam Prasad N <sprasad@microsoft.com>,
 Paulo Alcantara <pc@manguebit.org>, kernel-janitors@vger.kernel.org,
 samba-technical@lists.samba.org, LKML <linux-kernel@vger.kernel.org>,
 Steve French <sfrench@samba.org>, Bharath SM <bharathsm@microsoft.com>,
 Tom Talpey <tom@talpey.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

merged into cifs-2.6.git for-next

On Wed, Oct 8, 2025 at 3:02=E2=80=AFPM Markus Elfring <Markus.Elfring@web.d=
e> wrote:
>
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Wed, 8 Oct 2025 21:56:34 +0200
>
> Return an error pointer without referencing another local variable
> in an if branch of this function implementation.
>
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  fs/smb/client/smb2ops.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/fs/smb/client/smb2ops.c b/fs/smb/client/smb2ops.c
> index 7c3e96260fd4..bb5eda032aa4 100644
> --- a/fs/smb/client/smb2ops.c
> +++ b/fs/smb/client/smb2ops.c
> @@ -3216,9 +3216,8 @@ get_smb2_acl_by_path(struct cifs_sb_info *cifs_sb,
>
>         utf16_path =3D cifs_convert_path_to_utf16(path, cifs_sb);
>         if (!utf16_path) {
> -               rc =3D -ENOMEM;
>                 free_xid(xid);
> -               return ERR_PTR(rc);
> +               return ERR_PTR(-ENOMEM);
>         }
>
>         oparms =3D (struct cifs_open_parms) {
> --
> 2.51.0
>
>


--=20
Thanks,

Steve

