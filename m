Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EB2A5EB67F
	for <lists+samba-technical@lfdr.de>; Tue, 27 Sep 2022 02:54:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=Zs6/Ozi2DlrX9cKPvxR6F224hehQFdvVXrSrCIF8TKE=; b=Op3XHkbGXKz06TL8VALhXYdK6l
	xlWiKFvga3r8dmZ2cVv1jJBdOmL9CYYy7KmN/SyO4fZxqa51CZ3NVBkTIj/ijd/g/263WuCS5SxEh
	ZlcauEqYtlxrR7n+wP41ZM/OXHlLfiIYYyoeLWrcmMVMbXa8L6kZhoeVYjYW+5ElKBqqvupoZ72kD
	uPbqv3ns90olZss7cn3i+BAn7OFfdKyCGvoCHmmkj1qXNQIs/Kya9ZCg6CEVl/jbt7QR9FHrtUkK8
	vOJmzCpVZSxYEB2YmWXGzFGePFY4cDQXzW6d7eLOZOpUnqoGMcCkktpfagI4OPnQaLAmFGY1ngHXS
	ornyq8+w==;
Received: from ip6-localhost ([::1]:61282 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ocyqp-004Jl7-AI; Tue, 27 Sep 2022 00:53:31 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b]:45720) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ocyqk-004Jky-64
 for samba-technical@lists.samba.org; Tue, 27 Sep 2022 00:53:28 +0000
Received: by mail-ed1-x52b.google.com with SMTP id m3so11189261eda.12
 for <samba-technical@lists.samba.org>; Mon, 26 Sep 2022 17:53:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=rJ3GNyuOZIx5XaVqK5XYfMJ6Nlz9GFTODQ8hWPi4vZg=;
 b=gi894hNr01FxePPIZ3Z4C2KrzyT5dFGfFq9qVHFJ6Ys53XRjnrRfoYQGhm0f9mzErx
 KLfaH6MAT/KqUbanh0dbHhx78scjk1yCeaP09TMYevr8TYC9N8awkfJJcW82XJtw4kW0
 c4CKn9sAlF2asDIMIuDYkDqy8hfhF3b9eAQn8QEMriZyUXlRhj+S07yr8Hi59VchojzH
 g995hm7zH3hH/WjGSLLXpG+L96w0lghS2gHRY2qDcJnRWLHLJTFbWodsbjlU4+PGEXG2
 tNtvTc16gaopTw3a9/ey9wdoA+ZNd6gJlmWJOkNDqdEcNQyuKmOMIvd8dWVa5GyFPotE
 3QgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=rJ3GNyuOZIx5XaVqK5XYfMJ6Nlz9GFTODQ8hWPi4vZg=;
 b=xtks5f+LSDY2FKfYYGmE7uTk4EWlKa/7oW4EfAGqX144IdjWD4KyyVYAuT7/6pkY86
 xk/lWI0FkYeGVsKmIzPtNtZOt/qBWDPt2C++uz8nDMDUUQfOiW/2d0lX+SanVrAR3aef
 L/I18JuLTNgJ08rBVPbtUwh8lKjvR6tsnrSQURIDBmMdTZ259H/RVQxDlKxEHuibxNIb
 dDbXWjMr/0oFxgtHDW5Yb+uylOyuAbbO9RVPgYiam2pI+taSmHTVGrE+sXBh+qZO9qNV
 K5M1VHcvg8PxB62AFjvLANzOnVjvyA8cjjH6SxL4XDVNMZ/ZQ20QFTnDCRpqIJXfBNAi
 +Ksg==
X-Gm-Message-State: ACrzQf3L2xjWsuc4JgQw/bEEaEkSnxqToP3lBYQ4+earJbpwa89k4uPZ
 /G9tOKtEgduETdsyDBLym4cI9b1xV7Z1cLHtZEE=
X-Google-Smtp-Source: AMsMyM5mEVaHfOJPl+53rRPnyN0dSiRyEENr7Md680wxwR/LW4Ulkh3aVZVsVFkbSvtphwxTyIxQecHZz/QPYPLSBIQ=
X-Received: by 2002:aa7:c9c4:0:b0:452:1d98:1be3 with SMTP id
 i4-20020aa7c9c4000000b004521d981be3mr25273081edt.289.1664240004831; Mon, 26
 Sep 2022 17:53:24 -0700 (PDT)
MIME-Version: 1.0
References: <YyTdlsd2ExgX8U9r@jeremy-acer> <YyToAYaXsfopiTdh@jeremy-acer>
 <CAPw4iV5LFvdoici7f5opBUA5bz86QG2cX9muzQ8GDsMU3RcW3Q@mail.gmail.com>
 <YyqQ9HtsTM2lmkQF@jeremy-acer> <Yys3/WVPd/gjBbEi@jeremy-acer>
 <CAPw4iV4AH7e4odCQ=xjzG-bAcr=5mGVPFA8qf18WBz8wun_SLQ@mail.gmail.com>
 <Yy4uev/AGxGDAJB4@jeremy-acer>
 <CAPw4iV4xM0FEvPhbY-7S-uSdF9StW1ZeSniA1qoxzdNh9MdNDA@mail.gmail.com>
 <Yy4xsp3cNIp083La@jeremy-acer>
 <CAPw4iV7imoXjC6RdUttRkr5DkXbbMwFyynomQtR3R0uJRJzqXw@mail.gmail.com>
 <YzHX1mIyc2dQLdhz@jeremy-acer>
In-Reply-To: <YzHX1mIyc2dQLdhz@jeremy-acer>
Date: Mon, 26 Sep 2022 20:53:13 -0400
Message-ID: <CAPw4iV6i7gHmVtWZhDTm726g82osDUQkdv0bgt8+2n7o-703FA@mail.gmail.com>
Subject: Re: IPv6 and commit d882add695bbd5ea03961c08ac2c0380fbf2947b
To: Jeremy Allison <jra@samba.org>
Content-Type: text/plain; charset="UTF-8"
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
From: "Nathaniel W. Turner via samba-technical"
 <samba-technical@lists.samba.org>
Reply-To: "Nathaniel W. Turner" <nathanielwyliet@gmail.com>
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Mon, Sep 26, 2022 at 12:48 PM Jeremy Allison <jra@samba.org> wrote:

> On Sat, Sep 24, 2022 at 10:17:07PM -0400, Nathaniel W. Turner wrote:
> >   On Fri, Sep 23, 2022 at 6:22 PM Jeremy Allison <[1]jra@samba.org>
> wrote:
> >
> >     This code:
> >
> >              * We're only returning up to 2 addresses per
> >              * DC name, so just allocate size numdcs x 2.
> >              */
> >
> >             dclist = talloc_zero_array(mem_ctx,
> >                                        struct ip_service_name,
> >                                        numdcs * 2);
> >             if (!dclist) {
> >                     TALLOC_FREE(dcs);
> >
> >     needs an integer wrap tests for numdcs * 2 before
> >     passing it to an allocation function. Something
> >     like:
> >
> >             if (numdcs + numdcs < numdcs) {
> >                     TALLOC_FREE(dcs);
> >                     return NT_STATUS_INVALID_PARAMETER;
> >             }
> >
> >   Oh, good point. Updated.
> >   Does the overall approach seem like an OK compromise for now?
> >   Changing process_dc_dns() to do parallel pings does seem like a natural
> >   next step, but is also much larger in scope. I might be able to work on
> >   that at some point, but my time (and risk tolerance) is pretty limited
> at
> >   the moment.
>
> Err. Can you resend the gitlab URLs. I forgot to save them (sorry).
>

Sure, the proposed change is at
https://gitlab.com/nathanielwyliet/samba/-/merge_requests/1 and I can file
a bug and open a real merge request at
https://gitlab.com/samba-team/samba/-/merge_requests if this seems like a
reasonable path forward.
