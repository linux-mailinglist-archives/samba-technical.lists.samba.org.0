Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D3BCABE1E9
	for <lists+samba-technical@lfdr.de>; Wed, 25 Sep 2019 18:05:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=sbP1gdqHwrzI4L7xkpB8uFVraNoxPtyrffOmTDwyRk0=; b=AMHii1jVBCrPFCvcl6F0r6/dKs
	x6lWWT8TS52qzNGr9bl/jA65iv0nmcTHHLwaxI84KnnQr4iCf5Pb7ooUnQ8Inl488+UYu29BE7R/O
	JA7AfDiqKD5l7uH0anfBLzapqQy7+PV30Xb/50sKbpcVxysZaCvvM8NwEzBlfSsBbnakTEa+xLEP/
	NYZ0UJLJ7sTjHDEECbBMdEBsLZgjMhCiAXas7o+IbZi16qowfV1b70aTqBTQAHnuUulZ2R02D/WdZ
	KOFaofoovApquuen7afMawXF92A0gOYja8LAjpIrW7gb4cMvaMUt1uQM/JgRrZCaC8tmRUfrRLji8
	wQYN+lPg==;
Received: from localhost ([::1]:41858 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iD9nB-008Yiu-VS; Wed, 25 Sep 2019 16:05:26 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:43667) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iD9n1-008Yii-4g
 for samba-technical@lists.samba.org; Wed, 25 Sep 2019 16:05:17 +0000
Received: by mail-wr1-x42f.google.com with SMTP id q17so7609321wrx.10
 for <samba-technical@lists.samba.org>; Wed, 25 Sep 2019 09:05:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=sbP1gdqHwrzI4L7xkpB8uFVraNoxPtyrffOmTDwyRk0=;
 b=pXslhlh2q7SNrMfUu/N8EBRm5LSdbpa2/4nKHiTm5YbGv7YXEfAHCEVn1eLyQnGqib
 U6GRQfp/JepiRmDpj0LdHWM/dS8FPlbyrRJRhLwHQXvrjo3tA7OA27wNAalOsaHL5L/Y
 vx7sjMA32Vw+QMWKR5VoFxykweetGFaxvbyoFH7aAnlmMSnUXqTredkg5uzwfUx4qDFC
 w+ffhsTxlONV1aAlmavbFPmUY2tcMUVwnE520grFxFhg5Si92cWghx72Ok43eDYXd2D5
 VbtxFfkphyu6WgUlYyr9jqznhF1nkncdNApPeyNj1Tr0IB4b1Nt/ves7/eT+KPM5B96U
 gETw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:content-transfer-encoding;
 bh=sbP1gdqHwrzI4L7xkpB8uFVraNoxPtyrffOmTDwyRk0=;
 b=IUjtxLzOQI8jJbu8oxBqb7bzOHugPOHbzPXtZxweRRBmi9rry1vnPtn+IqjDofTbu6
 2t5ZDZUg1X9jdZ1I0qxw3/qPDjgrP2VlEWobDVh94snZXBWIasRASxHdKLT0pCFBMOFP
 5nIsvj7IuKkvVy57dTNNyx8meydWUfOOof6dBs9CC47kOqzbfw6HLyyH0lhtZnQ/R5nt
 OCxlGh6zFiuaRsUVD/K31K9x52oFYcJf1/xZ1BqZjPKbFqX3HRu5Nk3traVG7+prwKTH
 ZQQ7FusS5sBgu7mDcUY+hN84Y1Anvy0c19gDcBQOHlD2CJFAMi/2bJwqY8GeVUvhGs+d
 GfrQ==
X-Gm-Message-State: APjAAAUXBX/Nb/OvvIegkqF+lYzhUaoTqBLSe1DjEMKvGsnU18RgqqEc
 scdg0CbNgmHwZqwVvabIY1D9VAv5XZ4jyixAo/3FnbXM
X-Google-Smtp-Source: APXvYqzLJ/PKJuORgFmFLw6WrXJB91meKtMlgGsmskipg+SsJRIpDUXPkcmkxKXgj1uvAcJ/DFKX1k8z+HeJUJLGSAc=
X-Received: by 2002:a5d:678d:: with SMTP id v13mr10015801wru.133.1569427514263; 
 Wed, 25 Sep 2019 09:05:14 -0700 (PDT)
MIME-Version: 1.0
References: <20190925155916.GB21234@jeremy-ThinkPad-X1>
In-Reply-To: <20190925155916.GB21234@jeremy-ThinkPad-X1>
Date: Wed, 25 Sep 2019 09:04:07 -0700
Message-ID: <CACyXjPxEkFDvHcY5OUY14qf8Wdq+bxi21bwgYaG7_qPFFNcoPw@mail.gmail.com>
Subject: Re: New minimal SMB2 client library !
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

On Wed, Sep 25, 2019 at 9:00 AM Jeremy Allison via samba-technical
<samba-technical@lists.samba.org> wrote:
>
> Ronnie Sahlberg, Samba Team member - has
> written a new small-footprint SMB2/3 client
> library. Compiled size is 120KB (yes, that
> is *KB*, not MB :-). It supports signing,
> sealing, NTLM authentication (and krb5
> with external libraries).
>
> It has *no* dependencies (other than the
> afore-mentioned krb5 if you need it) and
> is available for checkout and hacking at:
>
> git clone git://git.samba.org/libsmb2.git
>
> License is LGPLv2.1+, and it is developed
> independently of the main samba project,
> so please send patches directly to:
>
> Ronnie Sahlberg <ronniesahlberg@gmail.com>
>
> Submission of patches grants him the rights
> to integrate into the code under LGPLv2.1+.
>
> It's designed to expand SMB2/3 use into
> the small device Internet of Things and
> is already used by the VLC and Kodi projects,
> and someone has ported it to load games
> off an SMB3 server instead of a cassette
> tape for a Tandy TRS-80 (for the over 45's
> on the list :-).
>
> It will *never* support SMB1 :-).
>
> Thanks Ronnie for making samba.org
> the home of all things SMB !

I have used it extensively for a project I am involved with and it is
excellent.

When I first started using it it did not have SMB Signing support or
Encryption support, but Ronnie has added both of those.

I use it for accessing SMB servers like NetApp 7-Mode, NetApp C-Mode and Is=
ilon.

It is amusing, as well, seeing the differences between NetApp 7-Mode
and C-Mode (C-Mode says Compound Responses? What are they?).

--=20
Regards,
Richard Sharpe
(=E4=BD=95=E4=BB=A5=E8=A7=A3=E6=86=82=EF=BC=9F=E5=94=AF=E6=9C=89=E6=9D=9C=
=E5=BA=B7=E3=80=82--=E6=9B=B9=E6=93=8D)(=E4=BC=A0=E8=AF=B4=E6=9D=9C=E5=BA=
=B7=E6=98=AF=E9=85=92=E7=9A=84=E5=8F=91=E6=98=8E=E8=80=85)

