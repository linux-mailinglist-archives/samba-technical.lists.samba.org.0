Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D9DEB514A4B
	for <lists+samba-technical@lfdr.de>; Fri, 29 Apr 2022 15:10:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=L1lh/rmTs6pWnhQRLw0qWkCmH6y8DO5zsuf8wwW1rWU=; b=qxvhpVBtDvVchqmrdKBqn9luXr
	Nu66b2h3SAk/l6EoL9VIc94eC1vWXDTBiAp7p42dPSEXtJixpZf/6/8TKT1idWtweqCeL9GBw1/L2
	2ujKKe8h1y0lRcQ/y2nG7Sr6Vqm9cGcULCIW7A7rJHwb0HghJw2LnqaCdXD8OBkTFc9+3ZYgB0JP2
	JvwPB+EqBHAU94LOXP6EWWOLR1VLMceHlxYLHAPcVa78rMSdsxVGZoFEAeACVKWTWj/HPjRzRsqE4
	rv63/xCbaYYDDAPDqkVTboy+GXXP9R8zyf8lLY8WZsilzqpVmjRck3ZoYJPVV5N9JRhIbr2gyVe8x
	xh8lXtPw==;
Received: from ip6-localhost ([::1]:29814 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nkQNT-003LXq-N3; Fri, 29 Apr 2022 13:09:43 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e]:34322) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nkQNL-003LXg-N4
 for samba-technical@lists.samba.org; Fri, 29 Apr 2022 13:09:40 +0000
Received: by mail-lf1-x12e.google.com with SMTP id x33so14001990lfu.1
 for <samba-technical@lists.samba.org>; Fri, 29 Apr 2022 06:09:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ixsystems.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=h8lwTo7eW79RT1pfROoVIglkwrsISHnDlEk8d1iGNwA=;
 b=ScZyyLuWfDHZtLNdCMDrkoYAuGO8nj45kDNlpHsJy1LdV0yGS9swjUEbg/pIk3Brhg
 maySIO/TnBpC4yOBA87l7CJk5zJONgtU7KZm1nwwZYm+EbLi2C/oCcGmOaZR/VGWf0KG
 5PLUiIIyzzJ9SUaY3X+FoQLq4zOtaAuCiVaWz4kI+CTm3qyoOHzbGEG+6xaPlnfwS8fy
 YuBt3coSMwTi4PUtHAU992dQGWVXRvUqipFG+d0R4sef5UuKew43So+SgxXDLk/mXu29
 OhT9b2OowoN9WXQfIqcVkQ9ZM4WAh+GtKZ0QSLEzdRqEFGahxfauKsJobJzD6UiBUpO2
 MAjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=h8lwTo7eW79RT1pfROoVIglkwrsISHnDlEk8d1iGNwA=;
 b=UjomLFQAQJ7Is+Bo+7FhO1cgZmgGlLc9sbr9oDVomqCsqnqlJ9VCvZUpcWqadZw4Ft
 Sh/Bbw3eC3/hSdfs+1C60oBfcpUX7zIi5MaxxdTOQ4+MbWUGjm82j6xwQRqDNjBbuYeB
 htL3FXXeBv0zJpxwOB77+xgsPBnjbasLJd+KzPwmFjDg0KGX2wO1iHOF8Wf7Q1KQIGyp
 IthJFjFyyBT/Tc/P4ERZw/4hk/Ouc8MwHh5+XisWHLNmfQlVF2Y7otCE81uUV5W3Y3pc
 MSlKLALqdMA2Las9ZFnlgEO5nvgEYelT0oTuL4R6klw+cqv2qKcX+MeWJtLg1DRgmB7x
 rClg==
X-Gm-Message-State: AOAM531K1cihqwLGXo6FEEm+LHX14mKfqE+KpCk09Dhzo7hz4Wh7mwYR
 ij5A8v3lqCYvwuL2uv+as8NwUTvrcWOo05e4ajTxZYLoP9E=
X-Google-Smtp-Source: ABdhPJyIjZxLqnueLJlmmTFB7Fr+Dnd3Sxkw595IGiybYbw+Yu/MHTCZUiurwwKA61cuRTk7qhR30SVovaUW+u4yrGQ=
X-Received: by 2002:a05:6512:15a0:b0:472:d09:a6b4 with SMTP id
 bp32-20020a05651215a000b004720d09a6b4mr16260294lfb.656.1651237774187; Fri, 29
 Apr 2022 06:09:34 -0700 (PDT)
MIME-Version: 1.0
References: <CAB5c7xrKB52rmAP9qPFxzjtCcBLvGsGiUn_ODz7QwQwrJ15o0A@mail.gmail.com>
 <CAJ+X7mTv5xR0J5e7OxLzhsnbHuB0wuECwL9Zn7pS+gu3LL2mBw@mail.gmail.com>
 <CAB5c7xrbN6UUuSOnOg+AHVeV6-VNQtgvHQ5KFqJKkF=X7LBxZQ@mail.gmail.com>
 <CAJ+X7mQUZKgaAf=ULXJezL1Up19sUK5JnRo4UcgOp1bb1bSdpw@mail.gmail.com>
In-Reply-To: <CAJ+X7mQUZKgaAf=ULXJezL1Up19sUK5JnRo4UcgOp1bb1bSdpw@mail.gmail.com>
Date: Fri, 29 Apr 2022 09:09:23 -0400
Message-ID: <CAB5c7xryFXvWwkWhfhwROU1yUwnjPgwSHXzgr65z0v=9FDGQMQ@mail.gmail.com>
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

On Fri, Apr 29, 2022 at 5:35 AM Amitay Isaacs <amitay@gmail.com> wrote:

> Hi Andrew,
>
> On Fri, Apr 29, 2022 at 1:04 AM Andrew Walker <awalker@ixsystems.com>
> wrote:
> > On Thu, Apr 28, 2022 at 4:14 AM Amitay Isaacs <amitay@gmail.com> wrote:
> >>
> >> I appreciate the efforts to implement python bindings for ctdb client
> >> interfaces.  However, I fail to understand the motivation behind this
> >> work.  Is there a requirement from some applications to have a python
> >> interface to CTDB?  Or do you have some other plans?
> >
> >
> > Well, I was working on this because our own (truenas) has python-based
> > middleware and I was wanting to be able to get ctdb status info without
> > having to launch subprocesses. I was also planning to write python-based
> > collectd plugin to gather stats from ctdb at configurable intervals.
>
> Thanks for describing the motivation for python bindings for CTDB client
> API.
>
> >> In the past, Martin and I had considered developing python bindings
> >> for client interfaces.  The motivation there was to rewrite the ctdb
> >> tool in python. However, we never got around to doing that.
> >
> >
> > That's a good idea. I could go that route, which would reduce code
> > duplication. Basically keep existing behaviors and arguments for ctdb
> tool,
> > but have it be python tool. Then it will probably not increase
> maintenance
> > load.
>
> Before you commit to the idea of rewriting the ctdb tool in python,
> there are few things that need some consideration (Martin might have
> more things to add.)
>
> For the last few years, Martin and I have been discussing the
> monolithic ctdb daemon into separate daemons based on gross
> functionality.  These include database, cluster, failover, event etc.
> Unfortunately we have not been able to make much progress on that
> front in recent years.  That does not mean we have given up on the
> idea, it's still in the works.  Whenever that happens, obviously the
> python bindings need to be modified accordingly.


Hmm... do you have a general idea of the gross functionality you want to
have separate daemon's for. I was already breaking up functionality into
different classes in the bindings I was writing. E.g.

ctdb.Ctdb - interacting with databases
ctdb.Node - interacting with cluster nodes
ctdb.IP - interacting with public IP addresses

I could eliminate the convention of
```
cl = ctdb.Client() # get client handle
ctdb.Ctdb(cl, ...)
```
and just initialize whatever client structures are needed in the object's
tp_init()
function so that the backend daemon / api can change without having to alter
the python binding significantly.

This has implications on the ctdb tool also.  We would like to group the
> ctdb
> functions as per the gross functionality.  This means restructuring
> the ctdb commands in the style of "ctdb event" and subcommands, rather
> than top-level commands.  This breakup of ctdb tool functionality is
> likely to happen sooner than splitting of the daemon code.  We are
> also thinking of transforming the ctdb tool into a ctdb shell with
> readline.
>

I think these sorts of changes are probably quicker if the tool is written
in
python.


> I am sure it will be possible to adapt all the features with python
> implementation.  One thing I haven't yet figured out is how to run
> tevent event loop along with the python main loop.


I wonder if we need to have separate temporary tevent contexts for each
awaitable that
we return. Basically let python wrap around the loop_once() to iterate
until it completes.
C.F. PEP 492 and tp_as_async.am_await function (granted this is pre-coffee
thought).

If we decide to rewrite the ctdb tool in python, then it's essential to
> maintain the
> async event handling in python. I would like to get rid of the
> synchronous api layer completely.


I could switch to using the async API in the python bindings. Even for
implementing
a non-async module, this probably would result in better exception handling.
