Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 2104E7871DE
	for <lists+samba-technical@lfdr.de>; Thu, 24 Aug 2023 16:39:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=C8AJ0A9frxC6kI0j/tJGUw/ZJrKK9TCLkXKt6Tc4zko=; b=nobBsngNeBjpcj1+CR0jcGCaUG
	+jSkuT5o4f+/cZ6hGb4gGViFIU0ns/cdUijePhT8idh4HI/GLpTRAm8V391s7xbP7nAnRdsY9ESib
	qFoZBys6n73MRCSzg9aqIOYf0lKjoH99r9VASoGLH2Q/ypS7sSGFOUYZmJCVnAw7Ti2a92lhg7EIG
	dy0zrxStEhwoCk82ficHvfuu2ywxTcCjkFMJp1ue/D0YT9xsF/fJpeB6wUXpUR9b+Ci3A+HR+39+L
	y+fg0FWdlhHW6Ii1idCZ4JOr6GKK/q8WW4+WL5IR8zt2bg1T1ZEt61HrN1wlX2mnSGd0xCPBW6bcR
	FMfahiQA==;
Received: from ip6-localhost ([::1]:44978 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1qZBUJ-00ELC9-Sc; Thu, 24 Aug 2023 14:39:07 +0000
Received: from mail-qk1-x733.google.com ([2607:f8b0:4864:20::733]:42025) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1qZBUA-00EL2k-NP
 for samba-technical@lists.samba.org; Thu, 24 Aug 2023 14:39:04 +0000
Received: by mail-qk1-x733.google.com with SMTP id
 af79cd13be357-76dbe263c68so46632185a.0
 for <samba-technical@lists.samba.org>; Thu, 24 Aug 2023 07:38:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692887935; x=1693492735;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=C8AJ0A9frxC6kI0j/tJGUw/ZJrKK9TCLkXKt6Tc4zko=;
 b=avRfgqfs/7QKWm+sMAiiB3ZOzZ9A9qKa32k5uRXfnNC9X8a1rzBp85l5oSsl2DfbIN
 MARgH8ZjiPZrb8pDUcpWwdwT0qElYvvcleJ5O2/JVwJW1fvDZT5LlPO6/8UZC1fJhyfR
 X+Y4Qt+F+qE823oN0/WwUyBT7IpZIDOWH3L2dRgsUjwc2rv3lbtOE2yGH0LHHySvLG59
 lg+h0TVShTJq+7qCNQRB8TpYPkTV1IChPzg1LLrOeuMFzuGxsa2AfzgIRT27cajeK02D
 Ra64Ak9RdIgWFlh7VrvCkkUMtqw8dNXeDRhMvDFmj3wXoWcCHULm1rmZVOfLXZgCON9p
 UbiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692887935; x=1693492735;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=C8AJ0A9frxC6kI0j/tJGUw/ZJrKK9TCLkXKt6Tc4zko=;
 b=BZzi4ZAsRGLWekipdWpoVFGdmvnIqL9mAnxMP8IkrbefXP/hvajiAG5quFzbRga0Ps
 IdobP4FvqlHEIzwkwzCOLotg0o0U5K02FnZlSfVd5U3/NTQ+TM8BDG4BZd3J+YiHpUN4
 kr77rdwU0xgMIG5bBDK4pVVkDv4fCECEoXMBhu5UDPmH0XZ4Bb1T7EKdxqYV3nfjYGNo
 QymR9qo9cuFYu2Kgg+mwNikluTXCvk3Qg06BAm/mt1CLxwlbw7cy9gx30E4WCrzzu/70
 XuO56s8vdGzlEc3Nm99DqavzNk1FjrKQOn6TlrUfF3OrAkp1wDOIgYThHS6FetgH9HUv
 JxTQ==
X-Gm-Message-State: AOJu0YxJobmtYZJm4+sH0bOAz2GVI6vB/QZMY5Rsqv/7YKRkhdrOr/Hw
 jMOZadhcXcc1Q8+0h30nEPt26iaEjP/Rx8IN19M=
X-Google-Smtp-Source: AGHT+IHaamzwf9TyAcmycyviD+Zd5z984YfAvOEoBvdiDpTTuE2RZQG7fiQsPJMf3TpHfEkVYesbhTboXB65a2T7eiM=
X-Received: by 2002:a05:620a:294c:b0:765:890b:7586 with SMTP id
 n12-20020a05620a294c00b00765890b7586mr19514417qkp.29.1692887934968; Thu, 24
 Aug 2023 07:38:54 -0700 (PDT)
MIME-Version: 1.0
References: <CACyXjPycDO5qNT=ibbS=4Wqvua+tDVtn3dhQ-dw1gJaktMOj6w@mail.gmail.com>
 <cf543da39afc8785f1ad3ccef17097868548c039.camel@samba.org>
In-Reply-To: <cf543da39afc8785f1ad3ccef17097868548c039.camel@samba.org>
Date: Thu, 24 Aug 2023 07:35:39 -0700
Message-ID: <CACyXjPwqcrMmevR3__EDXVSUzJkKd6TBxGcOB5FE=94FcjPUsw@mail.gmail.com>
Subject: Re: Does the Samba AD functionality support setting up a Samba server
 as a DC in a subdomain to an existing forest?
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

On Wed, Aug 23, 2023 at 11:51=E2=80=AFPM Andrew Bartlett <abartlet@samba.or=
g> wrote:
>
> On Wed, 2023-08-23 at 22:28 -0700, Richard Sharpe via samba-technical wro=
te:
>
> Hi folks,
>
>
> I want to set up one (or two) Samba DCs in, say test.qa as dc1 and
>
> dc2. There seems to be clear documentation on how to do this.
>
>
> Then I want to set up another Samba DC in subdom.test.qa as dc1.subdom.te=
st.qa.
>
>
> Is this supported by Samba 4.19 and how would I go about doing it?
>
>
>
> Not as a subdomain in an existing forest.  Only as a distinct forest.
>
> I started the work but never finished it.
>
> Sorry,

What would it take to complete that work? Not that I have lots of
spare time, but ...

--=20
Regards,
Richard Sharpe
(=E4=BD=95=E4=BB=A5=E8=A7=A3=E6=86=82=EF=BC=9F=E5=94=AF=E6=9C=89=E6=9D=9C=
=E5=BA=B7=E3=80=82--=E6=9B=B9=E6=93=8D)(=E4=BC=A0=E8=AF=B4=E6=9D=9C=E5=BA=
=B7=E6=98=AF=E9=85=92=E7=9A=84=E5=8F=91=E6=98=8E=E8=80=85)

