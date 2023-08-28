Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 8275178B212
	for <lists+samba-technical@lfdr.de>; Mon, 28 Aug 2023 15:37:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=hVn8WMRT0jCYIdXBdLP+rhQLvBKWsudMhzOl3QLBXrQ=; b=p3iY1l2Guf3JBXYNw0scJht/JD
	v3n261HKGSXFUA1ibolqfNxQm1G9paKDZxnuiZL4eYWiyRaor2qinAgVe1TIwUEG85+FEAGG1Brg5
	lZaGSwbRvMG40XcebMLeX451Hs2WorGLNEWb9omRdyZ8xdg0ocKjGBx4o/jpp4PD0oZ6wfx4Rk25i
	8HrX7l/aZLB/jv7Ajv/draLp4KaSg4Gx4BbtHrD+vE5Fzr3MsVysVfbnMvIHxVQ3zQwHFMiKLPKBg
	GSwLlIFVKfj3Fq8uwav68Jo19BP6tqMlKWglFLldD2tjhQUJf7wZCzZGD2fLukJ8pzn+BXEzDrWRl
	dCuYD/+A==;
Received: from ip6-localhost ([::1]:24664 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1qacQF-00FB3C-CF; Mon, 28 Aug 2023 13:36:51 +0000
Received: from mail-ua1-x934.google.com ([2607:f8b0:4864:20::934]:44365) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1qacQ8-00FB33-Mk
 for samba-technical@lists.samba.org; Mon, 28 Aug 2023 13:36:49 +0000
Received: by mail-ua1-x934.google.com with SMTP id
 a1e0cc1a2514c-79aeb0a4665so869980241.1
 for <samba-technical@lists.samba.org>; Mon, 28 Aug 2023 06:36:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693229803; x=1693834603;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hVn8WMRT0jCYIdXBdLP+rhQLvBKWsudMhzOl3QLBXrQ=;
 b=FmcI0O8Q5t+C7DSao4g16O02q5LfGtFFZLtsxb+4Wx/tJT+kUda3eeMkjpXhq0zueu
 kAZK/leJqI7iKHXrfSDH9lqGb+130Knsemnko3LWuIECwgYob3qPXVAlwDrKmnQ61ZTb
 o6A7ec6i2oSQUBs5zu+mQ+gYScgH+IM651xeTiNKoleCeQ7B/OFYUgD55mQBAPRuWf7c
 nVCfsbojDGSpK/euWQwWb4pMf7qOSIMnmIbnFnj6pIjiHAmz5PPuOSREcSr16CQFJjFO
 BNppM7BzVfq1A6ZoHOqfi024lay11I0Fi68dxzHvaPllHRRhfB54hCnMTbs9QAQmArU+
 QxCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693229803; x=1693834603;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hVn8WMRT0jCYIdXBdLP+rhQLvBKWsudMhzOl3QLBXrQ=;
 b=k92lyLpgGMMr50OfZYUg5iqJZ2njzTDDgdQAc+LwlLzjW83RpBscD3pCCLSl/u0hTb
 S7UaOO/lxLCrBebGBgnkS4znvkHvZGcBzF8ZRxTg+9DTAkDJ1U9KkMEV3RMZl7LvS+NZ
 PjT9zLl743KCeSkimEZP6X/coxWklr8znNGJVObFO08tGRwKF+cdhdHXFT8/Rhe+n5kq
 p/amHP/rWoNdjqrqYza/mjw0LSYKcPSyxA9LpTTqzd/wP4ezx4lvlVkLbS+/rP95v2oe
 cvCOPEgyZ5hc016Iwu7shFifwg9gaS/6OPf1naH6I5VBeBY6F0nP1chqCgEix2WJipak
 Xr5w==
X-Gm-Message-State: AOJu0YzfZwUsM8MM+pK9+tUVcfXGU26dGKZMrRFOqrVdlEjF5/Rn93ME
 x0sIQZsDBTSLQHPfG97joR94TtvCoVfD/mcG3SK5q8pg
X-Google-Smtp-Source: AGHT+IFxccYCXYZXf6k3Nmo10CO78ATHgTMcQ86PnEEQbx6Tf5MBS1qZv1oa6uF6SfRS4F9ALIJn5Pkn5T7F8LlYglU=
X-Received: by 2002:a05:6102:497:b0:44d:634c:1125 with SMTP id
 n23-20020a056102049700b0044d634c1125mr15010457vsa.13.1693229802661; Mon, 28
 Aug 2023 06:36:42 -0700 (PDT)
MIME-Version: 1.0
References: <CACyXjPw-ew8=qG_oAv7AY9nyMTM2On3acLdzAuh9XcFMUYVpQA@mail.gmail.com>
 <c1ce1f871376fc4d13aec34ea9834ec1f627a03c.camel@samba.org>
In-Reply-To: <c1ce1f871376fc4d13aec34ea9834ec1f627a03c.camel@samba.org>
Date: Mon, 28 Aug 2023 06:33:26 -0700
Message-ID: <CACyXjPy+T37P-tWn2yjiqYnPAYjNwWESwp74e6vB-H1ePSrLUg@mail.gmail.com>
Subject: Re: Error injection in the MSRPC code in Samba as an AD
To: Andrew Bartlett <abartlet@samba.org>
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
Cc: samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, Aug 25, 2023 at 12:53=E2=80=AFPM Andrew Bartlett <abartlet@samba.or=
g> wrote:
>
> On Fri, 2023-08-25 at 09:02 -0700, Richard Sharpe via samba-technical wro=
te:
>
> Hi folks (and Jeremy :-),
>
>
> We have seen a bunch of issues around winbindd and issues caused by
>
> errors from Windows domain controllers or delays because the DCs are
>
> far away or slow.
>
>
> To try to create more robust code I have embarked on a project to
>
> allow the injection of errors into the Samba AD code when handling
>
> MSRPC requests.
>
>
> We tried other approaches, like using the Linux networking code to
>
> randomly drop packets or inject delays, but this was not very useful.
>
> We also tried adding error injection into the winbind code when
>
> handling responses, but that creates issues around packaging. So, it
>
> seemed like it would be easier to add it to the AD code and then
>
> provision test systems with the correct setups.
>
>
> I've thought for more than a decade that those deploying Samba as a file-=
server for customers could really benefit from using Samba as an AD DC for =
testing.  I hadn't imagined this creative use - I just figured it would be =
easier to automate etc.

Actually, that is the other thing I am pushing for. It seems to be so
easy to deploy Samba as a DC, setup users, groups, etc ... and that
may allow us to handle 80% of our tests while we think about whether
we need the other functionality we discussed in another thread.

--=20
Regards,
Richard Sharpe
(=E4=BD=95=E4=BB=A5=E8=A7=A3=E6=86=82=EF=BC=9F=E5=94=AF=E6=9C=89=E6=9D=9C=
=E5=BA=B7=E3=80=82--=E6=9B=B9=E6=93=8D)(=E4=BC=A0=E8=AF=B4=E6=9D=9C=E5=BA=
=B7=E6=98=AF=E9=85=92=E7=9A=84=E5=8F=91=E6=98=8E=E8=80=85)

