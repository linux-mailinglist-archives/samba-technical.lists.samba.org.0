Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 37C65EF39E
	for <lists+samba-technical@lfdr.de>; Tue,  5 Nov 2019 03:43:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=tdnRxT9aT9lf6AkRRVQXmB8Z8yVBYYq0bqfxKrm5/cQ=; b=MsMXu32Yh/te+CreBJKz98JkfO
	Tdi8zmflpzKgjaIREMk42M4cL+mXETtxZVOP/XllfXybSDvANW5wdpk8cPD0bVp1a6oXg9jYh65+G
	p72D//N8VDNMslptjU8Fv7UV95wLw1zZbv6XIQI8dpUV0hXmZyCSoRI1NwVKR2Q1zw0VLa58biW+N
	+3WDa6Ve8TnRx6idgqirPOpzoDttRUfdKQU6ft5C6cGwldSTL2Eaw6PiNr9NCh6mLX8GFJ7+EeYAJ
	OttDOrDooPtIfD5RsVpeemXIpSxGqTfsuSaI8a1UHhqGzo7d8spPU5Lp7P5/xt5w+SMKfZPDTXS38
	iTQRCsTA==;
Received: from localhost ([::1]:38298 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iRonn-006ZHF-2W; Tue, 05 Nov 2019 02:42:39 +0000
Received: from mail-qt1-x841.google.com ([2607:f8b0:4864:20::841]:32822) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iRoni-006ZH8-9g
 for samba-technical@lists.samba.org; Tue, 05 Nov 2019 02:42:36 +0000
Received: by mail-qt1-x841.google.com with SMTP id y39so27305378qty.0
 for <samba-technical@lists.samba.org>; Mon, 04 Nov 2019 18:42:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qnap.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=b4Gu9FiIKjAVPZP5pNwPzClyFy9DXzZGecJW/t6qKvs=;
 b=DsaNrPpgBKuL8J3jvlHPL34EouYLiXQsmsCh1faVlG3XatOK15E6KHmTfc44MNqHzx
 l53PK1OtpcsXojFPmcMMoKIpoCUpjAm3dcx8M8EbFxn8Psj2t5iNJVZyUN2EvAlGjyff
 jCybizc/WyXfHr/qUuNew3EqFRJ28Y10l01wk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=b4Gu9FiIKjAVPZP5pNwPzClyFy9DXzZGecJW/t6qKvs=;
 b=fHlHY56WXBK49kPotY7g3ex+dIDZv27wt+fDUasxd165xxnseRcJL0dGQeDFuHWdk7
 DK+wflCwdkaURFp0zvBFxqGRd5Xz/vtThJdfDojE0vho3fv4mD2kGzwz3eUqmehrFkzL
 3hE7g1UT2uWiNwhaZWLO7sRYcSY1mtUwFf7sEwuWSj0eezmM0RP5duD52o4+FLV7z9Qw
 g2+6Jmbs57LezfWWgSsAY99bKQxaDbDiOkSNiV9D0UYt2cli9DuIHZ4f1gvEhURTTfBC
 N9iIgEzwP9wMycYs4UY74jADIAu+YO980dH+wKzBy/PHIKIoCAMr7OWuHZolyCMCsYvp
 8UVQ==
X-Gm-Message-State: APjAAAXhO9MH4ge7Sa4dlFscSTcCyQ7XyTgUC61p+zVwldekc/oZZCzw
 nTfKFfWM3q3Pl7jDcJzFHWQqwuUEVh16IfLA6ZfVsA==
X-Google-Smtp-Source: APXvYqxBwWNmfTbHIs/yA+RFjhw+jDJSifUtZ9EJLtBOLIqxYMJUvk+LRWmB2yoNee30YWujVy63H3hJyYjL6iPwn3A=
X-Received: by 2002:aed:2986:: with SMTP id o6mr15175758qtd.320.1572921752637; 
 Mon, 04 Nov 2019 18:42:32 -0800 (PST)
MIME-Version: 1.0
References: <CAEUGjKjmFJFmz+Wts1UMZaHXKEEpeuY7UmB52H_aiQU=HS11sA@mail.gmail.com>
 <20191104225424.GD116707@jra4>
In-Reply-To: <20191104225424.GD116707@jra4>
Date: Tue, 5 Nov 2019 10:42:14 +0800
Message-ID: <CAEUGjKhhJJa0T=OgfD2ZGDdyPEZ4E_TVRSxXZkWysR30h=c5yQ@mail.gmail.com>
Subject: Re: [PATCH] s3:libads: Fix mem leak in ads_create_machine_acct
To: Jeremy Allison <jra@samba.org>
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
From: Jones Syue via samba-technical <samba-technical@lists.samba.org>
Reply-To: Jones Syue <jonessyue@qnap.com>
Cc: Samba Technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Thank you Jeremy and thank all reviewers!
--
Regards,
Jones Syue | =E8=96=9B=E6=87=B7=E5=AE=97
QNAP Systems, Inc.


On Tue, Nov 5, 2019 at 6:54 AM Jeremy Allison <jra@samba.org> wrote:

> On Fri, Nov 01, 2019 at 03:59:54PM +0800, Jones Syue via samba-technical
> wrote:
> > Hello list,
> >
> > This patch fix memory leak in ads_create_machine_acct,
> > samba-4.10.9 included Bug 13884 and introduce this,
> > please help review and push, thank you.
> >
> > https://bugzilla.samba.org/show_bug.cgi?id=3D13884
>
> Merged as a58c93318d592d931d232a1a25e37abdd27a825d.
>
> Thanks !
>
