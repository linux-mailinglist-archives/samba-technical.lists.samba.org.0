Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id C2085325D7A
	for <lists+samba-technical@lfdr.de>; Fri, 26 Feb 2021 07:24:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=UpdXbp4xVrHxFuPBRsFNXrxm0Jh5B6nTZfp0xYAHVc0=; b=PuE+XBO8uAQ6I30YTJPwEY/gkK
	FnFBGVfbV4N1c+Tz1XVVhtzarjabi5PVLuNO8lZHbDessQR/nQPvjNHrNR0VjH6bydR/rHKt30acP
	Gvki9+BdpwQn513axUvuPulQMXCkAtO3T0uuDME+qlGRnKujDzO/GHAFeA6RcUB42Va40BtRwFDUy
	HKKZZ8KzLYknkmkrvlyh+ALTyuD+LeM4rNCf/BubQ/TxIedRQsP3hTTYCuxW+xAJqVfjj86g8b8pT
	D8fs8S1jq3aVbCDk8UaPHv1NFQQJI/pg/lsYyJOvXyQBsuyPfQjcPSCSL4pKaUp06sryejoyMjnnt
	QSgFnFFw==;
Received: from ip6-localhost ([::1]:18510 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lFWX4-001W4b-D9; Fri, 26 Feb 2021 06:23:22 +0000
Received: from mail-il1-x135.google.com ([2607:f8b0:4864:20::135]:34171) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lFWWv-001W48-Gy
 for samba-technical@lists.samba.org; Fri, 26 Feb 2021 06:23:17 +0000
Received: by mail-il1-x135.google.com with SMTP id q9so7171688ilo.1
 for <samba-technical@lists.samba.org>; Thu, 25 Feb 2021 22:23:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UpdXbp4xVrHxFuPBRsFNXrxm0Jh5B6nTZfp0xYAHVc0=;
 b=GuRJyoyFjOufz2qnlOHJax4LE1PXQnzj3hkQ693b/aZTkjFAB8D7WWpYTDw/dzMtr3
 7vvgyskhalh4gdAGaBnLwY5oXTs/LsFsthx7zR87pfaaLH70Cgrfgtec3gUgNmCohLSS
 3KfP+5syTv7QZhyEw83BEv0rKtXCXP0eIJzvqfaEN4b4Aco9DN2J9CL2GUCCN6IoUf8n
 L6eGAVDjfDHdH3mg6m0lpiMmwLgRO1nAV3Mi88mv6ezNDjgMB0r/edCiMWoVY6dzb8z6
 PdccU49XdAY2qYC1Yl+W9uC2gc6XK8hEPqBD+2SdJw5PP5HCBj4AZsrVWeFB+StX6X28
 os9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UpdXbp4xVrHxFuPBRsFNXrxm0Jh5B6nTZfp0xYAHVc0=;
 b=i9Tdi43tjaTaCEPfSOoQhQ2sEgAwRUQDlw0mHxDbB4zvAGbKJd5AbfwSnn7tOqKyjY
 jr9E+w9+v70APCkwTREEkYlzgz5QCPiZKLZATyW3ig0CnlzQPKZXZT9gxPNjKr5OuOgV
 5MLJ5Scz2BekprWVwT9mV9CKrcVO1gru0k0f9K3xEaMg4qYqJwam86cEx1+U+MT3PLCN
 SmEvl+G0RpP0sN2tNTPoKH/tdxsGEjt10gJO9mkSkArwaceXgBVXzzck7e3pczS9NlKK
 oXRFvBfkbcdRDNzYuCn/pOYBQVsJwqWnk5+MfYGNtK8syg9Lec8TQNt2GNHogYazKp/t
 wEYg==
X-Gm-Message-State: AOAM533yrWbrh4aGj6hPWNNsWvVPvBYUeY8c2d1Yxi14tck7fmbdODK3
 UbJ4XzEc/qiGh1D/i4Wpoo8AcBwkGdEfwanRRvTFsq0I
X-Google-Smtp-Source: ABdhPJwaOscToLpz0wP9OVfU2FLkDNmX7dkB3eBn6h5+vRBakbuYr44Ozs5/AMd+4Ti1lYinLZtNYLobY51M8v8Oy3A=
X-Received: by 2002:a92:c04b:: with SMTP id o11mr1183443ilf.42.1614320587768; 
 Thu, 25 Feb 2021 22:23:07 -0800 (PST)
MIME-Version: 1.0
References: <4ff83f49-9c37-4067-7ce4-c21ac2a34b0a@samba.org>
 <20210226145736.316f50b7@martins.ozlabs.org>
In-Reply-To: <20210226145736.316f50b7@martins.ozlabs.org>
Date: Fri, 26 Feb 2021 17:22:56 +1100
Message-ID: <CAJ+X7mTqfRixnRWn96oZ9VdQ4k7e3v+GzKazUB+0WWiwvuA=Hw@mail.gmail.com>
Subject: Re: Possible bug in ctdb
To: Martin Schwenke <martin@meltin.net>
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
From: Amitay Isaacs via samba-technical <samba-technical@lists.samba.org>
Reply-To: Amitay Isaacs <amitay@gmail.com>
Cc: Samba Technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, Feb 26, 2021 at 2:57 PM Martin Schwenke <martin@meltin.net> wrote:
>
> Hi Ralph,
>
> On Thu, 25 Feb 2021 13:05:52 +0100, Ralph Boehme <slow@samba.org> wrote:
>
> > I noticed the following if condition in check_static_boolean_change()
> > (defined twice):
> >
> >      if (mode == CONF_MODE_RELOAD || CONF_MODE_API)
> >
> > This will always evaluate to true, I guess that is not intended and the
> > fix would be
> >
> >      if (mode == CONF_MODE_RELOAD || mode == CONF_MODE_API)
> >
> > (WIP attached, lacking bugnumber).
>
> Yes, obviously a bug.  My bug.  Fix looks sane.
>
> Note that this code is actually a no-op and it just logs a warning.
> CTDB doesn't currently support reloading the configuration at run
> time... but the config system does. When reloading is implemented it
> will flag that after a config reload we don't look at the new value of
> the variable that points to that config value, so there is no change the
> daemon's behaviour even if that config setting is changed.  There are
> just some things that you can't (or don't want to ;-) change at
> run-time.
>
> For consistency I'd almost like to see that condition coded as:
>
>   if (conf_maybe_updating(mode)) {
>
> although perhaps we should just write it as:
>
>   if (mode != CONF_MODE_LOAD) {
>
> since that catches the other cases consistently.
>
> Let's see what Amitay says.  :-)
>

Let's do mode != CONF_MODE_LOAD...

> > I'm currently debugging a ctdb issue where I wondered whether tdb
> > mutexes are actually enabled (I was seeing "tdb_chain*un*lock() took
> > +-10 ms" many times in the logs).
> >
> > "tdb mutexes" defaults to true, so I wonder whether this bug can cause
> > the default to not become effective, still wrapping my hear around the
> > ctdb config code...
>
> Since it is just a warning, that can't happen.  2 simple
> checks to do.
>
> * Check the logs for the attach:
>
>   2021/01/30 17:40:32.096676 ctdbd[1440545]: Attached to database
>   'yip/node.0/db/volatile/foo.tdb.0' with flags 0x1c41
>
>   That's logged at NOTICE level.
>
>   #define TDB_MUTEX_LOCKING 4096 /** ... */  so that's the leading 1.
>
>   I see this consistently for volatile databases.
>
> * Check the logs for the warning "Ignoring update of ..."
>
>   This is just to see if the warning is triggered.
>
>   I don't see it when I try it out, so I started looking at the conf
>   code to try to figure out why we don't see this logged when the
>   config is initially loaded.
>
>   However, the config is initially loaded before logging is setup
>   (standard chicken/egg situation), so warnings/errors from initial
>   configuration load probably go to stderr?  Perhaps systemd has caught
>   them and put them in the journal?  We should do something about
>   that... not sure what.
>
> How's that?
>
> peace & happiness,
> martin

Amitay.

