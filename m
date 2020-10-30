Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 70BF32A0046
	for <lists+samba-technical@lfdr.de>; Fri, 30 Oct 2020 09:45:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=uxDeGrHZpVH7iFOEttFnN1cejlhULRz0u7UrzKAXXfc=; b=Ej4Ef4Zlv07rBKnPSJ0aIiFKqU
	HYtbfMCqMttJPIOqXyRhFDar09GOSWwIjcCh9rMMbRSSubt4NtVtKHp/D4YQBAoCRPIvIUx6RuF1O
	nAQ2HIMU30HZaYGLw3Y9D64ZjZFw93F9HcOAXBBkJD1ORJ9VOWCtAdP1Vze3HKNpFD6T0Ldq1zJkd
	cjcUDFKbEndQzyRomQBvVWCrqtX09dtykSNSQUKkI3z9J15GNgT360NLJ0FUEsDbgjIRtbfVp18yc
	nBygksNdPv2YWTch9uPRdN9nqPDYBFNV2YBBQWSYvN+h7p6CT/8Q7y2yA/xGlqCXF5vb20mF7Fuf0
	hE3m3nSQ==;
Received: from ip6-localhost ([::1]:60562 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kYQ2R-00EcSX-Pm; Fri, 30 Oct 2020 08:45:35 +0000
Received: from mail-il1-x135.google.com ([2607:f8b0:4864:20::135]:44541) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kYQ2K-00EcSQ-Qy
 for samba-technical@lists.samba.org; Fri, 30 Oct 2020 08:45:31 +0000
Received: by mail-il1-x135.google.com with SMTP id z2so5776770ilh.11
 for <samba-technical@lists.samba.org>; Fri, 30 Oct 2020 01:45:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oCbLAUguZ56HIlRQf0OukunUgSJDI+hba+Em8SH3QWw=;
 b=ZCaDpl24o6gHMlVYnOXQ72ch6QQaeJThNniIoq97EuBcUaVPqnSDNrKHZPC03pyy8D
 AAlmP0mLsMkDdpQAftUTHzIjk5TH4KQCmAhnUsYLKGuP5TJLdtLxWcaxXmUSBPuNSqpv
 UwFp29FNDkTCGHu6RTCphEbIfoQT5gaTChnYYGFBCKc4Mb/i9KN/Bi24gDyzhlp1i2Rz
 0c5r02ofLfM+M+8HFToSJT+ON6+/il2roR/d77Rv1KNFP68yHK0Y26f2CwxhIP7Elf9I
 TWR9I/I2Y42DNrLoLK8Vo9YtUwcdkepbfub4kNz7qVrmrX2cqCo5j8DP0icI2I9TIAp4
 mPBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oCbLAUguZ56HIlRQf0OukunUgSJDI+hba+Em8SH3QWw=;
 b=KTNceEhBv92GOXwQN4p8cq8C5nrtyw89/uyIdka+uH0TXeJzx8IVOdR2h459bNOP9h
 IrX77exmHxQP17ke5TK7FtM0qbxPD4ci7B8tYPB4kBK/5z7+2iTQ/VNaikfbuRDlCVDG
 jeIaXIcC6JH0HXiX+N1wFm7/rGFNwunQOUTjbnV6J1A/6UeVSzXHQwTOwLUL4OtoldKi
 PzmxXp9ISScupf2ZYDzKn44ocaMxrZ/7fY+tb+WeaXLjhJ/CiFmjplRTeifhkfC72g9e
 z1q5F+wxjO5Kw29Hs4W2oUvyQ92suJ9/9l+M39VHyzIUJCYg/3ajV+Q592EVzswzd74V
 I9AA==
X-Gm-Message-State: AOAM532gsLSPXbZnsiHahSJoXZXFNGJ0EnwSHitHCttzGjIXbzEa8LTP
 rP9PSodvxG6+5c1c59bLJ2uVid9StRxT4+r2Us6n/UB4
X-Google-Smtp-Source: ABdhPJwK1QJTBl3UU3rMXDfFBRJzXO8oPG/QGj8Uk15QQXc0/svPGiI+gPBoFSlEnXb3iC6iDrqwdI6faB0f4ytS750=
X-Received: by 2002:a92:d58f:: with SMTP id a15mr1072092iln.49.1604047526146; 
 Fri, 30 Oct 2020 01:45:26 -0700 (PDT)
MIME-Version: 1.0
References: <20262379.55437477.1603985286601.JavaMail.zimbra@redhat.com>
 <1397349053.55438877.1603986203418.JavaMail.zimbra@redhat.com>
 <57860C29B41C41148C728C7F08BD12FC@rotterdam.bazuin.nl>
 <1282344879.55505050.1604024067212.JavaMail.zimbra@redhat.com>
 <CAN05THRxZ_=o0QnniT4-J365E34nUQxJube7mUQa17Lcj3YzuA@mail.gmail.com>
 <758246149.55514473.1604038831866.JavaMail.zimbra@redhat.com>
 <47e9f3cf-e258-f441-76d5-4e72b4073031@samba.org>
 <2038917775.55518004.1604044565533.JavaMail.zimbra@redhat.com>
 <db176606-3dbd-b0d8-e249-9ab6cd693ba3@samba.org>
In-Reply-To: <db176606-3dbd-b0d8-e249-9ab6cd693ba3@samba.org>
Date: Fri, 30 Oct 2020 18:45:14 +1000
Message-ID: <CAN05THR21TwQdcLUTDoa6bt13Zx5k+huT7Gg8m3TeGjBwPLqdw@mail.gmail.com>
Subject: Re: can't start smbd after install samba posix branch
To: Rowland penny <rpenny@samba.org>
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
From: ronnie sahlberg via samba-technical <samba-technical@lists.samba.org>
Reply-To: ronnie sahlberg <ronniesahlberg@gmail.com>
Cc: "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, Oct 30, 2020 at 6:29 PM Rowland penny via samba-technical <
samba-technical@lists.samba.org> wrote:

> On 30/10/2020 07:56, Xiaoli Feng via samba-technical wrote:
> > Hi,
> >
> > ----- Original Message -----
> >> From: "Ralph Boehme via samba-technical" <
> samba-technical@lists.samba.org>
> >> To: "Xiaoli Feng" <xifeng@redhat.com>, "ronnie sahlberg" <
> ronniesahlberg@gmail.com>
> >> Cc: samba-technical@lists.samba.org, belle@samba.org
> >> Sent: Friday, October 30, 2020 2:30:16 PM
> >> Subject: Re: can't start smbd after install samba posix branch
> >>
> >> Am 10/30/20 um 7:20 AM schrieb Xiaoli Feng via samba-technical:
> >>> There isn't error log output. Just know the exit code is 1.
> >>>
> >>> # smbd -D -d 10
> >> try
> >>
> >> # smbd -iF -d 10
> > Thanks. Now from log, I know the config file patch is changed to
> /usr/etc/samba/smb.conf.
> > Create it. Then smbd can start. But mount option posix is still
> unsupported.
> >
> > # mount //localhost/cifs ~/cifs -o
> user=3Droot,password=3Dredhat,posix,vers=3D3.1.1
> > mount error(95): Operation not supported
> >
> > [81490.590281] CIFS VFS: Server does not support mounting with posix
> SMB3.11 extensions.
> >
> > smb.conf:
> > [global]
> > server max protocol =3D SMB3_11
> > unix extensions =3D yes
> > [cifs]
> > path=3D/mnt/cifs
> > writeable=3Dyes
>
> There is a reason why it doesn't work, you appear to be using one of
> Jeremy's git branches where he is working on SMBv3 Unix extensions. The
> operative word is 'working', they do not work yet, so I wouldn't use the
> branch unless I wanted to test where he had got to =F0=9F=98=81
>
> I suggest you wait until the required patches are finished and have been
> accepted into Samba master.
>
> Rowland
>

Not true.

Me as well as Steve and the other cifs.ko kernel developers have used this
branch for quite a while.
We even have a cifs.ko buildbot we use to test this very branch.

ronnie s
