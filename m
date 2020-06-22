Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 628C6203755
	for <lists+samba-technical@lfdr.de>; Mon, 22 Jun 2020 14:55:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=b8c5bEUV+tJttKydiD7ivRUhwSnSHXb910zQSrjNnVA=; b=4I7soEin9aXG2SGW+5m3S5jUZZ
	xm0fFFleTLKQu3loe/bnOpfmf6XTEOeDgUJvNuGPwEU9dRrTUw5NpRlAW7wB6JHgV7NE/gVoLXsmR
	RSVLrfOkNHfcngctjn8/9H54R81DZ8j6fvxdytdMP75aNHduAGz9IzXGyVq8fL4vBdnttDmGmf8ae
	r+wXnq/c6evEweHCUuhFbu3bxa5X7olprq/sj8GF7miyufemfmaNCCfM3yqciOb6o1Nvxn9Om6Mil
	3Sc46YIA5SyWy0cSRcxskFQqSlGVLcBYUrepKXaPOStVy3WYRwBYUvh2UJPGN7vjrCHZb0Jqwvqx5
	dN3b1QKQ==;
Received: from localhost ([::1]:44016 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jnLyv-001o0B-D3; Mon, 22 Jun 2020 12:55:25 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:46587) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jnLyn-001nzL-Fd
 for samba-technical@lists.samba.org; Mon, 22 Jun 2020 12:55:20 +0000
Received: by mail-ej1-x62b.google.com with SMTP id p20so17833627ejd.13
 for <samba-technical@lists.samba.org>; Mon, 22 Jun 2020 05:55:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+YunT9EGpyiKb/ZPi8hl6hgj2Hf7ZIppV2I8fsEiVvc=;
 b=AiaDiEX0eGMyWf6hlb96ADiZOrNNGv8ccLRujvXk3WnCVRdhYCREPSppCQu4otJjwQ
 cv8CGXQbJACgg+T6MTne+gtWPneqpgYVki6L40gbuqJTA5DXTyltePACgESQU9zKOVjx
 Uxnlvuq5aSlLrcV0NaTj1HI/J7HpyxrDPSk84tQa0jCPgK+mPbz2iIZQDoKOW1nqY+lQ
 Au5+zagBfNfmi1HY2y79DDn1z8Jl9uXmEW+z8sA8k9IuqkjKYyQYj96y/z5mn0uoXpiq
 lsyQ5jOd33EsyDRJlj5qpcKwY2VGKm00HL9YseUmFIZO/B6r6x7tGP53GcNxRJYobElm
 1kQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+YunT9EGpyiKb/ZPi8hl6hgj2Hf7ZIppV2I8fsEiVvc=;
 b=ePn/UfTkpR+DWmNlwN5oyIrvToGrk8kXG7+KzeAbuclAF24d28b0J94GDLPgd78QY+
 oloQHdBz4nVOnhWN1uX9vv+bhHfgGewKTSFHJ+LHqp7bE7Sbk7WDVTLx2TMO1kLt/xXo
 TfYwiK5n73xuHAyfHiAt8qJUMQKjSaSFFEGXLs5iAlFZcKK2M+irNnL5RoT/IfSbZfLx
 IAVGUyB3pBQmL+7MzBZvopwtjUn8wdKUGLlbXVUwuPDwhw6zHSQIGpoaghJ638Qnk+a2
 ZsqhETp/PT1tWmGGSdginch0s+gju0r1vm6dI45qhILSIQ2p5fMdQ2AMk7Ayebv4NBrs
 00Pw==
X-Gm-Message-State: AOAM5324LJc2fFCmmEQe6p289t95jY+p7twZiThBZfvpmnKu6l7mJBcW
 I0C/77HppkYpy5gA6L3ScPnn0YJVaD4Je1WCypKkt0RPTdI=
X-Google-Smtp-Source: ABdhPJxRH9yIc7wLGKBS0eKAw/s5TBfob0Ir2EQ6m2xg2NnzHdNCucOv5hK/FS71wZIfo2dj2xpEb0iseRHMLGUc2X8=
X-Received: by 2002:a17:906:198d:: with SMTP id
 g13mr15379970ejd.281.1592830516838; 
 Mon, 22 Jun 2020 05:55:16 -0700 (PDT)
MIME-Version: 1.0
References: <CAH72RCU=2HPWJHjgtMFx7wM061n-Jjo7aYRinxLPDtq8fo-OrA@mail.gmail.com>
 <20200622100601.GK3036357@onega.vda.li>
 <CAH72RCVF2NCzTgZim1V7D8MfmZed00+ujKydLw4eyxrLEsrC4w@mail.gmail.com>
 <20200622123813.GL3036357@onega.vda.li>
In-Reply-To: <20200622123813.GL3036357@onega.vda.li>
Date: Mon, 22 Jun 2020 15:49:59 +0300
Message-ID: <CAH72RCVv3ZSCxDOtJLeR+kBmNVYRR5NaC2nyN3r8jJQWq+kL9A@mail.gmail.com>
Subject: Re: GSoC: Week 3 Progress Update
To: Alexander Bokovoy <ab@samba.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
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
From: hezekiah maina via samba-technical <samba-technical@lists.samba.org>
Reply-To: hezekiah maina <hezekiahmaina3@gmail.com>
Cc: samba-technical@lists.samba.org, "abartlet@samba.org" <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Sorry, I hadn't seen it. Thanks

On Mon, Jun 22, 2020 at 3:38 PM Alexander Bokovoy <ab@samba.org> wrote:

> On ma, 22 kes=C3=A4 2020, hezekiah maina wrote:
> > Thank you, Alexander.
> >
> > In the first image, Sites Management and Time aren't present, was there
> an
> > issue with them?
>
> I can see them fine in the screenshot -- maybe you need to scroll to the
> right side? I took almost full screen 1080p screenshots so they aren't
> fitting into the screen on that improvised page.
>
> >
> > On Mon, Jun 22, 2020 at 1:06 PM Alexander Bokovoy <ab@samba.org> wrote:
> >
> > > On su, 21 kes=C3=A4 2020, hezekiah maina wrote:
> > > > During the week I worked on the following:
> > > >
> > > >    -  User Management
> > > >    - Organization Units Management
> > > >    - Added the patches Alexander recommended
> > > >    - Changed the UI of components written in Week 1 & 2
> > > >
> > > > Next week I will be on working on the following:
> > > >
> > > >    - DNS Management
> > > >    - Forest Management
> > > >    - Group Management
> > > >
> > > > Last Week's changes are in the develop branch of this repo:
> > > > https://gitlab.com/HezekiahM/samba-ad-dc
> > >
> > > Thank you, Hezekiah!
> > >
> > > I made a short gallery of screenshots here:
> > > https://www.samba.org/~ab/samba-ad-dc-cockpit/
> > >
> > > The code now builds and works mostly fine on Fedora 32 without any
> > > additional changes. I had to disable SELinux on the system but this c=
an
> > > be looked at later.
> > >
> > > --
> > > / Alexander Bokovoy
> > >
>
>
> --
> / Alexander Bokovoy
>
