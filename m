Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 497A8A17726
	for <lists+samba-technical@lfdr.de>; Tue, 21 Jan 2025 06:59:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=ujxB4X1jJIDBdu+Rw0J7nEF7D6TlEjwkfHaGZcjDu0c=; b=JbERDMvsqb39zJGCMVSTMdnL6N
	iOS/dAd1ASXyThzWWzoFftXqWikRyfRstp9Ol3M5IJcjeazwlZR7zjcE7CF1oYKI3opviq5+9uKcE
	MeEKibd7Tg+gy4SWcUyoOughUGD65LQ0VQHFysBmYDRwBDKGPgG8rCmmMMAlvfrf7b/B+PV6urrQw
	SXj4HXVnpmTcsdd/lhP6qoNHK0A0tr6CVaD1fBmIfVTphWsOpgdN4ESIzohpUOpsFKS5vmaKWoQac
	j6IvMoKegojGy6U1e/LUDh4U0IguF96nFBSh9JVzHf4KDdB6fnu0vfaQLfo0qVuq0lgf4Lxy1kQdi
	GUpBOYcw==;
Received: from ip6-localhost ([::1]:57336 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ta7Ie-008szy-0n; Tue, 21 Jan 2025 05:59:44 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135]:57494) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1ta7IY-008szr-R8
 for samba-technical@lists.samba.org; Tue, 21 Jan 2025 05:59:41 +0000
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-5401bd6cdb7so5045851e87.2
 for <samba-technical@lists.samba.org>; Mon, 20 Jan 2025 21:59:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737439177; x=1738043977; darn=lists.samba.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ujxB4X1jJIDBdu+Rw0J7nEF7D6TlEjwkfHaGZcjDu0c=;
 b=V2goWLKYXzYAvQBZ/aPwP3HQiwkTWw2VIcn+lySYNSBt6DYAIlBE2pjPrwe5meGocd
 jCs99sVx/8dqYv2UCe86IZLV6Z95yMksLGng3vHppmxHuM7ShmGbQsmTMgDQwbxUFRXP
 9DZp/KKQFGhGbIsYYiA7+hi6SZpQaD5lFSaeNHle/ql9Y9wOUkifS7JLi0LRgt1XtHSg
 X+y6XjDnhCM1d/bcaVsXFWpqynfwVnvg7vsuniOVp3QOPi1mg4UYNi85fTC5we/QWSQw
 g+Z/TDVX9OJCVJi+xDx9VlP1AW1KnnymLxdJorBugVmJlZEGRb6oNKOOsZYrP627G8E8
 GheQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737439177; x=1738043977;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ujxB4X1jJIDBdu+Rw0J7nEF7D6TlEjwkfHaGZcjDu0c=;
 b=pSpW+U90Gx3wVL4N5NB+SeovhyuxjjayOxZ5gz8MStY8yAMKvnglj6sjGVXSVy2Bw4
 Y4x1P4fQ3/t47RHOq7kh0f3Yg8dY4AoiwcQEYz1B7s/YpBBccXGVpZ6sg8CxXmemG1Bh
 NPuPmUPK+aYr3iUlHSFGivW8x9i1YhsgUMaCkxtd94HZpRATyX1Q3CtBTe+vA/gD5VSB
 0Cz0ic53xU0MzSgvwXu4OazOUve15fi/uLxIPdqfGzfSE8Eipce6ruNynxTHn0LRK6A1
 DXnXreoV2S9fjD1y419HIqQgMztCeRnusSB3XvmrL//k33Oj5Xs2tqhxlPWde+0GSBiX
 8/Iw==
X-Gm-Message-State: AOJu0YyMzpFWQDwbhUm/bU60pM1XmINXrQKXRiL5pPlQmynDA7364PiH
 TsQVLhmh0LpTjp2HPA6/98wtX1IA5fa7GjctcCT9Z29fNbRv/tz4IXoQdYhDpeQMOv6OS8jXK7x
 Hep0hNSwSQuLrp8CGKT1ewHhCRkk=
X-Gm-Gg: ASbGnctN7NMnyZiyAGCLHPan8IEsH3FoCoTEC8b/EjDcmyUbWd9W/beZ9N+0u1qHWRw
 WWV9qq5mcJimmn7N18w8KZNzAIG4Y1DeV2GP1XvprjaDqicRj4Do=
X-Google-Smtp-Source: AGHT+IE0+7rbjNMC1dD++svSrpQlnSOsr2TW7EPLZVwt7tv4pilEBUxwEyLVRA/pmMkPKXCDLieXqKo3xqtpofcPDyE=
X-Received: by 2002:a05:6512:3b07:b0:542:2972:4dee with SMTP id
 2adb3069b0e04-5439c280a4cmr4112530e87.46.1737439176810; Mon, 20 Jan 2025
 21:59:36 -0800 (PST)
MIME-Version: 1.0
References: <CAH2r5mvZkLmkmR+faL2gepGkhMg1tGgW1wt+tFr9NvW2ihK+3Q@mail.gmail.com>
 <Z43pEk7WDs6dTQ1M@toolbox> <4942506.OV4Wx5bFTl@magrathea>
In-Reply-To: <4942506.OV4Wx5bFTl@magrathea>
Date: Mon, 20 Jan 2025 23:59:25 -0600
X-Gm-Features: AbW1kvbpulMl24EvDUZkm_XjccMdQLdkdK9nGSdHqS8szdBe0DPJS3LHgkQykFM
Message-ID: <CAH2r5mts9UoESoG-NMf8jWobVtd+ym+ujoHpxpVFf0CT2vwGWA@mail.gmail.com>
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

Do you have a sample wireshark trace of SMB3.1.1 connection to Samba
with the new peer-to-peer Kerbeors and/or IAKERB?


--=20
Thanks,

Steve

