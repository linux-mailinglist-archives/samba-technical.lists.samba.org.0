Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 70FD49D06F3
	for <lists+samba-technical@lfdr.de>; Mon, 18 Nov 2024 00:09:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=MNN7ziIzHnkd18GYio7H3EiJ5Cg8s0kx1zTc8dpUr6c=; b=gZpa4Lvn0Kl1wEBceaDRLiBeG9
	r8Z+KkFi9C30W3V9JiYKS0AQWgvgOwmZnlOEKEM1gv3HICM+DzarHjQZQo2FynAQiiWpabmcyqQMh
	6m+fIivKfmdwMqRTRV+ZuluoyXPYh7g8r/uNL3MAabXIE83Jlpe8cY728pmO320nKRmRfXkJPk8TT
	lAdnwtHwH4izlRVM9EKQ9CEaSTR+5m3PyVJstrqVyafvdIsY538ZCZPOSgyxUFIRBsmngM6P9eZuv
	+14rLESxkDh4C5fX0AEo6tGFO8ESoRGHU258dQVqh+TuKfX917BfRThBF4Pb7FDTZ5nISkxGi1Isd
	8unVw7mg==;
Received: from ip6-localhost ([::1]:54672 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1tCoNc-0008KG-Fv; Sun, 17 Nov 2024 23:08:32 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b]:56783) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1tCoNX-0008K9-Iw
 for samba-technical@lists.samba.org; Sun, 17 Nov 2024 23:08:29 +0000
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-53d9ff92b14so3678662e87.1
 for <samba-technical@lists.samba.org>; Sun, 17 Nov 2024 15:08:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1731884906; x=1732489706; darn=lists.samba.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MNN7ziIzHnkd18GYio7H3EiJ5Cg8s0kx1zTc8dpUr6c=;
 b=Hi16y+mk+769utnx6ckbZv9zbWIiRdd1qiW4bUVQrZuJQA/3pWHsskJkngwy0b6Fh4
 EMbRhfS/MDJ5/Ut4YVEJW7DsiYvAy8b4Naz0z+Bfs2fB72nQ9yskTLwNyXJBU/yxPrBh
 JBjPFBDQPpTfj3jhGujG4wbukEiGfa9WKn5jYPVcDQswcGDbS/ZW3JfD0gCilpIxzFVc
 Mos8Xoy4SmQ+538N1Z2XZn39sbGwTo8cyRzWGWb35C+iBey1hRpWSSItEryJPBs2RRex
 oSV8d1YJhW9bqtPq3LCr6YtoKDesw5o1CeLvrDBz6zYSe9fI/QuVwne8VBQepIsVTden
 Uwkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731884906; x=1732489706;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MNN7ziIzHnkd18GYio7H3EiJ5Cg8s0kx1zTc8dpUr6c=;
 b=wVe/2/N6KUqzoXSl0uUjSETSJSdWXQspoRwsEFNdZJY6L/XDV1pNEtRdxZXoupRPUf
 /x1v5odpKT6v99K9xj2at2mwN6UkkejJmyjTk5uKVk3gpNIVIl+/VM4Gqyr9rHCqiuoH
 xvElnQqHmDFrvXmimtxo2Ytd05O2ryMpFsjLGKqdyLpypyio47TAsLnUnWUVSOkddBVv
 tHdJmfydqlZX65Kyu6rqDSadiV+54UDVp56BHFt4ZJXw3osM2gQg4Z1GMKEYGcd87pfA
 J33TM6yJjuESGXHvatSNf8mdVHB3uGfclwqhKdeRXaoGhlp6QVE5J61WhrLAKcdZDt3M
 2iGw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWpxOmLCs2DnrsSD3u9U5d+GaI6RNh6vwBzLoE2pQAMovu+qFJ28HR+RYRXd4kEmU5+dL2zxz79h47YefMbIPc=@lists.samba.org
X-Gm-Message-State: AOJu0Yxe1/g1PoOVFEQdphiC6onxLCws2KTr2oJuanCxS7e5X4v/wrV1
 aVmNXr6Otnn0b8hJKSk+Odj726zEDVtf5qAyiE4t+Yx64qavLJ4d5OiyGQ4iYQdu6RSASMQVeIk
 jVPDAomPPIIQpqnhHMIzAlEZyZr0=
X-Google-Smtp-Source: AGHT+IG/Q4t9zlJxo0SzEiq1OWyQAiH8D9mhKsLHtjK5w2rEQERHHK17Ean2SepEZ7MUtCVHaZhXmMnoKX3qNPyE0Gk=
X-Received: by 2002:a05:6512:b83:b0:539:f9b9:e6d2 with SMTP id
 2adb3069b0e04-53dab3b126amr4424699e87.35.1731884905418; Sun, 17 Nov 2024
 15:08:25 -0800 (PST)
MIME-Version: 1.0
References: <20241117113204.work.419-kees@kernel.org>
 <bcd4fb0f-47ee-4676-8e71-6b06973e9b65@embeddedor.com>
In-Reply-To: <bcd4fb0f-47ee-4676-8e71-6b06973e9b65@embeddedor.com>
Date: Sun, 17 Nov 2024 17:08:14 -0600
Message-ID: <CAH2r5msDZjC_iktAhCn6jxhUVQZ2sXrD8KpbCs-woDriZNDmXw@mail.gmail.com>
Subject: Re: [PATCH] smb: client: memcpy() with surrounding object base address
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
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
 Kees Cook <kees@kernel.org>, samba-technical@lists.samba.org,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, linux-kernel@vger.kernel.org,
 Steve French <sfrench@samba.org>, Bharath SM <bharathsm@microsoft.com>,
 linux-hardening@vger.kernel.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

merged into cifs-2.6.git for-next

On Sun, Nov 17, 2024 at 1:15=E2=80=AFPM Gustavo A. R. Silva
<gustavo@embeddedor.com> wrote:
>
>
>
> On 17/11/24 05:32, Kees Cook wrote:
> > Like commit f1f047bd7ce0 ("smb: client: Fix -Wstringop-overflow issues"=
),
> > adjust the memcpy() destination address to be based off the surrounding
> > object rather than based off the 4-byte "Protocol" member. This avoids =
a
> > build-time warning when compiling under CONFIG_FORTIFY_SOURCE with GCC =
15:
> >
> > In function 'fortify_memcpy_chk',
> >      inlined from 'CIFSSMBSetPathInfo' at ../fs/smb/client/cifssmb.c:53=
58:2:
> > ../include/linux/fortify-string.h:571:25: error: call to '__write_overf=
low_field' declared with attribute warning: detected write beyond size of f=
ield (1st parameter); maybe use struct_group()? [-Werror=3Dattribute-warnin=
g]
> >    571 |                         __write_overflow_field(p_size_field, s=
ize);
> >        |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
> >
> > Signed-off-by: Kees Cook <kees@kernel.org>
>
> Reviewed-by: Gustavo A. R. Silva <gustavoars@kernel.org>
>
> Thanks!
> -Gustavo
>
> > ---
> > Cc: Steve French <sfrench@samba.org>
> > Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>
> > Cc: Paulo Alcantara <pc@manguebit.com>
> > Cc: Ronnie Sahlberg <ronniesahlberg@gmail.com>
> > Cc: Shyam Prasad N <sprasad@microsoft.com>
> > Cc: Tom Talpey <tom@talpey.com>
> > Cc: Bharath SM <bharathsm@microsoft.com>
> > Cc: linux-cifs@vger.kernel.org
> > Cc: samba-technical@lists.samba.org
> > ---
> >   fs/smb/client/cifssmb.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/fs/smb/client/cifssmb.c b/fs/smb/client/cifssmb.c
> > index b96ca9be5352..026d6b5f23a9 100644
> > --- a/fs/smb/client/cifssmb.c
> > +++ b/fs/smb/client/cifssmb.c
> > @@ -5337,7 +5337,7 @@ CIFSSMBSetPathInfo(const unsigned int xid, struct=
 cifs_tcon *tcon,
> >       param_offset =3D offsetof(struct smb_com_transaction2_spi_req,
> >                               InformationLevel) - 4;
> >       offset =3D param_offset + params;
> > -     data_offset =3D (char *) (&pSMB->hdr.Protocol) + offset;
> > +     data_offset =3D (char *)pSMB + offsetof(typeof(*pSMB), hdr.Protoc=
ol) + offset;
> >       pSMB->ParameterOffset =3D cpu_to_le16(param_offset);
> >       pSMB->DataOffset =3D cpu_to_le16(offset);
> >       pSMB->SetupCount =3D 1;
>
>


--=20
Thanks,

Steve

