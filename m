Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 80748EA4F4
	for <lists+samba-technical@lfdr.de>; Wed, 30 Oct 2019 21:46:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=VBkvT0AM/1867A2dpvzkL9LmIGWtm1Qz2eJ95vsJi0s=; b=BM0GPAGGaH9Wdl0G/7d9OX2/bc
	LSIs6ggOEqg3+nyoaMPxMzAXWKslwRlRAO7i1GYa+Qf1GsPSjVLvHg5ZULfa75RqQTnF32IlParL1
	vyqs6UTuDiPH1MCEDFPWxwMElnO6LNd0B57SoQmn01CXKGvYtsqjxxC3VKtfgdBL4iZEDXAO41S0T
	nX4zOORqninY/P1l6p3EW6hL86sKcI3yPGtygjPbXBkHJA6KPBxU2/vY3oV11M4iemNbUiGfzk9cj
	rl3AXwfPgQVQDsLdu4+6SXBOidGPAGqZ4XcPDVsl9YqB+b0qqIeDw6U48mTB6Tda+U8U5jC1eDRa0
	WJuR1mxA==;
Received: from localhost ([::1]:42486 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iPur5-003pBQ-56; Wed, 30 Oct 2019 20:46:11 +0000
Received: from mail-il1-x134.google.com ([2607:f8b0:4864:20::134]:34684) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iPuqz-003pB4-Tz
 for samba-technical@lists.samba.org; Wed, 30 Oct 2019 20:46:08 +0000
Received: by mail-il1-x134.google.com with SMTP id a13so3415557ilp.1
 for <samba-technical@lists.samba.org>; Wed, 30 Oct 2019 13:46:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VBkvT0AM/1867A2dpvzkL9LmIGWtm1Qz2eJ95vsJi0s=;
 b=qOoABpmUNiXSqLnMXs41KDCn6ZJ9E2T7Gpz1/BxW49oZX6N3uhOrXtEFMYQx5f9RPW
 JmMo7Qfqt2i/wxMNHbAKRnVkk/9EIxFonJn+o07ssSarEjgldkS2mThuU2UQtVtg0QQZ
 sUqDfWuSFhI/BrUYoamOOe6qapC/FxvJpxFMnXzYqoySRkOSTl+LdwFGl5dBAYJ0nUx9
 pOzgtvkSne9woKhaa6wAWG2v983R+fYrbz+mOWfyAo4fZgEdwZh0K/HKOeVyB/2E1P2q
 BmWvT1loBmegY2NPByZu26cXR/GrCIf9EIu/a6ffnSIh6MS2E4a4br1rJQmzZptVIwPV
 ilyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VBkvT0AM/1867A2dpvzkL9LmIGWtm1Qz2eJ95vsJi0s=;
 b=syjs6Lf15FwF5Is/jiXndfuQ8d+Eb7mnPY7bjB7PBAWdvBIsUDp2BuEnu5APfx3FqT
 lQSl3AzdCNoAz3o4W2WADmVeE3N5h778xbO/qVPsprTLdw3GlfV1OFHpyOPmJY+cLD4s
 9a3ywrc3Z6qT3AzqHtrE1gfY7j3sSIltiVsWP03l5ZKZkpL3e5dPJk/cze3PUHa0diqe
 xq7QgTRWfnwsCGAptEeakmAPKT2St7UBFBGtY8UFvYiSnYjEvmxeBeAgOfVgZRhY9qNt
 /YB7GogUDWQL2zYOAABklvUG6SsYSdbZDRbp4vLnany+r0RU1ohCmC7b/NkclpDyng+O
 04KA==
X-Gm-Message-State: APjAAAVQenxAeUiw1AZAv1bONOaMFffSIhX/LmRr9s1sJItmqK62dit0
 N7jPYC4NIXfn/SX7CeY3FOwvgmcVK50E1PjPtPlVts9I
X-Google-Smtp-Source: APXvYqyZTfTX08cWC5aDW9x4wrYNO4jQpikoN06mJYTFafekApgZNbMEQyFBxazFZlNOuanjGhKxojAxgiwp5Qx8kQ4=
X-Received: by 2002:a92:48d8:: with SMTP id j85mr2152123ilg.272.1572468363929; 
 Wed, 30 Oct 2019 13:46:03 -0700 (PDT)
MIME-Version: 1.0
References: <CAH2r5msEjOuWumbKQce6ucn6pM2K1CW7iyEwuzj_611E5R7C5w@mail.gmail.com>
 <20191030165526.GB32459@onega.vda.li>
 <CAH2r5mu9qHKd3i6v5zLfRCxnuD=1bQUXeMEyibDWDxLNNo4Ndg@mail.gmail.com>
In-Reply-To: <CAH2r5mu9qHKd3i6v5zLfRCxnuD=1bQUXeMEyibDWDxLNNo4Ndg@mail.gmail.com>
Date: Wed, 30 Oct 2019 15:45:53 -0500
Message-ID: <CAH2r5msqr4TEPpAJAwD7sQTKZtDgo4LPEghE1pcaq3JRruCkPA@mail.gmail.com>
Subject: Re: Samba build error on Fedora 31 can't find 'nsl'
To: Alexander Bokovoy <ab@samba.org>
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
From: Steve French via samba-technical <samba-technical@lists.samba.org>
Reply-To: Steve French <smfrench@gmail.com>
Cc: samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wed, Oct 30, 2019 at 3:29 PM Steve French <smfrench@gmail.com> wrote:
>
> On Wed, Oct 30, 2019 at 11:55 AM Alexander Bokovoy <ab@samba.org> wrote:
> >
> > On ke, 30 loka 2019, Steve French via samba-technical wrote:
> > > Doing a clean build of Samba on Fedora 31 (master from jra's branch of
> > > a few months ago) I get this error (worked on Ubuntu) not finding
> > > 'nsl' but the package is installed
> > >
> > > ./configure --without-ad-dc --with-system-mitkrb5 ; make
> > >
> > > [144/144] Creating bin/default/lib/krb5_wrap/krb5samba.vscript
> > > [145/147] Compiling lib/replace/cwrap.c
> > > [146/147] Compiling lib/replace/replace.c
> > > [147/147] Linking bin/default/lib/replace/libreplace-samba4.so
> > > /usr/bin/ld: cannot find -lnsl
> > > collect2: error: ld returned 1 exit status
> > >
> > >
> > > # yum whatprovides '*nsl'
> > > Last metadata expiration check: 0:46:54 ago on Wed 30 Oct 2019 10:30:46 AM CDT.
> > > libnsl-2.30-5.fc31.i686 : Legacy support library for NIS
> > > Repo        : fedora
> > > Matched from:
> > > Provide    : libnsl = 2.30-5.fc31
> > >
> > > Package libnsl-2.30-5.fc31.x86_64 is already installed.
> >
> > Please use libnsl2-devel.
> >
> > See https://bugzilla.samba.org/show_bug.cgi?id=13238
>
> libnsl2-devel gets farther but looks like it has some header problems ....
>
> [1414/4178] Compiling lib/util/access.c
> In file included from ../../lib/util/access.c:26:
> ../../lib/replace/system/nis.h:37:10: fatal error: rpc/rpc.h: No such
> file or directory
>    37 | #include <rpc/rpc.h>
>       |          ^~~~~~~~~~~
> compilation terminated.


Nevermind ... fixed ... I was missing some of the samba buiilddeps
that I thought I had (not sure which one rpc.h was in ... it wasn't
obvious to me and there were various rpc.h installed on my system from
three or four other packages - but fixed now)


-- 
Thanks,

Steve

