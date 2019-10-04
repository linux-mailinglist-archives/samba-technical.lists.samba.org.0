Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id CAAA6CBC07
	for <lists+samba-technical@lfdr.de>; Fri,  4 Oct 2019 15:42:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=iNmV3oSXyMoZtQW+GupedsZm+fi1ookBEvLMYu2INIs=; b=t710CYkGTAc1gEnXpWF2Jb7guu
	E7OPE+OhJPq4KDKLThIjMAmhNYDaDLTKcp3HMjzowD9urW1L/TWvLUr9lpMMg/KP1f6ZnOWpk7vaL
	3jl9ZmPOOsawlbV/nD9Dh09RFyFQPjpNOvrhzRHiHPwSKgkQ55BdgRmDQHMAI4w5+/PsM9T58CPev
	io5hW5hHgBo/fInQLE78nJ7XGh3qNS1rgoWbyux/Ndx1D44qLakSTVY9uzgixWSySAoddSp7SLoBM
	8OxHdcREGpcB6G9cJVQERjwM5YG5ncpV+lqYkWWcLcE9cyB2kUHW9WC/dSCQdfb9vSy5sWHf55uvN
	Ld8SfHIQ==;
Received: from localhost ([::1]:24654 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iGNq5-0019Qb-1U; Fri, 04 Oct 2019 13:41:45 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:39887) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iGNpz-0019QO-Nw
 for samba-technical@lists.samba.org; Fri, 04 Oct 2019 13:41:42 +0000
Received: by mail-wr1-x42b.google.com with SMTP id r3so7285653wrj.6
 for <samba-technical@lists.samba.org>; Fri, 04 Oct 2019 06:41:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=iNmV3oSXyMoZtQW+GupedsZm+fi1ookBEvLMYu2INIs=;
 b=iJzT3wHZsmvSSqEJ73BL6c5T2fC3MIC5113CC49r8j8HzBjM3e25FKU8/EWm6txgr7
 zuRHM2mhG0Qdpo9Y4HMgGtYpqSbp6wCDz73CKYQ+B8gK1DKGSIcxJ2h4/dkSqYxTYOeR
 s/NYH/tc2TUSvFjqGBt2vSelkVHGWfVLw4PDitwboW1zJ3dECUY028Gavkml6xhjcZC2
 7y91gYGzo6EA2WX0vcawyUZcqAyx6I8zmI4ScZd+2wXxvNFEqZ/bfe7UX66y3noR7Xe2
 Be/Lb8p6Avd2EGp1TqteKQSspbJ1BHpOGH1D+8roTaLFH/CAU6KvbgXIXKNybiajSRRW
 gI5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:content-transfer-encoding;
 bh=iNmV3oSXyMoZtQW+GupedsZm+fi1ookBEvLMYu2INIs=;
 b=M53FY5PigwlLUA3FQ9FbnIQ/3xU4OBB7J7zMMg1jU62mn2lZ1px9b9zJ/7qQHe6jyB
 2EVSC8LN3PGhCPaoj9/IxoBmuMMN0AFnndu7vlOwcIZOMi1AcxV4XvKWdjM5MdfVzM+Y
 JmmIXJcEgyC9KkDqJJweHg0XFU6h0gdfjt8x5XeHWd2Vy6yh7lNcF7Ml+aschfiAtm/G
 EV+uzA4krvT1ECkpXRoE7NH6ADRufviZIay+o61aANEvTVfuofr3yutw7opCLIuWepB8
 EECbYEJ0ctNMBOEPeXv6kiAF842AdATJtDx5pltUA+dcECRur22bvFDfSXVg4NNez7WD
 7FYA==
X-Gm-Message-State: APjAAAW6PuP9pSYw0m0Zs1Bax7DVpmXKglkb+aFxe4H2Qy85E5phd8fl
 8pE0jw3C7gH66f7SQY1UZroyc1yNPVxnlfPoMZUpM/FRBHY=
X-Google-Smtp-Source: APXvYqx38d98ZikXek8VJe3U3D8gcucH2Rx8RsxF8KpVx4S1FZx15iJ+FqA8yQ57QaZ8qV81VVevGCU4ipsuAkdvQYw=
X-Received: by 2002:adf:dd41:: with SMTP id u1mr12215554wrm.49.1570196498651; 
 Fri, 04 Oct 2019 06:41:38 -0700 (PDT)
MIME-Version: 1.0
References: <CACyXjPy5LL=yj6i_T_W0J=DOXHxHB_D=0-ir60opyEV7ftaQ=g@mail.gmail.com>
In-Reply-To: <CACyXjPy5LL=yj6i_T_W0J=DOXHxHB_D=0-ir60opyEV7ftaQ=g@mail.gmail.com>
Date: Fri, 4 Oct 2019 06:40:22 -0700
Message-ID: <CACyXjPzDX=F2BJX3N7PNMGpTmZCJZ2NU4O9B0uBvyLVKSaQi=Q@mail.gmail.com>
Subject: Re: Has anyone seen a Windows Server return zero results to a CLDAP
 query for NetLogon servers?
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

On Thu, Oct 3, 2019 at 4:43 PM Richard Sharpe
<realrichardsharpe@gmail.com> wrote:
>
> Hi folks,
>
> I have run into a situation where it seems the Windows DC is
> responding to CLDAP request, but returning zero responses.
>
> Samba send:
>
> searchRequest
>     baseObject:
>     scope: baseObject (0)
>     derefAliases: neverDerefAliases (0)
>     sizeLimit: 0
>     timeLimit: 0
>     typesOnly: False
>     Filter: (&(&(NtVer=3D0x00000006)(DnsDomain=3DSOME.DOM))(AAC=3D00:00:0=
0:00))
>         filter: and (0)
>             and: (&(&(NtVer=3D0x00000006)(DnsDomain=3DSOME.DOM))(AAC=3D00=
:00:00:00))
>                 and: 3 items
>                     Filter: (NtVer=3D0x00000006)
>                         and item: equalityMatch (3)
>                             equalityMatch
>                     Filter: (DnsDomain=3DGPJ.LOC)
>                         and item: equalityMatch (3)
>                             equalityMatch
>                     Filter: (AAC=3D00:00:00:00)
>                         and item: equalityMatch (3)
>                             equalityMatch
>     attributes: 1 item
>         AttributeDescription: NetLogon
>
> and the server responds:
>
> LDAPMessage searchResDone(3822) success [0 results]
>     messageID: 3822
>     protocolOp: searchResDone (5)
>         searchResDone
>             resultCode: success (0)
>             matchedDN:
>             errorMessage:
>     [Response To: 5897]
>     [Time: 0.001296000 seconds]
>
> After that Samba seems to declare that DC as a negative connection
> entry and cannot find any DCs.
>
> Has anyone seen this? Does anyone know how to configure Windows to do tha=
t?

Hmmm, according to the following a DC returns such a result if the
filter is invalid:

https://docs.microsoft.com/en-us/openspecs/windows_protocols/ms-adts/249949=
c1-484c-48ad-b548-a31dd0ab2c93

--=20
Regards,
Richard Sharpe
(=E4=BD=95=E4=BB=A5=E8=A7=A3=E6=86=82=EF=BC=9F=E5=94=AF=E6=9C=89=E6=9D=9C=
=E5=BA=B7=E3=80=82--=E6=9B=B9=E6=93=8D)(=E4=BC=A0=E8=AF=B4=E6=9D=9C=E5=BA=
=B7=E6=98=AF=E9=85=92=E7=9A=84=E5=8F=91=E6=98=8E=E8=80=85)

