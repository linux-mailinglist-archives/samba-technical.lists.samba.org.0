Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 23B98770534
	for <lists+samba-technical@lfdr.de>; Fri,  4 Aug 2023 17:49:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=EbHTQSCFUB6jHHtQH1IeeP0pcHWhN2lDrUVxM5Zl5VI=; b=xRMGXnJzviqHn8Tw7+j2F2nSuM
	eZtCxPvn9IPvAlTcc9gZLXqXpnJK+CEO5vn8dzVwG6laOYLNsbzdMTB8s+TqX9SQCr9fp4zed8yhB
	eIjl6vx9iTpkRlTGIOSSN47zHlb/wRLMuNKjFICpkNJifctXhPtixiXfvR+S50vveIJ6Rw93gbBm7
	GJOVH+0sg/XHSlscSCqUFNG8aEKtu3BPQyq00sGYSZ3lgGjnKSTOiUnLfnWyVlGhGw9w34Ld0Lpa2
	Yb6XOmBD8nKisp45srrPMRz9Ba0wWLFTZtTG+dqJ4EKPgQHHdJqqRSt7JtnJGNHR6NykHB+6+yo5b
	t0EBHPKg==;
Received: from ip6-localhost ([::1]:39398 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1qRx3e-009tqo-Mq; Fri, 04 Aug 2023 15:49:42 +0000
Received: from mail-qv1-xf33.google.com ([2607:f8b0:4864:20::f33]:42114) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1qRx3X-009tqf-VK
 for samba-technical@lists.samba.org; Fri, 04 Aug 2023 15:49:39 +0000
Received: by mail-qv1-xf33.google.com with SMTP id
 6a1803df08f44-63cf96c37beso10871666d6.0
 for <samba-technical@lists.samba.org>; Fri, 04 Aug 2023 08:49:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691164174; x=1691768974;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EbHTQSCFUB6jHHtQH1IeeP0pcHWhN2lDrUVxM5Zl5VI=;
 b=G7WQRr6PXVKN1TxvJZsLQpurp8GRxwTZNuW1jNmX0RiqUgW3cPiCakDxDO912RG27F
 NRjZbhKfaE3CxXMIoB6TDK5iGjXauhm8dCJGlpSJ8efPpKm4t3zO2NWmDKuvQJ8HvBEc
 dUO5lordEXXr3Ln7f8oDjRxKxgKVv/YPDUl5/DJ2NhmxP97GmdikmcOnGYVhJ1YLXVXC
 tNbVr5TJrTf2GtESUb1q7N6T4NWI+apYtCcufR3AtroUXHPnaatRQVCfxDEAc9Hz04zm
 hEZ+dRKN+EQKWNgRC5kp7KjcSc+Vb+AVnL2soJ26U3N7C0aMTejFjbVSDooLeReBjyyq
 Quag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691164174; x=1691768974;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EbHTQSCFUB6jHHtQH1IeeP0pcHWhN2lDrUVxM5Zl5VI=;
 b=Yz2wOQ2/F88K6+nE3BpulGnEFdR+u/SIrcj1MZiywyHVwdVj8Fcvmu7Cj6tFL7O0Ts
 plhcjk3gTV8UEgL6dpeKJo+RRKfGCsUg+mhfs+548oeWmeQ9iD0v2ZHnPmYLjNo/yg7j
 8r7qPtPOcv9s8BnfkVO4+izF/kzzvAtVs+YpBgKOj8SXVUfeoFIaU+Q2FzEzoRa2wDZJ
 C7YMNrKVIcr2Tt1GmCS6/242ISmaN91d4txpj2QBJY9XCD5qaG/ltwmtT/jlZI6CnWBf
 879bKl8Z3aNrDyY0/VJPgupwmesuqNEvaIw0IjrcFjIHy/31rF5skhXSn0KBzcl1BZw9
 pxEA==
X-Gm-Message-State: AOJu0YwvWoMK9ihtnbrbBJ+iXJZVRHksriqZgIiqCc3w9GPFTQsqF2OZ
 6bAvu8rsqSdHP/ORcsYR67mh94tq0PZRQPKRwozP19ok
X-Google-Smtp-Source: AGHT+IEbo2lIFdHKVI9xJxVgGCjh/xGDuAUQkVe9uc3DoZHUrl/kaOsYwntY4TGmU9svJ2EvBLQlk8OlOh+/O3JyYHM=
X-Received: by 2002:a0c:b446:0:b0:63c:e685:ca7f with SMTP id
 e6-20020a0cb446000000b0063ce685ca7fmr135433qvf.8.1691164173037; Fri, 04 Aug
 2023 08:49:33 -0700 (PDT)
MIME-Version: 1.0
References: <CACyXjPwLkUOSFWBNnGPnQhRTZCbF7NEr3_9kiY5keMTgaz38Og@mail.gmail.com>
 <19061148-c951-50c4-2055-7bc226b4571f@samba.org>
In-Reply-To: <19061148-c951-50c4-2055-7bc226b4571f@samba.org>
Date: Fri, 4 Aug 2023 08:46:53 -0700
Message-ID: <CACyXjPx0jXOTkqDZ2pEh4DWYCd4KVMJxreDcAsans2pffRYVdw@mail.gmail.com>
Subject: Re: Samba master as AD seems to return 127.17.0.1 as one of its
 addresses in DNS responses
To: samba-technical@lists.samba.org
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

On Fri, Aug 4, 2023 at 8:40=E2=80=AFAM Rowland Penny via samba-technical
<samba-technical@lists.samba.org> wrote:
>
> On 04/08/2023 15:08, Richard Sharpe via samba-technical wrote:
> > Hi folks,
> >
> > I have built and installed Samba master from about three days ago. I
> > then configured it as an AD server and started samba.
>
> I take it by 'AD server', you mean as the first AD DC in a domain.

Yes, you are correct.

> >
> > I now find that in the DNS responses for requests for the domain along
> > with the actual address of the server there is also, as the first
> > address 172.17.0.1. I have not yet figured out where this is coming
> > from but it screws up CLDAP requests when trying to join that domain
> > with another Samba server.
>
> Two things, first, in the subject line you refer to '127.17.0.1' (which
> is a loopback address), but you then refer to '172.17.0.1', is the
> subject address correct or the one in the post ? Second, you say 'join
> that domain with another Samba server', can you please explain that a
> little bit better, I ask because it sounds like you are trying to do it
> backward, you normally join things to the first DC, though I could be
> completely misunderstanding what you are saying.

Damn. You are correct. I must be dyslexic. I just checked and DNS is
returning 172.17.0.1 and not 127.17.0.1. Now I know what is going on,
I think.


> >
> > The CLDAP requests are sent to 172.17.0.1 and never leave the joining s=
erver.
>
> That again makes me think you mean '127.17.0.1', if that is the case, it
> sounds like you have something misconfigured in dns.
>
> >
> > Have I done something wrong?
> >
>
> Rowland
>


--=20
Regards,
Richard Sharpe
(=E4=BD=95=E4=BB=A5=E8=A7=A3=E6=86=82=EF=BC=9F=E5=94=AF=E6=9C=89=E6=9D=9C=
=E5=BA=B7=E3=80=82--=E6=9B=B9=E6=93=8D)(=E4=BC=A0=E8=AF=B4=E6=9D=9C=E5=BA=
=B7=E6=98=AF=E9=85=92=E7=9A=84=E5=8F=91=E6=98=8E=E8=80=85)

