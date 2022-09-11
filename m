Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id AA8495B4B4A
	for <lists+samba-technical@lfdr.de>; Sun, 11 Sep 2022 04:22:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=kQYWOapRiXsQhTuAkJUrEOHVWhWPC5Wi6foAWinAILE=; b=JXbjrwlQrg5eSOtMEqTpF1yDiF
	xUC9JA+rioP6lzCaW8y454b3Fg6fQ/6SPfGkGc5N1w9draxJb2FvzWIX1Frb9m2BU7iBRuHS/tHtZ
	BYfreS2jV3/ITAr9P5aDTZvfFGbYqd1Td9BIlag4daJMfs2CVEo8ISKvJek8l5WYdPjgxZ3FOnYFA
	XwXKlYkunIrw/2vOk0HIEk1PKt4OWzcouRyoNnpmrhIt1f/lVWskdnONKoILWp6NXx8k5oVRZoowY
	MuyoMhctp9aOSGKoNbvdVAU5LfSBtEqMipShkiwTbsSSW5nhdcjnfyuyYTjez4yl0dhPJn6ICHqBr
	0nGpTP5w==;
Received: from ip6-localhost ([::1]:54500 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1oXCbf-000m6r-J7; Sun, 11 Sep 2022 02:21:59 +0000
Received: from mail-oa1-x34.google.com ([2001:4860:4864:20::34]:44673) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1oXCbZ-000m6i-3y
 for samba-technical@lists.samba.org; Sun, 11 Sep 2022 02:21:55 +0000
Received: by mail-oa1-x34.google.com with SMTP id
 586e51a60fabf-11eab59db71so14358138fac.11
 for <samba-technical@lists.samba.org>; Sat, 10 Sep 2022 19:21:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=kQYWOapRiXsQhTuAkJUrEOHVWhWPC5Wi6foAWinAILE=;
 b=Pg+5nT7ytFERBge9fYAfAhUzlitXigtZd4SxcFtbMFj2Z4km7KX85zl3AbbxBXKCth
 H6mTZRxLcFEJ9T3lubXbBqIvCIi1QI/WKIabLljl6gfhDbz9RiEGMOhGkxoJ13yYRLD4
 wQGt90bD5o4UYEUEjq5UbBY2BD1QKyBO5lNpT9Xd0+Yf03TZSq/+81JWVec1mzVlnmyd
 c7uiaFgh6vzIoUGYjXt2fG+ATb3ft35hEOna1czagvc7G4osJbfTMrmQCq7uooeQFBhJ
 1FR04m02582T+gqR/2TkBZy0xkkAuA97UzqeDPnqOGr92G4aM27UoXFYEtuVsMbhOfY3
 zCiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=kQYWOapRiXsQhTuAkJUrEOHVWhWPC5Wi6foAWinAILE=;
 b=NA0iMs3ju8snQcLO7Xo++M9gfs7rkFpho2R+6mzXzv6XePUHH6fbltBUoQ7p2D5BC7
 6cRp3W+YEwuqZDa/9+HvDiZKID+9uggkP1+cT0/9GqXLuiXYJOVM5LlwEoVMKd29SFoR
 PXeEN6E8uZvjOF3p1CW976+qNJoV0gvfANxrm4k8CrJBhKbhS5et2d5N7ABheCssQo+v
 S+V5xmENpYswp6YBcTZIjBhmFgR1YujHosXsoM5eWvDEx9PNDV+PGnNDaaPipjXVg6dN
 WcVYx/W2FO8ADB+rIIsLOKwFSzqJ2xFridIPx9fbeO8Jax3g/rXhJDxYjVTUWSdTrznI
 aK6g==
X-Gm-Message-State: ACgBeo3cRIowW0JSAOCX+xGdKk7+A6S4EptlhIRixACph8j+HRwwEe9v
 eoD5K7B0IVzr/u2/6U9E2G47Zea+uX4BqG4Do00I11P5Yfo=
X-Google-Smtp-Source: AA6agR5ocv/x2XYT5MDqnRGtWdWhj8+9HBPa6a6FoKqHCd//FU98BYiNViprlcW7w3A0HuaimYiSNV2b5WIsjxmo0L0=
X-Received: by 2002:a05:6870:602a:b0:11d:1683:e9 with SMTP id
 t42-20020a056870602a00b0011d168300e9mr9146144oaa.186.1662862904706; Sat, 10
 Sep 2022 19:21:44 -0700 (PDT)
MIME-Version: 1.0
References: <cc05692a-2a75-a9d8-6f33-88ffb91a9588@msgid.tls.msk.ru>
 <7e33db4d2504d4458ddc67aa5fac47a22592dce5.camel@samba.org>
 <84f22458-d5cc-f74c-9a35-596e22929f59@msgid.tls.msk.ru>
 <4428715.LvFx2qVVIh@magrathea>
 <3c7839ce9907bd9954a4b8dd4f4b427e71c51efe.camel@samba.org>
In-Reply-To: <3c7839ce9907bd9954a4b8dd4f4b427e71c51efe.camel@samba.org>
Date: Sat, 10 Sep 2022 22:21:33 -0400
Message-ID: <CAOCN9ryY0rRtdJDCnQr5yMWbndAJ0E=B6pUDSCAihcKjJ1KLpg@mail.gmail.com>
Subject: Re: ldb ABI versions in 4.17: should it include 2.5.1 & 2.5.2
 versions too?
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
Cc: Andreas Schneider <asn@samba.org>, Michael Tokarev <mjt@tls.msk.ru>,
 samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Sat, Sep 10, 2022 at 4:45 PM Andrew Bartlett via samba-technical
<samba-technical@lists.samba.org> wrote:
>
> On Sat, 2022-09-10 at 14:29 +0200, Andreas Schneider via samba-
> technical wrote:
> > On Saturday, 10 September 2022 12:20:06 CEST Michael Tokarev via samba-
>
> > > So this program which were linked with ldb-2.5.2, will not run after
> > > upgrade. - runtime linker will complain it can't find LDB_2.5.2 version
> > > (and this symbol) in just-upgraded ldb-2.6.1.  So we'll have to
> > > recompile the program just to fix the ldb versioning references.
>
> Urgh.  That is awkward.

It specifically messes with the update to samba 4.16 or samba-4.17 for
RHEL libndr.so, for example, has a conflicting version used by
/usr/lib64/libndr.so.3 versus /usr/lib64/libndr.so.3 for the older
samba-client-libs originally published for RHEL 8 and RHEL 9. I don't
even try to backport to RHEL 7 anymore due to the gnutls dependency
stack.

Now, me? I kick sssd to the curb as fast as I can on RHEL based
setups, for a whole stack of reasons, I'll refrain from explaining
here. But since Red Hat's own documentation on joining domains refers
extensively to sssd, using a more contemporary Samba instead is
expensive in meetings and manpower.

Nico Kadel-Garcia


> The challenge is that, as you know, this came in during a security
> release, where we are normally trying not to bring in other unrelated
> changes (so don't just backport the 'future' changes from master).
> This is why we branched out the version numbers in the first place.
>
> > > Maybe for ldb this is more theoretical, since main its user is samba,
> > > and as far as I can tell, samba should use exactly the same version of
> > > ldb at runtime as it were compiled with.  In debian we do have this
> > > requirement now, - maybe someday it can be lifted, I dunno.  But for
> > > other libraries this might be more interesting.
> >
> > I argued with this many times, but libldb is simply not a stable API and it
> > should have never been released as a public library.
>
> I tend to agree.
>
> If I find some time at least I'm keen to try yet again (as I've had
> some discussions to suggest an emerging consensus) to at least make ldb
> an output of the Samba build (like libwbclient).   That doesn't solve
> the full problem at all, but starts the walk backwards as far as we can
> right now.
>
> > The problem is that as it has been released and others started to use it (e.g.
> > sssd). So whenever you update ldb you always have to recompile all projects
> > depending on it.
>
> I think that matches the actual promises Samba has the resources to
> offer in this area.
>
> > In RHEL we have marked libldb as ACG level 4
> > https://access.redhat.com/articles/rhel8-abi-compatibility
>
> Very wise.
>
> Andrew,
>
> --
> Andrew Bartlett (he/him)        https://samba.org/~abartlet/
> Samba Team Member (since 2001)  https://samba.org
> Samba Developer, Catalyst IT    https://catalyst.net.nz/services/samba
>
>

