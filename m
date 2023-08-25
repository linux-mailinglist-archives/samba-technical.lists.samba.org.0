Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id EC5ED788D84
	for <lists+samba-technical@lfdr.de>; Fri, 25 Aug 2023 19:00:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=cfBI7bSv9tjQZJKYJwMY1vV2dEoY/2h0G4XNKrLjOxY=; b=Q38iHMWLak7D/neNLMenrvFrM5
	bF5TdbhmfpDxr0tcUE5X61Tqkc81GFG69bIJxfk2EUDk9PWZiNE6o/cxYKVmXFytv4YVGnvNCvHAB
	qE3mL4vkuEJk0dN4O4kvw1hT1ye2tN/UsVK2kbx3ZNZGp5O18fbZVgNOHltX8JqtS/Z70kIRyrVxg
	EMBCTHcvZSWrPPjCawQyCRn1RX18/RhwC+jy7mj8PzvJtdHai/84FvwRIIYgYYAFiG/xu9NoKsDFH
	HUSwBVpuFj6USUUCX2BTPCzSaIvB+sM8cCLCWWqwfGWrkY1ygkzyq648EN4JtJNDJE4p6OP1faAJB
	JeOSvW9g==;
Received: from ip6-localhost ([::1]:52664 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1qZaAZ-00ETxe-Nh; Fri, 25 Aug 2023 17:00:23 +0000
Received: from mail-qv1-xf34.google.com ([2607:f8b0:4864:20::f34]:48617) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1qZaAN-00ETxV-PS
 for samba-technical@lists.samba.org; Fri, 25 Aug 2023 17:00:16 +0000
Received: by mail-qv1-xf34.google.com with SMTP id
 6a1803df08f44-64f4ac604c2so6070086d6.1
 for <samba-technical@lists.samba.org>; Fri, 25 Aug 2023 10:00:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692982810; x=1693587610;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cfBI7bSv9tjQZJKYJwMY1vV2dEoY/2h0G4XNKrLjOxY=;
 b=WIT6iF0I5JLuTNck5di1Ww4BCqpkN6FFUwwHXBU4G0iIgp69l0xvlia1hb2dq/bbSH
 Gu9PHi+ODJiGMra4RdOqCci2AT/cx1fVe4oZNGc5Ep8sFZYngrbKcXZuITTlAgLVPfMH
 sGhshjFUBvbMzPX5BmkQwjtsS6PkXAzZ03sSM/S5AIs0z/hbTSaHwa2lMi6YyD0yJMJV
 4tnhzol8441pJ35vHpIBaADEHYnmJ1V2B+QZHO+7A5wXJ+XWShhIBKTehk67+xCrT58H
 cAme+cJTRqXIhER8liziekKYVesEigSufbjru1nwWwgEEdatO4PjUkT/eFxT7HKTfnJ2
 xxCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692982810; x=1693587610;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cfBI7bSv9tjQZJKYJwMY1vV2dEoY/2h0G4XNKrLjOxY=;
 b=eQWcjym+ZX8gL/718mrupoa3u9ar/66kQBWICdwJtxq4rdXr2BcvH2iKf8nqARwZN8
 7aFOsoeswWFrq98z6LxssoxOmFfDqjFLV7lhNaI++4hZhmFmDoOWOpYKD8pzDSaBOEvt
 lqAwHKlF81ajZrl2M/Z7VySPkbcY5EdJFDuTsRGbLmmooI3PypYdVEzG+x7lxoiDLwTk
 EhdakTQGy9maMiI2kwURd/fsH2+JU0roJI5/2qa2/Kp79s9A+xIKnlTwIcdlxKc9T2Kh
 MPW12ICevUKJbvYN10Idp041Izl11aGsvwIvfgQouemq0zQdl1cAEvTS3xkK0+yxj2CP
 vNSg==
X-Gm-Message-State: AOJu0YzKpqfiWt/30jIGG1Esn7rXYjWYZzJMXpVNZLd1FMYVlTcC4+FT
 jtGyUlJZMDVxut8k/t0HX/bW0Ayoy9etaBV6hjNgsM5k
X-Google-Smtp-Source: AGHT+IHetzo1cm0jRgsfQPiZzRfhNKfV8AiQyRDV3Kol2eFgjVKVf+o+6hqI5yWFiVwgy4xDyVei36yiAKbuFN/zUGQ=
X-Received: by 2002:a0c:e114:0:b0:63c:efa5:2860 with SMTP id
 w20-20020a0ce114000000b0063cefa52860mr19314759qvk.25.1692982809671; Fri, 25
 Aug 2023 10:00:09 -0700 (PDT)
MIME-Version: 1.0
References: <CACyXjPw-ew8=qG_oAv7AY9nyMTM2On3acLdzAuh9XcFMUYVpQA@mail.gmail.com>
 <ZOjZlw8AUWPCTgvu@jeremy-acer>
In-Reply-To: <ZOjZlw8AUWPCTgvu@jeremy-acer>
Date: Fri, 25 Aug 2023 09:56:53 -0700
Message-ID: <CACyXjPxfuincbg+W837kZhVi2c6tY4PahYaZrZTHfOVLbVLu6A@mail.gmail.com>
Subject: Re: Error injection in the MSRPC code in Samba as an AD
To: Jeremy Allison <jra@samba.org>
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

On Fri, Aug 25, 2023 at 9:40=E2=80=AFAM Jeremy Allison <jra@samba.org> wrot=
e:
>
> On Fri, Aug 25, 2023 at 09:02:43AM -0700, Richard Sharpe via samba-techni=
cal wrote:
> >Hi folks (and Jeremy :-),
> >
> >We have seen a bunch of issues around winbindd and issues caused by
> >errors from Windows domain controllers or delays because the DCs are
> >far away or slow.
> >
> >To try to create more robust code I have embarked on a project to
> >allow the injection of errors into the Samba AD code when handling
> >MSRPC requests.
> >
> >We tried other approaches, like using the Linux networking code to
> >randomly drop packets or inject delays, but this was not very useful.
> >We also tried adding error injection into the winbind code when
> >handling responses, but that creates issues around packaging. So, it
> >seemed like it would be easier to add it to the AD code and then
> >provision test systems with the correct setups.
> >
> >The changes occur in a couple of areas:
> >
> >1. In PIDL I have modified the generated code to parse an smb.conf
> >parameter to do error injection during the RPC library setup and then
> >to handle the specific requests when functions are called (see below
> >for more details of the smb.conf params.)
> >
> >2. In librpc/rpc/dcesrv_core.c et al, allow delays to be inserted into
> >RPC responses by using some tevent magic.
> >
> >The sort of smb.conf parameters I am thinking of are:
> >
> >lsarpc error inject =3D lsa_LookupSids error NT_STATUS_RPC_CALL_FAILED 1=
0
> >
> >which says to inject the specified error into lsa_LookupSids every
> >tenth call, or
> >
> >lsarpc error inject =3D lsa_LookupSids delay 30000 10
> >
> >inject a delay of 30,000 milliseconds into every tenth call.
> >
> >Having said all that, there seems to be willingness among my managers
> >to try to upstream this code.
> >
> >So, is this of interest to anyone?
> >
> >Should I post examples of the changes (to 4.19.0rc1 but they seem to
> >apply to master).
> >
> >Is anyone interested in providing feedback?
>
> Fantastic work Richard. I've already seen a preliminary
> version of this patch, sorry I haven't had time to respond
> (yet:-).
>
> My only suggestion would be to bracket the changes in a --with-ad-error-i=
njection
> at configure time. People able to use this should be able to
> build a custom Samba (IMHO).

D'oh. Of course this is needed.

> If you can see any value in having this enabled for real
> customers though I'm willing to be wrong (as usual :-).
>
> Cheers,
>
>         Jeremy.



--=20
Regards,
Richard Sharpe
(=E4=BD=95=E4=BB=A5=E8=A7=A3=E6=86=82=EF=BC=9F=E5=94=AF=E6=9C=89=E6=9D=9C=
=E5=BA=B7=E3=80=82--=E6=9B=B9=E6=93=8D)(=E4=BC=A0=E8=AF=B4=E6=9D=9C=E5=BA=
=B7=E6=98=AF=E9=85=92=E7=9A=84=E5=8F=91=E6=98=8E=E8=80=85)

