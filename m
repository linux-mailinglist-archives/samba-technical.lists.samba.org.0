Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B5CC9CBE8B
	for <lists+samba-technical@lfdr.de>; Fri,  4 Oct 2019 17:07:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=qn4M5xDXMVaEbx+OH8sPaKUOWsZUWg3nzblaLl2UfRA=; b=5tDueUzBf3Bl3nKotyE8tMhD/N
	EIc3jim5vfL+Ff7dY/1hXeU5bSFLjCP6lhXdB/La9hedjLLJTroCXauULtQNu+AC9bAFKD9e11wsu
	lFt6OjQ73vS0TKL+HVEeN+kXC6I46Aelu733IbqbHg6WRHp9Or8xGWZU/R7fp09I3qMSVpPH5e3SP
	TDbKZqFIMRbHY8NOirlY5lne/gbIMQxiVs5PD8OPejXXPX863TgMEuN/o4xBS5f0hQrJE77LQTklt
	+NNPB0n5UiF4KuQPevh26we4tWGazQPurumlyhDKlfFjiXNClwl9BhVbLIF5o/JUgUCXnqLLpwO0q
	RHllDTUQ==;
Received: from localhost ([::1]:39736 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iGPAY-001C2q-OB; Fri, 04 Oct 2019 15:06:59 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:38006) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iGPAU-001C2Y-12
 for samba-technical@lists.samba.org; Fri, 04 Oct 2019 15:06:56 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 3so6238041wmi.3
 for <samba-technical@lists.samba.org>; Fri, 04 Oct 2019 08:06:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=qn4M5xDXMVaEbx+OH8sPaKUOWsZUWg3nzblaLl2UfRA=;
 b=rJX7vs+2ln51Jkyxc/95TulOMx4Q5PU3J2pI1TC78TayAV+E5y6fpuUKJGlTobXI1Y
 UwLiZReQMC/EUFezDggtF+FMO8O8E30uVqepzCdOhU4rMkl7JTxSXxIDCJytgzZtncW2
 UamZNyk14/2kdHQOGQ/CuH5KWMRgOMPNOD+AZjs9B54vGlDrSCy7sgamCiKTPy5b+xG6
 BUwA7v5/lqBx0enmy+NqPnmeAYZUsRu+eh93FVTAvnehI19RxnxRWx3y47GU/2Fl0bIm
 tEX4aFjKRvQCDCDGpf8YKbNnZGNkyhu0/dobBpB9gaLOAbS34h3ZAiSM4JXQzwQGfPVO
 7Kpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=qn4M5xDXMVaEbx+OH8sPaKUOWsZUWg3nzblaLl2UfRA=;
 b=sGzGG12DyrobYOgPcvpB2eDjKUjnEBHOKY4UNPouqE+mUGdC6yyn4uwrfBP9orcWOV
 5G7z6Ho3aKbMpK6BagB+r1YaHTJjM/aU6IYpYbZltPLHbAWZgyr7ubY/jG5FXNb+DXji
 MEA9eszrQF6N3oPuf9eYB81XBc962rNvpHFY5pgP5tcPoj+Qf+W8ikI4A0Cf97yXnl3L
 nUmWheYSRMPYL3oDSaaAyOVldpWfZ/JIjynHg8j+xbpJ4bLg/+jyWJhCoHEDWKC8bi3X
 UCD4ccBQbNN7dO4oRuAGA9clx7Z8wmBRxAOyAilZVM/X14QB626Ts/cIJxjar5krWdYN
 UXlg==
X-Gm-Message-State: APjAAAW4IfPiqycIJXMOO2VIgpvLGnhx+ZMYoVM2gFoIE1qo98Skp5rz
 NHDW3C4WggtCUwrfglwrpZzfgzYq5hJuNzYxGRb3TX4O
X-Google-Smtp-Source: APXvYqzv8B4ICGYLGY+sSgN7xOd35CF0IlJl2WhLu9b8Q3YK/9H22iPJvqGtETlyDHTLuo1dB4SEhadbmuEaAH/ELGg=
X-Received: by 2002:a7b:c764:: with SMTP id x4mr11504097wmk.138.1570201613289; 
 Fri, 04 Oct 2019 08:06:53 -0700 (PDT)
MIME-Version: 1.0
References: <CACyXjPy5LL=yj6i_T_W0J=DOXHxHB_D=0-ir60opyEV7ftaQ=g@mail.gmail.com>
 <CACyXjPzDX=F2BJX3N7PNMGpTmZCJZ2NU4O9B0uBvyLVKSaQi=Q@mail.gmail.com>
 <2f5a26a9-bf75-5926-a2fc-fcedbebba400@samba.org>
In-Reply-To: <2f5a26a9-bf75-5926-a2fc-fcedbebba400@samba.org>
Date: Fri, 4 Oct 2019 08:05:37 -0700
Message-ID: <CACyXjPyBoOTVzEY=37ATniFBArs5HmOeALcbGtEJ7dtYJDQgSA@mail.gmail.com>
Subject: Re: Has anyone seen a Windows Server return zero results to a CLDAP
 query for NetLogon servers?
To: Stefan Metzmacher <metze@samba.org>
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

On Fri, Oct 4, 2019 at 7:24 AM Stefan Metzmacher <metze@samba.org> wrote:
>
> Am 04.10.19 um 15:40 schrieb Richard Sharpe via samba-technical:
> > On Thu, Oct 3, 2019 at 4:43 PM Richard Sharpe
> > <realrichardsharpe@gmail.com> wrote:
> >>
> >> Hi folks,
> >>
> >> I have run into a situation where it seems the Windows DC is
> >> responding to CLDAP request, but returning zero responses.
> >>
> >> Samba send:
> >>
> >> searchRequest
> >>     baseObject:
> >>     scope: baseObject (0)
> >>     derefAliases: neverDerefAliases (0)
> >>     sizeLimit: 0
> >>     timeLimit: 0
> >>     typesOnly: False
> >>     Filter: (&(&(NtVer=3D0x00000006)(DnsDomain=3DSOME.DOM))(AAC=3D00:0=
0:00:00))
> >>         filter: and (0)
> >>             and: (&(&(NtVer=3D0x00000006)(DnsDomain=3DSOME.DOM))(AAC=
=3D00:00:00:00))
> >>                 and: 3 items
> >>                     Filter: (NtVer=3D0x00000006)
> >>                         and item: equalityMatch (3)
> >>                             equalityMatch
> >>                     Filter: (DnsDomain=3DGPJ.LOC)
> >>                         and item: equalityMatch (3)
> >>                             equalityMatch
> >>                     Filter: (AAC=3D00:00:00:00)
> >>                         and item: equalityMatch (3)
> >>                             equalityMatch
> >>     attributes: 1 item
> >>         AttributeDescription: NetLogon
> >>
> >> and the server responds:
> >>
> >> LDAPMessage searchResDone(3822) success [0 results]
> >>     messageID: 3822
> >>     protocolOp: searchResDone (5)
> >>         searchResDone
> >>             resultCode: success (0)
> >>             matchedDN:
> >>             errorMessage:
> >>     [Response To: 5897]
> >>     [Time: 0.001296000 seconds]
> >>
> >> After that Samba seems to declare that DC as a negative connection
> >> entry and cannot find any DCs.
> >>
> >> Has anyone seen this? Does anyone know how to configure Windows to do =
that?
> >
> > Hmmm, according to the following a DC returns such a result if the
> > filter is invalid:
> >
> > https://docs.microsoft.com/en-us/openspecs/windows_protocols/ms-adts/24=
9949c1-484c-48ad-b548-a31dd0ab2c93
>
> I've seen strange things when sysvolReady was 0.

OK. I suspect that if I shut down the NetLogon server as well we may
see the same behavior.

--=20
Regards,
Richard Sharpe
(=E4=BD=95=E4=BB=A5=E8=A7=A3=E6=86=82=EF=BC=9F=E5=94=AF=E6=9C=89=E6=9D=9C=
=E5=BA=B7=E3=80=82--=E6=9B=B9=E6=93=8D)(=E4=BC=A0=E8=AF=B4=E6=9D=9C=E5=BA=
=B7=E6=98=AF=E9=85=92=E7=9A=84=E5=8F=91=E6=98=8E=E8=80=85)

