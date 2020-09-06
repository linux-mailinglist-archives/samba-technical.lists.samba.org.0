Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id C0D7C25ECF7
	for <lists+samba-technical@lfdr.de>; Sun,  6 Sep 2020 07:10:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=VG/gMsM4N03EVI+K0CoZMFc9werZQ5UhoefrNIdmyns=; b=jxRAUoNT8y/ylbI77LKlotDDMm
	hOPev1+OeWRzNm8KinQ/H+rjYRxftbvW8X8vI6KvrRPNaVDYDFPVkOX7Losj/M1J/CdJ88QYEf/mY
	5VKWJJ6td7RTMc207PenxoLJkMbckOTBcZfepkLsQk5mnoa7bV5TL6dXQfbsT4XyuT7d2+lundFdz
	IiTzepj+GZdKhJVathF5UvEun7QoPl08IuVETrfk8fZ+gU6wBi7C47OS8bLr/TGGdq5yGCokTaLU0
	SQ9sjpsUqEosJdWHkbuMSHl32nFJMLnCnNeqSjd34EZCL19TTiRwjPDcXfUgocUh9l4W72uri4lu7
	+lduX2VQ==;
Received: from localhost ([::1]:58450 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kEmvg-004INV-MN; Sun, 06 Sep 2020 05:09:28 +0000
Received: from mail-vs1-xe35.google.com ([2607:f8b0:4864:20::e35]:42931) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kEmvT-004INN-GL
 for samba-technical@lists.samba.org; Sun, 06 Sep 2020 05:09:26 +0000
Received: by mail-vs1-xe35.google.com with SMTP id e14so5734860vsa.9
 for <samba-technical@lists.samba.org>; Sat, 05 Sep 2020 22:09:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VG/gMsM4N03EVI+K0CoZMFc9werZQ5UhoefrNIdmyns=;
 b=KRPtHamv2BzeR1Q2G24eZRjCNTYNQT+wvKK7gsApuYsrwOGGZLvibufI7jkE2XqzhV
 lW5DWhLw6W5Og3TUAy0qKCAyEkVwb2c9qCTwoNKXTfc3ma295Uo7ULVYkruw/YpbQIOo
 WYFpPPimezAd59lsB3oc8C/QolvXrz6eNUtwiwGaOpcVEeyponF/JY5C74b6FGf0us/h
 S/TGiVM/XBB5uwBr2quN+yimPWO+Knc9Ou5MC0DB5CDIeSX2ilHhL+ZtctddEXoCt9em
 8SNhUCYT+xIKTFQRx4FlPk0sXaY8MT9p/r7Blhd/ULFDXYDsvI/tDscBgxWSJ2hPSbuW
 orEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VG/gMsM4N03EVI+K0CoZMFc9werZQ5UhoefrNIdmyns=;
 b=fjbVMUfkcQJOsW5henMXvVz6/ChuWX5X8NzU4ts9AkuBtgnG1uUJ7ecte2qv8ABKxd
 iXuDx3xjSc6503NUBaVgHVjPWu04hs5GoaR+fEUTimgb89c/BJSFfxuKQHFpWQLT83j5
 QUgMoEVXSVR1AKDGqzfKMsm2Rsrh9DD129zIm8S/7LAm397OSs5BKVAaAzMX1ETvVdbG
 GrIUmiOMEmjZZCPX2OkNCrppFK7xwiNxknsY7vVA7UR0zDiFGgb8J7Qf+3dq7Af5XF6/
 BCK9DYzg2YgoYT3WNv8c0shxYnt3U5my/k3ii3p9D+uNYHl/Wugj3IXUk02CjMDwntpb
 T8fg==
X-Gm-Message-State: AOAM530h3IGEGa24GpdWRSHFdDnLZGrf/Wcg3Lsv2am1QFVuaordSiVY
 1MC1BWT/yHXQyzfODhc7XLWWWiurd0fLlYvaUZs=
X-Google-Smtp-Source: ABdhPJyx3CydjWYhMxT7pRLQfIpSn5UPO9e+VGXEOOmfumpZbr9TB5Krir0R6+dZEqC22IY7NcSNkoy2hA1wj2b0qQI=
X-Received: by 2002:a67:d02:: with SMTP id 2mr108026vsn.6.1599368945199; Sat,
 05 Sep 2020 22:09:05 -0700 (PDT)
MIME-Version: 1.0
References: <d3abac97b731ed0d37ea4dec28e2792128f527dd.camel@samba.org>
In-Reply-To: <d3abac97b731ed0d37ea4dec28e2792128f527dd.camel@samba.org>
Date: Sun, 6 Sep 2020 01:08:54 -0400
Message-ID: <CAOCN9rwV1JJEH04cuZUK9nBBOw83HaymwU7OYjXLiyahkfL55g@mail.gmail.com>
Subject: Re: Drop Python2 for the build?
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
From: Nico Kadel-Garcia via samba-technical <samba-technical@lists.samba.org>
Reply-To: Nico Kadel-Garcia <nkadel@gmail.com>
Cc: samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, Sep 4, 2020 at 10:23 PM Andrew Bartlett via samba-technical
<samba-technical@lists.samba.org> wrote:
>
> Just wondering when might be the time to drop the python2 build?
>
> This came to mind because David Disseldorp recently had to adjust build
> system changes to cope with python2, so I figured it might be time to
> revisit this.
>
> March 2021 will be 12 months after the long-delayed EOL for Python2 and
> since we made last made big decisions around this area Python3 has
> become available in the default package set for more platforms,
> particularly including CentOS 7.

I yanked python2 support out of my published RPM building tools quite
some time ago. There are some weirdnesses in RHEL 7 and CentOS 7,
because some packages from EPEL are named "python36-[module]" but
don't provide "python3-[module]" unlike the current base OS packages
for CentOS and RHEL, and they're due for an update in EPEL to resolve
the discrepancy. Red Hat's selection to publish the python3 packages
as "python3-" instead of following EPEL's "python36-[module]" naming
convention has been a source of confusion, and it's even worse with
Amazon Linux 2 where the "python3-[module]" packages are python 3.7,
not python 3.6, and the incompatibility with EPEL is a real problem. I
can't currently build my Samba packaging on Amazon Linux 2 without
building up a dependency chain of those spare python3 modules.

The dependency chains and sometimes inconsistent availability of
python modules and dependency chains for them among python2, python3,
and different operating system releases is a serious pain in my
keister and eats cycles I could burn better elsewhere.. "pip install"
is not my friend when contemporary versions of modules are not
compatible with each other, and when two modules have dependencies on
incompatible versions of the same module. Simplifying this by
discarding an obsolete build environment makes eminent sense.

> We currently spend CI resources building and smoke testing Samba with a
> python2, which we could save, as well as the (small) complexity of
> targeting both python versions.

Please, yes.

> The simplest change would change the minimum python to build Samba to
> 3.5, the same as we set the minimum to for fuzzing, or just 3.6 the
> same as we already require otherwise (this would be better tested).

3.6 is the python 3 base for both CentOS 7 and CentOS 8, so I'd be
happy with that.

> As background, the first Samba release with python3 support, 4.10, was
> released in March 2019, so if we did this for 4.14 this would be a two-
> year gap.
>
> What do folks think?
>
> Importantly: beyond Linux, how is python3 platform support better now?
>
> Thanks,

MacOS has working python3 according to my developer friends. Any
operating still based on python3 is so old that it should *not* be
running a contemporary Samba server, only perhaps cifs-utils for
mounting from Windows or Samba servers on a more contemporary and
securable operating system.

