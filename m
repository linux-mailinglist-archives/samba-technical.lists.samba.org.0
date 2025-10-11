Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F891BCFC99
	for <lists+samba-technical@lfdr.de>; Sat, 11 Oct 2025 22:03:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=xkr5Es7W1sfU77GvysO3I+d49t0a9ilRQJudJAibtUM=; b=bDq/qant/9I//rgbg0r81F8NOQ
	aOFNuWt0ZElWGp/jq3RF2kh7I/AuvYSyKk/TlLB2dIwIhqN5rnl0ZqqVM4sfKPm5r1fFLq6laHrBN
	3uDR5AztBP1KM/o0fHzR+dzzJ11mlU9uaWm9jL7mrd3EnyhH9v2+iTTBtWBaA0O2WnlPYNOpF7ufW
	RzzUK61+cA2LydDWrhz49wJJLtOJa7Hg3KFe09FLtFQn7Msp4tJjlnurdXaiq9CgHb6TN+mqJZ4us
	mSQbAkyk18khrDYdXfNJDfS2vWUBY4mywKVqZlQaldXKp5DZJ8V7k5bIJsUsXslqL0vaRZJ8N/5ZB
	CMWBxWvQ==;
Received: from ip6-localhost ([::1]:45450 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1v7fnt-007ZUf-Sw; Sat, 11 Oct 2025 20:02:57 +0000
Received: from mail-qk1-x72b.google.com ([2607:f8b0:4864:20::72b]:46540) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1v7fno-007ZUY-BC
 for samba-technical@lists.samba.org; Sat, 11 Oct 2025 20:02:55 +0000
Received: by mail-qk1-x72b.google.com with SMTP id
 af79cd13be357-86420079b01so386150985a.1
 for <samba-technical@lists.samba.org>; Sat, 11 Oct 2025 13:02:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760212970; x=1760817770; darn=lists.samba.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xkr5Es7W1sfU77GvysO3I+d49t0a9ilRQJudJAibtUM=;
 b=hUncOw5lHcxW7ryJvNcEVpx3cD8zBd/kfdauAorteN24FQtthOP9X/mGstRT1iZnyG
 juKT2l+bU/XncUH7yzuLoqpitHF7YJ8gjYH0Rw/hmScGE+K/Ksjk87qWt/8Y0OjC3poz
 z95yRFL1I3i7PlIwEbagZodvZiyobpSfp9QXAjSkPWHtT5vHVrV3OTONijxfuv09xbB5
 p3j2C2bfR6enjTtnwwRbRVTi1wstBTgee8JDMKiFISdsBZiHyEtKSURbISA39Ztt9Nlk
 NJ1/4E+8pHUd9lHqL3sdmgtZD1wPds3hNzkU/06BcMIf+A/fvGeUiMkT2BLX5WPb1F4y
 9AMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760212970; x=1760817770;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xkr5Es7W1sfU77GvysO3I+d49t0a9ilRQJudJAibtUM=;
 b=whCdSV7t137yMjzd9QqdVgp52FJbkF26MZtAboZOBpmvVBb9zdDJFcOFeWm7TZMiYF
 J891i5nA9GlYBn7f8ttLwYasv1Oi4bEyukB8U+YAmJIy9AFKyfvLdUNU48ztY2GgrqW8
 hf+Oj8Ae1015OmPXI9YQeNoW63u88/kVPmUVA7QtXL8+nM2DnpEDKW8SYLqJ/zwke5IC
 zLPHB8xfHWY8IlBZ4igXY7DPeEH5GlghFmlAUn/ft3XDzThXGWGfUcnXe65S3bt8POV9
 VMr4eqS/kL9fQvzhxTufkzUcH+pgkBAfp3FDHMF2aorP/YmzNRcAxmOL8diTe5jNZ5tV
 Zr6g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXxik6+/P+LExR0HzR7zApAJH7U2q/npsRmlmUSQICdFnOflJw72/a3cxGJk01guaMUUMOuXUPtRTcvi8x073w=@lists.samba.org
X-Gm-Message-State: AOJu0YxtemJ0PdkDiexmKjSPRTp+7A/+wOCfzBdnPSopYVkqCFAQXVfC
 0TZCZZEMJ54+4ha1WP+TM01weJRQlp7lKzj2XnuzoxgxtXryj1KMAGWRNpj0NtP/lFc2dJUl2Q8
 d4H+GrlR+hNUacghOrdZzd8oI5DbfDMI=
X-Gm-Gg: ASbGncuEB8XAXMZnvfzTZyXgmtn5o8hmO255QCEoxvFHe7haXrqsFXej9KeibpRPrGY
 hf3FXZlI9OR+lNXdpCKo+LaCVV1IMNYSEc8WQGFZyaAKa7nx3d5EbmTgDDzdJhPBa5q8GufuRUS
 FsQh/JlvvrhWgMFYrtnA6gqeTvkMjYLuJP3gJpIBP3DPEuo+JWPKImR49bMRpYeyhHeeFJCFyDr
 4y2OKu4tIZWXa1o89UYNtTt34d0Mkd4ZLsCKzQR8kyCIty7ba8TPz1RHdxOWgZNPagOO1SECJcc
 c0gPMwSOxPNQBKV6+cyiiNuvL7aME0XxFqo5BpL70aYbOIVFyV+pyUyPTGIHUSpVYd/qyL20Kp0
 j6dAx2ybM027/3brUjLHJUZYAYsM7d+er7JQFdPnPnqJobaqx2jU=
X-Google-Smtp-Source: AGHT+IG9ZCiwfq5KyR/1TeCl3i0cP2OQ4leD6REdC5/3Qk1b9iGVKiA0Gxr/3psvpoZZ40crdSe1lNPJ/iiBnZaSH1U=
X-Received: by 2002:ac8:7e96:0:b0:4e0:a9d6:d554 with SMTP id
 d75a77b69052e-4e6ead5427emr236273121cf.38.1760212970368; Sat, 11 Oct 2025
 13:02:50 -0700 (PDT)
MIME-Version: 1.0
References: <10e2a3a5-e109-44b5-ba3c-3e8c40d76361@web.de>
In-Reply-To: <10e2a3a5-e109-44b5-ba3c-3e8c40d76361@web.de>
Date: Sat, 11 Oct 2025 15:02:38 -0500
X-Gm-Features: AS18NWDvFK4gyGSPs9eyGmSKOV3bV8TQqhZdaEEWV_hSRnuKNvbTBU9D0yth8t4
Message-ID: <CAH2r5muxz0q6E+8NQiAxDRgWRfbwjsRN9fnoQXjyV_u9WXFh-w@mail.gmail.com>
Subject: Re: [PATCH] smb: client: Omit one redundant variable assignment in
 cifs_xattr_set()
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
 Tom Talpey <tom@talpey.com>, Boris Protopopov <bprotopopov@hotmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

merged into cifs-2.6.git for-next

On Fri, Oct 10, 2025 at 7:56=E2=80=AFAM Markus Elfring <Markus.Elfring@web.=
de> wrote:
>
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Fri, 10 Oct 2025 14:48:13 +0200
>
> The local variable =E2=80=9Crc=E2=80=9D is assigned a value in an if bran=
ch without
> using it before it is reassigned there.
> Thus delete this assignment statement.
>
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  fs/smb/client/xattr.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/fs/smb/client/xattr.c b/fs/smb/client/xattr.c
> index b88fa04f5792..029910d56c22 100644
> --- a/fs/smb/client/xattr.c
> +++ b/fs/smb/client/xattr.c
> @@ -178,7 +178,6 @@ static int cifs_xattr_set(const struct xattr_handler =
*handler,
>                         memcpy(pacl, value, size);
>                         if (pTcon->ses->server->ops->set_acl) {
>                                 int aclflags =3D 0;
> -                               rc =3D 0;
>
>                                 switch (handler->flags) {
>                                 case XATTR_CIFS_NTSD_FULL:
> --
> 2.51.0
>
>


--=20
Thanks,

Steve

