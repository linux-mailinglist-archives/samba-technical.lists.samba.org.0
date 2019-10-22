Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BB2BE0ECD
	for <lists+samba-technical@lfdr.de>; Wed, 23 Oct 2019 01:55:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=5fcem6CoYGEMxSSvgALwzL+Vb8GNTwDSZuDt+CUbXFE=; b=fL9sCvNjPpgmsH/FBq3vNCt/Dn
	oZtQCDMmATJHjwYZnpSfs6mEgnTwP9shjb4bR/NX3adFtEw1dlEmafTIfYCgMRA42zdCzaWSp7kN3
	hAagtaqwmh4j/4UGWTks2xWP0zX/xCSv2kwn991fu8Vr/wvJDsqevDta5Jj5j8UDUZJuQfMg5weLi
	81xkx4Enhr8cY396YjJVcmFrUBC34Xx74MxhVz02SMXm06Rn+M+/caLruhc60f695jSCSfXN4KUVh
	w//eKV8QP86j1Mj8hkOQBoKZeYIsqNx3ntgerk421wg/HXyx1xm1WK6fS65niKoLXK+SB7WY1DIeP
	tGRf/q7Q==;
Received: from localhost ([::1]:22614 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iN3ym-001Yo1-Sd; Tue, 22 Oct 2019 23:54:20 +0000
Received: from mail-vs1-xe36.google.com ([2607:f8b0:4864:20::e36]:36206) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iN3yi-001Ynu-3g
 for samba-technical@lists.samba.org; Tue, 22 Oct 2019 23:54:18 +0000
Received: by mail-vs1-xe36.google.com with SMTP id v19so12568052vsv.3
 for <samba-technical@lists.samba.org>; Tue, 22 Oct 2019 16:54:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=5fcem6CoYGEMxSSvgALwzL+Vb8GNTwDSZuDt+CUbXFE=;
 b=cuRLT8Fayf7g4NKSUcCJvBYqwB0JI6BUy+AcX5P8klf60Mu4jt/MI9DL+IUBoua0Ug
 lVMk0rXUaCWkSnUpejFKBdW5wGPonzyKzTPCq6JVwCHH1vD8Be1NyI6QOJ766I2WTykX
 sho3E2DQyNob2cDkjyDwmXgJi8cd1f0NIFhutAlbPy/HgtW57NBcWMJ6AnPBWpf95GbC
 fqkoSJdC3sPukjjcG+k9+pTNELe0mASs/EJtVbq70n/keYga2EYwl12f8jrXvnq9Pq4+
 1O3EYQpCpCvMTPYpSrfNPYTlsV/89OSTTW1RIBfHnBqPytFXI8j/YmbdOwuKt6/SYyo5
 GsEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=5fcem6CoYGEMxSSvgALwzL+Vb8GNTwDSZuDt+CUbXFE=;
 b=HmZc0l7aStaMJhtVGvNDfBxoeXCgnagBmBiMw26xG7+TsmAM9/lshuPu7dU4DvKmQS
 vRgLWytISTS2bFRfN8vSsxW9nFMUrZ7LHRwsA22FmFvXfzSFJ2N4fyx9GB/BXmdDTdJ0
 FXwUUR1t5fWAuHuvlrMhpSd5H/aWYPno21wuTSrcHlfq1kxjCKovTlkkmKCuv1vMBtt9
 MudIJ1TNPrCoM4Q+Z80SzYJVx+n0VTwPxbIuBc8nJAs+t9/2/VPIpGfEThYtKGc63Sdi
 h8Y9quh7zjvR+BMZCahj7wyznyHfIdN841z5FSTKhy3h1jUgBKTXdyc52oBsCEDreMSm
 zgtQ==
X-Gm-Message-State: APjAAAXq8eak9jLB8UsLlg0I263SWOf/ctLOwP1i/x7NriFjs8YV09+2
 LeU3TusfJY4Gx8Im/60xVm3lpOXz43gJKozBO4shVA==
X-Google-Smtp-Source: APXvYqyW6prxMKNyx0j08x1p1uyoLRwyyDsim3oghE+qm9iQ/gtlQZ9Fq/wRsHSYMLfu8YEDARapdSw2c0LxrjHhnRA=
X-Received: by 2002:a67:ec8f:: with SMTP id h15mr3702006vsp.66.1571788452022; 
 Tue, 22 Oct 2019 16:54:12 -0700 (PDT)
MIME-Version: 1.0
References: <3ee51a4a-c102-df01-8e52-cf8ea702194f@samba.org>
 <CAOCN9rw1g-N8iAV2z4S=-6Sx7GRQ_vACPcy-pOvwrLys_OykVg@mail.gmail.com>
 <ae8f0a7928a7015d7abfa9679de2f5f4d23b4eed.camel@solinos.it>
 <3255b7bf-d793-66f9-10de-c52f0c07ad28@tranquil.it>
In-Reply-To: <3255b7bf-d793-66f9-10de-c52f0c07ad28@tranquil.it>
Date: Tue, 22 Oct 2019 19:53:58 -0400
Message-ID: <CAOCN9rwt2UN1EYN586zEjtPTWVHz7TKoc_xNgcpcz7d1ivvBfQ@mail.gmail.com>
Subject: Re: [Release Planning 4.11] Samba 4.11.2
To: Denis Cardon <dcardon@tranquil.it>
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
From: Nico Kadel-Garcia via samba-technical <samba-technical@lists.samba.org>
Reply-To: Nico Kadel-Garcia <nkadel@gmail.com>
Cc: samba-technical <samba-technical@lists.samba.org>,
 Dario Lesca <d.lesca@solinos.it>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tue, Oct 22, 2019 at 2:14 PM Denis Cardon via samba-technical
<samba-technical@lists.samba.org> wrote:
>
> Hi Dario,
>
> Le 10/22/2019 =C3=A0 12:17 PM, Dario Lesca via samba-technical a =C3=A9cr=
it :
> > Il giorno sab, 19/10/2019 alle 12.22 -0400, Nico Kadel-Garcia via
> > samba-technical ha scritto:
> >> Cool! I just managed to get 4.11.1 into my published CentOS 7, 8,
> >> andFedora setup at https://github.com/nkadel/samba4repo. This setup
> >> usesHeimdal Kerberos, which eased the gnutls requirements and made
> >> CentOS7 easier.
> >
> > Thanks Nico
> > How can use your great work?
> > I must rebuild all on my system (Centos8) or I can use a binary repo?
>
> I just published RPMS and SRPMS at
> https://samba.tranquil.it/centos7/samba-4.11.1/
> https://samba.tranquil.it/centos7/samba-4.11.1-srcrpm (note : freshly
> baked from the oven, not yet thoroughly tested). You may try to rebuild
> the srcrpm on CentOS8. I've not yet had time to look at that new CentOS
> release.

RHEl 8 does not include "quota-devel" and some dependencies such as
"libtommath", unless you build them from a setup like, say, mine over
at github. You are certainly welcome to any useful parts of that.

