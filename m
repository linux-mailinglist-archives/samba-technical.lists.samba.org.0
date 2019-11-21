Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 38AA7105CE2
	for <lists+samba-technical@lfdr.de>; Thu, 21 Nov 2019 23:53:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=cyNwZE9rOytRQhqliEJXrh4PieLFQbeiMkMI5M8Mw7I=; b=Y76ZgoewNML5HF4iVBxB9lHJjY
	owu112mC65vC/VyzbINNVnlRxwZIWFodtYW+ldyLKwwEgpelkCeyx6QPg0s/ZsxP+wdS2a49sPO9U
	PX54EYPEHogqtHExI0Wrk6KEu7Fe+AJPeWBXw6yHFW0CC8wwik8YioovCl6+HTteYwtwsTZaH38JA
	Gchyd18bRGE0uyvJ0hLRq6xs/ALTV8xSxkS1LEOm9rv//0jtg5/my8+XDmCMJ4/wsJ5VDj3DdB/8o
	mJzHEXbudAzxhqE7k4gTivAy5jPcxMYgSklnN5wFx9LW3m6Sgl3h31PQ6ox+T/UZYB03jZq23GoBW
	FcgxK3fA==;
Received: from localhost ([::1]:44092 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iXvKB-001ymk-Nb; Thu, 21 Nov 2019 22:53:19 +0000
Received: from mail-vs1-xe44.google.com ([2607:f8b0:4864:20::e44]:44170) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iXvK0-001ymc-A5
 for samba-technical@lists.samba.org; Thu, 21 Nov 2019 22:53:17 +0000
Received: by mail-vs1-xe44.google.com with SMTP id j85so3458891vsd.11
 for <samba-technical@lists.samba.org>; Thu, 21 Nov 2019 14:53:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Qe0lNm/i+1Zuryx/xbBtsAuUXC4irRfHZsspcQhief4=;
 b=AG5Gh6ppqpy8PE036CeMIzEWE7ra0SqjvJ6L3giuSwGwoswJFxkDEEKQKHukBQ9CeR
 pkbkJpKYrOFvyXf9vTLAmHyyPIdwuOxrR26k71YZr/VleQ10ybfVewrylGhIHnmuA7yo
 IwasJ62XLpN77PVHSnvVqR/Kr9fLWjSLRqT8MpcZOer4ysSjWgTYak44nUe7gugYzlPW
 MbzFe+KzOQNLDmDmIrRo2EDIECsT9mDgdiKYKu3zanpJEJJwmWv0OW4gEE3IBWB4txcN
 2jnxnfchy/nazPyJ4aDP1AxrWy/F8fuyRdDQAPkWLKfIS6MU0b3wW3K7fEMtJ+sOu2E4
 nNDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Qe0lNm/i+1Zuryx/xbBtsAuUXC4irRfHZsspcQhief4=;
 b=CUAGiVHRIvIkRnfnDM7zfuFDS+A/XW2R+PKvIrDK5VY1Y86/LnuBNQT+Ik8ITQE2GL
 DTcFNLfotfJdC3cRM9xlhzm+9DpYLaMMIjdlmz1rYD5jPV8dpLa0RcCCIrzfqM4liyk7
 uB6x2alnFlXr3E7g5ZrU1hnfLCC/Zafdku0DmIDlkbsXsz/1Tegw6idPDgXaFCejxKpb
 dmhSKvirDEAZWuGId2StWuym7X067F682vz6DvPH0MCxgqZLbB5nmd1yEesaLaat8i0U
 Yulv3V4ng6LxoK97hJJjuQw4clDeSbNsO+OIvYCuZQFDt37z5YYtLYwH//Z/OWnDHUix
 YrlQ==
X-Gm-Message-State: APjAAAVyzbInLVsQ3vxUCPvWLG7zUDpblvIbRH1I/m4YEddof2Bxwtt7
 X0fzQFUufTVgGef9cEMlX+YYfwOxqwEVNLwrTzZ12XFr
X-Google-Smtp-Source: APXvYqyu88JPeLx9Y7iVPPtVeHCsHbjLpE3PrvjjyTC6khfrmgzleh7FhTaeQU0Rx6/sfHqb68O5qUqLKsALRXYdhRw=
X-Received: by 2002:a67:d802:: with SMTP id e2mr8849935vsj.221.1574376785727; 
 Thu, 21 Nov 2019 14:53:05 -0800 (PST)
MIME-Version: 1.0
References: <CAGYhc9=AZmkOjHAGx7rWd=iM6h5BaVohym+oWMWqfNEfNtju3Q@mail.gmail.com>
 <20d3f005503d82862b0ba8856010ae7a8831d577.camel@samba.org>
In-Reply-To: <20d3f005503d82862b0ba8856010ae7a8831d577.camel@samba.org>
Date: Thu, 21 Nov 2019 22:52:48 +0000
Message-ID: <CAGYhc9nN1cf3KD52mJG0ROmNYXDGXuA7c-KML33W+Qec0jOkrw@mail.gmail.com>
Subject: Re: building source3 subsystems and libs
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
From: moore chestnut via samba-technical <samba-technical@lists.samba.org>
Reply-To: moore chestnut <moore.43132@gmail.com>
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hello Andrew,

thank you for reply.

so would it be bad a idea to try hack a build together based on the source
files of msrpc3 and the deps?

essentially I would like to hack a client together to do dcerpc bind, epm
mapper request, followed by bind and schannel setup (
NetrServerReqChallenge and NetRServerReqAuthenticate3) followed by bind and
NetrLogonSamLogonWithFlags.

Any suggestions on best approach?







On Thu, 21 Nov 2019 at 18:18, Andrew Bartlett <abartlet@samba.org> wrote:

> On Thu, 2019-11-21 at 18:09 +0000, moore chestnut via samba-technical
> wrote:
> >   hello,
> >
> > is there any way to individually build subsystems and libraries?
> >
> > for example:
> >
> > the msrpc3 library in  source3/wscript_build
> > bld.SAMBA3_LIBRARY('msrpc3',
> >
> > or
> > bld.SAMBA3_SUBSYSTEM('samba3util',
> >
> > when I try waf or waf msrpc3 in the source3 dir, it does not work.
> >
> > currently trying on a 4.11.0 source tree.
> >
> > I have read through the https://wiki.samba.org/index.php/Waf
> > and tried the samples with no success.
> >
> > Does this work for source3 libs/subsystems?
>
> No, you can't really build bits of Samba in general.  Some binary
> targets can be specified with the --targets option, and a few of these
> work correctly, nothing beyond that has been tested.  So where it works
> it works, but nobody is really working to have this be a general
> feature.
>
> Andrew Bartlett
>
> --
> Andrew Bartlett                       http://samba.org/~abartlet/
> Authentication Developer, Samba Team  http://samba.org
> Samba Developer, Catalyst IT
> http://catalyst.net.nz/services/samba
>
>
>
