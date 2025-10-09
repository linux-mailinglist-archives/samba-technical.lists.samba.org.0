Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 781EABC9D60
	for <lists+samba-technical@lfdr.de>; Thu, 09 Oct 2025 17:43:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=uNVjPOkZQ4/5TQpLx5EDj6qV7WJ4xTniFhtjleJ40Ko=; b=vBbWEG9PG/WxW5qLprkSSTWXYN
	Mz9TiT23xr7ipLgbQuqe+r3WUrBOUwtj2/8T5CqnB9abvjiJ/2oO2LcmAAAPmHJFhdS6DC7X+lh//
	IpBFQR1xMVtjQa+bIoeRe58S8TbisrkiOgiV5amHfZ2I4FAPX0Bd0KUa0nBQaO/LqUsgXrW9g93q5
	GVXz9P54umup42M/7EfQHPxB98kaBiDu8K4BRKyBLEIt34S/888HLxW0RDkrDUaEKZJVX1tYlSjDk
	TgaDG5WYgoDFXZMMFsrsttzWUT7cu6K7XG6Sku/RGjJLOgXBpVlLxsjToGSWtOJNYURDFa7S22PAO
	P/h1ZmTg==;
Received: from ip6-localhost ([::1]:56336 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1v6sng-007RKt-Sa; Thu, 09 Oct 2025 15:43:28 +0000
Received: from mail-qv1-xf2a.google.com ([2607:f8b0:4864:20::f2a]:49589) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1v6snb-007RKm-8V
 for samba-technical@lists.samba.org; Thu, 09 Oct 2025 15:43:26 +0000
Received: by mail-qv1-xf2a.google.com with SMTP id
 6a1803df08f44-799572d92b0so10885936d6.3
 for <samba-technical@lists.samba.org>; Thu, 09 Oct 2025 08:43:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760024601; x=1760629401; darn=lists.samba.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uNVjPOkZQ4/5TQpLx5EDj6qV7WJ4xTniFhtjleJ40Ko=;
 b=ZYM7EQQzACdxuw3X3VM10hrN2+htWvWOud/514DnUeSIkThKpByYtXotsDobJNkbf+
 +YjPoZbRcXi5cjPM6F8zyCvpNLkK9ZWhoJ3fMpj8SnrgyDasskl8UYHt/WcuebaBCtp4
 Ss9Okl49bKCuGugx9MomZS8bZzZfXLX2KOnsummgDSFgeJP78fDq7FU/+nmolzK4/w7v
 Wqf3Nz2Sp2FUU8VXrTc26tNBIJNMB/N5fhcpy/MZIuhnKau1JpQQPHFYXJnh09tg32t3
 3WeXIFUY8lS0v9+Cka82GpcX2s0mLcleBDOVh109lFg+sHA6oO4uKwwzf+JyQbWcZcZF
 OxOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760024601; x=1760629401;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uNVjPOkZQ4/5TQpLx5EDj6qV7WJ4xTniFhtjleJ40Ko=;
 b=Ze+nYRMKtXOwxWBfUWmeZL1q7Jmd6bzGLd97MyEOyNKakfGm37ccglSuqhlI+WgN6m
 PbhWiTOcY1SkcTSJEtZcfVOSUKxb6JcZgplheZ7xZZNNLOX0jGyA7qW48a+2lkla9h/H
 zzW4ntSDoOjgyd/5jRDFUkOxG1cXOIZhnl1GtY6MO7uHdmykrOgtY+BmKiL9lmPaxcK7
 61ENTrf1LX2k49wEnD8EqSESasIzM4jyxmGlXSDXCy8G7FaaafnudB6SjeOcN3+afaev
 UElC6wA+FKIy/TPr2AVl+4Tk0wV4Vujc+XI+ImuRV8pe5tM1c4xMG4pnzNtfrfJfBMt6
 0chw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUm6MthaBu/qf/kabkYJsgU6Dk7boJTxqNTP6XM1WfWFX/l82rjCw0sJYmjqnZiTG36HsdO7xBpUzT9Kf2c498=@lists.samba.org
X-Gm-Message-State: AOJu0YyS6IMV6bD6rKDaG3SXO3Uyd5AXHqLn2AlA2bXkGVlLggwr/4YJ
 I+HHAxkRZOjoeWIyp3B65spjb16HQ2S0fbejXWZ7fK5ExLUyY4m3io2esPBFVBdFq46d0BFJVnf
 usNxTCwUE4Ts0+uA9nz3NNP/wOLS9ZOk=
X-Gm-Gg: ASbGncukcwCtQp/UVEsNfNmiCaBvZF/3wGFixmrzfp/OkYuF/+wpj3rFLuzFeL2Awmd
 mWwAFnTo961piSf//C1mCUVLHjhqWMHRHTMDbQkQXpRLrLLWt9+h3h3EoGKX5FLRCumo7ErAKB2
 8pOrb8MgThqgSn4M/9Rbwl65FtDIw6kijGURDCNZwfGZ6DksKEPp5NcMdexYhB0RJ4P7UaVEx/w
 OwLYFVdFAAd15uVk9sMQGjVV13o3Vht8j3E8s2vh0DCf1ihGvhYpLUNGRl+2PHA3QMFPcWN7jov
 G7QF1fCEzoMLKOypQQE40+KgXA9+rd9xCfO0M4DU1A0jQXfJzwi8YbgUC9lZpneQxUZ+xUZhPMF
 lus7IJBKpN+cWIox0d5ABZx1Z4h1FBLSA6UkOQLKP7Q4LxGTec8NZMMMw
X-Google-Smtp-Source: AGHT+IEYrpzc6SMoRQfsWO3qThn+WGHDuSzBgj5HClu2LTLami2LK2vOG7hA85WdSkdDUqm3JQ980vltGEZBu587cu8=
X-Received: by 2002:ad4:5c83:0:b0:79e:88e2:1e60 with SMTP id
 6a1803df08f44-87b2108abedmr105123276d6.29.1760024601139; Thu, 09 Oct 2025
 08:43:21 -0700 (PDT)
MIME-Version: 1.0
References: <7a5c4b6d-f15e-4071-8a82-dca6b71b6b4b@web.de>
In-Reply-To: <7a5c4b6d-f15e-4071-8a82-dca6b71b6b4b@web.de>
Date: Thu, 9 Oct 2025 10:43:09 -0500
X-Gm-Features: AS18NWBOW4IMP5XCqIx3vf6oRH0bz8isK0u_b-ctyASqmWxzGVwLMu3pjongCW0
Message-ID: <CAH2r5ms+S+G-wjB1MPTp1G6MyVLf+yzq6r+_Yg9PLb6HmDCtYw@mail.gmail.com>
Subject: Re: [PATCH] smb: client: Omit an if branch in smb2_find_smb_tcon()
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
 Paulo Alcantara <pc@manguebit.org>, Enzo Matsumiya <ematsumiya@suse.de>,
 kernel-janitors@vger.kernel.org, samba-technical@lists.samba.org,
 LKML <linux-kernel@vger.kernel.org>, Steve French <sfrench@samba.org>,
 Bharath SM <bharathsm@microsoft.com>, Tom Talpey <tom@talpey.com>,
 Pavel Shilovsky <pshilov@microsoft.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

merged into cifs-2.6.git for-next

On Thu, Oct 9, 2025 at 10:12=E2=80=AFAM Markus Elfring <Markus.Elfring@web.=
de> wrote:
>
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Thu, 9 Oct 2025 17:00:13 +0200
>
> Statements from an if branch and the end of this function implementation
> were equivalent.
> Thus delete duplicate source code.
>
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  fs/smb/client/smb2transport.c | 5 -----
>  1 file changed, 5 deletions(-)
>
> diff --git a/fs/smb/client/smb2transport.c b/fs/smb/client/smb2transport.=
c
> index bc0e92eb2b64..33f33013b392 100644
> --- a/fs/smb/client/smb2transport.c
> +++ b/fs/smb/client/smb2transport.c
> @@ -240,11 +240,6 @@ smb2_find_smb_tcon(struct TCP_Server_Info *server, _=
_u64 ses_id, __u32  tid)
>                 return NULL;
>         }
>         tcon =3D smb2_find_smb_sess_tcon_unlocked(ses, tid);
> -       if (!tcon) {
> -               spin_unlock(&cifs_tcp_ses_lock);
> -               cifs_put_smb_ses(ses);
> -               return NULL;
> -       }
>         spin_unlock(&cifs_tcp_ses_lock);
>         /* tcon already has a ref to ses, so we don't need ses anymore */
>         cifs_put_smb_ses(ses);
> --
> 2.51.0
>
>


--=20
Thanks,

Steve

