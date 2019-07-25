Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BCF97586E
	for <lists+samba-technical@lfdr.de>; Thu, 25 Jul 2019 21:55:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=z5KkkiL6ERJvT0HD4fPP02fUkT3S/jvcEMI8g1dTC/0=; b=M8vdXEXnqErgTytUIGougHk1V5
	H23SQYFjvKJa89aq1aMceIPCXZkK2kz1M7A7MSemxuu+FwtHQ+huioPk7DCHzk+oxOr8JPEBz31st
	n+uDYN2LS7veVxBi39Eh5QdjdmJ1Df6sJyaZZGHG3Asz3yXiJPoKjBQHB/yINU0/xEl8YwN7TJNoG
	RFIMQQy4fxpLNvMfcT08HsV50L3I+Z3LvBKxIl98Xit9vjCVxtYf1NGHa9AJe/qZ1knpogkmBKqN3
	9c10qR27tLZOGH82wspdbUicLw0/Qz/oYObNTtQv92aJXDJmBhGD/SwH+D1aowCc4Fctq7aj8joNZ
	Qhg9fjBA==;
Received: from localhost ([::1]:23616 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hqjq9-000Kmt-2F; Thu, 25 Jul 2019 19:55:49 +0000
Received: from mail-io1-xd2f.google.com ([2607:f8b0:4864:20::d2f]:35719) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hqjq4-000Kmm-0q
 for samba-technical@lists.samba.org; Thu, 25 Jul 2019 19:55:46 +0000
Received: by mail-io1-xd2f.google.com with SMTP id m24so99887850ioo.2
 for <samba-technical@lists.samba.org>; Thu, 25 Jul 2019 12:55:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Dusr0vAaW5K61r5dK7VZdF/WKWBEiZ9OhsjakRiVQPo=;
 b=JLBf4yXhfwUNDmmJsz3qOSlfquY77UqPcMb/FSIAEcPDrB3zjOA9bVLaNV9iQHlqxD
 Jc/1L7yyXS+BICFra3HCb/nHaLkawdpafMk9qE+KtB8xcWDpYo+TUDVRyWs4CmNQQSEH
 j4U3V5LpkquGbsKGKwun2uYkwiyOAyWp+v7jwSktBIgbmp93MgH6LbuZYPuWXeKLtWbd
 Vj9krOg846BAqkK7bRm4O9TWqQGW9a72Nb7BUOfNHh6Uet5Q2Sd6rTycRHy8qH5pM2l9
 tW0eEneXpsN282+0sZSWYyfH16190NVAfsq3lpFKajNGU3eDF+9SGHokXAXCOhPvh3pY
 RAWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Dusr0vAaW5K61r5dK7VZdF/WKWBEiZ9OhsjakRiVQPo=;
 b=hUb+MhXxNBpQpaN8gskAwO8hS/NMakzHpxEGGwDck4rxQuukKdkmp1IRG2x8EK4ojC
 TVmOWhkAhj9ZALvUEX+ogOg3dLkwD+bHTXypyAl2ImpcR86T2EVtmDP7zSbyLysDFO/t
 Pla05fYlALp2vHpzHZprZiJKiJ/HeCVsR7oQP2PBMJQ8FLAvziO18VXTwnyNwnziIlbt
 Gf96wxyCmvBjR3IsbCLFWTBaUeYyQjs2HBlIoMJMLjSQuYmuYfgjEyD1h/bzaKutYl7x
 QmmzZhwfoz6uxiQO32gq45U6A4PLMf+whZF3zi9u5FmuCvfy+4QEWrLo9K1ZxbrF6nhh
 45ww==
X-Gm-Message-State: APjAAAX1Sush5GuicMJW0F8N+dfpvcYcx0DHtxruy5sL6Mj/YEZXuYs7
 Le1yuGtvn8cT3JjY3R3ozvCGqvwvnaQwSTlvyKRhLA==
X-Google-Smtp-Source: APXvYqyKsl3jfHnooRNByV5eSbXFz/KUSypSuEGHEiHMVewF/Y6APwrxQhecVhjDDmKRL4rc2yTXThv2CWhavRDrFGg=
X-Received: by 2002:a5e:9314:: with SMTP id k20mr65938129iom.235.1564084542075; 
 Thu, 25 Jul 2019 12:55:42 -0700 (PDT)
MIME-Version: 1.0
References: <20190710225121.GA142072@jra4>
 <CAN05THQ65himSVSYpzypUwDeJoaV6FPAhQpV4NEeCT3fRaBxFg@mail.gmail.com>
 <dc0d693a2caf311097cf9a0ef8df3add01117ba7.camel@samba.org>
 <4efb83c3-6df7-af2c-798d-b4ec681562ab@samba.org>
 <8219d257b2fe68717939d2f41566ae669fab8466.camel@samba.org>
In-Reply-To: <8219d257b2fe68717939d2f41566ae669fab8466.camel@samba.org>
Date: Thu, 25 Jul 2019 15:55:30 -0400
Message-ID: <CAP5+4qdrwPjgb6TLa2nXJ8HBibR2t0T=of17_pXrwUjAyM2+ow@mail.gmail.com>
Subject: Re: Turning off SMB1 make slashdot and theregister !
To: Andrew Bartlett <abartlet@samba.org>
Content-Type: text/plain; charset="UTF-8"
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
From: Sonic via samba-technical <samba-technical@lists.samba.org>
Reply-To: Sonic <sonicsmith@gmail.com>
Cc: samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

I'm pretty sure my Oppo 105 Blu-Ray player, which I stream video to via
Samba, can only use SMBv1. There may be other such devices with this
limitation as well.


On Thu, Jul 25, 2019 at 3:28 PM Andrew Bartlett via samba-technical <
samba-technical@lists.samba.org> wrote:

> On Thu, 2019-07-25 at 20:18 +0100, Rowland penny via samba-technical
> wrote:
> > On 25/07/2019 19:59, Andrew Bartlett via samba-technical wrote:
> > > We can't do that until we provide a reasonable way for SMB1 clients
> > > to
> > > connect, probably via a SMB1 -> SMB2 proxy based on the NTVFS file
> > > server (where we had such a prototype until very recently).
> > >
> > > It won't be perfect SMB1, but needs to be enough for basic
> > > operation.
> > >
> > > I'm quite convinced Samba and SMB1 are critical infrastructure in
> > > many
> > > places and while we may dislike SMB1 for good reasons the
> > > alternative
> > > is to force such installations to rely on what will in 2 years be
> > > an
> > > unsupported and therefore soon an insecure version.
> > >
> > > I'm not comfortable with that as an outcome, so we need to provide
> > > them
> > > a way forward.
> > >
> > > Andrew Bartlett
> > >
> >
> > Andrew, why do we need to keep anything like SMBv1 around in the long
> > term ?
> >
> > If you do an internet search, you will find blogs from Microsoft
> > employees nearly begging people not to use SMBv1 and the fact that
> > new
> > Windows 10 installs have SMBv1 turned off by default, leads me to
> > think
> > that it wont be long before it is totally removed from windows.
> >
> > If SMBv1 is removed from windows, then the major user base will
> > disappear, so are you saying Samba should keep SMBv1 around just for
> > Unix users ?
>
> I'm more thinking about the DOS users, the OS/2 users and the Windows
> 3.11 users.
>
> > If you are considering the Network Browsing problem, then there are
> > other ways to do this.
>
> It isn't browsing.  Samba is the glue that holds a lot of things
> together.
>
> I'm sure we will find out a little of this in a year or so, when 4.11
> starts to be seriously used in production.
>
> Andrew Bartlett
>
> --
> Andrew Bartlett                       https://samba.org/~abartlet/
> Authentication Developer, Samba Team  https://samba.org
> Samba Developer, Catalyst IT
> https://catalyst.net.nz/services/samba
>
>
>
>
>
