Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 28C5651457D
	for <lists+samba-technical@lfdr.de>; Fri, 29 Apr 2022 11:36:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=B0apfNB2XLJsr6WXYd47Xio9pAqkn224OsBvI6eF0Bs=; b=mHeu9r57qbAcdfgslx9HuYipDq
	nIPFdthV4Eqrlj/zB13GiZWYk6QanEsDg9rmJnslL5IwdSpHf5fqmNlLsPAAvQx7ygT/vmMEPlyty
	YgpsCd8faMDZdNDh3Pr2uo9NR6w/qbJjWEOViqjivzH4gGhI0w1VQnaBNWF9VjhjvR4sXNQcxgj1Q
	J/9HvGG7aMmB7zBnyi7dVUGdfe6nvRQVPpN+rW1pg7ENjKSHq0e7URjrhTM/xjprE1VTpAAEgslpj
	2DB7/kb0anQSIzjPNla23GDA1Oskmx6foxR4NWD4lUuN71Qu0dhoHGcEj/KD0MThSEQTqrS9lhqmm
	g74evB1g==;
Received: from ip6-localhost ([::1]:28070 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nkN2a-003KTJ-PU; Fri, 29 Apr 2022 09:35:56 +0000
Received: from mail-vk1-xa30.google.com ([2607:f8b0:4864:20::a30]:36642) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nkN2S-003KTA-6V
 for samba-technical@lists.samba.org; Fri, 29 Apr 2022 09:35:53 +0000
Received: by mail-vk1-xa30.google.com with SMTP id h144so3102767vkh.3
 for <samba-technical@lists.samba.org>; Fri, 29 Apr 2022 02:35:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=B0apfNB2XLJsr6WXYd47Xio9pAqkn224OsBvI6eF0Bs=;
 b=PwyWAvGTw3nGrc/KiJK6zHTCkdH1G/lR0k9nhsBBJPst1DboVCryiPtlA5UngOrs6K
 fLw7HPz4RpHcdzq44uVZNyt9YmMhuRuJf6ueSBCsoRT0HKWCF1RMzPOXq6i+zHQFVvGl
 oSYLKrNVS65ZQnPjLxrx7teHepC934p2DeT+ywHKfD9Xiatr5MOsbgJ/0LohN1E2PtXX
 Uw8jC/9ivt2hDn3UK84m0cqrVKv0ToXwatKpMKFUsFpg93ise+9wCw/+R04NwDlz7ic4
 eGFsoHRpwE40H1PygHJUYsDHCH6f+QqWrlGiOMywh87sEteMxDvVc5YZnvQsBqM7TL3S
 9WSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=B0apfNB2XLJsr6WXYd47Xio9pAqkn224OsBvI6eF0Bs=;
 b=Hm3AKCmLVttexQibUbavr+R59keYVbfeFrLpl5ZeSn2epiYjq6M4TkKCQKDWkzC4tE
 cf2511rnFwL1/UlPocVmUTopVRHW6KrgU9+U1jstuPZ4elLC/ScuTGoT/PMU6ENz+3dN
 h3wVKQifCjCm0N7W7DVZrLdHU0Y78hQK2twkCVdJs6Y4hbXURKXSU5NyGKsptKdrOPUs
 4GkHN0zQsm4blQfuqS6iorBvC5HMzGpmUfV7TZ6zTFSR8S1isvaib2jBLlUWz9qPCbWS
 cw7mngYndbzSrbWXkQATLmP3WHHxe9P6NzhEJ1iKYDT5azOgraz2HJq8amHRVKqnkoGk
 8aIw==
X-Gm-Message-State: AOAM532QlojV1jsRfkHlCW3yH7AA62NV+dvg5jaV2QaGwjFPhyhdbw57
 ovjqpfvr6sxLLC6WW5JlQ9ZFKmPJeMYZENcvJMgalmWV
X-Google-Smtp-Source: ABdhPJwR19Js/LAcpRDwt1Dz/o8X949RQOC2Uj7i0Whp+Z2DWVD8Gfw/sW+4GvTT9G1DWnfSC7phNqeYK3DMbEezPWg=
X-Received: by 2002:a1f:bf44:0:b0:34d:5043:2911 with SMTP id
 p65-20020a1fbf44000000b0034d50432911mr8613570vkf.20.1651224946080; Fri, 29
 Apr 2022 02:35:46 -0700 (PDT)
MIME-Version: 1.0
References: <CAB5c7xrKB52rmAP9qPFxzjtCcBLvGsGiUn_ODz7QwQwrJ15o0A@mail.gmail.com>
 <CAJ+X7mTv5xR0J5e7OxLzhsnbHuB0wuECwL9Zn7pS+gu3LL2mBw@mail.gmail.com>
 <CAB5c7xrbN6UUuSOnOg+AHVeV6-VNQtgvHQ5KFqJKkF=X7LBxZQ@mail.gmail.com>
In-Reply-To: <CAB5c7xrbN6UUuSOnOg+AHVeV6-VNQtgvHQ5KFqJKkF=X7LBxZQ@mail.gmail.com>
Date: Fri, 29 Apr 2022 19:35:34 +1000
Message-ID: <CAJ+X7mQUZKgaAf=ULXJezL1Up19sUK5JnRo4UcgOp1bb1bSdpw@mail.gmail.com>
Subject: Re: ctdb client python bindings
To: Andrew Walker <awalker@ixsystems.com>
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
Cc: samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi Andrew,

On Fri, Apr 29, 2022 at 1:04 AM Andrew Walker <awalker@ixsystems.com> wrote:
> On Thu, Apr 28, 2022 at 4:14 AM Amitay Isaacs <amitay@gmail.com> wrote:
>>
>> I appreciate the efforts to implement python bindings for ctdb client
>> interfaces.  However, I fail to understand the motivation behind this
>> work.  Is there a requirement from some applications to have a python
>> interface to CTDB?  Or do you have some other plans?
>
>
> Well, I was working on this because our own (truenas) has python-based
> middleware and I was wanting to be able to get ctdb status info without
> having to launch subprocesses. I was also planning to write python-based
> collectd plugin to gather stats from ctdb at configurable intervals.

Thanks for describing the motivation for python bindings for CTDB client API.

>> In the past, Martin and I had considered developing python bindings
>> for client interfaces.  The motivation there was to rewrite the ctdb
>> tool in python. However, we never got around to doing that.
>
>
> That's a good idea. I could go that route, which would reduce code
> duplication. Basically keep existing behaviors and arguments for ctdb tool,
> but have it be python tool. Then it will probably not increase maintenance
> load.

Before you commit to the idea of rewriting the ctdb tool in python,
there are few things that need some consideration (Martin might have
more things to add.)

For the last few years, Martin and I have been discussing the
monolithic ctdb daemon into separate daemons based on gross
functionality.  These include database, cluster, failover, event etc.
Unfortunately we have not been able to make much progress on that
front in recent years.  That does not mean we have given up on the
idea, it's still in the works.  Whenever that happens, obviously the
python bindings need to be modified accordingly.  This has
implications on the ctdb tool also.  We would like to group the ctdb
functions as per the gross functionality.  This means restructuring
the ctdb commands in the style of "ctdb event" and subcommands, rather
than top-level commands.  This breakup of ctdb tool functionality is
likely to happen sooner than splitting of the daemon code.  We are
also thinking of transforming the ctdb tool into a ctdb shell with
readline.

I am sure it will be possible to adapt all the features with python
implementation.  One thing I haven't yet figured out is how to run
tevent event loop along with the python main loop.  If we decide to
rewrite the ctdb tool in python, then it's essential to maintain the
async event handling in python. I would like to get rid of the
synchronous api layer completely.  Especially when we have multiple
daemons and their client APIs, this avoids the extra burden of
developing a synchronous API layer just for the client tool.

In the short run, we can definitely add python bindings that are
read-only (e.g. getting status or querying statistics).  It's much
easier to write unit tests for those APIs using fake ctdbd.  For any
APIs that modify the running of the daemon, I would prefer to first
figure out how to handle async (tevent) events in python.

Amitay.

