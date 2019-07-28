Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E8E777EB2
	for <lists+samba-technical@lfdr.de>; Sun, 28 Jul 2019 10:53:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=um5nBqD2sT65GQ7pPmMzXZYVPnEy5R5SmqtNG8RbjzM=; b=5f8EIq0ToH55LD+eBn4x/MONsw
	2Te6yclLCmejQdSyeCxqEX56StB4n63jdpfO7RX4N9Nd+z6Nntz/VMfqTAOagYBDpgjAn24bFGIS0
	b329kDTg/XM6L53IbvocI/7TLNaoZi4VywJuJkmJy55KFn4nQLlFa8lwYr4YG6beX8KWTwiqic5XI
	WURYLUtI2qbYB7a3QAXwt8BgyO/q635V/2xpLMuCAXVE8OhZMzYMTtyGr7bTEXMPuC9KJ7+kervfg
	GYxtXinSpRjyNhklpffSECNr8Eh3YMpiLhilmA2jtxm35oC3RYXsUC5+WqA1m/GyKhhyrB67uBsbi
	YPa3CTPA==;
Received: from localhost ([::1]:60824 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hrevH-000cNf-Am; Sun, 28 Jul 2019 08:52:55 +0000
Received: from mail-io1-xd30.google.com ([2607:f8b0:4864:20::d30]:47066) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hrevB-000cNY-1Z
 for samba-technical@lists.samba.org; Sun, 28 Jul 2019 08:52:52 +0000
Received: by mail-io1-xd30.google.com with SMTP id i10so256655iol.13
 for <samba-technical@lists.samba.org>; Sun, 28 Jul 2019 01:52:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=um5nBqD2sT65GQ7pPmMzXZYVPnEy5R5SmqtNG8RbjzM=;
 b=WOFvIPq+AJdkFOEaXVg6KkrERDwBtYEQPFiHFANRRYeKx8UYa9c69TPDnN/xTtlABu
 Lnc0iESv7m5m8cWbBy00T6qbGpV8ApRblnbAHbCHbli0vvi2tIEvpfakcw8vAt9cgWd+
 TCz/A+XYP2xSVH+WJehvyKPmi7lTgbT/xou/kb29VrIjqvj2leJdT0cQ7X1UODhkGZge
 XPkCIqhFTqowZ1ZRxej3cpZYTIJ5dOPov+Uh6eqvgeLmIiGPEIqD7/6znrq1ruR+tc9r
 5k7Xnll4tnm8AhpscgTFTe4yvrfAObzGBX5H4rawGwWnwpfrzq/lusTkqhwWlNDjf///
 yYbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=um5nBqD2sT65GQ7pPmMzXZYVPnEy5R5SmqtNG8RbjzM=;
 b=sHVATgnGX8s5RuW/TcUcxeFg4Nm682KzW/Vt7LuReV0QGQUNLWmNW0t9KMFtBdnwlZ
 GgsMqCIpSggcrZq2/1NvITcy06NEAkp9jo26oeivf6CxlgI66TUd2im7XBp6tZfZZDP5
 VPMJo72y86w9hjHxHxrTFRqG+GKD9N98fqvJMym++wnQV8vpiy7WljVVoX7/X55AwJqB
 1IAht96UUXhQbN1ah3Y/hTdzlA4sN4FM6MxoawY4cFv93D5fHlUEjYI0pqZbBkuzOlrL
 amPXcig4a+AlnZvZH2BZffnJQKbCNHPQ7mj7Bqrum8Mp2pBJLngApRTe1FQxXzQlhV5A
 SsnA==
X-Gm-Message-State: APjAAAXvisaSFEA4BNnEY6qhAuqrXn5VlOePfgXfupDGIYLrfnlMjuBy
 S5UKMRCm9XZWZfBj3EwZXoezC6IMiFhWsiUGriM=
X-Google-Smtp-Source: APXvYqwgl74klB23Uyzo0dncoWWFLba5Zr9ZjYCfn6gy5gobEkvwzrwgyIWT6+bhfzfySc2DsPAMFdtW5Z37s1V0TDk=
X-Received: by 2002:a5e:cb43:: with SMTP id h3mr54256085iok.252.1564303965435; 
 Sun, 28 Jul 2019 01:52:45 -0700 (PDT)
MIME-Version: 1.0
References: <20190710225121.GA142072@jra4>
 <CAN05THQ65himSVSYpzypUwDeJoaV6FPAhQpV4NEeCT3fRaBxFg@mail.gmail.com>
 <dc0d693a2caf311097cf9a0ef8df3add01117ba7.camel@samba.org>
 <4efb83c3-6df7-af2c-798d-b4ec681562ab@samba.org>
 <8219d257b2fe68717939d2f41566ae669fab8466.camel@samba.org>
In-Reply-To: <8219d257b2fe68717939d2f41566ae669fab8466.camel@samba.org>
Date: Sun, 28 Jul 2019 18:52:34 +1000
Message-ID: <CAN05THQZVBic5xhXNVixp90UfeWz1rt=mF6F0ZXN6aHFCkZmKA@mail.gmail.com>
Subject: Re: Turning off SMB1 make slashdot and theregister !
To: Andrew Bartlett <abartlet@samba.org>
Content-Type: text/plain; charset="UTF-8"
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
From: ronnie sahlberg via samba-technical <samba-technical@lists.samba.org>
Reply-To: ronnie sahlberg <ronniesahlberg@gmail.com>
Cc: "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

The solution is simple.
This is what I propose:

Next major release SMB1 is dropped and the code is deleted.

Some people do care very much about ms-dos / os/2 and amiga 1.3 users.
These people can fork
samba and continue to support a smb1-legacy version of samba and
backport all patches from upstream to this
fork. Volunteers?

Alternatively, ms-dos. os/2 warp and amiga 1.3 users can still
continue to use old and obsolete versions of samba
if they are not able to fix their clients to use smb2.



On Fri, Jul 26, 2019 at 5:28 AM Andrew Bartlett via samba-technical
<samba-technical@lists.samba.org> wrote:
>
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

