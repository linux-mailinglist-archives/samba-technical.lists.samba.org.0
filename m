Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 3151E78EFE8
	for <lists+samba-technical@lfdr.de>; Thu, 31 Aug 2023 17:03:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=lnyb8N6q2eVDENybHNG9YWrciXpeQ1UoDqpye/cpjhc=; b=QIPpS7BknEWAObbrl7Epl2oHZv
	n3i5iijEvq5Yjvb4xYIoWLXLMRzeykoKPQ6odU9n4JUvD+kiT3eMAFixtL54BZ1yEXGevIqQZo63S
	A1HpC/ONhcCexKWFx/tRnFLspYYNAgcL1qOCDeWDO2DnjZokQIdo8QlrSsd4hrzwvJeYUzw7UCPmo
	hNhmOYhKxbWFeZNmCvnmsY2ruXJ+1iNHVYT+zUXOkR3ushkY9Z17y4gsHvAuwOnoHg+goeYfgawKT
	Gywnkxm1jac0VI/44Igvfc5qVCqy4+rW/N6PJeJKioBjMf42XhvtmvrD7CUSQgj4QayPfrFo7sR6k
	pKA4UVYg==;
Received: from ip6-localhost ([::1]:60844 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1qbjBq-00Fhji-MG; Thu, 31 Aug 2023 15:02:34 +0000
Received: from mail-qk1-x733.google.com ([2607:f8b0:4864:20::733]:52696) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1qbjBj-00FhjZ-GD
 for samba-technical@lists.samba.org; Thu, 31 Aug 2023 15:02:31 +0000
Received: by mail-qk1-x733.google.com with SMTP id
 af79cd13be357-76da0ed3b7aso55018985a.1
 for <samba-technical@lists.samba.org>; Thu, 31 Aug 2023 08:02:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693494145; x=1694098945; darn=lists.samba.org;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lnyb8N6q2eVDENybHNG9YWrciXpeQ1UoDqpye/cpjhc=;
 b=p3fT0QXHdXdWXtI6SeasTK9GwfSMEjlYkcDHg3BQvzPwy995WQogcQLGRbNk0AKOAs
 rZ+r2TSoxarKw3SfefoVakph9pK4ymZhDMGlmgF80jsBmhddZdqOJTWysFso/Ekfp8Av
 bOv7oYEDMAgeMq5Li9pweZF7tc2z5lS0zWw97RzvO+D0N1wSjl0BWyLJxojOEDO1EJqZ
 19+yD4i+VjUGpIFcSNHuftURbT9Q07fFjE8xQ4qipSSKepVNGjDyrAlRIZfoc8C7ma6Y
 ATigPJv+lrIliZikj2yOQ0nNKjxopQ304664aNn3w+w7336Qb3su38XSHURcKazIG0tu
 OfHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693494145; x=1694098945;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lnyb8N6q2eVDENybHNG9YWrciXpeQ1UoDqpye/cpjhc=;
 b=evVfVcUmtUmL9vQOsWQGKkAdgWukMU2sT/Orjou3e+EAjqFtxytgi4MiX8bVhErW5i
 q8gPZENMyjX2QmICarYQl2PgYAQFFjHCGj8e/WBdP2qZLbvu9MbBDs5L6REsw5ACMTcH
 agFv+7oHq+CEVrZLFlzf66qFXU+C/3DezlhyWUxgBOzFAUn4oVjBz6Xk5oI4kH2lMtdq
 HgoPH1Zdue2WMRKrHBAav7BhtlFfF7m3ZFIIhdDShwTMEfoeFisQidvsAiyu135zpK9v
 mn8YoE/5lw4wNDUp4q3S7tZyfcwoSweIqiHx1nSXkqryL7LIwwYO9oiU1KzFPpfCMV0H
 IOjw==
X-Gm-Message-State: AOJu0Yyzf/JTjeioVbzHG4tAERwS7L3zOjh7U7uf9FhD2FK94t+BvQ9w
 cCVqGa2T/OoKAnVtPkkqdiEO6Ofz1Y2HyCpjoApx0QfzQyE=
X-Google-Smtp-Source: AGHT+IHSuivCbCE/zY4Xz35K4TkS8tdP9YRCQw4/kHzgXXYI6SakUaaO9IA/vuqDMWEU3t6Yqc1bvFUsi2cLyUYagpY=
X-Received: by 2002:a0c:cc07:0:b0:649:8baa:2986 with SMTP id
 r7-20020a0ccc07000000b006498baa2986mr3106018qvk.2.1693494145255; Thu, 31 Aug
 2023 08:02:25 -0700 (PDT)
MIME-Version: 1.0
References: <CACyXjPwWBuAu0PkYz=5XrDH1R087QsSWFt-izTqdiu4YEPaW0w@mail.gmail.com>
In-Reply-To: <CACyXjPwWBuAu0PkYz=5XrDH1R087QsSWFt-izTqdiu4YEPaW0w@mail.gmail.com>
Date: Thu, 31 Aug 2023 07:59:09 -0700
Message-ID: <CACyXjPxk4O9uTeqSrpCG5m1uXNnzD4ydpqz5xuSh0hVsAe_qcA@mail.gmail.com>
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

On Thu, Aug 31, 2023 at 6:15=E2=80=AFAM Richard Sharpe
<realrichardsharpe@gmail.com> wrote:
>
> Hi folks,
>
> I user --enable-developer on configure and then built and got this:
>
> --------------------
> ../../third_party/heimdal/lib/hcrypto/rsa-ltm.c: In function
> =E2=80=98ltm_rsa_public_decrypt=E2=80=99:
> ../../third_party/heimdal/lib/hcrypto/rsa-ltm.c:261:9: error: =E2=80=98si=
ze=E2=80=99
> may be used uninitialized in this function
> [-Werror=3Dmaybe-uninitialized]
>      size--; p++;
>      ~~~~^~
> ../../third_party/heimdal/lib/hcrypto/rsa-ltm.c:262:20: error: =E2=80=98p=
=E2=80=99 may
> be used uninitialized in this function [-Werror=3Dmaybe-uninitialized]
>      while (size && *p =3D=3D 0xff) {
>                     ^~
> cc1: all warnings being treated as errors
>
> ../../third_party/heimdal/lib/hcrypto/bn.c: In function =E2=80=98hc_BN_is=
_bit_set=E2=80=99:
> ../../third_party/heimdal/lib/hcrypto/bn.c:238:24: warning: cast
> discards =E2=80=98const=E2=80=99 qualifier from pointer target type [-Wca=
st-qual]
>      heim_integer *hi =3D (heim_integer *)bn;
>                         ^
> ../../third_party/heimdal/lib/hcrypto/bn.c: In function =E2=80=98hc_BN_ge=
t_word=E2=80=99:
> ../../third_party/heimdal/lib/hcrypto/bn.c:309:24: warning: cast
> discards =E2=80=98const=E2=80=99 qualifier from pointer target type [-Wca=
st-qual]
>      heim_integer *hi =3D (heim_integer *)bn;
> -----------------
>
> How do I fix this?

Well, I solved this by just using --address-sanitizer and not using
--developer, but now I get this:

--------------------
=3D=3D22284=3D=3DYou are trying to dlopen a /usr/lib64/ldb/modules/ldb/asq.=
so
shared library with RTLD_DEEPBIND flag which is incompatibe with
sanitizer runtime (see https://github.com/google/sanitizers/issues/611
for details). If you want to run /usr/lib64/ldb/modules/ldb/asq.so
library under sanitizers please remove RTLD_DEEPBIND from dlopen
flags.
--------------------

Can I safely remove RTLD_DEEPBIND?


--=20
Regards,
Richard Sharpe
(=E4=BD=95=E4=BB=A5=E8=A7=A3=E6=86=82=EF=BC=9F=E5=94=AF=E6=9C=89=E6=9D=9C=
=E5=BA=B7=E3=80=82--=E6=9B=B9=E6=93=8D)(=E4=BC=A0=E8=AF=B4=E6=9D=9C=E5=BA=
=B7=E6=98=AF=E9=85=92=E7=9A=84=E5=8F=91=E6=98=8E=E8=80=85)

