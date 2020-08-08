Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A046E23F5BC
	for <lists+samba-technical@lfdr.de>; Sat,  8 Aug 2020 03:09:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=LW0djcq/4q1cISKw281CQ5TKxOL0EnOd9YYYErAJpz0=; b=u7JaspMdTAsIfbd2sj783SSKL/
	DB+Y6hZ1Rw5P4eLSX7ig3XdpSTlP0nxeTwU8mlIbjNEixc1u2fMy/LP0fe5fizy94wgMKKbuQVBnl
	YaypF0siWSH7jQZQRegfoEVwBS7Htq1wzsug6APL986Z0hMTmjXe6jsZhRLgWaR4G6SWvRJYu5YnX
	/8tI5CIXhEBtSfu+6djOaq8+UTw0a3G9kzspFVdG/maWTTCr+SGFnXRTvnB5kdzSrlwO4bx1e/QME
	SVtXM/HsvertZq+J+nfNnldPbij/CUJUEmvBmByG+CiBhIOsen50yBk+8VhleP4WAp1H3i78PKQdU
	bUZCNO1w==;
Received: from localhost ([::1]:44202 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1k4DLO-00CsPR-S5; Sat, 08 Aug 2020 01:08:18 +0000
Received: from mail-il1-x134.google.com ([2607:f8b0:4864:20::134]:42626) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1k4DLH-00CsPK-Hs
 for samba-technical@lists.samba.org; Sat, 08 Aug 2020 01:08:14 +0000
Received: by mail-il1-x134.google.com with SMTP id i15so2532253ils.9
 for <samba-technical@lists.samba.org>; Fri, 07 Aug 2020 18:08:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LW0djcq/4q1cISKw281CQ5TKxOL0EnOd9YYYErAJpz0=;
 b=AoXslmmLWiIVUN3MtpPTyuHgcmYfNx/G0SuAjV/9Sl7RlIcvyLicdwGo9Nmp9FQ4Ew
 GznnKd9oAcNq5GhlPITPYUgt8FSF6vj8yW8zXzwgTEqGruc4KplHG6QStOmMOTxrxYS3
 oZZP88iwMssh/JQWVC5qskSLo6sEL+DAGA4c9tCI6gpVsrWUbaKc99XZx6FtXkTjnRHh
 YRCW/w43oILZZTOKZrGbZyWXwHcZd88cU93f2TLyGUMYVUN8CFxEhur/heFbklIeU0YA
 ETl7N5JN8iQyvo7xLSdy0hpUhcgCPtCdFv39ZokDfTzHZdNWjeUoBTbcKyLK38VgJ7z/
 oc4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LW0djcq/4q1cISKw281CQ5TKxOL0EnOd9YYYErAJpz0=;
 b=cT8XcNobjYn6BS2ES4asVUifyXFxqygkiqa/W2cCe8jQIHqdj0nfR9TGbieezutqxZ
 oAM8LIEm1HirN94XAYMyIWbg39EhHXF9uvOGpSoton7beUVYv3Osx115yWTxFe3fSPSG
 lrWHGFmbDf3OhVVXtAVsyrtT7QkH7MFrvSxIxJ5XK4BvM8LI2jdnhtq5DoyK506AfKB0
 sm5TACCJ09EUe4fgIFas+Y2uH3BW8YKbLlChVMgoLp1Q8vti8lCQj7/XaTVlERxilu7m
 PF8I2Ea5JMUr/Dvx/h+cCONkl7EvYTJdK4hvLs/TNIKKBMSXtWQbkpn0UhVgGY5idH02
 dO8A==
X-Gm-Message-State: AOAM530g7LwDt6V225Cg2W1i/SIkXR8eVwONpq9Wd570hYY8L36oLDRz
 R8YL8q6ep4fdFwVzllSYYwTpVyz+eJwMkipsELk=
X-Google-Smtp-Source: ABdhPJz998n+oAo5rZ+mVd/x8Gb2ndkr4CQHa7htuRsYseZQPP4Hu0/7GSmwkRHmzztsvWpMpjFAR2S9+FSYKNpgfkw=
X-Received: by 2002:a92:cb4e:: with SMTP id f14mr7165126ilq.209.1596848888617; 
 Fri, 07 Aug 2020 18:08:08 -0700 (PDT)
MIME-Version: 1.0
References: <efd53968d989fa5b909d5b23df58b171410970db.camel@samba.org>
 <20200729190254.GA10865@jeremy-acer>
 <b9b6de10f01ad24305ade2a88f3581acec937f8b.camel@samba.org>
In-Reply-To: <b9b6de10f01ad24305ade2a88f3581acec937f8b.camel@samba.org>
Date: Sat, 8 Aug 2020 11:07:57 +1000
Message-ID: <CAN05THT47V2Dw_BPckNTajXCLXGMpnJepb6Z8rvikejgdy_ydQ@mail.gmail.com>
Subject: Re: Deprecate SMBv1 options and NT4-like domains for Samba 4.13?
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
Cc: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>,
 Jeremy Allison <jra@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Sat, Aug 8, 2020 at 8:43 AM Andrew Bartlett via samba-technical
<samba-technical@lists.samba.org> wrote:
>
> On Wed, 2020-07-29 at 12:02 -0700, Jeremy Allison via samba-technical
> wrote:
> > On Wed, Jul 01, 2020 at 03:19:19PM +1200, Andrew Bartlett via samba-
> > technical wrote:
>
> > > So I present to you this MR:
> > >
> > > https://gitlab.com/samba-team/samba/-/merge_requests/1398
>
> > > Parameter
> > > Name                     Description                Default
> > > --------------                     -----------                -----
> > > -
> > > domain logons                      Deprecated                 no
> > > raw NTLMv2 auth                    Deprecated                 no
> > > client plaintext auth              Deprecated                 no
> > > client NTLMv2 auth                 Deprecated                 yes
> > > client lanman auth                 Deprecated                 no
> > > client use spnego                  Deprecated                 yes
> > >
> > > If I get time I also hope to fold the only-used-by-attackers LMv2
> > > into
> > > "raw NTLMv2 auth", so we can remove both in 4.14.
> >
> > Sorry for the delay, just catching up on old stuff
> > in my inbox :-).
> >
> > That looks good to me ! It's really good to start
> > marking obsolete stuff as, well, obsolete :-).
> >
> > Anyone else got comments ?
>
> Can I get some further consensus here?  I would really like to merge my
> branch once I add the last required test, but I don't want to blindside
> anyone.

Anything getting closer to removing old obsolete cruft gets a +1 from me.

+1
Good work Andrew.


>
> Thanks!
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

