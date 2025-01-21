Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B8EDBA175CF
	for <lists+samba-technical@lfdr.de>; Tue, 21 Jan 2025 02:35:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=jK35yDxIz+c7/usfyvLhaGYjtNUGmHkOltTDIjdcUQ4=; b=Vuy+21RpPFEWt6YHGz+34ZwBrR
	CYO9s/iUlvy9zbL/51WUXm+kC+deyKYFTTssPc10ANXfs74FfbldHMXk5FPYQ4m5XEeAUITbx7dOe
	YPMqDEgP4JDliBQcPV/NDsmD8oEYq+ElmU5VDRHKxHaoYJTlSddJu92bSfJ6Cs6anZpMtGL1gCqyB
	7xeu2bbJUh/L6GVi2FamUL8mSbGm8c/TImnr8lgj2DDfZScPzhDLxRtTfK9EgN3WzdTlcBmfu2pry
	wbzF/k587X4Eu7MULZp+jyJfj+xhdCzC2MOMMoD8uWbtliG42Gvi3Ld/xBu6QHcP4SZDug9NW8GOu
	/IBFyO1g==;
Received: from ip6-localhost ([::1]:36976 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ta3AH-008sDC-Us; Tue, 21 Jan 2025 01:34:50 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a]:61611) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1ta3AD-008sD5-2F
 for samba-technical@lists.samba.org; Tue, 21 Jan 2025 01:34:47 +0000
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-53f22fd6887so5070683e87.2
 for <samba-technical@lists.samba.org>; Mon, 20 Jan 2025 17:34:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737423283; x=1738028083; darn=lists.samba.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jK35yDxIz+c7/usfyvLhaGYjtNUGmHkOltTDIjdcUQ4=;
 b=euECSDCxiSU3AJ/gQYDGK4Mh3SiyxnQR6cGK7T+ugXq/xduY8cR1PjpB/WbmVpNO5T
 EI2V2UwAMmeWc4AkJSwWTdlaWO4oMdEBQ6T1bVVlzf6hmMCmq/t9zacLdQdyByl6y/Fd
 XwmAZlr1uphpiOEOwS0Glaz3ICCdApiAf2r78MNP9Vtc3zFNHNKPIgoGAvJlvCwykA6X
 1CUVbVunZNxUIAL/s+S6sqvLNudKf1zw7vdnUhORVRH+hbW6aePRZFXTnlsjWlD56Qcw
 aRd490NzXUQOTxmmeA9p/fowW/aqCWeOhGn63UIFusrq3ToT9F9K2xsiHJyvQJbE0H2E
 rPDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737423283; x=1738028083;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jK35yDxIz+c7/usfyvLhaGYjtNUGmHkOltTDIjdcUQ4=;
 b=TAvpqHjkFB5Sqi8ZmG2SpcDUP9Km2mYgj2E1/4m9+QVaEUDNWsJsAxSpAitoEvyOBW
 AmbjI0Ub+0kaqmrum3vCAm0JzgymxAqHk4fIdXJg9VioBbNIuj7ke+epr8Id2rLAkkxp
 5ujv/5dWyFIBEIRShW4IWIgD0fttr2zK4wHULRVCvxTvzcL3hXf6mjurWv9giQiogVZs
 GB+mk4HxkST8ZVs3M7eSa8MHTdxWwM//pDk9+fFSvtWJM28xSpbsJ6Lgewl3F3+CwdPA
 KjT8rDPgbrR8Q5bIZGEHqyxt8Z8pG4kosW8dvcWimABUAo2jSWimccxfDbWyWOSo/fk5
 Yjdw==
X-Gm-Message-State: AOJu0Yx8W+rU8JxsN7h+9Wrn/FAc/Fm+noX/4+sRYJ15rmpsL+yHYH4K
 BSKuCTSnNp+HJh30h0oyEBRMtViKYrqfLoGVqMU4/oUc3MHBRBq5HYQzdJ6+waAKdadVMxnFrcU
 ULJ19wNv5hyrYOd38UZkFSPPMTYfepw==
X-Gm-Gg: ASbGncsGr5KYJHWvNcVhFzM8hnl6qTtPE4v+BlVKJx20TAMWUH7IWkg1m3ZbM1BCCZt
 8wdwHvoym5P8nhd+hEpXN4D4PgdRuHGdHLh8Gm1hseKNU9BycD18=
X-Google-Smtp-Source: AGHT+IGVgi4qCDavwU3kE6VKQA6KIov/gw3E1mNS+i91n7r02cjbD7PLz6BrkxkXpuMmS3POUkt0Crx8MGQg2CKoPcI=
X-Received: by 2002:a05:6512:130b:b0:540:2542:6081 with SMTP id
 2adb3069b0e04-5439c250eefmr6115052e87.23.1737423283097; Mon, 20 Jan 2025
 17:34:43 -0800 (PST)
MIME-Version: 1.0
References: <CAH2r5mvZkLmkmR+faL2gepGkhMg1tGgW1wt+tFr9NvW2ihK+3Q@mail.gmail.com>
 <Z43pEk7WDs6dTQ1M@toolbox> <4942506.OV4Wx5bFTl@magrathea>
In-Reply-To: <4942506.OV4Wx5bFTl@magrathea>
Date: Mon, 20 Jan 2025 19:34:31 -0600
X-Gm-Features: AbW1kvaxp7g9sWO-NRWECYMh50VC-RrWfHnQGR3SjrxWeiYEAsN6w9mog2O_mtg
Message-ID: <CAH2r5mtDJ2avG3Z=-pMSO33GNqjSyw6qbMATLJFLx_pVBiSasA@mail.gmail.com>
Subject: Re: Local KDC and Samba
To: Andreas Schneider <asn@samba.org>
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
Cc: Alexander Bokovoy <ab@samba.org>, samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

have you done any experiments with cifs-utils and cifs.ko?

On Mon, Jan 20, 2025 at 2:33=E2=80=AFAM Andreas Schneider <asn@samba.org> w=
rote:
>
> On Monday, 20 January 2025 07:11:30 CET Alexander Bokovoy via samba-techn=
ical
> wrote:
> > On =D0=9D=D1=8F=D0=B4, 19 =D1=81=D1=82=D1=83 2025, Steve French wrote:
> > > Is there documentation (or example howto, walkthrough etc.) on how to
> > > setup the new Local KDC features of Samba server?
> > >
> > > I wanted to try some experiments with the Linux client to make sure
> > > the new type of krb5 mounts work fine.  For the server I am using
> > > current Samba master branch on Ubuntu.
> >
> > There are bits and pieces which aren't merged yet in both MIT Kerberos
> > and Samba.
> >
> > Your best way of testing is by using COPR repository Andreas created fo=
r
> > Fedora as it includes prepared packages.
> >
> > See https://gitlab.com/cryptomilk/localkdc and
> > https://copr.fedorainfracloud.org/coprs/asn/localkdc/
> >
> > Andreas gave some insstructions in this comment:
> > https://github.com/SSSD/sssd/issues/7723#issuecomment-2597864370
>
> For using IAKerb you need smbd and smbclient built from:
>
> https://git.samba.org/?p=3Dasn/samba.git;a=3Dshortlog;h=3Drefs/heads/asn-=
iakerb
>
>
> Edit the smb.conf and add:
>
> include /etc/samba/localkdc.conf
>
> at the end of the [global] section after you ran localkdc-setup!
>
> You can then connect to smbd using the mdns name of the machine
> (<hostname>.local).
>
> Example:
>
> smbclient //samba-iakerb.local//share -Uasn@SAMBA-IAKERB.LOCALKDC.SITE --=
use-
> kerberos=3Drequired
>
>
> Best regards
>
>
>         Andreas
>
> --
> Andreas Schneider                      asn@samba.org
> Samba Team                             www.samba.org
> GPG-ID:     8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D
>
>


--=20
Thanks,

Steve

