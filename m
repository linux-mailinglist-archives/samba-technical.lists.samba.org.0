Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 01F5D78E24D
	for <lists+samba-technical@lfdr.de>; Thu, 31 Aug 2023 00:24:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=BLq31Tpnd5qlW9M9NhfL6hS9AavLYf4X3Zo+mAbpJfc=; b=cxdUC7VYmCeLzVRbPm+SwrBWvd
	Kj6QZZv4fKVQEIcWghKOBjU0TMho6mZz32nXWf5YGiZ4eeRVlfD9laUNGU1sEt6e/zAQldfD5Ov6u
	6E5nhq75J/9H17bndP1w5VuivnOYVsvjHXGJEvdCwwaMWcX+893XCGPgGkm0m0Bar070wWeCIMcRF
	SY+mj6VejQtfpDldYKT4wdbjjTKmGqwcOXWf7Oj9Ak6lxMMmzRgvRFHxIbuNEUlSubimdBSYHYVrU
	MKUaWMta22Rq2VCmDwZFXbagbN8tHU/XnSt3+NlqiDSGzv7anGWptJu35HKzlVsZS1+k8MM95lQJR
	Qrsy2obw==;
Received: from ip6-localhost ([::1]:50940 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1qbTbL-00FeOx-Li; Wed, 30 Aug 2023 22:23:51 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b]:54338) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1qbTbE-00FeOm-BN
 for samba-technical@lists.samba.org; Wed, 30 Aug 2023 22:23:48 +0000
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2bd0a5a5abbso5102641fa.0
 for <samba-technical@lists.samba.org>; Wed, 30 Aug 2023 15:23:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693434222; x=1694039022; darn=lists.samba.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BLq31Tpnd5qlW9M9NhfL6hS9AavLYf4X3Zo+mAbpJfc=;
 b=QCArnHTmyv2/TaVyHW/XuC8gVoLmOxQss06vE5r8TQ8vGyOzzpmNb9w8W2A+uA1Nzq
 RoE9lSZHh16an8x/uFIpTF/vLHfTr5kiU2F4PmnfHSbNCVQ8rfLBkrus4NyyVC+RVoBJ
 uBH/T2y8G8VEHEAaFjYCExeOrqXodDJklrjWR3Nos/qlvpZhvmPMS7zRkXD3TqdLDgP6
 MHXqQnCY3033NyOyt6kd3uLRgqmuuFJw8fDjIY+mhDfxWhMqBEXV4QIS0TKermG57G2h
 F9AshppVW6PovdOlPLyr1gLFdy24JJZHkmL8OqK8zVGye9pIyNIxmlDB/VV/vojk6Cam
 Cm8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693434222; x=1694039022;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BLq31Tpnd5qlW9M9NhfL6hS9AavLYf4X3Zo+mAbpJfc=;
 b=ZgOGfLa7muLuzUuuZR1VboCOl6ZPdsAbqhmz2SxSB6Y9vWSi3DDsFwFNojnfK5WxuK
 4iFKkn7p0Zvjj3n9Oygj/Q1BdSwkr4v4jp+xAC9rJ6Utgh+wFIS0FIOMdU8/CG6AqCjG
 P3+a58Dr4PUMjJ3syKg1wLT79q7UZdLttZ/zw9qhAlUFUxFvHyaCwvxIjRWVIu3gY484
 Q36yAwNxMm953zt3FF44fi9KVC2Sh1jZAwrs991//qqKW9enhtqmV3xA5NSAE9XOTlyD
 kut/kBLOb9SCLbPEWEfL0VMYyCKQZL5K0qJCPXqIOJhVQXGQdZBabGYdpIsZsqswElBL
 zC4A==
X-Gm-Message-State: AOJu0Yx4+EfN92cm+C1bxTccIKAPmnkoPIJpHw42XTJ6ytVdD+2vhxfo
 AhoXr9A4kxAvYedooQCK2oI6mLp5UzCrfBWC75cNj+26mRY=
X-Google-Smtp-Source: AGHT+IF/NqWpM5wmMPpyZ1JHCdYa5ugk/qHdyvVkXo6CS6hQUIopF6q4v3jsyR9dkFdkZb8TPSV7j4BSPyL0bRTDy0c=
X-Received: by 2002:a2e:9795:0:b0:2bc:daa2:7838 with SMTP id
 y21-20020a2e9795000000b002bcdaa27838mr3075234lji.19.1693434221862; Wed, 30
 Aug 2023 15:23:41 -0700 (PDT)
MIME-Version: 1.0
References: <1430d5ec-f2fb-7021-0aa2-2a759a0dbefc@samba.org>
 <CAOCN9rxbcN85rbz4YcP4815-YYLFDAmpsOjxwgspVHtHsjnzsg@mail.gmail.com>
 <44cfcdc452be42ee85a277c6ead6c7e06a59263a.camel@samba.org>
 <0e661725920d0ba58d5302d68354271cd5f929e8.camel@samba.org>
In-Reply-To: <0e661725920d0ba58d5302d68354271cd5f929e8.camel@samba.org>
Date: Wed, 30 Aug 2023 18:23:31 -0400
Message-ID: <CAOCN9rznGkBr8_Q4J4LXfam4RTN=O7y0Vh1hoNQac+m6EvwvJw@mail.gmail.com>
Subject: Re: samba4repo for Amazon linux 2023: Any notes?
To: Andrew Bartlett <abartlet@samba.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
From: Nico Kadel-Garcia via samba-technical <samba-technical@lists.samba.org>
Reply-To: Nico Kadel-Garcia <nkadel@gmail.com>
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Sun, Aug 27, 2023 at 7:06=E2=80=AFPM Andrew Bartlett <abartlet@samba.org=
> wrote:
>
> On Mon, 2023-08-14 at 08:43 +1200, Andrew Bartlett via samba-technical
> wrote:
> > On Sat, 2023-08-12 at 17:59 -0400, Nico Kadel-Garcia via samba-
> > technical wrote:
> > > On Mon, Jul 24, 2023 at 8:29=E2=80=AFAM Jule Anger via samba-technica=
l<
> > > samba-technical@lists.samba.org
> > > > wrote:
> > > > Hi,
> > > > Samba 4.19.0rc1 is scheduled for Friday, July 28 2023.
> > >
> > > I've taken a shot at bringing this over to Amazon Linux 2023,
> > > alongwith my RHEL 8 and 9 tools over at
> > > https://github.com/nkadel/samba4repo/
> > >  . Unfortunately, the bits
> > > of missing dependency get out of hand *really* fast. so I'm going to
> > > have to set it aside until and unless Amazon decides to port a *lot*
> > > more of the Fedora release they branched from. It's not the first
> > > time
> > > I've run into the problem. If anyone else wants to take a shot, I'm
> > > happyto post my notes.
> >
> > I have greatly appreciated your work here, thanks so much for your
> > continuing attention to this packaging effort.
> > Your notes on Amazon Linux 2023 would be very useful.
> > Thanks!
> > Andrew Bartlett
>
> Nico,
>
> Any chance you can post those Amazon Linux 2023 notes?
>
> As you know I did some work in that area in the past.

I've been publishing a branch in my git repo with. It's messy, but
the Makefile shows most of the problem by listing the required
components of the dependency tree which I've encountered so far.

    https://github.com/nkadel/samba4repo/blob/nkadel-amazon2023/Makefile

> Amazon Linux keeps on being just on the outside of Samba's easily-
> supported and CI-tested distribution set and it would be very useful to
> keep track of the details and requirements there.

The recent "mock" enabled support for Amazon Linux  2023, makes simple
build validation *so much easier*. But it's exposed the dependency
quagmire, of components that Amazon has not elected to provide. But
firebird? glusterfs? qt5? I personally do *not* want to take on
importing qt5 to Amazon Linux 2023. And it's not availalbe, at first
glance, for use on Amazon Linux 2023 itself. I've tried to port it,
and it is also missing a lot of dependencies.

