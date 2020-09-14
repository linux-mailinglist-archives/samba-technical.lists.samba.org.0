Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CB0F2691E4
	for <lists+samba-technical@lfdr.de>; Mon, 14 Sep 2020 18:43:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=gb2VH6fkpR1A0qkVXrk8hn+UKWbCA6LxJuKtNpfB5ts=; b=HWRSEoUJUrxC9nNBewsrECCOxG
	YbH8MqmWJoBwgWTEcAkkN0NqAEiXq8ImAcCEOAi/gyfL9Ki+yY8WnS2wUlBxZp83XjzYY2sY6USwL
	zWoiDM1nDK5w2bmtaWe3IqO9plco4EiMAbjIAeuLyRQNabGJmbRATFiT5ALwau45dhiShuXaUkQ/C
	EmB7N4FpuDhX+n8tbnSoa2omnuXk9bZftB8OF+j/M9QfsKCLvH9HJF3tRvyBBORROZaVMz86Ur/+s
	FoFBGVQzh5feHGQGgsLYj1heP635Aa0mVhRrJs52ThVVcjqD1EBXq8gG/p1LIoiZlhAgAXty0NUbk
	+eoVsovw==;
Received: from localhost ([::1]:39700 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kHrYu-005Ojc-Ib; Mon, 14 Sep 2020 16:42:40 +0000
Received: from mail-qv1-xf36.google.com ([2607:f8b0:4864:20::f36]:41249) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kHrYp-005OjV-EH
 for samba-technical@lists.samba.org; Mon, 14 Sep 2020 16:42:38 +0000
Received: by mail-qv1-xf36.google.com with SMTP id ef16so25945qvb.8
 for <samba-technical@lists.samba.org>; Mon, 14 Sep 2020 09:42:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gb2VH6fkpR1A0qkVXrk8hn+UKWbCA6LxJuKtNpfB5ts=;
 b=QLj2dSdq0pQS27F9zFkYs2jMND78+9uwSuNSZX2RkBpjD3rVaMZVjFqnafunuURqL2
 e2LqtfSo276gOMAIybJkt/H5uLNi7XXcCGdCtuzOrJnuLJkvWzK+u1tSwYX3de8Rz2Dc
 90RyBD3NWdAeg0DWVfFwk7GVuqSWko0chlSSpbdua2YySfz0bXQ7rwiGCK2NG9BuxDBB
 04jOzbeQ+NWHS6kiK+ED+ukWEXvks4rukmQZGcbgz7NBuKz1FM2z2G7FyeuO7cVUktSz
 wXJ9AJ5fHLvgtjcxtKRKi5dC5HGfSJyI43myRcOpty0CsKN1FxKGkXPeN2jGmP3iTenp
 5XSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gb2VH6fkpR1A0qkVXrk8hn+UKWbCA6LxJuKtNpfB5ts=;
 b=ngqhH+yt2DnoC5LQ8A9QOH35N8/ja/9FIS/OH0KgTezVDwcRUi756PE6vPayEE6STW
 kZ8dxoTsd4JwKnGh/Aj5rjVX632JumluGJTHW3WIcANL9lPh0r5BKykqFXdWDauvPNCY
 OUy9yfZf31GcwIPQOgnwyVqxSyIofE/7aslwIV9WT/1tUzwANKP7FMy4VmpJlFmYpIqh
 xoLtn/Xt8tKXoLPQSLJ+RnWAuEphxB5b9lInnb3u05tXeDYTBW+UJJPPN46Ml6igXWP6
 H/meluVjNhnlZdRFGlLg9xloRnygJhQjip2Bd5dQcB/FFl9qot9ajbN6dcxXo8rSNT8H
 EgMA==
X-Gm-Message-State: AOAM5324ubqI1UvWbinKKDpbQ5STVOMnDR+LH4ovv2cqHKjyTzO/bikK
 mCVNaUy+5f5YruoQ1zmhzjzHSY5Bkz98vZG1Hqu7xXK7GfY=
X-Google-Smtp-Source: ABdhPJxxfeG7ZVb89rlg9r5Ee3P6tkyGQhC79k9P0ovxXRCyS/9FVlKJcB7GrEILHqPEyvY5wCAlybLokMQKMy2ZNLo=
X-Received: by 2002:a0c:b6d7:: with SMTP id h23mr14003792qve.17.1600101753033; 
 Mon, 14 Sep 2020 09:42:33 -0700 (PDT)
MIME-Version: 1.0
References: <CAC-fF8TWw1_JZaY_i9_n5U7vc96_+8XwfwzGoXZYQoxQAZwNjQ@mail.gmail.com>
 <CAC-fF8R4+mJ1LG1xK2+3hEws7=Pj6TYd-+FgHf6=eXEPn5pwyg@mail.gmail.com>
 <CAC-fF8RRAQbAgNA9R3kwKwt69DJY7fQwGvC3Yhz732Vmo_sh1w@mail.gmail.com>
 <20200911225405.GA1035745@jeremy-acer>
In-Reply-To: <20200911225405.GA1035745@jeremy-acer>
Date: Mon, 14 Sep 2020 18:42:21 +0200
Message-ID: <CAC-fF8QCTqdR3tx-Usj6DRvnFSoVxUH=mFP8GWP_f92ojk59sw@mail.gmail.com>
Subject: Re: winbindd main process hangs on samba-dc
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
From: Isaac Boukris via samba-technical <samba-technical@lists.samba.org>
Reply-To: Isaac Boukris <iboukris@gmail.com>
Cc: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Sat, Sep 12, 2020 at 12:54 AM Jeremy Allison <jra@samba.org> wrote:
>
> On Thu, Sep 10, 2020 at 12:06:22PM +0200, Isaac Boukris via samba-technical wrote:
> > I think there is no point trying to maintain domain->online per domain
> > in the parent process, we should just ask the domain child (fork one
> > if needed), and avoid ever trying to talk with a DC (sync) from the
> > main process.
>
> That certainly seems like the correct fix.
>
> OK, I took a look at your change:
>
> https://gitlab.com/samba-team/devel/samba/-/commit/5ee90438cc2aa26514f60c7d72a3e854adee0148

Turned into wip MR, to make it easier to comment:
https://gitlab.com/samba-team/samba/-/merge_requests/1573

