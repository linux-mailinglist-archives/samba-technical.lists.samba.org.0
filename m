Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A3C112A0B23
	for <lists+samba-technical@lfdr.de>; Fri, 30 Oct 2020 17:31:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=nWG2266jhye7KqlShaFDcLVbwh41ixfw8RwmouEhXSw=; b=Q04hT4DFGdNbSfS/hbXQZ0SnGQ
	Z/9CLbms09qe4Pc40dXBB/MojmnaBJ9+RtNIBd09G7339TXF9Uegb6QYxhooqZQpOBlC0LWaLcslM
	ZAEG35PmC3Mm9iim98CRZXuSx4pOqv+r5X/o1RsYtwAFEQxkefA/nrwoes0+aifCD8eZT7JAYczUi
	pVauPcoUkpNEawq+SslbMgyTZxUf1V4tmldDN021krz6FwtqRcba4ElRB23puhxPn817YezcXwR5D
	YHV0AT47frjqej0JwFuBU28TtE8WRz4X4eLSm26Tp5Jn8Ql65fttlpRxKJp7p2vqUgy3w5as+/sH9
	IwqD7TQA==;
Received: from ip6-localhost ([::1]:35040 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kYXI6-00EoeA-Hh; Fri, 30 Oct 2020 16:30:14 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134]:43612) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kYXI0-00Eoe3-Jq
 for samba-technical@lists.samba.org; Fri, 30 Oct 2020 16:30:11 +0000
Received: by mail-lf1-x134.google.com with SMTP id l28so8602161lfp.10
 for <samba-technical@lists.samba.org>; Fri, 30 Oct 2020 09:30:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nWG2266jhye7KqlShaFDcLVbwh41ixfw8RwmouEhXSw=;
 b=OqHcQOEitQ/YPn6pwZ/dY+X/w7LbkThsSBZWwglfVqZgypO+TEnRJbyoEtwELPxKO6
 zaEBGsHkiPYcWdSXjJThxNijdsHbmfb90DaQgjCQWkSLd8f7ecw4bl1JrZLpFFjKRzuv
 5173ps+Ia2IFx1jPZi8M1DVewIN2i/7UtRT0Nqhxo6PZQi3LonXQ4Wkn7f2W0ELNR7Dt
 dxrs5NFIjaJ9J3dAf5yyjADuWjzGbGQUuISI01FtJaRvIj5N0rxKKePSi12gFRCzSDpx
 HshID7x0reBOOTRgJC3lMpKSdR8yIo/bzlh5vB+DylnQAQv4sW90bLU7L0+WNj/RL0/L
 ivQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nWG2266jhye7KqlShaFDcLVbwh41ixfw8RwmouEhXSw=;
 b=RXs53+7E67wwk89nQRcECw2KsY+DvojakxBy+2g3EAH4NgReg3EfTK55GUneDJK6C4
 818mB6EtmRV0VbxftJLJGNcmlQpiDSzdfn/fbZT5Fk0+NEsN9zmDgl+kbYqdQGCD1Hsd
 hhaE26ybGJdPy2pUYVGZUt2WbpbfpWUsN+YQ/xE2f+Rbj1kO4nRQz1dTa8jaci2jIuX8
 7ljFmb6vY8AxM2JoegqFluphDZDvkFgY2h+aSnUytwcK+oZMA7UDjk9qZ9FfvFnjbvNf
 cjQgTyQ84OaqNWuUYH9nC3H3x5gTLLax/NXqzx1Lrul/5Xo2a9a/Aue9MmBNsfOClfK7
 N5qQ==
X-Gm-Message-State: AOAM5323vNRmmHFCZGp9xk/uUso/cS1hLdjlbKA3WQBBegxQFBI/mlKO
 X0xPl21VUbh7X1FX0XNtJWpIDhAiMhEi72BJ+mE=
X-Google-Smtp-Source: ABdhPJzBg5llkFjy8UNw/kR24FzJOoPGbolMfdDnYg6Skf6aPpQgrG+hNgyVvI6SVBh6xjWVMfdk+jYaqylh2k+K4E4=
X-Received: by 2002:a19:c8c1:: with SMTP id y184mr1247392lff.598.1604075406467; 
 Fri, 30 Oct 2020 09:30:06 -0700 (PDT)
MIME-Version: 1.0
References: <20262379.55437477.1603985286601.JavaMail.zimbra@redhat.com>
 <1397349053.55438877.1603986203418.JavaMail.zimbra@redhat.com>
 <57860C29B41C41148C728C7F08BD12FC@rotterdam.bazuin.nl>
 <1282344879.55505050.1604024067212.JavaMail.zimbra@redhat.com>
 <CAN05THRxZ_=o0QnniT4-J365E34nUQxJube7mUQa17Lcj3YzuA@mail.gmail.com>
 <758246149.55514473.1604038831866.JavaMail.zimbra@redhat.com>
 <47e9f3cf-e258-f441-76d5-4e72b4073031@samba.org>
 <2038917775.55518004.1604044565533.JavaMail.zimbra@redhat.com>
In-Reply-To: <2038917775.55518004.1604044565533.JavaMail.zimbra@redhat.com>
Date: Fri, 30 Oct 2020 11:29:55 -0500
Message-ID: <CAH2r5mtbe-D5Cf-qHWWnUhdYaOYtniHcf91ZFXAB6MPV3Znj7Q@mail.gmail.com>
Subject: Re: can't start smbd after install samba posix branch
To: Xiaoli Feng <xifeng@redhat.com>
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
Cc: samba-technical <samba-technical@lists.samba.org>, belle@samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Looks like you are missing a required smb.conf parameter

              smb2 unix extensions = yes

On Fri, Oct 30, 2020 at 2:57 AM Xiaoli Feng via samba-technical
<samba-technical@lists.samba.org> wrote:
>
> Hi,
>
> ----- Original Message -----
> > From: "Ralph Boehme via samba-technical" <samba-technical@lists.samba.org>
> > To: "Xiaoli Feng" <xifeng@redhat.com>, "ronnie sahlberg" <ronniesahlberg@gmail.com>
> > Cc: samba-technical@lists.samba.org, belle@samba.org
> > Sent: Friday, October 30, 2020 2:30:16 PM
> > Subject: Re: can't start smbd after install samba posix branch
> >
> > Am 10/30/20 um 7:20 AM schrieb Xiaoli Feng via samba-technical:
> > > There isn't error log output. Just know the exit code is 1.
> > >
> > > # smbd -D -d 10
> > try
> >
> > # smbd -iF -d 10
>
> Thanks. Now from log, I know the config file patch is changed to /usr/etc/samba/smb.conf.
> Create it. Then smbd can start. But mount option posix is still unsupported.
>
> # mount //localhost/cifs ~/cifs -o user=root,password=redhat,posix,vers=3.1.1
> mount error(95): Operation not supported
>
> [81490.590281] CIFS VFS: Server does not support mounting with posix SMB3.11 extensions.
>
> smb.conf:
> [global]
> server max protocol = SMB3_11
> unix extensions = yes
> [cifs]
> path=/mnt/cifs
> writeable=yes
>
> >
> > -slow
> >
> > --
> > Ralph Boehme, Samba Team                https://samba.org/
> > Samba Developer, SerNet GmbH   https://sernet.de/en/samba/
> > GPG-Fingerprint   FAE2C6088A24252051C559E4AA1E9B7126399E46
> >
> >
>
>


-- 
Thanks,

Steve

