Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B491870C156
	for <lists+samba-technical@lfdr.de>; Mon, 22 May 2023 16:42:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=IYLhEFduMkQIrDdERDUb/k8J0ClJ1iqXTRtRrT8Z60A=; b=hK+90L5vm5PfPElFnX6y3ReNX0
	fc+FdWld2HlIHiBzLGbF7VzwWP2DgF+x/1pUHoOvXEtSgIChksBf+3hXHnaI3799egJEHI+VER4I6
	YpLsw/t7XiCtzGLgpJ4Cydo0bgj7M/PRgWxn4m96u7QR6SENF90FzRDIfiHMMHBtBPDejzd6M3PiP
	xCdpo8C1PbnrZmjGrI5OGx4srcqCZSz7AMVTrECbFjfsJuP4Bf3LI60tyCtSzmhZRQmCA6bRIehH8
	dvUZc0IZyt+oQU3GX2OqEp1QzMxj8nPCS0c0gofL1zAdgKkwLP0wwDkUYjRcU4Y6vRYVXhK7Nkgb+
	2FSb6Mlg==;
Received: from ip6-localhost ([::1]:51776 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1q16jj-00BKmZ-5E; Mon, 22 May 2023 14:42:11 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529]:56354) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1q16je-00BKkW-Ak
 for samba-technical@lists.samba.org; Mon, 22 May 2023 14:42:08 +0000
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-50db91640d3so9650434a12.0
 for <samba-technical@lists.samba.org>; Mon, 22 May 2023 07:42:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684766525; x=1687358525;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IYLhEFduMkQIrDdERDUb/k8J0ClJ1iqXTRtRrT8Z60A=;
 b=PBiU285SYm0CosNInpUEA8/2JreDjkBahjYW5x9yntRuq+ZagSXx7uTNIHXjKzWfgM
 CZJve7A3edOagyZiBamOGob5kyH1Kff2T0F8SYKF2Sunjo8zE13ysGfXTo8iBVXXEt4S
 9De3ZbmKvVLGpYF4rDlpq5n2oLCjgVh1ciU7x0QWi0KztJDIZup82OEIIfJSqGb60a2H
 0d+LSWjgsfD/kdIYErVQtLio7tceiLF9KWkeJoiKJDE5Qf4APyGUBmJB1av3kCnC4qEM
 X1JfyK/LM659EEIEFqqliys3zZcUzdZtPPWsFJWB2lYXYgJ0vjlG9XKENJ0sXryfPxXe
 QzBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684766525; x=1687358525;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IYLhEFduMkQIrDdERDUb/k8J0ClJ1iqXTRtRrT8Z60A=;
 b=Z8zVFSLwNS5JkjZ/KBhlgraVUULhsV+UbQWXXYC7ha+mmFJkQ26HgPT74yir4E0koK
 q04LwR4GBUBPC/tQB1cQivAlwRMDjMGwsakNDEP78/dEBx6DnlT7vm8pQ0L9ghznai3Q
 /QeFxaQpJWGQuSE7MzNErpK7SuZRHx1SUgcALQUtNdEJdIw1JMShqVdONB04BJEQnjym
 6PwOQxKS5s275zm8bhmUx7nzqtFSMXC0Zkvlj326VpbE3V2r5ijJR8BmPkktYlnz0dYD
 5Be8gouKRmWoMQFnN0JL2De2U5Wdjx+7j2wBTot8xsASCn/1hQ3lwddbT64dAqBb9mNx
 NQpw==
X-Gm-Message-State: AC+VfDyjwkNFEGfUoSIWtHBBEmn6R/7IaPKa0aHns0v0nGlePHZEOfsU
 O3CeGJ81LmswCD8IrmJZo+JkUEGccCTehtdPLNg=
X-Google-Smtp-Source: ACHHUZ5mAsmJ73Pmyi6b17NdcEMwYeXA4qR7zZE5u6B+J8wAbQDsQ0sJUC/tWGfWzcEVGjANvfGS4BBGUfi5o81X2ns=
X-Received: by 2002:aa7:c509:0:b0:50b:c275:6c56 with SMTP id
 o9-20020aa7c509000000b0050bc2756c56mr8720951edq.16.1684766525037; Mon, 22 May
 2023 07:42:05 -0700 (PDT)
MIME-Version: 1.0
References: <CAH2r5mv8nAncg-f=Z5u8LkH4o7kfJLJdtoksYQgiguF7efKZkQ@mail.gmail.com>
 <CAN05THRKq9XPD11rBWXyTL_OGSh4pP6mQyufeW+xc+J3wvkMmw@mail.gmail.com>
 <CAH2r5mtJfSiQXBRUwv6zcR5rhG2Q-pCvjH+n+_SZmVQo1pMeVg@mail.gmail.com>
In-Reply-To: <CAH2r5mtJfSiQXBRUwv6zcR5rhG2Q-pCvjH+n+_SZmVQo1pMeVg@mail.gmail.com>
Date: Tue, 23 May 2023 00:41:53 +1000
Message-ID: <CAN05THQZFo+eD=+cBe9D2va0RchOBVunEAfbGaY1JGRSj=qGKQ@mail.gmail.com>
Subject: Re: Displaying streams as xattrs
To: Steve French <smfrench@gmail.com>
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
From: ronnie sahlberg via samba-technical <samba-technical@lists.samba.org>
Reply-To: ronnie sahlberg <ronniesahlberg@gmail.com>
Cc: CIFS <linux-cifs@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

We want to expose ADS to the applications?
Maybe FCNTL is a better interface to do this than magix xattrs.
An application could open a file, and then use fcntl to
list/open/create/delete streams?

We should talk to the NTFS maintainers too as this is an ntfs feature
and they might alwo want to expose ADS to apps.
So we get a solution that we can use across multiple filesystems.

regards
ronnie s



On Mon, 22 May 2023 at 16:40, Steve French <smfrench@gmail.com> wrote:
>
> On Sun, May 21, 2023 at 11:33=E2=80=AFPM ronnie sahlberg
> <ronniesahlberg@gmail.com> wrote:
> >
> > A problem  we have with xattrs today is that we use EAs and these are
> > case insensitive.
> > Even worse I think windows may also convert the names to uppercase :-(
> > And there is no way to change it in the registry :-(
>
> But for alternate data streams if we allowed them to be retrieved via xat=
trs,
> would case sensitivity matter?  Alternate data streams IIRC are already
> case preserving.   Presumably the more common case is for a Linux user
> to read (or backup) an existing alternate data stream (which are usually
> created by Windows so case sensitivity would not be relevant).
>
> > On Mon, 22 May 2023 at 12:09, Steve French via samba-technical
> > <samba-technical@lists.samba.org> wrote:
> > >
> > > Looking through code today (in fs/cifs/xattr.c) I noticed an old
> > > reference to returning alternate data streams as pseudo-xattrs.
> > > Although it is possible to list streams via "smbinfo filestreaminfo"
> > > presumably it is not common (opening streams on remote files from
> > > Linux is probably not done as commonly as it should be as well).
> > >
> > > Any thoughts about returning alternate data streams via pseudo-xattrs=
?
> > > Macs apparently allow this (see e.g.
> > > https://www.jankyrobotsecurity.com/2018/07/24/accessing-alternate-dat=
a-streams-from-a-mac/)
> > >
> > >
> > >
> > >
> > >
> > > --
> > > Thanks,
> > >
> > > Steve
> > >
>
>
>
> --
> Thanks,
>
> Steve

