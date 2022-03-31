Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 33AE94EE25B
	for <lists+samba-technical@lfdr.de>; Thu, 31 Mar 2022 22:09:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=1lVmG39N9YoePkdVXqUfuuY77Fze4sAui5IMHZuxd1c=; b=VjjLJZbfJAlCuKvR4QojjWfQxh
	xJMZ6s2+0b4UOzSfLFD9WL9VpgIO6Rvkn7WSoQOhrFSwtfbjfF4ktE2Vi4gCXuyzzEp44KGNpATIb
	hmrKLriPa6dch2NJdTovTw8h7J5skRoTjs4onuEGF/ot7agbHMKzsNc0n3Ix2tGI8S0gXoNdzW3Qr
	HL3rIjgHjZGbpLpBbvCl8xRxIJupt9nRZvtB3hMufx44ShdpkukTa6uGE7pkygM4xGwnjrCnMOewS
	SB7fL1u+nV0kIyTLqcZBdSzXLLpC2zNM2qHCQhWJ3QDLkLgMxikH3HjU4rw9kBoJI/otTqm4yKPAt
	/uXEIXwg==;
Received: from ip6-localhost ([::1]:54234 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1na15g-007G3p-OP; Thu, 31 Mar 2022 20:08:20 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:36355) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1na15b-007G3g-VP
 for samba-technical@lists.samba.org; Thu, 31 Mar 2022 20:08:18 +0000
Received: by mail-ej1-x636.google.com with SMTP id bi12so1611539ejb.3
 for <samba-technical@lists.samba.org>; Thu, 31 Mar 2022 13:08:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=1lVmG39N9YoePkdVXqUfuuY77Fze4sAui5IMHZuxd1c=;
 b=Jic2vCxAIFUYvM4k21ghtxzwDuR/5ZEpuwOKkIaXIg3/eyJhP/7QnLh456ou3qyuip
 oLzNIx7oXe+QncOk2ReTdeeYC/tqB1yW4FNai8BLMmO5Upe8E9gyxfsZJUpsg26o1H/a
 2bcCt9rnni4+WCqAFi4WwLcosg5Opu51n1Wq0P0p9QaoF5yUwFv/GeBU9sPXpaI19+6D
 nWQAboY1fy4HuojnyLyFUbgHvFlzPKO2QUb0Pu+zaaTJjX2VIQCQzsI99Efmtv10ke9L
 K40FAevU85FLwDEG2EGj1RHixWvptxzzd4DYlympqPKAbV5PdLnSMdxupKGDVYDYAq9p
 8FMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=1lVmG39N9YoePkdVXqUfuuY77Fze4sAui5IMHZuxd1c=;
 b=Tlc0HcMPIj6TG2kheZVWwcc4541qVlB/K7/1ORwImZTByHRZinFuQCbk55f+/D9pe/
 NCjIxN912b8Fn0IOw34mwrwH6gqdf4iffKkWR6kL17X+U1Whzj8TRSE75MhrE+3slKBU
 Aik9bteoQDKdotN/ZcVVvTkKygJde+WAR0G+mcZoOjX8CGCa2jRvyFEaQFHNQMiRW7iW
 hj1X9jTWHM6ncdJn5ncUOwMtwr14IfLGq4bkbCeE3ovYadyyt1ixuC3xQbycT6POHuA8
 E+TRyBjyxSj+ebvtWvMAQyfllgHWMMzb5x/WF6hpo0NYCBjcbumHkJdI/8DGYqBOw6s3
 TAnw==
X-Gm-Message-State: AOAM532Ai9upZP52jyyg0VccMm/qxfAtMvODDWVL4VYmx61ZpZwxu6VS
 s1kyZZItNEbUJrE6p/A7o/kcYpWEyWweNNkm3Pk=
X-Google-Smtp-Source: ABdhPJxNvhoeuGSAYywYp7LWUxWTB75recx3Rc+6jmuN78uYVRcUvU3jL9ncp0ykknF5AitnJLl5OwIkbPTIiaJ0Op8=
X-Received: by 2002:a17:906:99c5:b0:6df:8215:4ccd with SMTP id
 s5-20020a17090699c500b006df82154ccdmr6434894ejn.684.1648757294746; Thu, 31
 Mar 2022 13:08:14 -0700 (PDT)
MIME-Version: 1.0
References: <CACyXjPw0iqTm=HE9Neb=J99wZ0+=GRdQ0+13+BAuDvvLvQeWaA@mail.gmail.com>
 <CACyXjPwFhse8VtiuitVco-Q9UtpzUSwk3xxUz020rK7M=gtp4w@mail.gmail.com>
 <926eed4f-2c9b-ac62-a31a-e325d7c09006@samba.org> <2421934.YKUYFuaPT4@edfu>
In-Reply-To: <2421934.YKUYFuaPT4@edfu>
Date: Thu, 31 Mar 2022 13:02:32 -0700
Message-ID: <CACyXjPxfpMvWT8qBfwWw57y1N9fwYUJsvp7zGm05FOWrqqXRFw@mail.gmail.com>
Subject: Re: Are there Python3 libraries for the net commands and etc?
To: John Mulligan <phlogistonjohn@asynchrono.us>
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
Cc: David Mulder <dmulder@samba.org>,
 samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thu, Mar 31, 2022 at 10:57 AM John Mulligan via samba-technical
<samba-technical@lists.samba.org> wrote:
>
> > We don't have bindings for these right now. It probably wouldn't be
> > difficult to add them though.
>
> I'm interested in contributing patches for this. I've already looked at t=
he
> code needed to be wrapped (lib/smbconf and source3/lib/smbconf). I've eve=
n
> started prototyping.  I've done C/Python APIs before, but it's been a whi=
le
> and I'm rusty, so I'll probably start by making a draft merge request for=
 a
> subset of these API to get early feedback.

How were you planning on dealing with the 'net conf list output'? As a
list of dictionaries, one per section or a dictionary of dictionaries?

--=20
Regards,
Richard Sharpe
(=E4=BD=95=E4=BB=A5=E8=A7=A3=E6=86=82=EF=BC=9F=E5=94=AF=E6=9C=89=E6=9D=9C=
=E5=BA=B7=E3=80=82--=E6=9B=B9=E6=93=8D)(=E4=BC=A0=E8=AF=B4=E6=9D=9C=E5=BA=
=B7=E6=98=AF=E9=85=92=E7=9A=84=E5=8F=91=E6=98=8E=E8=80=85)

