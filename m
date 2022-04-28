Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 10DD45137B0
	for <lists+samba-technical@lfdr.de>; Thu, 28 Apr 2022 17:05:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=6ozkVmk4KBW0QRS9v48aqpAU6LmBft2JlKtTC5eCEIg=; b=mNOY70hAgM24/ldJLtoa/JOupB
	uCC95FTtBUAb4twn8cqPY/vqPoK1AmDNswoSwxHJuJxPAfiSuHETazQH5/OV4YYy3qxX2BmfL3RKu
	erM5SK8mo+j6U30mVrmHTFMGjxl0uZxSp2iBsR4jkMpCLvte/tMeMNEqkX/8hlGl0JLUGTjebYyNr
	hh7yQCZDjHJBJoUsuwOOjJZFzmtxjrh9KsXVHFFRjsm6eXoX/P1KmAfuFeauYiN/R/HOsIriz8Onh
	UVKM0DMDnjwi3p4rXxDK+UUOnV5I4Uy7p6w4NJeEm1vxpN8ZNg5kzIFYn69Uy9xXmdZUhr3yCC4rw
	VwrfTQ5A==;
Received: from ip6-localhost ([::1]:52558 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nk5gi-00393H-Hy; Thu, 28 Apr 2022 15:04:12 +0000
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d]:44961) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nk5gc-003937-TE
 for samba-technical@lists.samba.org; Thu, 28 Apr 2022 15:04:09 +0000
Received: by mail-lj1-x22d.google.com with SMTP id 4so7038020ljw.11
 for <samba-technical@lists.samba.org>; Thu, 28 Apr 2022 08:04:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ixsystems.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YvczZAzlpbgCN3EaHvSPgGQVy66EjmhnHM85j9Z5zN0=;
 b=D5OuyO0IPbIHoxOzVu5cLF3b40hK0fasosKmv2I2xA0rjIplXCFUrIIyofYx1NW8Or
 stZowXJl/dHE19LBCDFwpSC+0hwbG+J+kugmAe8CVSvoNfHbWZs1ya/3k3qwJgHgfouE
 84FYiLAKklsFViHp5TVEtXiDqZyEQ4nTo+T2EcA2V5ECXJNK6vwKvExcHTW/QkwFu34m
 KPKjKFz71zTmA8a66tCGBiiQ8FVmke5niR8adEy3uBIPa2yPgor4z3m+7hmBfCHCIruj
 21O36BTEqeNPEgRHIiaCaDi0Z4i3u4e4LodYBDPsrVo659H7y+5Hb5cwPGx/4hqNFfZM
 DIuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YvczZAzlpbgCN3EaHvSPgGQVy66EjmhnHM85j9Z5zN0=;
 b=47CKkDbZZ6oFMqtVbEStDaZ51SK46Xf4IknO38/w+BtaK19IaMzQXpWBi5SmadlWTD
 b8It4GOrAZdpRr2M6q/dXxNjQTfqEYutX5fX3mEC7Rd2Yu91bT49VOoXD3gn9kKkTRwC
 oKo1OHMnpii3vjqrT//y6TyMkkvz3CPgJvhGrk7ZCQG2Q5qaJZSSGXOAEB7AUUWXBfkT
 g0J6bPDkhmpZze6KaRNn7cGYoAO2mHDPt0ijIeiA+z2vaHxjna2m683llyT1b2Du7tQj
 jNivhaz/3MG904YGnV2iDGrIVyXtLOtw4YvcL+Ukj2pQGfjQXxbEjCMo9DqJERm72zJs
 bCaw==
X-Gm-Message-State: AOAM533phDGntE1XIB0jyJ6/reTIy5YkNrtIJF016LqIZXUHH7Ayis21
 8ArFXO8HTN60y0Z/1APyCI7p4JyE7CaQfpoAlaHzMg==
X-Google-Smtp-Source: ABdhPJw4wK2AlbswzkXMP4wYRix3WcIAkMnNTcOfWBaQNIvBZ1qoijTSro3CpP4a57bojySeY1b5oR/f+8nXxRQmr9Q=
X-Received: by 2002:a2e:934f:0:b0:24f:ea1:6232 with SMTP id
 m15-20020a2e934f000000b0024f0ea16232mr15297170ljh.135.1651158245627; Thu, 28
 Apr 2022 08:04:05 -0700 (PDT)
MIME-Version: 1.0
References: <CAB5c7xrKB52rmAP9qPFxzjtCcBLvGsGiUn_ODz7QwQwrJ15o0A@mail.gmail.com>
 <CAJ+X7mTv5xR0J5e7OxLzhsnbHuB0wuECwL9Zn7pS+gu3LL2mBw@mail.gmail.com>
In-Reply-To: <CAJ+X7mTv5xR0J5e7OxLzhsnbHuB0wuECwL9Zn7pS+gu3LL2mBw@mail.gmail.com>
Date: Thu, 28 Apr 2022 11:03:54 -0400
Message-ID: <CAB5c7xrbN6UUuSOnOg+AHVeV6-VNQtgvHQ5KFqJKkF=X7LBxZQ@mail.gmail.com>
Subject: Re: ctdb client python bindings
To: Amitay Isaacs <amitay@gmail.com>
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
From: Andrew Walker via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andrew Walker <awalker@ixsystems.com>
Cc: samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thu, Apr 28, 2022 at 4:14 AM Amitay Isaacs <amitay@gmail.com> wrote:

> I appreciate the efforts to implement python bindings for ctdb client
> interfaces.  However, I fail to understand the motivation behind this
> work.  Is there a requirement from some applications to have a python
> interface to CTDB?  Or do you have some other plans?
>

Well, I was working on this because our own (truenas) has python-based
middleware and I was wanting to be able to get ctdb status info without
having to launch subprocesses. I was also planning to write python-based
collectd plugin to gather stats from ctdb at configurable intervals.


> In the past, Martin and I had considered developing python bindings
> for client interfaces.  The motivation there was to rewrite the ctdb
> tool in python. However, we never got around to doing that.
>

That's a good idea. I could go that route, which would reduce code
duplication. Basically keep existing behaviors and arguments for ctdb tool,
but have it be python tool. Then it will probably not increase maintenance
load.
