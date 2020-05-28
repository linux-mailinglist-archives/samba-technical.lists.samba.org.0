Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DB8E1E5DF5
	for <lists+samba-technical@lfdr.de>; Thu, 28 May 2020 13:10:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=G6gvIRcRHsFCXTc0LCbJL2a/R9v/oIU+d7PR9QX9ogg=; b=W8C+Z98PZ3/iuKy0Wjj8QT4lNM
	qyfriqD5qVp1ThgTTIs2v+pZ+5GSPrLEdJ1CF2eZcj1fjOQ0le+WOD/zLvKHuafnLAwUJuVGkrtIS
	OOLoJQM8GZ47UUMu50vOgG4Y1ZdX7D+acscZTDyLkDzNuVXQMwO2B804E8XsqLXhU9KWl6EJxnPu7
	AKI7jwsL84yuFbQ4VrB0J8j+4TKBiDSklCRI39m3bAFrK3UuoV9OosdgGeQLA7Nu7aoxpWUsIXdLO
	2pWSyo22CI9SN7q/4CbvxT76Jwe91rSqzAIweCigu5kDb9dZCCcgd1V3MD5SyGA0kgFSV5w8T+ZQs
	9BVzu1+Q==;
Received: from localhost ([::1]:55096 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jeGPq-006BOL-OE; Thu, 28 May 2020 11:09:38 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133]:42114) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jeGPl-006BOE-So
 for samba-technical@lists.samba.org; Thu, 28 May 2020 11:09:36 +0000
Received: by mail-lf1-x133.google.com with SMTP id x27so16313793lfg.9
 for <samba-technical@lists.samba.org>; Thu, 28 May 2020 04:09:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=G6gvIRcRHsFCXTc0LCbJL2a/R9v/oIU+d7PR9QX9ogg=;
 b=RFb9tcgAY5PatmZYDGIqwzeNGRvADFVzRpuxEs2taEoM0oEsmBQdZNPUEqAwWyn/BJ
 PvHI5z3n96RQ97ccXNb7pkEOoJ12Jd4TCaHjIToQ++dXJjj55+84x4igfFYs0rzrQpdR
 CH6qiMvKITjRyK2FDWwOsuB7HpCuDvQP8XYQc69gyDx5PKCgP3ELyNpyeaNLVfzYzCJo
 yJUPrv9cQk/hatipH/GdHRTphwWr6QqGnu2w2JOy48RaVxFYvoDVM678/XLGnttiz/4r
 qSWAJzYhMCoDJQpAy/V866rwrEIPkSucUFQZbnpI3S0w1JzBGHTOH0kpLPTfU7veHaPl
 VcUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=G6gvIRcRHsFCXTc0LCbJL2a/R9v/oIU+d7PR9QX9ogg=;
 b=iaYqBOYEwqnJ95QeNkkEBZZ1EgrJh0xnM5462+MoBWTgLqtmC3yRAw0waWZtlm4ACV
 4lSzx5TvzHaL76wAf3P8IKgtYfKFSjrWxuTTnsRUhcTTtVmauUCLiWwr+XbnYPgOUznw
 4fVEeXr9vci7XPykhXWDmEngcH3vx+jYe9lXLzZ/bBn8qtsfMvtbnYa0iBIyQCHVfUfA
 QZuON2zABHc4/lPRiRCunHBdZ0kTTE8zlaSj8ugTPM7/8PxJQs6XBIX6GhgLD9EjK6pg
 0tkK/lTmyMJwvsERdD9bIlvu5bfEZTt6PHyW+uVyvJM3YjHkPe7IqZERfJWTlq9kLSF0
 FWsg==
X-Gm-Message-State: AOAM532ghWpZxT1P4n7UVfAFi2htRPZaBG6TTykqEtNAnImQf5QbTgKA
 +1HOcLGYhrP00Tsu74+/jKSseRzTaJubvhFtLxcRfA==
X-Google-Smtp-Source: ABdhPJwhKazbyKVweDenShemw1SXtLC37K9Tkl6nCJtQYfb6bQLxOWIuU2DAFHOoEy/lot5qG5i4KzWqTmdg728XaD8=
X-Received: by 2002:ac2:504e:: with SMTP id a14mr1450340lfm.30.1590664173009; 
 Thu, 28 May 2020 04:09:33 -0700 (PDT)
MIME-Version: 1.0
References: <CAC-fF8QyT0aYEyDAKMyVdSq8R0NDbsw+5JPFmQ3pS_pa730ybQ@mail.gmail.com>
 <8a7eda93-25fa-7dcb-1501-c3e4870501c4@samba.org>
In-Reply-To: <8a7eda93-25fa-7dcb-1501-c3e4870501c4@samba.org>
Date: Thu, 28 May 2020 13:09:22 +0200
Message-ID: <CAC-fF8Qtp7PvQDaF8EFQS6vBoapAduByAJeSNk10AK+b=Upv_Q@mail.gmail.com>
Subject: Re: Kerberos features talk at sambaxp
To: Stefan Metzmacher <metze@samba.org>
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

On Wed, May 27, 2020 at 9:20 PM Stefan Metzmacher <metze@samba.org> wrote:
>
> I may be able to complete the recording to the end for the archives.

That would be very nice, it would be great to hear more about the last slides.

