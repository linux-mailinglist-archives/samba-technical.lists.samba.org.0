Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 9465EA7CBAF
	for <lists+samba-technical@lfdr.de>; Sat,  5 Apr 2025 21:31:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=xRpBIr+xXXz1/CtUOcT+2D0W3fA7zof4ndEWcpK/IEE=; b=d26WhBp7XSVDDtPU7B70o9e5Iy
	T9S3kOK1X5/8L7QKeSQfIzzTcxHpcytvDIjxG7ylMtHnL24+e+huNSGc3VFldvl2jvMlOT5DIYcCq
	idiSATIp6Bfm4HtarFffAvTZT1CpSm93EG4/Bcyl/+HPfvRuVMa2FaxiG4TJrzuOdBW59c52boNnU
	p2ZteabGPYAqcM2WpD078k/dVFbPOzOJcn+LqR28Q2HdKUEI9pYsfgeoFcgnvaepQaRh/p7mjh8LS
	bhs9Zn21yTvPoEwr529QuxgZzHz78FZIVezwsPjHe4ZqQHYpdDK5W55wyWS3i2B4rPM4G70fraYSP
	YI5rDk3g==;
Received: from ip6-localhost ([::1]:23298 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1u19EB-001lMb-It; Sat, 05 Apr 2025 19:30:51 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135]:53737) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1u19E7-001lMT-A5
 for samba-technical@lists.samba.org; Sat, 05 Apr 2025 19:30:49 +0000
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-549b159c84cso296460e87.3
 for <samba-technical@lists.samba.org>; Sat, 05 Apr 2025 12:30:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1743881433; x=1744486233; darn=lists.samba.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xRpBIr+xXXz1/CtUOcT+2D0W3fA7zof4ndEWcpK/IEE=;
 b=I9zLxRiFLwlKDcwU+l7k/6T3DTm/GUrCt7bnb5x9S75uLdL+qAD7LeK8k1H9/1he5J
 bzVXTEnGfvsQAgTBQTiTGG48VX03l4nLdkd67keSkFu/SSK+cgwIy19KWpsiiMF6Ul3N
 suB0eJEWz/anwVtjiYP4E3NLFudIRYtDfFGtbSX+fVyuaNWGhSn4XPjj2vH6qX+0h17w
 At5u1J/3nX7H4JenCtqxS7XpkbGWqM1qZCBAWo3FnN3rq/wJ8gu2CcPF7suPoZGzpuJZ
 gW8aKToHDfzbOAdpA3m9E0l7HhM9b51JgYYsEWtXzHBLFDx2AT9agFGeyvjBUe7vr/Xi
 d8rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743881433; x=1744486233;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xRpBIr+xXXz1/CtUOcT+2D0W3fA7zof4ndEWcpK/IEE=;
 b=i8/s5H+BSzlF1FTLQhkjfZpfh63HvkUhtvSk6Br4zsuvxX+khTz0ad9+YhSTAvcSqr
 /f9KyGKmxEqdo9iWIW+EPHtCm8Zxyi7h+B9Vd1pzy7Gnqj9aua+Cl3uu1G7yKIZ+Gzu5
 sKHKN2KVGLqRQ0oK7ILmUzMom81T9bAFRveMcpW7ZsligEMqskpqbmBXbIGJEyyOWJUn
 WyK+D4pdFTIQIWYLNbhqOpGjBnHAiLeKlHS1+AQ7HKa1mexZyae7gllC4Xm1jbjMvG/y
 Eh8SlOtSzY4BsSfnp0xAnvY1FgY0kpqv/SvPCgm6YRpBa5C7tKcRI96OmYb7PCCotoFR
 8kCQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWaFfj0uogX/JhWUrqHjcjgo56k3GDrt9yU1/VRXA6mwtCfJN6JbejRNT0JlQLATP5HcDm9sXrbPlEYrydUBb8=@lists.samba.org
X-Gm-Message-State: AOJu0YyhFieQyH6jorvzSy5fnei30KY0/HcoJdcU15F5l8no15x2ezLG
 HnG0d6tzifJNkT9g2HvyL2Ym7hcAuwAEnyWv+OMhTM9DcD/8YxAU7b6E9AVjaKr9WboSG843Ur3
 4vih8lCWF2QTqMHswLEBXrtV3UPM=
X-Gm-Gg: ASbGncsexkA8KswCLiA1qQGgj4mmlN2uMvLV1kzBnAiuMPgcttf/w1nqk3FJj934Kwy
 egX2fTFkcs3THlqSkg9hlSdHWBKHvKVkd8tvKHGFryGZ4zmV9uIOHwP+BA1uvPr5AcNXGUmJ27A
 zyD1Gaklkh1CzabwWM6/9y8v0mbpBCuQao3lHw52plRYu2tg3RPssG99tBf/ED
X-Google-Smtp-Source: AGHT+IEN8kBCnfrYNsTTgW0+hdCp46vxmB0bTVMBPKhM6l119tr8+MHOYU9uAT19Hor1blYcNAYMBuZhTqgsFVBqBCw=
X-Received: by 2002:a2e:9fc5:0:b0:308:f5f0:c415 with SMTP id
 38308e7fff4ca-30f0a0eefcamr21528821fa.6.1743881433200; Sat, 05 Apr 2025
 12:30:33 -0700 (PDT)
MIME-Version: 1.0
References: <CAJXSQBms+s2Whk7SfugzQ1kby-xyJ62aVLVvM05rPtFAo7247Q@mail.gmail.com>
 <CAH2r5ms2=o4baY-6_aLmHpJhBYwvaWXUKwZufKs-iT3vsEg_hA@mail.gmail.com>
 <20250405172030.4ptuwa73nnqhkzdy@pali>
In-Reply-To: <20250405172030.4ptuwa73nnqhkzdy@pali>
Date: Sat, 5 Apr 2025 14:30:22 -0500
X-Gm-Features: ATxdqUFxw8DVa_mvmC_Hub9IXVD5jHQUw2WvJZBvRO8xajWDjnHuv9OtUo8gLkg
Message-ID: <CAH2r5mtFPSe7ccQjVdaoL+OCBP8Dya9s8wjSyd1aQtstQnX7dA@mail.gmail.com>
Subject: Re: Issue with kernel 6.8.0-40-generic?
To: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>
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
Cc: pc@manguebit.com, linux-cifs@vger.kernel.org,
 Junwen Sun <sunjw8888@gmail.com>, profnandaa@gmail.com,
 samba-technical <samba-technical@lists.samba.org>, 1marc1@gmail.com
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This was easy to reproduce on mainline for me as well (and presumably
the same on 6.12 and 6.13 since it has been picked up by stable, and
even looks it has been picked up in 6.6. stable) by simply mounting a
Windows share that was exporting a onedrive directory.

Pali,
I did verify that your suggested fix worked for my experiment
(exporting onedrive dir as share).   Could you give more specific
examples of

      'Reverting "cifs: Throw -EOPNOTSUPP error on unsupported reparse
point type from parse_reparse_point()" would
      break processing of the name-surrogate reparse points.

ie some repro examples that Junwen etc. could try

Welcome any other Tested-by/Reviewed-by/Acked-by for the two
alternatives - reverting the patch, vs. Pali's workaround


On Sat, Apr 5, 2025 at 12:20=E2=80=AFPM Pali Roh=C3=A1r <pali@kernel.org> w=
rote:
>
> Hello Junwen,
>
> Could you please provide me more details about your issue? What exact
> kernel version is affected and what error message you see? Because in
> email subject is version 6.8 and in description is 6.12, so I quite
> confused.
>
> I will look at this issue, just I need all detailed information.
> It looks like that the error handling is missing some case there.
>
> Thanks
>
> Pali
>
> On Saturday 05 April 2025 12:16:27 Steve French wrote:
> > Good catch - it does look like a regression introduced by:
> >
> >         cad3fc0a4c8c ("cifs: Throw -EOPNOTSUPP error on unsupported
> > reparse point type from parse_reparse_point()")
> >
> > The "unhandled reparse tag: 0x9000701a" looks like (based on MS-FSCC
> > document) refers to
> >
> >     "IO_REPARSE_TAG_CLOUD_7   0x9000701A  Used by the Cloud Files
> > filter, for files managed by a sync engine such as OneDrive"
> >
> > Will need to revert that as it looks like there are multiple reparse
> > tags that it will break not just the onedrive one above
> >
> >
> > On Fri, Apr 4, 2025 at 10:24=E2=80=AFPM Junwen Sun <sunjw8888@gmail.com=
> wrote:
> > >
> > > Dear all,
> > >
> > > This is my first time submit an issue about kernel, if I am doing thi=
s
> > > wrong, please correct me.
> > >
> > > I'm using Debian testing amd64 as a home server. Recently, it updated
> > > to linux-image-6.12.20-amd64 and I found that it couldn't mount
> > > OneDrive shared folder using cifs. If I boot the system with 6.12.19,
> > > then there is no such problem.
> > >
> > > It just likes the issue Marc encountered in this thread. And the issu=
e
> > > was fixed by commit 'ec686804117a0421cf31d54427768aaf93aa0069'. So,
> > > I've done some research and found that in 6.12.20, there is a new
> > > commit 'fef9d44b24be9b6e3350b1ac47ff266bd9808246' in cifs which almos=
t
> > > revert the commit 'ec686804117a0421cf31d54427768aaf93aa0069'. I guess
> > > it brings the same issue back to 6.12.20.
> > >
> > > Thanks very much in advance if someone can have a look into this issu=
e again.
> > >
> > > =E5=AD=99=E5=B3=BB=E6=96=87
> > > Sun Junwen
> >
> >
> >
> > --
> > Thanks,
> >
> > Steve



--
Thanks,

Steve

