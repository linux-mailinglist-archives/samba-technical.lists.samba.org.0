Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D2A65169667
	for <lists+samba-technical@lfdr.de>; Sun, 23 Feb 2020 07:44:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=pn7k0a+mc5LWIjYGrApZbnRE/fJe/XF2w2TxoGF9yF0=; b=Cuw7vy6at1VMRclozAR/P9XHEn
	hoZbTofQa5QV/r+Rs5uLexWdFoAvaDxQDfFxWrUHoimKJvq1cdUKp1+aT0JH8Rc7iMw690EA02GXi
	9cxOL8zlzN5e/qw2OoExa+omkXSntuR/C3eiuFnxXZmwsdfGLV0myJhWptcQEQKhfkQlBftFp8Ovf
	l66F1fko4NHanlYEyzqIE+FfhEsq/7Gnobml2pYB9YW0O3t1V7dYupw2sWyYrt1k3YJFlodnUPbu8
	s2Vfyo0PEpnRpK4kBWp1TXzmTn6OsHNR6ccdmZH8oUmpSo+XrGj5exUHbOZuGAvM6XW8fF9HLfDfu
	4ic3gPMg==;
Received: from localhost ([::1]:22226 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1j5kzh-00B9Lk-1Y; Sun, 23 Feb 2020 06:44:01 +0000
Received: from mail-il1-x12e.google.com ([2607:f8b0:4864:20::12e]:36221) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1j5kzR-00B9Ld-BC
 for samba-technical@lists.samba.org; Sun, 23 Feb 2020 06:43:47 +0000
Received: by mail-il1-x12e.google.com with SMTP id b15so5124655iln.3
 for <samba-technical@lists.samba.org>; Sat, 22 Feb 2020 22:43:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pn7k0a+mc5LWIjYGrApZbnRE/fJe/XF2w2TxoGF9yF0=;
 b=Kagy9VvhOJNCawuox+SPE5FiFovU1Dbr6Ce8H2agMJHbqGcQnLLWwF5636erCoxTci
 UzdoSF1LzKLjEmWiTDpdh+XcYytueovCQv0YU+o+TPThsM6oivpsX6C3vaCx+yZ6gHSR
 s4eHn2JXb+2EZDeEkBSyvG7gsDTdtWPTLPEuIMET21rb7KmqndSZeremDz0qX+66SrWV
 xSXEQOahkpRsB2kb/lpjYz1u7B6NjTPjXtHtz35mF2wEt74z5e0jOOvQhmz18LdNU+eY
 wDfWBFsliOWEJY8Nhq7GYah+JXPUDQyeIIaZy0PJil/pxcdV3cMNLcz1YxsIxgkOF0Uq
 qddA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pn7k0a+mc5LWIjYGrApZbnRE/fJe/XF2w2TxoGF9yF0=;
 b=FQz+3RM0oWZX4pfOIPVa9wVTLkqeSiIbSs6F5u+UHHTphBfTrdOINz3xHBaHRQ4AOY
 kafInIFPQRNwOWpsSVP9kXb+cR9y+dr38VGzReaN9zGV7jKZjrU38gMdhilro1jEGLgJ
 dd+jBHkaUQkSxHSmR19BHkwSrJr1lnt8p29eR3mQuQ7dvfIDEfXU9W74e+c8/o+T/gIN
 KpewqIGGuoNeXsy5jtc8iewd4ced2IUiJgfw1hnusNVUMPRtYLUKD5RtI6/I8ddxywtI
 VxtFUcDeUmLcxeHKPreF9TFTiH4UhcklpFFc2cjp/Cu1YG77u73zA6LCNr75X99FQFTL
 bSQQ==
X-Gm-Message-State: APjAAAVZqkVbqIUF72k7k8Hbx2oav4A/92s1meel9/J88eM3+oqU3nhb
 BptIXw04EgZEP00UXU+f9sUNRmbJ3p64UA6N1rWfuA==
X-Google-Smtp-Source: APXvYqxajH07PoxVdpXBcT19MpECJuc/G4d70Qr5mTvzSaxlNJ5B9bM9R5pfmDNO8w2nKj1tPSYwJgzQ0SeAVaxZwqg=
X-Received: by 2002:a05:6e02:e8b:: with SMTP id
 t11mr45458207ilj.159.1582440221339; 
 Sat, 22 Feb 2020 22:43:41 -0800 (PST)
MIME-Version: 1.0
References: <CAN05THSsnmesxc0UH17OK95KXAY5NCYisNc6pNyGDykYd=R1ig@mail.gmail.com>
 <20200223060804.GA32193@jeremy-acer>
In-Reply-To: <20200223060804.GA32193@jeremy-acer>
Date: Sun, 23 Feb 2020 16:43:30 +1000
Message-ID: <CAN05THSbbYa_5gNa=2gexPo709MOSKcDjzX_+raOX9Pmn1+yxw@mail.gmail.com>
Subject: Re: ndr64 support
To: Jeremy Allison <jra@samba.org>
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

On Sun, Feb 23, 2020 at 4:08 PM Jeremy Allison <jra@samba.org> wrote:
>
> On Sat, Feb 22, 2020 at 06:03:13PM +1000, ronnie sahlberg via samba-technical wrote:
> > List
> >
> > Does samba support the NDR64 transfer syntax?
> > This was introduced in 2008 and makes alignment better for various
> > fields.
> >
> > I just noticed that when I use libsmb2 against samba 4.10 it always reject
> > NDR64 as an unsupported transfer syntax and instead always pick NDR32.
> > If I disable NDR32 support then the bind will fail completely with no
> > suitable transfer syntaxes.
> >
> > I am testing against 4.10. Which is reasonable new.
>
> I *think* (although I'm sure Metze will be able
> to give a comprehensive answer) that we support
> it as a client for testing purposes, but not as
> a server.

Ah ok, that is cool. thanks.

My big disappointment is that Windows do not support NDR64 for BIG
ENDIAN encodings :-(
Would have been so nice to be able to test with all 4 mutations of
ndr32 vs 64 and big vs little endian.

I spent a whole day trying to figure out why NDR64 + BIG-ENDIAN were
just always rejected with a FAULT PDU.
Until I found a microsoft doc that specified ndr64 must use little endian :-(

Funny thing is that windows2016 does allow you to negotiate both big
endian and ndr64 in the BIND command
successfully. But the following REQUEST PDU is faulted.

Windows2016: "yeah, you offer both ndr32 and ndr64 in the bind pdu and
you say you use big endian. Cool. I will trick you and respond that I
want ndr64 and that I rejected ndr32"
Me: Grrrrrrrrrr <angry noises>


ronnie sahlberg

