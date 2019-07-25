Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 955697591B
	for <lists+samba-technical@lfdr.de>; Thu, 25 Jul 2019 22:48:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=YfURQr+pRWlvtvJESQUNM7GwV56fAQXsPFxzL3u/mXI=; b=Sz4vWkACOeiallXnx43aIJGo1Z
	uLpPkfFYM1gsm71oBjYq3CyLGUnLH37wbZc5MhWIkPawUtNTOtPcdoADd+hUjdGgVYfdRly5b4JMQ
	9V4wbS3WhSDxhF4V6WYeVFBaj7PiJHl4IVMxqEtUfn3u+yrk2wvYvM4yRF/Vb9GMh1oZ2GHSHEKZP
	recX5ganRhYrzvqi9FSoa77iwwbIY/li6pYq/2ig/SybOnvhAhfG7RSamLhQQqSptTGQZfSe5Yqid
	FgmBVtytMkIGSij8fRa+xQ/P4P85e/BbLhsW2E3G/bedh0wLp60f/+QcXS1Xsr/IvOEdufNDit+sU
	rxx3Ak+w==;
Received: from localhost ([::1]:30196 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hqkfB-000Lj8-SS; Thu, 25 Jul 2019 20:48:33 +0000
Received: from mail-io1-xd34.google.com ([2607:f8b0:4864:20::d34]:34705) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hqkf6-000Lii-Bt
 for samba-technical@lists.samba.org; Thu, 25 Jul 2019 20:48:31 +0000
Received: by mail-io1-xd34.google.com with SMTP id k8so100202830iot.1
 for <samba-technical@lists.samba.org>; Thu, 25 Jul 2019 13:48:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YfURQr+pRWlvtvJESQUNM7GwV56fAQXsPFxzL3u/mXI=;
 b=HoqXfacNAV7kDCi8UsIzkmx3flgVX8pKiEwcn0IymZx2bD3rH7YxhH7xv97l7liT/s
 GgbaxapkpKYMdgWFCuaDutlJrEqvWIgpCDotT1i2YFCwChVWyFBFkWPzhFbjuT1XbitW
 Ayy9uTfzQEvetvkLrlaI7Go0Rr/HPBTjVQJGSExKkG6YG3zlN/8I9R6OqZVXAOatdRsw
 7ctF0oX3ufvPntVdRnW46cumzoE8wHAFVK2y5r+Jho9edBYd94jyHQO3d2y6FO17c8lT
 doC7+SMRzFgNX0CkUHBP6BM/TT+w21wrJaFhhPjN/Ona8eNujKJ5LEamEitUfSYG4tUw
 z7Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YfURQr+pRWlvtvJESQUNM7GwV56fAQXsPFxzL3u/mXI=;
 b=Vr8KxzimtcI2cOJw+Wztdv9dmO+fLFEe2AX5KEeZWRMo5ieP5v89TxavO2vblwd4g6
 goHipris86nPKAOMFLkAgZgwIhD0msteUbiqaRheKHLY8RjM+fevxcA94IS6FlXSNYw5
 UdSX9EE5BLX/NAie35iEjAZ0pdZphjS4+UM/DOOujMwFCyLPVYPHlwWAoXIl3E8KeBYZ
 YuvIRr6RsUt84SGLdkP57CsNMB1v5imvtWzdrq0xdZh22bkY5gMjVnT7HXF9p1D3PlpI
 5IGBMcwZSzpMXpG5hZYp1rNX1L9TPNviNxj0jAyBorXZRW1Yg/jBsR/9Zolh4NEM0BiY
 uvcw==
X-Gm-Message-State: APjAAAXByYkrUXdD6uRg6aIXF+u54ibPsAnVA4NQ2zW59Fr6//3UfEA+
 j2d+dqdSIrVocVafAgN/DU/WoLxCylvxMjjHvIk=
X-Google-Smtp-Source: APXvYqy9ZsyhEt8+OMUT9MgPskB3If2Nz7v2NNlInZphvvUY0VVG7QgCi75UHj6CcZeVV7MiHgrX1bfs0de5RD7IQj0=
X-Received: by 2002:a6b:dc08:: with SMTP id s8mr37834077ioc.209.1564087706623; 
 Thu, 25 Jul 2019 13:48:26 -0700 (PDT)
MIME-Version: 1.0
References: <20190710225121.GA142072@jra4>
 <CAN05THQ65himSVSYpzypUwDeJoaV6FPAhQpV4NEeCT3fRaBxFg@mail.gmail.com>
 <dc0d693a2caf311097cf9a0ef8df3add01117ba7.camel@samba.org>
 <4efb83c3-6df7-af2c-798d-b4ec681562ab@samba.org>
 <8219d257b2fe68717939d2f41566ae669fab8466.camel@samba.org>
In-Reply-To: <8219d257b2fe68717939d2f41566ae669fab8466.camel@samba.org>
Date: Fri, 26 Jul 2019 06:48:14 +1000
Message-ID: <CAN05THQyQVOCUSwLrtoQoR93_ac2+uGfzots-3W03uwnJGvgXg@mail.gmail.com>
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

I am not convinced that is a good argument for keeping SMB1 supported
in future samba versions perpetually.

There is nothing that stops people running MS-DOS/ OS/2 Win3.11
clients from just keep
running old versions of samba.

But hey, you want to keep SMB1, ok.

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

