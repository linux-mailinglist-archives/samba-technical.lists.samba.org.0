Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 8191E56F2E
	for <lists+samba-technical@lfdr.de>; Wed, 26 Jun 2019 18:54:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=XkX4/O7m3m2sTDtL46cOa8/PTrB/t0ZWUFPJnNunfmk=; b=FY96ev1QTZNpS28/pnJeVX1iVY
	V4nAKHXKqvZROxd2JUlL++8ipA0EefuN1LuhDotMRY1oqdn2cP15NZWGYPQXg45NEgFWoKTl9lmer
	kvJJVxV3Df18tUfqkvsifWbae5KhqEXmlMI6pXqUEmByvsgM53fS6ubu9JkP64hLibNxFhCxdG1cF
	CIx5sV8olAoL8Q/+7JPYrPu+pcLeW8Q1OKzXg8wxo248aYFabk5kUyLcSHn8BkrDX3RscpzGv45Ab
	zigAZ7BgGJGPhwd3pexbfcR/MeNHjkFEQTQbG3OLb0LqcqbLWJi+IvNBJzD4aR97e4T5k+iwnc/h6
	Ea6WS8JQ==;
Received: from localhost ([::1]:46580 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hgBBb-001x6r-Nb; Wed, 26 Jun 2019 16:54:19 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:53925) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hgBBX-001x6k-Bb
 for samba-technical@lists.samba.org; Wed, 26 Jun 2019 16:54:18 +0000
Received: by mail-wm1-x32d.google.com with SMTP id x15so2841433wmj.3
 for <samba-technical@lists.samba.org>; Wed, 26 Jun 2019 09:54:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=XkX4/O7m3m2sTDtL46cOa8/PTrB/t0ZWUFPJnNunfmk=;
 b=TfVGrbppVZet0JXXdSM+PDlL50cEjyVMElEansfbu9sRuYgbO1W8OOaAeg3WNO5piU
 GrnNOG7u8t/qv7us5TgxO0+I+1iT/98uY5TCaleiVNdUF765oh18JprYVLUPx1186U9Z
 nDcgAkcWaqViYLZEqHWR17q5rxEt+DL6u2mX+DOTqlUPDD55aw2XmDDyNaoehWk7N7GY
 N7Q4GWvDaP6TxQQOmNmIVT9e+dVd4sz3UgNFH6dIW9nMTEpW/VOkGik3dMhP//8gCUFo
 FAZjcDiq7dBO/Vrk0VPs6SMeaqEBKmobIk1Vsyen9Ijmp80Y5gW9gAnasqqFEpNjSspp
 v7cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=XkX4/O7m3m2sTDtL46cOa8/PTrB/t0ZWUFPJnNunfmk=;
 b=sHzSsVwxcwqx67j18dcbIXAyLnFuEagGx3NyxQUtR1XXzPSbQfoeNcEs5xga1kLe92
 oMFhArjT3V0n8w82vhBfmoIDLbINFHmXB5V89GO6weBlyDMbkToqgCZuaIjGbGaWwjVu
 szrPfxmQA0kx1/9Wbx0DHIcTEfSdgO3iMDRgvbVpZuxCAKAJwJlNefA1eldjvCstKehi
 s/BpH+NNq9B7UcGXrLViE4Jquf3kzXOLGu91nwta6WN5rWX7CTww0GW6UTLprUd3k3TR
 0kjq0J86AIxi1RH0xz+srUemDcX2rMu6ALcUVidiDK0fYdY6rcvMvQwNvkN3NcSh/4Aw
 5WaA==
X-Gm-Message-State: APjAAAXFtW8U1vd2Cup7tjp3n/3bNK+zBOU+pdy/nsIrc4ln+P5sh4pE
 Sh7eOcqSyxAGXhJFlgQ6NHLba2lcuUOVEsYrOBSaYQ==
X-Google-Smtp-Source: APXvYqyCD5huj1Kp2E0SovI2D7hAyWSkh2xtG154xHs7KOytyHTkkB0cs94EGWdA55p0xOHBId8bXEBVzwfABUbd18w=
X-Received: by 2002:a7b:c8c3:: with SMTP id f3mr24969wml.124.1561568054572;
 Wed, 26 Jun 2019 09:54:14 -0700 (PDT)
MIME-Version: 1.0
References: <CACyXjPyKXCXuW2J2C=ocqYTCmhBZEpv+a_Uxd8B5V3WpvOVQYQ@mail.gmail.com>
 <20190626160105.bmomcypvhhgvdgdq@inti>
In-Reply-To: <20190626160105.bmomcypvhhgvdgdq@inti>
Date: Wed, 26 Jun 2019 09:52:28 -0700
Message-ID: <CACyXjPwwuThaVxC8UF=B8XiCeC=yk9zadQCeojf2Y7iOYvN3Pw@mail.gmail.com>
Subject: Re: Is there some way to have Samba limit the portion of the Version
 it compares in a CTDB environment
To: Ralph Boehme <slow@samba.org>
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

On Wed, Jun 26, 2019 at 9:01 AM Ralph Boehme <slow@samba.org> wrote:
>
> On Wed, Jun 26, 2019 at 08:52:13AM -0700, Richard Sharpe via samba-techni=
cal wrote:
> >Is there some way to limit the comparison to the real portion of the
> >version string, ie, '4.7.1'?
>
> there is a way to ignore the whole string: allow unsafe cluster upgrade =
=3D yes

Yeah, but I would prefer not to do that. However, maybe for my
internal tests it would work.


--=20
Regards,
Richard Sharpe
(=E4=BD=95=E4=BB=A5=E8=A7=A3=E6=86=82=EF=BC=9F=E5=94=AF=E6=9C=89=E6=9D=9C=
=E5=BA=B7=E3=80=82--=E6=9B=B9=E6=93=8D)(=E4=BC=A0=E8=AF=B4=E6=9D=9C=E5=BA=
=B7=E6=98=AF=E9=85=92=E7=9A=84=E5=8F=91=E6=98=8E=E8=80=85)

