Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 8497CC31FD4
	for <lists+samba-technical@lfdr.de>; Tue, 04 Nov 2025 17:12:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=Gn2hwuUiPC8/Q2G266HcOJ5nNM1p+pgOQFA8M+yNExQ=; b=M8ZlV83RDWtCtCqRpTMAq9GGj6
	ZLy7b1apIKAi7RsFRHHa+wQ52VhObL9gNmFflieOxqUY87Z3kBCxFXT2W+RFjwFH1aGqAPLxWg2ZU
	0Zg65IGTiIhIfjtzNU9VXje2slkca6TgGVz4amYzWemAtDePIasfkOi9Q3ZyTM4hywun0XNW1qYG7
	dRZQz9waxAHNXec0vA/J1W8W2sdV2YYj8WiY6OAg9yb2K62+C7QAEvtbhLFi6Y3fyv8KizrzdKlf/
	AzDWpE+tt/IKF1d960Qu8ENI6c9kBEtXcvjAHr9tA5D7zbkRESexUmtI3ukpl9wtjws/2u4vU9r0Q
	ANWjcKMA==;
Received: from ip6-localhost ([::1]:25118 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vGJe3-00BUN2-Mi; Tue, 04 Nov 2025 16:12:31 +0000
Received: from mail-qv1-xf2f.google.com ([2607:f8b0:4864:20::f2f]:53405) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vGJdz-00BUMv-55
 for samba-technical@lists.samba.org; Tue, 04 Nov 2025 16:12:30 +0000
Received: by mail-qv1-xf2f.google.com with SMTP id
 6a1803df08f44-88025eb208bso49471696d6.2
 for <samba-technical@lists.samba.org>; Tue, 04 Nov 2025 08:12:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762272745; x=1762877545; darn=lists.samba.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Gn2hwuUiPC8/Q2G266HcOJ5nNM1p+pgOQFA8M+yNExQ=;
 b=mPjHjHvXVHCT6YAymssYFRr4i1rG4tv+ppG1RHRMmtGBoKDCbDC+CZKEvgDu3+bzxO
 hbaimnNONmSl3KuJtjqrSorqX2uEAMjB/a4yLbeuEj5Hgqcgx+i/Ynlfsnd9v+B5SLyl
 BnJChUMP/daZlcs3ISeokCme95J8qrfK67KlrvjnF4e8VeElpTaLXF/NZXIIPLbpMuXj
 Kng0lgz0XOV7IZZUjTKqHe7qWjfpiAMZ06ikoUN0lOo8aGX0a2Xb+ALM1P9lM6oLm+k6
 Ynk4d5KhYRsxULLO9dSTwyX9eunpk503E0M4gkd9sOJjmO7sNUi+VOUfbHeuQLY1TZsf
 O/VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762272745; x=1762877545;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Gn2hwuUiPC8/Q2G266HcOJ5nNM1p+pgOQFA8M+yNExQ=;
 b=X5+m4pgoB+ajGiW/dhrOCO+4QemCybDJAZSd6vr6h/vayM/UXwQRMjq5uZ2tSp6m+Q
 GSMoWkfxCbsF+XKZvE6qhsNLXZPkG+6ak54wcRVwzOr5ybygVZ2wVKs6vedVeY+e9CKp
 J0tXvaVEUcn/Ev+UOW/x6q/pCdIiMsLuYkrlpPIKfIzhgkmn8Az8ccgxHWeXpE+++2oG
 ugv13leKQrBdw7wxm/HPyDf+bx01ASwQIYu0kQjZ0Mz0nqUm12dVaBAlcTWJU1VCg6b4
 hQtv2riYUeKynGJFz0GBCfibPj/YbzeSHh9Cvf93FYKAIQmLi++DTBBaz3pFtDC6Plr2
 cHkQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWoi3k3rzzlVUuIv5cZpB4PQfLtsNUT+iEy2suqlkPw0593NR2sGPGTGdJi2l8iiy64y4mVee90DAFsUqqFO+I=@lists.samba.org
X-Gm-Message-State: AOJu0YyRxDfUSY722wTtOne04JXnETHB8VPRgP2Y4P7xu/tHxhftcOr6
 SdkRPX09WicmNxQje2ceG52Ojm84v16Z9uu4a3eNqhHNBMlvWnfX5XXfnzY34y1hP22g3hbumFt
 ot61K/xLpGVCziGEhVTFcyovW/Pt9GZw=
X-Gm-Gg: ASbGncvhnXzoIFFlzJXHEju9XLEj2ZV346OqvL2SACPTGaai8GDkpdGoGUiu9JFc4t7
 hR3hnPBfSfqF5TRFmOyZv4EnKZ45Ti5+aPrKJuaHEclQDVcwRH2OUoj11cJ35rQBkxQxSq/jRB8
 BPPhmNVGZ+gxI7Uoikqp+EVnJwGe/6TWzMvzUy9+QBIFpv0Df6EneC+pouwWW3F9k7U+tWYH4Nd
 iJ5vrb9EJIDZQLhktoX9H5M878QhlyjBafJVvfJCAhD3QYSKijcMP9pa/q5C+SiJWYOM7BM9uE1
 5YvD7zV6f7N/nLYckC2+h3RH8FAuzHT+PRMT1qbpnCK+ySpxSflgDB7xWIz+tUzoK4DAhSChQtK
 Uum43340muAzVh8E+c6S6P1GNwHkzdXv3oShLdKw=
X-Google-Smtp-Source: AGHT+IED+GjqaBe66KWozlF5qlUX46+UXTDSGyStL4Ec1xFghQ8tKmJeoeUM3fbVkK6cckiH8C39lCagfXCl3ojuYgM=
X-Received: by 2002:a05:6214:d63:b0:880:5365:46f3 with SMTP id
 6a1803df08f44-88071190af1mr1980246d6.48.1762272745039; Tue, 04 Nov 2025
 08:12:25 -0800 (PST)
MIME-Version: 1.0
References: <aQoYCxKqMHwH4sOK@osx.local>
In-Reply-To: <aQoYCxKqMHwH4sOK@osx.local>
Date: Tue, 4 Nov 2025 10:12:13 -0600
X-Gm-Features: AWmQ_bnENIVd9iuIwtt-CFvdgGVQlHaSwLipDA4bB04baKUxG5zWSRWEKYEzUVY
Message-ID: <CAH2r5mu7s4p88RhUbCm5mqUvEVM60OOTTJOZ+rz09nFfc+t3mQ@mail.gmail.com>
Subject: Re: [PATCH] smb: client: fix refcount leak in smb2_set_path_attr
To: Shuhao Fu <sfual@cse.ust.hk>
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
Cc: Tom Talpey <tom@talpey.com>, Shyam Prasad N <sprasad@microsoft.com>,
 Paulo Alcantara <pc@manguebit.org>, linux-cifs@vger.kernel.org,
 samba-technical@lists.samba.org, linux-kernel@vger.kernel.org,
 Steve French <sfrench@samba.org>, Bharath SM <bharathsm@microsoft.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

There are multiple callers - are there callers that don't call
"set_writeable_path()" ?    And so could cause the reverse refcount
issue?

On Tue, Nov 4, 2025 at 9:21=E2=80=AFAM Shuhao Fu <sfual@cse.ust.hk> wrote:
>
> Fix refcount leak in `smb2_set_path_attr` when path conversion fails.
>
> Function `cifs_get_writable_path` returns `cfile` with its reference
> counter `cfile->count` increased on success. Function `smb2_compound_op`
> would decrease the reference counter for `cfile`, as stated in its
> comment. By calling `smb2_rename_path`, the reference counter of `cfile`
> would leak if `cifs_convert_path_to_utf16` fails in `smb2_set_path_attr`.
>
> Fixes: 8de9e86c67ba ("cifs: create a helper to find a writeable handle by=
 path name")
> Signed-off-by: Shuhao Fu <sfual@cse.ust.hk>
> ---
>  fs/smb/client/smb2inode.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/fs/smb/client/smb2inode.c b/fs/smb/client/smb2inode.c
> index 09e3fc81d..69cb81fa0 100644
> --- a/fs/smb/client/smb2inode.c
> +++ b/fs/smb/client/smb2inode.c
> @@ -1294,6 +1294,8 @@ static int smb2_set_path_attr(const unsigned int xi=
d, struct cifs_tcon *tcon,
>         smb2_to_name =3D cifs_convert_path_to_utf16(to_name, cifs_sb);
>         if (smb2_to_name =3D=3D NULL) {
>                 rc =3D -ENOMEM;
> +               if (cfile)
> +                       cifsFileInfo_put(cfile);
>                 goto smb2_rename_path;
>         }
>         in_iov.iov_base =3D smb2_to_name;
> --
> 2.39.5 (Apple Git-154)
>
>


--=20
Thanks,

Steve

