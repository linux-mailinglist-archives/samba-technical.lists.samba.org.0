Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BE2078F15C
	for <lists+samba-technical@lfdr.de>; Thu, 31 Aug 2023 18:34:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=J0BtXys4/gGIKOU4Oz0pI/EUVAia0V8cimF9aONkalE=; b=mltqJfRCeAVyH/ILpNuJGkpymW
	gWVgl3/6ioGQpYOYQfCO1xgxPCqMIp8GJuE+BhD4q/7u/lP40XILCwW7mzsAFOuxNJWzInpyTI4Qd
	yHA4DZeTNcLdXU3oAdtqCPez4T/TvhnZhHFtzVo1Yt9+4+dFAi2v3JPMn5BkuFhhUF6GGKBrNfdJg
	R6deY7qZgZuX5x1t/hqGi/0H3yT3in28TeUMRI1+ghJ3zPYnhKqJY8k+7v63iSKBfyMdg3HAPCGJd
	oB21aPAEV/iJg4uAYKhgxLEJBJ/0aBc+zSbbIWR5loSM+o5Iz30hyCaP/4aVE9Dg0YVDJsNgAUwOP
	Ks52D/iA==;
Received: from ip6-localhost ([::1]:26832 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1qbkcV-00FjSZ-MX; Thu, 31 Aug 2023 16:34:12 +0000
Received: from mail-qv1-xf36.google.com ([2607:f8b0:4864:20::f36]:57746) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1qbkcO-00FjLD-EL
 for samba-technical@lists.samba.org; Thu, 31 Aug 2023 16:34:08 +0000
Received: by mail-qv1-xf36.google.com with SMTP id
 6a1803df08f44-64f387094ddso5742786d6.3
 for <samba-technical@lists.samba.org>; Thu, 31 Aug 2023 09:34:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693499642; x=1694104442; darn=lists.samba.org;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=J0BtXys4/gGIKOU4Oz0pI/EUVAia0V8cimF9aONkalE=;
 b=A17fxwr9eQ9gDeB+Lc5KBnUhp0c8qJK1VXURhu3F7VkLI8b2g31lOnvKGJ3923vUWc
 VnoAAqMtVbKcxfn9PwqaUHDwXj0X7BUnGWh3Iwx4HqvHIQPQ4tbMqOzUcemcE96VTmTR
 xa08/Ygt2K8x4YTsuLeixp9IexCs1+MoZ67r4AN6zx77BAmjqKse8pidZAasgYEzoJdh
 rxDsm5+yzNkKLa5Qo7XUDb1/7ziI6KMZskfUKmohXict8SclnmlPG5qiw3aZGvsVqabB
 2F8Ti4HD8reOaRtnqvW5HR7DIdkAALA3zlA26iHx7riwfYq8FPDvxpDEqYlkhNwJbQwp
 qujg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693499642; x=1694104442;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=J0BtXys4/gGIKOU4Oz0pI/EUVAia0V8cimF9aONkalE=;
 b=Y+IlHdJI02W2XueseSN8N0gwHF73h/F9z3nlmXKWGF/di/INKl3tTNZVxys9CDcwNK
 REQ+ckRlT/yZFFGenMagABRStH46Zcbbtf6cMJQJ3S1Zko4OhnbrLHBqoyRu+CZT0yfB
 7wNSo8Y8eOiczGU5Y9Mk66YGPd+5PKR4Z1ufYYu+2ULda0exlUsZY3INaOauBmekNtqu
 tLCQKSNk0PMyaAn1squ7jaPno43of/xTyYC9FaQLGjBBsk4airVin9O8LbJn+cT90UHA
 S5bVWta+OnMNleF32bvI3DXvfQYV7kyhZGQZozY5OoEhgyjIRQ02qBP82skLAmunqivF
 0Exg==
X-Gm-Message-State: AOJu0Yx7r0++AqEbhzJ3N9cOEWSgZwT1RwT+kby95n2BYGKywlCY+Xaq
 859YSRjgOpCuudRxeABk51rVPnvkopQoqQlntW08mKSCPx8=
X-Google-Smtp-Source: AGHT+IEPySxDr8VCze95XDxIcthrwuEkqzbsKyz1tIVJgLHRAJgl4x8UgxhFfNdbzaQ/k3bQ66tePfc1ZfQ1RNuhXLU=
X-Received: by 2002:a05:6214:4119:b0:64a:af89:c002 with SMTP id
 kc25-20020a056214411900b0064aaf89c002mr3756608qvb.44.1693499642363; Thu, 31
 Aug 2023 09:34:02 -0700 (PDT)
MIME-Version: 1.0
References: <CACyXjPwWBuAu0PkYz=5XrDH1R087QsSWFt-izTqdiu4YEPaW0w@mail.gmail.com>
 <CACyXjPxk4O9uTeqSrpCG5m1uXNnzD4ydpqz5xuSh0hVsAe_qcA@mail.gmail.com>
In-Reply-To: <CACyXjPxk4O9uTeqSrpCG5m1uXNnzD4ydpqz5xuSh0hVsAe_qcA@mail.gmail.com>
Date: Thu, 31 Aug 2023 09:30:46 -0700
Message-ID: <CACyXjPxAXXUExuDSDSG2J1UoQeC6fdwyfFyk_3vLRVYTUer2pw@mail.gmail.com>
Subject: Re: I used --enable-developer and all I got was this lousy build
 failure ...
To: samba-technical <samba-technical@lists.samba.org>
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
From: Richard Sharpe via samba-technical <samba-technical@lists.samba.org>
Reply-To: Richard Sharpe <realrichardsharpe@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thu, Aug 31, 2023 at 7:59=E2=80=AFAM Richard Sharpe
<realrichardsharpe@gmail.com> wrote:
>
> On Thu, Aug 31, 2023 at 6:15=E2=80=AFAM Richard Sharpe
> <realrichardsharpe@gmail.com> wrote:
> >
> > Hi folks,
> >
> > I user --enable-developer on configure and then built and got this:
> >
> > --------------------
> > ../../third_party/heimdal/lib/hcrypto/rsa-ltm.c: In function
> > =E2=80=98ltm_rsa_public_decrypt=E2=80=99:
> > ../../third_party/heimdal/lib/hcrypto/rsa-ltm.c:261:9: error: =E2=80=98=
size=E2=80=99
> > may be used uninitialized in this function
> > [-Werror=3Dmaybe-uninitialized]
> >      size--; p++;
> >      ~~~~^~
> > ../../third_party/heimdal/lib/hcrypto/rsa-ltm.c:262:20: error: =E2=80=
=98p=E2=80=99 may
> > be used uninitialized in this function [-Werror=3Dmaybe-uninitialized]
> >      while (size && *p =3D=3D 0xff) {
> >                     ^~
> > cc1: all warnings being treated as errors
> >
> > ../../third_party/heimdal/lib/hcrypto/bn.c: In function =E2=80=98hc_BN_=
is_bit_set=E2=80=99:
> > ../../third_party/heimdal/lib/hcrypto/bn.c:238:24: warning: cast
> > discards =E2=80=98const=E2=80=99 qualifier from pointer target type [-W=
cast-qual]
> >      heim_integer *hi =3D (heim_integer *)bn;
> >                         ^
> > ../../third_party/heimdal/lib/hcrypto/bn.c: In function =E2=80=98hc_BN_=
get_word=E2=80=99:
> > ../../third_party/heimdal/lib/hcrypto/bn.c:309:24: warning: cast
> > discards =E2=80=98const=E2=80=99 qualifier from pointer target type [-W=
cast-qual]
> >      heim_integer *hi =3D (heim_integer *)bn;
> > -----------------
> >
> > How do I fix this?
>
> Well, I solved this by just using --address-sanitizer and not using
> --developer, but now I get this:
>
> --------------------
> =3D=3D22284=3D=3DYou are trying to dlopen a /usr/lib64/ldb/modules/ldb/as=
q.so
> shared library with RTLD_DEEPBIND flag which is incompatibe with
> sanitizer runtime (see https://github.com/google/sanitizers/issues/611
> for details). If you want to run /usr/lib64/ldb/modules/ldb/asq.so
> library under sanitizers please remove RTLD_DEEPBIND from dlopen
> flags.
> --------------------
>
> Can I safely remove RTLD_DEEPBIND?

OK, there is an environment variable to set to fix this.

I added it to /etc/sysconfig/samba:

LDB_MODULES_DISABLE_DEEPBIND=3D"false"

And now I get lots of ASAN reports ...

--=20
Regards,
Richard Sharpe
(=E4=BD=95=E4=BB=A5=E8=A7=A3=E6=86=82=EF=BC=9F=E5=94=AF=E6=9C=89=E6=9D=9C=
=E5=BA=B7=E3=80=82--=E6=9B=B9=E6=93=8D)(=E4=BC=A0=E8=AF=B4=E6=9D=9C=E5=BA=
=B7=E6=98=AF=E9=85=92=E7=9A=84=E5=8F=91=E6=98=8E=E8=80=85)

