Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 91549B0465E
	for <lists+samba-technical@lfdr.de>; Mon, 14 Jul 2025 19:24:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=5Mf0XvhF6cXmT7OcdaUhbeSAjWhmje0isYhrsQFiYMk=; b=Ht7/pbqwJ7QbEtZ5cnzjNwXhkE
	2T/jmHpvfSWnhtdLdzlvd6q6ppHVehjiAit6eH5mFhzhEeYNgXBQXai14lXCwbpT25z5jStYh85S9
	XtBv8a9Xo7CuxuvColyMz0eOhkUR9kUKZYgwWwdKXT3DPjSUFRG/LcAnzU79Vyt/kCvaI+3KZtDav
	SvIEdyUn+BvXTEpVS7ZPA/OicYrzPDrhxrldmMZiNGCL7x3iLlZaz1PTSoZaMzwNu7OvV1/KTlN5M
	ZUTnW3wMV6p8YV10aX6MJ9eKzx6LMHL/uOSnhxwnPF52c2aLMquQjciC14yCJBYwD9bmA0IxT4lIq
	ZzhgkTlg==;
Received: from ip6-localhost ([::1]:64494 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ubMty-00BDWQ-Is; Mon, 14 Jul 2025 17:23:42 +0000
Received: from mail-qv1-xf35.google.com ([2607:f8b0:4864:20::f35]:51677) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1ubMtu-00BDWJ-4f
 for samba-technical@lists.samba.org; Mon, 14 Jul 2025 17:23:40 +0000
Received: by mail-qv1-xf35.google.com with SMTP id
 6a1803df08f44-700c7e4c048so77461926d6.3
 for <samba-technical@lists.samba.org>; Mon, 14 Jul 2025 10:23:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752513816; x=1753118616; darn=lists.samba.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5Mf0XvhF6cXmT7OcdaUhbeSAjWhmje0isYhrsQFiYMk=;
 b=OSvlA+Pl1IR7VGw3/tmzmSbkfX8muVyS8BOCSwre4u2wOPn/Gi200feLoeNX8eZhFM
 s3AjGTxrNsK8I4mqeRyYGRlTqUU3Kcpmg6YpFnxDto9CIDuS5qL41PuC2idYhX5QZaeT
 prywNr3tJhp1xRIkQu9obKdG8yX5R7uWgs/IaFauvPojRC+CC0NC08T5bvRfm6bZD2Kq
 pfJHn76s5E19g4sGhGTQbYHB3W+CpYOGXraeoIrEJ33c0vQm1bVYAwWOK8orRAA96JPa
 3dO+gG1yrxqU9lKp0ub0MHNcRqxef6m8347cb/a1qB/2lTaHQaZI5USgHnnH26uGJWW1
 xkdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752513816; x=1753118616;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5Mf0XvhF6cXmT7OcdaUhbeSAjWhmje0isYhrsQFiYMk=;
 b=c2XM4/9vWAflyAwp06+CIoIfe0W/XhI8KFhQZaRZ31/C9LHE4O1EaiBnDeM2XZ5hOM
 YouDXOcImcirHpNSHzTm+kDDmsBPIu3aE9rFbhtliDM7Y/eKwdkL0SbMO7Fmg9h0Qp3k
 ykG9kpGawKUyD90H+SSg9V37l2Icb2aKlB/XNj50wd/rZhMAdNcX81XsPYY9pGgbqx8H
 Y6e2dJTvcgSAoQy91zNaI+YEP0W0mXgWps0TOO4xrEG7TcdozUMGS2oADwHsRFNH/3G1
 1S3OlKz7ev1qVhITRx4TTirq3PcK1a9cWI9FmQNRUSVMNDn7OWMuxJS4Il9BQYneDKRL
 J8Ow==
X-Forwarded-Encrypted: i=1;
 AJvYcCXIQrZ6l+dI+ZwIqorCtEt3MvqyKatjFy8rOBeaFRyGiXWQMmVLUWZ5p34QOh3JJGC1R5wQS4fPPyq5aYrO21E=@lists.samba.org
X-Gm-Message-State: AOJu0YxgSxU97/kpL4eVa6TcIbcmlG07bKPy6VSkUklewgvUc+/PAkVo
 3RPMDJkp7v9X5XCPW0W1PpewPKUu+p7s3bA1en92DXUShUqeynncORpo8eR6RVZRh3emeV/BItA
 l4ngNM5YRU40HQNm3ysTqfA/49p/+soI=
X-Gm-Gg: ASbGncv46qGxbvhwgGT3WSBWOm+n7m7v7giKfOi84bUsuj/XTHg+Ag0M48qMvpOpF5E
 /ZK1FSIpV0GOz6nfFVL/TCVTJRm27R/WoC3XDQn7Kxrm4+zHVlIRoQRvUud9VOMWjfQuARUOkyv
 avGVyft6Y5bH4dfdyjkaehEgLYnBpEr2o/TI04DmWO/6t1YG11Xe0Dbnz4aRl5PS3CVOVYsM6y+
 gH3mmsDKZ9z1PKgS3jkgsou4ZJwz70jTCHSC20zrg==
X-Google-Smtp-Source: AGHT+IE0779miNZ8dIplGHikh8ph2bMvnXxOqcfGbKggwOxQ+sCzyEnN+twB144dai4xCrJ8a+CyGLC59MU/IEtpy5A=
X-Received: by 2002:a05:6214:2aa7:b0:6fa:ccb6:602a with SMTP id
 6a1803df08f44-704a35903femr234985456d6.20.1752513815766; Mon, 14 Jul 2025
 10:23:35 -0700 (PDT)
MIME-Version: 1.0
References: <a97b22e8-144e-45ed-8850-c3fd18769a6c@pre-sense.de>
In-Reply-To: <a97b22e8-144e-45ed-8850-c3fd18769a6c@pre-sense.de>
Date: Mon, 14 Jul 2025 12:23:24 -0500
X-Gm-Features: Ac12FXz2c-4Im9oHCGYQ9FrZ0zzhuGMvupQ0rKGx21u87M_KUS6wFr_C-w_4ENU
Message-ID: <CAH2r5mtgWfxQtoy2gwnMiWM3HXno2icuWmiuhMJ64yTAi_jsyQ@mail.gmail.com>
Subject: Re: Using UPN with mount.cifs?
To: =?UTF-8?B?VGlsbCBEw7ZyZ2Vz?= <doerges@pre-sense.de>
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
Cc: linux-cifs <linux-cifs@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is an interesting question.

mount.cifs will pass it (the UPN) down to cifs.ko so it will get sent
on the wire, so behavior will vary by server.

I tried it to current Samba (passing "username=3Dtestuser" and also
"username=3Dtestuser@somedomain" and also for
"username=3Dtestuser,domain=3Dsomedomain") and it worked fine for all
three cases (with and without UPN, with and without "domain=3D").

Trying it to Windows though:
1) "username=3Dtestuser" worked
2) "username=3Dtestuser,domain=3Dsomedomain"  worked
3) "username=3Dtestuser@somedomain"  did not work to Windows server

So looks like the behavior varies by server, but safest way is to
specify the UPN as "username=3D" and "domain=3D" rather than
username=3Dsomeuser@somedomain

On Mon, Jul 14, 2025 at 7:44=E2=80=AFAM Till D=C3=B6rges <doerges@pre-sense=
.de> wrote:
>
> Hello everyone,
>
>
> I'm wondering whether it is possible to use User Principal Names (UPN) in=
stead of
> accountnames + workgroup/domain, when mounting a share with mount.cifs?
>
>
> The man page for mount.cifs does not mention UPN. A quick grep through th=
e latest
> sources (cifs-utils-7.4) doesn't mention UPN either.
>
> Searching the ML in particular and the web in general came up emtpy, too.
>
>
> So, is there a way to do it?
>
>
> Thanks and regards -- Till
>
> --
> Dipl.-Inform. Till D=C3=B6rges                  doerges@pre-sense.de
>
>                                          www.pre-sense.de/fcknzs
>
> PRESENSE Technologies GmbH             Nagelsweg 41, D-20097 HH
> Gesch=C3=A4ftsf=C3=BChrer/Managing Director        AG Hamburg, HRB 107844
> Till D=C3=B6rges                              USt-IdNr.: DE263765024
>


--=20
Thanks,

Steve

